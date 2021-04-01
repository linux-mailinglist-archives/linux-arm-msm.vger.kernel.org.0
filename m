Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF356352061
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 22:09:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234473AbhDAUJQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 1 Apr 2021 16:09:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234153AbhDAUJQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 1 Apr 2021 16:09:16 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F672C0613E6;
        Thu,  1 Apr 2021 13:09:16 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id g25so1621455wmh.0;
        Thu, 01 Apr 2021 13:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=OYyWj6HI9dbsNPf4ajpkZrn2a4t/LrHsqUPQtMvtof4=;
        b=hXhAbQY3x+7V+VVWtUWXurDi31+cszkGwGAPC1H22fDvID+hPpX2uXsrAnS/yMWZo6
         vCko77xxHQXsekba+5SZUYbpv0ufGzGRY41AE6FBeWRQPMxUNzbDR47KuXJKuwnU+FeW
         qeW9/epwoteCGifVAW0+Hg3FU6wEvEcA+Fnm//DMXNC+QngmWlOfWrcBKOoMd25f0Myn
         i0uapMYws82JHRzeJ3c2TtTwuNAcTiDA+6qCZq+2D5EXmRYvWNRxPACjaBmei1tKrET0
         bW1yr3emEETo1wIWfsjcknDrminKTgbVI8KIngGNZvF6dobyPIxGo6A7mCrCwF3WvxzA
         2mwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=OYyWj6HI9dbsNPf4ajpkZrn2a4t/LrHsqUPQtMvtof4=;
        b=X+Jm7dTxoQDmf4levHvwaxrLY4Ko9cUPLj2OwAjGBEz1Cao743OJwll7COaIVhIGyZ
         BMnakzzgqROzgXcl264mnzmjTQH8AdWIjIj/aj+0rPZ7bPnt+i6ZT4fypb61IOQnuouh
         VSyhnqDD2ARfmzKpAhDLYJm3LbUi1WkXjnHm/iTZU1AKSz0djYLC5/uz7+J769cJq+OZ
         WbzCf6RImNJ4BrqtMhDuSOI0AWuC5mzHn80TROVyDTGVF5H+R0fbz8JgV/x3AVFIzJo8
         edMWxWfCXYcVTVRycBOdaBTMM+9ZDoWZ7wqOdby9wDlgqOM4qSmGgAvMfTEZDG2qgxPQ
         iFtQ==
X-Gm-Message-State: AOAM5309ksrljAvqGvplYVLiQQIJnB/8PcLRK97veoLYAGz4g2bATI+A
        6U6FKd+6nUIyZCYXYtfCJ6vhfvoZ1ZV+s6QTrCmnR1vJovY=
X-Google-Smtp-Source: ABdhPJy4xEf8AyQv15GF3msQNSd+Dp7ktl8SG1BaEU6LF/bF+xbPqRUBVCpKycIYv8upx4SZz9d/55UrPmqV3k6hlV8=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id o16mr9674229wmq.123.1617307754839;
 Thu, 01 Apr 2021 13:09:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210216200909.19039-1-jonathan@marek.ca> <CAF6AEGv53nnzqMgTfSA6t2YpHx1dDW8UqnH9Gw0w3p8bf0mTLw@mail.gmail.com>
 <775436ba-c94a-ab22-d65b-b2391047ec65@codeaurora.org> <20210217190820.GA2229@jcrouse1-lnx.qualcomm.com>
 <CAF6AEGsHws23ozeJ8G23LFQ8J=CVVrx5xvkSgBuE_uSwT4YurQ@mail.gmail.com>
 <74d1277e-295f-0996-91c3-05cfce8d3a0e@marek.ca> <e4b62857-bd4d-cca6-0d6b-b9cc960b52a2@codeaurora.org>
 <CAF6AEGsWCrkOgMVxnx53k8b_o7xy3KWv9VaNRoY44+4GfXtWdg@mail.gmail.com>
 <757b557a-b5f6-6018-caa4-34bffb1b60b7@codeaurora.org> <CAF6AEGv-A5=4z7ZO-SytmivZTfKPYxhAjmRLVsQnrT7_pYCDtQ@mail.gmail.com>
 <0f057c99-ec94-f3e3-796f-b73a609f735d@codeaurora.org> <CAF6AEGvXYmcj0YuciZATveALJEP6DdFiwmtnYevrK2SEOJNZGg@mail.gmail.com>
In-Reply-To: <CAF6AEGvXYmcj0YuciZATveALJEP6DdFiwmtnYevrK2SEOJNZGg@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 1 Apr 2021 13:12:39 -0700
Message-ID: <CAF6AEGs4sYOMgysg3FraKTDetqKTgMXT6RE700e-8uyE9Gs-9A@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: fix for kernels without CONFIG_NVMEM
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Eric Anholt <eric@anholt.net>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Feb 22, 2021 at 8:06 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Mon, Feb 22, 2021 at 7:45 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> >
> > On 2/19/2021 9:30 PM, Rob Clark wrote:
> > > On Fri, Feb 19, 2021 at 2:44 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> > >>
> > >> On 2/18/2021 9:41 PM, Rob Clark wrote:
> > >>> On Thu, Feb 18, 2021 at 4:28 AM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
> > >>>>
> > >>>> On 2/18/2021 2:05 AM, Jonathan Marek wrote:
> > >>>>> On 2/17/21 3:18 PM, Rob Clark wrote:
> > >>>>>> On Wed, Feb 17, 2021 at 11:08 AM Jordan Crouse
> > >>>>>> <jcrouse@codeaurora.org> wrote:
> > >>>>>>>
> > >>>>>>> On Wed, Feb 17, 2021 at 07:14:16PM +0530, Akhil P Oommen wrote:
> > >>>>>>>> On 2/17/2021 8:36 AM, Rob Clark wrote:
> > >>>>>>>>> On Tue, Feb 16, 2021 at 12:10 PM Jonathan Marek <jonathan@marek.ca>
> > >>>>>>>>> wrote:
> > >>>>>>>>>>
> > >>>>>>>>>> Ignore nvmem_cell_get() EOPNOTSUPP error in the same way as a
> > >>>>>>>>>> ENOENT error,
> > >>>>>>>>>> to fix the case where the kernel was compiled without CONFIG_NVMEM.
> > >>>>>>>>>>
> > >>>>>>>>>> Fixes: fe7952c629da ("drm/msm: Add speed-bin support to a618 gpu")
> > >>>>>>>>>> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> > >>>>>>>>>> ---
> > >>>>>>>>>>     drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++---
> > >>>>>>>>>>     1 file changed, 3 insertions(+), 3 deletions(-)
> > >>>>>>>>>>
> > >>>>>>>>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>>>>>>>> b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>>>>>>>> index ba8e9d3cf0fe..7fe5d97606aa 100644
> > >>>>>>>>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>>>>>>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> > >>>>>>>>>> @@ -1356,10 +1356,10 @@ static int a6xx_set_supported_hw(struct
> > >>>>>>>>>> device *dev, struct a6xx_gpu *a6xx_gpu,
> > >>>>>>>>>>
> > >>>>>>>>>>            cell = nvmem_cell_get(dev, "speed_bin");
> > >>>>>>>>>>            /*
> > >>>>>>>>>> -        * -ENOENT means that the platform doesn't support
> > >>>>>>>>>> speedbin which is
> > >>>>>>>>>> -        * fine
> > >>>>>>>>>> +        * -ENOENT means no speed bin in device tree,
> > >>>>>>>>>> +        * -EOPNOTSUPP means kernel was built without CONFIG_NVMEM
> > >>>>>>>>>
> > >>>>>>>>> very minor nit, it would be nice to at least preserve the gist of the
> > >>>>>>>>> "which is fine" (ie. some variation of "this is an optional thing and
> > >>>>>>>>> things won't catch fire without it" ;-))
> > >>>>>>>>>
> > >>>>>>>>> (which is, I believe, is true, hopefully Akhil could confirm.. if not
> > >>>>>>>>> we should have a harder dependency on CONFIG_NVMEM..)
> > >>>>>>>> IIRC, if the gpu opp table in the DT uses the 'opp-supported-hw'
> > >>>>>>>> property,
> > >>>>>>>> we will see some error during boot up if we don't call
> > >>>>>>>> dev_pm_opp_set_supported_hw(). So calling "nvmem_cell_get(dev,
> > >>>>>>>> "speed_bin")"
> > >>>>>>>> is a way to test this.
> > >>>>>>>>
> > >>>>>>>> If there is no other harm, we can put a hard dependency on
> > >>>>>>>> CONFIG_NVMEM.
> > >>>>>>>
> > >>>>>>> I'm not sure if we want to go this far given the squishiness about
> > >>>>>>> module
> > >>>>>>> dependencies. As far as I know we are the only driver that uses this
> > >>>>>>> seriously
> > >>>>>>> on QCOM SoCs and this is only needed for certain targets. I don't
> > >>>>>>> know if we
> > >>>>>>> want to force every target to build NVMEM and QFPROM on our behalf.
> > >>>>>>> But maybe
> > >>>>>>> I'm just saying that because Kconfig dependencies tend to break my
> > >>>>>>> brain (and
> > >>>>>>> then Arnd has to send a patch to fix it).
> > >>>>>>>
> > >>>>>>
> > >>>>>> Hmm, good point.. looks like CONFIG_NVMEM itself doesn't have any
> > >>>>>> other dependencies, so I suppose it wouldn't be the end of the world
> > >>>>>> to select that.. but I guess we don't want to require QFPROM
> > >>>>>>
> > >>>>>> I guess at the end of the day, what is the failure mode if you have a
> > >>>>>> speed-bin device, but your kernel config misses QFPROM (and possibly
> > >>>>>> NVMEM)?  If the result is just not having the highest clk rate(s)
> > >>>>
> > >>>> Atleast on sc7180's gpu, using an unsupported FMAX breaks gmu. It won't
> > >>>> be very obvious what went wrong when this happens!
> > >>>
> > >>> Ugg, ok..
> > >>>
> > >>> I suppose we could select NVMEM, but not QFPROM, and then the case
> > >>> where QFPROM is not enabled on platforms that have the speed-bin field
> > >>> in DT will fail gracefully and all other platforms would continue on
> > >>> happily?
> > >>>
> > >>> BR,
> > >>> -R
> > >>
> > >> Sounds good to me.
> > >>
> > >
> > > You probably should do a quick test with NVMEM enabled but QFPROM
> > > disabled to confirm my theory, but I *think* that should work
> > >
> > > BR,
> > > -R
> > >
> >
> > I tried it on an sc7180 device. The suggested combo (CONFIG_NVMEM + no
> > CONFIG_QCOM_QFPROM) makes the gpu probe fail with error "failed to read
> > speed-bin. Some OPPs may not be supported by hardware". This is good
> > enough clue for the developer that he should fix the broken speedbin
> > detection.
> >
>
> Ok, great.. then sounds like selecting NVMEM is a good approach
>

btw, did anyone ever send a patch to select NVMEM?  I'm not seeing one
but I could be overlooking something

BR,
-R
