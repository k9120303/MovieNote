//
//  PhotoDetailViewController.swift
//  iOSProject
//
//  Created by user_02 on 2017/6/16.
//  Copyright © 2017年 Ｗendy. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photoIndex:Int = 0
    var titlesArray = [String]()
    var contentsArray = [String]()
    var namesArray = [String]()
    var datesArray = [String]()
    
    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var photoContent: UITextView!
    @IBOutlet weak var photoDate: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        if segue.destination is EditPhotoViewController {
            let controller = segue.destination as? EditPhotoViewController
            controller?.photoIndex = self.photoIndex
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        titlesArray.removeAll()
        contentsArray.removeAll()
        namesArray.removeAll()
        datesArray.removeAll()
        
        var fileManager = FileManager.default
        var docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("photoTitles.txt")
        var titles = NSArray(contentsOf: url!)
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoContents.txt")
        var contents = NSArray(contentsOf: url!)
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoDates.txt")
        var dates = NSArray(contentsOf: url!)
        if dates != nil {
            for date in dates! {
                datesArray.append(date as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoNames.txt")
        var names = NSArray(contentsOf: url!)
        if names != nil {
            for name in names! {
                namesArray.append(name as! String)
            }
        }
        
        self.title = titlesArray[photoIndex]
        photoContent.text = contentsArray[photoIndex]
        photoDate.text = datesArray[photoIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photoContent.layer.borderColor =  UIColor(red:0/255.0, green:0/255.0, blue:0/255.0, alpha: 1.0).cgColor
        photoContent.layer.cornerRadius = 10.0;
        
        var fileManager = FileManager.default
        var docUrls = fileManager.urls(for: .documentDirectory, in: .userDomainMask)
        var docUrl = docUrls.first
        
        var url = docUrl?.appendingPathComponent("photoTitles.txt")
        var titles = NSArray(contentsOf: url!)
        if titles != nil {
            for title in titles! {
                titlesArray.append(title as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoContents.txt")
        var contents = NSArray(contentsOf: url!)
        if contents != nil {
            for content in contents! {
                contentsArray.append(content as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoDates.txt")
        var dates = NSArray(contentsOf: url!)
        if dates != nil {
            for date in dates! {
                datesArray.append(date as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent("photoNames.txt")
        var names = NSArray(contentsOf: url!)
        if names != nil {
            for name in names! {
                namesArray.append(name as! String)
            }
        }
        
        url = docUrl?.appendingPathComponent(namesArray[photoIndex])
        photo?.image = UIImage(contentsOfFile: url!.path)
        
        print(photoIndex)
        
        self.title = titlesArray[photoIndex]
        photoContent.text = contentsArray[photoIndex]
        photoDate.text = datesArray[photoIndex]
        
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
