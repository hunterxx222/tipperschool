//
//  ViewController.swift
//  tipperschool
//
//  Created by Toan Ngo on 1/11/17.
//  Copyright © 2017 Toan Ngo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadSettings()
    }
    
    // Load settings after view
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // App animation
        self.view.alpha = 0
        UIView.animate(withDuration: 1.0){
            self.view.alpha = 1.0
        }
        
        loadSettings()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadSettings()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        loadSettings()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        loadSettings()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // End editing after tapping

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    // Load settings from Settings View
    
    func loadSettings() {
        let defaults = UserDefaults.standard
        let intValue = defaults.integer(forKey: "default_tip")
        tipControl.selectedSegmentIndex = intValue;
    }

    @IBAction func calculateTip(_ sender: Any) {
        
        let tipPercentage = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let tip = bill * tipPercentage[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func segmentValueChange(_ sender: Any) {
        calculateTip(Any.self)
    }
}

