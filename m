Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 404564465B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Nov 2021 16:29:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233519AbhKEPcR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 5 Nov 2021 11:32:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233516AbhKEPcR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 5 Nov 2021 11:32:17 -0400
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33026C061714
        for <linux-arm-msm@vger.kernel.org>; Fri,  5 Nov 2021 08:29:37 -0700 (PDT)
Received: by mail-io1-xd29.google.com with SMTP id b203so7663547iof.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 08:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
        b=I+rltgFifRvQNsNZIVeUD++Ek0yxbA4Jl5XK/KgCoQHB3uXJ8aLeXftGBqi9z/1Kuq
         MrjVCYOIOTp1QVbJQjt9kamQzE5JQsSUgT9ZljMvlaMnRakZuA3oNlpOPB30kGsPPok2
         fCU4eyoVqWvjDFsRlugQxg0PBjBNFQMCQoCjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/UkXJV0OUTVeSB3ZWIvuOW6MEyDXb/nfPaZn/YUVDEM=;
        b=luDfzYXoFRAV3A+2FT2RMKIaCHN1FAZehCEB1Z/jPlb/ydlqOSWo2+LAFd6mhH+OMU
         zMJqRcWnzMOB41O1PQuH86Ris+j+gbVqxCSeJNVG3xoFDickIG386023MgFMdKUeM0AO
         oFU2Gcpnkeuxk7BiAR76xcd43UgxQJVfUoFfst8hWsVYS4b98qxphEZyzoaflJxNdBDy
         Ump8p++SxnK0vjVs42cnIGnbfLmC3/LC7cRvtMWTFML6LrLDTFHCn8nSvy5HiTLg6ahw
         OZ5rfZ24Rg7T8Jc0xUmhPIKjbQJEzWXd0e3eKNsQXM7D5+bw+Bcj7z0MpBKGaWuNWXJC
         N7Sw==
X-Gm-Message-State: AOAM530PbBvP+ARjC3heN+SuMDNgQAEvswyNFe6Rfblwm5DNCt1bV5Et
        e9Llx7vYK44z6xwMfn8Z/tbg1oOGuOkD0Q==
X-Google-Smtp-Source: ABdhPJy5oWBcbWYbUVRxz1BenUVLTPTLzowXAsBKPZSV0sxlY2qQiGgMO2JA0kcUbulFDXEJzNmFKw==
X-Received: by 2002:a05:6638:204b:: with SMTP id t11mr9551387jaj.40.1636126176452;
        Fri, 05 Nov 2021 08:29:36 -0700 (PDT)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id h10sm4996998ild.85.2021.11.05.08.29.35
        for <linux-arm-msm@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
Received: by mail-io1-f46.google.com with SMTP id z206so11205853iof.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
X-Received: by 2002:a05:6638:c49:: with SMTP id g9mr9752326jal.54.1636126175216;
 Fri, 05 Nov 2021 08:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211104222840.781314-1-robdclark@gmail.com> <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
In-Reply-To: <be2222e2-8fec-84f9-bbcf-bf639a1a63bd@kali.org>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 5 Nov 2021 08:29:23 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
Message-ID: <CAD=FV=WnTsdU0TzbbFhRzoYtiX6-HG+g=OHiu1LP+tODPGXZKQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/devfreq: Fix OPP refcnt leak
To:     Steev Klimaszewski <steev@kali.org>
Cc:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Thu, Nov 4, 2021 at 9:32 PM Steev Klimaszewski <steev@kali.org> wrote:
>
>
> On 11/4/21 5:28 PM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Reported-by: Douglas Anderson <dianders@chromium.org>
> > Fixes: 9bc95570175a ("drm/msm: Devfreq tuning")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/msm_gpu_devfreq.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > index d32b729b4616..9bf8600b6eea 100644
> > --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> > @@ -20,8 +20,6 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >       struct msm_gpu *gpu = dev_to_gpu(dev);
> >       struct dev_pm_opp *opp;
> >
> > -     opp = devfreq_recommended_opp(dev, freq, flags);
> > -
> >       /*
> >        * If the GPU is idle, devfreq is not aware, so just ignore
> >        * it's requests
> > @@ -31,6 +29,8 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
> >               return 0;
> >       }
> >
> > +     opp = devfreq_recommended_opp(dev, freq, flags);
> > +
> >       if (IS_ERR(opp))
> >               return PTR_ERR(opp);
> >
>
> Testing this here on the Lenovo Yoga C630, and I'm starting to see in my
> dmesg output
>
> [   36.337061] devfreq 5000000.gpu: Couldn't update frequency transition
> information.
> [   36.388122] devfreq 5000000.gpu: Couldn't update frequency transition
> information.

Ah, I think this makes sense. We're now storing a frequency which
might not match an actual "opp" and I suppose that we must return it
in some cases.

I guess a simple fix is to still call devfreq_recommended_opp() in the
idle case but just call dev_pm_opp_put() to fix the leak.

-Doug
