Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2151671FD00
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jun 2023 11:04:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbjFBJEK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 2 Jun 2023 05:04:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234215AbjFBJDg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 2 Jun 2023 05:03:36 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9491BB
        for <linux-arm-msm@vger.kernel.org>; Fri,  2 Jun 2023 02:03:11 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b1b30445cfso1777431fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 02 Jun 2023 02:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685696589; x=1688288589;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MMqft5QGJ2ChTfNlTE00+D8t4gQU58aT8iJLl4iVFd0=;
        b=BYE4meAc4iz7CohYKzS+RwySBrxVQyApyUm6WD4aswrFOgMzLOTRJ/IdszEPoh7Gca
         nKPzcYMgceq8G1EVw2i2a3rJkZJ720On7UcPhcrMHV3OoyWVVou60dcPjt1YAgQ9+leY
         11PLkiUHtmrVVKi7i5aj5N0/oNTcSIczeZ5EM6Ueor8yTFcXA5/6G5DxrtDbeofPUFI9
         KsWr749NlrCG11t/aKej4TGFTtTlo7CyFHg2L6GBywZBpAanxaiLM6rGxwMES73ZFvT3
         QO8R21eYbT32cxl1harGstLdKxYOUu0ySUsMOXiO2p+V77a18zhWDMQWMZhn3zWk5DUh
         zHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685696589; x=1688288589;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MMqft5QGJ2ChTfNlTE00+D8t4gQU58aT8iJLl4iVFd0=;
        b=gRAy54A1lUjhngRr46eITmoYYuvjuSK4shYuj695nqLtm1RWEi3eXFoePMl2EMfYg8
         3Yv3HD+4iYHYJ7xY4uZoUXqF7SdWd0IqnoTYPAanDj2tPxsYua+1U6iBXsRQHCne7VIq
         QZM1OIPl5TyGhPl0B+ZfQ52CvITrAYQhI9gL+DdBHW9ydb1v30E+sCtqxidexAKWrhxP
         PtzaXYQHKXeygI5e8HqUlhvB9MIxf/2NGj9Uw0AFrFjtiqxxbbMylgo0tzG8QKCdnPSi
         39Iq/ylXTUgrFPKZQStXpMSPeyqk6VCycf7g++xft254x4J2LTPdjpLBPPYx/ctvFV+K
         6tJA==
X-Gm-Message-State: AC+VfDxd3vbmPQMMR1T4S439mAgPizUk6XP5+jydtNf9BoxKhAtP7ce8
        6nfviOMZxMlHB5NcogHYz/33K+IrBg2IIYrsFoI=
X-Google-Smtp-Source: ACHHUZ670TCm1yri+AFgMa4J+Qod/EP9yPLKrkWzxCc6QXuMrn2JZSOWdNXE/fHCzYzJabJsI6Mc+A==
X-Received: by 2002:a2e:8502:0:b0:2ad:dd7e:6651 with SMTP id j2-20020a2e8502000000b002addd7e6651mr1233476lji.43.1685696589516;
        Fri, 02 Jun 2023 02:03:09 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
        by smtp.gmail.com with ESMTPSA id n21-20020a2e82d5000000b002a8c1462ecbsm145185ljh.137.2023.06.02.02.03.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Jun 2023 02:03:09 -0700 (PDT)
Message-ID: <cde4aaba-cd4e-30fb-fdc3-d5092abbf55a@linaro.org>
Date:   Fri, 2 Jun 2023 11:03:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 4/8] pinctrl: qcom: drop unneeded GPIOLIB dependency
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230601152026.1182648-1-krzysztof.kozlowski@linaro.org>
 <20230601152026.1182648-4-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601152026.1182648-4-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1.06.2023 17:20, Krzysztof Kozlowski wrote:
