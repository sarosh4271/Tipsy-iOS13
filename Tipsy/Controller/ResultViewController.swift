//
//  ResultViewController.swift
//  
//  Created by Sarosh Tahir on 06/11/2021.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var totalText:String?
    var tipPercent:String?
    var splitPerPersons:String?
    
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true,completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalText
        settingsLabel.text = "Split between \(splitPerPersons!) people with \(tipPercent!)% tip"
        
    }
    
}
