//
//  Data.swift
//  MineSweeper
//
//  Created by Andrew Grossfeld on 12/3/15.
//  Copyright © 2015 Andrew Grossfeld. All rights reserved.
//

import Foundation

class Board{
    var times: [Int] = []
    
    init(){
        for x in 0...2{
            times.append(0)
        }
    }
    
    func updateScore(level: Int, time: Int){
        // Check if time is better
        if (time < times[level] || times[level] == 0){
            times[level] = time
        }
    }
    
}

var boardArray: [Board] = [Board(), Board(), Board()]