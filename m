Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3B5D328496F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 Oct 2020 11:36:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726133AbgJFJgC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Oct 2020 05:36:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725939AbgJFJgC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Oct 2020 05:36:02 -0400
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com [IPv6:2a00:1450:4864:20::344])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D571C061755
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2020 02:36:02 -0700 (PDT)
Received: by mail-wm1-x344.google.com with SMTP id z22so1829267wmi.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2020 02:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=jfHRjgUc3yWmaMNP8V6npRHveQSEaYznJy9xDxqdq5Y=;
        b=V4AlHabOmn6H1w4iRNEGS0B70b8dv2DIEZuurCYdgOgzzKGxgOH6LDi0oU30jzagKc
         nRxT2MEZyLjf9RvcqMiFjcPOZKT5cchMQIVnFpIyJjAAlzwzNA+seFw9c0nwVP6J/wG+
         dE4STfKprpfEiAUbFdH0mQqVPGuDeexiySSD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=jfHRjgUc3yWmaMNP8V6npRHveQSEaYznJy9xDxqdq5Y=;
        b=MYpVNsRuhiyeRufz9ywS7FIKqgNVlxpFjC0gMO36XdQpFVuVN5htO/Z7G3eyfHQIyA
         0mLUg/Rz1CthWyq9ala9Z2XtinSjLH5+PB2c6PKmatunXhDJz+lXOLhMLYMri1000CpA
         N2DhxR3FKw5hBekHZEolw6PPQMRwctoWKz/4iplfPP/3B6iNTxX8pcz/FV/X4czDaXsK
         u/YGY67vNrcCmUOfHbNu46bLlhNNR4k3YLy1gpXiP5A9QHT6seEnrAeHEg8fkavetgra
         xc2PtYE/KNMp6MGjUcHwQro0uShPUd/2UNo7BIm/fFkQt8XmCOhSAob5ZBvy0H06BIda
         CP4A==
X-Gm-Message-State: AOAM531nV8CdrdA/YKlnwXY35Gc+FVzM+iYYBSD7CHXFQfVWtAEpE8Mh
        szmcU2OQjvs6gGRYChiHPQOyIw==
X-Google-Smtp-Source: ABdhPJzEaJYL1QdJ5uR4JBld7BCAOyXdwCbFSfIsfUiUeAGtF+t3pE5ORpDjMh0kMl0i7jqARrQBkA==
X-Received: by 2002:a7b:c95a:: with SMTP id i26mr4006324wml.25.1601976960896;
        Tue, 06 Oct 2020 02:36:00 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id k15sm3880199wrv.90.2020.10.06.02.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2020 02:36:00 -0700 (PDT)
Date:   Tue, 6 Oct 2020 11:35:58 +0200
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Hillf Danton <hdanton@sina.com>,
        Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        arm-msm <linux-arm-msm@vger.kernel.org>,
        "Kristian H . Kristensen" <hoegsberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
Subject: Re: [PATCH 13/14] drm/msm: Drop struct_mutex in shrinker path
Message-ID: <20201006093558.GZ438822@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Hillf Danton <hdanton@sina.com>, Rob Clark <robdclark@chromium.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        David Airlie <airlied@linux.ie>,
        arm-msm <linux-arm-msm@vger.kernel.org>,
        "Kristian H . Kristensen" <hoegsberg@gmail.com>,
        LKML <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>
References: <20201004192152.3298573-1-robdclark@gmail.com>
 <20201005092419.15608-1-hdanton@sina.com>
 <20201005140203.GS438822@phenom.ffwll.local>
 <CAOeoa-cqyb8NZJnJdY+A2H680+C4H0WzXhp-uYj8Fg093BqAnw@mail.gmail.com>
 <20201006004416.15040-1-hdanton@sina.com>
 <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGvyEYFa-RLrxqgXjxhiLgc-rB+dbscboROPHGPxoC-RMw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Oct 05, 2020 at 08:40:12PM -0700, Rob Clark wrote:
