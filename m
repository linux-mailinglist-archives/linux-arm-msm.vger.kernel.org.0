Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E65F62971DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Oct 2020 17:02:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S465496AbgJWPCv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Oct 2020 11:02:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34790 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S461436AbgJWPCu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Oct 2020 11:02:50 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 717B1C0613CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 08:02:50 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id d3so1975132wma.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2020 08:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UZnDi9XXoTFdT//VezP0jqB890DJxt/icX9d0J0/vZU=;
        b=rEfrYFXUUQO1LqUz86S7FSlhX/C65pFk7ihBiaNm9evE6RkN4CoT7V0lsxXhq81nIM
         DIiY45ViPXRjbOA48sbl+4rcSmukl6Fk4tVMeWR5gRdFVzU9Wbcfj4PfBHUVwugk5adM
         Igp1Gdro0+bTufFQKoyL5BfP5EgZCccLNkc4EqB5gjrGiTG56y6ixboyYHb8NL4q1MrA
         Z05L6Jyqd0Qi40eZJtZj80G0mdHyBi6Zf33kIMLjhD/l1rZoJEO/g++kiFonP2e9dZTx
         dSNrShkxPQZI2KupQISkL0QtuSFJH1NfQV98SeLuvWn8hb9NjLgcymSquDGG5Ez815Ra
         gAZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UZnDi9XXoTFdT//VezP0jqB890DJxt/icX9d0J0/vZU=;
        b=GkKZjAFEiLQAzNLTEXGgpTN2CY9G5O/WHIcYicggodkICS1lLG8Rt23EQ5TdtK1hoD
         sau0Js6XxrCyflm4j1NCsNaIKbzCba4i7n81bCziNfGt8Z/uXPqFtoaH2qCZJXmS8S/B
         hXngUL2Wok93ZjjapWogue7LQNPwPOL055DcvG1poEti8Z4XWRm05qzQ2ecvVPs7rjh3
         QPXo4+4OTwXtrlXStMHmNfeBA6OFXP8M1gCufh0fD7zssval3xsHzuz2n2pUaccagFAt
         6brtgmpOisXFI3T+eW96PpixmdgzANpY3+x+EUVy1eZBX++iRSSoXaM3KK58fTMS6wVs
         ZfrQ==
X-Gm-Message-State: AOAM533z7KeN1iYfoJ3QVVFA6WCXawIC8kJsPT98Jzpw7GcfH2TQ8Klr
        brgsEI11j10T8L9si3ddM8j4Qy8ZmPfBceRu9RI=
X-Google-Smtp-Source: ABdhPJxxUMHokyHewryllMsI4MpDFrA6Fr11+JIqCHFvlwJPvSQZqmcYJmeCiheU7Izv9+QR0MFyDa33ehKrY+ASTwE=
X-Received: by 2002:a05:600c:2241:: with SMTP id a1mr2915757wmm.49.1603465369033;
 Fri, 23 Oct 2020 08:02:49 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
 <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com> <CAKMK7uETWveBqOCRvHe2fGGnrVOB_9prmmenW3bARRCT-kg__A@mail.gmail.com>
