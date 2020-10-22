Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BCE1629634C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Oct 2020 19:03:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2505941AbgJVRDD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Oct 2020 13:03:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2505584AbgJVRDD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Oct 2020 13:03:03 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A20A4C0613CE
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:03:02 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c77so2932307wmd.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2020 10:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=kFo2juQWu5715QJm/ixE1NcTBc7Zfu52jU4zMhpEuQA=;
        b=XNVIL46d1vPEOlyg0eve5C72wjg6gohWLAdsVMUyaHjzA2ICoAMN6Cp08nGAaNdlz+
         0q4uQOvJD52Z+EggLk9VhJa0JsYBDecNkQiZ7dySZ7domYptQXbSzM3zJNz6m7dTOUpV
         ZCqqofZZ6qR09ud//enVFXsH3Mo1rcAEso4zTCqurKOApbFwGMGFNfPp1+eeLTq5iVpI
         Nehi69uUGDcxHMM3YuqKla2owCl8eb9/td/4mczfms/emQt66+scK00UOrQpHnH0Qsgf
         jrnTgRr6CYyJUmJcPSEMp0lvtcy7ezYhNQvUg7d3VEs01eMXoTEBMwjCldftfxLQklPw
         UXeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=kFo2juQWu5715QJm/ixE1NcTBc7Zfu52jU4zMhpEuQA=;
        b=WKwNcn0SNMy+LOhofM/C/6Ed4n4fBpmvqHl2uztzATNFFxewKsPh5SZpfyef7lsVoM
         53pOOOMIqRRmA46g2YZg3xnGabBaPOjDC4Bj2uZzRlmFyjWymarYDoaI18cHR4A8UX5x
         9//vPXrWiMD2fsDisRuG/pOqvm8YofJso/L79w7+uTz8BceEOs07o7ixRp2NDD0GSTBP
         Xf3R3jgPFJbFr/FfUh96EyLzwiD1cceRPaolVfBe70pCXrJtzFjxRQE6VZaZCbYSR1x3
         mYd7tHOZoxlZzIdFfL2Ku88pQghSaAzCphi/tNLqRJN49XOj2wmN78ZtuNDsRnUw77fJ
         W5Ug==
X-Gm-Message-State: AOAM533UPvSQd1/7MDKcxDdI+eKh1xathjHCpBCYvfd8+FoVpSP85lY3
        7ainz52CSOJBWMzW+2t14CZf5yo57n+vNzbYNV4=
X-Google-Smtp-Source: ABdhPJx/9LGEtj8tp6NM4Fpuz55Nwf2DO7akc23CQJlXeoj0ddXWwRfQxJEuahDejjY13kaKnmuwxQ7LQAsiwyC6Ew8=
X-Received: by 2002:a1c:3243:: with SMTP id y64mr3438324wmy.175.1603386181228;
 Thu, 22 Oct 2020 10:03:01 -0700 (PDT)
MIME-Version: 1.0
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
In-Reply-To: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 22 Oct 2020 10:02:49 -0700
Message-ID: <CAF6AEGsHA33RGoX-iX=9mL+EgtxFJgLH4n2xKR9XckBA=SJhBw@mail.gmail.com>
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

On Wed, Oct 21, 2020 at 9:32 AM Daniel Vetter <daniel.vetter@ffwll.ch> wrot=
e:
>
> The stuff never really worked, and leads to lots of fun because it
> out-of-order frees atomic states. Which upsets KASAN, among other
> things.
>
> For async updates we now have a more solid solution with the
> ->atomic_async_check and ->atomic_async_commit hooks. Support for that
> for msm and vc4 landed. nouveau and i915 have their own commit
> routines, doing something similar.
>
> For everyone else it's probably better to remove the use-after-free
> bug, and encourage folks to use the async support instead. The
> affected drivers which register a legacy cursor plane and don't either
> use the new async stuff or their own commit routine are: amdgpu,
> atmel, mediatek, qxl, rockchip, sti, sun4i, tegra, virtio, and vmwgfx.
>
> Inspired by an amdgpu bug report.
>
> v2: Drop RFC, I think with amdgpu converted over to use
> atomic_async_check/commit done in
>
> commit 674e78acae0dfb4beb56132e41cbae5b60f7d662
> Author: Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
> Date:   Wed Dec 5 14:59:07 2018 -0500
>
>     drm/amd/display: Add fast path for cursor plane updates
>
> we don't have any driver anymore where we have userspace expecting
> solid legacy cursor support _and_ they are using the atomic helpers in
> their fully glory. So we can retire this.
>
> References: https://bugzilla.kernel.org/show_bug.cgi?id=3D199425
> Cc: mikita.lipski@amd.com
> Cc: Michel D=C3=A4nzer <michel@daenzer.net>
> Cc: harry.wentland@amd.com
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>

This *completely* destroys fps when there is cursor movement, it would
be a pretty bad regression, so nak

BR,
-R

> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 13 -------------
>  1 file changed, 13 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_at=
omic_helper.c
> index a7bcb4b4586c..549a31e6042c 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1481,13 +1481,6 @@ drm_atomic_helper_wait_for_vblanks(struct drm_devi=
ce *dev,
>         int i, ret;
>         unsigned crtc_mask =3D 0;
>
> -        /*
> -         * Legacy cursor ioctls are completely unsynced, and userspace
> -         * relies on that (by doing tons of cursor updates).
> -         */
> -       if (old_state->legacy_cursor_update)
> -               return;
> -
>         for_each_oldnew_crtc_in_state(old_state, crtc, old_crtc_state, ne=
w_crtc_state, i) {
>                 if (!new_crtc_state->active)
>                         continue;
> @@ -2106,12 +2099,6 @@ int drm_atomic_helper_setup_commit(struct drm_atom=
ic_state *state,
>                         continue;
>                 }
>
> -               /* Legacy cursor updates are fully unsynced. */
> -               if (state->legacy_cursor_update) {
> -                       complete_all(&commit->flip_done);
> -                       continue;
> -               }
> -
>                 if (!new_crtc_state->event) {
>                         commit->event =3D kzalloc(sizeof(*commit->event),
>                                                 GFP_KERNEL);
> --
> 2.28.0
>
> _______________________________________________
> Intel-gfx mailing list
> Intel-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
