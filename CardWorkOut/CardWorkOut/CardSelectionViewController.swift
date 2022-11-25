//
//  CardSelectionViewController.swift
//  CardWorkOut
//
//  Created by Mehedi Hasan on 25/11/22.
//

import UIKit

class CardSelectionViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var cardImageView: UIImageView!
    
    var cards: [UIImage] = Card.allValue
    
    var timer : Timer!
    override func viewDidLoad() {
        startTimer()
        super.viewDidLoad()
        for button in buttons {
            button.layer.cornerRadius = 8
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        timer.invalidate()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS")
    }
    
    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func restartButtonTapped(_ sender: UIButton) {
        timer.invalidate()
        startTimer()
    }
    
    @IBAction func rulesButtonTappped(_ sender: UIButton) {
    }
    
    
}
