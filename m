Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B33374A7B2
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:28:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229555AbjGFX23 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:28:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231147AbjGFX22 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:28:28 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6C212118
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:27:50 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4f954d7309fso1580442e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688686069; x=1691278069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Rc4nEMPiLbzgMMqamf1zMVRPsKfUKUaVx1ZW+XaV+U=;
        b=aH8n5Qd9MK1ANni6dLQxRqCRToB9JSQaIxNTBqd4tfGdAAKgKYbzjnt+b///uWAVSi
         GQKtUZhYr4qRhidQEtnu+Vyh6q5qBT7U7eUmntyMDnXg76nRyPR7GERZ4sn3wbTxcJBG
         zcHgQDBeNWu7o62iK5Fm+Gy6ditfSFR0UjH2T39ob2qQ2lFBFQA1JZZkD/OVlyZkIgun
         Q8d7VB27w/EVkfZYx4oiuvpk019+rrGe9lYHbcF1OC5jeOUdMRQOIAyo1xLqVuRd30Li
         zWmU0IiEhBLhlTSwLcFbyFJn330gDpAyoFFDln1t1BUOlvk6a0lt15ZZopiY1Ea2Hmie
         5DWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688686069; x=1691278069;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Rc4nEMPiLbzgMMqamf1zMVRPsKfUKUaVx1ZW+XaV+U=;
        b=PQzQatrsz7oK7g6p/heRx0iIxXRsZRPzbMY0lSpw2AWvGm/aBiyoaKm+xVf5Bwm99o
         ZJONWdBmbaiZeO9qpMxsM886PdhDaK7MqQHvr/cerwZtjNXXccabrQZdhaqfFmwV0fy0
         bU2PbZci/nPsslD51vexRz0WLhc7Lb465AxFKaadW2xGsNl1R+/3ctCFKSfCA/Q/BCsE
         NeajT1K5H76dzz1vVdxPA0gNMI+Bvl/iWGJfv7sjDUaoY4DGp5fkR8D5wXNTdhtrPd8F
         20bRDuYcwMc/8QM5f8Xe+bhZDW0PDDhMdj1zPgBEnTTO50Z8sjRVCl2HUCdxTVHNSyqi
         xCig==
X-Gm-Message-State: ABy/qLZ7frlMwR+61GKHfAcYaL0N/428sVkY5td7vO1gLAihCcMvmMmx
        e+SHKXtcEu/wvVK+WhnVoR5ygg==
X-Google-Smtp-Source: APBJJlEDtOM82nO7hOxZ9Ss1rbG8HFdGBF5zph2N6UBqW/8EUNAFOSfGksJg7EkQHZ4oceUCRdtNdA==
X-Received: by 2002:a05:6512:e9d:b0:4fb:7f45:bcb6 with SMTP id bi29-20020a0565120e9d00b004fb7f45bcb6mr2253466lfb.16.1688686068600;
        Thu, 06 Jul 2023 16:27:48 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id 16-20020ac24830000000b004faeedbb29dsm438893lft.64.2023.07.06.16.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:27:48 -0700 (PDT)
Message-ID: <66dfebe7-1c6a-5bd3-b893-fa43dd5e92ae@linaro.org>
Date:   Fri, 7 Jul 2023 01:27:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 04/12] drm/msm/adreno: Use quirk identify hw_apriv
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-5-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-5-robdclark@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 6.07.2023 23:10, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Rather than just open coding a list of gpu-id matches.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 3 +--
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 1 +
>  3 files changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> index 5ba8b5aca502..6f8c4381fa4a 100644
> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
> @@ -2489,8 +2489,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>  	/* Quirk data */
>  	adreno_gpu->info = info;
>  
> -	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
> -		adreno_gpu->base.hw_apriv = true;
> +	adreno_gpu->base.hw_apriv = !!(info->quirks & ADRENO_QUIRK_HAS_HW_APRIV);
>  
>  	a6xx_llc_slices_init(pdev, a6xx_gpu);
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index 326912284a95..f469f951a907 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -302,6 +302,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
>  		.hwcg = a650_hwcg,
> @@ -315,6 +316,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
>  		.hwcg = a660_hwcg,
> @@ -327,6 +329,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
> @@ -350,6 +353,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
>  		.hwcg = a690_hwcg,
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index d31e2d37c61b..a7c4a2c536e3 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -32,6 +32,7 @@ enum {
>  #define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
> +#define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
>  
>  struct adreno_rev {
>  	uint8_t  core;
