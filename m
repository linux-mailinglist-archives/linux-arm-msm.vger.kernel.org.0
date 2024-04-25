Return-Path: <linux-arm-msm+bounces-18642-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A58308B2D68
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Apr 2024 01:03:01 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C95961C20F8D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 23:03:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0DD8080BFF;
	Thu, 25 Apr 2024 23:02:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HlXs4/a5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4845B697
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 23:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714086177; cv=none; b=iqwEXH5+x6FeVKa6snocTn29/93F7eVB8B0/GKat1iOKYnJhsFiZGiDcobmWPPr5oor3WY9aGzd9JdE2+Klp/AfpeK6RDxiu8MY5Ko/2nQh3dCHU5w9X/d27wllug+Ave28ORkXlavpc4ndPV7bxNYXApEzDQseoxGxWoU/DNvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714086177; c=relaxed/simple;
	bh=leLrB5UD68G7iC5p8LM9nbcutABwp/VAI10Tgtpgw1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QNtp+7QVIdHpsy6veeNq7Ajn4ESZ+bqts0ikH+EU+1OJXmPjDn+ZnEZAIzNrL6gJWcWdS9IunxElleb71ttlmXFZBFrn30K5jpKfWhNHEGUZ7rVSkaDISOYjViDMASNF+RKdVhZUuDgv9xJdkJ/K/fFJgUwOpqZIBFERq9oLB2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HlXs4/a5; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-de54cb87998so1679327276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 16:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714086175; x=1714690975; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ge3PAHOg60y1TdFqr8eD5p70+jK718M53W6KDyTrkOY=;
        b=HlXs4/a5vhVf9GU7U2gDSUkN12v0s4dkPu4JUiFzZ11V5Ga9RjY+pz2mO9I+11d16t
         U1RD+VGSCLmkzgONQDjew7uWoLUFINFcmGg5giRP6ALzz0JtAMOhfACINZcLLO2wSf//
         UowKtss/LFK6RpBFGQYv8efki9oRDK6uMO/SJIDGVpwAMvnAD832glAvJQyQEqPfBlBQ
         7qiDzooc5nyk+M+NTVuvIs4ufa5scDXP7QBRzt9XMgRYmEpCN7oKnIfswXYPvS843yoz
         N7utERkO16VYQdMjJPsZCgxZENBiwKqhqizl8jWaZFPnc5Ee9ujk/hI8VbrYzi+UOB5L
         obJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714086175; x=1714690975;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ge3PAHOg60y1TdFqr8eD5p70+jK718M53W6KDyTrkOY=;
        b=KUyh+ZrBTrloqpd3JGrl06tQyVU0cOZiEOW1YOCKFoeouH4nSS1b+Vz3m5IkkWRmN/
         smJbQf4BH6+FpWKJw6zXGw/vsgr9iKg/lv6h2tSDuDYKizinve8NNM+XXqOzxdkE04B1
         O7Yri73asAM8M1BlyUxCPLUex0Z+ZDYfMTvU94q28YJYoLua0O5LYvdBEbRsfa+SRtdZ
         LK1vRRadr1pX8UkeR9o/xcakum3LSvZBPorTclOBNQ7knZpxsL7FiJGMdHcTzvWaiiXC
         CM4hrXOSyp+7wwwqmgs84qggjfdCpjS1fbNXYkXvd/JGHLxeG24v8YKNb40BQ8DIBKfL
         7PBA==
X-Forwarded-Encrypted: i=1; AJvYcCXMcWae6X5L0/inmQFIMg40oAYLfvDA+Gj6csXpomu5uwVza4iC49WkISXqvLOC1yAGbS8LQjYCuvZaI3iZgE2DjQgJ61uFzuwzOQrefw==
X-Gm-Message-State: AOJu0YyVrU8bnI5qXIhyg4PRVmMfF9u1cUczcYSr88ASlhIR+pDjc46v
	Y7/nCmu9qeiArXcVqp2UmMEzGv+XS+nk+lclt7CBrbEtOu91wepExJRRf8nEfK+L2EkBrwrK1NW
	ZX8Joihg1ZNJkwJss/27NbtXxhSG7fLfwD3gCWK84+jEScdZPAUg=
X-Google-Smtp-Source: AGHT+IGqnzs/B1VeZDEybr3g50mLsiiUGJQ3dMXNulNRYO0RDCNcKOsjWkmq1U6VZ8Qp7jzKniLtPYneiMeH+4Juqag=
X-Received: by 2002:a25:108:0:b0:dda:a550:4e92 with SMTP id
 8-20020a250108000000b00ddaa5504e92mr1095176ybb.46.1714086175096; Thu, 25 Apr
 2024 16:02:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240425134354.1233862-1-cwabbott0@gmail.com> <20240425134354.1233862-5-cwabbott0@gmail.com>
