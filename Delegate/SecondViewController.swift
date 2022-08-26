//
//  SecondViewController.swift
//  Delegate
//
//  Created by brubru on 24.08.2022.
//

import UIKit

class SecondViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var textField: UITextField!
    @IBOutlet var smileLabel: UILabel!
    
    //MARK: Public properties
    var labelSmile = ""
    
    var delegate: SecondViewControllerDelegate!
    
    //MARK: LifeCycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        textField.text = labelSmile
        smileLabel.text = labelSmile
    }
    
    //MARK: Overriden methods
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        textField.endEditing(true)
    }
    
    //MARK: IBActions
    @IBAction func goBackButtonPressed() {
        delegate.setSmile(smileLabel.text ?? "")
        dismiss(animated: true)
    }
    
}

//MARK: Delegate methods
extension SecondViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("Done")
        smileLabel.text = textField.text
    }
}

