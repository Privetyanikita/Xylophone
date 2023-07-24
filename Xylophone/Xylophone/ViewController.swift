//
//  ViewController.swift
//  Xylophone
//
//  Created by Mykyta Korniuk on 24.07.2023.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player:AVAudioPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        guard let note = sender.titleLabel?.text else {fatalError("No note")}
        
        playSound(note)
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

