//
//  ViewController.swift
//  InteractiveStoryApp
//
//  Created by ivan ivanov on 01/12/2018.
//  Copyright © 2018 ivan ivanov. All rights reserved.
//

import UIKit

enum AdventureError: Error {
    case nameNotProvided
}
class ViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure"{
            do{
                if let name = nameTextField.text {
                    if name == ""{
                        throw AdventureError.nameNotProvided
                    }else {
                        guard let pageController = segue.destination as? PageController else{
                            return
                        }
                        pageController.page = Adventure.story(withName: name)
                    }
                }
            }catch AdventureError.nameNotProvided {
                // Display Alert to let the users know they must enter name
                let alertController = UIAlertController(title: "Name not provided", message: "Provide a name to start the story", preferredStyle: .alert)
                
                let action = UIAlertAction(title: "OK", style: .default, handler: nil)
                alertController.addAction(action)
                
                present(alertController, animated: true, completion: nil)
            }catch let error {
                fatalError("\(error.localizedDescription)")
            }

          
        }
    }


}

