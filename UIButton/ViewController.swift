//
//  ViewController.swift
//  UIButton
//
//  Created by Steven Lipton on 6/19/21.
//

import UIKit

class ViewController: UIViewController {
    private var stack = UIStackView()
    var b =  0.0
    
    func backgroundColorChange(){
        self.b = (b < 1.0) ? b + 0.1 : 0
        view.backgroundColor = UIColor(hue: 0.25, saturation: b, brightness: 1.0, alpha: 1.0)
    }
    func resetBackgroundColor(){
        b = 0
        view.backgroundColor = UIColor(hue: 0.25, saturation: b, brightness: 1.0, alpha: 1.0)
    }
    
    /// Sets up a vertical stack view for easy layout.
    /// Set using Autolayout so rotation is possible. Add arranged subviews to the property `stack` any views you wish here.
    func vStack(){
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.spacing = 30
        view.addSubview(stack)
        var constraints:[NSLayoutConstraint] = []
        constraints += [NSLayoutConstraint(item: stack, attribute: .top, relatedBy: .equal, toItem: view.safeAreaLayoutGuide, attribute: .top, multiplier: 1.0, constant: 40)]
        constraints += [NSLayoutConstraint(item: view!, attribute: .bottom, relatedBy: .equal, toItem: stack, attribute: .bottom, multiplier: 1.0, constant: 20)]
        constraints += [NSLayoutConstraint(item: stack, attribute: .leading, relatedBy: .equal, toItem: view!, attribute: .leading, multiplier: 1.0, constant: 20)]
        constraints += [NSLayoutConstraint(item: view!, attribute: .trailing, relatedBy: .equal, toItem: stack, attribute: .trailing, multiplier: 1.0, constant: 20)]
        view.addConstraints(constraints)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        vStack()
        let titleLabel = UILabel()
        titleLabel.text = "New UIButton Tricks"
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        stack.addArrangedSubview(titleLabel)
        
        
        let colorAction = UIAction(title:"Change Background Color") { _ in
                    self.backgroundColorChange()
                }
        let resetColorAction = UIAction(title:"Reset Background Color"){_ in
                    self.resetBackgroundColor()
                }

        
        let buttonOld = UIButton(type:.system)
        buttonOld.setTitle("Old-fashioned Button", for: .normal)
        buttonOld.configuration = .gray()
        buttonOld.configuration?.subtitle = "Everything Old is New Again!"
        stack.addArrangedSubview(buttonOld)
        
        var config1 = UIButton.Configuration.tinted()
        config1.title = "My new button"
        config1.subtitle = "It has subtitles!"
        config1.cornerStyle = .capsule

        let button1 = UIButton()
        button1.configuration = config1
        stack.addArrangedSubview(button1)
        
        
        let button2 = UIButton(configuration: config1, primaryAction: colorAction)
        button2.configuration?.image = UIImage(systemName: "paintpalette")
        button2.configuration?.imagePadding = 10
        stack.addArrangedSubview(button2)
        
        
        stack.addArrangedSubview(UIView())  //Works like Spacer() in SwiftUI
        
        let button3 = UIButton(configuration: .filled(), primaryAction: resetColorAction)
        button3.configuration?.baseBackgroundColor = .red
        stack.addArrangedSubview(button3)
        
        
    }


}

