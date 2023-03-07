Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D89766AF2EA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Mar 2023 19:57:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233544AbjCGS5c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Mar 2023 13:57:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59126 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233498AbjCGS5O (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Mar 2023 13:57:14 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6516B95DB
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Mar 2023 10:44:39 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id da10so56391254edb.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Mar 2023 10:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678214678;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mfXxXGI1XUIOGrJYihrvmrvOCvNEexUQJmCy3wEWPjA=;
        b=xrxG5phrtvuQNfbju3E8XhMb0ojglq5iYN7IrwjK4uYn0+u1raEyOz44gD+725wzHf
         RgT2DXsXj4wuh+g5KlHPc2wY2I6ye1hjgbtKuLo/0n3BikMe9vkxNdOm04sXP98LdIQn
         tLeYu+TLlFXSaU2NnhtYOojx/qRLkBrVAl39ep+ZjDqJyu7QuPnm1CTC2XcFHEqGVjC4
         OBl54i4zR5apVsvyApuVCnCoNRZpLuaASq7NL/dpepO3vy3QG43eqpPhoyLisDbUHirB
         BcUQXkG8mIHVZRErA0GNut5wufxUyw0wnjC8aoCzaLyOwoBs7y2JuZnmRM1sMrbR9fcE
         HXTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678214678;
        h=content-transfer-encoding:in-reply-to:references:cc:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mfXxXGI1XUIOGrJYihrvmrvOCvNEexUQJmCy3wEWPjA=;
        b=XoQ6zvKYoo+pv8ESjh0qDjqgktdxudPnh3eDG34UvSTeXH8KmPULYdgHqcLOYZOFIW
         Ztkfg8W7jAFyqqSnuvs7u0eMuSvWBii+3gGE++gnfz8rLCykSKLJCwO7i3ek2hRaGDfa
         087o69XfH1j6i4e+6tzj2mgtCKePmm9I9lv2O72M/0K300O/gUP50UjwEterNbelf5kA
         Sf/KEA5BIbksXc22eapdQ3RRXwqFakca1+2LkFtXxA90Mcn3PhFnO8IuZLcmLjqHb2oK
         EvX5/sXo3GUHstBmyY/a3DCpNW3OvSNhxK04KqvOJT7MA4XuX64z6wBg3IYhFmkw46EK
         rYNw==
X-Gm-Message-State: AO0yUKX4YoKLlmkr/vkHJzZ8tYx45woX1f5y0EU937PfvD/m1A3I3YrU
        Kqd7ZH7ZbXre1RgcL8ZPprmeQc4DvXupaT491Rw=
X-Google-Smtp-Source: AK7set/7fR3uyM3rhdzkQ6H96OnnW4/2mkcumR/QHnRwsBPxMbQ2E+nD+Qr/2zkiamzEQAxdqFQb1Q==
X-Received: by 2002:ac2:508e:0:b0:4db:3e32:b92a with SMTP id f14-20020ac2508e000000b004db3e32b92amr4172324lfm.69.1678213874515;
        Tue, 07 Mar 2023 10:31:14 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id h3-20020a05651211c300b004dda7435451sm2094746lfr.202.2023.03.07.10.31.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Mar 2023 10:31:14 -0800 (PST)
Message-ID: <718562d9-6d92-b18a-920c-4b7fcda6e986@linaro.org>
Date:   Tue, 7 Mar 2023 20:31:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 39/50] drm/msm/dpu: drop duplicate vig_sblk instances
Content-Language: en-GB
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230211231259.1308718-1-dmitry.baryshkov@linaro.org>
 <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
In-Reply-To: <20230211231259.1308718-40-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12/02/2023 01:12, Dmitry Baryshkov wrote:
> After fixing scaler version we are sure that sm8450 and sc8280xp vig
> sblk's are duplicates of sm8250_vig_sblk and thus can be dropped.

I will probably partially withdraw or rework this patch to fix the 
scaler->version handling. The rest of the patches are still in the queue.

> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>   .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 ++++----
>   .../drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  8 ++++----
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 18 ------------------
>   3 files changed, 8 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> index 094876b1019b..05b7ae3f0343 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
> @@ -85,13 +85,13 @@ static const struct dpu_ctl_cfg sc8280xp_ctl[] = {
>   /* FIXME: check block length */
>   static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		 sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>   	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		 sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>   	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		 sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>   	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		 sc8280xp_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		 sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>   		 sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index 3d95f2472e7a..d4f710481b78 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -84,13 +84,13 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>   
>   static const struct dpu_sspp_cfg sm8450_sspp[] = {
>   	SSPP_BLK("sspp_0", SSPP_VIG0, 0x4000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
> +		sm8250_vig_sblk_0, 0, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG0),
>   	SSPP_BLK("sspp_1", SSPP_VIG1, 0x6000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
> +		sm8250_vig_sblk_1, 4, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG1),
>   	SSPP_BLK("sspp_2", SSPP_VIG2, 0x8000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
> +		sm8250_vig_sblk_2, 8, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG2),
>   	SSPP_BLK("sspp_3", SSPP_VIG3, 0xa000, 0x328, VIG_SC7180_MASK,
> -		sm8450_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
> +		sm8250_vig_sblk_3, 12, SSPP_TYPE_VIG, DPU_CLK_CTRL_VIG3),
>   	SSPP_BLK("sspp_8", SSPP_DMA0, 0x24000, 0x328, DMA_SDM845_MASK,
>   		sdm845_dma_sblk_0, 1, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA0),
>   	SSPP_BLK("sspp_9", SSPP_DMA1, 0x26000, 0x328, DMA_SDM845_MASK,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index d84f8eb8f88a..5091cec30bfc 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -411,15 +411,6 @@ static const struct dpu_sspp_sub_blks sm8250_vig_sblk_2 =
>   static const struct dpu_sspp_sub_blks sm8250_vig_sblk_3 =
>   				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
>   
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sm8450_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_0 =
>   				_VIG_SBLK("0", 7, DPU_SSPP_SCALER_QSEED4);
>   static const struct dpu_sspp_sub_blks sm8550_vig_sblk_1 =
> @@ -431,15 +422,6 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
>   static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
>   
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
> -				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_1 =
> -				_VIG_SBLK("1", 6, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_2 =
> -				_VIG_SBLK("2", 7, DPU_SSPP_SCALER_QSEED4);
> -static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_3 =
> -				_VIG_SBLK("3", 8, DPU_SSPP_SCALER_QSEED4);
> -
>   #define _VIG_SBLK_NOSCALE(num, sdma_pri) \
>   	{ \
>   	.maxdwnscale = SSPP_UNITY_SCALE, \

-- 
With best wishes
Dmitry

