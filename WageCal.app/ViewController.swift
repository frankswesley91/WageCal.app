//
//  ViewController.swift
//  WageCal.app
//
//  Created by Wesley Franks on 2/17/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var EnterName: UITextField!
    @IBOutlet weak var Hours: UITextField!
    @IBOutlet weak var isCertified: UISwitch!
    @IBOutlet weak var ResultMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isCertified.isOn = false
    }
    
    @IBAction func Calculate(_ sender: UIButton) {
        
        var baseRate = 100.00
        let name = EnterName.text!
        //INPUT VALIDATION FOR hours
        guard let hours = Double(Hours.text! ?? "")
        else{
            ResultMsg.text = "Please enter a valid number of hours."
            return
        }
        //INPUT VALIDATION FOR NAME
        if EnterName.text?.isEmpty ?? true {
            ResultMsg.text = "Please enter a valid Name."
            return
        }
            
            
            var salary = 0.00
            var overTime = 0.00
            //----------------IS CERTIFIED OR NOT-------(NEW)
            
            if isCertified.isOn
            {
                baseRate = 120.00
            }
            else
            {
                baseRate = 100.00
            }
            //----------------salary calculator portion------------//
            if hours>40.00
            {
                overTime=(hours-40.00) * (150.00)
                salary = (overTime + (baseRate * 40))
            }
            else
            {
                overTime = 0.00
                salary = (baseRate*hours) + overTime
            }
            //Button only works for hours above 40? button off is bricked for some reason?
            //when button is off and hours is less <= 40 the output it always 4800? why
            //When there is overtime and the button is off, the total includes the overtime hours * 100, for ex:) 41 hours returns 4250 because it does (41*100) + (1*150) how do I get it to not include the 1 hour?
            //------------------------SWITCH-------------//
            //Any numeber hour <= 40 is still 4800? I dont even know why
            
            ResultMsg.text = "Thank you, \(String(name))\n" + "for using the mobile wage calculator!\n" + "Your weekly salary is\n - $\(salary)."
        }
    }
    
    
    
    
    
    
    



