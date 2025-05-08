//
//  ViewController.swift
//  BMI-iOS
//
//  Created by Mañanas on 8/5/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var weight = 60
    var height = 170
    
    
    @IBOutlet weak var mySlider: UISlider!
    @IBOutlet weak var myStepper: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func onWeightChange(_ sender: UIStepper) {
        let weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
        
    }
    @IBAction func onHeightChange(_ sender: UISlider) {
        let height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    
    
    @IBAction func calculate(_ sender: Any) {
        // Calcular IMC
        let result = Float(weight) / pow((Float(height) / 100.0), 2)
        resultLabel.text = "\(String(format: "%.2f",  result))"
        
    }
    
}

