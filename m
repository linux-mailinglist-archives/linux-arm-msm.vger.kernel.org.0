Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2095229F406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Oct 2020 19:23:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725963AbgJ2SXB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Oct 2020 14:23:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725840AbgJ2SXB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Oct 2020 14:23:01 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 975CDC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 11:23:00 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id a72so723067wme.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2020 11:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=WptYepIxvUtBGbdfe98byMus1rF84W8IHfRhIetB8kE=;
        b=RQBKJR+7mIXmVt2BzbUwRmfEBlPWlq+vo62QPLGc5veKhuZtO2NmyOyX6KqEa1cc/V
         Pz9XOpHJ6eo/sdS5lsc4BUAU+00BrTZ5SZd1Y9nLLzCOZ4x68BFzBDGCOdzdT1K9ldrC
         yGPHEjqMynYomFJgV0EfMfpmEf+0TFA+yueS8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=WptYepIxvUtBGbdfe98byMus1rF84W8IHfRhIetB8kE=;
        b=jlhFO0+ps555OpRf6lwNT3wYf73bGwGZjtgjlPWYoGC3DZnQKcAwg0O9MYuibHkt2s
         TN90K8eS1nHlD12wDUeaMNpK2/3dxgjwQtx95Z8rzHbsho73OKgQe/0HwYEw3Rie0Ps6
         tebu6TuNy+XbBVmMTq3eipmtMWoxB0/t/R/GmyFQI71UKFNZvO0cDVfzmaERLD6Irf6t
         XBwi/knw3UwAZONqo1zicfqeXF01PMBBLIl/HSTJ7Hqo9Hhxxw4q/au1IZ18V0IGCmqb
         rekjOZ9p7m7b573L6K4h9ged/IEEin38Yjdc8ffRRyqJKElss4lkwjP9yWWTY3mAKf1c
         VgXA==
X-Gm-Message-State: AOAM531nNh+naVtwrT51ePEKh3Fn37ipPG4ZsjuqCxyYi3RpedoG3Z1D
        QYi2yS1i06XHJd5xSqKV3r0gkrukAjOAnkWW
X-Google-Smtp-Source: ABdhPJyp95YENdHwZ66lxLNl0XS2/n4giFjn2XgtRCJ954OsgnABOBSWtRN3hojBXjSHm5FxATl9fQ==
X-Received: by 2002:a1c:7c1a:: with SMTP id x26mr170768wmc.4.1603995779199;
        Thu, 29 Oct 2020 11:22:59 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id o184sm1025591wmo.37.2020.10.29.11.22.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 11:22:58 -0700 (PDT)
Date:   Thu, 29 Oct 2020 19:22:56 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
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
Message-ID: <20201029182256.GD401619@phenom.ffwll.local>
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
 <20201026093405.GG401619@phenom.ffwll.local>
 <CAKMK7uHK27hMu+zSR0O35gR-Nq-JDXpXWBFXPBcXUhOi_3AKnw@mail.gmail.com>
 <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGsSY2WtQ33mSZFmju7bSkjP3Zsi2vBnGDy35+YFCWu7qw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 29, 2020 at 09:59:09AM -0700, Rob Clark wrote:
