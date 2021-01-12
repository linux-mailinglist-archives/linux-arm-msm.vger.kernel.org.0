Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DA89D2F2AC4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Jan 2021 10:06:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388237AbhALJGE (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Jan 2021 04:06:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389430AbhALJF7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Jan 2021 04:05:59 -0500
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5A1CC061795
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:05:18 -0800 (PST)
Received: by mail-pl1-x62e.google.com with SMTP id d4so248218plh.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Jan 2021 01:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Rc1myaDL5WFW+REXHt226CAPQ0iOGXEkXmasJfyDK0Q=;
        b=zqbaYbq58L4E34SllLAdMubr1tyjZEmZJQAuBkexTNyrEMmlE1OjZizL6k3V+KxC1R
         D/6gK1xcZfrnszUww+ys/qJzJ79o8NPZ7so/+u7cVjsu3om1pUaYnWJ5qn00sjyLhBnq
         RppCcEWcXzTeCdxF4za7TxABUXRTf0LMO+PITrdyX3QshKS3DCcDqlyo1GyElVJEkuAQ
         3VgJ6ZSxqBJhJNyW/FmNKJvEs0687rzePxjhBQrEmIAEDkjFa0xkC+ZcA0N05xQHJjUE
         gZksKWKmgz9954Tql3rc3ysM3fvwlKdK0BsRjnOgAwc3wbki8wNaA6/MApuF7RpIjXji
         rlTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Rc1myaDL5WFW+REXHt226CAPQ0iOGXEkXmasJfyDK0Q=;
        b=lfMqn86fUg6bO+w/Uw73TfFEJkejg1OwpemJQClrpasRKyGWyPwqhpCbUJCm583B30
         ZHRFQ/q9qvP+zewA6RP6ruV9onAcQAN5JV7fsDNt1uE4mDUd9MH/UpvoPL3n//WNv4Cq
         LfgWJYoKHEbPHS7EGoMX613EhflFSSFVlnEAWNG02ycI63MAfP2lEOTqqbWkQZHB/op9
         NO/GSjr2YRxJcw9Czb+5D/pzDtuggn2XS7ilgW08ay96t5hVNiShs2MJbLTBfMw5swGM
         DA4Qh2x/kgnzcqgeh2QBz8P6/7cEQLkGRG1im5mplO1edTEwLHHqfF6+FkSfS53X0Hks
         Vbkg==
X-Gm-Message-State: AOAM530GzNcSeUlrmc/V976GO2w+XjJVn2RAUrD2cbJbl/9DYZN3mc3z
        RCFrzOnQfrPJJAnRb6JV6bUeoA==
X-Google-Smtp-Source: ABdhPJzQaofo66Ea8RXJ9ZwIj6GIOhVVRtOq9FtDHcBI2gqx9J6rjZq0AMRIWZvYTMhDNcTP21F6kg==
X-Received: by 2002:a17:90b:ece:: with SMTP id gz14mr3704581pjb.158.1610442318165;
        Tue, 12 Jan 2021 01:05:18 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id x10sm2161006pff.214.2021.01.12.01.05.15
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Jan 2021 01:05:17 -0800 (PST)
Date:   Tue, 12 Jan 2021 17:05:12 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Steev Klimaszewski <steev@kali.org>
Subject: Re: [PATCH] arm64: dts: sdm850: Add OPP tables for 2.84 and 2.96GHz
Message-ID: <20210112090455.GA2479@dragon>
References: <20210112090140.19867-1-shawn.guo@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210112090140.19867-1-shawn.guo@linaro.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jan 12, 2021 at 05:01:40PM +0800, Shawn Guo wrote:
> From: Steev Klimaszewski <steev@kali.org>
> 
> Running cpufreq-hw driver on Lenovo Yoga C630 laptop, the following
> warning messages will be seen.
> 
> [    3.415340] cpu cpu4: Voltage update failed freq=2841600
> [    3.418755] cpu cpu4: failed to update OPP for freq=2841600
> [    3.422949] cpu cpu4: Voltage update failed freq=2956800
> [    3.427086] cpu cpu4: failed to update OPP for freq=2956800
> 
> This is because the cpufreq-hw lookup table of SDM850 provides these two
> set-points, but they are missing from OPP table in DT.  Let's create
> sdm850.dtsi to add the OPP for them, so that the warning will be gone.
> 
> Signed-off-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>

Ignore this one.  Some needed changes got lost.

Shawn
