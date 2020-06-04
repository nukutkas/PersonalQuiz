//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 01.06.2020.
//  Copyright © 2020 Alexey Efimov. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    
    @IBOutlet var firstResultLabel: UILabel!
    @IBOutlet var secondResultLabel: UILabel!
    
    @IBOutlet var doneBarButton: UIBarButtonItem!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.hidesBackButton = true
        
        let answer = resultCalculated(for: answers)
        
        firstResultLabel.text = getEmoji(for: answer)
        secondResultLabel.text = getDescribtion(for: answer)
        
    
    }
    
    deinit {
        print("ResultsViewController has been dealocated")
    }
    
    private func resultCalculated(for answers: [Answer]) -> Dictionary<AnimalType,Int>.Element? {
        var results = [
            AnimalType.cat : 0,
            AnimalType.rabbit: 0,
            AnimalType.turtle: 0,
            AnimalType.dog: 0
        ]
        
        for answer in answers {
            results[answer.type]? += 1
        }
       guard let answer = results.sorted(by: { $0.1 < $1.1}).first else { return nil }
         
        return answer
    }
    private func getEmoji(for answer: Dictionary<AnimalType,Int>.Element?) -> String {
        guard let emoji = answer?.key.rawValue else { return "Error" }
        return String("Вы - \(emoji)")
    }
    private func getDescribtion(for answer: Dictionary<AnimalType,Int>.Element?) -> String {
        guard let description = answer?.key.definition else {return "Ошибка"}
        return description
    }
}
