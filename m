Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D0C829730C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:00:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S464786AbgJWQA1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:00:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S374474AbgJWQA0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:00:26 -0400
Received: from mail-oo1-xc44.google.com (mail-oo1-xc44.google.com [IPv6:2607:f8b0:4864:20::c44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98F3AC0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 09:00:26 -0700 (PDT)
Received: by mail-oo1-xc44.google.com with SMTP id r7so507817ool.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 09:00:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=V9h0dZTRE4DdLzGkRN/GG83QPX4AFahvaHSskE0rEJo=;
        b=Djb+X6EflopnY+sMbjkBiY/rmZAZpWmjxYe0siYUaJXSmsQd6Ay6HNqDCl9tIQck7B
         +FpF8cDgX2b18NgzQcnC9sda3Z98x9BDG/T08fXHh6DHv8TfHHKoA80Kmc2Kp/D0JULg
         5hIiaak28Zn3R5a7BoaOnAyCJZfDW3cMESVQ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=V9h0dZTRE4DdLzGkRN/GG83QPX4AFahvaHSskE0rEJo=;
        b=T6k1DdS3PfInDyCfhMzzbijJGJUm5imjM7eX2gqqszlSmkQLS2mqncVORAgQ1814Vx
         09QhZpovVIGpOuUM+kRjvbs3PlcW9megsjLaPt2G0lJKbfSpl5/89HoQ59sr0Cl0bbbS
         ONoZT6HD1KCALVWtcyJ3eumHy8R3vv7VytAZ9HVC6MVuxPvr5hRG0MY76Xfzf2uoN38d
         tJDsgSkgRHXj+CEbrWAMFmqzeqcOcqOxLMJWsuoFuKtWuXE6hVL9weyhpy3G4m9teDi5
         pHeqTEwBfW88zm7IlHa/kygUBk1KumjXiESUllarvPzGx1wQV9467PMA0IhxnqNDPaYJ
         yagg==
X-Gm-Message-State: AOAM531BYwltoX3ZtRqCv+7XvIPwUOO9awiSyqoh9iJtdly90d4kYU9b
        VXO/rMsNbedpndGV1iufjkwm+yEy11dpBoL/qP+8MA==
X-Google-Smtp-Source: ABdhPJyHuc4JRVyTrNAI9u6Mxt5XkyfvwgP0aXwfD7YwqIiLRlf3sqaCUwUzIJGC6Ij/qnVGqfsqpQZqSV6MKlVlbDY=
X-Received: by 2002:a4a:b503:: with SMTP id r3mr2195420ooo.28.1603468825988;
 Fri, 23 Oct 2020 09:00:25 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
 <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com>
 <CAKMK7uETWveBqOCRvHe2fGGnrVOB_9prmmenW3bARRCT-kg__A@mail.gmail.com> <CAF6AEGtWAT-pD+ZO0T9E0W2uuZ_KgvX2r_BsGUQpzS7M5x4u5w@mail.gmail.com>
In-Reply-To: <CAF6AEGtWAT-pD+ZO0T9E0W2uuZ_KgvX2r_BsGUQpzS7M5x4u5w@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Fri, 23 Oct 2020 18:00:14 +0200
Message-ID: <CAKMK7uHu7fRrfPEjZKy9m8jOnmLk2wOGApZDWpz-8CdLmc+_EA@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/atomic-helpers: remove
 legacy_cursor_update hacks
To:     Rob Clark <robdclark@gmail.com>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>,
        Mikita Lipski <mikita.lipski@amd.com>,
        Harry Wentland <harry.wentland@amd.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 23, 2020 at 5:02 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Oct 22, 2020 at 12:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> w=
rote:
> >
> > On Thu, Oct 22, 2020 at 7:22 PM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Thu, Oct 22, 2020 at 10:02 AM Rob Clark <robdclark@gmail.com> wrot=
e:
> > > >
> > > > On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwll.=
ch> wrote:
> > > > >
> > > > > The stuff never really worked, and leads to lots of fun because i=
t
> > > > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > > > things.
> > > > >
> > > > > For async updates we now have a more solid solution with the
> > > > > ->atomic_async_check and ->atomic_async_commit hooks. Support for=
 that
> > > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > > routines, doing something similar.
> > > > >
> > > > > For everyone else it's probably better to remove the use-after-fr=
ee
> > > > > bug, and encourage folks to use the async support instead. The
> > > > > affected drivers which register a legacy cursor plane and don't e=
ither
> > > > > use the new async stuff or their own commit routine are: amdgpu,
> > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vm=
wgfx.
> > > > >
> > > > > Inspired by an amdgpu bug report.
> > > > >
> > > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > > atomic_async_check/commit done in
> > > > >
> > > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > > >
> > > > >     drm/amd/display: Add fast path for cursor plane updates
> > > > >
> > > > > we don't have any driver anymore where we have userspace expectin=
g
> > > > > solid legacy cursor support _and_ they are using the atomic helpe=
rs in
> > > > > their fully glory. So we can retire this.
> > > > >
> > > > > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > > > > Cc: mikita.lipski@amd.com
> > > > > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > > > > Cc: harry.wentland@amd.com
> > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > >
> > > > This *completely* destroys fps when there is cursor movement, it wo=
uld
> > > > be a pretty bad regression, so nak
> > >
> > > Which I *guess* is due to dpu not wiring up the plane->async_* funcs,
> > > effectively making cursor updates synchronous.. but it will take some
> > > time to sort out :-(
> >
> > Does something like the below (not even compile tested) get dpu back in=
 order?
> >
> > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm=
_atomic.c
> > index 561bfa48841c..ec8b4f74da49 100644
> > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > @@ -215,6 +215,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state=
 *state)
> >                /* async updates are limited to single-crtc updates: */
> >                WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
> >
> > +               complete_all(async_crtc->state->flip_done);
> > +
> >                /*
> >                 * Start timer if we don't already have an update pendin=
g
> >                 * on this crtc:
> >
> > That way we could perhaps still move ahead with removing the hacks
> > from shared helpers, and msm-dpu can keep doing what it does. The
> > other hunk is in a function that dpu code doesn't even use, so can't
> > see how that would change anything.
>
> That causes massive explosions... angering WARN_ON(dpu_crtc->event);
>
> Seems it is probably the right idea but the wrong place?  I'll try to
> make some time in next few days to look at this more, but juggling a
> bunch of different things atm (and I guess at any rate this won't be a
> 5.10 thing, so we have a bit of time)

Yeah we have time for this, legacy_cursor_update being a mistake in
atomic has been a thorn to my ego for years, it's not going to get
worse with a bit more time itching :-) It's more that I want to really
make sure we don't spread this further, since the hacks in atomic
helpers really break the entire commit helper model quite badly all
over.

So maybe just ack on the documentation patch interim, while we figure
out something at leasure? I've also broken i915, so maybe I figure out
meanwhile how to reapply the duct-tape there.
-Daniel

> BR,
> -R
>
> > -Daniel
> >
> > >
> > > > BR,
> > > > -R
> > > >
> > > > > ---
> > > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
> > > > >  1 file changed, 13 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/dr=
m/drm_atomic_helper.c
> > > > > index a7bcb4b4586c..549a31e6042c 100644
> > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struct =
drm_device *dev,
> > > > >         int i, ret;
> > > > >         unsigned crtc_mask =3D 0;
> > > > >
> > > > > -        /*
> > > > > -         * Legacy cursor ioctls are completely unsynced, and use=
rspace
> > > > > -         * relies on that (by doing tons of cursor updates).
> > > > > -         */
> > > > > -       if (old_state->legacy_cursor_update)
> > > > > -               return;
> > > > > -
> > > > >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_s=
tate, new_crtc_state, i) {
> > > > >                 if (!new_crtc_state->active)
> > > > >                         continue;
> > > > > @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struct =
drm_atomic_state *state,
> > > > >                         continue;
> > > > >                 }
> > > > >
> > > > > -               /* Legacy cursor updates are fully unsynced. */
> > > > > -               if (state->legacy_cursor_update) {
> > > > > -                       complete_all(&commit->flip_done);
> > > > > -                       continue;
> > > > > -               }
> > > > > -
> > > > >                 if (!new_crtc_state->event) {
> > > > >                         commit->event =3D kzalloc(sizeof(*commit-=
>event),
> > > > >                                                 GFP_KERNEL);
> > > > > --
> > > > > 2.28.0
> > > > >
> > > > > _______________________________________________
> > > > > Intel-gfx mailing list
> > > > > Intel-gfx@lists.freedesktop.org
> > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
