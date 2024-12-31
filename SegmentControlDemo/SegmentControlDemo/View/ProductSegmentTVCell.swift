//
//  ProductSegmentTVCell.swift
//  SegmentControlDemo
//
//  Created by Loyltwo3ks on 30/11/24.
//

import UIKit

class ProductSegmentTVCell: UITableViewCell {
    
    @IBOutlet weak var productSegmentView: UIView!
    @IBOutlet weak var productView: UIView!
    @IBOutlet weak var productImg: UIImageView!
    @IBOutlet weak var productTitleLbl: UILabel!
    @IBOutlet weak var pointsLbl: UILabel!
    @IBOutlet weak var addToCartBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.productSegmentTVCell_Configure()
        
    }
    
    func productSegmentTVCell_Configure() {
        self.productSegmentView.layer.cornerRadius = 10
        self.productView.layer.cornerRadius = 6
        self.addToCartBtn.layer.cornerRadius = 8
    }

   
    
}
