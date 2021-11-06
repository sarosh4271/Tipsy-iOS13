//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var splitNumberLabel: UILabel!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    
    var percentage:Float = 0.1
    var stepperValue:Int = 1
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        switch sender.currentTitle {
        case "0%":
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
            print("0% tapped")
            percentage = 0
            billTextField.endEditing(true)
        case "10%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = true
            twentyPctButton.isSelected = false
            print("10% tapped")
            percentage = 0.1
            billTextField.endEditing(true)
        case "20%":
            zeroPctButton.isSelected = false
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = true
            print("20% tapped")
            percentage = 0.2
            billTextField.endEditing(true)
        default:
            print("default tapped")
        }
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = Int(sender.value)
        splitNumberLabel.text = String(Int(stepperValue))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        self.performSegue(withIdentifier: "goToCalculate", sender: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        tenPctButton.isSelected = true
    }
    
    func calculateTip() -> Float {
        let bill = billTextField.text ?? "0"
        let tipTotal = ((Float((Float(bill) ?? Float("0"))!) * percentage)+Float((Float(bill) ?? Float("0"))!))  /  Float(stepperValue)
        return tipTotal
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToCalculate" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.tipPercent = String(format: "%.0f", percentage*100)
            destinationVC.totalText = String(format: "%.2f", calculateTip())
            destinationVC.splitPerPersons = String(stepperValue)
            
        }
    }

}

