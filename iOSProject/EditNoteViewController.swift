//
//  EditNoteViewController.swift
//  iOSProject
//
//  Created by user_02 on 2017/6/15.
//  Copyright © 2017年 Ｗendy. All rights reserved.
//

import UIKit

class EditNoteViewController: UIViewController {

    var noteIndex:Int = 0
    var titlesArray = [String]()
    var contentsArray = [String]()
    
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var noteContent: UITextView!
    
    @IBAction func done(_ sender: Any) {
        print("pressed done!!")
        print(noteTitle.text)
        print(noteContent.text)
        
        if noteContent.text?.characters.count == 0 {
            let alertController = UIAlertController(
                title: "提醒",
                message: "內容不可空白",
                preferredStyle: .alert
            )
            let okAction = UIAlertAction(
                title: "確認",
                style: .default,
                handler: {
                    (action: UIAlertAction!) -> Void in
                    print("按下確認")
            })
            alertController.addAction(okAction)
            self.present(
                alertController,
                animated: true,
                completion: nil
            )
            return
        }
        else if noteTitle.text?.characters.count == 0 {
            noteTitle.text = noteContent.text.components(separatedBy: "\n") [0]
        }
        print("after if else")
        print(noteTitle.text)
        print(noteContent.text)
        
        titlesArray[noteIndex] = noteTitle.text!
        contentsArray[noteIndex] = noteContent.text
        
        var fileManager = FileManager.default
        var docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("noteTitles.txt")
        var titles = NSArray(contentsOf: url!)
        (titlesArray as NSArray).write(to: url!, atomically: true)
        
        url = docUrl?.appendingPathComponent("noteContents.txt")
        var contents = NSArray(contentsOf: url!)
        (contentsArray as NSArray).write(to: url!, atomically: true)
        
        /*read file to check*/
        url = docUrl?.appendingPathComponent("noteTitles.txt")
        titles = NSArray(contentsOf: url!)
        for title in titles! {
            print("\(title)")
        }
        
        url = docUrl?.appendingPathComponent("noteContents.txt")
        contents = NSArray(contentsOf: url!)
        for content in contents! {
            print("\(content)")
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        noteContent.layer.borderColor =  UIColor(red:222/255.0, green:225/255.0, blue:227/255.0, alpha: 1.0).cgColor        
        
        var fileManager = FileManager.default
        var docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("noteTitles.txt")
        var titles = NSArray(contentsOf: url!)
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("noteContents.txt")
        var contents = NSArray(contentsOf: url!)
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        
        print(noteIndex)
        
        noteTitle.text = titlesArray[noteIndex]
        noteContent.text = contentsArray[noteIndex]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
