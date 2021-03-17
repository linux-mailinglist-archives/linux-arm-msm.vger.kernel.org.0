Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BF2B833F55E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 17:23:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232067AbhCQQWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Mar 2021 12:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232101AbhCQQWR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Mar 2021 12:22:17 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03E7FC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 09:22:17 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id r15-20020a05600c35cfb029010e639ca09eso3731244wmq.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Mar 2021 09:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LLJ/2r9/jS5wc1sgd4b6Gkg0QJoSZ+U4u6jpN909XPc=;
        b=ovqkJuuSzOcWDkLIh+KlBGYSM7ewLt5II8h6ULSz70U9z800NT+crym/e2LLAoE290
         sd1kFdbhWclmmhDSyOxgEcBp9bnjpwLuiB2z8kMy2jfsH5RmR82Z3bUi7c8KbmIRlXPk
         WekIb++nLe7pB1dV4TcVitPVx/cv3pwQP0roXqP1UoL6c8jfm5toFPs5t9MWzNCUMW0U
         GRYfZbQD7FngSf+J/dQ+cJrOeVU8hd9l4xjXgrBMAdnYkgT6SxRJQr8bryTH63R28ygV
         Ug7QxIL3HMnOcAsLQasjjzff0/7mvZ7D+fGfQ/nf1c1k30cZoyTLJhDr5+xP1nhNAmql
         6wbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LLJ/2r9/jS5wc1sgd4b6Gkg0QJoSZ+U4u6jpN909XPc=;
        b=QAuOhZdIFZ1D5SJTQyCu4ryEl2zVzuRsy/0zlA+uXhElua08nFTgVZXbRgI0QjD7x7
         hd4idh6j+zWpTAnP+tjRiZGjFgfJpTNnBEcae4KycxyYJAIxywHHacdPGcEp+mi1S/4r
         vFAUGvJCDrVfKnQ+0tEpnyYd0pUHpj8Q0YMUzafy2Ghh445pCm4fYrW8fw/NPbH8VKEa
         tMYWj+3CVzKFjw/5ZeNK+nUKm+8I426ZPzSqW4X3DG3KhS0HuUhZJD2NM1rc+YiZuCf0
         YXYynfwTyfIQIhtLTjJ0O1FwqonBRzGL3UNePg16YIaEYzVMgMIdM/AxAbdNajuaj39X
         VpAw==
X-Gm-Message-State: AOAM532t7seG8IAB69fnfmgJVcXkHnTw50lgqgnCRW4Ncyw5YMpdhhoo
        8Ihz43we3iLG8i2nAD6BU0qnMCZemLcsE6tYXG8=
X-Google-Smtp-Source: ABdhPJyBhVoRwKNysP+CSzeDWV9952uUQkx9M63AL8RmXZqs/wyypjylQCTWBgxpaU/hiK2ungS2ngb6sqr++BEJuOA=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr4586006wma.94.1615998135757;
 Wed, 17 Mar 2021 09:22:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20210301214152.1805737-1-dmitry.baryshkov@linaro.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 17 Mar 2021 09:25:26 -0700
