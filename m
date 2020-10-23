Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 107A0297365
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 18:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751433AbgJWQTs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 12:19:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751432AbgJWQTr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 12:19:47 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C371C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 09:19:46 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id n6so2576954wrm.13
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 09:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=pcyKnD0GL8cUH+LZqBS5drzjgkD+yDyZKgqlHZHy/po=;
        b=g1775DhxGYhUcP2uR4Ds7PEc/0qOetJ3gRLRLL7AhQLSpyZopfVEQT1bLIMHVZg3uw
         d8lJM0O7sNa1aTqFhp7UkNa6fSkTqzavQXVj5z5pttzCPdsRVMq+GGWnQBj7FQD68FrR
         vTuQecZd0ALn5d9j0atfGZiByKwgyi6NapmrX7Zq++N/Y3/6WuK+fYeUJXvSjWRCFrtO
         gO0ug5rHoEYOHltLXxmflTE29xgLqcBFr0rNdvF6YLMBuayj6kqC+RS/efsva/72pCye
         jgqNkFUoq9IwGSAXPojAuz4yO9a/mp0O9HkI2k86LvuusHZ3vAv2+8AYhb0XTGJgDPKt
         /Bsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=pcyKnD0GL8cUH+LZqBS5drzjgkD+yDyZKgqlHZHy/po=;
        b=YUoYwkULB2WOjlGMX9x/MVE+cVJwA1zUB3ick2jVgEzXzVx3z2C5i/XCLZJvuSio0C
         XOa8X1LMQSyvhtYmJEYukXBRet0SkINK8E7IyNpoyzkksXRnmLqlyKUQWShtlyPr7TL7
         gX+fVmb5BX2Mb2Z2ttTkAhpYGu10Sa9xQAf8HHIj7CU2PobqRtxO1zdhPC2HBFvGR6Se
         VwYRPPMDynCEF1IUqH3LepeV1ga4Uu5gJ5e/8XP7mPwgmPf6NibprNenGKH0w/8xL02O
         aLi4ial5emqf0ltt5/uyWdU8XBMqYv/3AWkuqhzpFh9s19D14ErljgZf1hCf1tGAOHLb
         o3xA==
X-Gm-Message-State: AOAM532+vL5ujLLotg0/7nf1hYAne7mG28WnL056jILKI8BTGwqxZNsX
        vibOE5oRPG6JQRB2uBwL6Ez0l7sUwe0p6JKWvGE=
X-Google-Smtp-Source: ABdhPJztTB0f29AwyS+8nwtQJvMn1n+zibaIB9dbkkIIkW0xgjPhNLjm0bXpoVAC8RHu3f2nqpN1l4tyHVZ7HU5zGVs=
X-Received: by 2002:adf:bc0f:: with SMTP id s15mr3495405wrg.83.1603469984697;
 Fri, 23 Oct 2020 09:19:44 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
 <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com>
 <CAKMK7uETWveBqOCRvHe2fGGnrVOB_9prmmenW3bARRCT-kg__A@mail.gmail.com>
 <CAF6AEGtWAT-pD+ZO0T9E0W2uuZ_KgvX2r_BsGUQpzS7M5x4u5w@mail.gmail.com> <CAKMK7uHu7fRrfPEjZKy9m8jOnmLk2wOGApZDWpz-8CdLmc+_EA@mail.gmail.com>
In-Reply-To: <CAKMK7uHu7fRrfPEjZKy9m8jOnmLk2wOGApZDWpz-8CdLmc+_EA@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 23 Oct 2020 09:21:10 -0700
Message-ID: <CAF6AEGvY5oUcnFC=3bfgxTv-no=+4p3nkuH1G+mkNWfF-hzgtw@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/atomic-helpers: remove
 legacy_cursor_update hacks
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Fri, Oct 23, 2020 at 9:00 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> On Fri, Oct 23, 2020 at 5:02 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Oct 22, 2020 at 12:16 PM Daniel Vetter <daniel.vetter@ffwll.ch>=
 wrote:
> > >
> > > On Thu, Oct 22, 2020 at 7:22 PM Rob Clark <robdclark@gmail.com> wrote=
:
> > > >
> > > > On Thu, Oct 22, 2020 at 10:02 AM Rob Clark <robdclark@gmail.com> wr=
ote:
> > > > >
> > > > > On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwl=
l.ch> wrote:
> > > > > >
> > > > > > The stuff never really worked, and leads to lots of fun because=
 it
> > > > > > out-of-order frees atomic states. Which upsets KASAN, among oth=
er
> > > > > > things.
> > > > > >
> > > > > > For async updates we now have a more solid solution with the
> > > > > > ->atomic_async_check and ->atomic_async_commit hooks. Support f=
or that
> > > > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > > > routines, doing something similar.
> > > > > >
> > > > > > For everyone else it's probably better to remove the use-after-=
free
> > > > > > bug, and encourage folks to use the async support instead. The
> > > > > > affected drivers which register a legacy cursor plane and don't=
 either
