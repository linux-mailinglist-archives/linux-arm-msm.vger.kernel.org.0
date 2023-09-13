Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8DD4179F1F1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Sep 2023 21:23:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232287AbjIMTYC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 13 Sep 2023 15:24:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232279AbjIMTYB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 13 Sep 2023 15:24:01 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 492B619A0
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 12:23:57 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2bfbbd55158so2729321fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Sep 2023 12:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694633035; x=1695237835; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yb6IOfY9+vEec+6xIf+iuXQW3Hl/QkNUzvliIRsca1Y=;
        b=i4YlHtPfORwaUiaqbNeUYTOfaZU6dRbuZ9GlZF/S1VWYDJ8cnki5ZJYwgHsg8Xek6d
         lZgvX26fXY0iS5PX4NjWlcV//NqOAcMS5uESZgjoYXk4L3cXtrc6ywJN64qyRFzSU7fN
         lD4xtgg5bTzWjafIMyoCfotWiwSbz1PGMjpx21y10a/kLbypO3OnIU9IMsgN0oedVPvx
         IduXZS7fc1K0I1JJnMzFFN4yWIWOiSpEVDjEwxuK4jDf5gikiDcCsgmZEylBAIJ7zSTr
         65RBqgAHRnSiGZtjq2DdMDnXJMFqluo5xNLd2YLON7ouNSKhLMsNQjzzIpz/Xiph/itt
         BgAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694633035; x=1695237835;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yb6IOfY9+vEec+6xIf+iuXQW3Hl/QkNUzvliIRsca1Y=;
        b=RF2zRmNTSsiF9trbkD5lEPlh48TfIfbINrsVTOcAIwSkCftpjwIicUvKaH14ecRTU4
         0bbPNhjwDSINoj1p8Ctg2gFYpYK5LC4GN6MIRcdHzufgRfDSQ6of2Llo7Pxq3ebsnU+i
         H0DHBOkC2GBKxiAzvfSgAKsf04b3h9P9o8ZAFhdeZmZpv0oJVLnmNHQe/JIS924g1sQP
         Pemi600qXKn/P904SU3d8v3w4ckXWBDRjAqaUoZ7YEo8/+x/J75K1wuyI+Trno+7s/hC
         9tk+aItA5wzZein83Qp++3wlx9JTJNK6JQV9n4WXQqqhKiBGsUV6hRNkvUPSTq36ayhq
         pH1Q==
X-Gm-Message-State: AOJu0YwBnOz0l6f23qZp133zrYA74zmiJ6KRoQrszGXDsXwSj+QaoEvR
        8vEXgm443D1NC5tV7sP5LEIkOw==
X-Google-Smtp-Source: AGHT+IHibaQxC9XZMGvabyKpHwLmuXyW3R2maLcNHh7+1SVimBcufnescH/IK6NeInai3SZgIMv2kg==
X-Received: by 2002:a2e:8182:0:b0:2bf:a0d1:b122 with SMTP id e2-20020a2e8182000000b002bfa0d1b122mr2926640ljg.5.1694633035453;
        Wed, 13 Sep 2023 12:23:55 -0700 (PDT)
Received: from [192.168.37.232] (178235177172.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.172])
        by smtp.gmail.com with ESMTPSA id q18-20020a170906a09200b0099b8234a9fesm8901041ejy.1.2023.09.13.12.23.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Sep 2023 12:23:54 -0700 (PDT)
Message-ID: <7671aa93-3967-45c0-bf09-a2d63a99ced6@linaro.org>
Date:   Wed, 13 Sep 2023 21:23:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Add support for SM7150 SoC machine
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org,
        sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
        daniel@ffwll.ch, johan+linaro@kernel.org, andersson@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230913191957.26537-1-danila@jiaxyga.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230913191957.26537-1-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13.09.2023 21:19, Danila Tikhonov wrote:
> SM7150 has 5 power levels which correspond to 5 speed-bin values: 0,
> 128, 146, 167, 172. Speed-bin value is calulated as FMAX/4.8MHz round up
> to zero decimal places.
> 
> The vendor's FW GMU is called a618_gmu.bin. And also a618 on SM7150 uses
> a615 zapfw.
Interesting.

GMU fw comes from Qualcomm and should not(?) have any
vendor modifications, btw.

Can you try loading the upstream a630_gmu.bin or a619_gmu.bin
from linux-firmware and seeing if anything changes?

> +	}, {
> +		.machine = "qcom,sm7150",
> +		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
> +		.family = ADRENO_6XX_GEN1,
> +		.revn = 618,
I'm not sure what Rob's stance on using revn is for values
that have already been used before..

Konrad
> +		.fw = {
> +			[ADRENO_FW_SQE] = "a630_sqe.fw",
> +			[ADRENO_FW_GMU] = "a618_gmu.bin",
> +		},
> +		.gmem = SZ_512K,
> +		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
> +		.quirks = ADRENO_QUIRK_HAS_CACHED_COHERENT,
> +		.init = a6xx_gpu_init,
> +		.zapfw = "a615_zap.mdt",
.mbn?

> +		.hwcg = a615_hwcg,
> +		.speedbins = ADRENO_SPEEDBINS(
> +			{ 0,   0 },
> +			{ 128, 1 },
> +			{ 146, 2 },
> +			{ 167, 3 },
> +			{ 172, 4 },
> +		),
>  	}, {
>  		.chip_ids = ADRENO_CHIP_IDS(0x06010800),
>  		.family = ADRENO_6XX_GEN1,
> @@ -507,6 +529,10 @@ MODULE_FIRMWARE("qcom/a530_zap.b00");
>  MODULE_FIRMWARE("qcom/a530_zap.b01");
>  MODULE_FIRMWARE("qcom/a530_zap.b02");
>  MODULE_FIRMWARE("qcom/a540_gpmu.fw2");
> +MODULE_FIRMWARE("qcom/a615_zap.mbt");
> +MODULE_FIRMWARE("qcom/a615_zap.b00");
> +MODULE_FIRMWARE("qcom/a615_zap.b01");
> +MODULE_FIRMWARE("qcom/a615_zap.b02");
and here too?

Konrad
