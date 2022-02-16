Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5FE334B7DB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Feb 2022 03:51:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236576AbiBPCcL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Feb 2022 21:32:11 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343757AbiBPCcI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Feb 2022 21:32:08 -0500
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65CA6986E4
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:31:57 -0800 (PST)
Received: by mail-oi1-x229.google.com with SMTP id 4so1016269oil.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Feb 2022 18:31:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:in-reply-to:references:from:user-agent:date:message-id
         :subject:to:cc;
        bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
        b=f9qRjcip1axnB3gsByayybsK2LUKhi3YC+5I8hPNWYz6Dq2oILdp9UBT/UtbbY1G6L
         xIfZ0+QkOMs82ifVOLbQ/sYS6IJn8zSrkH1nuz2EU9qf3QDTCzvH3WK5zX0TS5/ugxUr
         3fPAtiy0aQcdYmPaZjbe5RmoiyJvHigmR1Zm8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from
         :user-agent:date:message-id:subject:to:cc;
        bh=hUg/o9QQhWbhspmlcIp23bDnzJOJG3aQ5GoAVdX8hOM=;
        b=kLbg9543W8SIBUqz2XOD3G266UeTG5b4WVo9ljZkOjRXg1w5RV4VHxJpwEL6jXpRU/
         QXaLDnYHqHNfnr2jF6XJyFwM6RgLBjPbVykt++cewv0W9lAs+c7Yt74VotsksMb/I1L1
         I4wbu1BbHwDfA+OeloaJuJSHkOLKSq3azHD/N9lYW0tDdngKcn7VY/V+tfjcth/oF5/l
         B7yKfMPQLbIi6iDsQbIzZNey1XAl6g0N9WjEjGp5vtLr+jBl3P1oiGGBR46eUXLxX6+J
         o2BrorZbSjvkTpHHPypIxNCp9AkCVYCaNdQuDgBeOyPAsXAfx5m0rJ/daWws2PrnOgtY
         0TSg==
X-Gm-Message-State: AOAM5333Q2OytRFJuXWp5Pnht7SZ67z6Rg4/6b7VhH/hZPI4MzJB5j5I
        Kvsl0vM8GcUskIlyVv1WnT80+yERcYSAuiBw0ieC7g==
X-Google-Smtp-Source: ABdhPJyDbvUvZ6RkYHBL3/aUIR1aZh7KmHgpodA7AcbRXrRAGWGGpOYV87YtSNdxv0zicH+MiICs9s/7a1UNaneOVZg=
X-Received: by 2002:a05:6808:b2f:b0:2cf:9af3:1687 with SMTP id
 t15-20020a0568080b2f00b002cf9af31687mr337010oij.112.1644978716695; Tue, 15
 Feb 2022 18:31:56 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 15 Feb 2022 18:31:55 -0800
MIME-Version: 1.0
In-Reply-To: <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
References: <20220131210513.2177652-1-dmitry.baryshkov@linaro.org> <20220131210513.2177652-2-dmitry.baryshkov@linaro.org>
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date:   Tue, 15 Feb 2022 18:31:55 -0800
Message-ID: <CAE-0n520mZdGaMWwjBEb7SSbLf31Sd7t3pe9dJ5FLVnsSVJZFg@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] drm/msm/dpu: simplify clocks handling
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Quoting Dmitry Baryshkov (2022-01-31 13:05:12)
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> index 60fe06018581..4d184122d63e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> @@ -405,10 +394,11 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
>
>                 trace_dpu_core_perf_update_clk(kms->dev, stop_req, clk_rate);
>
> -               ret = _dpu_core_perf_set_core_clk_rate(kms, clk_rate);
> +               if (clk_rate > kms->perf.max_core_clk_rate)
> +                       clk_rate = kms->perf.max_core_clk_rate;

Using

	clk_rate = min(clk_rate, kms->perf.max_core_clk_rate)

would be type safer. And min_t() would be explicit if the types don't
match, but we should try to make them be compatible.

> +               ret = dev_pm_opp_set_rate(&kms->pdev->dev, clk_rate);
>                 if (ret) {
> -                       DPU_ERROR("failed to set %s clock rate %llu\n",
> -                                       kms->perf.core_clk->clk_name, clk_rate);
> +                       DPU_ERROR("failed to set core clock rate %llu\n", clk_rate);
>                         return ret;
>                 }
>
> @@ -529,13 +519,13 @@ void dpu_core_perf_destroy(struct dpu_core_perf *perf)
>  int dpu_core_perf_init(struct dpu_core_perf *perf,
>                 struct drm_device *dev,
>                 struct dpu_mdss_cfg *catalog,
> -               struct dss_clk *core_clk)
> +               struct clk *core_clk)
>  {
>         perf->dev = dev;
>         perf->catalog = catalog;
>         perf->core_clk = core_clk;
>
> -       perf->max_core_clk_rate = core_clk->max_rate;
> +       perf->max_core_clk_rate = clk_get_rate(core_clk);
>         if (!perf->max_core_clk_rate) {
>                 DPU_DEBUG("optional max core clk rate, use default\n");
>                 perf->max_core_clk_rate = DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> index 2d385b4b7f5e..5f562413bb63 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> @@ -21,7 +21,6 @@
>  #include "dpu_hw_lm.h"
>  #include "dpu_hw_interrupts.h"
>  #include "dpu_hw_top.h"
> -#include "dpu_io_util.h"
>  #include "dpu_rm.h"
>  #include "dpu_core_perf.h"
>
> @@ -113,7 +112,8 @@ struct dpu_kms {
>         struct platform_device *pdev;
>         bool rpm_enabled;
>
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>
>         /* reference count bandwidth requests, so we know when we can
>          * release bandwidth.  Each atomic update increments, and frame-
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> index 131c1f1a869c..8c038416e119 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
> @@ -29,7 +29,8 @@ struct dpu_irq_controller {
>  struct dpu_mdss {
>         struct msm_mdss base;
>         void __iomem *mmio;
> -       struct dss_module_power mp;
> +       struct clk_bulk_data *clocks;
> +       int num_clocks;

size_t?

>         struct dpu_irq_controller irq_controller;
>  };
>
