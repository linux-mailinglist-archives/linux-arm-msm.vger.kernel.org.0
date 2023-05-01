Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EC6536F3137
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 14:51:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232568AbjEAMvU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 1 May 2023 08:51:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232391AbjEAMvT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 1 May 2023 08:51:19 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09B0310EA
        for <linux-arm-msm@vger.kernel.org>; Mon,  1 May 2023 05:51:17 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-4f00d41df22so22360595e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 01 May 2023 05:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682945475; x=1685537475;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GMu9HcQF4QeQEqykNogwvdEMdZ5pVCdj+UzY/Re9IBU=;
        b=tywAK9J6+wYBFwADM2G/bCN6KvbpkTtMLPIWFeGbH264DMGpBqwRndE+GSyBcW6MdP
         lXlUdAyneaJkp9TBwIK3YY+eE67v4mFfVVc4URA/04Zrxcrd2Vm6kmQIVeZAek12a/sE
         q/YmUD+6UWxRommSlxTzRdnFjrYlFIjaWKcfYBNSKZQMWcaxQ80bZJaJnTrN1ktyCGSg
         8KVMFJlU/g9/D9Evo/ZJuu6NHDJoOU5cgLnOSRVjzMqBr5J0sEpCfgb1LKQDFv6ZKMNv
         dGiCI98bSkB1FmaRsR4hjkzB9G2jOilhaa3M2E54iZDB4p62DqFujdVMLW1zAEbEJE1s
         NlzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682945475; x=1685537475;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GMu9HcQF4QeQEqykNogwvdEMdZ5pVCdj+UzY/Re9IBU=;
        b=dABACxgTmbb7wzB/FNZKDJjUAZO4vI0GJu9nFxKJCkIW/hEelA+LHJA/7t6kMFrbwJ
         O8zIBQY7zXCBzfvIsNqjDm0E1pKIu32oABWB8PEc65saBrzyRj1R90gK1QT1KOW4jrHo
         T8Kw8z7s6FrRWX37TSS6O0sTQgTC8Jr3DSXLcv+nLKIaEm4Ikp0ISFK7uY2VCw+2xywg
         KLE/BBVcONqQ9kfXhy659ZnLaIUUpK2g7ydg8QkR68ilFwoMsR3Ss5TH2+uc+9JA5ErP
         mtrjiaH+YgQ8AUzkLjla8gJ97DnC3w3d7t9ea+KDr5yJo/3hIeEWPI1x9rM7LSbGIAW6
         KQ7g==
X-Gm-Message-State: AC+VfDwdBVPXdU8+JG7Of2uaSEOmuRhQpDgZO1Z2Nhb2w5il2zp84W7i
        fLxz0v270tl/U/IHdCIr+bDRM2LbFAq6SdHqY3g=
X-Google-Smtp-Source: ACHHUZ46Mz5GjPEWGs+YeYkWKnwzrRp5Mi5anfIaVJd8IjQr1C7yrdSoZPH0IgAjwO8ac8XefgdW7Q==
X-Received: by 2002:a05:6512:39c8:b0:4eb:1599:f3b7 with SMTP id k8-20020a05651239c800b004eb1599f3b7mr5066308lfu.13.1682945475286;
        Mon, 01 May 2023 05:51:15 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id h26-20020a19701a000000b004eb00c0d417sm4694171lfc.130.2023.05.01.05.51.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 May 2023 05:51:14 -0700 (PDT)
Message-ID: <8feae59c-b762-8cc8-7aa9-237ce4af5b1e@linaro.org>
Date:   Mon, 1 May 2023 14:51:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH 1/2] dt-bindings: arm: qcom,ids: Add IDs for IPQ5018
 family
Content-Language: en-US
To:     Robert Marko <robimarko@gmail.com>, agross@kernel.org,
        andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20230429193336.600629-1-robimarko@gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230429193336.600629-1-robimarko@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 29.04.2023 21:33, Robert Marko wrote:
> Add SOC IDs for the IPQ5018 family.
> 
> Signed-off-by: Robert Marko <robimarko@gmail.com>
> ---
>  include/dt-bindings/arm/qcom,ids.h | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/include/dt-bindings/arm/qcom,ids.h b/include/dt-bindings/arm/qcom,ids.h
> index 802495b20276..c1283bad81e1 100644
> --- a/include/dt-bindings/arm/qcom,ids.h
> +++ b/include/dt-bindings/arm/qcom,ids.h
> @@ -216,6 +216,9 @@
>  #define QCOM_ID_SM8350			439
>  #define QCOM_ID_QCM2290			441
>  #define QCOM_ID_SM6115			444
> +#define QCOM_ID_IPQ5010			446
> +#define QCOM_ID_IPQ5018			447
> +#define QCOM_ID_IPQ5028			448
>  #define QCOM_ID_SC8280XP		449
>  #define QCOM_ID_IPQ6005			453
>  #define QCOM_ID_QRB5165			455
> @@ -229,6 +232,9 @@
>  #define QCOM_ID_SM8450_3		482
>  #define QCOM_ID_SC7280			487
>  #define QCOM_ID_SC7180P			495
> +#define QCOM_ID_IPQ5000			503

> +#define QCOM_ID_IPQ0509			504
> +#define QCOM_ID_IPQ0518			505
Are you sure these names are in tact?

Konrad
>  #define QCOM_ID_SM6375			507
>  #define QCOM_ID_IPQ9514			510
>  #define QCOM_ID_IPQ9550			511
> @@ -236,6 +242,7 @@
>  #define QCOM_ID_IPQ9570			513
>  #define QCOM_ID_IPQ9574			514
>  #define QCOM_ID_SM8550			519
> +#define QCOM_ID_IPQ5016			520
>  #define QCOM_ID_IPQ9510			521
>  #define QCOM_ID_QRB4210			523
>  #define QCOM_ID_QRB2210			524
> @@ -243,6 +250,7 @@
>  #define QCOM_ID_QRU1000			539
>  #define QCOM_ID_QDU1000			545
>  #define QCOM_ID_QDU1010			587
> +#define QCOM_ID_IPQ5019			569
>  #define QCOM_ID_QRU1032			588
>  #define QCOM_ID_QRU1052			589
>  #define QCOM_ID_QRU1062			590
