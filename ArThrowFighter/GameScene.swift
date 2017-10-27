
import SpriteKit
import FirebaseDatabase
import Firebase
class GameScene: SKScene{
    
    let player = SKSpriteNode(imageNamed: "Rabbit")
    let bullet = SKSpriteNode(imageNamed:"Carrot")
    let bullet2 = SKSpriteNode(imageNamed: "Water")
    let player2 = SKSpriteNode(imageNamed: "Elephant")
    let win1 = SKSpriteNode(imageNamed: "WinP1")
    let secondWin = SKSpriteNode(imageNamed: "WinP2")
    var stop:Int = 0
    var stopplayer:Int = 0
    let background = SKSpriteNode(imageNamed: "Background2")
    var player2Choice = 0
    var player2Health = 10.0
    var player1Health = 10.0
    var player1Choice = ""
    var chargeOne = 1.0
    var chargePlayer = 1.0
    let rabbitHurtSound = SKAction.playSoundFileNamed("HurtRabit", waitForCompletion: false)
    override func didMove(to view: SKView) {
        let background = SKSpriteNode(imageNamed: "Background2")
        background.position = CGPoint(x: size.width/2, y: size.height/2)
        background.zPosition = -1
        addChild(background)
        let hOne = SKSpriteNode(imageNamed: "heart")
        hOne.setScale(1)
        hOne.position = CGPoint(x: size.width * 0.05 , y: size.height * 0.8)
        addChild(hOne)
        let hx = SKSpriteNode(imageNamed: "heart")
        hx.setScale(1)
        hx.position = CGPoint(x: size.width * 0.05 , y: size.height * 0.9)
        addChild(hx)
        let hT = SKSpriteNode(imageNamed: "heart")
        hT.setScale(1)
        hT.position = CGPoint(x: size.width * 0.1 , y: size.height * 0.9)
        addChild(hT)
        let hThree = SKSpriteNode(imageNamed: "heart")
        hThree.setScale(1)
        hThree.position = CGPoint(x: size.width * 0.15 , y: size.height * 0.9)
        addChild(hThree)
        let hFour = SKSpriteNode(imageNamed: "heart")
        hFour.setScale(1)
        hFour.position = CGPoint(x: size.width * 0.2 , y: size.height * 0.9)
        addChild(hFour)
        let hFive = SKSpriteNode(imageNamed: "heart")
        hFive.setScale(1)
        hFive.position = CGPoint(x: size.width * 0.25 , y: size.height * 0.9)
        addChild(hFive)
        let hSix = SKSpriteNode(imageNamed: "heart")
        hSix.setScale(1)
        hOne.position = CGPoint(x: size.width * 0.95 , y: size.height * 0.9)
        addChild(hSix)
        let hSeven = SKSpriteNode(imageNamed: "heart")
        hSeven.setScale(1)
        hSeven.position = CGPoint(x: size.width * 0.90 , y: size.height * 0.9)
        addChild(hSeven)
        let hEight = SKSpriteNode(imageNamed: "heart")
        hEight.setScale(1)
        hEight.position = CGPoint(x: size.width * 0.85 , y: size.height * 0.9)
        addChild(hEight)
        let hNine = SKSpriteNode(imageNamed: "heart")
        hNine.setScale(1)
        hNine.position = CGPoint(x: size.width * 0.80 , y: size.height * 0.9)
        addChild(hNine)
        let hTen = SKSpriteNode(imageNamed: "heart")
        hTen.setScale(1)
        hTen.position = CGPoint(x: size.width * 0.75 , y: size.height * 0.9)
        addChild(hTen)
        
        
        
        player2.setScale(1.2)
        player.setScale(0.72)
        bullet.setScale(0.6)
        bullet2.setScale(0.6)
        
        
        
        bullet.position = CGPoint(x: size.width * 0.1, y: size.height * 0.3)
        bullet2.position = CGPoint(x: size.width * 0.9, y: size.height * 0.3)
        player2.position = CGPoint(x: size.width * 0.9, y: size.height * 0.3)
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.3)
        let moveRight = SKAction.moveTo( x:size.width*0.9, duration:0.95)
        let moveLeft = SKAction.moveTo( x:size.width*0.1, duration:0.95)
        