> On Thu, Oct 29, 2020 at 9:14 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Oct 26, 2020 at 10:34 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Fri, Oct 23, 2020 at 08:49:14PM -0700, Rob Clark wrote:
> > > > On Fri, Oct 23, 2020 at 11:20 AM Lucas Stach <l.stach@pengutronix.de> wrote:
> > > > >
> > > > > On Fr, 2020-10-23 at 09:51 -0700, Rob Clark wrote:
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > If there is only a single ring (no-preemption), everything is FIFO order
> > > > > > and there is no need to implicit-sync.
> > > > > >
> > > > > > Mesa should probably just always use MSM_SUBMIT_NO_IMPLICIT, as behavior
> > > > > > is undefined when fences are not used to synchronize buffer usage across
> > > > > > contexts (which is the only case where multiple different priority rings
> > > > > > could come into play).
> > > > >
> > > > > Really, doesn't this break cross-device implicit sync? Okay, you may
> > > > > not have many peripherals that rely on implicit sync on devices where
> > > > > Adreno is usually found, but it seems rather heavy-handed.
> > > > >
> > > > > Wouldn't it be better to only ignore fences from your own ring context
> > > > > in the implicit sync, like we do in the common DRM scheduler
> > > > > (drm_sched_dependency_optimized)?
> > > >
> > > > we already do this.. as was discussed on an earlier iteration of this patchset
> > > >
> > > > But I'm not aware of any other non-gpu related implicit sync use-case
> > > > (even on imx devices where display is decoupled from gpu).. I'll
> > > > revert the patch if someone comes up with one, but otherwise lets let
> > > > the implicit sync baggage die
> > >
> > > The thing is, dma_resv won't die, even if implicit sync is dead. We're
> > > using internally for activity tracking and memory management. If you don't
> > > set these, then we can't share generic code with msm, and I think everyone
> > > inventing their own memory management is a bit a mistake.
> > >
> > > Now you only kill the implicit write sync stuff here, but I'm not sure
> > > that's worth much since you still install all the read fences for
> > > consistency. And if userspace doesn't want to be synced, they can set the
> > > flag and do this on their own: I think you should be able to achieve
> > > exactly the same thing in mesa.
> > >
> > > Aside: If you're worried about overhead, you can do O(1) submit if you
> > > manage your ppgtt like amdgpu does.
> >
> > So just remember a use-case which is maybe a bit yucky, but it is
> > actually possible to implement race-free. If you have implicit sync.
> >
> > There's screen-capture tool in mplayer and obs which capture your
> > compositor by running getfb2 in a loop. It works, and after some
> > initial screaming I realized it does actually work race-free. If you
> > have implicit sync.
> >
> > I really don't think you can sunset this, as much as you want to. And
> > sunsetting it inconsistently is probably the worst.
> 
> For the case where you only have a single ring, as long as it is
> importing the fb in to egl to read it (which it would need to do to
> get a linear view), this would still all work

Hm right we still have the implicit sync of the ringbuffer. At least until
you add a submit scheduler to msm ...

> (but I may drop this patch because it is just a micro-optimization and
> seems to cause more confusion)

Yeah I'd say without numbers to justify it it feels a bit on thin ice :-)
-Daniel

> 
> BR,
> -R
> 
> 
> > -Daniel
> >
> > > -Daniel
> > >
> > > >
> > > > BR,
> > > > -R
> > > >
> > > >
> > > >
> > > > >
> > > > > Regards,
> > > > > Lucas
> > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_gem_submit.c | 7 ++++---
> > > > > >  1 file changed, 4 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > index d04c349d8112..b6babc7f9bb8 100644
> > > > > > --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> > > > > > @@ -283,7 +283,7 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
> > > > > >       return ret;
> > > > > >  }
> > > > > >
> > > > > > -static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > > +static int submit_fence_sync(struct msm_gem_submit *submit, bool implicit_sync)
> > > > > >  {
> > > > > >       int i, ret = 0;
> > > > > >
> > > > > > @@ -303,7 +303,7 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
> > > > > >                               return ret;
> > > > > >               }
> > > > > >
> > > > > > -             if (no_implicit)
> > > > > > +             if (!implicit_sync)
> > > > > >                       continue;
> > > > > >
> > > > > >               ret = msm_gem_sync_object(&msm_obj->base, submit->ring->fctx,
> > > > > > @@ -774,7 +774,8 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
> > > > > >       if (ret)
> > > > > >               goto out;
> > > > > >
> > > > > > -     ret = submit_fence_sync(submit, !!(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > > +     ret = submit_fence_sync(submit, (gpu->nr_rings > 1) &&
> > > > > > +                     !(args->flags & MSM_SUBMIT_NO_IMPLICIT));
> > > > > >       if (ret)
> > > > > >               goto out;
> > > > > >
> > > > >
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
