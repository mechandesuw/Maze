//
//  ViewController.swift
//  Maze
//
//  Created by 山谷美咲生 on 2019/04/16.
//  Copyright © 2019 山谷美咲生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //画面サイズの取得
    let screenSize = UIScreen.main.bounds.size
    
    //迷路のマップを表した配列
    let maze = [
    [1,0,0,0,0,0,],
    [1,0,1,1,1,0,],
    [0,0,0,0,1,0,],
    [3,1,1,1,1,0,],
    [1,1,0,0,1,0,],
    [0,0,1,0,0,0,],
    [0,1,1,1,0,0,],
    [0,0,0,0,0,1,],
    [0,1,1,1,0,0,],
    [0,0,0,1,1,2,],
    
    ]
    
    //スタートとゴールを表すUIView
    
    var startView: UIView!
    var goalView: UIView!
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // dispose of any resources that can be recreated.
    }
    
    func createView(x: Int, y: Int, width: CGFloat, height: CGFloat, offsetX: CGFloat, offsetY: CGFloat) -> UIView {
        let rect = CGRect(x: 0, y: 0, width: width, height: height)
        let view = UIView(frame: rect)
        
        let center = CGPoint(x: offsetX + width * CGFloat(x), y: offsetY + height * CGFloat(y))
        
        view.center = center
        
        return view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    let cellWidth = screenSize.width / CGFloat(maze[0].count)
    let cellHeight = screenSize.height / CGFloat(maze.count)
        
    let cellOffsetX = screenSize.width / CGFloat(maze[0].count * 2)
    let cellOffsetY = screenSize.height / CGFloat(maze.count * 2)
        
        for y in 0 ..< maze.count {
            for x in 0 ..< maze[y].count {
                switch maze[x][y] {
                case 1: //当たるとゲームオーバーになるマス
                    let wallView = createView(x: x, y: y, width: cellWidth, height: cellHeight, offsetX: cellOffsetX, offsetY: cellOffsetY)
                    wallView.backgroundColor = UIColor.black
                    view.addSubview(wallView)
                case 2://スタート地点
                    startView = createView(x: x, y: y, width: cellWidth, height: cellHeight, offsetX: cellOffsetX, offsetY: cellOffsetY)
                    startView.backgroundColor = UIColor.green
                    view.addSubview(goalView)
                case 3://ゴール地点
                    goalView = createView(x: x, y: y, width: cellWidth, height: cellHeight, offsetX: cellOffsetX, offsetY: cellOffsetY)
                    goalView.backgroundColor = UIColor.red
                    view.addSubview(goalView)
                default:
                    break
                }
            }
        }
        
        
        
    }


}