In-Reply-To: <20240425134354.1233862-5-cwabbott0@gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 26 Apr 2024 02:02:44 +0300
Message-ID: <CAA8EJpp-OVceLDK4TuqQERY53O-mU+AhEyjNUOnNc9PUhcUm0A@mail.gmail.com>
Subject: Re: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
To: Connor Abbott <cwabbott0@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Apr 2024 at 16:44, Connor Abbott <cwabbott0@gmail.com> wrote:
>
> On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
> initialize cx_mem. Copy this from downstream (minus BCL which we
> currently don't support). On a750, this includes a new "fuse" register
> which can be used by qcom_scm to fuse off certain features like
> raytracing in software. The fuse is default off, and is initialized by
> calling the method. Afterwards we have to read it to find out which
> features were enabled.
>
> Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
>  2 files changed, 90 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index cf0b1de1c071..fb2722574ae5 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> +#include <linux/firmware/qcom/qcom_scm.h>
>  #include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
> @@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
>                        A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
>                        A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
>                        A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
> -                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
> +                      A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
> +                      A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
>
>  #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
>                          A6XX_CP_APRIV_CNTL_RBFETCH | \
> @@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
>         kthread_queue_work(gpu->worker, &gpu->recover_work);
>  }
>
> +static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
> +{
> +       u32 status;
> +
> +       status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
> +       gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
> +
> +       dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
> +
> +       /* Ignore FASTBLEND violations, because the HW will silently fall back
> +        * to legacy blending.
> +        */
> +       if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +                     A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
> +               del_timer(&gpu->hangcheck_timer);
> +
> +               kthread_queue_work(gpu->worker, &gpu->recover_work);
> +       }
> +}
> +
>  static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>  {
>         struct msm_drm_private *priv = gpu->dev->dev_private;
> @@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
>         if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
>                 dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
>
> +       if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
> +               a7xx_sw_fuse_violation_irq(gpu);
> +
>         if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
>                 msm_gpu_retire(gpu);
>
> @@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
>                 a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
>  }
>
> +static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
> +{
> +       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> +       struct msm_gpu *gpu = &adreno_gpu->base;
> +       u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ;
> +       u32 fuse_val;
> +       int ret;
> +
> +       if (adreno_is_a740(adreno_gpu)) {
> +               /* Raytracing is always enabled on a740 */
> +               adreno_gpu->has_ray_tracing = true;
> +       }
> +
> +       if (!qcom_scm_is_available()) {
> +               /* Assume that if qcom scm isn't available, that whatever
> +                * replacement allows writing the fuse register ourselves.
> +                * Users of alternative firmware need to make sure this
> +                * register is writeable or indicate that it's not somehow.
> +                * Print a warning because if you mess this up you're about to
> +                * crash horribly.
> +                */
> +               if (adreno_is_a750(adreno_gpu)) {
> +                       dev_warn_once(gpu->dev->dev,
> +                               "SCM is not available, poking fuse register\n");
> +                       a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
> +                               A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
> +                       adreno_gpu->has_ray_tracing = true;
> +               }
> +
> +               return 0;
> +       }
> +
> +       if (adreno_is_a750(adreno_gpu))

Most of the function is under the if (adreno_is_a750) conditions. Can
we invert the logic and add a single block of if(adreno_is_a750) and
then place all the code underneath?

> +               gpu_req |= QCOM_SCM_GPU_TSENSE_EN_REQ;
> +
> +       ret = qcom_scm_gpu_init_regs(gpu_req);
> +       if (ret)
> +               return ret;
> +
> +       /* On a750 raytracing may be disabled by the firmware, find out whether
> +        * that's the case. The scm call above sets the fuse register.
> +        */
> +       if (adreno_is_a750(adreno_gpu)) {
> +               fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);

This register isn't accessible with the current sm8650.dtsi. Since DT
and driver are going through different trees, please add safety guards
here, so that the driver doesn't crash if used with older dtsi
(not to mention that dts is considered to be an ABI and newer kernels
are supposed not to break with older DT files).

> +               adreno_gpu->has_ray_tracing =
> +                       !!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
> +       }
> +
> +       return 0;
> +}
> +
> +
>  #define GBIF_CLIENT_HALT_MASK          BIT(0)
>  #define GBIF_ARB_HALT_MASK             BIT(1)
>  #define VBIF_XIN_HALT_CTRL0_MASK       GENMASK(3, 0)
> @@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>                 return ERR_PTR(ret);
>         }
>
> +       if (adreno_is_a7xx(adreno_gpu)) {
> +               ret = a7xx_cx_mem_init(a6xx_gpu);
> +               if (ret) {
> +                       a6xx_destroy(&(a6xx_gpu->base.base));
> +                       return ERR_PTR(ret);
> +               }
> +       }
> +
>         if (gpu->aspace)
>                 msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
>                                 a6xx_fault_handler);
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index 77526892eb8c..4180f3149dd8 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -182,6 +182,8 @@ struct adreno_gpu {
>          */
>         const unsigned int *reg_offsets;
>         bool gmu_is_wrapper;
> +
> +       bool has_ray_tracing;
>  };
>  #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
>
> --
> 2.31.1
>


-- 
With best wishes
Dmitry

