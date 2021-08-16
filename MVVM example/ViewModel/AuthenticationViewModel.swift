//
//  AuthenticationViewModel.swift
//  MVVM example
//
//  Created by Gabriel on 15/08/21.
//

import Foundation

class AuthenticationVM {
    
    var user: User?
    
    var username: String {return user?.userName ?? "" }
    var email: String {return user?.email ?? "" }
    
    typealias authenticationLoginCallBack = (_ status: Bool, _ message: String) -> Void
    var loginCallBack: authenticationLoginCallBack?
    
    func  authenticateUserWith(_ username:String, andPassword password:String) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.2) {
            if username.count != 0  {
                if password.count != 0 {
                    self.verifyUserWith(username, andPassword: password)
                } else {
                    self.loginCallBack?(false, "Password should not be empty")
                }
            } else {
                self.loginCallBack?(false, "Username should not be empty")
            }
        }
        
    }
    
    fileprivate  func verifyUserWith(_ username:String, andPassword password:String) {
        if username == "test" && password == "12345" {
            let user = User(userName: username, email: "\(username)@testmail.com")
            self.loginCallBack?(true, "User is successfully authenticated")
        } else {
            self.loginCallBack?(false, "Please enter valid credentials")
        }
    }
    
    func loginCompletionHandler(callBack: @escaping authenticationLoginCallBack) {
        self.loginCallBack = callBack
    }
    
}

