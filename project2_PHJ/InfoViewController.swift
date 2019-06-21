//
//  InfoViewController.swift
//  project2_PHJ
//
//  Created by SWUCOMPUTER on 21/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class InfoViewController: UIViewController {
    
    @IBOutlet var textName: UILabel!
    @IBOutlet var textMemo: UILabel!
    @IBOutlet var hiddenView: UIView!
    
    var detailInfo: NSManagedObject?

    override func viewDidLoad() {
        super.viewDidLoad()
        hiddenView.isHidden = true
        if let info = detailInfo {
            textName.text = info.value(forKey: "id") as? String
            textMemo.text = info.value(forKey: "memo") as? String

    }
    }
    
    @IBAction func toggleInfo(_ sender: UISwitch) {
        if sender.isOn {
          hiddenView.isHidden = false
        } else {
          hiddenView.isHidden = true
        }
    }

}
