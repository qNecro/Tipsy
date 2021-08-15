//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit



class CalculatorViewController: UIViewController {

    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    var tip = 0.10
    var numberOfPeople = 2
    var billTotal = 0.0
    var resultTwoDecimal = "0.0"

    
    @IBAction func billTextEdit(_ sender: UITextField) {
            }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        
        sender.isSelected = true
        
        let tipTittle = sender.currentTitle!
        let dropLastChar = String(tipTittle.dropLast())
        let buttonTitleAsNumber = Double(dropLastChar)!
        tip = buttonTitleAsNumber / 100
    }
    
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        numberOfPeople = Int(sender.value)
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTextField.text!
        
        if bill != "" {
            billTotal = Double(bill)!
            let result = billTotal * (1 + tip) / Double(numberOfPeople)
            let resultTo2DecimalPlaces = String(format: "%.2f", result)
            resultTwoDecimal = resultTo2DecimalPlaces
        }
        
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            
            destinationVC.result = resultTwoDecimal
            destinationVC.split = numberOfPeople
            destinationVC.tip = Int(tip * 100)
        }
    }


}

