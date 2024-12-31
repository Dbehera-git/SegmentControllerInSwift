//
//  ViewController.swift
//  SegmentControlDemo
//
//  Created by Loyltwo3ks on 30/11/24.
//

import UIKit

class SegmentControlVC: UIViewController {
    
    
    @IBOutlet weak var productSegment: UISegmentedControl!
    @IBOutlet weak var productTV: UITableView!
    
    var allProductList: [SegmentControlModel] =
                        [
                            SegmentControlModel( image: "Img1", title: "Boat 225 Bluetooth Headset with MIC", point: "200"),
                            SegmentControlModel( image: "Img2", title: "Boat 225 Bluetooth Headset with MIC", point: "100"),
                            SegmentControlModel( image: "Img3", title: "Boat 225 Bluetooth Headset with MIC", point: "1000"),
                            SegmentControlModel( image: "Img4", title: "Boat 225 Bluetooth Headset with MIC", point: "50"),
                            SegmentControlModel( image: "Img2", title: "Boat 225 Bluetooth Headset with MIC", point: "350")
                        ]
    var electronicProductList: [SegmentControlModel] =
                         [
                            SegmentControlModel( image: "Img4", title: "Boat 225 Bluetooth Headset with MIC", point: "500"),
                            SegmentControlModel( image: "Img2", title: "Boat 225 Bluetooth Headset with MIC", point: "250"),
                            SegmentControlModel( image: "Img1", title: "Boat 225 Bluetooth Headset with MIC", point: "2000"),
                            SegmentControlModel( image: "Img3", title: "Boat 225 Bluetooth Headset with MIC", point: "320")
                         ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.productSegment.backgroundColor = #colorLiteral(red: 0.9226121306, green: 0, blue: 0.2248688042, alpha: 1)
        self.productTV.delegate = self
        self.productTV.dataSource = self
        self.productTV.register(UINib(nibName: "ProductSegmentTVCell", bundle: nil), forCellReuseIdentifier: "ProductSegmentTVCell")
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.productTV.showsVerticalScrollIndicator = false
        self.productTV.showsHorizontalScrollIndicator = false
    }

    @IBAction func didTapProductSegment(_ sender: UISegmentedControl) {
        switch productSegment.selectedSegmentIndex {
           case 0:
            self.productTV.reloadData()
           case 1:
            self.productTV.reloadData()
          default:
            break
        }
        
    }
    
}
extension SegmentControlVC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch productSegment.selectedSegmentIndex {
        case 0:
            return allProductList.count
        case 1:
            return electronicProductList.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch productSegment.selectedSegmentIndex {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSegmentTVCell") as? ProductSegmentTVCell
            guard let cell else {
                fatalError("No Data Found")
            }
            let productListDetail = allProductList[indexPath.row]
            cell.productImg.image = UIImage(named: productListDetail.image)
            cell.pointsLbl.text = productListDetail.point
            cell.productTitleLbl.text = productListDetail.title
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSegmentTVCell") as? ProductSegmentTVCell
            guard let cell else {
                fatalError("No Electronics Data Found")
            }
            let productListDetail = electronicProductList[indexPath.row]
            cell.productImg.image = UIImage(named: productListDetail.image)
            cell.pointsLbl.text = productListDetail.point
            cell.productTitleLbl.text = productListDetail.title
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "ProductSegmentTVCell") as? ProductSegmentTVCell
            guard let cell else {
                fatalError("No Data Found")
            }
            return cell
        }
    }
    
    
}

struct SegmentControlModel {
    let image: String
    let title: String
    let point: String
}
