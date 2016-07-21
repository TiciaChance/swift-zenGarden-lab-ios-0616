//
//  ViewController.swift
//  ZenGarden
//
//  Created by Flatiron School on 6/30/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var rake: UIImageView!
    
    @IBOutlet weak var rock: UIImageView!
    
    @IBOutlet weak var shrub: UIImageView!
    
    @IBOutlet weak var rockWithSword: UIImageView!
    
    var rakeX = NSLayoutConstraint()
    var rakeY = NSLayoutConstraint()
    var rockX = NSLayoutConstraint()
    var rockY = NSLayoutConstraint()
    var shrubX = NSLayoutConstraint()
    var shrubY = NSLayoutConstraint()
    var swordX = NSLayoutConstraint()
    var swordY = NSLayoutConstraint()
    var rakeDifference = CGPoint()
    var rockDifference = CGPoint()
    var shrubDifference = CGPoint()
    var swordDifference = CGPoint()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        constraints()
        
        //data type of the action is the selector
        //when the pan gesture happens, the pan gesture recognizer is going to call a method over and over again
        //we need to give it a method to call when it's doing the dragging (THE METHOD IN THIS CASE IS BELOW - draggingImages
        
        // INITIATE PAN GESTURE
        
        let rockDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(handleRockDrag(_:)))
        let rakeDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(draggingRakeImage(_:)))
        let shrubDragRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(draggingShrubImage(_:)))
        let swordDragReconizer = UIPanGestureRecognizer.init(target: self, action: #selector(draggingSwordImage))
        
        
        // ADD GESTURE RECOGNIZER
        // tell the image to recognize gesture recognizer
        
        self.rock.addGestureRecognizer(rockDragRecognizer)
        self.rake.addGestureRecognizer(rakeDragRecognizer)
        self.shrub.addGestureRecognizer(shrubDragRecognizer)
        self.rockWithSword.addGestureRecognizer(swordDragReconizer)
        
        //image interaction is enabled in Storyboard
        
    }
    
    //create and call this method on each image
    func handleRockDrag(sender: UIPanGestureRecognizer)  {
        
        let coordinates = sender.translationInView(self.rock)
        
        if sender
            .state == .Began {
            self.rockDifference = coordinates
        } else {
            
            let diffY = coordinates.y - rockDifference.y
            let diffX = coordinates.x - rockDifference.x
            
            self.rockX.constant += diffX
            self.rockY.constant += diffY
            self.rockDifference = coordinates
            
            //checkWin()
        }
    }
    
    func draggingRakeImage(recognizer: UIPanGestureRecognizer) {
        
        let coordinates = recognizer.translationInView(self.rake)
        
        if recognizer
            .state == .Began {
            self.rakeDifference = coordinates
        } else {
            
            let diffY = coordinates.y - rakeDifference.y
            let diffX = coordinates.x - rakeDifference.x
            
            self.rakeX.constant += diffX
            self.rakeY.constant += diffY
            self.rockDifference = coordinates
            
           // checkWin()
        }

        
        print("Does this work")
        
        
    }
    
    
    func draggingShrubImage(recognizer: UIPanGestureRecognizer)  {
        
        let coordinates = recognizer.translationInView(self.shrub)
        
        if recognizer
            .state == .Began {
            self.shrubDifference = coordinates
        } else {
            
            let diffY = coordinates.y - shrubDifference.y
            let diffX = coordinates.x - shrubDifference.x
            
            self.shrubY.constant += diffY
            self.shrubX.constant += diffX
            self.shrubDifference = coordinates
            
            //checkWin()
        }

        print("stone temple pilots")
        
        
    }
    
    func draggingSwordImage(recognizer: UIPanGestureRecognizer)  {
        print("the cranberries")
        
        
    }
    
    //  When all of these conditions are met, present a UIAlertViewController informing the user that they won. Add a UIAlertAction that dismisses the alert. When the alert is dismissed, scramble the locations of the UIImageViews (i.e. give all of them a random location in the garden).
    
//    func checkWin(){
//        
//        var correctRakeandShrub = false
//        var correctRock = false
//        var correctSword = false
//        var winner = false
//        
//        if self.swordX.constant < -100.0 && self.swordY.constant > 100 || self.swordY.constant < -100{
//            correctSword = true
//        }
//        
//        if  abs(self.shrubDifference.y - self.rakeDifference.y) < 50 && abs(self.shrubDifference.x - self.rakeDifference.x) < 50 {
//            correctRakeandShrub = true
//        }
//        
//        if  abs(swordDifference.y - rockDifference.y) > 400 {
//            correctRock = true
//        }
//        if correctRock && correctRakeandShrub && correctSword  {
//            winner = true
//        }
//        
//        if winner{
//            let alert = UIAlertController(title: "Winner!", message: "CONGRATS", preferredStyle: UIAlertControllerStyle.Alert)
//            alert.addAction(UIAlertAction(title: "Play Again?", style: UIAlertActionStyle.Default, handler: nil))
//            self.presentViewController(alert, animated: true, completion: nil)
//            winner = false
//            
//            constraints()
//        }
//        
//    }
    
    //handle all constraints
    
    func constraints() {
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.removeConstraints(self.rock.constraints)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.removeConstraints(self.rake.constraints)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.removeConstraints(self.shrub.constraints)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.removeConstraints(self.rockWithSword.constraints)
        
        // set constraints
        // i may have to store the x and y center into vars that i'll be able to use for the differences later (??)
        //add rake constraints
        self.rake.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.rake.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        self.rakeX = self.rake.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rakeX.active = true
        
        self.rakeY = self.rake.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rakeY.active = true
        
        //add rock constraints
        self.rock.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.rock.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        
        self.rockX = self.rock.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rockX.active = true
        
        self.rockY = self.rock.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.rockY.active = true
        
        //add shrub constraints
        self.shrub.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.shrub.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        
        self.shrubX = self.shrub.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.shrubX.active = true
        
        self.shrubY = self.shrub.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.shrubY.active = true
        
        //add sword constraints
        self.rockWithSword.heightAnchor.constraintEqualToAnchor(self.view.heightAnchor, multiplier: 0.20).active = true
        self.rockWithSword.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor, multiplier: 0.20).active = true
        
        self.swordX = self.rockWithSword.centerXAnchor.constraintEqualToAnchor(self.view.centerXAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.swordX.active = true
        
        self.swordY = self.rockWithSword.centerYAnchor.constraintEqualToAnchor(self.view.centerYAnchor, constant: CGFloat(arc4random_uniform(200)))
        self.swordY.active = true
        
        
    }
}


//    var rockDragRecognizer = UIPanGestureRecognizer()





//i've created an instance of UIPanGest that has already been init

//        rockDragRecognizer.addTarget(self, action: #selector(handleRockDrag(_:)))

//        self.rock.addGestureRecognizer(self.rockDragRecognizer)