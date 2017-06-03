//
//  DBAssetImageView.m
//  DBAttachmentPickerControllerExample
//
//  Created by Denis Bogatyrev on 30.03.16.
//  Copyright © 2016 Denis Bogatyrev. All rights reserved.
//

@import Photos;
#import "DBAssetImageView.h"
#import "UIImage+DBAssetIcons.h"

static const CGFloat kDefaultGradientHeight = 24.f;
static const CGFloat kDefaultMediaTypeIconOffset = 4.f;
static const CGSize kDefaultMediaTypeIconSize = {16.f, 16.f};

@interface DBAssetImageView ()

@property (strong, nonatomic) CAGradientLayer *gradient;
@property (strong, nonatomic) UIImageView *mediaTypeImageView;

@end

@implementation DBAssetImageView

- (void)awakeFromNib {
    [super awakeFromNib];

    self.mediaTypeImageView = [[UIImageView alloc] init];
    [self addSubview:self.mediaTypeImageView];
    
    self.gradient = [CAGradientLayer layer];
    self.gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[[UIColor blackColor] colorWithAlphaComponent:.75f] CGColor], nil];
}

- (void)configureWithAssetMediaType:(PHAssetMediaType)mediaType subtype:(PHAssetMediaSubtype)mediaSubtype {
    UIImage *iconImage = nil;
    if (mediaSubtype & PHAssetMediaSubtypeVideoHighFrameRate) {
        iconImage =[UIImage imageOfVideoHighFrameRateIcon];
    } else if (mediaSubtype & PHAssetMediaSubtypeVideoTimelapse) {
        iconImage =[UIImage imageOfVideoTimelapseIcon];
    } else if (mediaSubtype == PHAssetMediaSubtypePhotoPanorama) {
        iconImage =[UIImage imageOfSmartAlbumPanoramasIcon];
    } else if (mediaType == PHAssetMediaTypeVideo) {
        iconImage =[UIImage imageOfVideoIcon];
    }

    self.mediaTypeImageView.image = iconImage;
    if (iconImage) {
        [self.layer insertSublayer:self.gradient atIndex:0];
    } else {
        [self.gradient removeFromSuperlayer];
    }
}

- (void)configureCollectionSubtype:(PHAssetCollectionSubtype)collectionSubtype {
    UIImage *iconImage = nil;
    switch (collectionSubtype) {
        case PHAssetCollectionSubtypeSmartAlbumVideos:
            iconImage =[UIImage imageOfSmartAlbumVideosIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumPanoramas:
            iconImage =[UIImage imageOfSmartAlbumPanoramasIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumFavorites:
            iconImage =[UIImage imageOfSmartAlbumFavoritesIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumSlomoVideos:
            iconImage =[UIImage imageOfSmartAlbumSlomoVideosIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumTimelapses:
            iconImage =[UIImage imageOfSmartAlbumTimelapsesIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumSelfPortraits:
            iconImage =[UIImage imageOfSmartAlbumSelfPortraitsIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumBursts:
            iconImage =[UIImage imageOfSmartAlbumBurstsIcon];
            break;
        case PHAssetCollectionSubtypeSmartAlbumScreenshots:
            iconImage =[UIImage imageOfSmartAlbumScreenshotsIcon];
            break;
        default:
            break;
    }
    
    self.mediaTypeImageView.image = iconImage;
    if (iconImage) {
        [self.layer insertSublayer:self.gradient atIndex:0];
    } else {
        [self.gradient removeFromSuperlayer];
    }
}

- (void)layoutSubviews {
    CGSize iconSize = kDefaultMediaTypeIconSize;
    self.mediaTypeImageView.frame = CGRectMake(kDefaultMediaTypeIconOffset, CGRectGetHeight(self.bounds) - iconSize.height - kDefaultMediaTypeIconOffset, iconSize.width, iconSize.height);
    self.gradient.frame = CGRectMake(.0f, CGRectGetHeight(self.bounds) - kDefaultGradientHeight, CGRectGetWidth(self.bounds), kDefaultGradientHeight);
}


@end
