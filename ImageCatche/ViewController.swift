//
//  ViewController.swift
//  ImageCatche
//
//  Created by VinuBolt on 28/12/19.
//  Copyright © 2019 Vinu Organisation. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testImage: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ImageCatcheHandler.loadImagesUsingCatcheWith(URLString: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png") { (image) in
            self.testImage.image = image
        }
    }
    @IBAction func refresh(_ sender: Any) {        ImageCatcheHandler.loadImagesUsingCatcheWith(URLString: "https://homepages.cae.wisc.edu/~ece533/images/airplane.png") { (image) in
            self.testImage.image = image
        }
    }
    

}