Message-ID: <CAF6AEGsN4s_wF0kHx4Y=vMM3AMTCewE4oiBdaxguVAku_nkODw@mail.gmail.com>
Subject: Re: [PATCH] gpu/drm/msm: fix shutdown hook in case GPU components
 failed to bind
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Mar 1, 2021 at 1:41 PM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> if GPU components have failed to bind, shutdown callback would fail with
> the following backtrace. Add safeguard check to stop that oops from
> happening and allow the board to reboot.
>
> [   66.617046] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [   66.626066] Mem abort info:
> [   66.628939]   ESR = 0x96000006
> [   66.632088]   EC = 0x25: DABT (current EL), IL = 32 bits
> [   66.637542]   SET = 0, FnV = 0
> [   66.640688]   EA = 0, S1PTW = 0
> [   66.643924] Data abort info:
> [   66.646889]   ISV = 0, ISS = 0x00000006
> [   66.650832]   CM = 0, WnR = 0
> [   66.653890] user pgtable: 4k pages, 48-bit VAs, pgdp=0000000107f81000
> [   66.660505] [0000000000000000] pgd=0000000100bb2003, p4d=0000000100bb2003, pud=0000000100897003, pmd=0000000000000000
> [   66.671398] Internal error: Oops: 96000006 [#1] PREEMPT SMP
> [   66.677115] Modules linked in:
> [   66.680261] CPU: 6 PID: 352 Comm: reboot Not tainted 5.11.0-rc2-00309-g79e3faa756b2 #38
> [   66.688473] Hardware name: Qualcomm Technologies, Inc. Robotics RB5 (DT)
> [   66.695347] pstate: 60400005 (nZCv daif +PAN -UAO -TCO BTYPE=--)
> [   66.701507] pc : msm_atomic_commit_tail+0x78/0x4e0
> [   66.706437] lr : commit_tail+0xa4/0x184
> [   66.710381] sp : ffff8000108f3af0
> [   66.713791] x29: ffff8000108f3af0 x28: ffff418c44337000
> [   66.719242] x27: 0000000000000000 x26: ffff418c40a24490
> [   66.724693] x25: ffffd3a842a4f1a0 x24: 0000000000000008
> [   66.730146] x23: ffffd3a84313f030 x22: ffff418c444ce000
> [   66.735598] x21: ffff418c408a4980 x20: 0000000000000000
> [   66.741049] x19: 0000000000000000 x18: ffff800010710fbc
> [   66.746500] x17: 000000000000000c x16: 0000000000000001
> [   66.751954] x15: 0000000000010008 x14: 0000000000000068
> [   66.757405] x13: 0000000000000001 x12: 0000000000000000
> [   66.762855] x11: 0000000000000001 x10: 00000000000009b0
> [   66.768306] x9 : ffffd3a843192000 x8 : ffff418c44337000
> [   66.773757] x7 : 0000000000000000 x6 : 00000000a401b34e
> [   66.779210] x5 : 00ffffffffffffff x4 : 0000000000000000
> [   66.784660] x3 : 0000000000000000 x2 : ffff418c444ce000
> [   66.790111] x1 : ffffd3a841dce530 x0 : ffff418c444cf000
> [   66.795563] Call trace:
> [   66.798075]  msm_atomic_commit_tail+0x78/0x4e0
> [   66.802633]  commit_tail+0xa4/0x184
> [   66.806217]  drm_atomic_helper_commit+0x160/0x390
> [   66.811051]  drm_atomic_commit+0x4c/0x60
> [   66.815082]  drm_atomic_helper_disable_all+0x1f4/0x210
> [   66.820355]  drm_atomic_helper_shutdown+0x80/0x130
> [   66.825276]  msm_pdev_shutdown+0x14/0x20
> [   66.829303]  platform_shutdown+0x28/0x40
> [   66.833330]  device_shutdown+0x158/0x330
> [   66.837357]  kernel_restart+0x40/0xa0
> [   66.841122]  __do_sys_reboot+0x228/0x250
> [   66.845148]  __arm64_sys_reboot+0x28/0x34
> [   66.849264]  el0_svc_common.constprop.0+0x74/0x190
> [   66.854187]  do_el0_svc+0x24/0x90
> [   66.857595]  el0_svc+0x14/0x20
> [   66.860739]  el0_sync_handler+0x1a4/0x1b0
> [   66.864858]  el0_sync+0x174/0x180
> [   66.868269] Code: 1ac020a0 2a000273 eb02007f 54ffff01 (f9400285)
> [   66.874525] ---[ end trace 20dedb2a3229fec8 ]---
>
> Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  drivers/gpu/drm/msm/msm_atomic.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_atomic.c b/drivers/gpu/drm/msm/msm_atomic.c
> index 6a326761dc4a..2fd0cf6421ad 100644
> --- a/drivers/gpu/drm/msm/msm_atomic.c
> +++ b/drivers/gpu/drm/msm/msm_atomic.c
> @@ -207,7 +207,12 @@ void msm_atomic_commit_tail(struct drm_atomic_state *state)
>         struct msm_kms *kms = priv->kms;
>         struct drm_crtc *async_crtc = NULL;
>         unsigned crtc_mask = get_crtc_mask(state);
> -       bool async = kms->funcs->vsync_time &&
> +       bool async;
> +
> +       if (!kms)
> +               return;

I think we could instead just check for null priv->kms in
msm_pdev_shutdown() and not call drm_atomic_helper_shutdown()?

BR,
-R

> +
> +       async = kms->funcs->vsync_time &&
>                         can_do_async(state, &async_crtc);
>
>         trace_msm_atomic_commit_tail_start(async, crtc_mask);
> --
> 2.30.1
>
