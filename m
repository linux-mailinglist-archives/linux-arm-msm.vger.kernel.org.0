Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D185831ED9A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Feb 2021 18:48:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234656AbhBRRrh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Feb 2021 12:47:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233050AbhBRQMY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Feb 2021 11:12:24 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A5B7C061574;
        Thu, 18 Feb 2021 08:11:41 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id a207so4476533wmd.1;
        Thu, 18 Feb 2021 08:11:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VaWGH3cwhYh4BHCCROkHu3HMiH4QPakbevCqWXhdWA0=;
        b=hFnnBqj9UW61LvYtGFegNLB36V2195NF7+wnGBwgStAQEW261MqLko2ZdH5P2A2A1o
         R1ViL1XLbuEHNWYzAgG0zibxxJUBnEt0ilN5CsURh6UnuVpaYjvwxKX6P8lv3j1WGyaV
         6MVXGyhQe+M7X/sE6bQ7vPqgBnaORWZIz04QcsMVMQaS9HkMwllYdCPoqWPcetK/9dx0
         GO2ShJEhcUYDn2ha4uowl0LUBSxztnVpG9Cn23Xi6d+7HsvvQrMAE9h+hwSg6oVb3rsV
         X73ybvREldXEkialUtf6aJj2DcinWwP/xm7FMpTgAJHMkuB5L+1GQz4byElvzWSAOQjX
         9Atw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VaWGH3cwhYh4BHCCROkHu3HMiH4QPakbevCqWXhdWA0=;
        b=BHcV66zF0tyQkljWZ//Guf3UXQTfGr79v4II/22HPVDu/hWmmTL1nUBLqRsCp6kdjv
         MFf33SEqG5PO1nYZ0x7uGzB/ShXMYr56QYVFrtdM1F51VRIee+JJHjDbXn6uqTPDucF6
         nIcwBJfJ0UrIDYvEkFt1X1XblTnU6fmsTMSSLizUO54ftuExmMLIZjyxqSKVONWZikEt
         atIHA0G94SI1hP2i2o5B5jjB9JgeHTj00Kt/Ud7ZCaA3uKj5a4Mi/YD9092zzzsyHfDa
         58a4yi4lSztbff/eTLdFeqc8GslZchDjYRqGT5z1ePPCwgKseasw2uctPiobit+uDGFU
         zZ8Q==
X-Gm-Message-State: AOAM533yLuXSFrbgnwNexH1xKMct+1oH6cwaTBZhHZvcfMObSPxh0TeK
        uphnGJYQ0hkorsHgVFs/77vxa/OvV3J2L66Hgjc=
X-Google-Smtp-Source: ABdhPJyFfpJXKxitmCOiwGNdIXY0rjTqKs7a0eRS4jHbH+qoQNaC2dKm1C7sSOxGr7QEumgYzRmb7lsHMqNooH7QjWM=
X-Received: by 2002:a7b:ce90:: with SMTP id q16mr4300588wmj.123.1613664699499;
 Thu, 18 Feb 2021 08:11:39 -0800 (PST)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca> <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org> <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca> <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
In-Reply-To: <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 18 Feb 2021 08:11:27 -0800
Message-ID: <CAF6AEGsWCrkOgMVxnx53k8b_o7xy3KWv9VaNRoY44+4GfXtWdg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        Sharat Masetty <smasetty@codeaurora.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
> > On 2/17/21 3:18 PM, Rob Clark wrote:
> >> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
> >> <jcrouse@codeaurora.org> wrote:
> >>>
> >>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> >>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
> >>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
> >>>>> wrote:
> >>>>>>
> >>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
> >>>>>> ENOENT error,
> >>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
> >>>>>>
> >>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> >>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> >>>>>> ---
> >>>>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> >>>>>>   1 file changed, 3 insertions(+), 3 deletions(-)
> >>>>>>
> >>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
> >>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> >>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
> >>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
> >>>>>>
> >>>>>>          cell = nvmem_cell_get(dev, "speed_bin");
> >>>>>>          /*
> >>>>>> -        * -ENOENT means that the platform doesn't support
> >>>>>> speedbin which is
> >>>>>> -        * fine
> >>>>>> +        * -ENOENT means no speed bin in device tree,
> >>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> >>>>>
> >>>>> very minor nit, it would be nice to at least preserve the gist of the
> >>>>> "which is fine" (ie. some variation of "this is an optional thing and
> >>>>> things won't catch fire without it" ;-))
> >>>>>
> >>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> >>>>> we should have a harder dependency on CONFIG_NVMEM..)
> >>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
> >>>> property,
> >>>> we will see some error during boot up if we don't call
> >>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
> >>>> "speed_bin")"
> >>>> is a way to test this.
> >>>>
> >>>> If there is no other harm, we can put a hard dependency on
> >>>> CONFIG_NVMEM.
> >>>
> >>> I'm not sure if we want to go this far given the squishiness about
> >>> module
> >>> dependencies. As far as I know we are the only driver that uses this
> >>> seriously
> >>> on QCOM SoCs and this is only needed for certain targets. I don't
> >>> know if we
> >>> want to force every target to build NVMEM and QFPROM on our behalf.
> >>> But maybe
> >>> I'm just saying that because Kconfig dependencies tend to break my
> >>> brain (and
> >>> then Arnd has to send a patch to fix it).
> >>>
> >>
> >> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> >> other dependencies, so I suppose it wouldn't be the end of the world
> >> to select that.. but I guess we don't want to require QFPROM
> >>
> >> I guess at the end of the day, what is the failure mode if you have a
> >> speed-bin device, but your kernel config misses QFPROM (and possibly
> >> NVMEM)?  If the result is just not having the highest clk rate(s)
>
> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
> be very obvious what went wrong when this happens!

Ugg, ok..

I suppose we could select NVMEM, but not QFPROM, and then the case
where QFPROM is not enabled on platforms that have the speed-bin field
in DT will fail gracefully and all other platforms would continue on
happily?

BR,
-R

>
> >> available, that isn't the end of the world.  But if it makes things
> >> not-work, that is sub-optimal.  Generally, especially on ARM, kconfig
> >> seems to be way harder than it should be to build a kernel that works,
> >> if we could somehow not add to that problem (for both people with a6xx
> >> and older gens) that would be nice ;-)
> >>
> >
> > There is a "imply" kconfig option which solves exactly this problem.
> > (you would "imply NVMEM" instead of "select NVMEM". then it would be
> > possible to disable NVMEM but it would get enabled by default)
> >
> >> BR,
> >> -R
> >>
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
