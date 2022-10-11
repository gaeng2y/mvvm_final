//
//  ViewController.swift
//  UTCTime
//
//  Created by Chiwon Song on 2021/05/31.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {
    @IBOutlet var datetimeLabel: UILabel!

    @IBAction func onYesterday() {
        viewModel.moveDay(day: -1)
    }

    @IBAction func onNow() {
        viewModel.reload()
    }

    @IBAction func onTomorrow() {
        viewModel.moveDay(day: 1)
    }
    
    let viewModel = ViewModel()
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        viewModel.onUpdated = { [weak self] in
//            DispatchQueue.main.async {
//                self?.datetimeLabel.text = self?.viewModel.dateTimeString
//            }
//        }
        
        viewModel.dateTimeString
//            .observe(on: MainScheduler.instance)
//            .subscribe { str in
//                self.datetimeLabel.text = str
//            }
            .bind(to: datetimeLabel.rx.text)
            .disposed(by: disposeBag)
        
        viewModel.reload()
    }
}
