//
//  Annotation.swift
//  MapDemo
//
//  Created by Maxime Britto on 01/12/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit
import MapKit

class Annotation: MKPinAnnotationView {
    
    override var leftCalloutAccessoryView: UIView? {
        get {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let callOutController = storyboard.instantiateViewController(withIdentifier: "PinCallOut")
        let callOutView = callOutController.view
        return callOutView
        }
        set {
            
        }
        
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
