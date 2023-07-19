Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E0D175927E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jul 2023 12:15:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229611AbjGSKPt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jul 2023 06:15:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230326AbjGSKPo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jul 2023 06:15:44 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40D691FD7
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:15:40 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2b743161832so103366871fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Jul 2023 03:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1689761738; x=1690366538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bxmBvcuS8RFIbXbNjCJxgcWTObrkXgmqIrEqE0WdVjQ=;
        b=H9h2YJ2FWD/gqcBGWUekN8TKcYYSQW5LmwxS/4NMCvhdYE31JxOrPR45jLVkBuu/dP
         /RaJ6JeVXwigSkKgld/Vus8aElf5JbC2xJ37bZw3O/K0fwq1btRthsEqFjRwxgQ+Dv5J
         2G54UANiCBS4Vh8WUloypq9Rg3fNrr/w7Olw6HOYJjZXH0OJHXfH5Ov9xPiQqOTfc8Zh
         mdeOwRM6510LxkhshVuNa9zmE83Z1WqliLKzSWjA7qqLJT0zq7GX9BU3wNARL6mcE9wQ
         +lyC+zPakyVqytg6J1GAj8fie099JUqzXgruo0xnDPOpkgWa5X8c3k1mXuLH08bUR2hO
         fE6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689761738; x=1690366538;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bxmBvcuS8RFIbXbNjCJxgcWTObrkXgmqIrEqE0WdVjQ=;
        b=SO8OaeSXq/zQle1v9XvYgeGMjVbRa6g93+QX0Q2Sg9XJKIttWeelldNVvpHBvw15Nl
         pY9Pk9uvbgsDkKvcflmz/Ubb+tkvU4TZYW954ww6CMnQ67ekGjr7Jef9R6trBDA19bS9
         +7gvNMyK4Crd2A4EfuVOCnMQKJp5/RK7DG1UkUE+QOSFDahyAQ19mx7qxDpN0juk3d9u
         BMs4k6UhFFQL2hEEL4P6rX0+m7V5ynlKFzrZkjPQNPo3VnBpCPSaSLDjj3JSpJtmclud
         d/fQ91DBahUSHFNmYeDceCkBcqT7SEL2ouywlAmunNtFiBaXze2JAL9OqnRgCHa1pk7D
         ptHQ==
X-Gm-Message-State: ABy/qLZ3oJ3GNmXKNVocL2b8wWRbBqa4tn6uteXptSu9sFjlE5NKnLzG
        bMWuDhmkxzSvTzDT/TSLxsB6cw==
X-Google-Smtp-Source: APBJJlGfF7dTSA6DhQW5CKGrmbb9+zo9lTGZYZhmmmDf8BqE1l8cnv23T34jnYQfm6WveE+sJjW6zw==
X-Received: by 2002:a2e:9cc6:0:b0:2b6:decf:5cbf with SMTP id g6-20020a2e9cc6000000b002b6decf5cbfmr1352317ljj.32.1689761738605;
        Wed, 19 Jul 2023 03:15:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id 6-20020a05651c00c600b002b6a163b244sm969101ljr.3.2023.07.19.03.15.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 19 Jul 2023 03:15:38 -0700 (PDT)
Message-ID: <185cb945-4c4e-1697-060e-602a3af2fe50@linaro.org>
Date:   Wed, 19 Jul 2023 13:15:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 5/5] soc: qcom: socinfo: add SM4450 ID
Content-Language: en-GB
To:     Tengfei Fan <quic_tengfan@quicinc.com>, andersson@kernel.org,
        konrad.dybcio@linaro.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org
Cc:     quic_tsoni@quicinc.com, quic_shashim@quicinc.com,
        quic_kaushalk@quicinc.com, quic_tdas@quicinc.com,
        quic_tingweiz@quicinc.com, quic_aiquny@quicinc.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230719100135.21325-1-quic_tengfan@quicinc.com>
 <20230719100135.21325-6-quic_tengfan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230719100135.21325-6-quic_tengfan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 19/07/2023 13:01, Tengfei Fan wrote:
> Add the ID for the Qualcomm SM4450 SoC.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
>   drivers/soc/qcom/socinfo.c         | 1 +
>   include/dt-bindings/arm/qcom,ids.h | 2 ++
>   2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
> index 4d49945b3a35..fa5e4c54207a 100644
> --- a/drivers/soc/qcom/socinfo.c
> +++ b/drivers/soc/qcom/socinfo.c
> @@ -415,6 +415,7 @@ static const struct soc_id soc_id[] = {
>   	{ qcom_board_id(IPQ5312) },
>   	{ qcom_board_id(IPQ5302) },
>   	{ qcom_board_id(IPQ5300) },
> +	{ qcom_board_id(SM4450) },
>   };
>   
>   static const char *socinfo_machine(struct device *dev, unsigned int id)
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index bcbe9ee2cdaf..6201bfb1405e 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -2,6 +2,7 @@
>   /*
>    * Copyright (c) 2015, The Linux Foundation. All rights reserved.
>    * Copyright (c) 2022 Linaro Ltd
> + * Copyright (c) 2023, Qualcomm Innovation Center, Inc. All rights reserved.

I wonder whether a single define is copyrightable.

>    * Author: Krzysztof Kozlowski <krzk@kernel.org> based on previous work of Kumar Gala.
>    */
>   #ifndef _DT_BINDINGS_ARM_QCOM_IDS_H
> @@ -259,6 +260,7 @@
>   #define QCOM_ID_IPQ5312			594
>   #define QCOM_ID_IPQ5302			595
>   #define QCOM_ID_IPQ5300			624
> +#define QCOM_ID_SM4450			568
>   
>   /*
>    * The board type and revision information, used by Qualcomm bootloaders and

-- 
With best wishes
Dmitry

