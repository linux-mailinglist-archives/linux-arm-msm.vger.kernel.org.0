Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6641B409
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Sep 2021 18:39:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241777AbhI1Qk7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 28 Sep 2021 12:40:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241773AbhI1Qk6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 28 Sep 2021 12:40:58 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33B9EC06161C
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 09:39:17 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id g41so94834850lfv.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Sep 2021 09:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=G7Nu624BHA+ciBaAN51wOEprdQ45Szw6B8+mMioIzMU=;
        b=cetdKQLhcnBhXSFEllvSJ8rYG6P547knd8cgm9LIqgEBIpZbimxBdLyGX5CLabrDi2
         uiLSxpnHuOhVwpOg/pWAfEVtMdG1dS4PBMGIF/oy7GAyQ2xf9y+1EtWxxId3s9NIlvao
         v/lb3+AibTbQAIj+2DJu5cdBrkKvqBEJFLvTBlh7QM7HcrmdXH635oioXiHj26pFw8dM
         MyoltSzyCbx8X6MgoyFB6SyYgw0itqm+KK7oSR1GwxcRZaXXKr8syeTCWFN1RSwjaMLB
         FCicBfESaEPfPJszwJV0M43V04uc7L4ayKKK1LQ+VahfpNjLioeyiqxoyysoOv+kXDVE
         TeDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=G7Nu624BHA+ciBaAN51wOEprdQ45Szw6B8+mMioIzMU=;
        b=gisauTbKeQBs2kzfN/yTCFl/MELE6wZGniHMCDIn5h7RNEtaP+iLV2QM7vqnehDRI3
         yPG4YKnlKeWMyr+Y1FAmTxyH6/2FwAdD8HRt6zc7vPb4RaEtENRNqI0KVw9ggm2YbJyu
         kHL4jYkkVHJJLfWo4FkcIV+V4aIoc1hM8/9NWMrzjt5ei1qI2ASyre6SK7PySJhk22JR
         ChAmL4g4Vut9T8gwWdQzAQ68g6+vqy4a74rLys5y5lJOFU6QZhMN0tC/GUK23UYcz7hg
         8ypWyR1klhhxHWxsvFnKy6qLdOo8pdAMg4LkPcGrQDXcU3FYA2jtMol+DoFUhNOKv1nu
         nzRg==
X-Gm-Message-State: AOAM530GH1RuXipSFZnKrPElcWgfZssPX30kfRCI8coGmlmCyHoc/AOS
        7IbZMJc1RtOXyKph6QcDJmne4w==
X-Google-Smtp-Source: ABdhPJyCj8nkgVuxflTeFioAAJwZAukYxUdj8p/t666Q+NKGnuf9aDbO0HpPK9CHZhyIDATH2r/4Lg==
X-Received: by 2002:ac2:4bc1:: with SMTP id o1mr6633392lfq.596.1632847155514;
        Tue, 28 Sep 2021 09:39:15 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id u10sm1970336lfl.87.2021.09.28.09.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Sep 2021 09:39:14 -0700 (PDT)
Subject: Re: [PATCH] drm/msm/dpu: Remove some nonsense
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Krishna Manikandan <mkrishn@codeaurora.org>,
        Lee Jones <lee.jones@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20210928162903.1104847-1-robdclark@gmail.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <dbefd596-4382-3822-fdec-486cf3df1560@linaro.org>
Date:   Tue, 28 Sep 2021 19:39:14 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20210928162903.1104847-1-robdclark@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 28/09/2021 19:28, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> These aren't used.  And if we add use for them later, we should probably
> do something a bit more structured than string parsing.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 6 ------
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 --------
>   2 files changed, 14 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index b131fd376192..e32dbb06aad1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -958,12 +958,6 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
>   	.min_core_ib = 2400000,
>   	.min_llcc_ib = 800000,
>   	.min_dram_ib = 800000,
> -	.core_ib_ff = "6.0",
> -	.core_clk_ff = "1.0",
> -	.comp_ratio_rt =
> -	"NV12/5/1/1.23 AB24/5/1/1.23 XB24/5/1/1.23",
> -	.comp_ratio_nrt =
> -	"NV12/5/1/1.25 AB24/5/1/1.25 XB24/5/1/1.25",
>   	.undersized_prefill_lines = 2,
>   	.xtra_prefill_lines = 2,
>   	.dest_scale_prefill_lines = 3,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> index d2a945a27cfa..4ade44bbd37e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
> @@ -676,10 +676,6 @@ struct dpu_perf_cdp_cfg {
>    * @min_core_ib        minimum mnoc ib vote in kbps
>    * @min_llcc_ib        minimum llcc ib vote in kbps
>    * @min_dram_ib        minimum dram ib vote in kbps
> - * @core_ib_ff         core instantaneous bandwidth fudge factor
> - * @core_clk_ff        core clock fudge factor
> - * @comp_ratio_rt      string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
> - * @comp_ratio_nrt     string of 0 or more of <fourcc>/<ven>/<mod>/<comp ratio>
>    * @undersized_prefill_lines   undersized prefill in lines
>    * @xtra_prefill_lines         extra prefill latency in lines
>    * @dest_scale_prefill_lines   destination scaler latency in lines
> @@ -702,10 +698,6 @@ struct dpu_perf_cfg {
>   	u32 min_core_ib;
>   	u32 min_llcc_ib;
>   	u32 min_dram_ib;
> -	const char *core_ib_ff;
> -	const char *core_clk_ff;
> -	const char *comp_ratio_rt;
> -	const char *comp_ratio_nrt;
>   	u32 undersized_prefill_lines;
>   	u32 xtra_prefill_lines;
>   	u32 dest_scale_prefill_lines;
> 


-- 
With best wishes
Dmitry
