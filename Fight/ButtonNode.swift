//
//  ButtonNode.swift
//  Button Sprite
//
//  Created by mitchell hudson on 7/20/16.
//  Copyright © 2016 mitchell hudson. All rights reserved.
//



/*
 
 Simple button class that supports image states for Normal, Active, and disabled
 states. The ButtonNode class defines three textures which it displays as the 
 button enters it's various states. 
 
 Initialize a ButtonNode with the names of images to use as the Normal, Active, 
 and Disabled states. 
 
 */



import Foundation
import SpriteKit


enum ButtonState {
    case active
    case normal
    case disabled
}


class ButtonNode: SKSpriteNode {
    let normal: SKTexture
    let active: SKTexture
    let disabled: SKTexture
    
    var selectedHandler: () -> Void = { print("No button action set") }
    
    func setButtonState() {
        switch state {
        case .normal:
            texture = normal
            isUserInteractionEnabled = true
            
        case .active:
            texture = active
            
        case .disabled:
            texture = disabled
            isUserInteractionEnabled = false
            
        }
    }
    
    var state: ButtonState = ButtonState.normal {
        didSet {
            setButtonState()
        }
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        state = .active
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        state = .normal
        selectedHandler()
    }
    
    
    
    init(normalImageNamed: String, activeImageNamed: String, disabledImageNamed: String) {
        normal = SKTexture(imageNamed: normalImageNamed)
        active = SKTexture(imageNamed: activeImageNamed)
        disabled = SKTexture(imageNamed: disabledImageNamed)
        
        super.init(texture: normal, color: UIColor.clear, size: normal.size())
        
        isUserInteractionEnabled = true
        
        state = .normal
        setButtonState()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
