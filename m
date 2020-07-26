Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86FA722E18F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jul 2020 19:09:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726174AbgGZRJD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 26 Jul 2020 13:09:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38440 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726117AbgGZRJC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 26 Jul 2020 13:09:02 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6222EC0619D2;
        Sun, 26 Jul 2020 10:09:02 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id z17so10423718edr.9;
        Sun, 26 Jul 2020 10:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BEdAOacpA02RSTdODVerNwtQ0U8u95pqWJEraSyAdA8=;
        b=OdDgnzrnie9U+10uSs27wvu8KCysIQfpnxj7W/GOWQaGfvyt8z6T3YFEHDbtenPCXp
         iaBSU2FDoesT2IUJVjXu7769h+U+DdJDmypFq1cnn33kpkECkWKlWkXEJ/Pgv000jb/R
         E+PfW6IGLbaQG+y0y03VjIWzaBEFY4mVvSQwR797VOFzXk9RCX4p0S1xkUHxhtqr/672
         B5XpAAmA/AF/VpK0aON8DMFAI4jxYooBvf99RXn9Pj+vDQHQMCw6e0C7jURYHOkC19oB
         42rps9fIv4LrK9tFDtc3kA5ZW+uTFP/inLkz2p9ZAJhfHK1393FIPdf+AnpC/7Kik3Q1
         RbVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BEdAOacpA02RSTdODVerNwtQ0U8u95pqWJEraSyAdA8=;
        b=RG6Yt7jVrEGUIbaAjt8/FKRM6AteaxnnD8OUmn5qDjpt1wZ/ZNHqmDJtiB5X7U++4a
         0AbemSAwgVHyreiWX3nxczOQXYcJ0H2hYxUn49YgKxRUsUCPUlXYTDm3u4PtnrZqj/8P
         +Ajn6/x/ygy7vpSX12KwZYS1CP3WS9hpqvpmcw5k3F5CpuvEdxOuaeflNIounhES2ko0
         fkLJ1JuqdQbJy8WBIhbBI9UAVkhL9y3vNEQ4D26sipCWt/D/C6D2gnoTdOv0j0QtzVCQ
         B3DEG5/xmth3AcbqRNdJANBnphrEVdle6gLknNu+l689mDi5m+9hBGjBfB9wn5Zfxw2C
         xMMg==
X-Gm-Message-State: AOAM531jYVNQwFlUnmNrLukHiqTsjyBD66PvDU00lsQHELMQEqArZ1rL
        sx5qNrM2mg4tFt6CRjeAgw4aziKiJstj70gfz0Y=
X-Google-Smtp-Source: ABdhPJzIqYohmBTIYijtnEnCRPCPOnNqPbkQfjLUFi66jLIVYKqmAmRq4z25FY+u+JnIoQJmrcjIhXiPsQ106YuNTmY=
X-Received: by 2002:a05:6402:a5b:: with SMTP id bt27mr1559228edb.120.1595783340869;
 Sun, 26 Jul 2020 10:09:00 -0700 (PDT)