        addChild(bullet)
        addChild(bullet2)
        addChild(player)
        addChild(player2)
        
        func onesecond(x:Int){
            if(x==1){
            shootbullet(x:0)
            }
            else{
            shootbullet(x:1)
            }
        }
        func jump(x:Int){
            let diceRoll = CGFloat(Float(arc4random()) / Float(UINT32_MAX))
            let hi = diceRoll
            let up = SKAction.moveTo( y:size.height*CGFloat(hi), duration:TimeInterval(0.25+diceRoll/2))
            let down = SKAction.moveTo( y:size.height*0.3, duration:(0.5))
            let jumpSequence = SKAction.sequence([up, down])
            if(x==0){
            player.run(jumpSequence)
            }
            else{
                player2.run(jumpSequence)
            }
        }
        
        let wait = SKAction.wait(forDuration: 1)
        let update = SKAction.run(
        {
            retrieve{ (success) -> Void in
                if(success){
            if(self.player2Choice==0){
                
                self.player2.texture = SKTexture(imageNamed: "Elephant")
                self.stop = 1
                onesecond(x:1)
            }
                
            else if(self.player2Choice == 1){
                
                self.player2.texture = SKTexture(imageNamed: "Elephant")
                jump(x:1)
            }
                    else if(self.player2Choice == 2){
                
                        charge(x:0)
                    }
            
                    
                    if(self.player1Choice=="0"){
                        
                        self.player.texture = SKTexture(imageNamed: "Rabbit")
                        self.stopplayer = 1
                        onesecond(x:0)
                    }
                        
                    else if(self.player1Choice == "1"){
                        
                        self.player.texture = SKTexture(imageNamed: "Rabbit")
                        jump(x:0)
                    }
                    else if(self.player1Choice == "2"){
                        charge(x:1)
                    }
                }
            }
        })
        let seq = SKAction.sequence([wait,update])
        let repeatA = SKAction.repeatForever(seq)
        run(repeatA)
        
