//
//  ViewController.swift
//  Roshambo
//
//  Created by Administrator on 6/3/20.
//  Copyright © 2020 Walek. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    // randomly generates a Int from 1 to 3
    func randomValue() -> Int {
        // Generate a random Int32 using arc4Random
        let randomValue = 1 + arc4random() % 3
        
        // Return a more convenient Int, initialized with the random value
        return Int(randomValue)
    }
    
    
    /* 1 = Rock
     * 2 = Paper
     * 3 = Scissor
    */
    @IBAction func rockButtton() {
        let controller = self.storyboard?.instantiateViewController(identifier: "ResultViewController") as! ResultViewController
        
        controller.humanMove = 1 // Rock
        controller.cpuMove = randomValue()
        
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func paperButton() {
        performSegue(withIdentifier: "paperSegue", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "paperSegue" {
            let controller = segue.destination as! ResultViewController
            
            controller.humanMove = 2 // paper
            controller.cpuMove = randomValue()
        } else if segue.identifier == "scissorsSegue" {
            let controller = segue.destination as! ResultViewController
            
            controller.humanMove = 3 // scissors
            controller.cpuMove = randomValue()
        }
    }
}