MIME-Version: 1.0
References: <20200720154047.3611092-1-jcrouse@codeaurora.org> <20200720154047.3611092-9-jcrouse@codeaurora.org>
In-Reply-To: <20200720154047.3611092-9-jcrouse@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 26 Jul 2020 10:09:39 -0700
Message-ID: <CAF6AEGsp2-BNc0BY76fAmK1Zo3_HKJF+bx6UBaNNDS2Au0KXWg@mail.gmail.com>
Subject: Re: [PATCH v10 08/13] drm/msm: Add a context pointer to the submitqueue
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Will Deacon <will@kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Wambui Karuga <wambui.karugax@gmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jul 20, 2020 at 8:41 AM Jordan Crouse <jcrouse@codeaurora.org> wrote:
>
> Each submitqueue is attached to a context. Add a pointer to the
> context to the submitqueue at create time and refcount it so
> that it stays around through the life of the queue.
>
> GPU submissions can access the active context via the submitqueue
> instead of requiring it to be passed around from function to
> function.
>
> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 12 +++++-------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 +--
>  drivers/gpu/drm/msm/msm_drv.c           |  3 ++-
>  drivers/gpu/drm/msm/msm_drv.h           |  8 ++++++++
>  drivers/gpu/drm/msm/msm_gem.h           |  1 +
>  drivers/gpu/drm/msm/msm_gem_submit.c    |  8 ++++----
>  drivers/gpu/drm/msm/msm_gpu.c           |  9 ++++-----
>  drivers/gpu/drm/msm/msm_gpu.h           |  7 +++----
>  drivers/gpu/drm/msm/msm_submitqueue.c   |  8 +++++++-
>  11 files changed, 39 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> index 9e63a190642c..eff2439ea57b 100644
> --- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
> @@ -43,8 +43,7 @@ static void a5xx_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
>                 gpu_write(gpu, REG_A5XX_CP_RB_WPTR, wptr);
>  }
>
> -static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -       struct msm_file_private *ctx)
> +static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>         struct msm_drm_private *priv = gpu->dev->dev_private;
>         struct msm_ringbuffer *ring = submit->ring;
> @@ -57,7 +56,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>                 case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>                         break;
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -                       if (priv->lastctx == ctx)
> +                       if (priv->lastctx == submit->queue->ctx)
>                                 break;
>                         /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
> @@ -103,8 +102,7 @@ static void a5xx_submit_in_rb(struct msm_gpu *gpu, struct msm_gem_submit *submit
>         msm_gpu_retire(gpu);
>  }
>
> -static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -       struct msm_file_private *ctx)
> +static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a5xx_gpu *a5xx_gpu = to_a5xx_gpu(adreno_gpu);
> @@ -114,7 +112,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>
>         if (IS_ENABLED(CONFIG_DRM_MSM_GPU_SUDO) && submit->in_rb) {
>                 priv->lastctx = NULL;
> -               a5xx_submit_in_rb(gpu, submit, ctx);
> +               a5xx_submit_in_rb(gpu, submit);
>                 return;
>         }
>
> @@ -148,7 +146,7 @@ static void a5xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                 case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>                         break;
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -                       if (priv->lastctx == ctx)
> +                       if (priv->lastctx == submit->queue->ctx)
>                                 break;
>                         /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index c5a3e4d4c007..5eabb0109577 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -81,8 +81,7 @@ static void get_stats_counter(struct msm_ringbuffer *ring, u32 counter,
>         OUT_RING(ring, upper_32_bits(iova));
>  }
>
> -static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -       struct msm_file_private *ctx)
> +static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>         unsigned int index = submit->seqno % MSM_GPU_SUBMIT_STATS_COUNT;
>         struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -115,7 +114,7 @@ static void a6xx_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                 case MSM_SUBMIT_CMD_IB_TARGET_BUF:
>                         break;
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
> -                       if (priv->lastctx == ctx)
> +                       if (priv->lastctx == submit->queue->ctx)
>                                 break;
>                         /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index e23641a5ec84..b38a8126541a 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -457,8 +457,7 @@ void adreno_recover(struct msm_gpu *gpu)
>         }
>  }
>
> -void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -               struct msm_file_private *ctx)
> +void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -472,7 +471,7 @@ void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                         break;
>                 case MSM_SUBMIT_CMD_CTX_RESTORE_BUF:
>                         /* ignore if there has not been a ctx switch: */
> -                       if (priv->lastctx == ctx)
> +                       if (priv->lastctx == submit->queue->ctx)
>                                 break;
>                         /* fall-thru */
>                 case MSM_SUBMIT_CMD_BUF:
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 99bb468f5f24..0ae8b373c428 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -267,8 +267,7 @@ struct drm_gem_object *adreno_fw_create_bo(struct msm_gpu *gpu,
>                 const struct firmware *fw, u64 *iova);
>  int adreno_hw_init(struct msm_gpu *gpu);
>  void adreno_recover(struct msm_gpu *gpu);
> -void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -               struct msm_file_private *ctx);
> +void adreno_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>  void adreno_flush(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  bool adreno_idle(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>  #if defined(CONFIG_DEBUG_FS) || defined(CONFIG_DEV_COREDUMP)
> diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
> index ff379ed40469..556198d4ba5f 100644
> --- a/drivers/gpu/drm/msm/msm_drv.c
> +++ b/drivers/gpu/drm/msm/msm_drv.c
> @@ -600,6 +600,7 @@ static int context_init(struct drm_device *dev, struct drm_file *file)
>         if (!ctx)
>                 return -ENOMEM;
>
> +       kref_init(&ctx->ref);
>         msm_submitqueue_init(dev, ctx);
>
>         ctx->aspace = priv->gpu ? priv->gpu->aspace : NULL;
> @@ -621,7 +622,7 @@ static int msm_open(struct drm_device *dev, struct drm_file *file)
>  static void context_close(struct msm_file_private *ctx)
>  {
>         msm_submitqueue_close(ctx);
> -       kfree(ctx);
> +       kref_put(&ctx->ref, msm_file_private_destroy);
>  }
>
>  static void msm_postclose(struct drm_device *dev, struct drm_file *file)
> diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
> index 2687f7a42c15..ab5f77261816 100644
> --- a/drivers/gpu/drm/msm/msm_drv.h
> +++ b/drivers/gpu/drm/msm/msm_drv.h
> @@ -57,6 +57,7 @@ struct msm_file_private {
>         struct list_head submitqueues;
>         int queueid;
>         struct msm_gem_address_space *aspace;
> +       struct kref ref;
>  };
>
>  enum msm_mdp_plane_property {
> @@ -429,6 +430,13 @@ void msm_submitqueue_close(struct msm_file_private *ctx);
>
>  void msm_submitqueue_destroy(struct kref *kref);
>
> +static inline void msm_file_private_destroy(struct kref *kref)
> +{
> +       struct msm_file_private *ctx = container_of(kref,
> +               struct msm_file_private, ref);
> +
> +       kfree(ctx);
> +}
>
>  #define DBG(fmt, ...) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
>  #define VERB(fmt, ...) if (0) DRM_DEBUG_DRIVER(fmt"\n", ##__VA_ARGS__)
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 972490b14ba5..9c573c4269cb 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -142,6 +142,7 @@ struct msm_gem_submit {
>         bool valid;         /* true if no cmdstream patching needed */
>         bool in_rb;         /* "sudo" mode, copy cmds into RB */
>         struct msm_ringbuffer *ring;
> +       struct msm_file_private *ctx;
>         unsigned int nr_cmds;
>         unsigned int nr_bos;
>         u32 ident;         /* A "identifier" for the submit for logging */
> diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
> index 8cb9aa15ff90..aa5c60a7132d 100644
> --- a/drivers/gpu/drm/msm/msm_gem_submit.c
> +++ b/drivers/gpu/drm/msm/msm_gem_submit.c
> @@ -27,7 +27,7 @@
>  #define BO_PINNED   0x2000
>
>  static struct msm_gem_submit *submit_create(struct drm_device *dev,
> -               struct msm_gpu *gpu, struct msm_gem_address_space *aspace,
> +               struct msm_gpu *gpu,
>                 struct msm_gpu_submitqueue *queue, uint32_t nr_bos,
>                 uint32_t nr_cmds)
>  {
> @@ -43,7 +43,7 @@ static struct msm_gem_submit *submit_create(struct drm_device *dev,
>                 return NULL;
>
>         submit->dev = dev;
> -       submit->aspace = aspace;
> +       submit->aspace = queue->ctx->aspace;
>         submit->gpu = gpu;
>         submit->fence = NULL;
>         submit->cmd = (void *)&submit->bos[nr_bos];
> @@ -677,7 +677,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 }
>         }
>
> -       submit = submit_create(dev, gpu, ctx->aspace, queue, args->nr_bos,
> +       submit = submit_create(dev, gpu, queue, args->nr_bos,
>                 args->nr_cmds);
>         if (!submit) {
>                 ret = -ENOMEM;
> @@ -785,7 +785,7 @@ int msm_ioctl_gem_submit(struct drm_device *dev, void *data,
>                 }
>         }
>
> -       msm_gpu_submit(gpu, submit, ctx);
> +       msm_gpu_submit(gpu, submit);
>
>         args->fence = submit->fence->seqno;
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index d5645472b25d..a1f3da6550e5 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -520,7 +520,7 @@ static void recover_worker(struct work_struct *work)
>                         struct msm_ringbuffer *ring = gpu->rb[i];
>
>                         list_for_each_entry(submit, &ring->submits, node)
> -                               gpu->funcs->submit(gpu, submit, NULL);
> +                               gpu->funcs->submit(gpu, submit);
>                 }
>         }
>
> @@ -747,8 +747,7 @@ void msm_gpu_retire(struct msm_gpu *gpu)
>  }
>
>  /* add bo's to gpu's ring, and kick gpu: */
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -               struct msm_file_private *ctx)
> +void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit)
>  {
>         struct drm_device *dev = gpu->dev;
>         struct msm_drm_private *priv = dev->dev_private;
> @@ -788,8 +787,8 @@ void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
>                         msm_gem_move_to_active(&msm_obj->base, gpu, false, submit->fence);
>         }
>
> -       gpu->funcs->submit(gpu, submit, ctx);
> -       priv->lastctx = ctx;
> +       gpu->funcs->submit(gpu, submit);
> +       priv->lastctx = submit->queue->ctx;
>
>         hangcheck_timer_reset(gpu);
>  }
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 0db117a7339b..d496d488222c 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -44,8 +44,7 @@ struct msm_gpu_funcs {
>         int (*hw_init)(struct msm_gpu *gpu);
>         int (*pm_suspend)(struct msm_gpu *gpu);
>         int (*pm_resume)(struct msm_gpu *gpu);
> -       void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -                       struct msm_file_private *ctx);
> +       void (*submit)(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>         void (*flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
>         irqreturn_t (*irq)(struct msm_gpu *irq);
>         struct msm_ringbuffer *(*active_ring)(struct msm_gpu *gpu);
> @@ -181,6 +180,7 @@ struct msm_gpu_submitqueue {
>         u32 flags;
>         u32 prio;
>         int faults;
> +       struct msm_file_private *ctx;
>         struct list_head node;
>         struct kref ref;
>  };
> @@ -280,8 +280,7 @@ int msm_gpu_perfcntr_sample(struct msm_gpu *gpu, uint32_t *activetime,
>                 uint32_t *totaltime, uint32_t ncntrs, uint32_t *cntrs);
>
>  void msm_gpu_retire(struct msm_gpu *gpu);
> -void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit,
> -               struct msm_file_private *ctx);
> +void msm_gpu_submit(struct msm_gpu *gpu, struct msm_gem_submit *submit);
>
>  int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>                 struct msm_gpu *gpu, const struct msm_gpu_funcs *funcs,
> diff --git a/drivers/gpu/drm/msm/msm_submitqueue.c b/drivers/gpu/drm/msm/msm_submitqueue.c
> index a1d94be7883a..10f557225a3e 100644
> --- a/drivers/gpu/drm/msm/msm_submitqueue.c
> +++ b/drivers/gpu/drm/msm/msm_submitqueue.c
> @@ -49,8 +49,10 @@ void msm_submitqueue_close(struct msm_file_private *ctx)
>          * No lock needed in close and there won't
>          * be any more user ioctls coming our way
>          */
> -       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node)
> +       list_for_each_entry_safe(entry, tmp, &ctx->submitqueues, node) {
> +               kref_put(&ctx->ref, msm_file_private_destroy);
>                 msm_submitqueue_put(entry);
> +       }

Seems kinda like the kref_put should happen in the final unref of the
submitqueue, since the reference is taken in msm_submitqueue_create()?
 (If there is something I'm overlooking, I guess that is a hint that
there should be a comment here)

Otherwise, I like this.

BR,
-R

>  }
>
>  int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
> @@ -81,6 +83,9 @@ int msm_submitqueue_create(struct drm_device *drm, struct msm_file_private *ctx,
>
>         write_lock(&ctx->queuelock);
>
> +       kref_get(&ctx->ref);
> +
> +       queue->ctx = ctx;
>         queue->id = ctx->queueid++;
>
>         if (id)
> @@ -177,6 +182,7 @@ int msm_submitqueue_remove(struct msm_file_private *ctx, u32 id)
>                         list_del(&entry->node);
>                         write_unlock(&ctx->queuelock);
>
> +                       kref_put(&ctx->ref, msm_file_private_destroy);
>                         msm_submitqueue_put(entry);
>                         return 0;
>                 }
> --
> 2.25.1
>
