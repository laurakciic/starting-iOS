//
//  ViewController.swift
//  P27_CoreGraphics
//
//  Created by Laura on 31.08.2022..
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    var currentDrawType = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        drawRectange()
    }

    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 5 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            drawRectange()
        
        case 1:
            drawCircle()
        
        case 2:
            drawCheckerbord()
        default:
            break
        }
    }
    
    func drawRectange() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))      // canvas 512x512 points, also stores info how we want do draw
        
        let image = renderer.image { ctx in                                                // context parameter
            // drawing code
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512)
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)                                                 // 10 point border around rectangle, centered on the edge of rect, 5 points inside, 5 points outside
            
            ctx.cgContext.addRect(rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)                                     // fill rectangle and draw border
        }
        
        imageView.image = image                                                            // put rendered image in imageView on UIView
    }
    
    func drawCircle() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))      // canvas 512x512 points, also stores info how we want do draw
        
        let image = renderer.image { ctx in                                                // context parameter
            // drawing code
            let rectangle = CGRect(x: 0, y: 0, width: 512, height: 512).insetBy(dx: 5, dy: 5)   // bring in by 5 points on every edge
            
            ctx.cgContext.setFillColor(UIColor.red.cgColor)
            ctx.cgContext.setStrokeColor(UIColor.black.cgColor)
            ctx.cgContext.setLineWidth(10)                                                 // 10 point border around circle, centered on the edge of rect, 5 points inside, 5 points outside
            
            ctx.cgContext.addEllipse(in: rectangle)
            ctx.cgContext.drawPath(using: .fillStroke)                                     // fill circle and draw border
        }
        
        imageView.image = image                                                            // put rendered image in imageView on UIView
    }
    
    func drawCheckerbord() {
        let renderer = UIGraphicsImageRenderer(size: CGSize(width: 512, height: 512))      // canvas 512x512 points, also stores info how we want do draw
        
        let image = renderer.image { ctx in                                                // context parameter
            ctx.cgContext.setFillColor(UIColor.black.cgColor)
            
            for row in 0 ..< 8 {
                for col in 0 ..< 8 {
                    if (row + col) % 2 == 0 {                                              // % 2 == 0 -> .isMultiple(of: 2), if there's a square that should be colored black 
                        ctx.cgContext.fill(CGRect(x: col * 64, y: row * 64, width: 64, height: 64))
                    }
                }
            }
        }
        
        imageView.image = image                                                            // put rendered image in imageView on UIView
    }
}

