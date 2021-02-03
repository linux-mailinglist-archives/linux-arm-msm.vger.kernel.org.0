Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6F4F630D717
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Feb 2021 11:11:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233731AbhBCKLO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 3 Feb 2021 05:11:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233584AbhBCKK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 3 Feb 2021 05:10:59 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9BEDC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed,  3 Feb 2021 02:10:18 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id a1so23487819wrq.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Feb 2021 02:10:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:references
         :mime-version:content-disposition:in-reply-to;
        bh=WjAb3bjxrnBBIZBFFvoXjbq0IWsGADmBvpPF9+XYq5c=;
        b=JhfNdyWRmHINUIbD+b6Ny+bIugLoaAKz0kl5fRRxFCOlffDx8oH/tIXSICsUaIGvqU
         MDcrXqlFsK+GFj6gUfpruu7WAhOvPqTSrh1HUjiTyUyZkUSMnwubKkPhUf+WRyzxit3e
         1JJC1rO4k+qWKLpSfzd0JFAiY7CeGCLe8nCaU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:references:mime-version:content-disposition
         :in-reply-to;
        bh=WjAb3bjxrnBBIZBFFvoXjbq0IWsGADmBvpPF9+XYq5c=;
        b=Ms3QCfHyMkYC/x1jf41IW4mie3OLUjlWvCLvJLUVPiUDbXDhdWlVkTtIthtBvE88mE
         H3ZnLtZkeqHuDXhxqDVAvZlY13z37O7dSKjCwYx87bofDrwz+PgoE6bH+2cykf3tp0gZ
         t970ZBR3nHRiTW8Sno9GceXh/8g4iLdXSywVMaMejzqv8NxJKRdff3h92HKxAwfVN0ph
         6D4jq8ZgYjvgnQcxUqeLDBz6n6+f1jS2qyw99f2UtX9DnU7QoFcmLhz9+XgK3ysrMaCe
         ewkXSAgr44obbXVIy9UiZgJqfHyu2L3Xk0Zjan0Y5dNYhmYLXfs9sJKEZG+yxniNTGZH
         UnGg==
X-Gm-Message-State: AOAM5311TMuMtJYB5DLv+mHji3s/C6+VQjcgTzpmsP9xSL9Dtasa7Dmv
        nW7WSkj2ileHYmxGGQYoGkIsVw==
X-Google-Smtp-Source: ABdhPJxvzaYuPsLio37fz9QR6bEnLbuirbEIPwQgVxFysZvBiDXjuW53yrL9tqCFVxPeD4h43umWqw==
X-Received: by 2002:adf:cd01:: with SMTP id w1mr2536998wrm.316.1612347017561;
        Wed, 03 Feb 2021 02:10:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id g1sm2977197wrq.30.2021.02.03.02.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Feb 2021 02:10:16 -0800 (PST)
Date:   Wed, 3 Feb 2021 11:10:15 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rob Clark <robdclark@gmail.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
Message-ID: <YBp2h2cVXrF6lBno@phenom.ffwll.local>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
References: <20210125234901.2730699-1-swboyd@chromium.org>
 <YBlz8Go2DseRWuOa@phenom.ffwll.local>
 <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 02, 2021 at 08:51:25AM -0800, Rob Clark wrote:
> On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > > Lockdep complains about an AA deadlock when rebooting the device.
> > >
> > > ============================================
> > > WARNING: possible recursive locking detected
> > > 5.4.91 #1 Not tainted
> > > --------------------------------------------
> > > reboot/5213 is trying to acquire lock:
> > > ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> > >
> > > but task is already holding lock:
> > > ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> > >
> > > other info that might help us debug this:
> > > Possible unsafe locking scenario:
> > >
> > > CPU0
> > > ----
> > > lock(&kms->commit_lock[i]);
> > > lock(&kms->commit_lock[i]);
> > >
> > > *** DEADLOCK ***
> > >
> > > May be due to missing lock nesting notation
> > >
> > > 6 locks held by reboot/5213:
> > > __arm64_sys_reboot+0x148/0x2a0
> > > device_shutdown+0x10c/0x2c4
> > > drm_atomic_helper_shutdown+0x48/0xfc
> > > modeset_lock+0x120/0x24c
> > > lock_crtcs+0x60/0xa4
> > >
> > > stack backtrace:
> > > CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
> > > Hardware name: Google Pompom (rev1) with LTE (DT)
> > > Call trace:
> > > dump_backtrace+0x0/0x1dc
> > > show_stack+0x24/0x30
> > > dump_stack+0xfc/0x1a8
> > > __lock_acquire+0xcd0/0x22b8
> > > lock_acquire+0x1ec/0x240
> > > __mutex_lock_common+0xe0/0xc84
> > > mutex_lock_nested+0x48/0x58
> > > lock_crtcs+0x60/0xa4
> > > msm_atomic_commit_tail+0x348/0x570
> > > commit_tail+0xdc/0x178
> > > drm_atomic_helper_commit+0x160/0x168
> > > drm_atomic_commit+0x68/0x80
> > >
> > > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > > the same lock, when they actually aren't. That's because we call
> > > mutex_init() in msm_kms_init() and that assigns on static key for every
> > > lock initialized in this loop. Let's allocate a dynamic number of
> > > lock_class_keys and assign them to each lock so that lockdep can figure
> > > out an AA deadlock isn't possible here.
> > >
> > > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> >
> > This smells like throwing more bad after initial bad code ...
> >
> > First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html