> On Mon, Oct 5, 2020 at 5:44 PM Hillf Danton <hdanton@sina.com> wrote:
> >
> >
> > On Mon, 5 Oct 2020 18:17:01 Kristian H. Kristensen wrote:
> > > On Mon, Oct 5, 2020 at 4:02 PM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > >
> > > > On Mon, Oct 05, 2020 at 05:24:19PM +0800, Hillf Danton wrote:
> > > > >
> > > > > On Sun,  4 Oct 2020 12:21:45
> > > > > > From: Rob Clark <robdclark@chromium.org>
> > > > > >
> > > > > > Now that the inactive_list is protected by mm_lock, and everything
> > > > > > else on per-obj basis is protected by obj->lock, we no longer depend
> > > > > > on struct_mutex.
> > > > > >
> > > > > > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/msm_gem.c          |  1 -
> > > > > >  drivers/gpu/drm/msm/msm_gem_shrinker.c | 54 --------------------------
> > > > > >  2 files changed, 55 deletions(-)
> > > > > >
> > > > > [...]
> > > > >
> > > > > > @@ -71,13 +33,8 @@ msm_gem_shrinker_scan(struct shrinker *shrinker, struct shrink_control *sc)
> > > > > >  {
> > > > > >     struct msm_drm_private *priv =
> > > > > >             container_of(shrinker, struct msm_drm_private, shrinker);
> > > > > > -   struct drm_device *dev = priv->dev;
> > > > > >     struct msm_gem_object *msm_obj;
> > > > > >     unsigned long freed = 0;
> > > > > > -   bool unlock;
> > > > > > -
> > > > > > -   if (!msm_gem_shrinker_lock(dev, &unlock))
> > > > > > -           return SHRINK_STOP;
> > > > > >
> > > > > >     mutex_lock(&priv->mm_lock);
> > > > >
> > > > > Better if the change in behavior is documented that SHRINK_STOP will
> > > > > no longer be needed.
> > > >
> > > > btw I read through this and noticed you have your own obj lock, plus
> > > > mutex_lock_nested. I strongly recommend to just cut over to dma_resv_lock
> > > > for all object lock needs (soc drivers have been terrible with this
> > > > unfortuntaly), and in the shrinker just use dma_resv_trylock instead of
> > > > trying to play clever games outsmarting lockdep.
> >
> > The trylock makes page reclaimers turn to their next target e.g. inode
> > cache instead of waiting for the mutex to be released. It makes sense
> > for instance in scenarios of mild memory pressure.
> 
> is there some behind-the-scenes signalling for this, or is this just
> down to what the shrinker callbacks return?  Generally when we get
> into shrinking, there are a big set of purgable bo's to consider, so
> the shrinker callback return wouldn't be considering just one
> potentially lock contended bo (buffer object).  Ie failing one
> trylock, we just move on to the next.
> 
> fwiw, what I've seen on the userspace bo cache vs shrinker (anything
> that is shrinker potential is in userspace bo cache and
> MADV(WONTNEED)) is that in steady state I see a very strong recycling
> of bo's (which avoids allocating and mmap'ing or mapping to gpu a new
> buffer object), so it is definitely a win in mmap/realloc bandwidth..
> in steady state there is a lot of free and realloc of same-sized
> buffers from frame to frame.
> 
> But in transient situations like moving to new game level when there
> is a heavy memory pressure and lots of freeing old
> buffers/textures/etc and then allocating new ones, I see shrinker
> kicking in hard (in android situations, not so much so with
> traditional linux userspace)

Yeah per-buffer trylock is fine. Trylock on the mm_lock (or anything else
device-global, like struct_mutex and msm_gem_shrinker_lock) I think isn't
fine, since if you're unlucky you're hogging a ton of memory and that's
the only freeable resource in the system. Going to other shrinkers won't
help when it's the gpu shrinker that has all the freeable memory.

Also other shrinkers (inode and all these) also do lots of per-object
trylocking. I think there's a canonical threshold of shrinker rounds where
you're supposed to try harder (if possible), but that doesn't apply to
dma_resv_lock.
-Daniel

> 
> BR,
> -R
> 
> >
> > > >
> > > > I recently wrote an entire blog length rant on why I think
> > > > mutex_lock_nested is too dangerous to be useful:
> > > >
> > > > https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
> > > >
> > > > Not anything about this here, just general comment. The problem extends to
> > > > shmem helpers and all that also having their own locks for everything.
> > >
> > > This is definitely a tangible improvement though - very happy to see
> > > msm_gem_shrinker_lock() go.
> > >
> > > Reviewed-by: Kristian H. Kristensen <hoegsberg@google.com>
> > >
> > > > -Daniel
> > > > --
> > > > Daniel Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > > _______________________________________________
> > > > dri-devel mailing list
> > > > dri-devel@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
