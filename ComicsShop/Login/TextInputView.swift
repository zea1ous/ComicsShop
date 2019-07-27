//
//  TextInputView.swift
//  ComicsShop
//
//  Created by Alex Kolovatov on 28/07/2019.
//  Copyright © 2019 Alex Kolovatov. All rights reserved.
//

import UIKit

final class TextInputView: UIView {
    
    private lazy var separator: UIView = {
        let separator = UIView()
        separator.backgroundColor = .lightGray
        return separator
    }()
    
    public lazy var textField: UITextField = {
        let textField = UITextField()
        return textField
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(separator)
        addSubview(textField)
        snapViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func snapViews() {
        separator.snp.makeConstraints { (make) in
            make.bottom.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(0.5)
        }
        
        textField.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(12)
            make.left.equalToSuperview().offset(16)
            make.right.equalToSuperview().offset(-16)
            make.bottom.equalToSuperview().offset(-12)
        }
    }
}
