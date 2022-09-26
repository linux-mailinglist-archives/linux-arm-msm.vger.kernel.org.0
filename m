Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C592C5E9900
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 07:51:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229561AbiIZFvi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 01:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233111AbiIZFvf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 01:51:35 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3F44222B3
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 22:51:33 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id a80so5629374pfa.4
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Sep 2022 22:51:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=JuhOks1hQfFo95ag4lKfeQ7gstLas2WjFXJVZ4xzLZI=;
        b=R0BqlZxMW7iRaSdnB9Nub7ZXZ8vjjcREkB7ZSCZl6WoRHdygEqJ3PVhGo0HcDhM+VB
         JBqf9BgM86J2nku8ZO9no1RIPMth1JhaoFQD3uz8x9wGvrte3dFK6l9he4mA+7hBMR4x
         M8URu3CKkCm+yPJSF4/IQHBrP8baTw8tc9RAM0aa1U3Q3XYg0cA2GjLFxzOGW01n89lM
         2nSrSIJ67eXNwBwt3ohM05Skwe5X+KatXZqcFv4NanNKu07gYnIytzyQWdkokSFMh7Uq
         2NheVLPAO26G3C2m+p8qMWvbgX+oyjKMAH0cGVzBlvBfLtG8AvSdXawnoM/hTlccjOlr
         gbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=JuhOks1hQfFo95ag4lKfeQ7gstLas2WjFXJVZ4xzLZI=;
        b=jV5+9Hh6JobqVqeoVCGjoQjpdxowtfGE4Dpn0wDkOWVobjVgFXxx8+WB7vtsygml9D
         CDTs5YfO72tKw2j+X40mmZkLQ3w10OmXq69q0hS5oMriKDr5QGuPWyHK3hH7J9PsGwXl
         KAl942EKIhC/0Nsk3Y8qa1afYF23EVd+X5P1xnQ1a/mnNg3r9TPN8g4gu6ZEbv3f9nC7
         NaL6EFzXZIwJ3fbJiDcZVCD7ZIVJzXpy1q64WBeOYR3aGXz47rkB1gQHMArAD8Y6CHHo
         4bNjLoOwF3wGU/rTzww8AlD2EQKNvrqGP38Fv+fS3CKLHKzdTnUs7OOQYEBj7Efka4tb
         CXzA==
X-Gm-Message-State: ACrzQf1Y64bvax3s7RkI4miojqAV2XWjBCpP2H0bMswCeHpxgJQ1GNZb
        pzz1uqgxpNqio9bZUpKAtOKypw==
X-Google-Smtp-Source: AMsMyM40BIaeAR066YrerNnWIYd15Ig6FFvztVRrDOjy/bTtUKL3TKZNhPyD/XV2f7zEXDhr1RLhlg==
X-Received: by 2002:a63:204a:0:b0:439:1802:dd99 with SMTP id r10-20020a63204a000000b004391802dd99mr18619064pgm.153.1664171493445;
        Sun, 25 Sep 2022 22:51:33 -0700 (PDT)
Received: from localhost ([122.172.85.153])
        by smtp.gmail.com with ESMTPSA id g189-20020a6252c6000000b0053e47dcfa32sm10990429pfb.155.2022.09.25.22.51.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Sep 2022 22:51:32 -0700 (PDT)
Date:   Mon, 26 Sep 2022 11:21:30 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Xuewen Yan <xuewen.yan@unisoc.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, rafael@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, di.shen@unisoc.com
Subject: Re: [PATCH] cpufreq: qcom-cpufreq-hw: Add cpufreq qos for LMh
Message-ID: <20220926055130.yr67653e52vyuutv@vireshk-i7>
References: <20220915090515.1660-1-xuewen.yan@unisoc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220915090515.1660-1-xuewen.yan@unisoc.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15-09-22, 17:05, Xuewen Yan wrote:
> Before update thermal pressure, the max cpufreq should be limited.
> Add QOS control for Lmh throttle cpufreq.
> 
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> ---
>  drivers/cpufreq/qcom-cpufreq-hw.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)

This doesn't apply cleanly over my tree anymore, can you please rebase and
resend ?

git://git.kernel.org/pub/scm/linux/kernel/git/vireshk/pm.git cpufreq/arm/linux-next

-- 
viresh
