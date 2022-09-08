Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8871A5B1B0B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Sep 2022 13:14:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIHLOe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Sep 2022 07:14:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229708AbiIHLOd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Sep 2022 07:14:33 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4E3C410A9
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Sep 2022 04:14:30 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id x14so11781727lfu.10
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Sep 2022 04:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=lOTUL/dGX2qPnIqVnwqCm/JY0MdVEu1ffIFeANierVc=;
        b=NX7So7RqwuHTuhro/7Y2amMeoTl8U7qDm58/rnMgnh0JXl2yypGWS7ZCmEiSoebmOM
         xsmcTXEoSwGvPogukmTIO1NSa0d0Qc0UFbvjBCy/er+bBz/4GsqvJ5tkGLXlUZANpNku
         Jtqnszc3V7nGQsxhaLeT8DB1MfcB3kBZq5JtmCxlQDU0Au3qhj3DaZJe41fy4e5HkjY/
         HoV2MuTSJnBOfx4RYVLvnT361S9krAm2UQC8AGht8Hb2Ba6tkq9LMOPxyjOX813RW5E/
         5w/16BXUeBpOMLjfpA0qjB1x62w7fQP0R1Jk46nDu1WmI5g5vX0ZYkDMr2NFiGt3qeqi
         kmyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=lOTUL/dGX2qPnIqVnwqCm/JY0MdVEu1ffIFeANierVc=;
        b=kbACaLeZZ/dIBLazTMZt3JeowpL7bJPKDEq3IIYtsGQUAocUdA6GnO+0WRwOe5zxmc
         u6Js71w3vOD/9sKTe7yWvzzUb/nri35J9tzHCvAJ5jN13USG0pOj2c4Ky89uD1UFK0RP
         DJLHd8+syDX9ouD4ghlXE2cROqOJZ94gebPxNGgYKpPk+Fyee+mKs+w7CcE+/wCXOfyc
         JJ2EBK3L0y5AiKvzoq2EzzVK0wPfNxlZsB4uA89tThwtOr4Wb1XiG+NWyky488HqM+OL
         1tU77hBMu4L1Q3i0vr3AFKJSWccqnVeYx8+j7+q/zAvSlYnaZab246f2sY2o+vMcv4mC
         D6TQ==
X-Gm-Message-State: ACgBeo1TBmwob4AAIU/OVHhZfROI1LRoiEh1MJcP+rVxCfHzfqwt1gRZ
        1kzYQhe35CQD4EST4kW9p7EZeQ==
X-Google-Smtp-Source: AA6agR6ebzXGdrPSFf63QuBPnJL4RLwLE7F1HkNbloP41rBlJpnREYtrcdAFYLV3eEsjjIT3cWEs9g==
X-Received: by 2002:a05:6512:1585:b0:494:9fd0:2ca with SMTP id bp5-20020a056512158500b004949fd002camr2454869lfb.439.1662635668679;
        Thu, 08 Sep 2022 04:14:28 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id v8-20020a056512348800b0048b256bb005sm3007314lfr.49.2022.09.08.04.14.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 Sep 2022 04:14:27 -0700 (PDT)
Message-ID: <2b809e98-85ea-6ad9-e810-106563937ddc@linaro.org>
Date:   Thu, 8 Sep 2022 13:14:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH 2/4] pinctrl: qcom: spmi-gpio: Fix the GPIO strength
 mapping
Content-Language: en-US
To:     Anjelique Melendez <quic_amelende@quicinc.com>, agross@kernel.org,
        bjorn.andersson@linaro.org, linus.walleij@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     konrad.dybcio@somainline.org, linux-arm-msm@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anirudh Ghayal <quic_aghayal@quicinc.com>
References: <20220907201528.9351-1-quic_amelende@quicinc.com>
 <20220907201528.9351-3-quic_amelende@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220907201528.9351-3-quic_amelende@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/09/2022 22:15, Anjelique Melendez wrote:
> From: Anirudh Ghayal <quic_aghayal@quicinc.com>
> 
> The SPMI based PMICs have the HIGH and LOW GPIO output
> strength mappings interchanged, fix them.
> 
> Keep the mapping same for older SSBI based PMICs.
> 
> CRs-Fixed: 2246473

What is this tag about?

> Signed-off-by: Anirudh Ghayal <quic_aghayal@quicinc.com>
> Signed-off-by: Anjelique Melendez <quic_amelende@quicinc.com>
> ---
>  drivers/pinctrl/qcom/pinctrl-spmi-gpio.c     | 2 +-
>  drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c     | 4 ++--
>  include/dt-bindings/pinctrl/qcom,pmic-gpio.h | 9 +++++++--
>  3 files changed, 10 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> index cf6b6047de8d..fceccf1ec099 100644
> --- a/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-spmi-gpio.c
> @@ -525,7 +525,7 @@ static int pmic_gpio_config_set(struct pinctrl_dev *pctldev, unsigned int pin,
>  			pad->pullup = arg;
>  			break;
>  		case PMIC_GPIO_CONF_STRENGTH:
> -			if (arg > PMIC_GPIO_STRENGTH_LOW)
> +			if (arg > PMIC_GPIO_STRENGTH_HIGH)
>  				return -EINVAL;
>  			pad->strength = arg;
>  			break;
> diff --git a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> index 1b41adda8129..0f96d130813b 100644
> --- a/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> +++ b/drivers/pinctrl/qcom/pinctrl-ssbi-gpio.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  /*
>   * Copyright (c) 2015, Sony Mobile Communications AB.
> - * Copyright (c) 2013, The Linux Foundation. All rights reserved.
> + * Copyright (c) 2013, 2018 The Linux Foundation. All rights reserved.
>   */
>  
>  #include <linux/module.h>
> @@ -371,7 +371,7 @@ static int pm8xxx_pin_config_set(struct pinctrl_dev *pctldev,
>  			banks |= BIT(0);
>  			break;
>  		case PM8XXX_QCOM_DRIVE_STRENGH:
> -			if (arg > PMIC_GPIO_STRENGTH_LOW) {
> +			if (arg > PM8921_GPIO_STRENGTH_LOW) {
>  				dev_err(pctrl->dev, "invalid drive strength\n");
>  				return -EINVAL;
>  			}
> diff --git a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> index e5df5ce45a0f..950be952ad3e 100644
> --- a/include/dt-bindings/pinctrl/qcom,pmic-gpio.h
> +++ b/include/dt-bindings/pinctrl/qcom,pmic-gpio.h

You cannot mix bindings with driver. This is an ABI break.
> @@ -12,9 +12,14 @@
>  #define PMIC_GPIO_PULL_UP_1P5_30	3
>  
>  #define PMIC_GPIO_STRENGTH_NO		0
> -#define PMIC_GPIO_STRENGTH_HIGH		1
> +#define PMIC_GPIO_STRENGTH_LOW		1
>  #define PMIC_GPIO_STRENGTH_MED		2
> -#define PMIC_GPIO_STRENGTH_LOW		3
> +#define PMIC_GPIO_STRENGTH_HIGH		3

Didn't you just break all DTSes in the world?

Best regards,
Krzysztof
