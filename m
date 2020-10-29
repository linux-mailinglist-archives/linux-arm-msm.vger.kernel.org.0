Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 72B3829F26A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 17:59:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727099AbgJ2Q7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 12:59:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727096AbgJ2Q7W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 12:59:22 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FC6C0613CF;
        Thu, 29 Oct 2020 09:59:22 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id i1so3598927wro.1;
        Thu, 29 Oct 2020 09:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7VGv15Yq8X9g6e+gf0FDckPU0qrS/WHWWujZxgkmrMs=;
        b=g25OqX81bvsvR43E8cgMbNgVXDl/xtQUeIeFkvpCDHJ10AxaIcy/yKs4PGhMs4JOce
         iGPQtqpoX73eegvR60CR4E/CB7npEe6+9FFNPYRom/JZJ4iysuY933ZTxmbxdEr5tA2O
         HI9yzImMt3LPlGGF3h0eLfTTbQek3p+jKE25f9/tRXbg6QWBYwtgxWMS4oRNLrlWBrYZ
         nIWZkYR5fegnyQAIukC+zkuaok2aD95GsNJl9CUGMcCFkjbW8srmqpVyfsYS/ZBWbPqn
         utTkVbmV5r2Fuf/wGBw0DOSyPuKaQT7gkwWm2+fZ8iDYMfdutjt8cmwS5A/HElHKKPzN
         NbIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7VGv15Yq8X9g6e+gf0FDckPU0qrS/WHWWujZxgkmrMs=;
        b=s8eNY9n/zsigXHavjyuWlfdyBdO45CNTTGovydhCHcxPC7WltnnGaETlIF2F2lK7kw
         S3Gdk3vpc0L+NBzINlz78xXLHS3QzxF4+oih1CJW/ryKVToyXrp29aDf0afvk/Gf5KSv
         A2FODQ7WNb43l3On4U0XuieKq9+wuoA3KZxIhBobaUGhy4vT4ae+wL+ytsaWdCTPtJ8f
         ZNHFPdDDfbn9NT8aYn2EVVfG1dhUW6kTV7O7Pq6HnCRqWsT2XYWMc8Twg9eMk321L5aH
         2ag2tDeZ11k8u0Ua+LzrPRA5N+51hKu/Mq6cMpvi0tjnyitpeuGUdTXyQV5wcvhuLzcZ
         LNEA==
X-Gm-Message-State: AOAM533EC9x5Wlu5w0BjbSxT02ZTFYtH2PgHA8rUAUrP9pfVYkBjlnnh
        R/Puw7js1AGU3+3vv2BWtCUzzJDXu+DIxyik4Eg=
X-Google-Smtp-Source: ABdhPJx4mzwgbAWmUZDgmJL1/UXZRiG1CC0XN7/hwqje6iGm36Z0pEHcIOwcfqGS/sv3u+IgfkW5/froOYLrjKalhZQ=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr6874410wrg.83.1603990760660;
 Thu, 29 Oct 2020 09:59:20 -0700 (PDT)
MIME-Version: 1.0
References: <20201023165136.561680-1-robdclark@gmail.com> <20201023165136.561680-24-robdclark@gmail.com>
 <d0fb714b99f13bea6000ecd17fba324433782ae5.camel@pengutronix.de>
 <CAF6AEGsf=pJ5H4guvL-+AAkK0PwCZ5g9k3K=7UPYzFmr02ReoA@mail.gmail.com>
 <20201026093405.GG401619@phenom.ffwll.local> <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
In-Reply-To: <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 29 Oct 2020 09:59:09 -0700
Message-ID: <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
Subject: Re: [PATCH v4 23/23] drm/msm: Don't implicit-sync if only a single ring
To:     Daniel Vetter <daniel@ffwll.ch>
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

On Thu, Oct 29, 2020 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > >
> > > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > > and there is no need to implicit-sync.
> > > > >
> > > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > > is undefined when fences are not used to synchronize buffer usage across
> > > > > contexts (which is the only case where multiple different priority rings
> > > > > could come into play).
> > > >
> > > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > > not have many peripherals that rely on implicit sync on devices where
> > > > Adreno is usually found, but it seems rather heavy-handed.
> > > >
> > > > Wouldn't it be better to only ignore fences from your own ring context
> > > > in the implicit sync, like we do in the common DRM scheduler
> > > > (drm_sched_dependency_optimized)?
> > >
> > > we already do this.. as was discussed on an earlier iteration of this patchset
> > >
> > > But I'm not aware of any other non-gpu related implicit sync use-case
> > > (even on imx devices where display is decoupled from gpu).. I'll
> > > revert the patch if someone comes up with one, but otherwise lets let
> > > the implicit sync baggage die
> >
> > The thing is, dma_resv won't die, even if implicit sync is dead. We're
> > using internally for activity tracking and memory management. If you don't
> > set these, then we can't share generic code with msm, and I think everyone
> > inventing their own memory management is a bit a mistake.
> >
> > Now you only kill the implicit write sync stuff here, but I'm not sure
> > that's worth much since you still install all the read fences for
> > consistency. And if userspace doesn't want to be synced, they can set the
> > flag and do this on their own: I think you should be able to achieve
> > exactly the same thing in mesa.
> >
> > Aside: If you're worried about overhead, you can do O(1) submit if you
> > manage your ppgtt like amdgpu does.
>
> So just remember a use-case which is maybe a bit yucky, but it is
> actually possible to implement race-free. If you have implicit sync.
>
> There's screen-capture tool in mplayer and obs which capture your
> compositor by running getfb2 in a loop. It works, and after some
> initial screaming I realized it does actually work race-free. If you
> have implicit sync.
>
> I really don't think you can sunset this, as much as you want to. And
> sunsetting it inconsistently is probably the worst.

For the case where you only have a single ring, as long as it is
importing the fb in to egl to read it (which it would need to do to
get a linear view), this would still all work

(but I may drop this patch because it is just a micro-optimization and
seems to cause more confusion)

BR,
-R


> -Daniel
>
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > >
> > >
> > > >
> > > > Regards,
> > > > Lucas
> > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > > >       return ret;
> > > > >  }
> > > > >
> > > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > > >  {
> > > > >       int i, ret = 0;
> > > > >
> > > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > >                               return ret;
> > > > >               }
> > > > >
> > > > > -             if (no_implicit)
> > > > > +             if (!implicit_sync)
> > > > >                       continue;
> > > > >
> > > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > >       if (ret)
> > > > >               goto out;
> > > > >
> > > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
