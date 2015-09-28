//
//  GameOverScene.swift
//  marshmallow
//
//  Created by Yoji Hayashi on 2015/09/27.
//  Copyright © 2015年 Yoji Hayashi. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {
    //ゲームオーバー用ラベルと、リプレイボタン用ラベルを用意する
    let endLabel = SKLabelNode(fontNamed: "Vardana-bold")
    let replayLabel = SKLabelNode(fontNamed: "Vardana-bold")
    
    override func didMoveToView(view: SKView) {
        //背景色をつける
        self.backgroundColor = UIColor(red: 0.8, green: 0.96, blue: 1, alpha: 1)
        //スコアを表示する
        let scoreLabel = SKLabelNode(fontNamed: "Verdana-bold")
        let gameSKView = self.view as! GameSKView
        scoreLabel.text = "SCORE:\(gameSKView.score)"
        scoreLabel.fontSize = 40
        scoreLabel.fontColor = SKColor.brownColor()
        scoreLabel.position = CGPoint(x: 375, y: 700)
        self.addChild(scoreLabel)
        //ゲームオーバー表示する
        endLabel.text = "GAMEOVER"
        endLabel.fontSize = 100
        endLabel.fontColor = UIColor.magentaColor()
        endLabel.position = CGPoint(x: 375, y: 900)
        self.addChild(endLabel)
        //リプレイボタンを表示する
        replayLabel.text = "REPLAY"
        replayLabel.fontSize = 60
        replayLabel.fontColor = SKColor.brownColor()
        replayLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(replayLabel)
    }
    //タッチした時の処理
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            //タッチした位置にあるものを調べる
            let location = touch.locationInNode(self)
            let touchNode = self.nodeAtPoint(location)
            //もし、タッチした位置にあるものがリプレイボタンなら
            if touchNode == replayLabel {
                //TitleSceneに切り換える
                let scene = TitleScene(size: self.size)
                let skView = self.view as SKView!
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
}
