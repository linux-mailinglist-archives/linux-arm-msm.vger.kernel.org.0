Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6745228BB8A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Oct 2020 17:07:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389015AbgJLPHv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Oct 2020 11:07:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388977AbgJLPHv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Oct 2020 11:07:51 -0400
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com [IPv6:2a00:1450:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74E03C0613D0;
        Mon, 12 Oct 2020 08:07:51 -0700 (PDT)
Received: by mail-wr1-x442.google.com with SMTP id g12so19568582wrp.10;
        Mon, 12 Oct 2020 08:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N63w/hby23Xo2ev/1aEpCrQGDov9SsqcHUiTP2skbiI=;
        b=gbXCeP8b5TF9IDNUV4TODyi0GqMmcmmkbw9MLIQ9qDq52DVtZUZ63yoTWGXllZh1jN
         SkcFCJX1FdeMdwC9XoXvKfl9/+hVW+JY1aveRK30r8h5c06Tj1RWFA0NGY2XVc/5hIOn
         ygTf/XAGuVAfeRT0ic71adgRKeojqB/daFJ9bf7f/Gz4x+X1+9dYdGYmRPOX/fpHxNH5
         3Vi7i8APFHQc/GOt8/Mt5/LLgeEKSClOzmQ2b099rU8d/zmdckwl/Dv4dmsF2SOCr1Hp
         a0XL/l8t0i+76OwTX/3BZUK5DxX3fMBPPrar4I6mMDiKrpPSyUkipy3ieVcxI8bGLPnB
         v+GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N63w/hby23Xo2ev/1aEpCrQGDov9SsqcHUiTP2skbiI=;
        b=tGGnFkv2qQjbVUBvqdnS1ld4rLRysY7jm+6H+Y68J7Mhat1sO7sTWbh3VRwIWmDZob
         6h66UY7JKBqZXevTBlmsndMdhGM7kMdAd3TMoJb7zP465UTYcXmmap4stqbkaEUHzcs8
         6dR+ar/0gQs3JE1e8zcRHnUwLC+DPjy4WkGCRJDkTjtVMdyvy4LGqzndJvmtH22hqgRP
         CUSTHj1q01r2cXB9GfYREOzfp/8glI1u7rSGX5ophhWevOse17K7Bxz7q119y2z/2QB3
         e3sUcsnGRnfjM4x++VJDwaRNo3nZbDFzLtOv/y6M3OpWFKLr+XWDJNOT5y0GROB7eBCH
         wPog==
X-Gm-Message-State: AOAM531miZQwr1iW+YTmf539pqiQtBIFbEw4uVkA/L5yn5JHkLzmvRqO
        ZgCy6TYgfNuj1ULojDyrfiov1ggAJQ8BxurLIQk=
X-Google-Smtp-Source: ABdhPJw1J1uRF+oqzk1e06jyzWbAQmoo5BlAKp5GN8GdeH726h8oJY64szLqMuzUfvU3UdrRFzhjdTg78fBEFnzzN4I=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr30811932wrg.83.1602515270083;
 Mon, 12 Oct 2020 08:07:50 -0700 (PDT)
MIME-Version: 1.0
References: <20201012020958.229288-1-robdclark@gmail.com> <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
In-Reply-To: <20201012144018.GB438822@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 12 Oct 2020 08:07:38 -0700
Message-ID: <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
Subject: Re: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single ring
To:     Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > is only a single ring (no-preemption), everything is FIFO order and
> > there is no need to implicit-sync.
> >
> > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > is undefined when fences are not used to synchronize buffer usage across
> > contexts (which is the only case where multiple different priority rings
> > could come into play).
>
> Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> confused by your commit message?

No, I don't think so.  If there is only a single priority level
ringbuffer (ie. no preemption to higher priority ring) then everything
is inherently FIFO order.

For cases where we are sharing buffers with something external to drm,
explicit sync will be used.  And we don't implicit sync with display,
otherwise x11 (frontbuffer rendering) would not work

BR,
-R

> Since for these protocols we do expect implicit sync accross processes to
> work. Even across devices (and nvidia have actually provided quite a bunch
> of patches to make this work in i915 - ttm based drivers get this right,
> plus dumb scanout drivers using the right helpers also get this all
> right).
> -Daniel
>
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > index 3151a0ca8904..c69803ea53c8 100644
> > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> >       return ret;
> >  }
> >
> > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> >  {
> >       int i, ret = 0;
> >
> > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> >                               return ret;
> >               }
> >
> > -             if (no_implicit)
> > +             if (!implicit_sync)
> >                       continue;
> >
> >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> >       if (ret)
> >               goto out;
> >
> > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> >       if (ret)
> >               goto out;
> >
> > --
> > 2.26.2
> >
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
