//
//  ImageCatcheHandler.swift
//  ImageCatche
//
//  Created by VinuBolt on 28/12/19.
//  Copyright © 2019 Vinu Organisation. All rights reserved.
//

import Foundation
import UIKit

class ImageCatcheHandler {
    static var imageCatche = NSCache<NSString, AnyObject>()
    
    static func loadImagesUsingCatcheWith(URLString urlString:String, completionHandler: @escaping(_ image: UIImage)-> Void) {
        let refreshImage = UIImage.init(named: "loading") ?? UIImage()//please give the default loading or placeholder image here
        
        if let isValidImage = self.imageCatche.object(forKey: urlString as NSString) as? UIImage {
            completionHandler(isValidImage)
            return
        } else {
            completionHandler(refreshImage) // return default loading or placeholder image here
        }
        if let url = URL.init(string: urlString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error?.localizedDescription as Any)
                } else {
                    DispatchQueue.main.async {
                        if let validData = data, let validImage = UIImage.init(data: validData) {
                            self.imageCatche.setObject(validImage, forKey: urlString as NSString)
                            completionHandler(validImage)
                        }
                    }
                }
            }.resume()
        } else {
            completionHandler(refreshImage) // return default loading or placeholder image here
            return

        }
    }
}
