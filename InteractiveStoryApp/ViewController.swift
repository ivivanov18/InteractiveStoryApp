//
//  ViewController.swift
//  InteractiveStoryApp
//
//  Created by ivan ivanov on 01/12/2018.
//  Copyright © 2018 ivan ivanov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "startAdventure"{
            guard let pageController = segue.destination as? PageController else{
                return
            }
            pageController.page = Adventure.story
        }
    }


}

