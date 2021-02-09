Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D62AC3155D4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Feb 2021 19:27:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233294AbhBISYQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Feb 2021 13:24:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35218 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233282AbhBISWA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Feb 2021 13:22:00 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAFA7C0617AA
        for <linux-arm-msm@vger.kernel.org>; Tue,  9 Feb 2021 10:10:03 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id p20so33251700ejb.6
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Feb 2021 10:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wnA+RGLHgm/3F8CIZGL+Pa1MC9eT1mTFOAgTawbFq6w=;
        b=s8yVmKNzoWZ4/i4zmk9jrzFFp8OgmAJ5yxjODhIc7xYtPnSeRBbiyIASXZub2KzWsR
         EsGgYN2m2oU1P7/zXHozSxPGEsg4au/nXy+hLBFuc3+ke8V0MJFy5sndEtIprnFIZ7vJ
         gfuF51nYL7Jw89X+9o5F+95uicK07tFvBNHge+jsBra7kTcrHZnWNNuJsY9vGf69uh2h
         AJekSyzX1u/JdyW3HkyLYjvw8mLHAgYa+bph3v3g9ZFcX6ZZp/rm+xJGZF2hVf4QZW1i
         jsr3roX7+sL8NTzitsYFcv7APnRqYshM4J2xZGv1FrBhbJDUfNBqxjdQHvnfCPT9lD73
         ezuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wnA+RGLHgm/3F8CIZGL+Pa1MC9eT1mTFOAgTawbFq6w=;
        b=HaNQC2xEcrkkbVw4vD1FAzr9IZBJg3TVXetrUtsDOYFXJ1spYoTgD6tESc0mpk/qY7
         G8xI6Xm0RNHCQIEjCWAFd9MOzqxRVr48jKC21fk81a/ex6N8FIK7XfPvb7uWSDG/Go/P
         yO1LohcWYCgWXlaQREn548z8ANo7fDp4CL73xX8DddUc8+PMvTxy/gKUqUh5CxzDYCet
         SnORXLKNKIy36UlPEh16veaWya19zzKyuuKALTluJArwFBHkko1Kn60guWmevt/gB/Hz
         D2WsthzOcT1tb9XOg64yp5E1/5wcS+ewV7YTgWrpyAPwAUHYnj/+dH4TFlPIf4VwymiW
         6m9Q==
X-Gm-Message-State: AOAM531GfNjX95kM8Y5efY+dTeVFift0b3vLvyxTOY3CWt2RU+FFGGIF
        hGkv0zFwT1dRq3sBEpp+RcXrTwTxxbefvgy55YkjHHHLp2eZlA==
X-Google-Smtp-Source: ABdhPJwrAnFdnHLDgwL8Ivb+TBqeclf2QOlE+kmUjy+/CUE/5LTUyrjqhvSo4nTiwNWDxbVy8fYSLbWXatEbQTdESrs=
X-Received: by 2002:a17:906:3916:: with SMTP id f22mr18087047eje.328.1612894202482;
 Tue, 09 Feb 2021 10:10:02 -0800 (PST)
MIME-Version: 1.0
References: <1612885989-12288-1-git-send-email-loic.poulain@linaro.org>
 <f2612a01-2c10-9735-d4ba-46ea87c70379@codeaurora.org> <CAMZdPi_16SfDoYC0vqqhRfEOqn3SHc6EUmfpVz0RRLaGek7_PQ@mail.gmail.com>
 <7a641d95c2e8c74c7dfc537c74a7ae1a@codeaurora.org>
In-Reply-To: <7a641d95c2e8c74c7dfc537c74a7ae1a@codeaurora.org>
From:   Loic Poulain <loic.poulain@linaro.org>
Date:   Tue, 9 Feb 2021 19:17:32 +0100
Message-ID: <CAMZdPi-3PBGLE7KYoSkKWOT7YrbrpA70NRJo2Lrc-MQr=oKUyg@mail.gmail.com>
Subject: Re: [PATCH] mhi: Fix double dma free
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Hemant Kumar <hemantk@codeaurora.org>,
        Kalle Valo <kvalo@codeaurora.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On Tue, 9 Feb 2021 at 18:27, Bhaumik Bhatt <bbhatt@codeaurora.org> wrote:
>
> On 2021-02-09 08:06 AM, Loic Poulain wrote:
> > On Tue, 9 Feb 2021 at 16:55, Jeffrey Hugo <jhugo@codeaurora.org> wrote:
> >>
> >> On 2/9/2021 8:53 AM, Loic Poulain wrote:
> >> > mhi_deinit_chan_ctxt functionthat takes care of unitializing channel
> >> > resources, including unmapping coherent MHI areas, can be called
> >> > from different path in case of controller unregistering/removal:
> >> >   - From a client driver remove callback, via mhi_unprepare_channel
> >> >   - From mhi_driver_remove that unitialize all channels
> >> >
> >> > mhi_driver_remove()
> >> > |-> driver->remove()
> >> > |    |-> mhi_unprepare_channel()
> >> > |        |-> mhi_deinit_chan_ctxt()
> >> > |...
> >> > |-> mhi_deinit_chan_ctxt()
> >> >
> >> > This leads to double dma freeing...
> >> >
> >> > Fix that by preventing deinit for already uninitialized channel.
> >> >
> >> > Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> >> > Reported-by: Kalle Valo <kvalo@codeaurora.org>
> >> > ---
> >>
> >> Seems like this should have a Fixes: tag, no?
> >
> > Right, thanks, i'll add it in V2 once I get feedback.
>
> Hi Loic, Mani,
>
> I saw this same issue a while back but could not collect the logs for
> it.
>
> I had already pushed a patch to fix this differently [1] which was
> recently reviewed by Hemant.
>
> Although there wasn't a purposeful fixes tag for it. I think the culprit
> for this issue is [2]:
>
> As it allows the unprepare to go through on remove(), which was
> traditionally not allowed and
> ends up uncovering this issue as it fixes another.
>
> Channel updates [3] address that and provide a bunch of other
> improvements. Please consider them.

Yes, patch [2] is the culprit. I would recommend merging this tiny fix
so that it can be easily grab for 5.11 or backported, and keep your
series (rebased on top), for mhi-next (going to review/test it btw).

Regards,
Loic