> PINCTRL_MSM depends on GPIOLIB, thus individual driver entries depending
> on the first do not have to depend on the latter.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/pinctrl/qcom/Kconfig | 22 ++++++++--------------
>  1 file changed, 8 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/pinctrl/qcom/Kconfig b/drivers/pinctrl/qcom/Kconfig
> index b03a62ecdc07..2236bdff7e60 100644
> --- a/drivers/pinctrl/qcom/Kconfig
> +++ b/drivers/pinctrl/qcom/Kconfig
> @@ -121,7 +121,7 @@ config PINCTRL_MSM8960
>  
>  config PINCTRL_MDM9607
>  	tristate "Qualcomm 9607 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on PINCTRL_MSM
>  	help
>  	  This is the pinctrl, pinmux, pinconf and gpiolib driver for the
> @@ -271,7 +271,7 @@ config PINCTRL_QCOM_SSBI_PMIC
>  
>  config PINCTRL_QDU1000
>  	tristate "Qualcomm Technologies Inc QDU1000/QRU1000 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -310,7 +310,6 @@ config PINCTRL_SC7280
>  
>  config PINCTRL_SC7280_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SC7280 LPASS LPI pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_LPASS_LPI
>  	help
> @@ -380,7 +379,7 @@ config PINCTRL_SDX55
>  
>  config PINCTRL_SDX65
>          tristate "Qualcomm Technologies Inc SDX65 pin controller driver"
> -        depends on GPIOLIB && OF
> +        depends on OF
>          depends on ARM || COMPILE_TEST
>          depends on PINCTRL_MSM
>          help
> @@ -390,7 +389,7 @@ config PINCTRL_SDX65
>  
>  config PINCTRL_SDX75
>          tristate "Qualcomm Technologies Inc SDX75 pin controller driver"
> -        depends on GPIOLIB && OF
> +        depends on OF
>          depends on ARM64 || COMPILE_TEST
>          depends on PINCTRL_MSM
>          help
> @@ -400,7 +399,7 @@ config PINCTRL_SDX75
>  
>  config PINCTRL_SM6115
>  	tristate "Qualcomm Technologies Inc SM6115,SM4250 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -420,7 +419,7 @@ config PINCTRL_SM6125
>  
>  config PINCTRL_SM6350
>  	tristate "Qualcomm Technologies Inc SM6350 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -430,7 +429,7 @@ config PINCTRL_SM6350
>  
>  config PINCTRL_SM6375
>  	tristate "Qualcomm Technologies Inc SM6375 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -470,7 +469,6 @@ config PINCTRL_SM8250
>  
>  config PINCTRL_SM8250_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SM8250 LPASS LPI pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_LPASS_LPI
>  	help
> @@ -489,7 +487,7 @@ config PINCTRL_SM8350
>  
>  config PINCTRL_SM8450
>  	tristate "Qualcomm Technologies Inc SM8450 pin controller driver"
> -	depends on GPIOLIB && OF
> +	depends on OF
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -499,7 +497,6 @@ config PINCTRL_SM8450
>  
>  config PINCTRL_SM8450_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SM8450 LPASS LPI pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_LPASS_LPI
>  	help
> @@ -509,7 +506,6 @@ config PINCTRL_SM8450_LPASS_LPI
>  
>  config PINCTRL_SC8280XP_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SC8280XP LPASS LPI pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_LPASS_LPI
>  	help
> @@ -519,7 +515,6 @@ config PINCTRL_SC8280XP_LPASS_LPI
>  
>  config PINCTRL_SM8550
>  	tristate "Qualcomm Technologies Inc SM8550 pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_MSM
>  	help
> @@ -529,7 +524,6 @@ config PINCTRL_SM8550
>  
>  config PINCTRL_SM8550_LPASS_LPI
>  	tristate "Qualcomm Technologies Inc SM8550 LPASS LPI pin controller driver"
> -	depends on GPIOLIB
>  	depends on ARM64 || COMPILE_TEST
>  	depends on PINCTRL_LPASS_LPI
>  	help
