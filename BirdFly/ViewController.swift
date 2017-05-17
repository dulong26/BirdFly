//
//  ViewController.swift
//  BirdFly
//
//  Created by Vu Thanh Tung on 5/16/17.
//  Copyright © 2017 silverpear. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var bird = UIImageView()
    var audioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    
        drawJungle()
        addBird()
        flyUpAndDown()
        playSong()
    
    }
    
    func drawJungle() {
        let background = UIImageView(image: UIImage(named: "jungle.jpg"))
        background.frame = self.view.bounds
        background.contentMode = .scaleAspectFill
        self.view.addSubview(background)
    }

    func addBird() {
        bird = UIImageView(frame: CGRect(x: 30, y: 30, width: 110, height: 68))
        bird.animationImages = [UIImage(named: "bird0.png")!,
                                UIImage(named: "bird1.png")!,
                                UIImage(named: "bird2.png")!,
                                UIImage(named: "bird3.png")!,
                                UIImage(named: "bird4.png")!,
                                UIImage(named: "bird5.png")!]
        bird.animationRepeatCount = 0
        bird.animationDuration = 1
        bird.startAnimating()
        self.view.addSubview(bird)
    }
    
    func flyUpAndDown() {
        UIView.animate(withDuration: 5, animations: {
            self.bird.center = CGPoint(x: self.view.bounds.size.width - 30, y: self.view.bounds.size.height - 30)
        }) { (finished) in
            self.bird.transform = CGAffineTransform(scaleX: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0.3))
            UIView.animate(withDuration: 3, animations: {
                self.bird.center = CGPoint(x: 30, y: self.view.bounds.size.height - 30)
            }) { (finished) in
                self.bird.transform = CGAffineTransform.identity.concatenating(CGAffineTransform(rotationAngle: -0.6))
                UIView.animate(withDuration: 5, animations: {
                    self.bird.center = CGPoint(x: self.view.bounds.size.width - 30, y: 30)
                }) { (finished) in
                    self.bird.transform = CGAffineTransform(scaleX: -1, y: 1).concatenating(CGAffineTransform(rotationAngle: 0.3))
                    UIView.animate(withDuration: 3, animations: {
                        self.bird.center = CGPoint(x: 30, y: 30)
                    }) { (finished) in
                        self.bird.transform = CGAffineTransform.identity
                        self.flyUpAndDown()
                    }
                }
            }
        }
    }
    
    func playSong() {
        let filePath = Bundle.main.path(forResource: "A+ – Chào Mào Mái Hót", ofType: ".mp3")
        let url = URL(fileURLWithPath: filePath!)
        audioPlayer = try! AVAudioPlayer(contentsOf: url)
        audioPlayer.prepareToPlay()
        audioPlayer.play()
    }
}
