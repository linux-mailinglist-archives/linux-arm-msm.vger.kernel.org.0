Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0FFF044C257
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Nov 2021 14:46:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231743AbhKJNt0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 10 Nov 2021 08:49:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60544 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231460AbhKJNt0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 10 Nov 2021 08:49:26 -0500
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEED2C061764
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 05:46:38 -0800 (PST)
Received: by mail-oi1-x230.google.com with SMTP id m6so5329715oim.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Nov 2021 05:46:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V1WEPC64NcLgLTdaL03al/ajM9D+f6BWMbSpT0H+cds=;
        b=iREzhFenPY1h7n0t87E/O0C8HuHSdCwtSL5zgQBJ2yQ7WyF+2YAOcWR6A/tqm4kgWG
         /XYdcC20YyZ2xK1NJ1WqPS7FYDGe0jcatM56si63Lfpb5khOaMDW5jVxQsFMRZnfm17V
         epqkgTMoXgXWQaSVLfhoEAhTbyjfh3oeVGxIxC2Xw3ja5J0lwW4oYnmm/ucD8ptBvPWk
         ciL3m/FbMOO4eDKM1x1Qe9dTfw3P/E8/sUYUROjkw0y7ExazVW604huGIjj7l/RTMF8b
         nb4yr7Eo/OROtaroFOMas6LjuHFJcPHJ+HaeS6UIGrUpSBrRBrBY8F+WgTZBi3WpuwEn
         xoug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V1WEPC64NcLgLTdaL03al/ajM9D+f6BWMbSpT0H+cds=;
        b=xRXsKaiotWgyPLZx0jfnPH8JV/90yxmZTIfHXiocH4GDcTBE8kX5GS1IPdHfm8Ag3p
         tpT9+EzLfSP4qWqNNcDhu/XrVjeqRIA/bimeJZJzzth/rgrpf8WGIAA3hKS6WcNS7Y7N
         4XXX0bsPgqe9/H/Mg4JkXU/yr3znAdHvbH0VmyXEKvKIKdzx6CpY6uLazLG+GCg/ynHb
         Nw6g9Zb1IieNI0Dt/c/DX2zfunWrOr5P1sX5se7cLf60pE4gnedGuHJuLQ1gFv3UwIBP
         BxE/XiyZD+zRzyKOK4fFk6XKn4BcU4vnOdX7+RIwGC3UyLOEdRnEAk3boq3yMcIf9RnQ
         3jZQ==
X-Gm-Message-State: AOAM530hbmf6UvDtX8MWuiQotfNfx5OR88La4TVBowCPk1hz5DzfOZAO
        yejyN9Pab6Mir5bzXZB+gN7oRg==
X-Google-Smtp-Source: ABdhPJzZg+Lt4DH8rfVWDSJyzZEKhxVbwOgQOHoeKT3mgaovarbwQrnj/Mx0MBQwLBZG3NRdXyFWDw==
X-Received: by 2002:aca:3885:: with SMTP id f127mr12711435oia.65.1636551998055;
        Wed, 10 Nov 2021 05:46:38 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id n67sm8571676oib.42.2021.11.10.05.46.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 05:46:37 -0800 (PST)
Date:   Wed, 10 Nov 2021 05:48:10 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shawn Guo <shawn.guo@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Loic Poulain <loic.poulain@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] clk: qcom: smd-rpm: Report enable state to framework
Message-ID: <YYvNmrSeJNCE4BEC@ripper>
References: <20211109022558.14529-1-shawn.guo@linaro.org>
 <YYpMzau3CWRQYlkJ@gerhold.net>
 <20211110131507.GJ7231@dragon>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211110131507.GJ7231@dragon>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 10 Nov 05:15 PST 2021, Shawn Guo wrote:

