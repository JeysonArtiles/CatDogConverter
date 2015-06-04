//
//  ViewController.swift
//  DogYears
//
//  Created by Jeyson Artiles on 6/4/15.
//  Copyright (c) 2015 Jeyson Artiles. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var calculatorTitle: UILabel!
    @IBOutlet weak var displayAge: UILabel!
    @IBOutlet weak var amlYearsOld: UILabel!
    @IBOutlet weak var enterAgeTextField: UITextField!
    
    var animalValue = 0
    var animalType = ""
    var animalYearsValue = 0.0
    var humanYearsValue = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if animalValue == 0 {
            animalType = "CAT"
        } else {
            animalType = "DOG"
        }
        calculatorTitle.text = "CONVERT \(animalType) YEARS INTO HUMAN YEARS"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func catDogSelect(sender: UISegmentedControl) {
        animalValue = sender.selectedSegmentIndex.0
        
        if animalValue == 0 {
            animalType = "CAT"
        } else {
            animalType = "DOG"
        }
        
        calculatorTitle.text = "CONVERT \(animalType) YEARS INTO HUMAN YEARS"
        
        displayAge.hidden = true
        amlYearsOld.hidden = true
    }
    
    @IBAction func calculateAge(sender: UIButton) {
        
        humanYearsValue = Double((enterAgeTextField.text as NSString).doubleValue)
        let dogYearsFormula = Double((humanYearsValue - 2) * 4 + (2 * 10.5))
        let catYearsFormula = Double((humanYearsValue - 2) * 4 + ((1 * 15.0) + (1 * 10.0)))
        
        if animalValue == 0 {
            animalYearsValue = catYearsFormula
        } else {
            animalYearsValue = dogYearsFormula
        }
        
        displayAge.hidden = false
        amlYearsOld.hidden = false
        let roundHumanYearsValue = String(format: "%.f", humanYearsValue)
        let roundAnimalYearsValue = String(format: "%.f", animalYearsValue)
        calculatorTitle.text = "\(animalType) YEARS ARE EQUAL TO:"
        displayAge.text = "\(roundAnimalYearsValue)"
        amlYearsOld.text = "HUMAN YEARS"
        
    }
}

