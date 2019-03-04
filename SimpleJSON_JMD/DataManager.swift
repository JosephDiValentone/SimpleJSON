//
//  DataManager.swift
//  SimpleJSON_JMD
//
//  Created by Joseph Divalentone on 3/4/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit

class DataManager: NSObject {

    func getData(){
        
        let urlString = "https://api.myjson.com/bins/tsgdq"
        let actualURL = URL(string: urlString)
        let session = URLSession.shared
        let task = session.dataTask(with: actualURL!) {(data, response, error) in
        if error != nil {
            //handle error
        }
        if let successfulData = data {
            print(String(data: successfulData,encoding:String.Encoding.ascii))
        }
    }
    task.resume()
    }
}
