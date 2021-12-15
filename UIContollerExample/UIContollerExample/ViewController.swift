//
//  ViewController.swift
//  UIContollerExample
//
//  Created by DCS on 15/12/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var mypcontoler : UIPageControl = {
        let pc = UIPageControl()
        pc.numberOfPages = 3
        pc.currentPage = 0
        pc.tintColor = .black
        pc.addTarget(self, action: #selector(NextPage), for: .valueChanged)
        return pc
    }()
    private var txtname : UITextField = {
        let name=UITextField()
        name.placeholder = "Enter Name..."
        name.textAlignment = .center
        name.borderStyle = .roundedRect
        name.backgroundColor = .lightGray
        return name
    }()
    private var txtpass : UITextField = {
        let pass=UITextField()
        pass.placeholder = "Enter Password..."
        pass.textAlignment = .center
        pass.borderStyle = .roundedRect
        pass.backgroundColor = .lightGray
        return pass
    }()
    private let loginbtn : UIButton =
    {
       let btn = UIButton()
        btn.setTitle("Login", for: .normal)
        btn.addTarget(self, action: #selector(login), for: .touchUpInside)
        btn.tintColor = .white
        btn.backgroundColor = .red
        btn.layer.cornerRadius = 5
        return btn
    }()
    private let mylbl : UILabel = {
       let lbl = UILabel()
        lbl.text = "Don't have an account?"
        lbl.textColor = .white
        lbl.textAlignment = .center
        return lbl
    }()
    private let myswitch : UISwitch = {
      let s = UISwitch()
        s.isOn = false
        s.onTintColor = .blue
        return s
    }()
    private let mylblrem : UILabel = {
        let remlbl = UILabel()
        remlbl.text = "Remember me"
        remlbl.textColor = .white
        remlbl.textAlignment = .center
        return remlbl
    }()
    private let regbtn : UIButton =
    {
        let regbtn = UIButton()
        regbtn.setTitle("Registration", for: .normal)
        regbtn.addTarget(self, action: #selector(registration), for: .touchUpInside)
        regbtn.tintColor = .white
        regbtn.backgroundColor = .red
        regbtn.layer.cornerRadius = 5
        return regbtn
    }()
    private let progress : UIProgressView = {
       let p = UIProgressView()
        p.setProgress(0.0, animated: true)
        p.progressTintColor = .green
        return p
    }()
    @objc func NextPage()
    {
       login()
    }
    @objc func login()
    {
        print("Login")
    }
    @objc func registration()
    {
        let s1 = Registration()
        self.dismiss(animated: true)
        navigationController?.pushViewController(s1, animated: true)
        present(s1,animated: true,completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(patternImage: UIImage(named:"bgrecipi")!)
        view.addSubview(txtname)
        view.addSubview(txtpass)
        view.addSubview(loginbtn)
        view.addSubview(mylbl)
        view.addSubview(regbtn)
        view.addSubview(mypcontoler)
        view.addSubview(myswitch)
        view.addSubview(mylblrem)
        view.addSubview(progress)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIView.animate(withDuration: 10.0)
        {
            self.progress.setProgress(1.0, animated: true)
        }
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        txtname.frame = CGRect(x: 40, y: 225, width: view.width - 80, height: 40)
        txtpass.frame = CGRect(x: 40, y: 275, width: view.width - 80, height: 40)
        myswitch.frame = CGRect(x: 60, y: txtpass.bottom + 10, width: 50, height: 40)
        mylblrem.frame = CGRect(x: myswitch.right + 10, y: txtpass.bottom + 10, width: view.width - 250, height: 40)
        loginbtn.frame = CGRect(x: 60, y: myswitch.bottom + 10, width: view.width - 120, height: 40)
        
        mylbl.frame = CGRect(x: 60, y: loginbtn.bottom + 10, width: view.width - 120, height: 40)
        regbtn.frame = CGRect(x: 60, y: mylbl.bottom + 10, width: view.width - 120, height: 40)
        mypcontoler.frame = CGRect(x: 100, y: regbtn.bottom + 10, width: view.width - 200, height: 40)
        progress.frame = CGRect(x: 60, y: mypcontoler.bottom + 10, width: view.width - 120, height: 40)
        
    }
}

