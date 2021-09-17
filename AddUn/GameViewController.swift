//
//  GameViewController.swift
//  AddUn
//
//  Created by Colin Morrison on 17/09/2021.
//

import UIKit
//import SpriteKit
//import GameplayKit

class GameViewController: UIViewController {
    
    //Four components on the main screen are hooked up to this class, via IBOutlets. The user input field, and three labels
    @IBOutlet weak var userInputField : UITextField?
    @IBOutlet weak var numLabel : UILabel?
    @IBOutlet weak var scoreLabel : UILabel?
    @IBOutlet weak var timerLabel : UILabel?
    

    
    //Initialize the values that feed the variables
    var userInputText = ""; //String
    var score = 0; //Int
    var timer:Timer? //Timer object
    var timerSeconds = 60 //Initial value for the number of seconds
    //None for num, since this doesn't need used
    
    
    //We want 5 numbers to be generated, so range is index 0 to 4. Dealing with ints, so using <5 will get us range indexes 0,1,2,3,4 fine
    let numberQuantity = 0..<5
    
    func numberGenerator()-> String{
        
        //And we want the numbers to be in the range of 0 to 9
        let iNumberRange = 0...9
        
        //Initial variable for our generated number, as a string
        var generatedNumberString = ""
        
        //For each number in the numberRange (using _ as we don't need i in this case)
        for _ in numberQuantity{
            
            //Get a random number from our iNumRange of 0-9
            let iNumber = Int.random(in: iNumberRange)
            
            //convert to string
            let iNumberString = "\(iNumber)"
            
            //append to our generatedStringNumber
            generatedNumberString += iNumberString
            
            //ALTERNATIVE METHOD. Put 4 numbers into an array. Then loop through the array and convert to string
        }
    
        //And returning the resulting number, as a string
        return generatedNumberString
    }
    
    
    //Now need setter functions for our IBOutlets, according to the 'num','userInput', 'time', and 'score' vars declared above
    func setUserInputField(){
        
    }
    
    func setNumLabel(){
        numLabel?.text = numberGenerator();
    }
    
    func setScoreLabel(){
        scoreLabel?.text = String(score)
    }
    
    func setTimerLabel(){
        timerLabel?.text = String(format: "%d", timerSeconds) + "s"
    }
    
    //When the view has loaded, run our setters to set our initial values
    override func viewDidLoad() {
        super.viewDidLoad()
        setUserInputField()
        setNumLabel()
        setScoreLabel()
        setTimerLabel()
    }
    
    //Function to check the user input against the generated number
    @IBAction func checkInputCompletion(){
        
//        if(!numLabel? && !userInputField?){
//            return
//        } else{
//
//        }
        
        
        if (numLabel == nil || userInputField == nil) {
            return
        } else {
            if (userInputField?.text?.count != numberQuantity.count){
                return
            } else {
                checkAnswer()
            }
        }
    }
    
    func findInt(at s: String, at i: Int) -> Int{
        let index = s.index(s.startIndex, offsetBy: i)
        
//        if (Int(s[index]) != nil){
//            return Int(s[index])
//        } else{
//            return 0
//        }
//        if (s[index].wholeNumberValue != nil){
//            return s[index].wholeNumberValue
//        } else {
//            return 0
//        }
        
        return s[index].wholeNumberValue ?? 0
    }
    
    func checkAnswer(){

        //At each position of i, for each number in our quantity of numbers range
        for i in numberQuantity{
            
            var correctStatus = true
            
            //Get the int the user has put in
            var userInput = findInt(at: userInputField?.text ?? "", at: i)
            
            //Get the int of the number on the label
            let targetNumber = findInt(at: numLabel?.text ?? "", at: i)
//
//            if (userInput == 0){
//                userInput = 10
//            }
            
            //Shorthand?
            userInput == 0 ? userInput = 10 : nil
            
            if (userInput != targetNumber + 1){
                correctStatus = false
                break //Stop here since this round is lost
            }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
//        if let view = self.view as! SKView? {
//            // Load the SKScene from 'GameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") {
//                // Set the scale mode to scale to fit the window
//                scene.scaleMode = .aspectFill
//
//                // Present the scene
//                view.presentScene(scene)
//            }
//
//            view.ignoresSiblingOrder = true
//
//            view.showsFPS = true
//            view.showsNodeCount = true
//        }
//    }

//    override var shouldAutorotate: Bool {
//        return true
//    }
//
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if UIDevice.current.userInterfaceIdiom == .phone {
//            return .allButUpsideDown
//        } else {
//            return .all
//        }
//    }
//
//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
}
