//
//  ViewController.swift
//  Game
//
//  Created by Hayden Murdock on 5/10/18.
//  Copyright © 2018 Hayden Murdock. All rights reserved.
//

import UIKit

import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var PlayersTurnLabel: UILabel!
    
    @IBOutlet weak var resetButtonLabel: UIButton!
    
    var player: AVAudioPlayer?
    
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
            PlayersTurnLabel.text = "Turn: Player 2"
        } else {
            sender.setImage(UIImage(named: "Nought.png"), for:UIControlState())
            activePlayer = 1
            PlayersTurnLabel.text = "Turn: Player 1"
        }
    }
        for combination in winningCombinations {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    
                    //Cross has won
                    print("cross won")
                resetButtonLabel.isHidden = false
                    
                } else {
                    
                    //nought has won
                    
                    print("nought has won")
                    
                resetButtonLabel.isHidden = false
                    
                }
            }
        }
        
    }
    
    
  
    @IBAction func resetButton(_ sender: Any) {
        
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        
        gameIsActive = true
        activePlayer = 1
        resetButtonLabel.isHidden = true
        
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
        }
    }
    
    func playSound() {
        guard let url = Bundle.main.url(forResource: "music", withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
       resetButtonLabel.layer.cornerRadius = 15
        playSound()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