        let waitCheck = SKAction.wait(forDuration: 0.01)
        let updateCheck = SKAction.run(
        {
            if(self.player2.position.x-self.bullet.position.x<=20&&self.player2.position.y-self.bullet.position.y<=20){
                self.bullet.setScale(0.6*CGFloat(self.chargePlayer))
                self.bullet.position = CGPoint(x: self.size.width * 0.1, y: self.size.height * 0.3)
                
                if(self.stopplayer==1){
                    self.player2Health = self.player2Health-(1.0 * self.chargePlayer)
                    self.chargePlayer = 1
                }
                else{}
                if(self.player2Health>=9){
                    
                    hTen.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stopplayer = 0
                }
                else if(self.player2Health>=8){
                   hTen.removeFromParent()
                    self.stopplayer = 0
                }
                else if(self.player2Health>=7){
                    
                hTen.removeFromParent()
                 hNine.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stopplayer = 0
                }
                else if(self.player2Health>=6){
                    
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    self.stopplayer = 0
                }
                else if(self.player2Health>=5){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    hEight.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stopplayer = 0
                }
                else if(self.player2Health>=4){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    hEight.removeFromParent()
                    self.stopplayer = 0
                }
                else if(self.player2Health>=3){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    hEight.removeFromParent()
                    hSeven.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stopplayer = 0
                }
                else if(self.player2Health>=2){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    
                    hEight.removeFromParent()
                    hSeven.removeFromParent()
                    self.stopplayer = 0
                }
                else if(self.player2Health>=1){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    
                    hEight.removeFromParent()
                    hSeven.removeFromParent()
                  hSix.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stopplayer = 0
                }
                else if (self.player2Health<=0){
                    hTen.removeFromParent()
                    hNine.removeFromParent()
                    
                    hEight.removeFromParent()
                    hSeven.removeFromParent()
                        hSix.removeFromParent()
                    self.player2.texture = SKTexture(imageNamed: "DeadElephant")
                    self.win1.removeFromParent()
                    self.win1.setScale(2)
                    self.win1.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.5)
                    self.addChild(self.win1)
                    refresh()
                }
            }
            if(self.player.position.x-self.bullet2.position.x<=20&&self.player.position.y-self.bullet2.position.y<=20){
                self.bullet2.setScale(0.6*CGFloat(self.chargeOne))
                self.bullet2.position = CGPoint(x: self.size.width * 0.9, y: self.size.height * 0.3)
                
                if(self.stop==1){
                    self.player1Health = self.player2Health-(1.0 * self.chargePlayer)
                    self.chargeOne = 1
                }
                else{}
                if(self.player1Health>=9){
                    hFive.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stop = 0
                }
                else if(self.player1Health>=8){
                    hFive.removeFromParent()
                    self.stop = 0
                }
                else if(self.player1Health>=7){
                    
                    hFive.removeFromParent()
                    hFour.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stop = 0
                }
                else if(self.player1Health>=6){
                    
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    self.stop = 0
                }
                else if(self.player1Health>=5){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stop = 0
                }
                else if(self.player1Health>=4){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.removeFromParent()
                    self.stop = 0
                }
                else if(self.player1Health>=3){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.removeFromParent()
                    hT.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stop = 0
                }
                else if(self.player1Health>=2){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.removeFromParent()
                    hT.removeFromParent()
                    self.stop = 0
                }
                else if(self.player1Health>=1){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.removeFromParent()
                    hT.removeFromParent()
                    hx.texture = SKTexture(imageNamed: "HalfHeart")
                    self.stop = 0
                }
                else if (self.player1Health<=0){
                    hFive.removeFromParent()
                    hFour.removeFromParent()
                    hThree.removeFromParent()
                    hT.removeFromParent()
                    hx.removeFromParent()
                    self.player.texture = SKTexture(imageNamed: "DeadRabbit")
                    self.secondWin.removeFromParent()
                    self.secondWin.setScale(2)
                    self.secondWin.position = CGPoint(x: self.size.width * 0.5 , y: self.size.height * 0.5)
                    self.addChild(self.secondWin)
                    refresh()
                }
            }
            }
            
        )
        let seqCheck = SKAction.sequence([waitCheck,updateCheck])
        let repeatACheck = SKAction.repeatForever(seqCheck)
        run(repeatACheck)
        
        func charge(x:Int){
            if(x==0){
            player2.texture = SKTexture(imageNamed: "FireElephant")
            chargeOne=chargeOne+0.5
            }
            else{
                
                player.texture = SKTexture(imageNamed: "FireRabbit")
                chargePlayer = chargePlayer+0.5
            }
            
        }
        
        func shootbullet(x: Int){
            if(x==1){
                bullet.position = CGPoint(x: size.width * 0.1, y: size.height * 0.3)
                
                bullet.run(moveRight)
                
                
            }
            
            if(x==0){
                bullet2.position = CGPoint(x: size.width * 0.9, y: size.height * 0.3)
                
                bullet2.run(moveLeft)
                
    
                
            }
        }
        func retrieve(completion: @escaping (_ success: Bool) -> Void){
            Database.database().reference().child("room").observeSingleEvent(of: .value, with: {(snap) in
                
                if let snapDict = snap.value as? Dictionary <String, AnyObject>{
                    
                    let theNumber = snapDict["player2"] as! Int
                    let theNumber2 = snapDict["player1"] as! String
                    self.player2Choice = theNumber
                    self.player1Choice = theNumber2
                    completion(true)
                }
            })
        }
        func refresh(){
            let gameScene:GameScene = GameScene(size: self.view!.bounds.size) // create your new scene
            let transition = SKTransition.fade(withDuration: 5.0) // create type of transition (you can check in documentation for more transtions)
            gameScene.scaleMode = SKSceneScaleMode.fill
            self.view!.presentScene(gameScene, transition: transition)
        }
       
}
}
