//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Nikita Yashin on 15.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var resultAnimaLabel: UILabel!
    @IBOutlet var resultTextLabel: UILabel!
    
    var response: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    private func updateResult() {
        var repeatabilityOfAnimals: [Animal: Int] = [:]
        let animals = response.map { $0.animal }
        for animal in animals {
            repeatabilityOfAnimals[animal] = (repeatabilityOfAnimals[animal] ?? 0 ) + 1
        }
                
        let sortedRepeatabilityOfAnimals = repeatabilityOfAnimals.sorted { $0.value > $1.value }
        guard let mostRepeatabilityAnimal = sortedRepeatabilityOfAnimals.first?.key else { return }
        updateUI(with: mostRepeatabilityAnimal)
    }
    
    private func updateUI(with animal: Animal) {
        resultAnimaLabel.text = "Вы - \(animal.rawValue)!"
        resultTextLabel.text = "\(animal.definition)"
    }
}
