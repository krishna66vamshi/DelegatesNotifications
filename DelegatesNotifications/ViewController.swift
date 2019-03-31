//
//  ViewController.swift
//  DelegatesNotifications
//
//  Created by vamsi on 31/03/19.
//  Copyright © 2019 vamshi krishna. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    let myLabel:UILabel = {
         let label = UILabel(frame: CGRect(x: 10, y: 140, width: 300, height: 40))
        label.text = "Lazy"
        label.backgroundColor = .yellow
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        view.addSubview(myLabel)

        NotificationCenter.default.addObserver(self, selector: #selector(handle(notification:)), name: name, object: nil)



    }
    
    @objc func handle(notification:NSNotification){
        print(notification)
        print(notification.userInfo as Any)
        if let name = notification.userInfo as? [String:String]{
            self.label.text = name["text",default:"default"]
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if  segue.identifier == "99"{
            let svc = segue.destination as! SecondViewController
            svc.delegate = self
            svc.callBack = { [weak self] name in
                guard self != nil else{return}
//                self.label.text = name
                
            }

        }
        
    }
    

}


extension ViewController:SecondVCDelegate{
    func sendName(name: String) {
        
//        self.label.text = name
        
    }
    
    
}
