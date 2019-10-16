//
//  ViewController.swift
//  keyboard-handling
//
//  Created by David Rifkin on 10/16/19.
//  Copyright © 2019 David Rifkin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var typedText = "" {
        didSet {
            myInput.text = typedText
        }
    }
    
    lazy var myInput: UILabel = {
        let label = UILabel()
        label.backgroundColor = .yellow
        return label
    }()

    lazy var myTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .yellow
        textField.delegate = self
        return textField
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpSubviews()
        setUpConstraints()
    }
    
    private func setUpSubviews() {
        self.view.addSubview(myTextField)
        self.view.addSubview(myInput)
    }
    
    private func setUpConstraints() {
        setUpTextFieldConstraints()
        setUpInputLabelConstraints()
    }
    
    private func setUpTextFieldConstraints() {
        myTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myTextField.heightAnchor.constraint(equalToConstant: 200),
            myTextField.widthAnchor.constraint(equalToConstant: 200),
            myTextField.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor,constant: 200),
            myTextField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }
    
    private func setUpInputLabelConstraints() {
        myInput.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myInput.bottomAnchor.constraint(equalTo: self.view.layoutMarginsGuide.bottomAnchor,constant: 100),
            myInput.topAnchor.constraint(equalTo: myTextField.bottomAnchor, constant: 100),
            myInput.centerXAnchor.constraint(equalTo: myTextField.centerXAnchor),
            myInput.widthAnchor.constraint(greaterThanOrEqualToConstant: 200)
        ])
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        guard let text = textField.text else {return true}
        typedText = text
        textField.resignFirstResponder()
        return true
    }
}
