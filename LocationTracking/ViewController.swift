//
//  ViewController.swift
//  LocationTracking
//
//  Created by 김종현 on 2017. 10. 22..
//  Copyright © 2017년 김종현. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    @IBOutlet weak var myMapView: MKMapView!
    
    var locationManager: CLLocationManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestAlwaysAuthorization()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.startUpdatingLocation()
        
        // 지도에 현재 위치 마크를 보여줌
        myMapView.showsUserLocation = true
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let coor = manager.location?.coordinate
        print("latitute" + String(describing: coor?.latitude) + "/ longitude" + String(describing: coor?.longitude))
    }

}

