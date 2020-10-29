Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D118F29F0EB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 17:14:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgJ2QOk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 12:14:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725814AbgJ2QOk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 12:14:40 -0400
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com [IPv6:2607:f8b0:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40E4DC0613D2
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 09:14:40 -0700 (PDT)
Received: by mail-ot1-x342.google.com with SMTP id n15so2796828otl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 09:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=i6etDFeKtUj+RtB8Hig0oByEs1X05vnGUjehBWAxKJ0=;
        b=JM8mmzrw2EIMWTSgXhoxYpNCZD/kbBIkLatmDmz6EvmNi2aHE4F5HWIEBMT2e9rVtj
         vee/pN885rxskj/y1aYzLuGj96hMCkTeA2H/K/mcI8cd1j3f4cM0kyZJoUbF43HcTN45
         RnviYKwKrR5iq9ojbuj7d/uUu290M4d1GlwPM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=i6etDFeKtUj+RtB8Hig0oByEs1X05vnGUjehBWAxKJ0=;
        b=J/b+i5s7ev1LxkVUuWF/rDjDI3iMUDb8FJ1QI+FA3CTxm0XfH9TYnD/qWNPjrB/toi
         SMg4LeMQO2s+2Pm2Wto56cI/EenCKvxXR7xsY236FsmKOK9HXDbNp8xykJq7gpD5293h
         1bpEVicPA1ioMSyz/wRRI0c9Q4e7pId6bJvWeOsYri2Xa1aAz4hKhohgt2eTW+/5fFlh
         AzEi22U+QmhB+un6uytRuM0bx/NqQZNB7LrVV1QPbqzMSe18i/pGlfS+5ackksux+xcb
         5v81YkftLlVA4mXikGNHaItL0c844o2xqN0kQRPEw8vCvqOq4E9Hw5bWyes+5dYVNeiz
         bWog==
X-Gm-Message-State: AOAM5327JVIaNdgUWKwGxXr/EU+iRX5i+GhXKTT1OIvRjweIKnuGNiUx
        r/THj6V4yiTp0+pbNGx4Tu8oLcgnO05FN0S6DrX+9g==
X-Google-Smtp-Source: ABdhPJzPHzC8UIBm63CxXaV40WY8W+RrSlKqzKbRX+dYTIIbYWElVjSUdt4KiCZJrMjvPqNqDV5P/bOU4CfJH1rKOi0=
X-Received: by 2002:a9d:6e81:: with SMTP id a1mr3667472otr.303.1603988079536;
 Thu, 29 Oct 2020 09:14:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165136.561680-1-robdclark@gmail.com> <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com> <20201026093405.GG401619@phenom.ffwll.local>
In-Reply-To: <20201026093405.GG401619@phenom.ffwll.local>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 29 Oct 2020 17:14:28 +0100
Message-ID: <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single ring
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
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > >
> > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > From: Rob Clark <robdclark@chromium.org>
> > > >
> > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > and there is no need to implicit-sync.
> > > >
> > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > is undefined when fences are not used to synchronize buffer usage across
> > > > contexts (which is the only case where multiple different priority rings
> > > > could come into play).
> > >
> > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > not have many peripherals that rely on implicit sync on devices where
> > > Adreno is usually found, but it seems rather heavy-handed.
> > >
> > > Wouldn't it be better to only ignore fences from your own ring context
> > > in the implicit sync, like we do in the common DRM scheduler
> > > (drm_sched_dependency_optimized)?
> >
> > we already do this.. as was discussed on an earlier iteration of this patchset
> >
> > But I'm not aware of any other non-gpu related implicit sync use-case
> > (even on imx devices where display is decoupled from gpu).. I'll
> > revert the patch if someone comes up with one, but otherwise lets let
> > the implicit sync baggage die
>
> The thing is, dma_resv won't die, even if implicit sync is dead. We're
> using internally for activity tracking and memory management. If you don't
> set these, then we can't share generic code with msm, and I think everyone
> inventing their own memory management is a bit a mistake.
>
> Now you only kill the implicit write sync stuff here, but I'm not sure
> that's worth much since you still install all the read fences for
> consistency. And if userspace doesn't want to be synced, they can set the
> flag and do this on their own: I think you should be able to achieve
> exactly the same thing in mesa.
>
> Aside: If you're worried about overhead, you can do O(1) submit if you
> manage your ppgtt like amdgpu does.

So just remember a use-case which is maybe a bit yucky, but it is
actually possible to implement race-free. If you have implicit sync.

There's screen-capture tool in mplayer and obs which capture your
compositor by running getfb2 in a loop. It works, and after some
initial screaming I realized it does actually work race-free. If you
have implicit sync.

I really don't think you can sunset this, as much as you want to. And
sunsetting it inconsistently is probably the worst.
-Daniel

> -Daniel
>
> >
> > BR,
> > -R
> >
> >
> >
> > >
> > > Regards,
> > > Lucas
> > >
> > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > ---
> > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > >       return ret;
> > > >  }
> > > >
> > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > >  {
> > > >       int i, ret = 0;
> > > >
> > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > >                               return ret;
> > > >               }
> > > >
> > > > -             if (no_implicit)
> > > > +             if (!implicit_sync)
> > > >                       continue;
> > > >
> > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > >       if (ret)
> > > >               goto out;
> > > >
> > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > >       if (ret)
> > > >               goto out;
> > > >
> > >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch



-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
