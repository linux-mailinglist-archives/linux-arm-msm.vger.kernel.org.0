Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1065397795
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jun 2021 18:11:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234114AbhFAQNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 12:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234028AbhFAQNP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 12:13:15 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 866BFC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Jun 2021 09:11:33 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id h12-20020a05600c350cb029019fae7a26cdso199807wmq.5
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Jun 2021 09:11:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=oHZtx0tJnq4NGnZOtbU7Ge91DzY+YkKV8LDOwm9HnX0=;
        b=iUTqK6T1kJwQHPPVEW0WclCi3oIKbSaTlvz3sCcmFuWo9vDEuCSbq37qd0T4q+hSue
         Mi/Hxz6azavcH5NjHfu9MQNAonDdZ0LWwbP0mrNHwKIDceaaXVYz3X85CxIsIV0QnUqZ
         17Ff42BPHBcPqRE1hSQojrfEwXeGdtjZw48K8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=oHZtx0tJnq4NGnZOtbU7Ge91DzY+YkKV8LDOwm9HnX0=;
        b=ThQADpbwZT4tc3eKLXFAgEk8DF2htAxPGWtRfxWVLKSEr9AjoeK2xqKRUVsi9OZGO5
         LGUuugDUGpSegEUq+/23K4IV5a57oG7aTQjxZH1tnER+ZlaBpCS2VtBnf9YxFw7c10yE
         Wgm4ZG/dQcMz+Z28t/RsVk7EisZvKIk6m24Y+0sPlEQ5oYbDQFms4HGZJaY0zFTOWKHN
         EWVNTzPPgbh1O5GTwonS+D5PHc61SZpaIPEaJr4nUm5G3VsngjmKOj2lQTBbImntMO3q
         HV5ng0DwB9PJVN3Ca2ELydtd+L6HxyUnChTCRGEHZGnAIZdFCHpLUEbzOeXDD/d5KQrO
         xCLw==
X-Gm-Message-State: AOAM532AKQANDGYiMNah9z7HKIn02rFD+xthSHSVvWxOI6KOnhn+czCN
        HAOba3SDfcYPGwTIgCH9heolPQ==
X-Google-Smtp-Source: ABdhPJyvJhwUB9Y7TCS1lis38aIf4uzgSN86wg7qgWT1AduNq4U5ym7MkB64zgqdULO1+P43xnfH3g==
X-Received: by 2002:a1c:cc12:: with SMTP id h18mr27042131wmb.141.1622563892183;
        Tue, 01 Jun 2021 09:11:32 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id j10sm3765164wrt.32.2021.06.01.09.11.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 09:11:31 -0700 (PDT)
Date:   Tue, 1 Jun 2021 18:11:29 +0200
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
Message-ID: <YLZcMTPlI3XDAFP+@phenom.ffwll.local>
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
 <YLZBzKlb7xpJaG4+@phenom.ffwll.local>
 <CAF6AEGvcFMejnN1032+=9E=8f2=E4CpqHiARHHQ_Bin+f5DQTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvcFMejnN1032+=9E=8f2=E4CpqHiARHHQ_Bin+f5DQTg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Jun 01, 2021 at 08:46:14AM -0700, Rob Clark wrote:
