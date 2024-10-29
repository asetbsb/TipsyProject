//
//  ViewController.swift
//  TipsyProject
//
//  Created by Asset on 10/29/24.
//

import UIKit

final class RootVC: UIViewController {
    
    private var tip = 0.10
    private var numberOfPeople = 2
    private var billTotal = 0.0
    private var finalResult = "0.0"
    
    //MARK: -UIViews
    
    private lazy var topView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(rgb: 0xbedf83)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    //MARK: -TopElements
    
    private lazy var billLabel: UILabel = {
        let label = UILabel()
        label.text = "Enter bill total"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = UIColor(rgb: 0xa6a6a6)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var billField: UITextField = {
        let field = UITextField()
        field.placeholder = "e.g. 123"
        field.textAlignment = .center
        field.font = .systemFont(ofSize: 32, weight: .light)
        field.borderStyle = .roundedRect
        field.layer.cornerRadius = 12
        field.keyboardType = .decimalPad
        field.contentMode = .scaleToFill
        field.contentHorizontalAlignment = .left
        field.contentVerticalAlignment = .center
        
        field.translatesAutoresizingMaskIntoConstraints = false
        return field
    }()
    
    //MARK: -BottomElements

    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = "Select tip"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = UIColor(rgb: 0xa6a6a6)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tipStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 24
        stackView.alignment = .center
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var zeroPctButton: UIButton = {
        let button = UIButton()
        button.setTitle("0%", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tipPressed(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var tenPctButton: UIButton = {
        let button = UIButton()
        button.setTitle("10%", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tipPressed(_:)), for: .touchUpInside)

        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var twentyPctButton: UIButton = {
        let button = UIButton()
        button.setTitle("20%", for: .normal)
        button.layer.cornerRadius = 8
        button.addTarget(self, action: #selector(tipPressed(_:)), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var splitLabel: UILabel = {
        let label = UILabel()
        label.text = "Select split"
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = UIColor(rgb: 0xa6a6a6)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var splitNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 20, weight: .light)
        label.textColor = UIColor(rgb: 0x773ae1)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var splitStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 20
        stepper.addTarget(self, action: #selector(showSplitNumber), for: .valueChanged)
        
        stepper.translatesAutoresizingMaskIntoConstraints = false
        return stepper
    }()
    
    private lazy var calculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x773ae1)
        button.layer.cornerRadius = 12
        button.setTitle("Calculate", for: .normal)
        button.addTarget(self, action: #selector(calculateAction), for: .touchUpInside)
        
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        addSubviews()
        setViewConstraints()
        setElementConstraints()
    }

    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(bottomView)
        
        topView.addSubview(billLabel)
        topView.addSubview(billField)
        
        bottomView.addSubview(tipLabel)
        bottomView.addSubview(tipStackview)
        
        tipStackview.addArrangedSubview(zeroPctButton)
        tipStackview.addArrangedSubview(tenPctButton)
        tipStackview.addArrangedSubview(twentyPctButton)
        
        bottomView.addSubview(splitLabel)
        bottomView.addSubview(splitNumberLabel)
        bottomView.addSubview(splitStepper)
        bottomView.addSubview(calculateButton)
    }
    
    private func setViewConstraints() {
        NSLayoutConstraint.activate([
            topView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            topView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            topView.heightAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.heightAnchor,
                multiplier: 0.25
            ),
            
            bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor),
            bottomView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            bottomView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            bottomView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func setElementConstraints() {
        NSLayoutConstraint.activate([
            billLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 24),
            billLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            billField.topAnchor.constraint(equalTo: billLabel.bottomAnchor, constant: 24),
            billField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            billField.widthAnchor.constraint(equalTo: topView.widthAnchor, multiplier: 0.6),
            
            tipLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 24),
            tipLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            tipStackview.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.2),
            tipStackview.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 30),
            tipStackview.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -30),
            tipStackview.topAnchor.constraint(equalTo: tipLabel.bottomAnchor, constant: 10),
            
            splitLabel.topAnchor.constraint(equalTo: tipStackview.bottomAnchor, constant: 10),
            splitLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            splitNumberLabel.topAnchor.constraint(equalTo: splitLabel.bottomAnchor, constant: 32),
            splitNumberLabel.leadingAnchor.constraint(equalTo: bottomView.leadingAnchor, constant: 74),
            
            splitStepper.topAnchor.constraint(equalTo: splitLabel.bottomAnchor, constant: 32),
            splitStepper.trailingAnchor.constraint(equalTo: bottomView.trailingAnchor, constant: -74),
            
            calculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            calculateButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -60),
            calculateButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.6),
            calculateButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.1)
        ])
    }
    
    @objc private func tipPressed(_ sender: UIButton) {
        billField.endEditing(true)
        sender.backgroundColor = UIColor(rgb: 0x773ae1)
        
        if sender == zeroPctButton {
            tenPctButton.backgroundColor = .clear
            twentyPctButton.backgroundColor = .clear
            tip = 0.0
        }
        else if sender == tenPctButton {
            zeroPctButton.backgroundColor = .clear
            twentyPctButton.backgroundColor = .clear
            tip = 0.1
        }
        else {
            zeroPctButton.backgroundColor = .clear
            tenPctButton.backgroundColor = .clear
            tip = 0.2
        }
        
    }
    
    @objc private func showSplitNumber(_ sender: UIStepper) {
        splitNumberLabel.text = String(Int(sender.value))
        numberOfPeople = Int(sender.value)
    }
    
    @objc private func calculateAction() {
        let resultVC = ResultVC()
        
        let bill = billField.text!
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            finalResult = String(format: "%.2f", result)
        }
        
        resultVC.result = finalResult
        resultVC.tip = Int(tip * 100)
        resultVC.split = numberOfPeople
        
        present(resultVC, animated: true)
    }
}


