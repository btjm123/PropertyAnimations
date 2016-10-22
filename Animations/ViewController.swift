//
//  ViewController.swift
//  Animations
//
//  Created by roycetanjiashing on 22/10/16.
//  Copyright © 2016 examplecompany. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animator:UIViewPropertyAnimator!
    var timer:Timer!
    
    @IBOutlet var orangeView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        animator = UIViewPropertyAnimator(duration: 2, curve: .easeInOut, animations: {
            self.orangeView.center.x = self.view.frame.width
            self.orangeView.transform = CGAffineTransform.init(rotationAngle: CGFloat(M_PI)).scaledBy(x: 0.001, y: 0.001)
        })
        
        timer = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(ViewController.adjustAnimation), userInfo: nil, repeats: true)
        animator.startAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func sliderMoved(_ sender: AnyObject) {
        //animator.fractionComplete = CGFloat((sender as! UISlider).value)
    }
    
    func adjustAnimation () {
        if animator.fractionComplete == 1 {
            animator.isReversed = true
        }
    }

}

