Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 511F928CC38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 13:08:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730451AbgJMLIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 07:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730428AbgJMLIb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 07:08:31 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DA40C0613D0
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 04:08:31 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id d81so20510621wmc.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2020 04:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=uvxObDwTo5Y8F/KuyP+1hkA480rLi769JHi4wPHoyZo=;
        b=OjLB26BnBY0bTsdHD3EzrtKyC81oM/0JTZCn6CLgyXf7zcDUfy5vEiXi3UDSzVmHDi
         +28SDYfaM8aC9c0gvCjcQjZSkVZiSn1tj4DX9sZ7XtG7z0O9zDzWRQtW0bl4JEUVlmj6
         oHncYXBeGhKdacVIldQq+ga8Rp+OxaRjm6pSI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=uvxObDwTo5Y8F/KuyP+1hkA480rLi769JHi4wPHoyZo=;
        b=R3EPjo6Vjd9jQzJTIQM1Z+arHhA8Zct+RuEkUpsFAxyTQAHbZDNhlUECSpjNzl+SM2
         98pM2oT+XS8PSipaZgIp7Cxzs5fgE486Zt3zupX7e1apVIBuKFuLujarEIy8yJ/RfA5S
         y9kTpKj0R94dxPtnfiq3pnOvEYQMciajsGyxfdSShcSz+srs9MHAwCP3RM34Hy1c7v0G
         oLCHBwDnCxltJXZnLNRgZ5rIDivc0d48POt5TUQlkqyZV4rtRgUA4ufTlXWnW/ow1WyN
         6ofvku/mzRBrl01WUhynhfIbb6tkJqBjt2sp2FpUPMLTrQMf7cmv7tGMB8YKlBxYGuY2
         LISg==
X-Gm-Message-State: AOAM533lgptTyDtbV+gt10nKvJOLVKOqp/PytUAYnCdxoeSUpoEvMum/
        dbiMVOCEMrsiC9G1fCaL9RgVpg==
X-Google-Smtp-Source: ABdhPJwdxWAoTqe7At2F5tTQxz1+7Sey1hlKtS1VILSfOid9lZqdcUgzZZ28B6xcbL7mDDIeJVxKpg==
X-Received: by 2002:a1c:ddc2:: with SMTP id u185mr15579789wmg.21.1602587309567;
        Tue, 13 Oct 2020 04:08:29 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id v11sm13304289wml.26.2020.10.13.04.08.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2020 04:08:28 -0700 (PDT)
Date:   Tue, 13 Oct 2020 13:08:26 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH v2 22/22] drm/msm: Don't implicit-sync if only a single
 ring
Message-ID: <20201013110826.GD438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20201012020958.229288-1-robdclark@gmail.com>
 <20201012020958.229288-23-robdclark@gmail.com>
 <20201012144018.GB438822@phenom.ffwll.local>
 <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuZ0QOCbJDTF=FsHsbJ9J5rqLLPJexk_EvX+SxPGFZLDQ@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 12, 2020 at 08:07:38AM -0700, Rob Clark wrote:
> On Mon, Oct 12, 2020 at 7:40 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sun, Oct 11, 2020 at 07:09:49PM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Any cross-device sync use-cases *must* use explicit sync.  And if there
> > > is only a single ring (no-preemption), everything is FIFO order and
> > > there is no need to implicit-sync.
> > >
> > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > is undefined when fences are not used to synchronize buffer usage across
> > > contexts (which is the only case where multiple different priority rings
> > > could come into play).
> >
> > Uh does this mean msm is broken on dri2/3 and wayland? Or I'm I just
> > confused by your commit message?
> 
> No, I don't think so.  If there is only a single priority level
> ringbuffer (ie. no preemption to higher priority ring) then everything
> is inherently FIFO order.

Well eventually you get a scheduler I guess/hope :-)

> For cases where we are sharing buffers with something external to drm,
> explicit sync will be used.  And we don't implicit sync with display,
> otherwise x11 (frontbuffer rendering) would not work

Uh now I'm even more confused. The implicit sync fences in dma_resv are
kinda for everyone. That's also why dma_resv with the common locking
approach is a useful idea.

So display should definitely support implicit sync, and iirc msm does have
the helper hooked up.

Wrt other subsystems, I guess passing dma_fence around somehow doesn't fit
into v4l (the patches never landed), so v4l doesn't do any kind of sync
right now. But this could be fixed. Not sure what else is going on.

So I guess I still have no idea why you put that into the commit message.

btw for what you're trying to do yourself, the way to do this is to
allocate a fence timeline for your engine, compare fences, and no-op them
all out if their own the same timeline.
-Daniel

> 
> BR,
> -R
> 
> > Since for these protocols we do expect implicit sync accross processes to
> > work. Even across devices (and nvidia have actually provided quite a bunch
> > of patches to make this work in i915 - ttm based drivers get this right,
> > plus dumb scanout drivers using the right helpers also get this all
> > right).
> > -Daniel
> >
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index 3151a0ca8904..c69803ea53c8 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -277,7 +277,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > >       return ret;
> > >  }
> > >
> > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > >  {
> > >       int i, ret = 0;
> > >
> > > @@ -297,7 +297,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                               return ret;
> > >               }
> > >
> > > -             if (no_implicit)
> > > +             if (!implicit_sync)
> > >                       continue;
> > >
> > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > @@ -768,7 +768,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       if (ret)
> > >               goto out;
> > >
> > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > >       if (ret)
> > >               goto out;
> > >
> > > --
> > > 2.26.2
> > >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
