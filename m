Return-Path: <linux-arm-msm+bounces-2974-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 18FB88015C5
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 22:54:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 33243B20FA8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 Dec 2023 21:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DB305A0FD;
	Fri,  1 Dec 2023 21:53:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XhRR1QKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com [IPv6:2607:f8b0:4864:20::72b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0CB9D6C
	for <linux-arm-msm@vger.kernel.org>; Fri,  1 Dec 2023 13:53:52 -0800 (PST)
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-77ecedad216so16104185a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 01 Dec 2023 13:53:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701467632; x=1702072432; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jrHo3xuqedRIfDFM3RFqZlEkD9CY6RqxHH0K+7ZtnxQ=;
        b=XhRR1QKtxaAz+rb4YpyGexnfr9nolBMLOR/h0cBhuzOq+meIpezzrb6Pva5N1GWoFh
         P7m/Sh7BI9rfd99TaHw/DT2SRq6ZOVO4iQZfBK12ksIIYMRPSKaNdVe6vGNl+Xf6M7Gj
         VCQD7rXBEcuzxRWdyBNoJOpG5w6WAU0F9ODsUpTrZzlF2RFOlUikAiR5VojZoaXzKTaU
         zOFE3I2YLHZqWTkdKemcNFf0pYJ4+uGS/yPhBKZ5311TkXKxVzWxLGl6LqutdXdfEeWO
         HsDaj4WQ/pJj3jMzclrYj2HGuCbS2AXtuqBq6hvyPyvw/yPmPHx6t6DwPIIks4xEl4SN
         KvAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701467632; x=1702072432;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jrHo3xuqedRIfDFM3RFqZlEkD9CY6RqxHH0K+7ZtnxQ=;
        b=XksW2GIzeIx6jHjwASjhesl3uMjHX1xTl0w9Dx+vXtaCGuAPAqOf3JDz6WbJHgGjMi
         1tW8YSB8Cw2elZ48nrgVAZ7XSBaa45rLBtsfHlJxyjmuY2j4roJzmWwUwtxiglksEdp6
         hyYzdYPl+zw1/+rscHU0+VSakXZx/Ve7L4uqgLsw815j+RgAO/3Di0zcaao3qdUa1g+z
         e39yinxbZCmQrkbMvXsTs0xPnhtcsyJATbl4QTXvtZ2N72NfrK5X7njewyFkqjSlIrtK
         IsxaY87RWWGY9aYI4E3cubZw+CFIGkCYSWc9cSBef59xU35hKTxuVYeSKQuqER6rNZn4
         dJGQ==
X-Gm-Message-State: AOJu0YyA4ChxYLg4Sznm5U5DqUEZ4TNmK0tePa4wSqGy5bTtsOU6VB2/
	6zBz0uuxVssE3O5z5Fv9WcMfig==
X-Google-Smtp-Source: AGHT+IHTUJmHRh893X18NM3LJCP4XO/vSxZP0oWw/Y9wh8wa4UeH9g8oTwEOYj02IhSJ/5+opO6W7A==
X-Received: by 2002:a05:620a:8a8a:b0:77e:fba3:9d2d with SMTP id qu10-20020a05620a8a8a00b0077efba39d2dmr137248qkn.145.1701467631830;
        Fri, 01 Dec 2023 13:53:51 -0800 (PST)
Received: from [192.168.209.83] (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
        by smtp.gmail.com with ESMTPSA id j5-20020a05620a288500b0077d8526bcdesm1858880qkp.86.2023.12.01.13.53.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Dec 2023 13:53:51 -0800 (PST)
Message-ID: <153ba359-fd73-47d8-8c6e-a70e24943bf1@linaro.org>
Date: Fri, 1 Dec 2023 22:53:45 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] drm/msm/adreno: Add A305B support
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20231130-msm8226-gpu-v1-0-6bb2f1b29e49@z3ntu.xyz>
 <20231130-msm8226-gpu-v1-2-6bb2f1b29e49@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20231130-msm8226-gpu-v1-2-6bb2f1b29e49@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 30.11.2023 21:35, Luca Weiss wrote:
> Add support for the Adreno 305B GPU that is found in MSM8226(v2) SoC.
> Previously this was mistakenly claimed to be supported but using wrong
> a configuration.
> 
> In MSM8226v1 there's also a A305B but with chipid 0x03000510 which
> should work with the same configuration but due to lack of hardware for
> testing this is not added.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c      | 15 ++++++++++++---
>  drivers/gpu/drm/msm/adreno/adreno_device.c | 15 +++++++++++----
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  5 +++++
>  3 files changed, 28 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> index c86b377f6f0d..5fc29801c4c7 100644
> --- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
> @@ -134,6 +134,13 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  		/* Set up AOOO: */
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO_EN, 0x0000003c);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_AXI_AOOO, 0x003c003c);
> +	} else if (adreno_is_a305b(adreno_gpu)) {
> +		gpu_write(gpu, REG_A3XX_VBIF_IN_RD_LIM_CONF0, 0x00181818);
> +		gpu_write(gpu, REG_A3XX_VBIF_IN_WR_LIM_CONF0, 0x00181818);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x00000018);
> +		gpu_write(gpu, REG_A3XX_VBIF_OUT_WR_LIM_CONF0, 0x00000018);
> +		gpu_write(gpu, REG_A3XX_VBIF_DDR_OUT_MAX_BURST, 0x00000303);
> +		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
>  	} else if (adreno_is_a306(adreno_gpu)) {
>  		gpu_write(gpu, REG_A3XX_VBIF_ROUND_ROBIN_QOS_ARB, 0x0003);
>  		gpu_write(gpu, REG_A3XX_VBIF_OUT_RD_LIM_CONF0, 0x0000000a);
> @@ -230,7 +237,9 @@ static int a3xx_hw_init(struct msm_gpu *gpu)
>  	gpu_write(gpu, REG_A3XX_UCHE_CACHE_MODE_CONTROL_REG, 0x00000001);
>  
>  	/* Enable Clock gating: */
> -	if (adreno_is_a306(adreno_gpu))
> +	if (adreno_is_a305b(adreno_gpu))
> +		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
> +	else if (adreno_is_a306(adreno_gpu))
>  		gpu_write(gpu, REG_A3XX_RBBM_CLOCK_CTL, 0xaaaaaaaa);
||?

[...]

Otherwise looks in line with msm-3.10

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad

