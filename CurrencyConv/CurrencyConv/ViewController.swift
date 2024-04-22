//
//  ViewController.swift
//  CurrencyConv
//
//  Created by Dilara Büker on 23.04.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var cadLabel: UILabel!
    @IBOutlet weak var chfLabel: UILabel!
    @IBOutlet weak var gbpLabel: UILabel!
    @IBOutlet weak var jpyLabel: UILabel!
    @IBOutlet weak var usdLabel: UILabel!
    @IBOutlet weak var tryLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getirButton(_ sender: Any) {
        
        /*
         1) request and session --> istek ve oturum
         2) response & data --> yanıt ve veri
         3) parsing and json serialization --> ayrıştırma ve JSON serileştirme
         */
        
        // adım 1:
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=d58b475b429e03a2e0a7c0dbb2ce412e") //apinin urlsi
        let session = URLSession.shared
        
        //closure
        let task = session.dataTask(with: url!) { (data, response, error) in
            //hata varsa hata mesajı verecek..
            if error != nil {
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            } else {
                //hata yoksa verileri alacağız
                
                // adım 2:
                if data != nil {
                    //data boş değilse
                    do {
                        //// Veriyi JSON olarak çözümle ve çözümlenen veriyi `jsonResponse` değişkenine ata
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        //ASYNC
                        //// Ana iş parçacığında (UI iş parçacığında) çalışan bir asenkron blok oluşturarak, `jsonResponse` değişkenini yazdırır.
                        DispatchQueue.main.async {
                            // print(jsonResponse) : console'a yazar
                            if let rates = jsonResponse ["rates"] as? [String: Any] {
                                if let cad = rates["CAD"] as? Double {
                                    self.cadLabel.text = "CAD: " + String(cad)
                                }
                                
                                if let chf = rates["CHF"] as? Double {
                                    self.chfLabel.text = "CHF: " + String(chf)
                                }
                                
                                if let gbp = rates["GBP"] as? Double {
                                    self.gbpLabel.text = "GBP: " + String(gbp)
                                }
                                
                                if let jpy = rates["JPY"] as? Double {
                                    self.jpyLabel.text = "JPY: " + String(jpy)
                                }
                                
                                if let usd = rates["USD"] as? Double {
                                    self.usdLabel.text = "USD: " + String(usd)
                                }
                                
                                if let tryl = rates["TRY"] as? Double {
                                    self.tryLabel.text = "TRY: " + String(tryl)
                                }
                            }
                        }
                    } catch {
                        print("error")
                    }
                }
            }
        }
        task.resume() // task'i başlatıyoruz.
    }
}

