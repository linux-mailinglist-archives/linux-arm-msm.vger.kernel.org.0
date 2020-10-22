Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 226F6296522
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 21:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S370024AbgJVTQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 15:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49728 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S370011AbgJVTQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 15:16:17 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5CAD9C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 12:16:16 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id k27so2910496oij.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 12:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=vJr7fCfJ4J5txhhCeUHNq0GcHfahaDiBl9X/aRS+OyQ=;
        b=akvwRSBpAy0NI2BVE2GF5vrU31B+NyNjzv5IB/8BA+8DJLTi8McMDSag4zDB+tmxlr
         +A66ONJckZhf4dcZdJ6qY0bMrszcTZwoXNlBtlrM/7p9vT2v2z/MnPQhaiHnRvHBYtm/
         ZFIVMGhoBKHqzdLlGE1hMwiygfH/bGUs3TxG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=vJr7fCfJ4J5txhhCeUHNq0GcHfahaDiBl9X/aRS+OyQ=;
        b=ZCglEXp4AtIHQWV/1B39R0UH+HKhAnNIwdVuiJrT5oN7V2q71CEfPIrQRohwN+8abB
         5CXKcvHr8E41KwwwltujsYZVqql4E2HplZm+jhlUFlqGNEE2dUgJ2E2nauCwapkKsTE/
         KwpV/xfbdma/UiqRiJ1cGQydaKVGuXJ8j49vp1LwULBzeoqBsnWfVBdgLvvI1JAs/JMR
         Xl4ctkBEiRnVSwLmaUKWYWtV4hK1Nl8Ywcxd3OoI5snmqrX2jisa7TZbtS/7yFSig+/Z
         FAJ6zzC3ns2dAgCD2CapBV5aHjoAmWhNE3HAtauEx+pwpsrIMZKui4S51aT/NSVERG4G
         GXqw==
X-Gm-Message-State: AOAM5309owKXPIe7N5KoHzekHZ1wXIloEAwwMxeijMmgufoc/YPEHZdx
        X1S5JPk+VPtOm2gWcpXDKSeP5ox872Tv7MS9/lMBSw==
X-Google-Smtp-Source: ABdhPJyasMUBbv3R49dEC/fr4aeBRSnM99CnXagH3NOH61ZRBFCKRFCCZyLLpfdaHfvFASnlAahH1oCR6p4o6xwNB+A=
X-Received: by 2002:aca:cc01:: with SMTP id c1mr2633177oig.128.1603394175758;
 Thu, 22 Oct 2020 12:16:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com> <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com>
In-Reply-To: <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 22 Oct 2020 21:16:04 +0200
Message-ID: <CAKMK7uETWveBqOCRvHe2fGGnrVOB_9prmmenW3bARRCT-kg__A@mail.gmail.com>
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

On Thu, Oct 22, 2020 at 7:22 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Thu, Oct 22, 2020 at 10:02 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwll.ch> =
wrote:
> > >
> > > The stuff never really worked, and leads to lots of fun because it
> > > out-of-order frees atomic states. Which upsets KASAN, among other
> > > things.
> > >
> > > For async updates we now have a more solid solution with the
> > > ->atomic_async_check and ->atomic_async_commit hooks. Support for tha=
t
> > > for msm and vc4 landed. nouveau and i915 have their own commit
> > > routines, doing something similar.
> > >
> > > For everyone else it's probably better to remove the use-after-free
> > > bug, and encourage folks to use the async support instead. The
> > > affected drivers which register a legacy cursor plane and don't eithe=
r
> > > use the new async stuff or their own commit routine are: amdgpu,
> > > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx=
.
> > >
> > > Inspired by an amdgpu bug report.
> > >
> > > v2: Drop RFC, I think with amdgpu converted over to use
> > > atomic_async_check/commit done in
> > >
> > > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > > Date:   Wed Dec 5 14:59:07 2018 -0500
> > >
> > >     drm/amd/display: Add fast path for cursor plane updates
> > >
> > > we don't have any driver anymore where we have userspace expecting
> > > solid legacy cursor support _and_ they are using the atomic helpers i=
n
> > > their fully glory. So we can retire this.
> > >
> > > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > > Cc: mikita.lipski@amd.com
> > > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > > Cc: harry.wentland@amd.com
> > > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> >
> > This *completely* destroys fps when there is cursor movement, it would
> > be a pretty bad regression, so nak
>
> Which I *guess* is due to dpu not wiring up the plane->async_* funcs,
> effectively making cursor updates synchronous.. but it will take some
> time to sort out :-(

Does something like the below (not even compile tested) get dpu back in ord=
er?

diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_ato=
mic.c
index 561bfa48841c..ec8b4f74da49 100644
--- a/drivers/gpu/drm/msm/msm_atomic.c
+++ b/drivers/gpu/drm/msm/msm_atomic.c
@@ -215,6 +215,8 @@ void msm_atomic_commit_tail(struct drm_atomic_state *st=
ate)
               /* async updates are limited to single-crtc updates: */
               WARN_ON(crtc_mask !=3D drm_crtc_mask(async_crtc));

+               complete_all(async_crtc->state->flip_done);
+
               /*
                * Start timer if we don't already have an update pending
                * on this crtc:

That way we could perhaps still move ahead with removing the hacks
from shared helpers, and msm-dpu can keep doing what it does. The
other hunk is in a function that dpu code doesn't even use, so can't
see how that would change anything.
-Daniel

>
> > BR,
> > -R
> >
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
> > >  1 file changed, 13 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/dr=
m_atomic_helper.c
> > > index a7bcb4b4586c..549a31e6042c 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_=
device *dev,
> > >         int i, ret;
> > >         unsigned crtc_mask =3D 0;
> > >
> > > -        /*
> > > -         * Legacy cursor ioctls are completely unsynced, and userspa=
ce
> > > -         * relies on that (by doing tons of cursor updates).
> > > -         */
> > > -       if (old_state->legacy_cursor_update)
> > > -               return;
> > > -
> > >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state=
, new_crtc_state, i) {
> > >                 if (!new_crtc_state->active)
> > >                         continue;
> > > @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struct drm_=
atomic_state *state,
> > >                         continue;
> > >                 }
> > >
> > > -               /* Legacy cursor updates are fully unsynced. */
> > > -               if (state->legacy_cursor_update) {
> > > -                       complete_all(&commit->flip_done);
> > > -                       continue;
> > > -               }
> > > -
> > >                 if (!new_crtc_state->event) {
> > >                         commit->event =3D kzalloc(sizeof(*commit->eve=
nt),
> > >                                                 GFP_KERNEL);
> > > --
> > > 2.28.0
> > >
> > > _______________________________________________
> > > Intel-gfx mailing list
> > > Intel-gfx@lists.freedesktop.org
> > > https://lists.freedesktop.org/mailman/listinfo/intel-gfx



--=20
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