In-Reply-To: <CAKMK7uETWveBqOCRvHe2fGGnrVOB_9prmmenW3bARRCT-kg__A@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 23 Oct 2020 08:02:37 -0700
Message-ID: <CAF6AEGtWAT-pD+ZO0T9E0W2uuZ_KgvX2r_BsGUQpzS7M5x4u5w@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 12:16 PM Daniel Vetter <daniel.vetter@ffwll.ch> wro=
te:
>
> On Thu, Oct 22, 2020 at 7:22 PM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Thu, Oct 22, 2020 at 10:02 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwll.ch=
> wrote:
> > > >
> > > > The stuff never really worked, and leads to lots of fun because it
> > > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > > things.
> > > >
> > > > For async updates we now have a more solid solution with the
> > > > ->atomic_async_check and ->atomic_async_commit hooks. Support for t=
hat
> > > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > > routines, doing something similar.
> > > >
> > > > For everyone else it's probably better to remove the use-after-free
> > > > bug, and encourage folks to use the async support instead. The
> > > > affected drivers which register a legacy cursor plane and don't eit=
her
> > > > use the new async stuff or their own commit routine are: amdgpu,
> > > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwg=
fx.
> > > >
> > > > Inspired by an amdgpu bug report.
> > > >
> > > > v2: Drop RFC, I think with amdgpu converted over to use
> > > > atomic_async_check/commit done in
> > > >
> > > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > > >
> > > >     drm/amd/display: Add fast path for cursor plane updates
> > > >
> > > > we don't have any driver anymore where we have userspace expecting
> > > > solid legacy cursor support _and_ they are using the atomic helpers=
 in
> > > > their fully glory. So we can retire this.
> > > >
> > > > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > > > Cc: mikita.lipski@amd.com
> > > > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > > > Cc: harry.wentland@amd.com
> > > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> > >
> > > This *completely* destroys fps when there is cursor movement, it woul=
d
> > > be a pretty bad regression, so nak
> >
> > Which I *guess* is due to dpu not wiring up the plane->async_* funcs,
> > effectively making cursor updates synchronous.. but it will take some
> > time to sort out :-(
>
> Does something like the below (not even compile tested) get dpu back in o=
rder?
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_a=
tomic.c
> index 561bfa48841c..ec8b4f74da49 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -215,6 +215,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *=
state)
>                /* async updates are limited to single-crtc updates: */
>                WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));
>
> +               complete_all(async_crtc->state->flip_done);
> +
>                /*
>                 * Start timer if we don't already have an update pending
>                 * on this crtc:
>
> That way we could perhaps still move ahead with removing the hacks
> from shared helpers, and msm-dpu can keep doing what it does. The
> other hunk is in a function that dpu code doesn't even use, so can't
> see how that would change anything.

That causes massive explosions... angering WARN_ON(dpu_crtc->event);

Seems it is probably the right idea but the wrong place?  I'll try to
make some time in next few days to look at this more, but juggling a
bunch of different things atm (and I guess at any rate this won't be a
5.10 thing, so we have a bit of time)

BR,
-R

> -Daniel
>
> >
> > > BR,
> > > -R
> > >
> > > > ---
> > > >  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
> > > >  1 file changed, 13 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/=
drm_atomic_helper.c
> > > > index a7bcb4b4586c..549a31e6042c 100644
> > > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > > @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struct dr=
m_device *dev,
> > > >         int i, ret;
> > > >         unsigned crtc_mask =3D 0;
> > > >
> > > > -        /*
> > > > -         * Legacy cursor ioctls are completely unsynced, and users=
pace
> > > > -         * relies on that (by doing tons of cursor updates).
> > > > -         */
> > > > -       if (old_state->legacy_cursor_update)
> > > > -               return;
> > > > -
> > > >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_sta=
te, new_crtc_state, i) {
> > > >                 if (!new_crtc_state->active)
> > > >                         continue;
> > > > @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struct dr=
m_atomic_state *state,
> > > >                         continue;
> > > >                 }
> > > >
> > > > -               /* Legacy cursor updates are fully unsynced. */
> > > > -               if (state->legacy_cursor_update) {
> > > > -                       complete_all(&commit->flip_done);
> > > > -                       continue;
> > > > -               }
> > > > -
> > > >                 if (!new_crtc_state->event) {
> > > >                         commit->event =3D kzalloc(sizeof(*commit->e=
vent),
> > > >                                                 GFP_KERNEL);
> > > > --
> > > > 2.28.0
> > > >
> > > > _______________________________________________
> > > > Intel-gfx mailing list
> > > > Intel-gfx@lists.freedesktop.org
> > > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>
>
>
> --
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
