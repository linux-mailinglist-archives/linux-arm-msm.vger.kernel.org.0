Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 886F244C1F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 14:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231641AbhKJNSQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 08:18:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231993AbhKJNSH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 08:18:07 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7756DC061766
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 05:15:19 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id gf14-20020a17090ac7ce00b001a7a2a0b5c3so1624906pjb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 05:15:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=1yCHgjbyfVlE9NXxBH+wF0Mqhh6seG348lIJvipGlOA=;
        b=N6h2wrcPPFOSS6IWRK2dv6tAVz5v/j8iu2nbifO6aO2oDG4kVTex/fi7sVth7yhquL
         extanHsAjvvRRVuv+L4vlF+EuSY2YcTNxap7ZruDZKIE0pbhLHcs3eTU7W0kvffTJYAT
         YweAYoKP4yCn8ZC2Ndlef3ypIDaph4tb5du7aataTCiaTbcq8077pq1mz+/B3mDII9/P
         RymE67mMbIL0uZpDngyY7ECNQ3hlduuaoj/Rrd5pXu4S3JW2W6gZrX0RrhxPowG0RwAD
         axup6E3Mug324XJ0hHJH6QuMl8cQhkXlL6J7ZTdlqfiaimhh9wvXRCbhkqfd9dCP1AaV
         GvSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=1yCHgjbyfVlE9NXxBH+wF0Mqhh6seG348lIJvipGlOA=;
        b=5wODxzu2VAc4acoFLchOtYbr7r/AuF1aLfhi7lSHNBeF602TNQFJXVEeEr2kLWlnsF
         agZquNUyn1QeAkq+1uBsksoGUCRp1Ox6aUSuZnr+SfY2RlL53pZhxPNHhEfGgBRsmM6V
         Hvv/uTpOP258kK/fN3B3EGQWL3U3ZjGI6Tf8eCm6rz/+6KEcZdoiluGlqI67I9M4tyjq
         eBwWyFcd0nrvRsTmx3xscJYq+nmbdhqcv+Of6n0AlsPN6uDJCj/cTEyWV2XJ3ItQG8Iy
         6U8SI3MNHXv1sw91Yuhym6jjlHwlf3oByjaUCnMjmLz5YbfbhJdJe53ZYThxO4ya9sTN
         Q+tw==
X-Gm-Message-State: AOAM532OKuHuLpzD9+9r+odKVLkMtjNcZBQT5N7tPN3R4fu98mzenlpF
        joysWO8KzJqjszO1vC6rr9a84Q==
X-Google-Smtp-Source: ABdhPJzQfRHy8Bof3ksBZq0H3GOzhBX8F3k9/A14gnSDUBFTiRa1dTMMFRd5W9HTmPnBXYlYjLutrg==
X-Received: by 2002:a17:90a:6b0d:: with SMTP id v13mr16783750pjj.138.1636550118896;
        Wed, 10 Nov 2021 05:15:18 -0800 (PST)
Received: from dragon (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id k16sm18236804pfu.183.2021.11.10.05.15.16
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Nov 2021 05:15:18 -0800 (PST)
Date:   Wed, 10 Nov 2021 21:15:11 +0800
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <20211110131507.GJ7231@dragon>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YYpMzau3CWRQYlkJ@gerhold.net>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephan,

On Tue, Nov 09, 2021 at 11:26:21AM +0100, Stephan Gerhold wrote:
> Hi Shawn,
> 
> On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> > Currently the enable state of smd-rpm clocks are not properly reported
> > back to framework due to missing .is_enabled and .is_prepared hooks.
> > This causes a couple of issues.
> > 
> > - All those unused clocks are not voted for off, because framework has
> >   no knowledge that they are unused.  It becomes a problem for vlow
> >   power mode support, as we do not have every single RPM clock claimed
> >   and voted for off by client devices, and rely on clock framework to
> >   disable those unused RPM clocks.
> > 
> 
> I posted a similar patch a bit more than a year ago [1].

Ouch, that's unfortunate!  If your patch landed, I wouldn't have had to
spend such a long time to figure out why my platform fails to reach vlow
power mode :(

> Back then one
> of the concerns was that we might disable critical clocks just because
> they have no driver using it actively. For example, not all of the
> platforms using clk-smd-rpm already have an interconnect driver.
> Disabling the interconnect related clocks will almost certainly make the
> device lock up completely. (I tried it back then, it definitely does...)
> 
> I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
> back then [2] which would allow disabling most of the clocks at least.
> Stephen Boyd had an alternative proposal to instead move the
> interconnect related clocks completely out of clk-smd-rpm [3].
> But I'm still unsure how this would work in a backwards compatible way. [4]
> 
> Since your patches are more or less identical I'm afraid the same
> concerns still need to be solved somehow. :)

I do not really understand why smd-rpm clock driver needs to be a special
case.  This is a very common issue, mostly in device early support phase
where not all clock consumer drivers are ready.  Flag CLK_IGNORE_UNUSED
and kernel cmdline 'clk_ignore_unused' are created just for that.  Those
"broken" platforms should be booted with 'clk_ignore_unused' until they
have related consumer drivers in place.  IMHO, properly reporting enable
state to framework is definitely the right thing to do, and should have
been done from day one.

Shawn

> [1]: https://lore.kernel.org/linux-arm-msm/20200817140908.185976-1-stephan@gerhold.net/
> [2]: https://lore.kernel.org/linux-arm-msm/20200818080738.GA46574@gerhold.net/
> [3]: https://lore.kernel.org/linux-arm-msm/159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com/
> [4]: https://lore.kernel.org/linux-arm-msm/20200821064857.GA905@gerhold.net/
