//
//  ViewController.swift
//  OTRDemo
//
//  Created by Mahendra Vishwakarma on 03/09/19.
//  Copyright © 2019 Mahendra Vishwakarma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        let strMessage = "hello guys. how are you. press A for Good. press B for Sad. press C for restless. press D for your feeling what ever you have"
        let msgData = strMessage.data(using: .utf8)
        let keyData = NSMutableData(length: 16)
        let ivData = NSMutableData(length: 16)
        let encryptedData  = try? OTRCryptoUtility.encryptAESGCMData(msgData!, key: keyData! as Data, iv: ivData as! Data)
        print(encryptedData?.data)
        
        guard let decryptedData = try? OTRCryptoUtility.decryptAESGCMData(encryptedData!, key:  keyData! as Data, iv: ivData as! Data) else { return  }
        print(String.init(data: decryptedData, encoding: .utf8))
        // Do any additional setup after loading the view.
    }


}

