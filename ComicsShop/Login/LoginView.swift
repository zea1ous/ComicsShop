//
//  LoginView.swift
//  ComicsShop
//
//  Created by Alex Kolovatov on 28/07/2019.
//  Copyright © 2019 Alex Kolovatov. All rights reserved.
//

import UIKit

protocol LoginViewDelegate: AnyObject {
    func delegatedForgotPassword()
    func textFieldDidChanged(_ textField: UITextField)
    func loginButtonPressed()
}

final class LoginView: UIView {
    
    weak var delegate: LoginViewDelegate?
    
    // MARK: - Properties
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Вход в учетную\nзапись"
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24, weight: .semibold)
        return label
    }()
    
    private lazy var emailInputView: TextInputView = {
        let emailView = TextInputView()
        emailView.textField.placeholder = "E-mail"
        emailView.textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return emailView
    }()
    
    private lazy var passwordInputView: TextInputView = {
        let passwordView = TextInputView()
        passwordView.textField.placeholder = "Password"
        
        return passwordView
    }()
    
    public lazy var forgotPassowrd: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Забыли пароль?", for: .normal)
        button.tintColor = .black
        button.addTarget(self, action: #selector(handleForgotPassword), for: .touchUpInside)
        return button
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Войти", for: .normal)
        button.tintColor = .white
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .gray
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Life Cycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(titleLabel)
        addSubview(emailInputView)
        addSubview(passwordInputView)
        addSubview(forgotPassowrd)
        addSubview(loginButton)
        snapViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc private func handleForgotPassword() {
        delegate?.delegatedForgotPassword()
    }
    
    @objc private func handleLogin() {
        delegate?.loginButtonPressed()
    }
    
    // MARK: - Layout
    
    private func snapViews() {
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(48)
            make.right.equalToSuperview().offset(-48)
            make.top.equalToSuperview().offset(30)
        }
        
        emailInputView.snp.makeConstraints { (make) in
            make.top.equalTo(titleLabel.snp.bottom).offset(80)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.height.equalTo(50)
        }
        
        passwordInputView.snp.makeConstraints { (make) in
            make.top.equalTo(emailInputView.snp.bottom).offset(12)
            make.left.equalTo(emailInputView)
            make.right.equalTo(emailInputView)
            make.height.equalTo(emailInputView)
        }
        
        forgotPassowrd.snp.makeConstraints { (make) in
            make.top.equalTo(passwordInputView.snp.bottom).offset(8)
            make.right.equalTo(passwordInputView)
            make.height.equalTo(44)
            make.width.equalTo(120)
        }
        
        loginButton.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview().offset(-20)
            make.right.equalToSuperview().offset(-16)
            make.left.equalToSuperview().offset(16)
            make.height.equalTo(50)
        }
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        if textField.text! == "zea1@bk.ru" {
            loginButton.backgroundColor = .black
        } else {
            loginButton.backgroundColor = .gray
        }
        delegate?.textFieldDidChanged(textField)
        
    }
    
}
