//
//  ViewController.swift
//  SlideShowApp
//
//  Created by Norihiro.Nakano on 2020/11/23.
//  Copyright © 2020 Norihiro.Nakano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    
    var nowImage:Int = 0
    
    var animals:[UIImage] = [
        UIImage(named: "cat")!,
        UIImage(named: "seal")!,
        UIImage(named: "dog")!
    ]
    
    var timer:Timer!
    
    func displayImage() {
        if nowImage < 0{
            nowImage = animals.count - 1
        }
        if nowImage > animals.count - 1{
            nowImage = 0
        }
        let imageArray = animals[nowImage]
        imageView.image = imageArray
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let image = animals[nowImage]
        imageView.image = image
    }
    
    @objc func slideImage(_timer:Timer){
        nowImage += 1
        if nowImage == animals.count {
            nowImage = 0
        }
        imageView.image = animals[nowImage]
    }

    @IBAction func backButton(_ sender: Any) {
        nowImage -= 1
        displayImage()
    }
    
    
    @IBAction func startStop(_ sender: Any) {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(slideImage(_timer:)), userInfo: nil, repeats: true)
            slideButton.setTitle("停止", for: .normal)
            backButton.isEnabled = false
            nextButton.isEnabled = false
        }else{
            timer.invalidate()
            timer = nil
            slideButton.setTitle("再生", for: .normal)
            backButton.isEnabled = true
            nextButton.isEnabled = true
        }
        
    }

    @IBAction func nextButton(_ sender: Any) {
        nowImage += 1
        displayImage()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController2: ViewController2 = segue.destination as! ViewController2
        
        viewController2.Image = animals[nowImage]
    }
    
    @IBAction func unwind(_ unwindSegue: UIStoryboardSegue) {
        
        // Use data from the view controller which initiated the unwind segue
    }

}

