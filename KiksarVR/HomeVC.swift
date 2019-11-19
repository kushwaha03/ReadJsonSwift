//
//  HomeVC.swift
//  KiksarVR
//
//  Created by Sumit Bangarwa on 11/18/19.
//  Copyright © 2019 krishna. All rights reserved.
//

import UIKit

class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
   
    
    @IBOutlet var feedTbl: UITableView!
    
    @IBOutlet var searchTxt: UITextField!
    var timelArr = [[String:Any]]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        feedTbl.allowsSelection = false
        setViewForTxt()
        readJson()
        
    }
    func setViewForTxt() {
        searchTxt.attributedPlaceholder = NSAttributedString(string: "Search",
                                                             attributes: [NSAttributedString.Key.foregroundColor:UIColor.white])
        searchTxt.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 25, height: searchTxt.frame.height))
        searchTxt.leftViewMode = .always
        let searchIcon = UIImageView()
        searchIcon.frame = CGRect(x: 5, y: 5, width: 20, height: 20)
        searchIcon.image = UIImage(named:"search")
        searchTxt.addSubview(searchIcon)
    }
    func readJson() {
        let url = Bundle.main.url(forResource: "input_ios", withExtension: "json")
        let data = NSData(contentsOf: url!)
        do {
            let object = try JSONSerialization.jsonObject(with: data! as Data, options: .allowFragments)
            if let dictionary = object as? [String: AnyObject] {
                if let Timeline = dictionary["timeline"] as? [[String:Any]] {
                    timelArr = Timeline
                    feedTbl.reloadData()
                }
            }
        } catch {
        }
    }

    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return timelArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! timelineCell
        if let name = timelArr[indexPath.row]["name"] as? String, let tm = timelArr[indexPath.row]["date"] as? String {
            print(name,tm)
        cell.frndNmLbl.text = name
          cell.timeLbl.text = tm
        }
        cell.discLbl.text = timelArr[indexPath.row]["discription"] as? String
        cell.profileIMG.image = UIImage(named: (timelArr[indexPath.row]["image"] as? String)!)
          cell.postIMG.image = UIImage(named: (timelArr[indexPath.row]["post_image"] as? String)!)
   
        let disc = cell.discLbl.text!
//        print(disc)
       let lines = disc.components(separatedBy: "\n")
        print(lines.count)
        cell.seeMoreBtn.isHidden = true
        if lines.count > 4 || disc.count > 80 {
            cell.seeMoreBtn.isHidden = false
        }
        return cell
        }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 580
    }
}
