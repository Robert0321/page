//
//  ViewController.swift
//  page
//
//  Created by robert on 2022/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var bagImageView: UIImageView!
    @IBOutlet weak var bagPageControl: UIPageControl!
    @IBOutlet weak var bagSegment: UISegmentedControl!
    @IBOutlet weak var bagLabel: UILabel!
    
    //運用陣列
       let bagImages = ["FAUXSHEARLING","MATTEEFFECT","NYLONBUCKET"]
       let bagLabels = ["Tote bag with two inner compartments.","Long shoulder bag. Long tubular straps.","Minimalist leather crossbody bag"]
       //定義變數 顯示陣列的排序
       var selectNumber : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syncChange()
    }
    //同步改變
    func syncChange() {
        bagImageView.image = UIImage(named: bagImages[selectNumber])
        bagLabel.text = bagLabels[selectNumber]
        bagPageControl.currentPage = selectNumber
        bagSegment.selectedSegmentIndex = selectNumber
    }
    
    @IBAction func pageControl(_ sender: UIPageControl) {
        selectNumber = sender.currentPage
        if bagPageControl.currentPage == 0 {
            selectNumber = 0
            syncChange()
        }else if bagPageControl.currentPage == 1 {
            selectNumber = 1
            syncChange()
        }else{
            selectNumber = 2
            syncChange()
        }
    }
    
    @IBAction func segmentChange(_ sender: UISegmentedControl) {
        selectNumber = sender.selectedSegmentIndex
        if bagSegment.selectedSegmentIndex == 0 {
            selectNumber = 0
            syncChange()
        }else if bagSegment.selectedSegmentIndex == 1 {
            selectNumber = 1
            syncChange()
        }else{
            selectNumber = 2
            syncChange()
        }
        
    }
    
    @IBAction func prev(_ sender: Any) {
        if selectNumber == 0 {
        selectNumber = bagImages.count-1
        }else{
            selectNumber -= 1
        }
        syncChange()
    }
    
    @IBAction func next(_ sender: Any) {
        if selectNumber == bagImages.count-1 {
            selectNumber = 0
        }else{
            selectNumber += 1
        }
        syncChange()
    }
    
}

