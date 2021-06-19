//
//  ViewController.swift
//  tindew-swipe
//
//  Created by Vijay on 26/04/21.
//

import UIKit
import Shuffle_iOS

class ViewController: UIViewController , SwipeCardStackDataSource , SwipeCardStackDelegate {
   
  let cardStack = SwipeCardStack()
  
  let cardImages = [
    UIImage(named: "ic_cardImage1"),
    UIImage(named: "ic_cardImage2"),
    UIImage(named: "ic_cardImage3"),
    UIImage(named: "ic_cardImage4"),
    UIImage(named: "ic_cardImage5"),
    UIImage(named: "ic_cardImage6")
  ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(cardImages)
    cardStack.dataSource = self
    view.addSubview(cardStack)
    cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
  }
}

func card(fromImage image: UIImage) -> SwipeCard {
  let card = SwipeCard()
  card.swipeDirections = [.left, .right]
  card.content = UIImageView(image: image)
  
  let leftOverlay = UIView()
  leftOverlay.backgroundColor = .clear
  
  let rightOverlay = UIView()
    rightOverlay.backgroundColor = .clear
  
  card.setOverlays([.left: leftOverlay, .right: rightOverlay])
  
  return card
}

extension ViewController{
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        return card(fromImage: cardImages[index]!)
    }

    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
      return cardImages.count
    }
}

