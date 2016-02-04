//
//  ViewController.m
//  LayerAnimation
//
//  Created by zh.wang on 16/2/4.
//  Copyright © 2016年 WW-Wang. All rights reserved.
//

#import "ViewController.h"
#import "ProgressView.h"
#import <SDWebImageManager.h>

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet ProgressView *progressView;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (IBAction)downloadImage:(id)sender
{
    SDWebImageDownloader *downloader = [SDWebImageDownloader sharedDownloader];
    [downloader downloadImageWithURL:[NSURL URLWithString:@"https://camo.githubusercontent.com/e80430f344c68a6c91dd755b11130ba23a091e29/687474703a2f2f7777772e726573756d657461726765742e636f6d2f626c6f672f77702d636f6e74656e742f75706c6f6164732f323031332f30362f6261642d696e746572766965772e6a7067"]
                             options:0
                            progress:^(NSInteger receivedSize, NSInteger expectedSize) {
                                [self.progressView setProgress:receivedSize / expectedSize];
                                NSLog(@"receivedSize %ld, expectedSize %ld", (long)receivedSize, (long)expectedSize);
                            }
                           completed:^(UIImage *image, NSData *data, NSError *error, BOOL finished) {
                               if (image && finished) {
                                   // do something with image
                               }
                           }];
}

@end
