//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Hamit Seyrek on 29.01.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var phpLabel: UILabel!
    @IBOutlet weak var madLabel: UILabel!
    @IBOutlet weak var etbLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getRatesClicked(_ sender: Any) {
        // Request - Session
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=7665dae530ca068b1cff7141e4b8456c")
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { data, response, error in
            if error != nil {
                let alert = UIAlertController(title: "Error!", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
                return
            } else {
                // Response  & Data
                if data != nil {
                    
                }
            }
        }
        task.resume()
        
    }
    
}

