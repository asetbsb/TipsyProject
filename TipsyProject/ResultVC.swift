//
//  ResultVC.swift
//  TipsyProject
//
//  Created by Asset on 10/29/24.
//

import UIKit

class ResultVC: UIViewController {
    
    var result = "0.0"
    var tip = 10
    var split = 2
    
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
    
    private lazy var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Total per person: "
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 26, weight: .light)
        label.textColor = .gray
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var finalBillLabel: UILabel = {
        let label = UILabel()
        label.text = "54.3"
        label.font = .systemFont(ofSize: 36, weight: .light)
        label.textColor = UIColor(rgb: 0xa6a6a6)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 22, weight: .light)
        label.textColor = .gray
        label.numberOfLines = 0
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var recalculateButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(rgb: 0x773ae1)
        button.layer.cornerRadius = 12
        button.setTitle("Recalculate", for: .normal)
        button.addTarget(self, action: #selector(recalculateAction), for: .touchUpInside)
        
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
        setContent()
    }
    
    private func setContent() {
        finalBillLabel.text = result
        bottomLabel.text = "Split between \(split) people, with \(tip)% tip"
    }

    private func addSubviews() {
        view.addSubview(topView)
        view.addSubview(bottomView)
        
        topView.addSubview(topLabel)
        topView.addSubview(finalBillLabel)
        
        bottomView.addSubview(bottomLabel)
        bottomView.addSubview(recalculateButton)
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
            topLabel.topAnchor.constraint(equalTo: topView.topAnchor, constant: 40),
            topLabel.centerXAnchor.constraint(equalTo: topView.centerXAnchor),
            
            finalBillLabel.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 24),
            finalBillLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            bottomLabel.topAnchor.constraint(equalTo: bottomView.topAnchor, constant: 24),
            bottomLabel.centerXAnchor.constraint(equalTo: bottomView.centerXAnchor),
            
            recalculateButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            recalculateButton.bottomAnchor.constraint(equalTo: bottomView.bottomAnchor, constant: -60),
            recalculateButton.widthAnchor.constraint(equalTo: bottomView.widthAnchor, multiplier: 0.6),
            recalculateButton.heightAnchor.constraint(equalTo: bottomView.heightAnchor, multiplier: 0.1)
        ])
    }
    
    @objc private func recalculateAction() {
        dismiss(animated: true)
    }
}
