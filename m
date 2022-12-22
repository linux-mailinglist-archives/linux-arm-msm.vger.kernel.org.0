Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 99C486544E3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 Dec 2022 17:09:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235405AbiLVQJc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 11:09:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235423AbiLVQJH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 11:09:07 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE1DF1F6
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:08:32 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id w4-20020a17090ac98400b002186f5d7a4cso6210545pjt.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 08:08:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZH7Zh92eryTWmCMxjucYh6kr7rGobPqkxZWYyehfDV0=;
        b=r236SpDsWUYa12FF7nRSMu6mPBqxqO+2P0PbY1NFdoUyHyFPZRjGmYbldui+TqAO2a
         qounXUoll65HTzqqtqPN/Q6KxEgDnyaOUNMOMTv4ckI2O6mo+CIb1NmgNJk4BcN1SJ3i
         u/7oyXxyB/wthuCCl55v0M69nsjesx69tsNaQZy3F5OBzk02DVL/Fjm/hEV059imMpu0
         43r/2lwia5JA47gBDsxTKcYatkHZMCuoSlI/heyYmXk9TJPdCLGc8KGAg66Ulvxu+nnU
         NIhc2hhCHflSBIa8UC36Z4fXnpvyaaZri36cuZeXaXHdiSV1s5M3iY+PXCfKRaz3HfzD
         Q1Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZH7Zh92eryTWmCMxjucYh6kr7rGobPqkxZWYyehfDV0=;
        b=kBN1lrohbZbhW7WlqXokUr+s4I6IlMQ8mE9UWYQ2XagSrvJ0ZP9+oNSfd+nXYAppXi
         090nKvCouFmPtuoWEhEin87OqpGJgKjpgYxuBISUCCHeYG0LNnWAPcX9IyAXlehLBeJh
         Bkgv8rUzVNrBuwCwqRpN6Tkkbq8se7kvdutXacR1iA70SxIHNEN+yD6DFtCKMp7PiQYB
         +YIRIIi+dSwuSHFDUHO1XjkaObM8D+aRJhNv5/1Kv3tOB/t8mhycnBmmapZFrW720f/Q
         VyKGHIWwAHAxeyWHrCJXxqtHVrTFjbr+Lo3CRbkyzGYyVXgVlXCB5xGSNAPbfBsQPfyC
         z19Q==
X-Gm-Message-State: AFqh2kol2B/y+u6rS0O50yx6ama/Zvh0gxsnYkuYvJxlvH7F9aLVCI7n
        A2uVmsUPuGgpy/xadl8w2IsVqnhTM+0ScmLDECAMwm3w1lDPKjrg
X-Google-Smtp-Source: AMrXdXsf2I0+vdD8DuU3+/SehD5zu5kIqZZcsfr5+AQ/kzBZkVEglzKHBliayWS5QR4S8ndYudqmtDTpgVqs5m5/lhM=
X-Received: by 2002:a17:90a:be0c:b0:219:ef02:a5eb with SMTP id
 a12-20020a17090abe0c00b00219ef02a5ebmr636760pjs.84.1671725311989; Thu, 22 Dec
 2022 08:08:31 -0800 (PST)
MIME-Version: 1.0
References: <1671642843-5244-1-git-send-email-quic_akhilpo@quicinc.com> <20221221224338.v4.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
In-Reply-To: <20221221224338.v4.5.I9e10545c6a448d5eb1b734839b871d1b3146dac3@changeid>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Thu, 22 Dec 2022 17:07:55 +0100
Message-ID: <CAPDyKFrCv_uqA9Pa5UE2oCbD7cpwn_ZjBESQGKoNk7xT=gFaaA@mail.gmail.com>
Subject: Re: [PATCH v4 5/5] drm/msm/a6xx: Use genpd notifier to ensure cx-gdsc collapse
To:     Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Chia-I Wu <olvaffe@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@gmail.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, 21 Dec 2022 at 18:14, Akhil P Oommen <quic_akhilpo@quicinc.com> wrote:
>
> As per the recommended recovery sequence of adreno gpu, cx gdsc should
> collapse at hardware before it is turned back ON. This helps to clear
> out the stale states in hardware before it is reinitialized. Use the
> genpd notifier along with the newly introduced
> dev_pm_genpd_synced_poweroff() api to ensure that cx gdsc has collapsed
> before we turn it back ON.
>
> Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe

