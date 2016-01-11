//
//  GameScene.swift
//  Sprite iOS
//
//  Created by Tejas Mehta on 1/8/16.
//  Copyright (c) 2016 Tejas Mehta. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    var score : Int = 0
    var jumpHeight : Double = 1.2
    var playerName : String = "Ryan"
    var isAlive : Bool = true
    var isLevel1Completed : Bool = false
    var isGamePaused : Bool = false
    let myLabel = SKLabelNode(fontNamed:"Chalkduster")
    let sprite = SKSpriteNode(imageNamed:"Spaceship")
    
    override func didMoveToView(view: SKView) {
        printLabel()
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        for touch in touches {
            let location = touch.locationInNode(self)
            
            
            
            sprite.xScale = 0.2
            sprite.yScale = 0.2
            sprite.position = location
            
            let action = SKAction.rotateByAngle(CGFloat(M_PI), duration:1)
            
            sprite.runAction(SKAction.repeatActionForever(action))
            
            score = score + 1
            playerName = "Abid"
            isAlive = false
            
            removePlane()            
            changeMyLabelText()
            self.addChild(sprite)
        }
    }
   
    override func update(currentTime: CFTimeInterval) {
        /* Called before each frame is rendered */
    }
    
    func printLabel() {
        
        changeMyLabelText()
        myLabel.fontSize = 35
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
    
    func changeMyLabelText() {
        myLabel.text = "\(score) \(playerName) \(isAlive)"
    }
    
    func removePlane() {
        sprite.removeFromParent()
    }
    
}

