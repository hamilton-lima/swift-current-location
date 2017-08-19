//
//  ViewController.swift
//  MapDraft
//
//  Created by Hamilton Lima on 2017-08-19.
//  Copyright © 2017 Hamilton Lima. All rights reserved.
//
//  
//
// add to Info.plist
// - required device capabilities: gps, location-services
// - NSLocationWhenInUseUsageDescription
// - NSLocationAlwaysUsageDescription
//

import UIKit
import Foundation
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {

   
    @IBOutlet weak var map: MKMapView!

    var locationManager: CLLocationManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if (CLLocationManager.locationServicesEnabled())
        {
            locationManager = CLLocationManager()

            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.requestAlwaysAuthorization()
            locationManager.requestLocation()
            print("location services ENABLED.")
        } else {
            print("location services not enabled.")
        }
        
    }

    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: NSError){
        print("location services delegate call FAIL")
    }

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation])
    {
        print("location services delegate call", locations)
        
        let location = locations.first! as CLLocation
        print("location found", location)
        
        let center = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        self.map.setRegion(region, animated: true)
    }


}

