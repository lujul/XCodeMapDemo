//
//  ViewController.swift
//  MapDemo
//
//  Created by Maxime Britto on 01/12/2016.
//  Copyright © 2016 mbritto. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var ui_mapView: MKMapView!
    var locManager:CLLocationManager!

    @IBOutlet weak var ui_toolbar: UIToolbar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        locManager = CLLocationManager()
        locManager.delegate = self
        let status = CLLocationManager.authorizationStatus()
        
        locManager.requestWhenInUseAuthorization()
        CLLocationManager.locationServicesEnabled()
        
        let button = MKUserTrackingBarButtonItem(mapView: ui_mapView)
        ui_toolbar.items?.append(button)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        ui_mapView.delegate = self
        
        
        Timer.scheduledTimer(withTimeInterval: 3.0, repeats: false, block: {(Timer) -> Void in
            let region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 43.6, longitude: 3.8), span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1))
            self.ui_mapView.setRegion(region, animated: true)
        })
        
        let poi = MKPointAnnotation()
        poi.coordinate = CLLocationCoordinate2D(latitude: 43.6, longitude: 3.8)
        poi.title = "Montpellier"
        poi.subtitle = "Ville ensoleillée"
        ui_mapView.addAnnotation(poi)
        
        
        
        
    }
    
    
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        var view:MKPinAnnotationView! = mapView.dequeueReusableAnnotationView(withIdentifier: "city-poi") as? MKPinAnnotationView
        if view == nil {
            view = MKPinAnnotationView(annotation: annotation, reuseIdentifier: "city-poi")
        }
        
        let callOutController = self.storyboard!.instantiateViewController(withIdentifier: "PinCallOut")
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 60))
        label.text = "Salut"
        label.backgroundColor = UIColor.red
        view.rightCalloutAccessoryView = label
        //view.leftCalloutAccessoryView = callOutController.view
        view.canShowCallout = true
        view.animatesDrop = true
        
        let gpsButton:UIButton = UIButton(type: UIButtonType.custom)
        gpsButton.frame = CGRect(x: 0, y: 0, width: 54, height: 54)
        gpsButton.backgroundColor = UIColor.red
        gpsButton.titleLabel?.textColor = UIColor.white
        gpsButton.setTitle("GPS", for: UIControlState.normal)
        
        view.rightCalloutAccessoryView = gpsButton
        return view
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        print("Click on callout")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

