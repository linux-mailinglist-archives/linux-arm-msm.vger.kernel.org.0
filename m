Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D6F4C1FFA8B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jun 2020 19:51:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729219AbgFRRvp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 Jun 2020 13:51:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58254 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729186AbgFRRvo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 Jun 2020 13:51:44 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1571FC06174E;
        Thu, 18 Jun 2020 10:51:44 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id p18so5549602eds.7;
        Thu, 18 Jun 2020 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ALa+SFwGzID8ImPZvd/gh7ARze4v8XOQHS7yiSmNJ4I=;
        b=SgQoR3eLlenv2EqOGQxFKzxE+LEAoZd2LeBa17s0BulocCdPhVnwc/AjmcEFLerf/W
         aqaQ9dh2Gy+QnOP2b9ZNgN9hE5N7Mg6NNKeOr+wShT6MPOhvTLKpbB50c8eSlI4oAR6q
         j34KB0Fds6dXEtnIBAYA2Gv/kTmgDkQS7pYYYnviuF4qpRt7YCVHzJqyJ0amUfNjssCq
         vUy6ocsLj4l43A8QstDRMyxeqkezWcZeTJJhp4AaREpJjiLWCJGuSWHwm6unggqatESk
         Q1Q2KsGQ2XHqYCJVUuMxz1P3ny9ZFy94ex4Mfs8rr01kl6JX2eH9I3DpL0dR9b23zKpq
         nlBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ALa+SFwGzID8ImPZvd/gh7ARze4v8XOQHS7yiSmNJ4I=;
        b=ZPWEYCLhx4AUdPPx2FA4ThRar6yacXjYGBN7imii93embLXy4Fz52LXKzEQnjzKxv6
         Auu7b4HFEMjrWgB2MfgSwcsG3NFyhCBu5mDrbHQ6T1HGOGk+kSbtVMAsk6QqlAVsfEdN
         lwb8VXU49x+V0MPWldG6e2yDfS/EuI4oGBNQGHLuWGBLtu94FqAE7J2qd5ke5PV6/kM1
         f5RBO6rihnvQhqu4+Pa2KQrcbX9QIJoH0wDUzORWzRJyvC6cf3UbuzCki8c78owX0Jc/
         4+BRdslKJ7yoR0/yzaFDdTVqh9o3lZaAOHQ8HNt6SguNi9Dx13oOlw+69idoHHZkURGO
         Im3w==
X-Gm-Message-State: AOAM533zBQfcTx1LMcSlkN9AfKaiUE4ZCNjeK8hOKegAS/qaAtSJfN3e
        Qu7gBznUUOYr0wdN8E3XEilMAjqBby3ZlUYhsm6amhqr
X-Google-Smtp-Source: ABdhPJytB/UGD6hAjCOD+C83JzUvprqjIblQkleRxGZnaqiWH+UmVftWllPhJH3q1p69SQBfjLGK67ruQqCw921y6wI=
X-Received: by 2002:a05:6402:699:: with SMTP id f25mr5150523edy.281.1592502702509;
 Thu, 18 Jun 2020 10:51:42 -0700 (PDT)
