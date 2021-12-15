//
//  Registration.swift
//  UIContollerExample
//
//  Created by DCS on 15/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class Registration: UIViewController {

    private var emailtxt : UITextField = {
       
        let txt = UITextField()
        txt.placeholder =  "Enter Email"
        txt.textAlignment = .center
        txt.backgroundColor = .lightGray
        return txt
    }()
    private let activity : UIActivityIndicatorView = {
       
        let activity = UIActivityIndicatorView()
        activity.color = .red
        return activity
    }()
    
    private let mylbl : UILabel = {
        let lbl = UILabel()
        lbl.text = "Registration"
        lbl.textColor = .green
        lbl.textAlignment = .center
        return lbl
    }()
    private let myweight : UILabel = {
        let wlbl = UILabel()
        wlbl.text = "Weight"
        wlbl.textColor = .black
        wlbl.textAlignment = .center
        return wlbl
    }()
    private let myslider : UISlider = {
        let slider = UISlider()
        slider.minimumValue=30
        slider.maximumValue=100
        slider.addTarget(self, action: #selector(slidechange), for: .valueChanged)
        return slider
    }()
    
    private let mydob : UILabel = {
        let dlbl = UILabel()
        dlbl.text = "DOB"
        dlbl.textColor = .black
        dlbl.textAlignment = .center
        return dlbl
    }()
    private let mydpicker : UIDatePicker = {
       let date = UIDatePicker()
        date.timeZone = NSTimeZone.local
        date.datePickerMode = UIDatePicker.Mode.date
        return date
    }()
    private let upbtn : UIButton = {
        let btn = UIButton()
        btn.setTitle("Image", for: .normal)
        btn.addTarget(self, action: #selector(Upload), for: .touchUpInside)
        btn.tintColor = .white
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5
        return btn
    }()
    private let mysegment : UISegmentedControl = {
       let segment = UISegmentedControl()
        segment.insertSegment(withTitle: "Mon", at: 0, animated: true)
        segment.insertSegment(withTitle: "Tue", at: 1, animated: true)
        segment.insertSegment(withTitle: "Wed", at: 2, animated: true)
        segment.insertSegment(withTitle: "Thu", at: 3, animated: true)
        segment.insertSegment(withTitle: "Fir", at: 4, animated: true)
        segment.insertSegment(withTitle: "Sat", at: 5, animated: true)
        segment.insertSegment(withTitle: "Sun", at: 6, animated: true)
        segment.selectedSegmentIndex = 0
        segment.tintColor = .green
        return segment
        
    }()
    private let toolbar:UIToolbar = {
        
        let toolbar = UIToolbar()
        
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handelCancel))
        
        let camera = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handelCancel))
        
        let gallery = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handelCancel))
        toolbar.items = [cancel,camera,gallery]
        return toolbar
        
    }()
    
    @objc func handelCancel(){
        print("click ToolBar")
        self.dismiss(animated: true)
        
    }

    
    private let imagepicker : UIImagePickerController = {
        let img = UIImagePickerController()
        img.allowsEditing = true
        return img
        
    }()
    
    private let imageview : UIImageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.image = UIImage(named: "Cross")
        img.clipsToBounds = true
        return img
        
    }()

    
    private let tabbar: UITabBar = {
        let tab = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tab.items = [history,downloads]
        return tab
        
    }()
    
    private let upload: UIButton = {
        let btn = UIButton()
        btn.setTitle("Upload", for: .normal)
        btn.backgroundColor = .lightGray
        btn.addTarget(self, action: #selector(Uploadbtn), for: .touchUpInside)
        btn.layer.cornerRadius = 5
        return btn
        
    }()
       override  func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(emailtxt)
        view.addSubview(mylbl)
        view.addSubview(activity)
        view.addSubview(myweight)
        view.addSubview(myslider)
        view.addSubview(mydob)
        view.addSubview(mydpicker)
        view.addSubview(mysegment)
        view.addSubview(upbtn)
        view.addSubview(imageview)
        view.addSubview(toolbar)
        view.addSubview(tabbar)
        view.addSubview(upload)
        
        imagepicker.delegate = self as! UIImagePickerControllerDelegate & UINavigationControllerDelegate
        // Do any additional setup after loading the view.
    }
    
    override func viewDidLayoutSubviews() {
        
        super.viewDidLayoutSubviews()
        
        toolbar.frame = CGRect(x: 0, y: 10, width: view.width, height: 30)
        mylbl.frame = CGRect(x: 40, y: 40, width: view.width - 120, height: 60)
        emailtxt.frame = CGRect(x: 40, y: mylbl.bottom + 10, width: view.width-80, height: 40)
        myweight.frame = CGRect(x: 40, y: emailtxt.bottom + 30, width: 100, height: 40)
        myslider.frame = CGRect(x: 40, y: myweight.bottom + 5, width: view.width - 80, height: 20)
        mydob.frame = CGRect(x: 40, y: myslider.bottom + 10, width: 100, height: 40)
        mydpicker.frame = CGRect(x: mydob.right + 10, y: myslider.bottom + 10, width: 200, height: 40)
        
        mysegment.frame = CGRect(x: 40, y: mydpicker.bottom + 10, width: view.width - 40, height: 40)
        upbtn.frame = CGRect(x: 40, y: mysegment.bottom + 10, width: 80, height: 40)
        imageview.frame = CGRect(x: upbtn.right + 10, y: mysegment.bottom + 10, width: 150, height: 150)
        upload.frame = CGRect(x: imageview.right + 5, y: mysegment.bottom + 10, width: 80, height: 40)
        activity.frame = CGRect(x: 120, y: imageview.bottom + 30, width: view.width - 200, height: 40)
        tabbar.frame = CGRect(x: 0, y:activity.bottom + 20 , width: view.width, height: 40)
        
        
        
    }
    
    @objc func slidechange(){
        
        print(myslider.value)
    }
    
    
    @objc func Upload(){
        
        imagepicker.sourceType = .photoLibrary
        
        DispatchQueue.main.async {
            
            self.present(self.imagepicker,animated: true)
            
        }
        
    }
}
    extension Registration : UIImagePickerControllerDelegate,UINavigationControllerDelegate {
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            
            if let getImage = info[.originalImage] as? UIImage{
                
                imageview.image = getImage
                
            }
            
            imagepicker.dismiss(animated: true)
            
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            
            imagepicker.dismiss(animated: true)
            
        }
        
        @objc func Uploadbtn(){
            
            activity.startAnimating()
            
        }
        
}
        


