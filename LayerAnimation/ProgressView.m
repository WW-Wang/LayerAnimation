//
//  ProgressView.m
//  LayerAnimation
//
//  Created by zh.wang on 16/2/4.
//  Copyright © 2016年 WW-Wang. All rights reserved.
//

#import "ProgressView.h"

@interface ProgressView ()

@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, assign) CGFloat viewMaxWidth;

@end

@implementation ProgressView

- (void)drawRect:(CGRect)rect
{
    [self newProgressLayerWithFrame:rect];
}

- (void)newProgressLayerWithFrame:(CGRect)frame
{
    self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
    [self.progressLayer setCornerRadius:frame.size.height / 2];
    [self.progressLayer setBorderWidth:1.0f];
    [self.layer addSublayer:self.progressLayer];
    
    self.viewMaxWidth = frame.size.width;
}

- (void)setColor:(UIColor *)color
{
    self.progressLayer.backgroundColor = color.CGColor;
    [self.progressLayer setBorderColor:color.CGColor];
}

- (void)setProgress:(CGFloat)progress
{
    _progress = progress;
    
    if (progress <= 0) {
        self.progressLayer.frame = CGRectMake(0, 0, 0, self.frame.size.height);
    } else if (progress <= 1) {
        self.progressLayer.frame = CGRectMake(0, 0, self.viewMaxWidth * progress, self.frame.size.height);
    } else {
        self.progressLayer.frame = CGRectMake(0, 0, self.viewMaxWidth, self.frame.size.height);
    }
}

- (CALayer *)progressLayer
{
    if (!_progressLayer) {
        _progressLayer = [CALayer layer];
    }
    return _progressLayer;
}

@end
