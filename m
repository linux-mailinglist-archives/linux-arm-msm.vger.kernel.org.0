Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CA8230C6AF
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Feb 2021 17:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236831AbhBBQzC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Feb 2021 11:55:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236834AbhBBQwT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Feb 2021 11:52:19 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36A23C0613ED;
        Tue,  2 Feb 2021 08:51:38 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id c4so18498279wru.9;
        Tue, 02 Feb 2021 08:51:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=FUh1SHaxwz6wV+mTfz+rM+DZyASDNdQ7LTt59VBtzYg=;
        b=ChcSq8GkgKAcEUIOk7tKm/Zt74+qghTD48ZWWJioFxLy2afAWUbevTGdif63pv7ico
         7nqK/mlscOq8Gw/qGx5zoIC0ni2PxRNXT2B5nG89vOk0uViU2oLc75FpD9kYowwlSEkK
         /uNtqZ1iJk+SeG6R+Y/KKLx/GQkOY/fXv6B6+PSfvWFx95EZHcl97ozv5zldfIZH0Vfz
         ER9JHbZQVPPYnOTWZCHdkz+iD97uvcRlwlaWd4oQCCLCUefSJ3ZAHbqJwDSMhZStaWhP
         QCGFZF+qQWrB13RxsEKvGzZg3vkUY7hgXktarNJETui6dgt5/BKJoNNxBvZcI04zKtjV
         d7pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=FUh1SHaxwz6wV+mTfz+rM+DZyASDNdQ7LTt59VBtzYg=;
        b=DAoDoXpR+dWBlQ4CTxX3IZ9z+EmN7ZRninhA2O1yYT3LAE0YmNfFEFERKLwN5EN3lR
         Pm6cuFxx5L9PnGhyDlddVXp2248xRXJZOtBwKUoa+WgvYkANLj55FoxZnuaufonar9DH
         OkM1GMN7zGkxD7WJxG2ORtAUkJnodTKdAaQaPlr/i6vQj0B2eVaYeIM3s67GtcyDUzDq
         kioWy9xBXgXJ9nWN9VClfWn060VUoLGiT0dJ90Dm42iNn4OLHop+d/afK1+XfxiR+d0z
         1oOfhd/jEY4xA9j3B5vlk8cq65TNAqGqMlG6+vNhD9nDbmXetKYZVvfAf9x3nJQINq7i
         JYhQ==
X-Gm-Message-State: AOAM531Lg6/SPWaMX8K4ukkQ6Rp5iE7jb02igAWlgg0sgRZCiXwJEmCr
        ckXO5S6cDVNYRzmfGBeAXLoxtwDjZlNUx+9afmY=
X-Google-Smtp-Source: ABdhPJwjq0yg6OkisWlalK57f8Jzt4bEGlVfIHE/UI1fajIpSNpmvP6Tpm0vCZ/lbhGk6giCXv5n0KCsXe1Qtx7yHFY=
X-Received: by 2002:adf:902a:: with SMTP id h39mr24574987wrh.147.1612284696898;
 Tue, 02 Feb 2021 08:51:36 -0800 (PST)
