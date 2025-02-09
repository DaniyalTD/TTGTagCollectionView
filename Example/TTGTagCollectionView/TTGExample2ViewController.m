//
//  TTGExample2ViewController.m
//  TTGTagCollectionView
//
//  Created by zekunyan on 15/12/29.
//  Copyright (c) 2019 zekunyan. All rights reserved.
//

#import <TTGTagCollectionView/TTGTagCollectionView.h>
#import "TTGExample2ViewController.h"

@interface TTGExample2ViewController () <TTGTagCollectionViewDelegate, TTGTagCollectionViewDataSource>
@property (weak, nonatomic) IBOutlet TTGTagCollectionView *tagCollectionView;
@property (weak, nonatomic) IBOutlet UILabel *logLabel;

@property (strong, nonatomic) NSMutableArray <UIView *> *tagViews;
@end

@implementation TTGExample2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    _tagCollectionView.delegate = self;
    _tagCollectionView.dataSource = self;
    _logLabel.adjustsFontSizeToFitWidth = YES;
    _tagViews = [NSMutableArray new];

    UIColor *backgroundColor1 = [UIColor colorWithRed:0.30 green:0.72 blue:0.53 alpha:1.00];
    UIColor *backgroundColor2 = [UIColor colorWithRed:0.10 green:0.53 blue:0.85 alpha:1.00];
    UIColor *backgroundColor3 = [UIColor colorWithRed:0.97 green:0.64 blue:0.27 alpha:1.00];
    
    [_tagViews addObject:[self newLabelWithText:@"AutoLayout" fontSize:14.0f textColor:[UIColor whiteColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button1" fontSize:18.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_1"]]];
    [_tagViews addObject:[self newLabelWithText:@"dynamically" fontSize:20.0f textColor:[UIColor whiteColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button2" fontSize:16.0f backgroundColor:backgroundColor3]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button3" fontSize:15.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_2"]]];
    [_tagViews addObject:[self newLabelWithText:@"the" fontSize:16.0f textColor:[UIColor blackColor] backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button4" fontSize:22.0f backgroundColor:backgroundColor2]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_3"]]];
    [_tagViews addObject:[self newLabelWithText:@"views" fontSize:12.0f
                                      textColor:[UIColor colorWithRed:0.21 green:0.29 blue:0.36 alpha:1.00]
                                backgroundColor:backgroundColor3]];
    [_tagViews addObject:[self newButtonWithTitle:@"Button5" fontSize:15.0f backgroundColor:backgroundColor1]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_4"]]];
    [_tagViews addObject:[self newImageViewWithImage:[UIImage imageNamed:@"bluefaces_4"]]];

    [_tagCollectionView reload];
}

#pragma mark - TTGTagCollectionViewDelegate

- (CGSize)tagCollectionView:(TTGTagCollectionView *)tagCollectionView sizeForTagAtIndex:(NSUInteger)index {
    return _tagViews[index].frame.size;
}

- (void)tagCollectionView:(TTGTagCollectionView *)tagCollectionView didSelectTag:(UIView *)tagView atIndex:(NSUInteger)index {
    _logLabel.text = [NSString stringWithFormat:@"Tap tag: %@, at: %ld", tagView.class, (long) index];
}

#pragma mark - TTGTagCollectionViewDataSource

- (NSUInteger)numberOfTagsInTagCollectionView:(TTGTagCollectionView *)tagCollectionView {
    return _tagViews.count;
}

- (UIView *)tagCollectionView:(TTGTagCollectionView *)tagCollectionView tagViewForIndex:(NSUInteger)index {
    return _tagViews[index];
}

#pragma mark - Private methods

- (UILabel *)newLabelWithText:(NSString *)text fontSize:(CGFloat)fontSize textColor:(UIColor *)textColor backgroundColor:(UIColor *)backgroudColor {
    UILabel *label = [UILabel new];

    label.font = [UIFont systemFontOfSize:fontSize];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = text;
    label.textColor = textColor;
    label.backgroundColor = backgroudColor;
    [label sizeToFit];
    label.layer.masksToBounds = YES;
    label.layer.cornerRadius = 4.0f;

    [self expandSizeForView:label extraWidth:12 extraHeight:8];

    return label;
}

- (UIButton *)newButtonWithTitle:(NSString *)title fontSize:(CGFloat)fontSize backgroundColor:(UIColor *)backgroudColor {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];

    button.titleLabel.font = [UIFont systemFontOfSize:fontSize];
    [button setTitle:title forState:UIControlStateNormal];
    button.backgroundColor = backgroudColor;
    [button sizeToFit];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 4.0f;

    [self expandSizeForView:button extraWidth:12 extraHeight:8];

    [button addTarget:self action:@selector(onTap:) forControlEvents:UIControlEventTouchUpInside];

    return button;
}

- (UIImageView *)newImageViewWithImage:(UIImage *)image {
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    [imageView sizeToFit];
    return imageView;
}

- (void)expandSizeForView:(UIView *)view extraWidth:(CGFloat)extraWidth extraHeight:(CGFloat)extraHeight {
    CGRect frame = view.frame;
    frame.size.width += extraWidth;
    frame.size.height += extraHeight;
    view.frame = frame;
}

#pragma mark - Action

- (void)onTap:(UIButton *)button {
    _logLabel.text = @"Tap tag button !";
}

@end
