//
//  ViewController.swift
//  Simple MapView
//
//  Created by D7702_09 on 2018. 6. 7..
//  Copyright © 2018년 lse. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {

    @IBOutlet weak var MKMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 위도, 경도 설정
        // DIT 부산광역시 부산진구 양정동 429-19
        // 35.165973, 129.072597
        let loc = CLLocationCoordinate2D(latitude: 35.165973, longitude: 129.072597)
        
        // 반경
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        
        // region
        let region = MKCoordinateRegion(center: loc, span: span)
        
        // Mapkit 에 설정
        MKMapView.setRegion(region, animated: true)
        
        // annotation(핀) 꼽기
        let anno = MKPointAnnotation()
        anno.coordinate = loc
        anno.title = "DIT 동의과학대학교"
        anno.subtitle = "고통이 있는곳"
        MKMapView.addAnnotation(anno)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

