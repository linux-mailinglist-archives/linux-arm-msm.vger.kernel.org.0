Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B82A474A784
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jul 2023 01:21:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229470AbjGFXVU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 6 Jul 2023 19:21:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjGFXVT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 6 Jul 2023 19:21:19 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59F7F1BD3
        for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jul 2023 16:21:17 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so30672581fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jul 2023 16:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688685675; x=1691277675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eHrUtEEGgILOI5mEdHCSitrHO24/cMaqcjfdzWxD7p8=;
        b=uC35L9ExDc/bK4YEsE0j6nLInTvfijmxi6LKAa03/t2dpuxisZJinaePDDy7/a6Oau
         zQrG5rZ6Infda2CgCuLnQrYOIIaG+IEC7fVhLNmXvTciG2Rbo50/n9kOV54D/Ubg8DSp
         IdM+vvJuy9ePGwyFUAUbyg1AOQD6pKMpjspigPFUUaaPo+xq7+1+1DvYCS7zjMHjlJZf
         2ABTeMATs+BFqMfS7gHazfsGByaUomAi67vL+sou5nYZvvWyCZBUH0s7GPK1vplBLw3v
         oxMz27FaKVFvJwqI3fFjWwF0A5DK8/e+v0SoC/9otdQ03EHn5PgDwjE8uDStxWZVFK1T
         L3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688685675; x=1691277675;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eHrUtEEGgILOI5mEdHCSitrHO24/cMaqcjfdzWxD7p8=;
        b=cy50imYFuka6OmWdudUfBXMPpIOIhGnlcJ6CrCp2P6+oqKFJMQWBCc2VP7Q7twQW72
         FuNGnq8grvNzsaPkkqMs2xTbWGj7V9h4eeeUfWa814YMu/m82VWe8rKZBAZQOI36EOv0
         e0Crx5FJ8rQtHNjWFa9jsip3oc2+ykd4DPvVpujxlsolm1KHI4q6BYVHE2DB8rnJPU1H
         /+UvsoPTFsZ8LBMnk2SIjQ31Phz6iVt3RUMjFie3kckNSSZhGGGdCfW8kiM+qHtwZdHI
         W9ncndo3jVkeTikKstN6RKAZMZ1RtM3vMtwGmzka1SITHLDLliZsN58/QeY3dGh05Z7m
         OVjw==
X-Gm-Message-State: ABy/qLYHSOWia1FAYKdRWcOjPAPNNV5KliE4UwhrNrb5QcMNWghJKBl2
        WIsr4Q4WBa4XpVSzV9zyq3KapQ==
X-Google-Smtp-Source: APBJJlFmzQz27h2D7FyX9IHdloaS8l7VIZn38s/RUHOkPzmFAtI2iw3LtCjKZOq0CXmkWh9nvxOgsg==
X-Received: by 2002:a2e:990b:0:b0:2b4:6a06:4c26 with SMTP id v11-20020a2e990b000000b002b46a064c26mr1356525lji.2.1688685675139;
        Thu, 06 Jul 2023 16:21:15 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id y11-20020a05651c020b00b002b6e7f3a3eesm500778ljn.62.2023.07.06.16.21.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Jul 2023 16:21:14 -0700 (PDT)
Message-ID: <c5246b95-ab88-d99e-f099-18c0ea1ab712@linaro.org>
Date:   Fri, 7 Jul 2023 01:21:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 01/12] drm/msm/adreno: Remove GPU name
Content-Language: en-US
To:     Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Rob Clark <robdclark@chromium.org>
References: <20230706211045.204925-1-robdclark@gmail.com>
 <20230706211045.204925-2-robdclark@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230706211045.204925-2-robdclark@gmail.com>
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
> No real need to have marketing names in the kernel.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

[...]

> -	gpu_name = adreno_gpu->info->name;
> -	if (!gpu_name) {
> -		gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> -				rev->core, rev->major, rev->minor,
> -				rev->patchid);
> -		if (!gpu_name)
> -			return -ENOMEM;
> -	}
> +	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%d.%d.%d.%d",
> +			rev->core, rev->major, rev->minor,
> +			rev->patchid);
nit: great opportunity to align indentation with the opening brace

Konrad
> +	if (!gpu_name)
> +		return -ENOMEM;
>  
>  	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
>  
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> index cf45007400c8..6830c3776c2d 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
> @@ -61,7 +61,6 @@ extern const struct adreno_reglist a660_hwcg[], a690_hwcg[];
>  struct adreno_info {
>  	struct adreno_rev rev;
>  	uint32_t revn;
> -	const char *name;
>  	const char *fw[ADRENO_FW_MAX];
>  	uint32_t gmem;
>  	u64 quirks;
