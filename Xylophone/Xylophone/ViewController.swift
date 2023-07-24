//
//  ViewController.swift
//  Xylophone
//
//  Created by Admin on 24.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func cKeyPressed(_ sender: UIButton) {
        playSound("C")
    }
    
    @IBAction func dKeyPrassed(_ sender: UIButton) {
        playSound("D")
    }
    
    @IBAction func eKeyPressed(_ sender: UIButton) {
        playSound("E")
    }
    
    @IBAction func fKeyPressed(_ sender: UIButton) {
        playSound("F")
    }
    
    @IBAction func gKeyPressed(_ sender: UIButton) {
        playSound("G")
    }
    
    @IBAction func aKeyPressed(_ sender: UIButton) {
        playSound("A")
    
    }
    
    @IBAction func bKeyPressed(_ sender: UIButton) {
        playSound("B")
    
    }
    
    func playSound(_ note: String) {
        guard let url = Bundle.main.url(forResource: note, withExtension: "wav") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.wav.rawValue)
            
            guard let player = player else { return }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }

    
}

