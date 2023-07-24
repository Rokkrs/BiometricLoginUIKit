//
//  ViewController.swift
//  BiometricLoginUIKit
//
//  Created by Oscar Hooman on 24-07-23.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        authenticationWithTouchID()
        
        authenticationWithTouchID()
    }
    
    func authenticationWithTouchID() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "Identify yourself dude"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) {
                [weak self] success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        // algo
                        let ac = UIAlertController(title: "Todo tilino!", message: "You could not be verified; please try otra", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Ok", style: .default))
                        self?.present(ac, animated: true)
                    } else {
                        // error
                        let ac = UIAlertController(title: "Authentication failed fallo!", message: "You could not be verified; please try otra", preferredStyle: .alert)
                        ac.addAction(UIAlertAction(title: "Ok", style: .default))
                        self?.present(ac, animated: true)
                    }
                }
            }
        } else {
             // no biometry
            let ac = UIAlertController(title: "Biometry unaviable", message: "Your device is not configured for biometric", preferredStyle: .alert)
           ac.addAction(UIAlertAction(title: "Ok", style: .default))
            self.present(ac, animated: true)
        }
    }

}

