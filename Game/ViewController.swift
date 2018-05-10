//
//  ViewController.swift
//  Game
//
//  Created by Hayden Murdock on 5/10/18.
//  Copyright © 2018 Hayden Murdock. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var activePlayer = 1 //Cross
    
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    let winningCombinations = [[0,1,2], [3,4,5],[6,7,8], [0,3,6], [1,4,7], [2,5,8],[0,4,8], [2,4,6]]
    
    var gameIsActive = true
    
    
    @IBAction func buttonPressed(_ sender: AnyObject)
    {
        if (gameState[sender.tag - 1] == 0 && gameIsActive == true){
            gameState[sender.tag - 1] = activePlayer
            
        if (activePlayer == 1) {
        
            sender.setImage(UIImage(named: "Cross.png"), for:UIControlState())
            activePlayer = 2
        } else {
            sender.setImage(UIImage(named: "Nought.png"), for:UIControlState())
            activePlayer = 1
        }
    }
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    
                    //Cross has won
                    print("cross won")
                    
                } else {
                    
                    //nought has won
                    
                    print("nought has won")
                    
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Test Develop Change
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

