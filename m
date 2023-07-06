Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E28F374A7B8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:29:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231952AbjGFX3v (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:29:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41780 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231912AbjGFX3u (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:29:50 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3A3B1BC9
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:29:48 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so1984868e87.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688686187; x=1691278187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nR7BfV8Y4m2rZqr2Qh+049Lu1+M3E7eWXMh5ndBg794=;
        b=oHca69Yfag7I2KrpX0Eam4LMR73vzVXhBQqtv+q24tQptbsHqvi7usiIvF5ehLg0ir
         mSi+nl7WjASh73sY7Mt56mWJ47GiRwP3r/SjQ174RFQVlobfmimHPqY3mKOslr67lwG7
         FfMpi8pgzCZDSrROQTL8w8G5dPBDO2DVkoouUY/I2rABFU4pQkggClgKVquzh/cxtAdZ
         VDxcIg3gnVWNnjaO9xctSyGE0asuMI4pdaOWDARN683ht5W/hyzq6PIEGw2nMVpOr9/+
         QOzVWIxjm6eqbZ2onbyjI6fpd4JX7JxbaKBc1SvGZyCE3JkAdnJlilEoOxQTZKXFE4Gs
         6q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688686187; x=1691278187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nR7BfV8Y4m2rZqr2Qh+049Lu1+M3E7eWXMh5ndBg794=;
        b=BdI0Y2thWiSjTFImM7GjEvJI7DrGkWCLZ6EMDG3DwyUiksO64wkCYVBJAwkWCaEwoZ
         Qt7d24tF1WUXG8BEo8kjM8QG7QcBzFc3yRQP0j8C7Kx0B2kCaGPbmDsX970HJKNgnNFP
         ndO0m88Uz6EfXGWs3crZ7fZhtqbN/xoOysNAipoYLq6/AwLph+WEhd829ibzMcKEQT6b
         ngyHHHbRy83zRn1WHXyX2RD4YyftYIYGeaBOoOBak8CP9b3Pv/rXNiesuyD+Wos1ilx7
         Mw11t3vcyOW6raz7Dt7yQc9H/fQHEldhBTa6csLprpSYOjl08OQx5St6pW/WA8w/BnMU
         NmJg==
X-Gm-Message-State: ABy/qLapBuDfi6furUgebeH/YGF4tdgvURjLlvio8kqHPRiY/awgA10T
        JbsPMcLqSI+f4xka/xO6TRdl1Q==
X-Google-Smtp-Source: APBJJlG1yZzTsvNpFmmqLkCjnCMcgWLOY7Y8cYo2fRWmYUVF5X3pDaji6A9G4a+oNTmvBjNvdmTPGA==
X-Received: by 2002:a05:6512:3983:b0:4fa:b39f:c629 with SMTP id j3-20020a056512398300b004fab39fc629mr2794546lfu.25.1688686187023;
        Thu, 06 Jul 2023 16:29:47 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id q15-20020ac246ef000000b004fac93bdaecsm433374lfo.242.2023.07.06.16.29.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:29:46 -0700 (PDT)
Message-ID: <94969d3d-eaa7-d0c3-12fc-0f9d26947aa7@linaro.org>
Date:   Fri, 7 Jul 2023 01:29:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 05/12] drm/msm/adreno: Use quirk to identify
 cached-coherent support
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-6-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-6-robdclark@gmail.com>
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
> It is better to explicitly list it.  With the move to opaque chip-id's
> for future devices, we should avoid trying to infer things like
> generation from the numerical value.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 23 +++++++++++++++-------
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  1 +
>  2 files changed, 17 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
> index f469f951a907..3c531da417b9 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_device.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
> @@ -256,6 +256,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  	}, {
>  		.rev = ADRENO_REV(6, 1, 9, ANY_ID),
> @@ -266,6 +267,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a615_zap.mdt",
>  		.hwcg = a615_hwcg,
> @@ -278,6 +280,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a630_zap.mdt",
>  		.hwcg = a630_hwcg,
> @@ -290,6 +293,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> @@ -302,7 +306,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_128K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a650_zap.mdt",
>  		.hwcg = a650_hwcg,
> @@ -316,7 +321,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_1M + SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a660_zap.mdt",
>  		.hwcg = a660_hwcg,
> @@ -329,7 +335,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_512K,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.hwcg = a660_hwcg,
>  		.address_space_size = SZ_16G,
> @@ -342,6 +349,7 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_2M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a640_zap.mdt",
>  		.hwcg = a640_hwcg,
> @@ -353,7 +361,8 @@ static const struct adreno_info gpulist[] = {
>  		},
>  		.gmem = SZ_4M,
>  		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> -		.quirks = ADRENO_QUIRK_HAS_HW_APRIV,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT |
> +			ADRENO_QUIRK_HAS_HW_APRIV,
>  		.init = a6xx_gpu_init,
>  		.zapfw = "a690_zap.mdt",
>  		.hwcg = a690_hwcg,
> @@ -565,9 +574,9 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
>  	if (ret)
>  		return ret;
>  
> -	if (config.rev.core >= 6)
> -		if (!adreno_has_gmu_wrapper(to_adreno_gpu(gpu)))
> -			priv->has_cached_coherent = true;
> +	priv->has_cached_coherent =
> +		!!(info->quirks & ADRENO_QUIRK_HAS_CACHED_COHERENT) &&
> +		!adreno_has_gmu_wrapper(to_adreno_gpu(gpu));
>  
>  	return 0;
>  }
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index a7c4a2c536e3..e08d41337169 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -33,6 +33,7 @@ enum {
>  #define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
>  #define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
>  #define ADRENO_QUIRK_HAS_HW_APRIV		BIT(3)
> +#define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
>  
>  struct adreno_rev {
>  	uint8_t  core;
