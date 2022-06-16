//
//  VideoCell.swift
//  Programmatic Table View Study
//
//  Created by Ömer Faruk Kılıçaslan on 16.06.2022.
//

import UIKit

class VideoCell: UITableViewCell {
    
    var videoImageView = UIImageView()
    var videoTitleLabel = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //constructor method.
        addSubview(videoImageView)
        addSubview(videoTitleLabel)
        
        configureImageView()
        configureTitleLabel()
        
        setImageConstraints()
        setTitleLabelConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func set(video: Video) {
        videoImageView.image = video.image
        videoTitleLabel.text = video.title
    }
    
    func configureImageView() {
        videoImageView.layer.cornerRadius = 10
        videoImageView.clipsToBounds = true
        
        
    }
    
    
    func configureTitleLabel() {
        videoTitleLabel.numberOfLines = 0
        videoTitleLabel.adjustsFontSizeToFitWidth = true
        
    }
    
    
    func setImageConstraints () {
        videoImageView.translatesAutoresizingMaskIntoConstraints = false
        videoImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        videoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12).isActive = true
        videoImageView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoImageView.widthAnchor.constraint(equalTo: videoImageView.heightAnchor, multiplier: 16/9).isActive = true
        
    }
    
    func setTitleLabelConstraints() {
        
        videoTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        videoTitleLabel.leadingAnchor.constraint(equalTo: videoImageView.trailingAnchor, constant: 12).isActive = true
        videoTitleLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        videoTitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12).isActive = true
    }

}