> ---
>
> (no changes since v2)
>
> Changes in v2:
> - Select PM_GENERIC_DOMAINS from Kconfig
>
>  drivers/gpu/drm/msm/Kconfig           |  1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 15 +++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  6 ++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 11 +++++++++++
>  4 files changed, 33 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index 3c9dfdb0b328..74f5916f5ca5 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -28,6 +28,7 @@ config DRM_MSM
>         select SYNC_FILE
>         select PM_OPP
>         select NVMEM
> +       select PM_GENERIC_DOMAINS
>         help
>           DRM/KMS driver for MSM/snapdragon.
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 1580d0090f35..c03830957c26 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -1507,6 +1507,17 @@ void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu)
>         gmu->initialized = false;
>  }
>
> +static int cxpd_notifier_cb(struct notifier_block *nb,
> +                       unsigned long action, void *data)
> +{
> +       struct a6xx_gmu *gmu = container_of(nb, struct a6xx_gmu, pd_nb);
> +
> +       if (action == GENPD_NOTIFY_OFF)
> +               complete_all(&gmu->pd_gate);
> +
> +       return 0;
> +}
> +
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>  {
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> @@ -1640,6 +1651,10 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
>                 goto detach_cxpd;
>         }
>
> +       init_completion(&gmu->pd_gate);
> +       complete_all(&gmu->pd_gate);
> +       gmu->pd_nb.notifier_call = cxpd_notifier_cb;
> +
>         /*
>          * Get a link to the GX power domain to reset the GPU in case of GMU
>          * crash
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> index 5a42dd4dd31f..0bc3eb443fec 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
> @@ -4,8 +4,10 @@
>  #ifndef _A6XX_GMU_H_
>  #define _A6XX_GMU_H_
>
> +#include <linux/completion.h>
>  #include <linux/iopoll.h>
>  #include <linux/interrupt.h>
> +#include <linux/notifier.h>
>  #include "msm_drv.h"
>  #include "a6xx_hfi.h"
>
> @@ -90,6 +92,10 @@ struct a6xx_gmu {
>         bool initialized;
>         bool hung;
>         bool legacy; /* a618 or a630 */
> +
> +       /* For power domain callback */
> +       struct notifier_block pd_nb;
> +       struct completion pd_gate;
>  };
>
>  static inline u32 gmu_read(struct a6xx_gmu *gmu, u32 offset)
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 4b16e75dfa50..dd618b099110 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -10,6 +10,7 @@
>
>  #include <linux/bitfield.h>
>  #include <linux/devfreq.h>
> +#include <linux/pm_domain.h>
>  #include <linux/soc/qcom/llcc-qcom.h>
>
>  #define GPU_PAS_ID 13
> @@ -1258,6 +1259,7 @@ static void a6xx_recover(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
>         struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
>         int i, active_submits;
>
>         adreno_dump_info(gpu);
> @@ -1290,6 +1292,10 @@ static void a6xx_recover(struct msm_gpu *gpu)
>          */
>         gpu->active_submits = 0;
>
> +       reinit_completion(&gmu->pd_gate);
> +       dev_pm_genpd_add_notifier(gmu->cxpd, &gmu->pd_nb);
> +       dev_pm_genpd_synced_poweroff(gmu->cxpd);
> +
>         /* Drop the rpm refcount from active submits */
>         if (active_submits)
>                 pm_runtime_put(&gpu->pdev->dev);
> @@ -1297,6 +1303,11 @@ static void a6xx_recover(struct msm_gpu *gpu)
>         /* And the final one from recover worker */
>         pm_runtime_put_sync(&gpu->pdev->dev);
>
> +       if (!wait_for_completion_timeout(&gmu->pd_gate, msecs_to_jiffies(1000)))
> +               DRM_DEV_ERROR(&gpu->pdev->dev, "cx gdsc didn't collapse\n");
> +
> +       dev_pm_genpd_remove_notifier(gmu->cxpd);
> +
>         pm_runtime_use_autosuspend(&gpu->pdev->dev);
>
>         if (active_submits)
> --
> 2.7.4
>
