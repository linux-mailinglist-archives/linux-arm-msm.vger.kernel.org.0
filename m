Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4297E298977
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Oct 2020 10:34:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1422420AbgJZJeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Oct 2020 05:34:15 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:41665 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1422415AbgJZJeL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Oct 2020 05:34:11 -0400
Received: by mail-wr1-f65.google.com with SMTP id s9so11533574wro.8
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Oct 2020 02:34:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=gYzieEkyuY5GK4uIKGUgpkX8O/MjJBNKsXAywCS/qUs=;
        b=RSgUj4PXQdjvjhUxcBC2NkgGKsRMLzp3PYY9p4Uj7B7AfgPG3ewdfVQ2Mxj+FvMlKu
         0nM+RnXg+PoAL+CHWjAhOGn0dcjtQLB4B33Ee9ctifIVcnGBeey4DCtSyvZ/0tKbQpNJ
         IBJhSVHrSrVQvlRbv8fS4LsmShIvyYlV2SRTk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=gYzieEkyuY5GK4uIKGUgpkX8O/MjJBNKsXAywCS/qUs=;
        b=JhjJ8byXbyqKrtVLNKzuthhhrqaizPtapFDNLpSnaRa4JboaN+PJnd7tI8D4NhsScJ
         JfsEEznewG4G525bAyb7dg2AbIGvpUDpRh4NWLvYV8ZvaUwevWja0gIoIWEojUt9f+dx
         yvB0frANg92ncoPd7cZSKwuQ+KwDmLFGf2T3+q5r5frpjediMFgs7nWoH9Xmrxim+oEw
         GuJaJTwoXQ9LTvvjzJ76v8N/6ZDLrGnFMpYis0J+SwJx3J/fdvJ2uIZCLZ6MkRS2gsiE
         lFuGoNsyAV3GmcwPXNUZkffevgofe64Dw+UyI1YwfOMZHYO1H0Mujlr+m77tfVnCg2kJ
         B49Q==
X-Gm-Message-State: AOAM532HWdfOrfm8Lj8MI//aMVgCAg3XmjVloey/MdI90p2sKEF1pfjy
        JhJtgszyCOUVPfa5yKl8+UZ9OEdtqlUZXFP3
X-Google-Smtp-Source: ABdhPJwLY/UfUb4b5DuGG2QhDX+v52BtLVPVfOd8+FPAKqX9G1N3GacfhGqDO8qEumDJ6El2XwbvcQ==
X-Received: by 2002:adf:a306:: with SMTP id c6mr16496122wrb.160.1603704848072;
        Mon, 26 Oct 2020 02:34:08 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j5sm23591677wrx.88.2020.10.26.02.34.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2020 02:34:07 -0700 (PDT)
Date:   Mon, 26 Oct 2020 10:34:05 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Lucas Stach <l.stach@pengutronix.de>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single
 ring
Message-ID: <20201026093405.GG401619@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Lucas Stach <l.stach@pengutronix.de>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>
References: <20201023165136.561680-1-robdclark@gmail.com>
 <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> >
> > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > If there is only a single ring (no-preemption), everything is FIFO order
> > > and there is no need to implicit-sync.
> > >
> > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > is undefined when fences are not used to synchronize buffer usage across
> > > contexts (which is the only case where multiple different priority rings
> > > could come into play).
> >
> > Really, doesn't this break cross-device implicit sync? Okay, you may
> > not have many peripherals that rely on implicit sync on devices where
> > Adreno is usually found, but it seems rather heavy-handed.
> >
> > Wouldn't it be better to only ignore fences from your own ring context
> > in the implicit sync, like we do in the common DRM scheduler
> > (drm_sched_dependency_optimized)?
> 
> we already do this.. as was discussed on an earlier iteration of this patchset
> 
> But I'm not aware of any other non-gpu related implicit sync use-case
> (even on imx devices where display is decoupled from gpu).. I'll
> revert the patch if someone comes up with one, but otherwise lets let
> the implicit sync baggage die

The thing is, dma_resv won't die, even if implicit sync is dead. We're
using internally for activity tracking and memory management. If you don't
set these, then we can't share generic code with msm, and I think everyone
inventing their own memory management is a bit a mistake.

Now you only kill the implicit write sync stuff here, but I'm not sure
that's worth much since you still install all the read fences for
consistency. And if userspace doesn't want to be synced, they can set the
flag and do this on their own: I think you should be able to achieve
exactly the same thing in mesa.

Aside: If you're worried about overhead, you can do O(1) submit if you
manage your ppgtt like amdgpu does.
-Daniel

> 
> BR,
> -R
> 
> 
> 
> >
> > Regards,
> > Lucas
> >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > ---
> > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > index d04c349d8112..b6babc7f9bb8 100644
> > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > >       return ret;
> > >  }
> > >
> > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > >  {
> > >       int i, ret = 0;
> > >
> > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > >                               return ret;
> > >               }
> > >
> > > -             if (no_implicit)
> > > +             if (!implicit_sync)
> > >                       continue;
> > >
> > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > >       if (ret)
> > >               goto out;
> > >
> > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > >       if (ret)
> > >               goto out;
> > >
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