Some technical on the patch itself: I think you want
mutex_lock_nested(crtc->lock, drm_crtc_index(crtc)), not your own locking
classes hand-rolled. It's defacto the same, but much more obviously
correct since self-documenting.

> > Yes I know the locking you're doing here is correct, but that goes to the
> > second issue: Why is this needed? atomic_async_update helpers are supposed
> > to take care of ordering fun like this, if they're not, we need to address
> > things there. The problem that
> 
> Maybe a better solution would be helper awareness of hw that has
> double-buffered state and flush bits.. ie. something that looks a bit
> more like the internal kms fxn ptrs. Currently the locking is
> protecting something that the atomic helpers are not aware of, ie.
> we've already written previous cursor updates to hw and are just
> waiting until close to vblank to write the flush bits
> 
> But, we've been over this before. I'd tried various approaches.. the
> current scheme replaces seanpaul's earlier attempts to do it the
> "helper" way.  The current implementation does the best job of
> avoiding fps drops when the legacy cursor uapi is in play.  (And yes,
> legacy cursor + atomic ioctls is maybe not the greatest, but it is
> what it is.)

I didn't read enough of the context and got confused, the flush handling
looks all reasonable and obviously needs some locks to avoid races with
updates.

It still looks a bit strange that you need multi-crtc locks for cursor
(generally this stuff is supposed to be solved with ordering) and why the
async helpers don't work since msm has something that's pretty close
itself. Atomic+cursor is a bit nasty, but if every driver hacks this
together themselves then there's not much chance of this ever really
working well across the board. And aside from the flush bit instead of
automatic double buffering (which you're just emulating) there's not
really anything special with msm afaics. So pretty sure that if this
doesn't work for msm, it doesn't work anywhere else.
-Daniel

> 
> BR,
> -R
> 
> >
> > commit b3d91800d9ac35014e0349292273a6fa7938d402
> > Author: Krishna Manikandan <mkrishn@codeaurora.org>
> > Date:   Fri Oct 16 19:40:43 2020 +0530
> >
> >     drm/msm: Fix race condition in msm driver with async layer updates
> >
> > is _the_ reason we have drm_crtc_commit to track stuff, and Maxime has
> > recently rolled out a pile of changes to vc4 to use these things
> > correctly. Hacking some glorious hand-rolled locking for synchronization
> > of updates really should be the exception for kms drivers, not the rule.
> > And this one here doesn't look like an exception by far (the one legit I
> > know of is the locking issues amdgpu has between atomic_commit_tail and
> > gpu reset, and that one is really nasty, so not going to get fixed in
> > helpers, ever).
> >
> > Cheers, Daniel
> >
> > > ---
> > >  drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
> > >  1 file changed, 6 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > > index d8151a89e163..4735251a394d 100644
> > > --- a/drivers/gpu/drm/msm/msm_kms.h
> > > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > > @@ -157,6 +157,7 @@ struct msm_kms {
> > >        * from the crtc's pending_timer close to end of the frame:
> > >        */
> > >       struct mutex commit_lock[MAX_CRTCS];
> > > +     struct lock_class_key commit_lock_keys[MAX_CRTCS];
> > >       unsigned pending_crtc_mask;
> > >       struct msm_pending_timer pending_timers[MAX_CRTCS];
> > >  };
> > > @@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
> > >  {
> > >       unsigned i, ret;
> > >
> > > -     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> > > -             mutex_init(&kms->commit_lock[i]);
> > > +     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
> > > +             lockdep_register_key(&kms->commit_lock_keys[i]);
> > > +             __mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
> > > +                          &kms->commit_lock_keys[i]);
> > > +     }
> > >
> > >       kms->funcs = funcs;
> > >
> > >
> > > base-commit: 19c329f6808995b142b3966301f217c831e7cf31
> > > --
> > > https://chromeos.dev
> > >
> > > _______________________________________________
> > > dri-devel mailing list
> > > dri-devel@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
