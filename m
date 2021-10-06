Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EECA24235B5
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 04:08:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237202AbhJFCKk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 22:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237200AbhJFCKk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 22:10:40 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F37CC06174E
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 19:08:49 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id e24so1873904oig.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 19:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lYqbd1yY6Vt/MStunvcBDmbeftnynuSmElbE65yJeuI=;
        b=GC6d96YWZxDnlnByKPE8fzKDBgpe+/UipmMF6p4IzkEANqw1A+OhrXdDLSPEZdgDy4
         am8AsWG52xoFc6BD1SSQypkjO8/pMZdsimyMa0CTKwTOCVB+58kihH0X4CilBV7FzGrF
         WX+AM7FGM1t8QjqF2kVBwQD9XAkawVs5tMe1myGfh2X0jlwxR1lHFmp9rcMmyVJus8aw
         UeUQPVSmfb/2fCUwCtXoCf9AWZy/mAxrPsHgnJXkKS4gxCFRGBQ470PbFnKB6H9COVJd
         wbYZ9vaA9bqwPHC45Dj+ztPNh5EvwRv0UkZjFKEBmxNs6zXDyVgpTk2NuMug5pg2dXW6
         SpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lYqbd1yY6Vt/MStunvcBDmbeftnynuSmElbE65yJeuI=;
        b=MM8Pr6/l1VTTP1bez2T6w/r6LAvxmvl2do8xVT7G8PgNEOmfmUtCX93ijgEKztCkAa
         rRVNi2C8AJqOLMGaei80r9s1sXKyphmejDAk0G4NPBgexGowiEf2EQFcDYquuK/yyaG+
         T69oMFPV+9G5m26v3wZsIawecSQevgygvOGJLGCMIpSmnRZ8Ao5YKp9M/WgdkEcw5R4o
         7R+PEYXk6peC1bYjKIfHA/Skvxwqqs2+e/oZ3kA+luu/KB5wp2MudfFpwdWpvcITRGOU
         J4RqBcPECg6GWGYqQyGe2RtsZDYTVkNgdO2YNcw5AlRdzCnclefQq4VSxfKPZPx90DEY
         988w==
X-Gm-Message-State: AOAM531jeyW87V2UbNpgi/LEYl7+KaxTDXHuImapY8fNCnlsB2QudSQ5
        Q3fF5IG52wJepwJCyVsv0Nme+g==
X-Google-Smtp-Source: ABdhPJwOAzvNXUWrQOMZZ6Pn52U6g6WPpbGpk9AzF5O1hc8wZyZsEDHPz1VOQo1RF640zOdBhAsitA==
X-Received: by 2002:a05:6808:a99:: with SMTP id q25mr5117219oij.162.1633486128519;
        Tue, 05 Oct 2021 19:08:48 -0700 (PDT)
Received: from ripper ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
        by smtp.gmail.com with ESMTPSA id l23sm3535076otk.21.2021.10.05.19.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Oct 2021 19:08:48 -0700 (PDT)
Date:   Tue, 5 Oct 2021 19:10:29 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     khsieh@codeaurora.org
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Sankeerth Billakanti <sbillaka@codeaurora.org>
Subject: Re: [PATCH] drm/msm/dp: Shorten SETUP timeout
Message-ID: <YV0FlTyMEzlyNsN9@ripper>
References: <20211005023750.2037631-1-bjorn.andersson@linaro.org>
 <CAE-0n52wN1s=Ph4r4iLposxNPfa562Bv1mM81j1KvNmWOQS1-Q@mail.gmail.com>
 <YVzGVmJXEDH0HfIL@ripper>
 <CAE-0n53FC7JCCJoye_uKeqaLKrZeHXLtvObxWFedaUzjirmBaA@mail.gmail.com>
 <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a4a4980e586a70e3b7de989bc61a3e33@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue 05 Oct 16:04 PDT 2021, khsieh@codeaurora.org wrote:

> On 2021-10-05 15:36, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2021-10-05 14:40:38)
> > > On Tue 05 Oct 11:45 PDT 2021, Stephen Boyd wrote:
> > > 
> > > > Quoting Bjorn Andersson (2021-10-04 19:37:50)
> > > > > Found in the middle of a patch from Sankeerth was the reduction of the
> > > > > INIT_SETUP timeout from 10s to 100ms. Upon INIT_SETUP timeout the host
> > > > > is initalized and HPD interrupt start to be serviced, so in the case of
> > > > > eDP this reduction improves the user experience dramatically - i.e.
> > > > > removes 9.9s of bland screen time at boot.
> > > > >
> > > > > Suggested-by: Sankeerth Billakanti <sbillaka@codeaurora.org>
> > > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > > > ---
> > > >
> > > > Any Fixes tag? BTW, the delay design is pretty convoluted. I had to go
> > > > re-read the code a couple times to understand that it's waiting 100ms
> > > > times the 'delay' number. Whaaaaat?
> > > >
> > > 
> > > I assume you're happy with the current 10s delay on the current
> > > devices, so I don't think we should push for this to be backported.
> > > I have no need for it to be backported on my side at least.
> > > 
> > 
> > Sure. Fixes tag != backported to stable trees but it is close.
> > 
> > > > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > > 
>   dp_add_event(dp, EV_HPD_INIT_SETUP, 0, 1); <== to 100ms
> 
> This patch will prevent usb3 from working due to dp driver initialize phy
> earlier than usb3 which cause timeout error at power up usb3 phy when both
> edp and dp are enabled.

Can you please help me understand what you mean here, I use this on my
sc8180x with both eDP and USB-C/DP right now. What is it that doesn't
work? Or am I just lucky in some race condition?

Thanks,
Bjorn

> I had prepared a patch (drm/msm/dp: do not initialize combo phy until plugin
> interrupt) to fix this problem.
> Unfortunately, my patch is depend on Bjorn's patch (PATCH v3 3/5]
> drm/msm/dp: Support up to 3 DP controllers).
> I will submit my patch for review once Bjorn's patches merged in.
> Therefore I would think this patch should go after both Bjorn's patches and
> my patch.
> 
> 
> 
