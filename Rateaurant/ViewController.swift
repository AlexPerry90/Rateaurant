//
//  ViewController.swift
//  Rateaurant
//
//  Created by Alessio Perrotti on 28/11/2017.
//  Copyright © 2017 Alessio Perrotti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var tableTF: UITextField!{
        didSet {
            tableTF.delegate = self
            tableTF.keyboardType = UIKeyboardType.numberPad
        }
    }
    @IBOutlet weak var UsernameTF: UITextField!{
        didSet {
            UsernameTF.delegate = self
        }
    }
    @IBOutlet weak var errorTableLabel: UILabel!
    @IBOutlet weak var errorUsernameLabel: UILabel!
    
    @IBAction func enterButton(_ sender: Any) {
        var flag = true
        if(tableTF.text == ""){
            flag = false
            errorTableLabel.text = "No table number inserted"
        }else{
            errorTableLabel.text = ""
        }
        if UsernameTF.text == ""{
            flag = false
            errorUsernameLabel.text = "No Username inserted"
        }else{
            errorUsernameLabel.text = ""
        }
        if flag{
            performSegue(withIdentifier: "FromHomeToMenu", sender: self)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

