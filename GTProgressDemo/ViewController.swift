//
//  ViewController.swift
//  GTProgressDemo
//
//  Created by devadmin on 07/08/2022.
//

import UIKit
import GTProgressBar

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var progressBar: GTProgressBar!
    @IBOutlet weak var progressLabel: UILabel!
    
    // MARK: - Variables
    
    // MARK: - Constant
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // configure gesture
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognizer))
        
        //  if you want to add gesture to complete view
        // self.view.addGestureRecognizer(panGesture)
        
        //  if you want to add gesture to progress view
     //   self.progressBar.addGestureRecognizer(panGesture)
    }
    
    // MARK: - IBActions
    /// Pan gesture action
    /// - Parameter sender: pen gesture
    @objc func panGestureRecognizer(_ sender: UIPanGestureRecognizer) {
        
        // get the direction of the swipe interaction
        let velocity: CGPoint = sender.velocity(in: sender.view?.superview)
        
        // check is the pan gesture state is changed
        // in this we have many more states like begin, end etc to track the user interaction on screen
        if sender.state == .changed {
            
            // Get Current Progress
            var progress = progressBar.progress
            
            // Update progress
            progress = velocity.y > 0 ? (progress - 0.02) : (progress + 0.02)
            
            // check if progress is less then zero or greater then 100
            if progress < 0 {
                progress = 0
            } else if progress >= 1 {
                progress = 1
            }
            
            // Update porogress
            progressLabel.text = "\(Int(progress * 100))"
            progressBar.animateTo(progress: progress)
        }
    }
}