MIME-Version: 1.0
References: <20210125234901.2730699-1-swboyd@chromium.org> <YBlz8Go2DseRWuOa@phenom.ffwll.local>
In-Reply-To: <YBlz8Go2DseRWuOa@phenom.ffwll.local>
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 2 Feb 2021 08:51:25 -0800
Message-ID: <CAF6AEGuWhGuzxsBquj-WLSwa83r+zO7jAQ9ten2m+2KtoGpYSw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/kms: Make a lock_class_key for each crtc mutex
To:     Stephen Boyd <swboyd@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Tue, Feb 2, 2021 at 7:46 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Mon, Jan 25, 2021 at 03:49:01PM -0800, Stephen Boyd wrote:
> > Lockdep complains about an AA deadlock when rebooting the device.
> >
> > ============================================
> > WARNING: possible recursive locking detected
> > 5.4.91 #1 Not tainted
> > --------------------------------------------
> > reboot/5213 is trying to acquire lock:
> > ffffff80d13391b0 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> >
> > but task is already holding lock:
> > ffffff80d1339110 (&kms->commit_lock[i]){+.+.}, at: lock_crtcs+0x60/0xa4
> >
> > other info that might help us debug this:
> > Possible unsafe locking scenario:
> >
> > CPU0
> > ----
> > lock(&kms->commit_lock[i]);
> > lock(&kms->commit_lock[i]);
> >
> > *** DEADLOCK ***
> >
> > May be due to missing lock nesting notation
> >
> > 6 locks held by reboot/5213:
> > __arm64_sys_reboot+0x148/0x2a0
> > device_shutdown+0x10c/0x2c4
> > drm_atomic_helper_shutdown+0x48/0xfc
> > modeset_lock+0x120/0x24c
> > lock_crtcs+0x60/0xa4
> >
> > stack backtrace:
> > CPU: 4 PID: 5213 Comm: reboot Not tainted 5.4.91 #1
> > Hardware name: Google Pompom (rev1) with LTE (DT)
> > Call trace:
> > dump_backtrace+0x0/0x1dc
> > show_stack+0x24/0x30
> > dump_stack+0xfc/0x1a8
> > __lock_acquire+0xcd0/0x22b8
> > lock_acquire+0x1ec/0x240
> > __mutex_lock_common+0xe0/0xc84
> > mutex_lock_nested+0x48/0x58
> > lock_crtcs+0x60/0xa4
> > msm_atomic_commit_tail+0x348/0x570
> > commit_tail+0xdc/0x178
> > drm_atomic_helper_commit+0x160/0x168
> > drm_atomic_commit+0x68/0x80
> >
> > This is because lockdep thinks all the locks taken in lock_crtcs() are
> > the same lock, when they actually aren't. That's because we call
> > mutex_init() in msm_kms_init() and that assigns on static key for every
> > lock initialized in this loop. Let's allocate a dynamic number of
> > lock_class_keys and assign them to each lock so that lockdep can figure
> > out an AA deadlock isn't possible here.
> >
> > Fixes: b3d91800d9ac ("drm/msm: Fix race condition in msm driver with async layer updates")
> > Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> > Signed-off-by: Stephen Boyd <swboyd@chromium.org>
>
> This smells like throwing more bad after initial bad code ...
>
> First a rant: https://blog.ffwll.ch/2020/08/lockdep-false-positives.html
>
> Yes I know the locking you're doing here is correct, but that goes to the
> second issue: Why is this needed? atomic_async_update helpers are supposed
> to take care of ordering fun like this, if they're not, we need to address
> things there. The problem that

Maybe a better solution would be helper awareness of hw that has
double-buffered state and flush bits.. ie. something that looks a bit
more like the internal kms fxn ptrs. Currently the locking is
protecting something that the atomic helpers are not aware of, ie.
we've already written previous cursor updates to hw and are just
waiting until close to vblank to write the flush bits

But, we've been over this before. I'd tried various approaches.. the
current scheme replaces seanpaul's earlier attempts to do it the
"helper" way.  The current implementation does the best job of
avoiding fps drops when the legacy cursor uapi is in play.  (And yes,
legacy cursor + atomic ioctls is maybe not the greatest, but it is
what it is.)

BR,
-R

>
> commit b3d91800d9ac35014e0349292273a6fa7938d402
> Author: Krishna Manikandan <mkrishn@codeaurora.org>
> Date:   Fri Oct 16 19:40:43 2020 +0530
>
>     drm/msm: Fix race condition in msm driver with async layer updates
>
> is _the_ reason we have drm_crtc_commit to track stuff, and Maxime has
> recently rolled out a pile of changes to vc4 to use these things
> correctly. Hacking some glorious hand-rolled locking for synchronization
> of updates really should be the exception for kms drivers, not the rule.
> And this one here doesn't look like an exception by far (the one legit I
> know of is the locking issues amdgpu has between atomic_commit_tail and
> gpu reset, and that one is really nasty, so not going to get fixed in
> helpers, ever).
>
> Cheers, Daniel
>
> > ---
> >  drivers/gpu/drm/msm/msm_kms.h | 8 ++++++--
> >  1 file changed, 6 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
> > index d8151a89e163..4735251a394d 100644
> > --- a/drivers/gpu/drm/msm/msm_kms.h
> > +++ b/drivers/gpu/drm/msm/msm_kms.h
> > @@ -157,6 +157,7 @@ struct msm_kms {
> >        * from the crtc's pending_timer close to end of the frame:
> >        */
> >       struct mutex commit_lock[MAX_CRTCS];
> > +     struct lock_class_key commit_lock_keys[MAX_CRTCS];
> >       unsigned pending_crtc_mask;
> >       struct msm_pending_timer pending_timers[MAX_CRTCS];
> >  };
> > @@ -166,8 +167,11 @@ static inline int msm_kms_init(struct msm_kms *kms,
> >  {
> >       unsigned i, ret;
> >
> > -     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++)
> > -             mutex_init(&kms->commit_lock[i]);
> > +     for (i = 0; i < ARRAY_SIZE(kms->commit_lock); i++) {
> > +             lockdep_register_key(&kms->commit_lock_keys[i]);
> > +             __mutex_init(&kms->commit_lock[i], "&kms->commit_lock[i]",
> > +                          &kms->commit_lock_keys[i]);
> > +     }
> >
> >       kms->funcs = funcs;
> >
> >
> > base-commit: 19c329f6808995b142b3966301f217c831e7cf31
> > --
> > https://chromeos.dev
> >
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
