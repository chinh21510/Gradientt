//
//  ViewController.swift
//  Gradient
//
//  Created by Chinh Dinh on 1/27/21.
//  Copyright © 2021 Chinh Dinh. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet weak var gradientCollectionView: UICollectionView!
    
    
    var gradientLayer: CAGradientLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configCollectionView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setGradientBackground(sender: gradientCollectionView, colorOne: .red, colorTwo: .yellow)
        super.viewDidAppear(animated)
    }
    func configCollectionView() {
        gradientCollectionView.dataSource = self
        gradientCollectionView.delegate = self
        gradientCollectionView.register(UINib(nibName: "DemoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "DemoCollectionViewCell")
    }
    
    func setGradientBackground(sender: UICollectionView, colorOne: UIColor, colorTwo: UIColor){
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 1.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
//        gradientLayer.frame = sender.bounds
//        sender.layer.addSublayer(gradientLayer)
        
        let gradientBackgroundColors = [colorOne.cgColor, colorTwo.cgColor]
               
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = gradientBackgroundColors
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
               
        gradientLayer.frame = sender.bounds
               
        let backgroundView = UIView(frame: sender.bounds)
        backgroundView.layer.insertSublayer(gradientLayer, at: 0)
        sender.backgroundView = backgroundView
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = gradientCollectionView.dequeueReusableCell(withReuseIdentifier: "DemoCollectionViewCell", for: indexPath)
        if let cell = cell as? DemoCollectionViewCell {
            cell.backgroundColor = .clear
            cell.layoutIfNeeded()
            
            let hole = cell.colorView.frame.integral
            cell.setMask(hole: hole, view: cell.frontView)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width / 2, height: 280)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