> > > > > > use the new async stuff or their own commit routine are: amdgpu=
,
> > > > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and =
vmwgfx.
> > > > > >
> > > > > > Inspired by an amdgpu bug report.
> > > > > >
> > > > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > > > atomic_async_check/commit done in
> > > > > >
> > > > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > > > >
> > > > > >     drm/amd/display: Add fast path for cursor plane updates
> > > > > >
> > > > > > we don't have any driver anymore where we have userspace expect=
ing
> > > > > > solid legacy cursor support _and_ they are using the atomic hel=
pers in
> > > > > > their fully glory. So we can retire this.
> > > > > >
> > > > > > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D19942=
5
> > > > > > Cc: mikita.lipski@amd.com
> > > > > > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > > > > > Cc: harry.wentland@amd.com
> > > > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > > > >
> > > > > This *completely* destroys fps when there is cursor movement, it =
would
> > > > > be a pretty bad regression, so nak
> > > >
> > > > Which I *guess* is due to dpu not wiring up the plane->async_* func=
s,
> > > > effectively making cursor updates synchronous.. but it will take so=
me
> > > > time to sort out :-(
> > >
> > > Does something like the below (not even compile tested) get dpu back =
in order?
> > >
> > > diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/m=
sm_atomic.c
> > > index 561bfa48841c..ec8b4f74da49 100644
> > > --- a/drivers/gpu/drm/msm/msm_atomic.c
> > > +++ b/drivers/gpu/drm/msm/msm_atomic.c
> > > @@ -215,6 +215,8 @@ void msm_atomic_commit_tail(struct drm_atomic_sta=
te *state)
> > >                /* async updates are limited to single-crtc updates: *=
/
> > >                WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
> > >
> > > +               complete_all(async_crtc->state->flip_done);
> > > +
> > >                /*
> > >                 * Start timer if we don't already have an update pend=
ing
> > >                 * on this crtc:
> > >
> > > That way we could perhaps still move ahead with removing the hacks
> > > from shared helpers, and msm-dpu can keep doing what it does. The
> > > other hunk is in a function that dpu code doesn't even use, so can't
> > > see how that would change anything.
> >
> > That causes massive explosions... angering WARN_ON(dpu_crtc->event);
> >
> > Seems it is probably the right idea but the wrong place?  I'll try to
> > make some time in next few days to look at this more, but juggling a
> > bunch of different things atm (and I guess at any rate this won't be a
> > 5.10 thing, so we have a bit of time)
>
> Yeah we have time for this, legacy_cursor_update being a mistake in
> atomic has been a thorn to my ego for years, it's not going to get
> worse with a bit more time itching :-) It's more that I want to really
> make sure we don't spread this further, since the hacks in atomic
> helpers really break the entire commit helper model quite badly all
> over.
>
> So maybe just ack on the documentation patch interim, while we figure
> out something at leasure? I've also broken i915, so maybe I figure out
> meanwhile how to reapply the duct-tape there.

yeah, makes sense, a-b for doc patch

BR,
-R

> -Daniel
>
> > BR,
> > -R
> >
> > > -Daniel
> > >
> > > >
> > > > > BR,
> > > > > -R
> > > > >
> > > > > > ---
> > > > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
> > > > > >  1 file changed, 13 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/=
drm/drm_atomic_helper.c
> > > > > > index a7bcb4b4586c..549a31e6042c 100644
> > > > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > > > @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struc=
t drm_device *dev,
> > > > > >         int i, ret;
> > > > > >         unsigned crtc_mask =3D 0;
> > > > > >
> > > > > > -        /*
> > > > > > -         * Legacy cursor ioctls are completely unsynced, and u=
serspace
> > > > > > -         * relies on that (by doing tons of cursor updates).
> > > > > > -         */
> > > > > > -       if (old_state->legacy_cursor_update)
> > > > > > -               return;
> > > > > > -
> > > > > >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc=
_state, new_crtc_state, i) {
> > > > > >                 if (!new_crtc_state->active)
> > > > > >                         continue;
> > > > > > @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struc=
t drm_atomic_state *state,
> > > > > >                         continue;
> > > > > >                 }
> > > > > >
> > > > > > -               /* Legacy cursor updates are fully unsynced. */
> > > > > > -               if (state->legacy_cursor_update) {
> > > > > > -                       complete_all(&commit->flip_done);
> > > > > > -                       continue;
> > > > > > -               }
> > > > > > -
> > > > > >                 if (!new_crtc_state->event) {
> > > > > >                         commit->event =3D kzalloc(sizeof(*commi=
t->event),
> > > > > >                                                 GFP_KERNEL);
> > > > > > --
> > > > > > 2.28.0
> > > > > >
> > > > > > _______________________________________________
> > > > > > Intel-gfx mailing list
> > > > > > Intel-gfx@lists.freedesktop.org
> > > > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
> > >
> > >
> > >
> > > --
> > > Daniel Vetter
> > > Software Engineer, Intel Corporation
> > > http://blog.ffwll.ch
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
