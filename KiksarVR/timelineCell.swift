//
//  timelineCell.swift
//  KiksarVR
//
//  Created by Sumit Bangarwa on 11/18/19.
//  Copyright © 2019 krishna. All rights reserved.
//

import UIKit

class timelineCell: UITableViewCell {

    @IBOutlet var frndNmLbl: UILabel!
    @IBOutlet var timeLbl: UILabel!
    @IBOutlet var discLbl: UILabel!
    
    @IBOutlet var stckV: UIStackView!
    @IBOutlet var profileIMG: UIImageView!
    @IBOutlet var postIMG: UIImageView!
    var imgN = UIImageView()
    var seeMoreBtn = UIButton()
    let imgArr = ["like","comment","share"]
    let nameArr = ["Like"," Comment","Share"]
    var xOffset:CGFloat = 10
    
    override func awakeFromNib() {
        super.awakeFromNib()
   
        newsubView()
        subViewForBottom()

    }
    func newsubView() {
        imgN.frame = CGRect(x: (timeLbl.frame.width)-55, y: 5, width: 20, height: 20)
        imgN.image = UIImage(named:"notification")
        timeLbl.addSubview((imgN))
        seeMoreBtn.frame = CGRect(x: (discLbl.frame.width)/2-20, y: discLbl.frame.width/8, width: 100, height: 20)
        seeMoreBtn.backgroundColor = .white
        seeMoreBtn.setTitle("See More", for: .normal)
        seeMoreBtn.setTitleColor(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        discLbl.addSubview(seeMoreBtn)
        stckV.addBottomBorderWithColor(color: #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), width: 0.5)

    }
    func subViewForBottom() {
        
        for i in 0..<nameArr.count {
            let downBtn = UIButton()
            let btnImg = UIImageView()
            downBtn.frame = CGRect(x: xOffset, y: contentView.frame.height-50, width: contentView.frame.width/3, height: 30)
            btnImg.frame = CGRect(x: 10, y: 5, width: 20, height: 20)
            btnImg.image = UIImage(named: imgArr[i])
            downBtn.addSubview(btnImg)
            downBtn.titleLabel?.textAlignment = .left
            if i==1 {
                downBtn.titleLabel?.textAlignment = .center
                btnImg.frame = CGRect(x: 0, y: 5, width: 20, height: 20)

            }
            self.xOffset = self.xOffset
                + 5 + downBtn.frame.width
            downBtn.setTitle(nameArr[i], for: .normal)
            
            downBtn.setTitleColor(#colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1), for: .normal)
            
            contentView.addSubview(downBtn)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
extension UIView {

    
    func addBottomBorderWithColor(color: UIColor, width: CGFloat) {
        let border = CALayer()
        border.backgroundColor = color.cgColor
        border.frame = CGRect(x:0, y:self.frame.size.height - width, width:self.frame.size.width, height:width)
        self.layer.addSublayer(border)
}
}
