Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 587175033B2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 16 Apr 2022 07:48:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229943AbiDPCep (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Apr 2022 22:34:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbiDPCep (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Apr 2022 22:34:45 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E7531402F
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 19:32:13 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id t25so11762261edt.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 15 Apr 2022 19:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JMjk7zC07wK4tB00etsqhwr9uo4W2Y6KkbolTdtnv6U=;
        b=puVYkkLVhML6N2wmKvFnPivjjcK7jdGvAsVX4kGOBc2jByQW3SrqCG36GtiuMhhdfU
         yqotygvLHOlVfq97CtFoOh2JqAUTjuvFGmNGgkxU4+nzIdFxMWX2dC5VnQe6kMQwkMHu
         w2Vt3loK3TbVLMhhTupP2d8mX+mZRdIe4zDW20X9YsugDgSMjdcaRMeG0NgGhpjnc0tF
         6dJhC4WwHXOMlwqVp8pKO6aUB5M2/IRlI391/mDdHUS6z5TGjsiDmDF8XbLP2JMadxEG
         FKC4Y+IfLg+efjQTZ69Mh4LlNeDMtgc7DqudQysvCwwcvXFxI6eMkuC1U/ZJz84Jgw37
         z2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JMjk7zC07wK4tB00etsqhwr9uo4W2Y6KkbolTdtnv6U=;
        b=xjkXTLxgYfeK+XAVkge/gZJEAU/qUZaEq3XWiqm/KCi5w+MUq+uLWPNbkhZNPMnS7u
         yn4ehWRke74tlUTTo9NWxfM3p7Zkjn/ruRm0HiHagZRn9zhEUpm/sj+Nlcp9L9CWmoVp
         2etp/pGSQob92CNrsnKOGcsVLVbg7qCCYEEM7AK3Owpa+HxE36Gt/WazDhQIOcCHot4s
         VpnnC/emMRlLafHegTIER1j2X26viRGCSGH1oca0LEziojFeFEge13IM1uSxO35jAGFM
         efgwDkPhX91rm4UJiIfDmPh7hqTiXWaX7fykmx2QwIboZR7BKD74pW1LBpPz+6Hvws4A
         hQoQ==
X-Gm-Message-State: AOAM530WG4S3eGMElCYkJPSWE2WlYRkOWyaBQM6NT772Wa9KSAG+/0qu
        ESRiZ5CP+BGjkfVpyIcAm4ORRXo+Wlg9s95UJNzMR+ZW
X-Google-Smtp-Source: ABdhPJxfJR2HIW2/Fy3sCMCcLYW5K0Kuc9J1mqLT2Wpqpskb9vN+9bGZqSDhEaeCnfleaNqPpbrKoMxNjFQBTf1JkF4=
X-Received: by 2002:a05:6402:26d6:b0:421:6368:33b4 with SMTP id
 x22-20020a05640226d600b00421636833b4mr1655617edd.242.1650070240913; Fri, 15
 Apr 2022 17:50:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220416003314.59211-1-olvaffe@gmail.com> <20220416003314.59211-3-olvaffe@gmail.com>
In-Reply-To: <20220416003314.59211-3-olvaffe@gmail.com>
From:   Chia-I Wu <olvaffe@gmail.com>
Date:   Fri, 15 Apr 2022 17:50:30 -0700
Message-ID: <CAPaKu7Q9CpSFhfrZWytDxzPgv4j4PHcxB8besMSSFd=W6vVYtQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/msm: return the average load over the polling period
To:     freedreno@lists.freedesktop.org
Cc:     ML dri-devel <dri-devel@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Clark <robdclark@chromium.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Fri, Apr 15, 2022 at 5:33 PM Chia-I Wu <olvaffe@gmail.com> wrote:
>
> simple_ondemand interacts poorly with clamp_to_idle.  It only looks at
> the load since the last get_dev_status call, while it should really look
> at the load over polling_ms.  When clamp_to_idle true, it almost always
> picks the lowest frequency on active because the gpu is idle between
> msm_devfreq_idle/msm_devfreq_active.
>
> This logic could potentially be moved into devfreq core.
The idea is to extend devfreq_simple_ondemand_data to specify whether
devfreq_simple_ondemand_func should use "last status" or "average
status" to determine the target frequency.  devfreq core will need to
store "struct devfreq_dev_status average_status", which will be
updated when a device uses simple_ondemand and asks for average_status
instead of last_status.



>
> Fixes: 7c0ffcd40b16 ("drm/msm/gpu: Respect PM QoS constraints")
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gpu.h         |  3 ++
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c | 60 ++++++++++++++++++++++++++-
>  2 files changed, 62 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
> index 389c6dab751b..143c56f5185b 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.h
> +++ b/drivers/gpu/drm/msm/msm_gpu.h
> @@ -9,6 +9,7 @@
>
>  #include <linux/adreno-smmu-priv.h>
>  #include <linux/clk.h>
> +#include <linux/devfreq.h>
>  #include <linux/interconnect.h>
>  #include <linux/pm_opp.h>
>  #include <linux/regulator/consumer.h>
> @@ -117,6 +118,8 @@ struct msm_gpu_devfreq {
>         /** idle_time: Time of last transition to idle: */
>         ktime_t idle_time;
>
> +       struct devfreq_dev_status average_status;
> +
>         /**
>          * idle_work:
>          *
> diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> index f531015107c3..d2539ca78c29 100644
> --- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> +++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/devfreq.h>
>  #include <linux/devfreq_cooling.h>
> +#include <linux/math64.h>
>  #include <linux/units.h>
>
>  /*
> @@ -75,12 +76,69 @@ static void get_raw_dev_status(struct msm_gpu *gpu,
>         status->busy_time = busy_time;
>  }
>
> +static void update_average_dev_status(struct msm_gpu *gpu,
> +               const struct devfreq_dev_status *raw)
> +{
> +       struct msm_gpu_devfreq *df = &gpu->devfreq;
> +       const u32 polling_ms = df->devfreq->profile->polling_ms;
> +       const u32 max_history_ms = polling_ms * 11 / 10;
> +       struct devfreq_dev_status *avg = &df->average_status;
> +       u64 avg_freq;
> +
> +       /* simple_ondemand governor interacts poorly with gpu->clamp_to_idle.
> +        * When we enforce the constraint on idle, it calls get_dev_status
> +        * which would normally reset the stats.  When we remove the
> +        * constraint on active, it calls get_dev_status again where busy_time
> +        * would be 0.
> +        *
> +        * To remedy this, we always return the average load over the past
> +        * polling_ms.
> +        */
> +
> +       /* raw is longer than polling_ms or avg has no history */
> +       if (div_u64(raw->total_time, USEC_PER_MSEC) >= polling_ms ||
> +           !avg->total_time) {
> +               *avg = *raw;
> +               return;
> +       }
> +
> +       /* Truncate the oldest history first.
> +        *
> +        * Because we keep the history with a single devfreq_dev_status,
> +        * rather than a list of devfreq_dev_status, we have to assume freq
> +        * and load are the same over avg->total_time.  We can scale down
> +        * avg->busy_time and avg->total_time by the same factor to drop
> +        * history.
> +        */
> +       if (div_u64(avg->total_time + raw->total_time, USEC_PER_MSEC) >=
> +                       max_history_ms) {
> +               const u32 new_total_time = polling_ms * USEC_PER_MSEC -
> +                       raw->total_time;
> +               avg->busy_time = div_u64(
> +                               mul_u32_u32(avg->busy_time, new_total_time),
> +                               avg->total_time);
> +               avg->total_time = new_total_time;
> +       }
> +
> +       /* compute the average freq over avg->total_time + raw->total_time */
> +       avg_freq = mul_u32_u32(avg->current_frequency, avg->total_time);
> +       avg_freq += mul_u32_u32(raw->current_frequency, raw->total_time);
> +       do_div(avg_freq, avg->total_time + raw->total_time);
> +
> +       avg->current_frequency = avg_freq;
> +       avg->busy_time += raw->busy_time;
> +       avg->total_time += raw->total_time;
> +}
> +
>  static int msm_devfreq_get_dev_status(struct device *dev,
>                 struct devfreq_dev_status *status)
>  {
>         struct msm_gpu *gpu = dev_to_gpu(dev);
> +       struct devfreq_dev_status raw;
>
> -       get_raw_dev_status(gpu, status);
> +       get_raw_dev_status(gpu, &raw);
> +       update_average_dev_status(gpu, &raw);
> +       *status = gpu->devfreq.average_status;
>
>         return 0;
>  }
> --
> 2.36.0.rc0.470.gd361397f0d-goog
>
