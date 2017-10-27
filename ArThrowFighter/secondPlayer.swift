//
//  secondPlayer.swift
//  ArThrowFighter
//
//  Created by Kevin W on 10/22/17.
//  Copyright © 2017 Kevin W. All rights reserved.
//

import Foundation
import Firebase
import UIKit
class secondPlayer: UIViewController {
    
    @IBAction func jump(_ sender: Any) {
        refresh(x:1)
    }
    @IBAction func Shoot(_ sender: Any) {
        refresh(x:0)
    }
    func refresh(x: Int){
     let ref = Database.database().reference().child("room").child("player2")
     ref.setValue(x)
     }
    @IBAction func Charge(_ sender: Any) {
        refresh(x:2)
    }
    
}
