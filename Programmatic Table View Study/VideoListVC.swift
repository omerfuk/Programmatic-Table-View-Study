//
//  VideoListVC.swift
//  Programmatic Table View Study
//
//  Created by Ömer Faruk Kılıçaslan on 16.06.2022.
//

import UIKit

class VideoListVC: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []
    
    struct Cells {
        static let videoCell = "VideoCell"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Omerfuk's Videos"
        navigationController?.navigationBar.prefersLargeTitles = true
        videos = fetchData()
        
        configureTableView()
        
        
    }
 
    func configureTableView() {
        //Add tableview to view
        view.addSubview(tableView)
        //set delegates
        setTableViewDelegates()
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: Cells.videoCell)
        //set constraints
        tableView.pin(to: view)
    }
    
    func setTableViewDelegates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
    

}


extension VideoListVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.videoCell) as! VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        
        return cell
    }
}

extension VideoListVC{
    
    func fetchData() -> [Video] {
        
        let video1 = Video(image: Images.manzara1, title: "Manzaralı günler")
        let video2 = Video(image: Images.manzara2, title: "Manzaralı güller")
        let video3 = Video(image: Images.manzara3, title: "Manzaralı zamanlar")
        let video4 = Video(image: Images.manzara4, title: "Manzaralı hayatlar")
        let video5 = Video(image: Images.manzara5, title: "Manzaralı günler")
        
        return [video1,video2,video3,video4,video5]
    }
}
