Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5745443842C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Oct 2021 17:54:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229954AbhJWP5P (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 23 Oct 2021 11:57:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229901AbhJWP5N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 23 Oct 2021 11:57:13 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C402CC061714;
        Sat, 23 Oct 2021 08:54:53 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id v17so2424167wrv.9;
        Sat, 23 Oct 2021 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=am9pYlyD4sqItWQ5sg1zos0Wosa6VEKxvGgkRtisPcQ=;
        b=U6flVDT0l6AN2czKcdJq5iCYkJaZVNxh8OfmCSRvXsuPctG685yRoCsplHlybfAmFs
         3fk8XjWAYeXVtYTiKxStIK7u94aUqGLU/TNuYm4OpSQQe//ZVbGC/jsd7MTS68A97GIz
         7P3oINwnwXnPaU8RhMgHMhs8SG+52YMmLkkxubP5rh5QmNCNvGDi64czphfZrE67CZK/
         UWI1plVe+k5Jm8NpDKaIYnjla3vHEOD9m4x1TZMvssJLTt/ZFjPNj8VWHWOXirlBezGf
         mckfL0R717a2PdXHmlMUVEyPD2w3ls1LJagN2k5GufnGfYtjFIorFNEYhxRZNJstdYPI
         tTPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=am9pYlyD4sqItWQ5sg1zos0Wosa6VEKxvGgkRtisPcQ=;
        b=jltF+tdfaPZniHOcJ0sai4o3eP42JqYkqDkfYJ67kvM6J1TizyhFpMY/fknEyBKFSK
         M4ciP66dyvZvl6+tynz9BqjhSwKVnSzwO86Hy9Bz0eA1oe29YX+mGbJ7uxfMnJbu1goC
         kxiwxQWjohlNOsNICWwWG4hHsAMhkNWXqVjK/ks0j5l2el1a52INXr4YHF6J/8+0Xcan
         5Dm8tP7Z5CKrxiDgXx9yRbnpY/qTysEU+OuX0JyckQJ2Uj86NdJSN6lUKygUlYXNZLyI
         RQEsLTxKMvub86uz50QoiquH4+l1npbgbXKWY6kuSasnxGgblUhTOEStReavvIs+dkG4
         6jkg==
X-Gm-Message-State: AOAM531J7xJXUJwLbRTb2ij/0aREalwr6ZELHO3FPgNs4W5N5ZcsiwLt
        biTUMeJAabbHOxcXCA1c15kLJUDOf6E6zQ7YndM=
X-Google-Smtp-Source: ABdhPJxNaVYbVTV4+4OavorKty9RZc/dq/dZ9486awmBURfrow3yuy4jNXT+cQQVrj+9qCAqxwdkwCN4877B0EdJ92E=
X-Received: by 2002:a5d:4845:: with SMTP id n5mr8306231wrs.251.1635004492231;
 Sat, 23 Oct 2021 08:54:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211022172053.3219597-1-robdclark@gmail.com> <20211022172053.3219597-2-robdclark@gmail.com>
 <d40ffca4-b7fd-1797-31b4-35b15e7a438b@codeaurora.org>
In-Reply-To: <d40ffca4-b7fd-1797-31b4-35b15e7a438b@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sat, 23 Oct 2021 08:59:32 -0700
Message-ID: <CAF6AEGseh=y5NWewd_zgDk6O_QzMgkzv2zP_8HEV=r-watavUA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: Remove dynamic allocation from atomic context
To:     Jessica Zhang <jesszhan@codeaurora.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Mark Yacoub <markyacoub@google.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Oct 22, 2021 at 12:15 PM Jessica Zhang <jesszhan@codeaurora.org> wr=
ote:
>
> On 10/22/2021 10:20 AM, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > We know the upper bound on # of mixers (ie. two), so lets just allocate
> > this on the stack.
> >
> > Fixes:
> >
> >     BUG: sleeping function called from invalid context at include/linux=
/sched/mm.h:201
> >     in_atomic(): 1, irqs_disabled(): 128, non_block: 0, pid: 0, name: s=
wapper/0
> >     INFO: lockdep is turned off.
> >     irq event stamp: 43642
> >     hardirqs last  enabled at (43641): [<ffffffe24dd276bc>] cpuidle_ent=
er_state+0x158/0x25c
> >     hardirqs last disabled at (43642): [<ffffffe24dfff450>] enter_el1_i=
rq_or_nmi+0x10/0x1c
> >     softirqs last  enabled at (43620): [<ffffffe24d4103fc>] __do_softir=
q+0x1e4/0x464
> >     softirqs last disabled at (43615): [<ffffffe24d48bd90>] __irq_exit_=
rcu+0x104/0x150
> >     CPU: 0 PID: 0 Comm: swapper/0 Tainted: G        W         5.15.0-rc=
3-debug+ #105
> >     Hardware name: Google Lazor (rev1 - 2) with LTE (DT)
> >     Call trace:
> >      dump_backtrace+0x0/0x18c
> >      show_stack+0x24/0x30
> >      dump_stack_lvl+0xa0/0xd4
> >      dump_stack+0x18/0x34
> >      ___might_sleep+0x1e0/0x1f0
> >      __might_sleep+0x78/0x8c
> >      slab_pre_alloc_hook.constprop.0+0x48/0x6c
> >      __kmalloc+0xc8/0x21c
> >      dpu_crtc_vblank_callback+0x158/0x1f8
> >      dpu_encoder_vblank_callback+0x70/0xc4
> >      dpu_encoder_phys_vid_vblank_irq+0x50/0x12c
> >      dpu_core_irq+0x1bc/0x1d0
> >      dpu_irq+0x1c/0x28
> >      msm_irq+0x34/0x40
> >      __handle_irq_event_percpu+0x15c/0x308
> >      handle_irq_event_percpu+0x3c/0x90
> >      handle_irq_event+0x54/0x98
> >      handle_level_irq+0xa0/0xd0
> >      handle_irq_desc+0x2c/0x44
> >      generic_handle_domain_irq+0x28/0x34
> >      dpu_mdss_irq+0x90/0xe8
> >      handle_irq_desc+0x2c/0x44
> >      handle_domain_irq+0x54/0x80
> >      gic_handle_irq+0xd4/0x148
> >      call_on_irq_stack+0x2c/0x54
> >      do_interrupt_handler+0x4c/0x64
> >      el1_interrupt+0x30/0xd0
> >      el1h_64_irq_handler+0x18/0x24
> >      el1h_64_irq+0x78/0x7c
> >      arch_local_irq_enable+0xc/0x14
> >      cpuidle_enter+0x44/0x5c
> >      do_idle+0x248/0x268
> >      cpu_startup_entry+0x30/0x48
> >      rest_init+0x188/0x19c
> >      arch_call_rest_init+0x1c/0x28
> >      start_kernel+0x704/0x744
> >      __primary_switched+0xc0/0xc8
> >
> > Fixes: 78d9b458cc21 ("drm/msm/dpu: Add CRC support for DPU")
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 16 +++++-----------
> >   1 file changed, 5 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 0ae397044310..80c0ae688734 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -182,21 +182,19 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc=
)
> >   {
> >       struct dpu_crtc_state *crtc_state;
> >       struct dpu_crtc_mixer *m;
> > -     u32 *crcs;
> > +     u32 crcs[CRTC_DUAL_MIXERS];
> >
> >       int i =3D 0;
> >       int rc =3D 0;
> >
> >       crtc_state =3D to_dpu_crtc_state(crtc->state);
> > -     crcs =3D kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNE=
L);
> >
> > -     if (!crcs)
> > -             return -ENOMEM;
> > +     static_assert(ARRAY_SIZE(crcs) =3D=3D ARRAY_SIZE(crtc_state->mixe=
rs));
> >
>
> Getting a C90 compiler warning for static_assert():
>
>      In file included from ./include/linux/bits.h:22,
>                      from ./include/linux/bitops.h:6,
>                      from ./include/linux/kernel.h:12,
>                      from ./include/linux/list.h:9,
>                      from ./include/linux/wait.h:7,
>                      from ./include/linux/wait_bit.h:8,
>                      from ./include/linux/fs.h:6,
>                      from ./include/linux/debugfs.h:15,
>                      from drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:10:
>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c: In function
> =E2=80=98dpu_crtc_get_crc=E2=80=99:
>      ./include/linux/build_bug.h:78:41: warning: ISO C90 forbids mixed
> declarations and code [-Wdeclaration-after-statement]
>          78 | #define __static_assert(expr, msg, ...)
> _Static_assert(expr, msg)
>          |                                         ^~~~~~~~~~~~~~
>      ./include/linux/build_bug.h:77:34: note: in expansion of macro
> =E2=80=98__static_assert=E2=80=99
>          77 | #define static_assert(expr, ...) __static_assert(expr,
> ##__VA_ARGS__, #expr)
>          |                                  ^~~~~~~~~~~~~~~
>      drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c:192:2: note: in expansion
> of macro =E2=80=98static_assert=E2=80=99
>      192 |  static_assert(ARRAY_SIZE(crcs) =3D=3D
> ARRAY_SIZE(crtc_state->mixers));
>          |  ^~~~~~~~~~~~~
>
> Can be fixed by moving the static_assert() before `crtc_state =3D ...`
>

I was trying to avoid moving that because I've seen tools flag things
like that as use-before-init before.  But I guess I can use
BUILD_BUG_ON() instead.

BR,
-R

> Thanks,
>
> Jessica Zhang
>
> >       /* Skip first 2 frames in case of "uncooked" CRCs */
> >       if (crtc_state->crc_frame_skip_count < 2) {
> >               crtc_state->crc_frame_skip_count++;
> > -             goto cleanup;
> > +             return 0;
> >       }
> >
> >       for (i =3D 0; i < crtc_state->num_mixers; ++i) {
> > @@ -210,16 +208,12 @@ static int dpu_crtc_get_crc(struct drm_crtc *crtc=
)
> >
> >               if (rc) {
> >                       DRM_DEBUG_DRIVER("MISR read failed\n");
> > -                     goto cleanup;
> > +                     return rc;
> >               }
> >       }
> >
> > -     rc =3D drm_crtc_add_crc_entry(crtc, true,
> > +     return drm_crtc_add_crc_entry(crtc, true,
> >                       drm_crtc_accurate_vblank_count(crtc), crcs);
> > -
> > -cleanup:
> > -     kfree(crcs);
> > -     return rc;
> >   }
> >
> >   static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
