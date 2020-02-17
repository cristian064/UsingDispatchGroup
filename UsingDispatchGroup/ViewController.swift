//
//  ViewController.swift
//  UsingDispatchGroup
//
//  Created by cristian ayala on 2/16/20.
//  Copyright © 2020 cristian ayala. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var item : [Int] = [Int]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    
     }

    private func fetchData(){
         let dispatchGroup = DispatchGroup()
        
        
        dispatchGroup.enter()
        Alamofire.request(URL(string: "https://rss.itunes.apple.com/api/v1/us/ios-apps/new-games-we-love/all/50/explicit.json")!).responseJSON { (response) in
            dispatchGroup.leave()
            print(1)
            self.item.append(1)
        }
        dispatchGroup.enter()
        Alamofire.request(URL(string: "https://rss.itunes.apple.com/api/v1/pe/ios-apps/top-grossing/all/25/explicit.json")!).responseJSON { (response) in
            dispatchGroup.leave()
            print(2)
            self.item.append(2)
        }
        let url = URL(string: "https://api.letsbuildthatapp.com/appstore/social")!
        dispatchGroup.enter()
        Alamofire.request(url).responseJSON { (response) in
            dispatchGroup.leave()
            print(3)
            self.item.append(3)
        }
        dispatchGroup.notify(queue: .main){
            print("all task are done")
            print(self.item)
        }
        
    }

}

