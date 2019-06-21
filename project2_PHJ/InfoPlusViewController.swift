//
//  InfoPlusViewController.swift
//  project2_PHJ
//
//  Created by SWUCOMPUTER on 21/06/2019.
//  Copyright © 2019 SWUCOMPUTER. All rights reserved.
//

import UIKit
import CoreData

class InfoPlusViewController: UIViewController,UITextFieldDelegate {
    
    @IBOutlet var textName: UITextField!
    @IBOutlet var textMemo: UITextView!

    func textFieldShouldReturn(_ textField: UITextField) -> Bool { // delegate 연결
        textField.resignFirstResponder()
        textMemo.becomeFirstResponder()
        return true
    }
    
    func getContext () -> NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    @IBAction func saveInfo(_ sender: UIBarButtonItem) {
        let context = self.getContext()
        let entity = NSEntityDescription.entity(forEntityName: "Information", in: context)
        
        let object = NSManagedObject(entity: entity!, insertInto: context)
        
        object.setValue(textName.text, forKey: "id")
        object.setValue(textMemo.text, forKey: "memo")
        
        do {
            try context.save()
            print("saved!")
        } catch let error as NSError {
            print("Could not save \(error), \(error.userInfo)")
        }
        
        // 현재의 View를 없애고 이전 화면으로 복귀
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
