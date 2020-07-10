Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DAD6F21BDD9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 21:41:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728363AbgGJTlB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 15:41:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726908AbgGJTlB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 15:41:01 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B34A8C08C5DC;
        Fri, 10 Jul 2020 12:41:00 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id dr13so7304203ejc.3;
        Fri, 10 Jul 2020 12:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Mfk46Wt0EkqUcbzqXWWdXTqCsqh4r5j+eF9fbxeot0=;
        b=Y7xXCS1nOyST5iaTPkncvqxbKVgFj+Nfn88bRSj5S4OQHG4kl1muiQw/AvZYLNudnY
         9mPoOtL6Pt896dSy83Z2dzSkM7nl4FiBi/v8tuWypIw2LqrCLpodTF9fmoLXMu+Ej30S
         k2DwUlGDQfXjBxJL+d+Lgumj2g42UGKwXpN8Knytkji13XJi+RusTz1bmPzggaxcbAiT
         1dZLUkbOKTp1siTDY+nEzLfpzQWWkVJKY9wNRhV5+9AKOciOZjEA8hxs2RJ0Ai4bvFLf
         q9+wsgdRL0qTHOnRDRpPH0qiHuUR/P7l9kgLy9FTHiAG9994JxxqpCBS7khSp1dMSBS+
         vvlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Mfk46Wt0EkqUcbzqXWWdXTqCsqh4r5j+eF9fbxeot0=;
        b=omAt/QaVFwhWcO6CWJG7FL025mthqIwByW+ZJYSxg0kl9p7edFEzyd0EsO9tZncfS5
         8/ssDFZa7ei7eClnoO4YFQ5n+eLCaQfLofM4Burn0SUpbnM7RCqHaVRmwNs3vxM2dIck
         3egNuajw8edwQo7KYEhjA3On22fvnm2063T+In1+YMQCfcqMox5xkyamKHqymThVoTdJ
         iTuSC5SMlFHKhyUbQEu5fFY1yX1OgkfwukZCzck68bbEJDzeX922eQ1DSoW4LIbZFhFs
         zrv5KEvsutVQqxO6odc7ICXmuNNUgRrrV0iTXZVqASKQRXBPHa1pv4y6jLxvXPuVbmvQ
         4iWw==
X-Gm-Message-State: AOAM531FLnbqmVFq6mUUovNgLnbbYVxYzoAdcgJrdNtdp1DhUu/hU39w
        6/pfZViFtPtXOrABXnQSVp8Vx0SEBh1Ham3lq9k=
X-Google-Smtp-Source: ABdhPJwwtakCaQKxyz/Xgq/TraHmqTx5+wz3uRxu6aBHqI7ZcwPjE6kUBX1Sx322eMeOiNMBX1MH0LMW8jw21ilN+fs=
X-Received: by 2002:a17:906:328d:: with SMTP id 13mr63567977ejw.71.1594410059289;
 Fri, 10 Jul 2020 12:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <1594324828-9571-1-git-send-email-akhilpo@codeaurora.org> <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
In-Reply-To: <1594324828-9571-5-git-send-email-akhilpo@codeaurora.org>
From:   Rob Clark <robdclark@gmail.com>
Date:   Fri, 10 Jul 2020 12:41:31 -0700
Message-ID: <CAF6AEGv4Nc6ZAxGoCC1s5KT=rxLR6uZDHfDnWZRnnLhqnegOpA@mail.gmail.com>
Subject: Re: [Freedreno] [PATCH v4 4/7] drm: msm: a6xx: use dev_pm_opp_set_bw
 to scale DDR
To:     Akhil P Oommen <akhilpo@codeaurora.org>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>, Jonathan <jonathan@marek.ca>,
        saravanak@google.com,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        dri-devel@freedesktop.org, Viresh Kumar <viresh.kumar@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jul 9, 2020 at 1:01 PM Akhil P Oommen <akhilpo@codeaurora.org> wrote:
>
> From: Sharat Masetty <smasetty@codeaurora.org>
>
> This patches replaces the previously used static DDR vote and uses
> dev_pm_opp_set_bw() to scale GPU->DDR bandwidth along with scaling
> GPU frequency. Also since the icc path voting is handled completely
> in the opp driver, remove the icc_path handle and its usage in the
> drm driver.
>
> Signed-off-by: Sharat Masetty <smasetty@codeaurora.org>
> Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 25 +++++++++++++++++--------
>  1 file changed, 17 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> index b547339..6fbfd7d 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
> @@ -123,7 +123,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>
>         if (!gmu->legacy) {
>                 a6xx_hfi_set_freq(gmu, gmu->current_perf_index);
> -               icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +               dev_pm_opp_set_bw(&gpu->pdev->dev, opp);

What is the status of the patch to add dev_pm_opp_set_bw()?  If it is
ready to go, and I get an ack-by from the OPP maintainer, I suppose I
could merge it via drm/msm.

Otherwise should we consider pulling in a private copy of it into
drm/msm (and then drop it to use the helper in, hopefully, the next
cycle)?

I'm pulling the patches preceding this one into msm-next-staging to do
some testing.  And the dt patches following this one would normally
get merged via Bjorn.  At the moment, I'm not sure what to do with
this one.

BR,
-R

>                 return;
>         }
>
> @@ -149,11 +149,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
>         if (ret)
>                 dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
>
> -       /*
> -        * Eventually we will want to scale the path vote with the frequency but
> -        * for now leave it at max so that the performance is nominal.
> -        */
> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(7216));
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
>  }
>
>  unsigned long a6xx_gmu_get_freq(struct msm_gpu *gpu)
> @@ -840,6 +836,19 @@ static void a6xx_gmu_set_initial_freq(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
>         dev_pm_opp_put(gpu_opp);
>  }
>
> +static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
> +{
> +       struct dev_pm_opp *gpu_opp;
> +       unsigned long gpu_freq = gmu->gpu_freqs[gmu->current_perf_index];
> +
> +       gpu_opp = dev_pm_opp_find_freq_exact(&gpu->pdev->dev, gpu_freq, true);
> +       if (IS_ERR_OR_NULL(gpu_opp))
> +               return;
> +
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
> +       dev_pm_opp_put(gpu_opp);
> +}
> +
>  int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>  {
>         struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
> @@ -864,7 +873,7 @@ int a6xx_gmu_resume(struct a6xx_gpu *a6xx_gpu)
>         }
>
>         /* Set the bus quota to a reasonable value for boot */
> -       icc_set_bw(gpu->icc_path, 0, MBps_to_icc(3072));
> +       a6xx_gmu_set_initial_bw(gpu, gmu);
>
>         /* Enable the GMU interrupt */
>         gmu_write(gmu, REG_A6XX_GMU_AO_HOST_INTERRUPT_CLR, ~0);
> @@ -1040,7 +1049,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
>                 a6xx_gmu_shutdown(gmu);
>
>         /* Remove the bus vote */
> -       icc_set_bw(gpu->icc_path, 0, 0);
> +       dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
>
>         /*
>          * Make sure the GX domain is off before turning off the GMU (CX)
> --
> 2.7.4
>
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno
