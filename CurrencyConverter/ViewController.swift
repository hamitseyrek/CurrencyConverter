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
                    do {
                    let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers)
                        as! Dictionary<String,Any>
                        
                        // Async
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String:Any] {
                                if let phpValue = rates["PHP"] as? Double {
                                    self.phpLabel.text = "PHP : \(String(phpValue))"
                                }
                                if let madValue = rates["MAD"] as? Double {
                                    self.madLabel.text = "MAD : \(String(madValue))"
                                }
                                if let etbValue = rates["ETB"] as? Double {
                                    self.etbLabel.text = "ETB : \(String(etbValue))"
                                }
                                if let chfValue = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF : \(String(chfValue))"
                                }
                            }
                        }
                    } catch {
                        print("Error in response")
                    }
                }
            }
        }
        task.resume()
        
    }
    
}

