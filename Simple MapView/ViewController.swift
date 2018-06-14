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
    var foodStoreNames = ["늘해랑", "번개반점", "아딸", "왕짜장", "토마토 도시락", "홍콩반점"]
    var foodStoreAddress = ["부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 418-282",
                            "부산광역시 부산진구 양정동 393-18",
                            "부산광역시 부산진구 양정1동 356-22",
                            "부산광역시 부산진구 양정1동 350-1",
                            "부산광역시 부산진구 양정동 353-38"]
    var i = 0
    
    //pin 의 배열 생성 및 초기화
    var annos = [MKPointAnnotation]()
    @IBOutlet weak var MKMapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // 위도, 경도 설정
        // DIT 부산광역시 부산진구 양정동 429-19
        // 35.165973, 129.072597
//        let loc = CLLocationCoordinate2D(latitude: 35.165973, longitude: 129.072597)
//
//        // 반경
//        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
//
//        // region
//        let region = MKCoordinateRegion(center: loc, span: span)
//
//        // Mapkit 에 설정
//        MKMapView.setRegion(region, animated: true)
//
//        // annotation(핀) 꼽기
//        let anno = MKPointAnnotation()
//        anno.coordinate = loc
//        anno.title = "DIT 동의과학대학교"
//        anno.subtitle = "고통이 있는곳"
//        MKMapView.addAnnotation(anno)
        
        // ------------- //
        
        //let addr = "부산광역시 부산진구 양정동 418-282"
        
        for item in foodStoreAddress{
            let geocoder = CLGeocoder()
            geocoder.geocodeAddressString(item) {
                (placemarks: [CLPlacemark]?, error: Error?) -> Void in
                if let myerror = error {
                    print(myerror)
                    return
                }
//                if let myPlacemarks = placemarks {
//                    let placemark = myPlacemarks[0]
//
//                } else {
//                    print("야 야야 없다")
//                }
                let myPlacemark = placemarks![0]
                
                if let loc = myPlacemark.location {
                    let anno = MKPointAnnotation()
                    anno.coordinate = loc.coordinate
                    anno.title = self.foodStoreNames[self.i]
                    anno.subtitle = self.foodStoreAddress[self.i]
                    self.i = self.i + 1
                    
                    //pin을 pin 배열에 추가
                    self.annos.append(anno)
                    self.MKMapView.addAnnotations(self.annos)
                    
                    //pin을 맵에 채워서 보여주기
                    self.MKMapView.showAnnotations(self.annos, animated: true)
                } else {
                    print("loc nil 발생 야 야야 에러났다")
                }
            }
        }
        
        
//        let geoCoder = CLGeocoder()
//
//        geoCoder.geocodeAddressString(addr) {
//            (placemarks: [CLPlacemark]?, error: Error?) -> Void in
//            if let error = error {
//                print(error)
//                return
//            }
//            if let myPlacemarks = placemarks {
//                let placemark = myPlacemarks[0]
//
//                //print(placemark.location?.coordinate)
//
//                let loc = placemark.location?.coordinate
//                let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.05)
//                let region = MKCoordinateRegion(center : loc!, span: span)
//                self.MKMapView.setRegion(region, animated: true)
//
//                let annotation = MKPointAnnotation()
//                annotation.coordinate = loc!
//                annotation.title = addr
//                annotation.subtitle = "힘들다"
//                self.MKMapView.addAnnotation(annotation)
//            }
//
//        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

