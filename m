Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A5CB51F21E4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jun 2020 00:37:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726860AbgFHWhC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Jun 2020 18:37:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726725AbgFHWhB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Jun 2020 18:37:01 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73511C08C5C2
        for <linux-arm-msm@vger.kernel.org>; Mon,  8 Jun 2020 15:37:01 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id d67so16902837oig.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 08 Jun 2020 15:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=K2/QowlQF5mc64F4D/RIrE7YecSYcNfpv5/vBazsU68=;
        b=YoLH9s/K/Q9F2icLGQ4XsZ8yu34FpvCJWwojbzdGbDurrkiHcXCFSCy3FoJkWSiy3v
         ttxN1tKlG+tKqtaDuusQXGxcoYxAqVReyLgBQl1PcyR1ZwZp0pBpPOPsPo71/MhepPX1
         TAlNJPez35trLSgzDHzZEhmRB9+n4fqnr8UMqQoTNeTg6jg6EdOASp/qq4C7sepzG9Cd
         dZJWCGvrEIyu5+XKoLiiqXIf6j+5wBS8cSdu1lwUmBNGajuww2Lml136v36elMFLLBlr
         Ka/gIOFoy6ErsrRJZh6TEMEyVDIeFEF0Mg+ikohuWdsdh0ciUnmL46WhAoOe+rkmwelJ
         +EiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=K2/QowlQF5mc64F4D/RIrE7YecSYcNfpv5/vBazsU68=;
        b=KCAomoL70iCs4YRpshXRNswRqTvV7YUuNBzKyIFLT/5zo2bHHM6x1Pta4sITNdyMbj
         nFbHywIRUwv2C7BJoh/sa5lx55xoWJGwzDJd0wGP6daZKwoUYG8Pf6+LsRCLy/nBwS7J
         Eu9f7sJ45paIPftzjNnCs8XOpMT7bAe0zC5QLFOgVzCddcq4Urxt+Cg0M2GWEBiyn9tN
         QxHN0pASCQHslwZjf4Z9XTSNDhdf6OoXWtVVZWB0Oq30i0p4ZY2O54q6w8hR9jG4kSnd
         IfxCwmmV5knWfVm0fhlyFGtpNgu+nbv8K4Sa1EYEfB7sNjqq+fraG7wqzoolkxkLe3ze
         1UEg==
X-Gm-Message-State: AOAM533adWUusTBhDYaxOU81Bf7EhVKncBGCyzaxp37WU2zqCoMZOd7v
        oE+soAUFo2il0zQYNoQatb1jv31iS42JlqWwAfa69w==
X-Google-Smtp-Source: ABdhPJxIVKuOn/EYkNbXNpa9saF5jSFauCOTybMaENNZXSr0SEt5psJ1bIFC5jcp72iD0nqj2OOCaxBHUwukVfcj1E4=
X-Received: by 2002:aca:2108:: with SMTP id 8mr1330741oiz.10.1591655819262;
 Mon, 08 Jun 2020 15:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <1585044079-358-1-git-send-email-kalyan_t@codeaurora.org> <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
In-Reply-To: <CALAqxLViRrga-XW2o1J1JutFdS1d-qmmgOrEP2beNygw3A7H4A@mail.gmail.com>
From:   John Stultz <john.stultz@linaro.org>
Date:   Mon, 8 Jun 2020 15:36:47 -0700
Message-ID: <CALAqxLWbhioSH4pFyM348VrGWxRXHQV1s9bdz6HArYguLtAFcw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: add support for color processing blocks
 in dpu driver
To:     Kalyan Thota <kalyan_t@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno@lists.freedesktop.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, mkrishn@codeaurora.org,
        travitej@codeaurora.org, Doug Anderson <dianders@chromium.org>,
        lkml <linux-kernel@vger.kernel.org>,
        Sean Paul <seanpaul@chromium.org>, hoegsberg@chromium.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jun 8, 2020 at 3:25 PM John Stultz <john.stultz@linaro.org> wrote:
>
> On Wed, Mar 25, 2020 at 1:17 AM Kalyan Thota <kalyan_t@codeaurora.org> wrote:
> >
> > This change adds support to configure dspp blocks in
> > the dpu driver.
> >
> > Macro description of the changes coming in this patch.
> > 1) Add dspp definitions in the hw catalog.
> > 2) Add capability to reserve dspp blocks in the display data path.
> > 3) Attach the reserved block to the encoder.
> >
> > Signed-off-by: Kalyan Thota <kalyan_t@codeaurora.org>
>
> Hey all,
>   With this patch now merged upstream, I'm seeing a regression on
> db845c that I bisected down to it.
>
> When I boot up I see:
> [   40.976737] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   40.985600] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   40.994587] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   41.003492] [drm:_dpu_rm_check_lm_and_get_connected_blks] [dpu
> error]failed to get dspp on lm 0
> [   41.012283] [drm:_dpu_rm_make_reservation] [dpu error]unable to
> find appropriate mixers
> [   41.020369] [drm:dpu_rm_reserve] [dpu error]failed to reserve hw
> resources: -119
>
> Over and over, and the display doesn't start up.
>
> I suspect we're supposed to catch the following check before the failure:
>
> +       if (!reqs->topology.num_dspp)
> +               return true;
>
> I suspect the issue is in dpu_encoder_get_topology() we don't fully
> initialize the topology structure on the stack before returning it.
>
> Does that sound plausible or is there likely some other cause?

This guess is wrong. The topology.num_dspp is 2, but lm_cfg->dspp is
coming back as zero.

I'll continue digging to see if I can understand better whats going wrong.

thanks
-john