> On Tue, Jun 1, 2021 at 7:18 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Sun, May 30, 2021 at 07:33:57AM -0700, Rob Clark wrote:
> > > On Thu, May 20, 2021 at 9:29 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Wed, May 19, 2021 at 11:38:53AM -0700, Rob Clark wrote:
> > > > > From: Rob Clark <robdclark@chromium.org>
> > > > >
> > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
> > > > >  1 file changed, 11 insertions(+)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > index 560aaecba31b..fe10fc2e7f86 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > @@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > > > >       int i, ret;
> > > > >
> > > > >       for_each_new_plane_in_state(state, plane, new_plane_state, i) {
> > > > > +             u64 vblank_count;
> > > > > +
> > > > >               if (!new_plane_state->fence)
> > > > >                       continue;
> > > > >
> > > > >               WARN_ON(!new_plane_state->fb);
> > > > >
> > > > > +             vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
> > > > > +
> > > > >               /*
> > > > >                * If waiting for fences pre-swap (ie: nonblock), userspace can
> > > > >                * still interrupt the operation. Instead of blocking until the
> > > > > @@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
> > > > >               if (ret)
> > > > >                       return ret;
> > > > >
> > > > > +             /*
> > > > > +              * Check if we've missed a vblank while waiting, and if we have
> > > > > +              * signal the fence that it's signaler should be boosted
> > > > > +              */
> > > > > +             if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
> > > > > +                     dma_fence_boost(new_plane_state->fence);
> > > >
> > > > I think we should do a lot better here:
> > > > - maybe only bother doing this for single-crtc updates, and only if
> > > >   modeset isn't set. No one else cares about latency.
> > > >
> > > > - We should boost _right_ when we've missed the frame, so I think we
> > > >   should have a _timeout wait here that guesstimates when the vblank is
> > > >   over (might need to throw in a vblank wait if we missed) and then boost
> > > >   immediately. Not wait a bunch of frames (worst case) until we finally
> > > >   decide to boost.
> > >
> > > I was thinking about this a bit more.. How about rather than calling
> > > some fence->op->boost() type thing when we are about to miss a vblank
> > > (IMO that is also already too late), we do something more like
> > > fence->ops->set_deadline() before we even wait?
> >
> > Hm yeah that sounds like a clean idea.
> >
> > Even more, why not add the deadline/waiter information to the callback
> > we're adding? That way drivers can inspect it whenever they feel like and
> > don't have to duplicate the tracking. And it's probably easier to
> > tune/adjust to the myriads of use-cases (flip target miss, userspace wait,
> > wakeup boost maybe too ...).
> 
> You mean, enumerate the types of deadline?
> 
> For userspace waits, we might have a timeout, but not really
> (currently) any more information than that?  The vblank deadline is
> the only type of deadline that seems pretty clear to me.
> 
> I suppose we could do something like:
> 
>    dma_fence_set_deadline(fence, &(struct dma_fence_deadline){
>            .type = DMA_FENCE_DEADLINE_VBLANK,
>            .time = next_vblank_ktime,
>        });
> 
> to make it a bit more extensible to add more deadline types or
> additional optional information

Nah not enumerate the types of deadlines, but the types of waits. Some of
which might have a deadline (like page flip), some wont (like userspace
waiting or poll() on a dma-fd or whatever).

What I had in mind is roughly


diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
index 6ffb4b2c6371..e7c239145273 100644
--- a/include/linux/dma-fence.h
+++ b/include/linux/dma-fence.h
@@ -116,6 +116,8 @@ typedef void (*dma_fence_func_t)(struct dma_fence *fence,
 struct dma_fence_cb {
 	struct list_head node;
 	dma_fence_func_t func;
+	enume dma_fence_wait_type wait_type;
+	struct ktime deadline; /* fixme how do we indicate no deadline? */
 };
 
 /**

With that waiters, and irrespective of whether they use dma_fence_wait or
have something else like the dma-buf fd poll stuff, can indicate to the
driver what kind of wait with what kind of deadline this is.

Maybe we should make this a sub-struct, so that it can also be passed to
dma_fence_wait().
-Daniel

> 
> BR,
> -R
> 
> >
> > I like this direction a lot more than what we discussed with post-miss
> > hints thus far.
> >
> > > It's probably a bit impossible for a gpu driver to really predict how
> > > long some rendering will take, but other cases like video decoder are
> > > somewhat more predictable.. the fence provider could predict given the
> > > remaining time until the deadline what clk rates are required to get
> > > you there.
> >
> > Well if we do have a deadline the driver can note that in its scheduler
> > and arm a driver to kick the clocks. Or maybe use past history to do this
> > upfront.
> > -Daniel
> >
> > >
> > > BR,
> > > -R
> > >
> > >
> > > >
> > > > Otherwise I really like this, I think it's about the only real reason i915
> > > > isn't using atomic helpers.
> > > >
> > > > Also adding Matt B for this topic.
> > > > -Daniel
> > > >
> > > > > +
> > > > >               dma_fence_put(new_plane_state->fence);
> > > > >               new_plane_state->fence = NULL;
> > > > >       }
> > > > > --
> > > > > 2.30.2
> > > > >
> > > >
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
