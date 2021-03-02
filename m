Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23A9932A128
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Mar 2021 14:45:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381224AbhCBEto (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 Mar 2021 23:49:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241392AbhCBCFx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 Mar 2021 21:05:53 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8FFC06178A
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 Mar 2021 18:04:58 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id s23so882069pji.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 Mar 2021 18:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cfBUaem/oDb9AtUTDLIpGK44OwPrInZVTprLTb3i7+E=;
        b=BNk0ZnzxInRjqgIZeavfWChSeR7SfwzdsUyGAsLmmpQ+Le1ssXouf2fxDvuayDev+n
         BzBgkc5X62xVlRUeVLUJPn2FLHov8VEZltRiBfMXTUYQo9gphrz0SEu4C00+S88wP69/
         HouJqeQVb9yduzZAzAOxNMqy9N9t8TY/XsGMEXp2nzvBBFTFrgmxuAUora/wJiIVLRhF
         G1HP56FD3mUG63236N/1wbSyPDt2rfhEQ1JRAzDWEN9cIpb7l8E4tm0VvoPUjDTusOkA
         z+bMKMGrCnmmpyRPxGqASWvQpHQRHBqpuzCq8Vxb0+gCz38VDfyXHWhTbp6M6Sb+R/Gk
         tqZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cfBUaem/oDb9AtUTDLIpGK44OwPrInZVTprLTb3i7+E=;
        b=ZepwMkML5zZI7212iIy/IhwRrR196ZfX9YxugH5OZssMD9796xl5qlPvUbZI+hNITE
         3xu2/+/mx0qRlttbN4FGBZpUvyBCv2jDdPBIQj3ChcQZlxdVlFyUWYDOcxzIaZ0X7kRm
         ptmgerOyNd78HocDDhJ0Pulnv+hxuUSPvLO+7+P9fN3qVwDFSnLbrs0qlBGVnPs7DKrB
         ex7D+MIfsLx7+I5iwEmdmRuS0bv13Q3QAr2V5xKVQ153dN4yzeCfpvBEA4KCYZw9jvxa
         mon9AFz/GeUYoAlJydL0osGhYBkNj2b0xE83EgBoBB0uKE04MKqmvneRjIZItryvYQB4
         6aVw==
X-Gm-Message-State: AOAM530DcKolsNIL/2Pl2Q7nvoxOv7tkL9V1cTsRtwEZsVyjwUgTaWqu
        4F6eXhZ+bTHK7RkxQSiePTx6a6fe2+B+8Q==
X-Google-Smtp-Source: ABdhPJwN8ikdz/frtsatifL8zwrRzwvNsh4ytvyCAXlV7Jz5ChF5TtDM5Tnil/9ckMWKtiWdqrBsBQ==
X-Received: by 2002:a17:902:9e81:b029:e4:a69:2f92 with SMTP id e1-20020a1709029e81b02900e40a692f92mr18249572plq.83.1614650698084;
        Mon, 01 Mar 2021 18:04:58 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id gf20sm777315pjb.39.2021.03.01.18.04.56
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Mar 2021 18:04:57 -0800 (PST)
Date:   Tue, 2 Mar 2021 10:04:53 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] cpufreq: qcom-hw: enable boost support
Message-ID: <20210302020452.GI24428@dragon>
References: <20210113065241.23829-1-shawn.guo@linaro.org>
 <161462878276.6187.3475113742956110878.git-patchwork-notify@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <161462878276.6187.3475113742956110878.git-patchwork-notify@kernel.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 01, 2021 at 07:59:42PM +0000, patchwork-bot+linux-arm-msm@kernel.org wrote:
> Hello:
> 
> This patch was applied to qcom/linux.git (refs/heads/for-next):
> 
> On Wed, 13 Jan 2021 14:52:41 +0800 you wrote:
> > At least on sdm850, the 2956800 khz is detected as a boost frequency in
> > function qcom_cpufreq_hw_read_lut().  Let's enable boost support by
> > calling cpufreq_enable_boost_support(), so that we can get the boost
> > frequency by switching it on via 'boost' sysfs entry like below.
> > 
> >  $ echo 1 > /sys/devices/system/cpu/cpufreq/boost
> > 
> > [...]
> 
> Here is the summary with links:
>   - cpufreq: qcom-hw: enable boost support
>     https://git.kernel.org/qcom/c/266991721c15
> 
> You are awesome, thank you!
> --
> Deet-doot-dot, I am a bot.
> https://korg.docs.kernel.org/patchwork/pwbot.html

Bjorn,

Why do I keep receiving such bot message on patches that had already
landed mainline?

Shawn
