//
//  LoginViewController.swift
//  ComicsShop
//
//  Created by Alex Kolovatov on 27/07/2019.
//  Copyright © 2019 Alex Kolovatov. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    // MARK: - Properties
    
    private var emailString = ""
    
    private lazy var containerView: LoginView = {
        let container = LoginView()
        container.backgroundColor = .white
        container.layer.cornerRadius = 10
        container.delegate = self
//        container.forgotPassowrd.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
//        container.translatesAutoresizingMaskIntoConstraints = false
        return container
    }()

    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(displayP3Red: 0/255, green: 61/255, blue: 61/255, alpha: 1)
        setupViews()
    }
    
    // MARK: - Actions
    
    @objc private func handleForgotPassword() {
        print("button pressed")
    }
    
    // MARK: - Layout
    
    private func setupViews() {
        view.addSubview(containerView)
        
        containerView.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(32)
            make.right.equalToSuperview().offset(-32)
            make.top.equalToSuperview().offset(96)
            make.bottom.equalToSuperview().offset(-140)
        }
        
        /*
        let topConst = NSLayoutConstraint(item: containerView, attribute: .top, relatedBy: .equal, toItem: view, attribute: .top, multiplier: 1, constant: 96)
        let bottomConst = NSLayoutConstraint(item: containerView, attribute: .bottom, relatedBy: .equal, toItem: view, attribute: .bottom, multiplier: 1, constant: -140)
        let leftConst = NSLayoutConstraint(item: containerView, attribute: .left, relatedBy: .equal, toItem: view, attribute: .left, multiplier: 1, constant: 32)
        let rightConst = NSLayoutConstraint(item: containerView, attribute: .right, relatedBy: .equal, toItem: view, attribute: .right, multiplier: 1, constant: -32)
        NSLayoutConstraint.activate([topConst, bottomConst, leftConst, rightConst])
        */
    }

}

// MARK: - ForgotPasswordDelegate
extension LoginViewController: LoginViewDelegate {
    func textFieldDidChanged(_ textField: UITextField) {
        emailString = textField.text!
        print(textField.text!)
    }
    
    func loginButtonPressed() {
        if emailString == "zea1@bk.ru" {
            print("LOGGED IN")
        }
    }
    
    func delegatedForgotPassword() {
        let forgotPassowrdViewController = UIViewController()
        forgotPassowrdViewController.view.backgroundColor = .blue
        let button = UIButton(frame: CGRect(x: 100, y: 100, width: 50, height: 50))
        button.backgroundColor = .yellow
        forgotPassowrdViewController.view.addSubview(button)
        present(forgotPassowrdViewController, animated: true, completion: nil)
    }
}
