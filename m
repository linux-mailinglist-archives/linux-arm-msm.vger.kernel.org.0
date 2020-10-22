Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 24EB02963A4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 19:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2894965AbgJVRWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 13:22:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2894796AbgJVRWJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 13:22:09 -0400
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com [IPv6:2a00:1450:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BDD0C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:22:09 -0700 (PDT)
Received: by mail-wr1-x441.google.com with SMTP id n6so3400189wrm.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=3SbKtGsD0deWgGwVQ6la/8JOmG1h8qGCr8ZTv5ep8js=;
        b=OO7sm4t4/zsmQdXQSOuAQBxpt3zn/uMPrPLifttyDIUq1DLrvRdxXGQre9CMz8+YBK
         I/K8Ik8pMsaEPFRLr5jXsSKezrgM/rlDmAZmWYhbjKyDo3INJ4SRqjMBovvhCBDxxrk1
         dOQ5NMQjgeaczExu4OPAJEb4CFdE50O3UFTymGe/RztHH11xv66/iJ7tMLrzpT1LIE8g
         arJZG59B1N+sLNpSo8bfry0e2sr1ywvOG56Zl6QVR+ywEbIZ21OWcJS+bKBMpBFENlYD
         +fE4Tz1gDVDmRKFAiMAgVhiVCzOh+hAaO/+CCb/2YgnjX/LxonVAbAbp1FvWyjRZGQ1x
         881w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=3SbKtGsD0deWgGwVQ6la/8JOmG1h8qGCr8ZTv5ep8js=;
        b=RCswZEBjbz49YDXnlgaCVQ0ZdNV8hD4wdyY4tRKBPtslK3r6qSz1FgheOG3cR5D5MS
         sX0QNSdkCPsSWjtvQAxFVlIrqxO/mXy8lgaaFt90gNdd6TdOkicHnZbOVwtoRLDW9aiV
         DLA+itCbH+CEeqT02De4V1SW1LwQHzbXAd+OmcL4j6MSLvUWlg0RyPsOSoXaKU923Koz
         OvKCh+j9qvYXx0oPwRt2E17oPX9CG77hOq61F53gHXYLrpV7/IHEbU7VTywbdVDqJmm3
         +OR4HOvdhUuh9XwWV3GCBjkBiKWP/r+YL2pvSMj7bbBGCrYo2oxdsvnjjhWJmBk8EPfB
         vlGw==
X-Gm-Message-State: AOAM530ahpJIodXmoOsGNQ5cPLsf9/cM2Gkra0KKKx96SPGmv9zYXHe3
        kaHopwHmRH6fRAlEaxBAlmDGY1+bbWJRnx9BXB8=
X-Google-Smtp-Source: ABdhPJzeIFqaRFgtHCBVv3UkBvkbJ25pSuQX/PPgOa5jkAnaq+DgqTO5mlTEJC+4oW4om7Rf5pLjaomDHv0aKhmDr+0=
X-Received: by 2002:adf:c501:: with SMTP id q1mr3593309wrf.147.1603387327777;
 Thu, 22 Oct 2020 10:22:07 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch> <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
In-Reply-To: <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Oct 2020 10:21:56 -0700
Message-ID: <CAF6AEGta-uZ=YV3aKTatWkp-XD7S1GzrW9Mcdyp=qsFrHibuiQ@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/3] drm/atomic-helpers: remove
 legacy_cursor_update hacks
To:     Daniel Vetter <daniel.vetter@ffwll.ch>
Cc:     DRI Development <dri-devel@lists.freedesktop.org>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Daniel Vetter <daniel.vetter@intel.com>, mikita.lipski@amd.com,
        Harry Wentland <harry.wentland@amd.com>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Oct 22, 2020 at 10:02 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwll.ch> wr=
ote:
> >
> > The stuff never really worked, and leads to lots of fun because it
> > out-of-order frees atomic states. Which upsets KASAN, among other
> > things.
> >
> > For async updates we now have a more solid solution with the
> > ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> > for msm and vc4 landed. nouveau and i915 have their own commit
> > routines, doing something similar.
> >
> > For everyone else it's probably better to remove the use-after-free
> > bug, and encourage folks to use the async support instead. The
> > affected drivers which register a legacy cursor plane and don't either
> > use the new async stuff or their own commit routine are: amdgpu,
> > atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
> >
> > Inspired by an amdgpu bug report.
> >
> > v2: Drop RFC, I think with amdgpu converted over to use
> > atomic_async_check/commit done in
> >
> > commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> > Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> > Date:   Wed Dec 5 14:59:07 2018 -0500
> >
> >     drm/amd/display: Add fast path for cursor plane updates
> >
> > we don't have any driver anymore where we have userspace expecting
> > solid legacy cursor support _and_ they are using the atomic helpers in
> > their fully glory. So we can retire this.
> >
> > References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> > Cc: mikita.lipski@amd.com
> > Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> > Cc: harry.wentland@amd.com
> > Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
>
> This *completely* destroys fps when there is cursor movement, it would
> be a pretty bad regression, so nak

Which I *guess* is due to dpu not wiring up the plane->async_* funcs,
effectively making cursor updates synchronous.. but it will take some
time to sort out :-(

> BR,
> -R
>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
> >  1 file changed, 13 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> > index a7bcb4b4586c..549a31e6042c 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_de=
vice *dev,
> >         int i, ret;
> >         unsigned crtc_mask =3D 0;
> >
> > -        /*
> > -         * Legacy cursor ioctls are completely unsynced, and userspace
> > -         * relies on that (by doing tons of cursor updates).
> > -         */
> > -       if (old_state->legacy_cursor_update)
> > -               return;
> > -
> >         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, =
new_crtc_state, i) {
> >                 if (!new_crtc_state->active)
> >                         continue;
> > @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struct drm_at=
omic_state *state,
> >                         continue;
> >                 }
> >
> > -               /* Legacy cursor updates are fully unsynced. */
> > -               if (state->legacy_cursor_update) {
> > -                       complete_all(&commit->flip_done);
> > -                       continue;
> > -               }
> > -
> >                 if (!new_crtc_state->event) {
> >                         commit->event =3D kzalloc(sizeof(*commit->event=
),
> >                                                 GFP_KERNEL);
> > --
> > 2.28.0
> >
> > _______________________________________________
> > Intel-gfx mailing list
> > Intel-gfx@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/intel-gfx
