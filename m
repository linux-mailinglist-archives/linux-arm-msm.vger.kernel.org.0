Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66564435E8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Oct 2021 12:03:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231593AbhJUKFZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 21 Oct 2021 06:05:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231586AbhJUKFZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 21 Oct 2021 06:05:25 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 883D1C06161C
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 03:03:09 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id e5-20020a17090a804500b001a116ad95caso170616pjw.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Oct 2021 03:03:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dyIzNS94yVFn26I1+Vs+X45Vc6HJjjNBIVAQhUczpSM=;
        b=VWDF7tT1/ERaiy+hd0f6TMm9xFOihJIvjzaya/s3ODTaGnjpSPJdbYprA4nNTrVcbD
         bGlCes4+wktbJ3qFkdxKX+pF3DSJZ3pwm1T+rFQES8zBRpNnOrXkgKXHJ2bue3r3p4G+
         H69wUbUsY4TqDGOuFqhQvBvO6pAo8G6ZO6CEnUPDxxUOz6DdGTmalk5Q68ba/STSUsLs
         cds7OJH3l3frdAhraIIVaAAqHEX+fjg63+fTS/Iv2xbAF5DLtfQp8/2JJG6vSVgCrzCp
         biMIQFzCz+kKkNEb+g8wP/QnInQP1CRNTU7ldpMMsO8ZEgAaQcc58to35Vlx9L2XWw8h
         b6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dyIzNS94yVFn26I1+Vs+X45Vc6HJjjNBIVAQhUczpSM=;
        b=VdpluDD4Ykgt8m4Q5qAWfx+4Pa5+mCdgxVAjb2FvtPIPzbziS7Xk8WnCoWwYtE83dG
         K59HP6mC40V6JSh0ktx12uFmPPGT81nvwOHkKu893uusNtBa8Vpl5GR0/AXuQFM24Xh8
         TgwpmqIfmnyNbKno79qinxH0G4TZWH6rg0m02KShV39UWuK2ROHTtyGO2Xxp3sv6VxFw
         QtmPXAM/sgad6v76FVTPGsMLfXm2U/uAOcOzHdcNJH0nQDkNlvBjxydRbiFM0tBBom2W
         JoBLkG+FstFkuxULlaNWxkb+lxB2bJaHJREfXyIhoo/z7O9D7HFnqmHkC3fJEDI8ld+Y
         fp8w==
X-Gm-Message-State: AOAM532ECIjL313L2WLiobOdCi/yWKqqRAeFYtLLXYPebKgMhsMvtsP0
        fb8Bq4wlIYwLqZiLipJz+POF
X-Google-Smtp-Source: ABdhPJzzDD1MByFwNyBzIySK4PYWZmbpJVSVMenRc0Dxbbe1gHD8Vc4vuRM4kZ/i3/h7/Lf0nSzXIA==
X-Received: by 2002:a17:90b:1196:: with SMTP id gk22mr5654164pjb.126.1634810589002;
        Thu, 21 Oct 2021 03:03:09 -0700 (PDT)
Received: from workstation ([202.21.43.20])
        by smtp.gmail.com with ESMTPSA id f33sm8717545pjk.42.2021.10.21.03.03.06
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 21 Oct 2021 03:03:08 -0700 (PDT)
Date:   Thu, 21 Oct 2021 15:33:05 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Kalle Valo <kvalo@codeaurora.org>
Cc:     Loic Poulain <loic.poulain@linaro.org>, ath11k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        regressions@lists.linux.dev, mhi <mhi@lists.linux.dev>
Subject: Re: [regression] mhi: ath11k resume fails on some devices
Message-ID: <20211021100305.GD7580@workstation>
References: <871r5p0x2u.fsf@codeaurora.org>
 <CAMZdPi8UJLvBFQd8-nf-iHAQh8cEuihq97PUFfZ7Q=rxRQoPsg@mail.gmail.com>
 <877df6tlnq.fsf@codeaurora.org>
 <CAMZdPi8P7YZPhPir+WfS3cY_a7He1m2Pq2uqBhczPdEeoNRb0Q@mail.gmail.com>
 <87a6jl9ndo.fsf@codeaurora.org>
 <87ee8hgqni.fsf@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ee8hgqni.fsf@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Oct 19, 2021 at 03:12:01PM +0300, Kalle Valo wrote:
> Kalle Valo <kvalo@codeaurora.org> writes:
> 
> > (adding the new mhi list, yay)
> >
> > Hi Loic,
> >
> > Loic Poulain <loic.poulain@linaro.org> writes:
> >
> >>> Loic Poulain <loic.poulain@linaro.org> writes:
> >>>
> >>> > On Thu, 16 Sept 2021 at 10:00, Kalle Valo <kvalo@codeaurora.org> wrote:
> >>>
> >>> >> At the moment I'm running my tests with commit 020d3b26c07a reverted and
> >>> >> everything works without problems. Is there a simple way to fix this? Or
> >>> >> maybe we should just revert the commit? Commit log and kernel logs from
> >>> >> a failing case below.
> >>> >
> >>> > Do you have log of success case?
> >>>
> >>> A log from a successful case in the end of email, using v5.15-rc1 plus
> >>> revert of commit 020d3b26c07abe27.
> >>>
> >>> > To me, the device loses power, that is why MHI resuming is failing.
> >>> > Normally the device should be properly recovered/reinitialized. Before
> >>> > that patch the power loss was simply not detected (or handled at
> >>> > higher stack level).
> >>>
> >>> Currently in ath11k we always keep the firmware running when in suspend,
> >>> this is a workaround due to problems between mac80211 and MHI stack.
> >>> IIRC the problem was something related MHI creating struct device during
> >>> resume or something like that.
> >>
> >> Could you give a try with the attached patch? It should solve your
> >> issue without breaking modem support.
> >
> > Sorry for taking so long, but I now tested your patch on top of
> > v5.15-rc3 and, as expected, everything works as before with QCA6390 on
> > NUC x86 testbox.
> >
> > Tested-by: Kalle Valo <kvalo@codeaurora.org>
> 
> I doubt we will find enough time to fully debug this mhi issue anytime
> soon. Can we commit Loic's patch so that this regression is resolved?
> 

Sorry no :( Eventhough Loic's patch is working, I want to understand the
issue properly so that we could add a proper fix or patch the firmware
if possible.

Let's try to get the debug logs as I requested.

Thanks,
Mani

> At the moment I'm doing all my regression testing with commit
> 020d3b26c07abe27 reverted. That's a risk, I would prefer to do my
> testing without any hacks.
> 
> -- 
> https://patchwork.kernel.org/project/linux-wireless/list/
> 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
