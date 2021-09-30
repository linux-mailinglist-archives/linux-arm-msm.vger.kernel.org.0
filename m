Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 75FF441E140
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Sep 2021 20:34:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343522AbhI3SgZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Sep 2021 14:36:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245695AbhI3SgY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Sep 2021 14:36:24 -0400
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com [IPv6:2607:f8b0:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 032BFC06176A
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:34:42 -0700 (PDT)
Received: by mail-oi1-x22b.google.com with SMTP id y201so8501096oie.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Sep 2021 11:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WzEFhcvH/Na9w/rh3vRVxZizFbaM18w+Th+vRdfVjxw=;
        b=OKZoY3nu59ohhZIGR9rXi4peRz7SQuNBkUJQZfiWyWMgNU31fC/2YKvc3uv3oLDxVz
         QupNMRm1Kou669rMbTjmKfydZLdm1h/SeITsid38QYO5+BBNQVc1DxwVgPZhI13xf7Vc
         YHe7NepSVTMn6I3JqwOQkIQqqKmwYSs2pWsH0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WzEFhcvH/Na9w/rh3vRVxZizFbaM18w+Th+vRdfVjxw=;
        b=aqPKlbhKiNxLLH/Od32q7ZsT8xQtqWQ7XlzeBJzWq/Vk5kf62wg3t/qkY4FwcoypLz
         tMvWOJsKPqX3dswjOqkeYfTyX1oTntX/TsY1sn55fwkM5pysMB9gFDYlvsdavAZGyGXA
         HTBj9FUiDUuWUq8bBwpfVMxTBZo8KFiQQgdKTE/IXJGz7XjfOjnfXhFuA8iaX6Tl4nF7
         yOo1GN7ZLsbmo4O5j7f43/ulWwlAxSJhSPwnszEtRkpTCKgX2OBmCeogCOReZMOOB8GG
         68ewEhaE8EpazA4gcTaMTE82X/j7vylxg3X2Dppsx37jOs6xCe/TKFrCB8drM4rWxdE5
         KGDg==
X-Gm-Message-State: AOAM530y9MfuvRoHo6QFQkM/okRM7YutNJ0lsk6Nh/3EtdE4dqerBigJ
        6dnmKu1jSyunHN76PuvSE8XMLaaVKCNs2v7Q8Wgogw==
X-Google-Smtp-Source: ABdhPJx9ELUrirwIP326cxiFbEMEgFqEj7GidWLBwOvTQWdCuRmskxLM7MklwgV1364VuPz5akiuxQy9fSdf1gjNQCk=
X-Received: by 2002:a05:6808:697:: with SMTP id k23mr620644oig.128.1633026881376;
 Thu, 30 Sep 2021 11:34:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210930182506.1236811-1-robdclark@gmail.com>
In-Reply-To: <20210930182506.1236811-1-robdclark@gmail.com>
From:   Daniel Vetter <daniel@ffwll.ch>
Date:   Thu, 30 Sep 2021 20:34:30 +0200
Message-ID: <CAKMK7uF1kfUD1mc4UScvVG0Su9HiN6M388YhT0jO+iGExxnVtw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/a6xx: Track current ctx by seqno
To:     Rob Clark <robdclark@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Yangtao Li <tiny.windzz@gmail.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Sep 30, 2021 at 8:20 PM Rob Clark <robdclark@gmail.com> wrote:
>
> From: Rob Clark <robdclark@chromium.org>
>
> In theory a context can be destroyed and a new one allocated at the same
> address, making the pointer comparision to detect when we don't need to
> update the current pagetables invalid.  Instead assign a sequence number
> to each context on creation, and use this for the check.
>
> Fixes: 84c31ee16f90 ("drm/msm/a6xx: Add support for per-instance pagetables")
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Usually the weak reference pattern is to wrap a spinlock or something
around it and clear it out on destruction. Or hold a full reference
(e.g. on intel hw the hw goes unhappy if there's no context/pagetables
at all, so we always need some). But I guess this works too.
-Daniel

> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c |  6 +++---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h | 11 ++++++++++-
>  drivers/gpu/drm/msm/msm_drv.c         |  3 +++
>  drivers/gpu/drm/msm/msm_drv.h         |  1 +
>  4 files changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5e1ae3df42ba..e0a8b2fd1ff0 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -106,7 +106,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>         u32 asid;
>         u64 memptr = rbmemptr(ring, ttbr0);
>
> -       if (ctx == a6xx_gpu->cur_ctx)
> +       if (ctx->seqno == a6xx_gpu->cur_ctx_seqno)
>                 return;
>
>         if (msm_iommu_pagetable_params(ctx->aspace->mmu, &ttbr, &asid))
> @@ -139,7 +139,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
>         OUT_PKT7(ring, CP_EVENT_WRITE, 1);
>         OUT_RING(ring, 0x31);
>
> -       a6xx_gpu->cur_ctx = ctx;
> +       a6xx_gpu->cur_ctx_seqno = ctx->seqno;
>  }
>
>  static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
> @@ -1081,7 +1081,7 @@ static int hw_init(struct msm_gpu *gpu)
>         /* Always come up on rb 0 */
>         a6xx_gpu->cur_ring = gpu->rb[0];
>
> -       a6xx_gpu->cur_ctx = NULL;
> +       a6xx_gpu->cur_ctx_seqno = 0;
>
>         /* Enable the SQE_to start the CP engine */
>         gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 1);
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 0bc2d062f54a..8e5527c881b1 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -19,7 +19,16 @@ struct a6xx_gpu {
>         uint64_t sqe_iova;
>
>         struct msm_ringbuffer *cur_ring;
> -       struct msm_file_private *cur_ctx;
> +
> +       /**
> +        * cur_ctx_seqno:
> +        *
> +        * The ctx->seqno value of the context with current pgtables
> +        * installed.  Tracked by seqno rather than pointer value to
> +        * avoid dangling pointers, and cases where a ctx can be freed
> +        * and a new one created with the same address.
> +        */
> +       int cur_ctx_seqno;
>
>         struct a6xx_gmu gmu;
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index 624078b3adf2..30c1efc3d8a0 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -711,6 +711,7 @@ static void load_gpu(struct drm_device *dev)
>
>  static int context_init(struct drm_device *dev, struct drm_file *file)
>  {
> +       static atomic_t ident = ATOMIC_INIT(0);
>         struct msm_drm_private *priv = dev->dev_private;
>         struct msm_file_private *ctx;
>
> @@ -727,6 +728,8 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>         ctx->aspace = msm_gpu_create_private_address_space(priv->gpu, current);
>         file->driver_priv = ctx;
>
> +       ctx->seqno = atomic_inc_return(&ident);
> +
>         return 0;
>  }
>
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index de062450add4..8633d0059a3e 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -59,6 +59,7 @@ struct msm_file_private {
>         int queueid;
>         struct msm_gem_address_space *aspace;
>         struct kref ref;
> +       int seqno;
>  };
>
>  enum msm_mdp_plane_property {
> --
> 2.31.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
