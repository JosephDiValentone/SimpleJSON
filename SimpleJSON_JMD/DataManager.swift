//
//  DataManager.swift
//  SimpleJSON_JMD
//
//  Created by Joseph Divalentone on 3/4/19.
//  Copyright © 2019 Joseph Divalentone. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/14fypi"// https
    var dataArray = ["nah brah, gottagetsome data"]

    func getData(completion: @escaping (_ success:Bool) -> ()){
        var success = true
        let actualURL = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualURL!) {(data, response, error) in
            
             if let _ =  data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary{
                    
                    if let veggieArray = jsonObj!.value(forKey: "Classes") as? Array<String>{
                        self.dataArray = veggieArray
                        
                        
                        print(jsonObj!.value(forKey: "Classes")! )
                    }
                }
            }else {
                success = false
            }
            completion(success)
        }
           task.resume()
    }

}

