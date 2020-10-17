//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Rebecca Shi on 10/10/20.
//  Copyright © 2020 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {
    
    var favorited: Bool! = false;
    var tweet: NSDictionary!;
    var id : Int!;

    @IBOutlet weak var profileImage: UIImageView!
    
    @IBOutlet weak var username: UILabel!
    
    @IBOutlet weak var tweetContent: UILabel!
    
    @IBOutlet weak var retweetButton: UIButton!
    
    @IBOutlet weak var favButton: UIButton!
    
    @IBAction func retweet(_ sender: Any) {
    }
    
    
    @IBAction func favTweet(_ sender: Any) {
        let toBeFavorited = !favorited;
        if (toBeFavorited) {            TwitterAPICaller.client?.favoriteTweet(tweetId: id, success: {
                self.setFavorite(toBeFavorited)
            }, failure: { (error) in
                print("Favorite did not succeed for tweet \(self.id)")
            })
        } else {
            TwitterAPICaller.client?.unfavoriteTweet(tweetId: id, success: {
                self.setFavorite(toBeFavorited)
            }, failure: { (error) in
                print("Unfavorite did not succeed for tweet \(self.id)")
            })
        }
    }
    
    func setFavorite(_ toBeFavorited: Bool) {
        favorited = toBeFavorited
        if (favorited) {
            favButton.setImage(UIImage(named: "favor-icon-red"), for: UIControl.State.normal)
        } else {
            favButton.setImage(UIImage(named: "favor-icon"), for: UIControl.State.normal)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
