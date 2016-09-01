//
//  FANNetworkAd.m
//  SharethroughSDK
//
//  Created by Mark Meyer on 8/19/16.
//  Copyright © 2016 Sharethrough. All rights reserved.
//

#import "FANNetworkAd.h"

#import <FBAudienceNetwork/FBAudienceNetwork.h>

@interface FANNetworkAd()

@property (nonatomic, strong) FBNativeAd *fbNativeAd;
@property (nonatomic, strong) FBAdChoicesView *adChoicesView;
@property (nonatomic, strong) FBMediaView *mediaView;

@end

@implementation FANNetworkAd

- (id)initWithFBNativeAd:(FBNativeAd *)nativeAd {
    self = [super init];
    if (self) {
        //    strAd.advertiser = nativeAd.?
        self.fbNativeAd = nativeAd;
        self.title = nativeAd.title;
        self.adDescription = nativeAd.body;
    }
    return self;
}

- (void)setThumbnailImageInView:(UIImageView *)imageView {
    _mediaView = [[FBMediaView alloc] initWithNativeAd:_fbNativeAd];
    _mediaView.frame = CGRectMake(0,0,CGRectGetWidth(imageView.frame), CGRectGetHeight(imageView.frame));
    imageView.image = [UIImage new];
    imageView.userInteractionEnabled = YES;
    [imageView addSubview:_mediaView];
}

- (void)registerViewForInteraction:(UIView<STRAdView> *)view withViewController:(UIViewController *)viewController {
    [self.fbNativeAd unregisterView];
    [self.fbNativeAd registerViewForInteraction:view withViewController:viewController];
    
    view.disclosureButton.hidden = YES;
    
    FBAdChoicesView *adChoicesView = [[FBAdChoicesView alloc] initWithNativeAd:_fbNativeAd];
    [view addSubview:adChoicesView];
    [adChoicesView updateFrameFromSuperview];
}

- (void) setAdLogoWithThumbnail: (UIImageView*) thumbnail
{
    //do nothing for now
}

-(NSString*) sponsoredBy
{
    return @"Promoted";
}

@end
