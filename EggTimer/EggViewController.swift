//
//  EggViewController.swift
//  EggTimer
//
//  Created by Lambda_School_Loaner_219 on 9/8/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class EggViewController: UIViewController {
    let softTime = 5
    let mediumTime = 10
    let hardTime = 15
    var timer = Timer()
    
    @IBOutlet weak var preferenceLabel: UILabel!
    
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet var eggButtons: [UIButton]!
    
    
    
    @IBAction func EggSelector(_ sender: UIButton) {
        timer.invalidate() // invalidate the current timer running, if button is clicked again
        preferenceLabel.text = "Cooking..."

        let hardness = sender.currentTitle
        guard hardness != nil else {return}
        var time:Int? {
            didSet {
                if time != nil {
                    timeLabel.isHidden = false
                    var stringTime = String(time!)
                    timeLabel.text = stringTime
                }
            }
        }
        
        
        switch hardness {
        case "Soft":
            time = softTime
        
        case "Medium":
            time = mediumTime
            
        case "Hard":
            time = hardTime
            
        default:
            print("Buttons title was not covered in switch case")
            
            
        }                   //Timer invalidates itself since repeat=true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { (timer) in
            guard time != nil else {return}
            if time! > 0 {
                time! -= 1
            print(time!)
                
            
                
            }
            else {
                timer.invalidate()
                self.preferenceLabel.text = "Done!"
            }
            
            }
    
            
         
            
        }

        
      

        
        
      
    

    


    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeLabel.isHidden = true

        // Do any additional setup after loading the view.
    }
    

 

}

