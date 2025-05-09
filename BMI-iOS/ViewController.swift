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
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onWeightChange(_ sender: UIStepper) {
        weight = Int(sender.value)
        weightLabel.text = "\(weight) kg"
        
    }
    @IBAction func onHeightChange(_ sender: UISlider) {
        height = Int(sender.value)
        heightLabel.text = "\(height) cm"
    }
    
    
    
    @IBAction func calculate(_ sender: Any) {
        // Calcular IMC
        let result = Float(weight) / pow((Float(height) / 100.0), 2)
        resultLabel.text = String(format: "%.2f",  result)
        
        var color = UIColor.black
        var description = ""
        var showAlert = false
        switch (result) {
        case 0.0..<18.5:
            //"Bajo peso"
            color = UIColor(named: "bmi_underweight")!
            description = "Bajo peso"
            
        case 18.5..<25:
            color = UIColor(named: "bmi_normal")!
            description = "Peso normal"
            
        case 25..<30:
            color = UIColor(named: "bmi_overweight")!
            description = "Sobrepeso"
            
        case 30.0..<35:
            color = UIColor(named: "bmi_obesity1")!
            description = "Obesidad (Grado 1)"
            
        case 35.0..<40:
            color = UIColor(named: "bmi_obesity2")!
            description = "Obesidad (Grado 2)"
            
        default:
            color = UIColor(named: "bmi_obesity3")!
            description = "Obesidad Mórbida"
            showAlert = true
        }
        descriptionLabel.text = description
        resultLabel.textColor = color
        descriptionLabel.textColor = color
        
        if (showAlert) {
            let alert = UIAlertController(
                title: "Riesgo de salud",
                message: "Tu peso actual pone en grave riesgo tu vida. Busca ayuda médica cuanto antes.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "Mas información", style: .default, handler: { action in
                // He pulsado mas información
                let adviceSiteUrl = "https://medlineplus.gov/spanish/ency/patientinstructions/000348.htm"
                if let url = URL(string: adviceSiteUrl), UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open (url)
                }
            }))
            alert.addAction(UIAlertAction(title: "Cerrar", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