> Hi Stephan,
> 
> On Tue, Nov 09, 2021 at 11:26:21AM +0100, Stephan Gerhold wrote:
> > Hi Shawn,
> > 
> > On Tue, Nov 09, 2021 at 10:25:55AM +0800, Shawn Guo wrote:
> > > Currently the enable state of smd-rpm clocks are not properly reported
> > > back to framework due to missing .is_enabled and .is_prepared hooks.
> > > This causes a couple of issues.
> > > 
> > > - All those unused clocks are not voted for off, because framework has
> > >   no knowledge that they are unused.  It becomes a problem for vlow
> > >   power mode support, as we do not have every single RPM clock claimed
> > >   and voted for off by client devices, and rely on clock framework to
> > >   disable those unused RPM clocks.
> > > 
> > 
> > I posted a similar patch a bit more than a year ago [1].
> 
> Ouch, that's unfortunate!  If your patch landed, I wouldn't have had to
> spend such a long time to figure out why my platform fails to reach vlow
> power mode :(
> 
> > Back then one
> > of the concerns was that we might disable critical clocks just because
> > they have no driver using it actively. For example, not all of the
> > platforms using clk-smd-rpm already have an interconnect driver.
> > Disabling the interconnect related clocks will almost certainly make the
> > device lock up completely. (I tried it back then, it definitely does...)
> > 
> > I proposed adding CLK_IGNORE_UNUSED for the interconnect related clocks
> > back then [2] which would allow disabling most of the clocks at least.
> > Stephen Boyd had an alternative proposal to instead move the
> > interconnect related clocks completely out of clk-smd-rpm [3].
> > But I'm still unsure how this would work in a backwards compatible way. [4]
> > 
> > Since your patches are more or less identical I'm afraid the same
> > concerns still need to be solved somehow. :)
> 
> I do not really understand why smd-rpm clock driver needs to be a special
> case.  This is a very common issue, mostly in device early support phase
> where not all clock consumer drivers are ready.  Flag CLK_IGNORE_UNUSED
> and kernel cmdline 'clk_ignore_unused' are created just for that.  Those
> "broken" platforms should be booted with 'clk_ignore_unused' until they
> have related consumer drivers in place.

Afaict we still have the problem that if the interconnect driver is
compiled as a module, or for other reasons doesn't probe until after
late_initcall() clk-smd-rpm will turn off these clocks and we never will
get a chance to probe the interconnect provider.

I believe the way to handle that is to rely on sync_state, but there
seems to be a lot of corner cases here.

But with that in place, I agree that we should handle this temporarily
during bringup by the use of clk_ignore_unused.

> IMHO, properly reporting enable state to framework is definitely the
> right thing to do, and should have been done from day one.
> 

I always thought is_enabled() should reflect the hardware state - in
particular for clk_summary. The particular concern being that by
initializing the is_enabled() state to either true or false, we're
making an assumption about the hardware state. And if something where to
do if (enabled) disable (or if (disabled) enable), we might skip a
critical operation just because we tricked the logic.

So, do you need it for anything other than clk_disable_unused()?

I have a clock in the MDP with similar issue, where we don't have
is_enabled() but I need it to be disabled by clk_disable_unused(),
because the next iteration turns off the parent and locks up the still
"active" rcg.
So far I've not received any feedback on this though...
https://lore.kernel.org/all/20210707043859.195870-1-bjorn.andersson@linaro.org/

With this approach we don't make any assumptions about the hardware
state, beyond the fact that we will issue a disable in
clk_disable_unused() if no one has yet enabled the clock - which at
worst turns off a clock that's already is off.

Regards,
Bjorn

> Shawn
> 
> > [1]: https://lore.kernel.org/linux-arm-msm/20200817140908.185976-1-stephan@gerhold.net/
> > [2]: https://lore.kernel.org/linux-arm-msm/20200818080738.GA46574@gerhold.net/
> > [3]: https://lore.kernel.org/linux-arm-msm/159796605593.334488.8355244657387381953@swboyd.mtv.corp.google.com/
> > [4]: https://lore.kernel.org/linux-arm-msm/20200821064857.GA905@gerhold.net/
