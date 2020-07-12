//
//  UIImage + extention.swift
//  Калинин
//
//  Created by Кирилл on 12.07.2020.
//  Copyright © 2020 Кирилл. All rights reserved.
//

import UIKit

extension UIImage {
    func tinted() -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        defer { UIGraphicsEndImageContext() }
        for _ in 0...80000{
            let rand = Int.random(in: 0...Int(size.width))
            let ran = Int.random(in: 0...Int(size.height))
            drawCircular(center: CGPoint(x: rand, y: ran))
        }
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    private func drawCircular(center:CGPoint){
        let radius = 0.5
        let path = UIBezierPath(arcCenter: center, radius: CGFloat(radius), startAngle: 0, endAngle: 2 * CGFloat.pi, clockwise: false)
        path.lineWidth = 0.25
        let color = UIColor.white
        color.setFill()
        path.fill()
    }
}
