//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var quizBrain = QuestionBrain()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showQuestion()
    }

    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userGotItRight = quizBrain.checkAnswer(userAnswer: sender.currentTitle!)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green //答对绿色
            scoreLabel.text = "Score: \(quizBrain.getScore())"
        }else {
            sender.backgroundColor = UIColor.red //答错红色
        }
        
////        let questionAnswer = questionArray[questionNumber].answer
//        if questionAnswer == sender.currentTitle! {
//            sender.backgroundColor = UIColor.green //答对绿色
//        }else{
//            sender.backgroundColor = UIColor.red //答错红色
//        }
        let begin = quizBrain.nextQuestion()
        if(begin){
            scoreLabel.text = "Score: \(quizBrain.getScore())"
        }
        
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showQuestion), userInfo:nil, repeats: false)
        
    }
    
    @objc func showQuestion(){
//        let questionText = questionArray[questionNumber].text
        let questionText = quizBrain.getQuestionText()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        questionLabel.text = questionText
//        progressBar.progress = Float(questionNumber) / Float(questionArray.count)    }
        progressBar.progress = quizBrain.getProgress()
    }
}

