//
//  TitleScene.swift
//  marshmallow
//
//  Created by Yoji Hayashi on 2015/09/27.
//  Copyright © 2015年 Yoji Hayashi. All rights reserved.
//

import SpriteKit

class TitleScene: SKScene {
    //タイトル用ラベルと、スタートボタン用ラベルを用意する
    let titleLabel = SKLabelNode(fontNamed: "Verdana-bold")
    let startLabel = SKLabelNode(fontNamed: "Verdana-bold")
    
    override func didMoveToView(view: SKView) {
        //背景色をつける
        self.backgroundColor = UIColor(red: 0.8, green: 0.96, blue: 1, alpha: 1)
        //タイトルを表示する
        titleLabel.text = "マシュマロキャッチ"
        titleLabel.fontColor = SKColor.brownColor()
        titleLabel.fontSize = 70
        titleLabel.position = CGPoint(x: 375, y: 900)
        self.addChild(titleLabel)
        //スタートボタンを表示する
        startLabel.text = "START"
        startLabel.fontColor = SKColor.brownColor()
        startLabel.fontSize = 60
        startLabel.position = CGPoint(x: 375, y: 300)
        self.addChild(startLabel)
    }
    //タッチした時の処理
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        for touch: AnyObject in touches {
            let location = touch.locationInNode(self) //タッチした位置を調べて
            let touchNode = self.nodeAtPoint(location) //その位置にあるものを調べる
            //もし、タッチした位置にあるものがスタートボタンなら
            if touchNode == startLabel {
                //GameSceneに切り換える
                let skView = self.view as SKView!
                let scene = GameScene(size: self.size)
                scene.scaleMode = SKSceneScaleMode.AspectFill
                skView.presentScene(scene)
            }
        }
    }
}