MIME-Version: 1.0
References: <1591417551-38051-1-git-send-email-smasetty@codeaurora.org> <1591417551-38051-3-git-send-email-smasetty@codeaurora.org>
In-Reply-To: <1591417551-38051-3-git-send-email-smasetty@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 18 Jun 2020 10:52:09 -0700
Message-ID: <CAF6AEGva1DyFc1P_5+U=P+Sh-ngN9PyN6Hh2ZXBnxB952UQ54w@mail.gmail.com>
Subject: Re: [PATCH v3 2/6] drm: msm: a6xx: send opp instead of a frequency
To:     Sharat Masetty <smasetty@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, dri-devel@freedesktop.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>, saravanak@google.com,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jonathan <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Jun 5, 2020 at 9:26 PM Sharat Masetty <smasetty@codeaurora.org> wrote:
>
> This patch changes the plumbing to send the devfreq recommended opp rather
> than the frequency. Also consolidate and rearrange the code in a6xx to set
> the GPU frequency and the icc vote in preparation for the upcoming
> changes for GPU->DDR scaling votes.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 62 +++++++++++++++++++----------------
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +-
>  drivers/gpu/drm/msm/msm_gpu.c         |  3 +-
>  drivers/gpu/drm/msm/msm_gpu.h         |  3 +-
>  4 files changed, 38 insertions(+), 32 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index 748cd37..2d8124b 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -100,17 +100,30 @@ bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu)
>                 A6XX_GMU_SPTPRAC_PWR_CLK_STATUS_GX_HM_CLK_OFF));
>  }
>
> -static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
> +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>  {
> -       struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
> -       struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> -       struct msm_gpu *gpu = &adreno_gpu->base;
> -       int ret;
> +       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> +       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> +       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> +       u32 perf_index;
> +       unsigned long gpu_freq;
> +       int ret = 0;
> +
> +       gpu_freq = dev_pm_opp_get_freq(opp);
> +
> +       if (gpu_freq == gmu->freq)
> +               return;
> +
> +       for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
> +               if (gpu_freq == gmu->gpu_freqs[perf_index])
> +                       break;
> +
> +       gmu->current_perf_index = perf_index;
>
>         gmu_write(gmu, REG_A6XX_GMU_DCVS_ACK_OPTION, 0);
>
>         gmu_write(gmu, REG_A6XX_GMU_DCVS_PERF_SETTING,
> -               ((3 & 0xf) << 28) | index);
> +                       ((3 & 0xf) << 28) | perf_index);
>
>         /*
>          * Send an invalid index as a vote for the bus bandwidth and let the
> @@ -126,7 +139,7 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>         if (ret)
>                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
> -       gmu->freq = gmu->gpu_freqs[index];
> +       gmu->freq = gmu->gpu_freqs[perf_index];
>
>         /*
>          * Eventually we will want to scale the path vote with the frequency but
> @@ -135,25 +148,6 @@ static void __a6xx_gmu_set_freq(struct a6xx_gmu *gmu, int index)
>         icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
>  }
>
> -void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq)
> -{
> -       struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> -       struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
> -       struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
> -       u32 perf_index = 0;
> -
> -       if (freq == gmu->freq)
> -               return;
> -
> -       for (perf_index = 0; perf_index < gmu->nr_gpu_freqs - 1; perf_index++)
> -               if (freq == gmu->gpu_freqs[perf_index])
> -                       break;
> -
> -       gmu->current_perf_index = perf_index;
> -
> -       __a6xx_gmu_set_freq(gmu, perf_index);
> -}

this does end up conflicting a bit with some of the newer stuff that
landed this cycle, in particular "drm/msm/a6xx: HFI v2 for A640 and
A650"

Adding Jonathan on CC since I think he will want to test this on
a650/a640 as well..

BR,
-R

> -
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
>  {
>         struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
> @@ -708,6 +702,19 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
>         a6xx_gmu_rpmh_off(gmu);
>  }
>
> +static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> +{
> +       struct dev_pm_opp *gpu_opp;
> +       unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
> +
> +       gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
> +       if (IS_ERR_OR_NULL(gpu_opp))
> +               return;
> +
> +       a6xx_gmu_set_freq(gpu, gpu_opp);
> +       dev_pm_opp_put(gpu_opp);
> +}
> +
>  int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  {
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> @@ -759,8 +766,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>         gmu_write(gmu, REG_A6XX_GMU_GMU2HOST_INTR_MASK, ~A6XX_HFI_IRQ_MASK);
>         enable_irq(gmu->hfi_irq);
>
> -       /* Set the GPU to the current freq */
> -       __a6xx_gmu_set_freq(gmu, gmu->current_perf_index);
> +       a6xx_gmu_set_initial_freq(gpu, gmu);
>
>         /*
>          * "enable" the GX power domain which won't actually do anything but it
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> index 7239b8b..03ba60d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
> @@ -63,7 +63,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state);
>  int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node);
>  void a6xx_gmu_remove(struct a6xx_gpu *a6xx_gpu);
>
> -void a6xx_gmu_set_freq(struct msm_gpu *gpu, unsigned long freq);
> +void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp);
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu);
>
>  void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 615c5cd..82c3068 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -13,7 +13,6 @@
>
>  #include <generated/utsrelease.h>
>  #include <linux/string_helpers.h>
> -#include <linux/pm_opp.h>
>  #include <linux/devfreq.h>
>  #include <linux/devcoredump.h>
>  #include <linux/sched/task.h>
> @@ -34,7 +33,7 @@ static int msm_devfreq_target(struct device *dev, unsigned long *freq,
>                 return PTR_ERR(opp);
>
>         if (gpu->funcs->gpu_set_freq)
> -               gpu->funcs->gpu_set_freq(gpu, (u64)*freq);
> +               gpu->funcs->gpu_set_freq(gpu, opp);
>         else
>                 clk_set_rate(gpu->core_clk, *freq);
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index ab8f0f9c..cf0dc6d 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -9,6 +9,7 @@
>
>  #include <linux/clk.h>
>  #include <linux/interconnect.h>
> +#include <linux/pm_opp.h>
>  #include <linux/regulator/consumer.h>
>
>  #include "msm_drv.h"
> @@ -63,7 +64,7 @@ struct msm_gpu_funcs {
>         struct msm_gpu_state *(*gpu_state_get)(struct msm_gpu *gpu);
>         int (*gpu_state_put)(struct msm_gpu_state *state);
>         unsigned long (*gpu_get_freq)(struct msm_gpu *gpu);
> -       void (*gpu_set_freq)(struct msm_gpu *gpu, unsigned long freq);
> +       void (*gpu_set_freq)(struct msm_gpu *gpu, struct dev_pm_opp *opp);
>  };
>
>  struct msm_gpu {
> --
> 2.7.4
>
