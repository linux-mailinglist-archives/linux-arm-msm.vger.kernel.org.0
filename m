Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B7F74677727
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jan 2023 10:12:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231491AbjAWJMs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Jan 2023 04:12:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231764AbjAWJMr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Jan 2023 04:12:47 -0500
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56D141EFFB
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:12:43 -0800 (PST)
Received: by mail-wm1-x334.google.com with SMTP id l41-20020a05600c1d2900b003daf986faaeso7995949wms.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Jan 2023 01:12:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9HNTfqzw5NeSTg0X5X+bWKneGjUVGchDjG1La1o9UE=;
        b=O9yatJLoYM6sBcT9y0pgTb1kx3umeBG6/hRv2TTaRjHU0cXVBWfM98sKnqVMnFa91p
         VDzoA0QkJ/yWvVOJEfWragPf+DzCRH0VJ2zQtA1QCxEUY2IlOtgJ4Y9ejYBXbEWoYEcH
         gsLIvdmBom0pWPWabVdaf8wQqms5nURT6cZS2fHBm0VlrOmV+J0FXQBFsMW41aZQLvUa
         0R6yqfJkccVmyd92EQUnVme/wtpIsKQhixB3izbIk+nljKG3fCeaNGYCywWxiICbGNEC
         gEpeQ2GyghHTZAvuP4GxfJ5f6HJbKF9AJm/ackvhceykovzh2ksFLVWIKVAt6hB71gMD
         dyTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9HNTfqzw5NeSTg0X5X+bWKneGjUVGchDjG1La1o9UE=;
        b=4FWZuZpoyAQTS8bH6DLtFCpIIQGFChnepCgPnny0l4KTbbOy8djPr2mEWz9PqvXz5O
         iMUWDyPRriNbVZeHXO1viR+IeeTvS40RjV/BpMnSoo2E98Llg4ZZhKixz35Sa5t+7DLa
         TYH1R0RxsF0p+zPXKV1++VHXjiCIzXwFD1tzzUdHpKfFUGU/NpXLjaUdiECjLPc7xADB
         CnYehOIi7U735WSzM6cPzgSkEIuNB6HKAwZNeN2kJG3HcAs0lMtREoslhfxwfmF51qgI
         PqId4s2It5buR/DMnH8KJi0Ay1Otn2GTYcZ5rFfpj6Mg6ulaFZEDxqcsJ9a2A65yPrEL
         OLSQ==
X-Gm-Message-State: AFqh2koWrBHaGtQEzGIeGYJHSpvmb0VcVftGUv1hPfmbN0DvmdNE3TP1
        8fC9jNILCXjxlH5Dbzq7XxkHbg==
X-Google-Smtp-Source: AMrXdXvoWqRXGRn5oLCqcHvzSwLGXG+f2hYRbmcP5JneLreUTUsw6hm2JLmWfgrcOXt8gg+xv6yZmA==
X-Received: by 2002:a05:600c:3c83:b0:3d9:e5d3:bf with SMTP id bg3-20020a05600c3c8300b003d9e5d300bfmr23268572wmb.32.1674465161779;
        Mon, 23 Jan 2023 01:12:41 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id z7-20020a1c4c07000000b003d9a86a13bfsm9992309wmf.28.2023.01.23.01.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 01:12:41 -0800 (PST)
Message-ID: <7b3df315-0c26-8928-b4f2-3ead6074a741@linaro.org>
Date:   Mon, 23 Jan 2023 10:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v2 2/2] clk: qcom: Add Global Clock Controller (GCC)
 driver for SM7150
Content-Language: en-US
To:     Danila Tikhonov <danila@jiaxyga.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        David Wronek <davidwronek@gmail.com>
References: <20230122192924.119636-1-danila@jiaxyga.com>
 <20230122192924.119636-3-danila@jiaxyga.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230122192924.119636-3-danila@jiaxyga.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/01/2023 20:29, Danila Tikhonov wrote:
> Add support for the global clock controller found on SM7150
> based devices. This should allow most non-multimedia device
> drivers to probe and control their clocks.
> 
> Co-developed-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: David Wronek <davidwronek@gmail.com>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  drivers/clk/qcom/Kconfig      |    8 +
>  drivers/clk/qcom/Makefile     |    1 +
>  drivers/clk/qcom/gcc-sm7150.c | 3159 +++++++++++++++++++++++++++++++++
>  3 files changed, 3168 insertions(+)
>  create mode 100644 drivers/clk/qcom/gcc-sm7150.c
> 
> diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> index 5ab4b7dfe3c2..a0253d9b5695 100644
> --- a/drivers/clk/qcom/Kconfig
> +++ b/drivers/clk/qcom/Kconfig
> @@ -759,6 +759,14 @@ config SM_GCC_6375
>  	  Say Y if you want to use peripheral devices such as UART,
>  	  SPI, I2C, USB, SD/UFS etc.
>  
> +config SM_GCC_7150
> +	tristate "SM7150 Global Clock Controller"
> +	select QCOM_GDSC
> +	help
> +	  Support for the global clock controller on SM7150 devices.
> +	  Say Y if you want to use peripheral devices such as UART,
> +	  SPI, I2C, USB, SD/UFS, PCIe etc.
> +
>  config SM_GCC_8150
>  	tristate "SM8150 Global Clock Controller"
>  	help
> diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> index 3194465dd02c..9da86c42e7fd 100644
> --- a/drivers/clk/qcom/Makefile
> +++ b/drivers/clk/qcom/Makefile
> @@ -107,6 +107,7 @@ obj-$(CONFIG_SM_GCC_6115) += gcc-sm6115.o
>  obj-$(CONFIG_SM_GCC_6125) += gcc-sm6125.o
>  obj-$(CONFIG_SM_GCC_6350) += gcc-sm6350.o
>  obj-$(CONFIG_SM_GCC_6375) += gcc-sm6375.o
> +obj-$(CONFIG_SM_GCC_7150) += gcc-sm7150.o
>  obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
>  obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
>  obj-$(CONFIG_SM_GCC_8350) += gcc-sm8350.o
> diff --git a/drivers/clk/qcom/gcc-sm7150.c b/drivers/clk/qcom/gcc-sm7150.c
> new file mode 100644
> index 000000000000..05bece700d19
> --- /dev/null
> +++ b/drivers/clk/qcom/gcc-sm7150.c
> @@ -0,0 +1,3159 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2023, Danila Tikhonov <danila@jiaxyga.com>
> + * Copyright (c) 2023, David Wronek <davidwronek@gmail.com>

Include original work copyrights...


Best regards,
Krzysztof

