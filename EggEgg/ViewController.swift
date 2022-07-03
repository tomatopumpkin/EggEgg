//
//  ViewController.swift
//  EggEgg
//
//  Created by บงบง บรุ๋งๆ🌼 on 3/7/2565 BE.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let eggTime = ["Soft" : 3 , "Medium" : 4 , "Hard" : 7]
    
    @IBOutlet weak var progress: UIProgressView!
    
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    var play = AVAudioPlayer()

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        progress.progress = 0
    }

    @IBAction func hardness(_ sender: UIButton) {
        timer.invalidate()
        
           if let Egghardness = sender.currentTitle{
               titleLabel.text = Egghardness
               totalTime = eggTime[Egghardness]!
                }
       
//        print(sender.currentTitle!)
        
// หน่วงเวลา Timer
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateUI), userInfo: nil, repeats: true)
    }
    
    func playSound(with soundName:String){
        let path = Bundle.main.path(forResource: soundName, ofType: "mp3")!
        let url = URL(fileURLWithPath: path)
        do {
            play = try AVAudioPlayer(contentsOf: url)
            play.play()
        } catch let error {
            print(error)
        }
    }
    
// Objective o
    @objc func updateUI(){
        
        if secondsPassed < totalTime{
            secondsPassed += 1
            progress.progress = Float(secondsPassed) / Float(totalTime)
            
        } else {
            timer.invalidate() //หยุดเวลาอีกตัว
            titleLabel.text = "SuccessFully!!"
            playSound(with: "alarm_sound")
        }
    }
}

