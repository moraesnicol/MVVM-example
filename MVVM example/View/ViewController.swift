//
//  ViewController.swift
//  MVVM example
//
//  Created by Gabriel on 15/08/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var lblMessage: UILabel!
    
    @IBOutlet weak var txtUsername: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    var authenticationVM = AuthenticationVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblMessage.isHidden = true
        
    }

    
    @IBAction func loginUser(_ sender: Any) {
        self.lblMessage.isHidden = true
        guard let userName = self.txtUsername.text else {return}
        guard let password = self.txtPassword.text else {return}
        authenticationVM.authenticateUserWith(userName, andPassword: password)
        authenticationVM.loginCompletionHandler { [weak self] (status, message) in
            guard let self = self else {return}
            if status {
                self.lblMessage.text = "Logged in with username == \(self.authenticationVM.username) and email == \(self.authenticationVM.email)"
                self.lblMessage.isHidden = false
            } else {
                self.lblMessage.text = message
                self.lblMessage.isHidden = false
            }
    }
    
}

}
