//
//  ViewController.swift
//  RandomPhoto
//
//  Created by Tareq on 22/5/21.
//

import UIKit

class ViewController: UIViewController {
    private let backgroundColors : [UIColor] = [
        .systemPink,
        .systemYellow,
            .systemRed,
        .systemBlue,
        .systemTeal,
        .systemGray
    ]
    
    private let imageView : UIImageView = {
        let imageview = UIImageView()
        
        imageview.contentMode = .scaleAspectFill
        
        imageview.backgroundColor = .white
        
        return imageview
    }()
    
    
    private let button : UIButton = {
       
        let button =  UIButton()
        
        button.backgroundColor = .systemYellow
        
        button.setTitle("Fetch next Image", for: .normal)
        
        button.setTitleColor(.black, for: .normal)
        
        return button
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.backgroundColor = .systemPink
        
        view.addSubview(imageView)
        imageView.frame = CGRect(x: 0, y: 0, width: 350, height: 350 )
        imageView.center = view.center
        
        view.addSubview(button)
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        getRandomPhoto()
    }
    
   @objc func didTapButton()  {
    view.backgroundColor = backgroundColors.randomElement()
   
    getRandomPhoto()
    
    }
    
    override func viewDidLayoutSubviews() {
        button.frame = CGRect(x: 20, y: view.frame.height - 50 - view.safeAreaInsets.bottom, width: view.frame.width - 40, height: 55)
       
    }
    func  getRandomPhoto() {
        button.isEnabled = false
        button.alpha = 0
        DispatchQueue.main.asyncAfter(deadline: .now() + 1 ) {
            let urlStr = "https://source.unsplash.com/random"
            
            let url = URL(string: urlStr)!
            
            guard let data = try? Data(contentsOf: url) else{
                return
            }
            self.imageView.image = UIImage(data: data)
            
            self.button.isEnabled    = true
            self.button.alpha = 1
        }
        
        
     
    }


}

