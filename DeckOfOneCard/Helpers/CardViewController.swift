//
//  CardViewController.swift
//  DeckOfOneCard
//
//  Created by Jimmy on 4/28/20.
//  Copyright © 2020 Warren. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var cardNameLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    // MARK: - Navigation
    
    // MARK: - Actions
    @IBAction func drawButtonTapped(_ sender: Any) {
        
        CardController.fetchCard { [weak self] (result) in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let card):
                    self?.fetchImageAndUpdateViews(with: card)
                    
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
    
    func fetchImageAndUpdateViews(with card: Card) {
        
        CardController.fetchImage(for: card) { [weak self] result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let image):
                    self?.cardNameLabel.text =  "\(card.value) of \(card.suit)"
                    self?.cardImageView.image = image
                    
                case .failure(let error):
                    self?.presentErrorToUser(localizedError: error)
                }
            }
        }
    }
} // End of Class


