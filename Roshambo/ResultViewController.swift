//
//  ResultViewController.swift
//  Roshambo
//
//  Created by Administrator on 6/3/20.
//  Copyright © 2020 Walek. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    var cpuMove: Int? // same as below
    var humanMove: Int? // 1 = rock, 2 = paper, 3 = scissor
    
    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var resultText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(self.humanMove ?? "fail", self.cpuMove ?? "fail")
        if let cpuChoice = self.cpuMove, let humanChoice = self.humanMove {
            
            var imageName = ""
            var text = ""
            
            switch humanChoice {
            case 1: // human chose rock
                if cpuChoice == 1 {
                    imageName = "itsATie"
                    text = "Rock versus Rock. It's a tie!"
                } else if cpuChoice == 2 {
                    imageName = "PaperCoversRock"
                    text = "Paper covers Rock. You lose!"
                } else if cpuChoice == 3 {
                    imageName = "RockCrushesScissors"
                    text = "Rock crushes Scissors. You win!"
                }
            case 2: // human chose paper
                if cpuChoice == 1 {
                    imageName = "PaperCoversRock"
                    text = "Paper covers Rock. You win!"
                } else if cpuChoice == 2 {
                    imageName = "itsATie"
                    text = "Paper versus Paper. It's a tie!"
                } else if cpuChoice == 3 {
                    imageName = "ScissorsCutPaper"
                    text = "Scissors cut Paper. You lose!"
                }
            case 3: // human chose scissors
                if cpuChoice == 1 {
                    imageName = "RockCrushesScissors"
                    text = "Rock versus Scissors. You lose!"
                } else if cpuChoice == 2 {
                    imageName = "ScissorsCutPaper"
                    text = "Scissors cut Paper. You win!"
                } else if cpuChoice == 3 {
                    imageName = "itsATie"
                    text = "Scissors versus Scissors. It's a tie!"
                }
            default:
                resultText.text = "Error ocurred."
            }
            
            resultImage.image = UIImage(named: imageName)
            resultText.text = text
        } else {
            resultText.text = "Error occurred."
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @IBAction func playAgain() {
        dismiss(animated: true, completion: nil)
    }
}
