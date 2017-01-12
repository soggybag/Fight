//
//  GameScene.swift
//  Fight
//
//  Created by mitchell hudson on 1/11/17.
//  Copyright © 2017 Mitchell Hudson. All rights reserved.
//

import SpriteKit
import GameplayKit


enum Players {
    case playerA
    case playerB
    
    
}

class GameScene: SKScene {
    
    let buttonA = ButtonNode(normalImageNamed: "Button-normal",
                             activeImageNamed: "Button-active",
                             disabledImageNamed: "Button-disabled")
    
    let buttonB = ButtonNode(normalImageNamed: "Button-normal",
                             activeImageNamed: "Button-active",
                             disabledImageNamed: "Button-disabled")
    
    
    
    func randomTime(range: Int) -> CGFloat {
        let rInt = Int(arc4random() % UInt32(range * 1000))
        return CGFloat(rInt) / 1000
    }
    
    
    
    override func didMove(to view: SKView) {
        
        /*
        for _ in 1...100 {
            print(randomTime(range: 10))
        }
         */
        setup()
        startGame()
    }
    
    func setup() {
        addChild(buttonA)
        addChild(buttonB)
        
        buttonA.position.x = frame.midX
        buttonB.position.x = frame.midX
        
        buttonA.position.y = frame.midX
        buttonB.position.y = frame.height - frame.midX
        
        buttonA.selectedHandler = tapButtonA
        buttonB.selectedHandler = tapButtonB
    }
    
    func startGame() {
        
        buttonA.state = .disabled
        buttonB.state = .disabled
        
        let wait1 = SKAction.wait(forDuration: TimeInterval(randomTime(range: 3) + 3))
        let wait2 = SKAction.wait(forDuration: TimeInterval(randomTime(range: 3)))
        let wait3 = SKAction.wait(forDuration: TimeInterval(randomTime(range: 3)))
        let prep = SKAction.run {
            print("Prepare")
        }
        
        let to = SKAction.run {
            print("to")
        }
        
        let fight = SKAction.run {
            print("Fight")
        }
        
        let activate = SKAction.run { 
            self.buttonA.state = .normal
            self.buttonB.state = .normal
            // TODO: start timer or get delta time
        }
        
        print("hello")
        
        run(SKAction.sequence([wait1, prep, wait2, to, wait3, fight, activate]))
    }
    
    
    
    func tapButtonA() {
        print("Player A wins")
        playerWins(player: .playerA)
    }
    
    func tapButtonB() {
        print("Player B wins")
        playerWins(player: .playerB)
    }
    
    func playerWins(player: Players) {
        buttonA.state = .disabled
        buttonB.state = .disabled
        print("Player \(player) wins")
    }
    
    
    
    func touchDown(atPoint pos : CGPoint) {
        
    }
    
    func touchMoved(toPoint pos : CGPoint) {
        
    }
    
    func touchUp(atPoint pos : CGPoint) {
    
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
