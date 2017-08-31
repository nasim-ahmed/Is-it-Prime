//
//  ViewController.swift
//  Is it Prime?
//
//  Created by Research on 8/31/17.
//  Copyright © 2017 HealthDiary. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var inputField: UITextField!
    
    @IBAction func primeCheckerButtonPressed(_ sender: UIButton) {

        guard let number = inputField.text else {return}
        
        let numberInt = Int(number)
        
        if numberInt != nil {
            var isPrime:Bool = true
            guard let unwrappedNumber = numberInt else {return}
            
            if unwrappedNumber == 1{
                isPrime = false
            }
            
            if unwrappedNumber != 2 && unwrappedNumber != 1{
                for i in 2 ..< unwrappedNumber {
                    if unwrappedNumber % i == 0 {
                       isPrime = false
                    }
                }
            }
            
            if isPrime == true {
                showAlert(result: "\(unwrappedNumber) is a Prime")

            }else {
                showAlert(result: "\(unwrappedNumber) is not a Prime")
            }
        
        }else{
           showAlert(result: "Please enter a number")
        }

    }
    
    func showAlert(result: String){
        
        let alert = UIAlertController(title: "", message: result, preferredStyle: UIAlertControllerStyle.actionSheet)
        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(ViewController.dismissKeyboard))
        
        view.addGestureRecognizer(tap)

    }
    
    func dismissKeyboard(){
        view.endEditing(true)
    }


}

