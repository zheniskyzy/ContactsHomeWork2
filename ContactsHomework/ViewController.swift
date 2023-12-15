//
//  ViewController.swift
//  ContactsHomework
//
//  Created by Madina Olzhabek on 14.12.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textfieldName: UITextField!
    
    @IBOutlet weak var textfieldPhonenumber: UITextField!
    
    @IBOutlet weak var imageViewForContact: UIImageView!
    
   var contact = ContactsInfo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }

    @IBAction func add(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        
        let name1 = textfieldName.text!
        let number1 = textfieldPhonenumber.text!
        
        var newContactsInfo = ContactsInfo()
        
        newContactsInfo.name = name1
        newContactsInfo.number = number1
        
       // var nameArray: [ContactsInfo] = []
       // var numberArray: [ContactsInfo] = []
        
        do{
            if let data = defaults.data(forKey: "name"){
                var array = try JSONDecoder().decode([ContactsInfo].self, from: data)
                array.append(newContactsInfo)
                let encodedata = try JSONEncoder().encode(array)
                defaults.set(encodedata, forKey: "name")
            }else{
                let encodedata = try JSONEncoder().encode([newContactsInfo])
                defaults.set(encodedata, forKey: "name")
            }
            
        }catch{
            print("unbleto to encode \(error)")
        }

        textfieldName.text = ""
        textfieldPhonenumber.text = ""
        
    }
    
}

