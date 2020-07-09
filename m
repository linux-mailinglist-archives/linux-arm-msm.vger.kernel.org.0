Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74E8521A321
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jul 2020 17:14:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726806AbgGIPOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Jul 2020 11:14:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726715AbgGIPOv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Jul 2020 11:14:51 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA42BC08C5CE;
        Thu,  9 Jul 2020 08:14:50 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id d16so2104278edz.12;
        Thu, 09 Jul 2020 08:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=svTZUqZItL6wcjbTVTXwVReRDuRMeNVOVpDj5H4MV7Y=;
        b=ZFHxOi3lm0AtcfsrIam2+k4ngQ9/thvcljjmnt0n50sld27J7B8bPYQZwpBWkih2FG
         odPYLanjqAmp8O4OzU+3LE90JM3eAP0H+yVT6gP4/A5DrK7Jbi9EZhNMW5yaD0AZTzFA
         cxXGGzN62IbR0BFD8CzXZ8ad96AHZ6kaaQUJgJM1YDK/QY35Bqpd7LiIinsnoxwefUJW
         XcPd3C0nZ6xuYuxBd774GOZ56Ztk8al4LO60Wcy2OZ8JeuXYpvyo2BzPaNF/MbCwOHX2
         xtCfrbbtJiQCsnGYZFt9mfvWkAIAV+rHbJIRHUpIOg5IEfWCA+d13IrooGfI2Avp4MeF
         Z/Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=svTZUqZItL6wcjbTVTXwVReRDuRMeNVOVpDj5H4MV7Y=;
        b=sa+nrUN+LLGTWvTTkGXuABPhEmWlAOdu0RcHdcXJxTqV2R50tyB6mi+8T/Ju25Dr8l
         KIo8zXQZgYU2UGXtXO/cGNq4pAarZRGhkHcbS+tcersCq4Y2UR7eO6I8DyC4J5UM+vCv
         QIC9l6Rgtbvag8JHtPcetxhedFQAkkNAKtY9vRfpItipf3rsdazmDdntx/eR+nxDN6a8
         PaCMtt/QmT2G7EBM094+Y2aM0kNHh2WXRMI8dP5UmgpiMGOrLkQYSu+lmyXpvKrrBBZh
         WuPLE3UD9EHOdgPHpt95QWg4cT6/oDv77yZLV4XmrDvmS9Oz3HX0XqM8tkPKmljLaR6E
         Eszg==
X-Gm-Message-State: AOAM533Fkg71q7rsHKj5jSOAeq5euS/icfNwzeANocM+A99aRHsFY7fc
        LOyfXry977A2lGfiBDB2hxpoAIF/lOS4YMEh7DGg12VX
X-Google-Smtp-Source: ABdhPJySmDpPfzbv4ZnX8rhIes/uKRUMK9JalUqgPpaeget9ts7gAq8xEXBKMenHWFBsDTvDFRh/UfbJcU80Ud0l9fc=
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr75079361edi.120.1594307689397;
 Thu, 09 Jul 2020 08:14:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200709143404.11876-1-jonathan@marek.ca>
In-Reply-To: <20200709143404.11876-1-jonathan@marek.ca>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 9 Jul 2020 08:15:20 -0700
Message-ID: <CAF6AEGsQFVptXi2wgx_JipyK0AOSUBHOHaDmRF_gG+hSH8mF5A@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm: handle for EPROBE_DEFER for of_icc_get
To:     Jonathan Marek <jonathan@marek.ca>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>,
        Fabio Estevam <festevam@gmail.com>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <dri-devel@lists.freedesktop.org>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 9, 2020 at 7:35 AM Jonathan Marek <jonathan@marek.ca> wrote:
>
> Check for errors instead of silently not using icc if the msm driver
> probes before the interconnect driver.
>
> Allow ENODATA for ocmem path, as it is optional and this error
> is returned when "gfx-mem" path is provided but not "ocmem".
>
> Remove the WARN_ON in msm_gpu_cleanup because INIT_LIST_HEAD won't have
> been called on the list yet when going through the defer error path.
>
> Changes in v2:
> * Changed to not only check for EPROBE_DEFER
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 17 ++++++++++++++---
>  drivers/gpu/drm/msm/msm_gpu.c           |  2 --
>  2 files changed, 14 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index 89673c7ed473..0f5217202eb5 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -940,12 +940,20 @@ static int adreno_get_pwrlevels(struct device *dev,
>                  */
>                 gpu->icc_path = of_icc_get(dev, NULL);
>         }
> -       if (IS_ERR(gpu->icc_path))
> +       if (IS_ERR(gpu->icc_path)) {
> +               ret = PTR_ERR(gpu->icc_path);
>                 gpu->icc_path = NULL;
> +               return ret;
> +       }
>
>         gpu->ocmem_icc_path = of_icc_get(dev, "ocmem");
> -       if (IS_ERR(gpu->ocmem_icc_path))
> +       if (IS_ERR(gpu->ocmem_icc_path)) {
> +               ret = PTR_ERR(gpu->ocmem_icc_path);
>                 gpu->ocmem_icc_path = NULL;
> +               /* allow -ENODATA, ocmem icc is optional */
> +               if (ret != -ENODATA)
> +                       return ret;
> +       }
>
>         return 0;
>  }
> @@ -996,6 +1004,7 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>         struct adreno_platform_config *config = pdev->dev.platform_data;
>         struct msm_gpu_config adreno_gpu_config  = { 0 };
>         struct msm_gpu *gpu = &adreno_gpu->base;
> +       int ret;
>
>         adreno_gpu->funcs = funcs;
>         adreno_gpu->info = adreno_info(config->rev);
> @@ -1007,7 +1016,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
>
>         adreno_gpu_config.nr_rings = nr_rings;
>
> -       adreno_get_pwrlevels(&pdev->dev, gpu);
> +       ret = adreno_get_pwrlevels(&pdev->dev, gpu);
> +       if (ret)
> +               return ret;
>
>         pm_runtime_set_autosuspend_delay(&pdev->dev,
>                 adreno_gpu->info->inactive_period);
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index a22d30622306..ccf9a0dd9706 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -959,8 +959,6 @@ void msm_gpu_cleanup(struct msm_gpu *gpu)
>
>         DBG("%s", gpu->name);
>
> -       WARN_ON(!list_empty(&gpu->active_list));
> -

hmm, not a huge fan of removing the WARN_ON().. can we just init the
list head earlier?

BR,
-R

>         for (i = 0; i < ARRAY_SIZE(gpu->rb); i++) {
>                 msm_ringbuffer_destroy(gpu->rb[i]);
>                 gpu->rb[i] = NULL;
> --
> 2.26.1
>
