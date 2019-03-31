//
//  SecondViewController.swift
//  DelegatesNotifications
//
//  Created by vamsi on 31/03/19.
//  Copyright © 2019 vamshi krishna. All rights reserved.
//

import UIKit
protocol SecondVCDelegate:class {
    func sendName(name:String)
}

let name = NSNotification.Name(rawValue: "99")

class SecondViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    
    weak var delegate:SecondVCDelegate!
    
    var callBack:((String) -> ())!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func pop(_ sender: Any) {
        delegate.sendName(name: textField.text!)
        callBack(textField.text!)
        let info = ["text":textField.text!]
        NotificationCenter.default.post(name: name, object: nil, userInfo: info)
        navigationController?.popViewController(animated: true)
    }
   

}
