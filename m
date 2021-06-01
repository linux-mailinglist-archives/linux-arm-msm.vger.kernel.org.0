Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DAF2397541
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 16:19:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234221AbhFAOUk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 10:20:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234066AbhFAOUj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 10:20:39 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7081BC06174A
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 07:18:56 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id o2-20020a05600c4fc2b029019a0a8f959dso2035307wmq.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 07:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=788TRfnbUrWf/WZzHLMqqD0WkTRUfs23Xy3cmXUca3E=;
        b=dRqQy1u9vF65GRNZlxfjsnv8Y5iRPCoy2GN00LMqPsx2FjMW+fcu4QwrALoz3oL/8V
         C9c0yVqwelZITiACOVgMWNy/JUnI5d/NeK8yogc5jJVRKY1T3rAISZ27u68Zd0fx2xmL
         /ALfLx3ncWHDRIhFOs4hEVKf2QVpk2QqDTiNA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=788TRfnbUrWf/WZzHLMqqD0WkTRUfs23Xy3cmXUca3E=;
        b=rBJHtlmrtIOfQlxjdTqr+7P5bVDFa/pz5jk+PiXztmRgNFvp58J4GJWz6kuSuvxMQp
         AwYe/JH+Ddh9+d9yt97oOvcIjWR/qAOD1UZp3JhWmLUhlplAB6jQCueZtNemqImDkl6J
         PLycMZovQQdmZoCkqYkVbS6Xeyhq0RFuH/9fQz9cC8SfMxKi/+x4i+24nWks2sHIPadn
         MNnOytCbVu/XnQY8kzzSzQ+LHhGAS73JYFc+a+Nj2vbmjtkK3KtxswjxU6hJE7XDa0Cw
         xZNF1vROtFSZV0trtBuXweESjiRceig6FZpeI69y5/L2nba8tH+WdvdHvLjrBcIKefn7
         wpgA==
X-Gm-Message-State: AOAM5336ZWWzQiCkNttxX54pSOGdoGKOwD295W1d5rXwkkuX0JQfwOUf
        v7pXPjXHURq38x2OZ6Bql/ko9g==
X-Google-Smtp-Source: ABdhPJxUZrmoaCW0FSIx8efbn0XIn7GKcghLEM69VN4vwmvIAgv/bNBNuB/f8ZQOwOjY2yt2qyR1tg==
X-Received: by 2002:a05:600c:4ec9:: with SMTP id g9mr25760736wmq.173.1622557135056;
        Tue, 01 Jun 2021 07:18:55 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id t4sm1874151wru.53.2021.06.01.07.18.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 07:18:54 -0700 (PDT)
Date:   Tue, 1 Jun 2021 16:18:52 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a
 vblank
Message-ID: <YLZBzKlb7xpJaG4+@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        open list <linux-kernel@vger.kernel.org>,
        Matthew Brost <matthew.brost@intel.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
 <20210519183855.1523927-3-robdclark@gmail.com>
 <YKaOY3AWgHh5kplS@phenom.ffwll.local>
 <CAF6AEGv470U7fujLrJOE8fJh1o-BW3=mOpKJ45FFz=Xb8Q0D6A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGv470U7fujLrJOE8fJh1o-BW3=mOpKJ45FFz=Xb8Q0D6A@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, May 30, 2021 at 07:33:57AM -0700, Rob Clark wrote:
> On Thu, May 20, 2021 at 9:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> > > From: Rob Clark <robdclark@chromium.org>
> > >
> > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
> > >  1 file changed, 11 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index 560aaecba31b..fe10fc2e7f86 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > >       int i, ret;
> > >
> > >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> > > +             u64 vblank_count;
> > > +
> > >               if (!new_plane_state->fence)
> > >                       continue;
> > >
> > >               WARN_ON(!new_plane_state->fb);
> > >
> > > +             vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> > > +
> > >               /*
> > >                * If waiting for fences pre-swap (ie: nonblock), userspace can
> > >                * still interrupt the operation. Instead of blocking until the
> > > @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > >               if (ret)
> > >                       return ret;
> > >
> > > +             /*
> > > +              * Check if we've missed a vblank while waiting, and if we have
> > > +              * signal the fence that it's signaler should be boosted
> > > +              */
> > > +             if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> > > +                     dma_fence_boost(new_plane_state->fence);
> >
> > I think we should do a lot better here:
> > - maybe only bother doing this for single-crtc updates, and only if
> >   modeset isn't set. No one else cares about latency.
> >
> > - We should boost _right_ when we've missed the frame, so I think we
> >   should have a _timeout wait here that guesstimates when the vblank is
> >   over (might need to throw in a vblank wait if we missed) and then boost
> >   immediately. Not wait a bunch of frames (worst case) until we finally
> >   decide to boost.
> 
> I was thinking about this a bit more.. How about rather than calling
> some fence->op->boost() type thing when we are about to miss a vblank
> (IMO that is also already too late), we do something more like
> fence->ops->set_deadline() before we even wait?

Hm yeah that sounds like a clean idea.

Even more, why not add the deadline/waiter information to the callback
we're adding? That way drivers can inspect it whenever they feel like and
don't have to duplicate the tracking. And it's probably easier to
tune/adjust to the myriads of use-cases (flip target miss, userspace wait,
wakeup boost maybe too ...).

I like this direction a lot more than what we discussed with post-miss
hints thus far.

> It's probably a bit impossible for a gpu driver to really predict how
> long some rendering will take, but other cases like video decoder are
> somewhat more predictable.. the fence provider could predict given the
> remaining time until the deadline what clk rates are required to get
> you there.

Well if we do have a deadline the driver can note that in its scheduler
and arm a driver to kick the clocks. Or maybe use past history to do this
upfront.
-Daniel

> 
> BR,
> -R
> 
> 
> >
> > Otherwise I really like this, I think it's about the only real reason i915
> > isn't using atomic helpers.
> >
> > Also adding Matt B for this topic.
> > -Daniel
> >
> > > +
> > >               dma_fence_put(new_plane_state->fence);
> > >               new_plane_state->fence = NULL;
> > >       }
> > > --
> > > 2.30.2
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
