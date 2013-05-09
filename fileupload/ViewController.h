//
//  ViewController.h
//  fileupload
//
//  Created by Mohit Jain on 5/8/13.
//  Copyright (c) 2013 Compuware. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MediaPlayer/MediaPlayer.h>
@interface ViewController : UIViewController {
     NSMutableData *data;
}

@property(nonatomic,strong)IBOutlet UIImageView *img;
- (IBAction)playVideo:(id)sender;
@property (nonatomic, strong) MPMoviePlayerController *moviePlayer;

@end
