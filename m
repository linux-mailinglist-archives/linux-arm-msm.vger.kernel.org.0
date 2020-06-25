Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2E79209E88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Jun 2020 14:35:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404451AbgFYMft (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Jun 2020 08:35:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404285AbgFYMfs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Jun 2020 08:35:48 -0400
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com [IPv6:2607:f8b0:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A3F6C061573
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 05:35:48 -0700 (PDT)
Received: by mail-oi1-x244.google.com with SMTP id s21so4777094oic.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Jun 2020 05:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oCu0iFE+AdDVZYz1ALkAdihLuNGJS5ayX5mtMGyJaww=;
        b=fKuqWvQUuFo67O5vz/K2ctEOnKezpthaawWYdURPJBsfj04YpwzA5qL9BTbLRJplAd
         71rQy5hZZd8nbKuY0HzPfvZu77HYisybMDCxQHUQz7MN1e86C6/ogIpAAFO6KVWvCew+
         7R4APv4fkUPgVonoEtj4AfzTanNFJbN3vWIYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oCu0iFE+AdDVZYz1ALkAdihLuNGJS5ayX5mtMGyJaww=;
        b=GU0qLBOONpXTdHPvZyjnCHFQipIObxDo3RsDDvFGI2Qzh8mqXgBUaIUd/FBD5TCcQd
         PZa3OCOdnHGoJlI2+TSvEa4xaO6KhfHul9beFVP0SEsGZuVcnMiktW3zma1YyjqBXoi2
         JW4/Z/AR3ildlGua+D5s4x7oVxi8s/RJ+rHrqGGfd3fgoz2IWyHxlNzg8HJRsM/ZExWk
         mSin8fXSUNOjg8uuJdDX5pgf/q9+a9CRFjhdbqcI62OktpZRWDg9H/qxmdEybo65FF+g
         5RJ1hTQxxwZA62B7detC/cHhIvxIUMWid4RF3uxwiX9mCpGpleXXy5UhsSnFkwxhGKps
         WZ4A==
X-Gm-Message-State: AOAM5323SfSb7TCjoE2oxD62JbVXsFBQVZqMPRMc8xty52ITcN+Madhr
        jgPDD9cxXnJcQDOC/Iy7u4M9zm+iNLggnYHYfdJGlw==
X-Google-Smtp-Source: ABdhPJxnqNDhc6NFz30dDmp7Zf82fZedM2suuX1I1C4bsH8y25rVB1rndOGEA0DaNNwoPHtu0pwJkntvar2ot6R8WU8=
X-Received: by 2002:aca:bc06:: with SMTP id m6mr1805535oif.101.1593088547775;
 Thu, 25 Jun 2020 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <20200625115746.13396-1-shawnguo@kernel.org>
In-Reply-To: <20200625115746.13396-1-shawnguo@kernel.org>
From:   Daniel Vetter <daniel.vetter@ffwll.ch>
Date:   Thu, 25 Jun 2020 14:35:36 +0200
Message-ID: <CAKMK7uGoDnizoE4t47houeyK2y5sLQbvCM3LDMWcEeV3oB5rPA@mail.gmail.com>
Subject: Re: [PATCH] drm/atomic_helper: duplicate state for drm_private_obj
To:     Shawn Guo <shawnguo@kernel.org>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Rob Clark <robdclark@gmail.com>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Shawn Guo <shawn.guo@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jun 25, 2020 at 1:58 PM Shawn Guo <shawnguo@kernel.org> wrote:
>
> From: Shawn Guo <shawn.guo@linaro.org>
>
> The msm/mdp5 driver uses drm_private_obj as its global atomic state,
> which keeps the assignment of hwpipe to plane.  With drm_private_obj
> missing from duplicate state call, mdp5 suspend works with no problem
> only for the very first time.  Any subsequent suspend will hit the
> following warning, because hwpipe assignment doesn't get duplicated for
> suspend state.  Adding drm_private_obj handling for duplicate state call
> fixes the problem.

If the driver needs a private state, it's supposed to duplicate that
in its atomic_check functionality. This isn't the helper's job.

If this is a bug in msm code, then pretty sure if you try hard enough,
you can hit the exact same bug from userspace too. Maybe good idea to
try and reproduce this with igt or something.
-Daniel


> $ echo mem > /sys/power/state
> [   38.111144] PM: suspend entry (deep)
> [   38.111185] PM: Syncing filesystems ... done.
> [   38.114630] Freezing user space processes ... (elapsed 0.001 seconds) done.
> [   38.115912] OOM killer disabled.
> [   38.115914] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> [   38.122170] ------------[ cut here ]------------
> [   38.122212] WARNING: CPU: 0 PID: 1747 at drivers/gpu/drm/msm/disp/mdp5/mdp5_pipe.c:145 mdp5_pipe_release+0x90/0xc0
> [   38.122215] Modules linked in:
> [   38.122222] CPU: 0 PID: 1747 Comm: sh Not tainted 4.19.107-00515-g9d5e4d7a33ed-dirty #323
> [   38.122224] Hardware name: Square, Inc. T2 Devkit (DT)
> [   38.122228] pstate: 40000005 (nZcv daif -PAN -UAO)
> [   38.122230] pc : mdp5_pipe_release+0x90/0xc0
> [   38.122233] lr : mdp5_pipe_release+0x90/0xc0
> [   38.122235] sp : ffff00000d13b7f0
> [   38.122236] x29: ffff00000d13b7f0 x28: 0000000000000000
> [   38.122240] x27: 0000000000000002 x26: ffff800079adce00
> [   38.122243] x25: ffff800079405200 x24: 0000000000000000
> [   38.122246] x23: ffff80007a78cc08 x22: ffff80007b1cc018
> [   38.122249] x21: ffff80007b1cc000 x20: ffff80007b317080
> [   38.122252] x19: ffff80007a78ce80 x18: 0000000000020000
> [   38.122255] x17: 0000000000000000 x16: 0000000000000000
> [   38.122258] x15: 00000000fffffff0 x14: ffff000008c3fb48
> [   38.122261] x13: ffff000008cdac4a x12: ffff000008c3f000
> [   38.122264] x11: 0000000000000000 x10: ffff000008cda000
> [   38.122267] x9 : 0000000000000000 x8 : ffff000008ce4a40
> [   38.122269] x7 : 0000000000000000 x6 : 0000000039ea41a9
> [   38.122272] x5 : 0000000000000000 x4 : 0000000000000000
> [   38.122275] x3 : ffffffffffffffff x2 : c7580c109cae4500
> [   38.122278] x1 : 0000000000000000 x0 : 0000000000000024
> [   38.122281] Call trace:
> [   38.122285]  mdp5_pipe_release+0x90/0xc0
> [   38.122288]  mdp5_plane_atomic_check+0x2c0/0x448
> [   38.122294]  drm_atomic_helper_check_planes+0xd0/0x208
> [   38.122298]  drm_atomic_helper_check+0x38/0xa8
> [   38.122302]  drm_atomic_check_only+0x3e8/0x630
> [   38.122305]  drm_atomic_commit+0x18/0x58
> [   38.122309]  __drm_atomic_helper_disable_all.isra.12+0x15c/0x1a8
> [   38.122312]  drm_atomic_helper_suspend+0x80/0xf0
> [   38.122316]  msm_pm_suspend+0x4c/0x70
> [   38.122320]  dpm_run_callback.isra.6+0x20/0x68
> [   38.122323]  __device_suspend+0x110/0x308
> [   38.122326]  dpm_suspend+0x100/0x1f0
> [   38.122329]  dpm_suspend_start+0x64/0x70
> [   38.122334]  suspend_devices_and_enter+0x110/0x500
> [   38.122336]  pm_suspend+0x268/0x2c0
> [   38.122339]  state_store+0x88/0x110
> [   38.122345]  kobj_attr_store+0x14/0x28
> [   38.122352]  sysfs_kf_write+0x3c/0x50
> [   38.122355]  kernfs_fop_write+0x118/0x1e0
> [   38.122360]  __vfs_write+0x30/0x168
> [   38.122363]  vfs_write+0xa4/0x1a8
> [   38.122366]  ksys_write+0x64/0xe8
> [   38.122368]  __arm64_sys_write+0x18/0x20
> [   38.122374]  el0_svc_common+0x6c/0x178
> [   38.122377]  el0_svc_compat_handler+0x1c/0x28
> [   38.122381]  el0_svc_compat+0x8/0x18
> [   38.122383] ---[ end trace 24145b7d8545345b ]---
> [   38.491552] Disabling non-boot CPUs ...
>
> Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 85d163f16801..024985a92156 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -3140,6 +3140,7 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
>         struct drm_atomic_state *state;
>         struct drm_connector *conn;
>         struct drm_connector_list_iter conn_iter;
> +       struct drm_private_obj *priv_obj;
>         struct drm_plane *plane;
>         struct drm_crtc *crtc;
>         int err = 0;
> @@ -3184,6 +3185,16 @@ drm_atomic_helper_duplicate_state(struct drm_device *dev,
>         }
>         drm_connector_list_iter_end(&conn_iter);
>
> +       drm_for_each_privobj(priv_obj, dev) {
> +               struct drm_private_state *priv_state;
> +
> +               priv_state = drm_atomic_get_private_obj_state(state, priv_obj);
> +               if (IS_ERR(priv_state)) {
> +                       err = PTR_ERR(priv_state);
> +                       goto free;
> +               }
> +       }
> +
>         /* clear the acquire context so that it isn't accidentally reused */
>         state->acquire_ctx = NULL;
>
> @@ -3278,6 +3289,8 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
>         struct drm_connector_state *new_conn_state;
>         struct drm_crtc *crtc;
>         struct drm_crtc_state *new_crtc_state;
> +       struct drm_private_state *new_priv_state;
> +       struct drm_private_obj *priv_obj;
>
>         state->acquire_ctx = ctx;
>
> @@ -3290,6 +3303,9 @@ int drm_atomic_helper_commit_duplicated_state(struct drm_atomic_state *state,
>         for_each_new_connector_in_state(state, connector, new_conn_state, i)
>                 state->connectors[i].old_state = connector->state;
>
> +       for_each_new_private_obj_in_state(state, priv_obj, new_priv_state, i)
> +               state->private_objs[i].old_state = priv_obj->state;
> +
>         ret = drm_atomic_commit(state);
>
>         state->acquire_ctx = NULL;
> --
> 2.17.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
