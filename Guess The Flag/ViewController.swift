//
//  ViewController.swift
//  Guess The Flag
//
//  Created by Jorge Giannotta on 29/03/2019.
//  Copyright © 2019 Jorge Giannotta. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var button1: UIButton!
    
    @IBOutlet weak var button2: UIButton!
    
    @IBOutlet weak var button3: UIButton!
    
    @IBOutlet weak var progressBar: UIView!
    
    var countries = [String]()
    
    var score = 0
    
    var correctAnswer = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland",
                      "italy", "monaco", "nigeria", "poland", "russia", "spain",
                      "uk", "us", "canada", "japan", "brazil", "israel", "australia", "south africa", "sweden", "united arab emirates", "thailand", "uruguay", "singapore", "mexico", "france", "denmark", "cyprus", "costa rica", "cuba", "china", "colombia", "argentina", "vatican", "yemen", "vietnam", "turkey", "tunisia", "san marino", "qatar", "saudi arabia", "south korea", "peru", "panama", "pakistan", "norway", "north korea", "new zealand", "malta", "morocco", "kenya", "iran", "iraq", "india", "ghana", "finland", "fiji", "dominican republic", "ecuador", "belgium", "camerun"]
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        askQuestion(action: nil)
    }
    
    func askQuestion(action: UIAlertAction!) {
        countries = GKRandomSource.sharedRandom().arrayByShufflingObjects(in:countries) as! [String]
        correctAnswer = GKRandomSource.sharedRandom().nextInt(upperBound: 3)
        title = countries[correctAnswer].uppercased()
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        var title: String
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score).", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(ac, animated: true)
        
        scoreLabel.text = "Score: \(score)"
        
    }
    
    func updateUI() {
        
        scoreLabel.text = "Score: \(score)"
        
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(score + 1)
    }
}

