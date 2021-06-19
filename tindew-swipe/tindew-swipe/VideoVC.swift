//
//  ViewController.swift
//  tindew-swipe
//
//  Created by Vijay on 26/04/21.
//

import UIKit
import Shuffle_iOS
import AVKit
import AVFoundation
class VideoVC: UIViewController , SwipeCardStackDataSource , SwipeCardStackDelegate {
   
  let cardStack = SwipeCardStack()
  
  let cardVideo = [ "video1" ,"video2","video1" ,"video2" ]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    print(cardVideo)
    cardStack.dataSource = self
    view.addSubview(cardStack)
    cardStack.frame = view.safeAreaLayoutGuide.layoutFrame
  }
    
    func card(fromVideo video: String) -> SwipeCard {
      let card = SwipeCard()
      card.swipeDirections = [.up, .down]
    
        print("check")
        let path = Bundle.main.path(forResource: video, ofType:"mp4" )
        let player = AVPlayer(url: URL(fileURLWithPath: path!))
        var playerLayer: AVPlayerLayer?
        playerLayer = AVPlayerLayer(player: player)
        playerLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        playerLayer!.frame = self.view.frame
        self.view.layer.addSublayer(playerLayer!)
        player.play()
        
      let leftOverlay = UIView()
      leftOverlay.backgroundColor = .clear
      
      let rightOverlay = UIView()
      rightOverlay.backgroundColor = .clear
      card.setOverlays([.up: leftOverlay, .down: rightOverlay])
      return card
    }
}

extension VideoVC{
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        print("Index" , index)
        return card(fromVideo: cardVideo[index])
    }
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
      return cardVideo.count
    }
}

