//
//  ViewController.swift
//  Delegate
//
//  Created by brubru on 24.08.2022.
//

import UIKit

protocol SecondViewControllerDelegate {
    func setSmile(_ smile: String)
}

final class FirstViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet var smileLabel: UILabel!
    
    //MARK: Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SecondViewController else { return }
        secondVC.delegate = self
        secondVC.labelSmile = smileLabel.text ?? ""
    }
    
    //MARK: IBActions
    @IBAction func goBittonPressed() {
        performSegue(withIdentifier: "toSecondScreen", sender: self)
    }
    
}

//MARK: Delegate methods
extension FirstViewController: SecondViewControllerDelegate {
    func setSmile(_ smile: String) {
        smileLabel.text = smile
    }
}
