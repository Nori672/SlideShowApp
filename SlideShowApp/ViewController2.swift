//
//  ViewController2.swift
//  SlideShowApp
//
//  Created by Norihiro.Nakano on 2020/11/25.
//  Copyright © 2020 Norihiro.Nakano. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    @IBOutlet weak var closeUPImage: UIImageView!
    var Image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        closeUPImage.image = Image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
