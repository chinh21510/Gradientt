//
//  DemoCollectionViewCell.swift
//  Gradient
//
//  Created by Chinh Dinh on 2/3/21.
//  Copyright © 2021 Chinh Dinh. All rights reserved.
//

import UIKit

class DemoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var frontView: UIView!
    @IBOutlet weak var colorView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setMask(hole: CGRect, view: UIView){
        let path = UIBezierPath(rect: view.bounds)
        let pathWithRadius = UIBezierPath(roundedRect: hole, byRoundingCorners: [.allCorners], cornerRadii: CGSize(width: 6, height: 6))
        path.append(pathWithRadius)

        // Create a shape layer and cut out the intersection
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        mask.fillRule = CAShapeLayerFillRule.evenOdd
        // Add the mask to the view
        view.layer.mask = mask
    }
    
    
}
