//
//  ViewController.swift
//  quiz
//
//  Created by Bryan Barreto on 17/08/20.
//  Copyright © 2020 Bryan Barreto. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    var questionNumber:Int = 0
    var correctAnswers:Int = 0
    
    let questions:[Question] = [
        Question(questionText: "5 + 9 = 14", answer: "Verdadeiro"),
        Question(questionText: "8 + 8 = 15", answer: "Falso"),
        Question(questionText: "5 x 2 = 11", answer: "Falso"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    
    @IBAction func btnPressed(_ sender: UIButton) {
        
        let questionAnswer = questions[questionNumber].answer
        let userAnswer = sender.currentTitle!
        checkAnswer(questionAnswer: questionAnswer, userAnswer: userAnswer, button: sender)
        
        /* delay de 0.2 segundo para resetar a cor dos botoes */
        Timer.scheduledTimer(timeInterval:0.2, target: self, selector: #selector(resetButtons),userInfo: nil, repeats: false)
        
        nextQuestion()
    }
    
    func updateUI()->Void{
        questionLabel.text = questions[questionNumber].questionText
    }
    
    func checkAnswer(questionAnswer:String, userAnswer:String, button:UIButton)->Void{
        if(questionAnswer == userAnswer){
            
            // usuario acertou a questao
            button.backgroundColor = UIColor.green
            button.setTitleColor(UIColor.black, for: .normal)
            
            correctAnswers += 1
            
        }else{
            
            // usuario errou a questao
            button.backgroundColor = UIColor.red
            button.setTitleColor(UIColor.black, for: .normal)
            
        }
    }
    
    func nextQuestion()->Void{

        if(questionNumber+1 == questions.count){
            
            progressBar.setProgress(1, animated: true)
            questionLabel.text = "Fim de Jogo! Você acertou \(correctAnswers) questões"
            
        }else{
            questionNumber+=1
            updateProgressBar()
            updateUI()
        }
        
    }
    
    @objc func resetButtons()->Void{
        trueButton.backgroundColor = UIColor.darkGray
        trueButton.setTitleColor(UIColor.white, for: .normal)
        
        falseButton.backgroundColor = UIColor.darkGray
        falseButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func updateProgressBar()->Void{
        let n1:Float = Float(questionNumber)
        let n2:Float = Float(questions.count)
        
        progressBar.setProgress(n1/n2, animated: true)
    }

}

