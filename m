Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13634418ACF
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 21:36:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229902AbhIZThl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Sep 2021 15:37:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbhIZThl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Sep 2021 15:37:41 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0656C061570
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 12:36:04 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id j13so14795596qtq.6
        for <linux-arm-msm@vger.kernel.org>; Sun, 26 Sep 2021 12:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QNLo+BDeRzswu8OVj0ImwhuxytbjRMbnLrd3OSd+ezM=;
        b=mxWrjX5he+m1gtrMynC7sxL4bJR4TEb7Z5+iKgZ4UA7fEs/FUwqkXf7ngwMGFT5/Db
         Sots6y/e+AyMpHYfxPDxM15ivMQ64EpVso917AW6iutqoaIgnIiLC2RLz/tbjphMwui+
         C1CXEh4rnk6MQrQPluTDU4Rca24IDOzB3v16c3kKmckfaJIh27/vZA/i5Sz7lVZvwCqb
         LlUhCs9WKOWYVi7HnehJ3DVAYTgpYVNqn0trmnNzNMXpCv4YUbHsTqStwvLxgoYKJewK
         dVKr8Qb8Zd7oMYKxEVmA1jHxSPWrG3vgP9Hl7auD98qbty89k6QYFMeb1AY/eUfS+3IG
         /DYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QNLo+BDeRzswu8OVj0ImwhuxytbjRMbnLrd3OSd+ezM=;
        b=Ntb1qGwgaWTl5KrRM2HQGgkljZqTNlT0p+92P14E5JtgRjY89/PvVK/QUfk/27CF8u
         g9HMd9g62uu3dMetx7HkvZNEGuCBomga08JqlvkEZEVGzoOtGlCuT02oupD0UXWKMAzS
         F7ysJ+HK0+AEBpLKg+T126b4JSd/D7cKHGduqWbgEbs+BikfrCAsjODmWw60DIg9TS7I
         zQ8IDkQJJ+hUBwYw3k27IxiGtTCROvSwMDjqHEl4tdreYo7lTRWB+XKHWSu6F/ImV2Wa
         4jRlXtuI8g9Hm0gcyDiPETnmOo+MHG1WMLn9TSL8eTHu/6YXcH6LQSIlXwzog0zKW1ze
         uCSA==
X-Gm-Message-State: AOAM5316wnxgho6l7ZO2fHIWS/ZXH1erRLfISeihzb2PoLpma5UKp30/
        1hiXXVctJ5U1+WThg3SNVivxWhX+WF7OsaseC4Nw3w==
X-Google-Smtp-Source: ABdhPJwPrdFOmtZSNs2/CV2JSD0Gdn8+7TSgw7cBpjnVt5rPCDBdy/Kp5IW7mXOuEB6cBPz3cI2vO9xpI/n4gVj8suo=
X-Received: by 2002:ac8:5685:: with SMTP id h5mr15207682qta.153.1632684964087;
 Sun, 26 Sep 2021 12:36:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210926190554.761482-1-robdclark@gmail.com>
In-Reply-To: <20210926190554.761482-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Sun, 26 Sep 2021 22:35:53 +0300
Message-ID: <CAA8EJpozNAfQpy4w-Edx_8wyQ_X+sDzAgqk6Z6EHj0ZJ5r0HBg@mail.gmail.com>
Subject: Re: [PATCH] drm/msm: Fix crash on dev file close
To:     Rob Clark <robdclark@gmail.com>
Cc:     "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Steev Klimaszewski <steev@kali.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sun, 26 Sept 2021 at 22:01, Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> If the device file was opened prior to fw being available (such as from
> initrd before rootfs is mounted, when the initrd does not contain GPU
> fw), that would cause a later crash when the dev file is closed due to
> unitialized submitqueues list:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I've sent a close version of this patch a day or so ago, but yours is
better, as I did not touch rwlock init.

>
>    CPU: 4 PID: 263 Comm: plymouthd Tainted: G        W         5.15.0-rc2-next-20210924 #2
>    Hardware name: LENOVO 81JL/LNVNB161216, BIOS 9UCN33WW(V2.06) 06/ 4/2019
>    pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
>    pc : msm_submitqueue_close+0x30/0x190 [msm]
>    lr : msm_postclose+0x54/0xf0 [msm]
>    sp : ffff80001074bb80
>    x29: ffff80001074bb80 x28: ffff03ad80c4db80 x27: ffff03ad80dc5ab0
>    x26: 0000000000000000 x25: ffff03ad80dc5af8 x24: ffff03ad81e90800
>    x23: 0000000000000000 x22: ffff03ad81e90800 x21: ffff03ad8b35e788
>    x20: ffff03ad81e90878 x19: 0000000000000000 x18: 0000000000000000
>    x17: 0000000000000000 x16: ffffda15f14f7940 x15: 0000000000000000
>    x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000040
>    x11: 0000000000000000 x10: 0000000000000000 x9 : ffffda15cd18ff88
>    x8 : ffff03ad80c4db80 x7 : 0000000000000228 x6 : 0000000000000000
>    x5 : 1793a4e807e636bd x4 : ffff03ad80c4db80 x3 : ffff03ad81e90878
>    x2 : 0000000000000000 x1 : ffff03ad80c4db80 x0 : 0000000000000000
>    Call trace:
>     msm_submitqueue_close+0x30/0x190 [msm]
>     msm_postclose+0x54/0xf0 [msm]
>     drm_file_free.part.0+0x1cc/0x2e0 [drm]
>     drm_close_helper.isra.0+0x74/0x84 [drm]
>     drm_release+0x78/0x120 [drm]
>     __fput+0x78/0x23c
>     ____fput+0x1c/0x30
>     task_work_run+0xcc/0x22c
>     do_exit+0x304/0x9f4
>     do_group_exit+0x44/0xb0
>     __wake_up_parent+0x0/0x3c
>     invoke_syscall+0x50/0x120
>     el0_svc_common.constprop.0+0x4c/0xf4
>     do_el0_svc+0x30/0x9c
>     el0_svc+0x20/0x60
>     el0t_64_sync_handler+0xe8/0xf0
>     el0t_64_sync+0x1a0/0x1a4
>    Code: aa0003f5 a90153f3 f8408eb3 aa1303e0 (f85e8674)
>    ---[ end trace 39b2fa37509a2be2 ]---
>    Fixing recursive fault but reboot is needed!
>
> Fixes: 86c2a0f000c1 drm/msm: ("Small submitqueue creation cleanup")
> Reported-by: Steev Klimaszewski <steev@kali.org>
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_drv.c         | 3 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c | 4 ----
>  2 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index f350de754f84..938765ad7109 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -689,6 +689,9 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>         if (!ctx)
>                 return -ENOMEM;
>
> +       INIT_LIST_HEAD(&ctx->submitqueues);
> +       rwlock_init(&ctx->queuelock);
> +
>         kref_init(&ctx->ref);
>         msm_submitqueue_init(dev, ctx);
>
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index 32a55d81b58b..7ce0771b5582 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -140,10 +140,6 @@ int msm_submitqueue_init(struct drm_device *drm, struct msm_file_private *ctx)
>          */
>         default_prio = DIV_ROUND_UP(max_priority, 2);
>
> -       INIT_LIST_HEAD(&ctx->submitqueues);
> -
> -       rwlock_init(&ctx->queuelock);
> -
>         return msm_submitqueue_create(drm, ctx, default_prio, 0, NULL);
>  }
>
> --
> 2.31.1
>


-- 
With best wishes
Dmitry
