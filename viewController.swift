//
//  ViewController.swift
//  workshop2
//
//  Created by Billy Farroll on 15/10/2015.
//  Copyright © 2015 Billy Farroll. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var MapView: MKMapView! 
    
   
    @IBOutlet weak var LatLabel: UILabel!
    @IBOutlet weak var LonLabel: UILabel!
    
    
    
    var lat:Float = 0.0
    var long:Float = 0.0
    var geocoder = CLGeocoder()
    
    
    @IBAction func LatSlider(sender: UISlider) {
        lat = sender.value
        LatLabel.text = "\(lat)"
    }
    
    
    @IBAction func LonSlider(sender: UISlider) {
        
        long = sender.value
        LonLabel.text = "\(long)"
    }
    
    
    
    @IBAction func GoButton(sender: UIButton) {
        
        let location = CLLocation(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        reverseGeocode(location)
        
        let location2d = CLLocationCoordinate2D(latitude: CLLocationDegrees(lat), longitude: CLLocationDegrees(long))
        MapView.setCenterCoordinate(location2d, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location2d
        annotation.title = "Hey"
        MapView.addAnnotation(annotation)
        MapView.selectAnnotation(annotation, animated: true)
        
        
    }
    
    
    func reverseGeocode(location: CLLocation) {
        if !geocoder.geocoding {
            geocoder.reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
                if error != nil {
                    print("Reverse geocoder failed with error" + error!.localizedDescription)
                    return
                }
                if placemarks!.count > 0 {
                    if let placemark = placemarks!.first {
                        print(placemark.country)
                    }
                } else {
                    print("Problem with the data received from geocoder")
                }
            })
        } else {
            print("Geocoder is already geocoding")
            return
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
            }


}

