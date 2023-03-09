Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 72F136B2B5C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Mar 2023 18:01:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230197AbjCIRBC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Mar 2023 12:01:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230389AbjCIRAi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Mar 2023 12:00:38 -0500
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C19B7BA03
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Mar 2023 08:55:36 -0800 (PST)
Received: by mail-lf1-x12f.google.com with SMTP id n2so3101107lfb.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Mar 2023 08:55:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678380934;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VjjhDagidkXiUXG5Jce/FoXLHFptfa0y2AClySUBWJ8=;
        b=k5qpGzEMPfid2ioo/4k7mmYyAwmv3kAPATUROLeccW7qdWh9431tpYu3x4CJYM6HVD
         UCd2GybEi0qVERH5ru6Z7mvmefoNMKnpVl+QVIfrF04ynxdlaqq8xgXSFHnnEyaeNhtm
         +bF6xxoMDv85Nbq+OJN/b9xvLYvtxqfzdgqVPLBGicPo9hBd95g1g1RxA0zrgrqD21bH
         2WOt1bdlkSxWGTQZYG9CBWj3J2jHlQ74gT8C1geFhxuVq7eh3r9cpi/mDFnQ5ucMRRR0
         jqPbM+pO4lpK82KKf9YhGC27sdBZ1SVk7LE7ROb6rFnUPWNgLQ/HS5F/z9gtu7WqztTI
         K3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678380934;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VjjhDagidkXiUXG5Jce/FoXLHFptfa0y2AClySUBWJ8=;
        b=SkQde5d02aewoWVt3Q8k33Gd38pDx2lW2xtX0dS08/UctGBtC9S/IedWEz2PAoSlD3
         jUaHu12nLopAW6hDtWBt7lSkVBMbeckfFGg2zjZA8dyjakbALV1XsGIqJTL7OY/7hpZP
         mwnzPhD+NwR9TntaVjI3yGU6cndDSkYz2yAWyKhMDyemKvjUpSerISCLp5xU+zKez4J3
         KaZ+Y88/5Pqfr6SXBugK6fHrohO/770FTNZ349EFhb5Ym1UHi4yD1q+iMfiSxGKVjSHb
         8yKMRwHqsM5bCYl2aD9juvCXgzQ57egcDq6S9Cl7S4DFdre+qCfpJ+bI4tFHmeYXGOjX
         /BFA==
X-Gm-Message-State: AO0yUKXWsNlxlJFRfOz/8IXcDwoZRZxaCztz4sEHVXqG9jLmM8GEwI92
        +3gQqwN7vbx+3Tay6f/TDAET4rjHYksOIrEa7tU=
X-Google-Smtp-Source: AK7set+C5fX3Bp9MnR1lj8Fhv8CUfREtJonZWxNJRZCXx9kzUsjx4jdG2JulkbXwnZgyW0kFAmXjXg==
X-Received: by 2002:ac2:5594:0:b0:4dd:a0f6:8f3b with SMTP id v20-20020ac25594000000b004dda0f68f3bmr6383232lfg.15.1678380934413;
        Thu, 09 Mar 2023 08:55:34 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id w3-20020a2e9983000000b00295b6b7e125sm2980129lji.24.2023.03.09.08.55.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Mar 2023 08:55:33 -0800 (PST)
Message-ID: <d745d337-069e-e9e6-901f-2dacf7b85762@linaro.org>
Date:   Thu, 9 Mar 2023 17:55:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH] arm64: defconfig: enable Qualcomm pin controller drivers
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309155733.662043-1-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230309155733.662043-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 9.03.2023 16:57, Krzysztof Kozlowski wrote:
> Enable pin controller drivers for several Qualcomm SoCs, as they are
> necessary for basic system functionality:
>  - main Top Level Mode Multiplexer as built-in for QDU1000, SDM660,
>    SDM670, SM6125, SM6350 and SM6375.
>  - Low Power Audio (LPASS) TLMM as module for SC7280, SC8280XP, SM8450
>    and SM8550.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/configs/defconfig | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 7790ee42c68a..1d22f1685628 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -556,19 +556,29 @@ CONFIG_PINCTRL_QCM2290=y
>  CONFIG_PINCTRL_QCS404=y
>  CONFIG_PINCTRL_QDF2XXX=y
>  CONFIG_PINCTRL_QCOM_SPMI_PMIC=y
> +CONFIG_PINCTRL_QDU1000=y
>  CONFIG_PINCTRL_SA8775P=y
>  CONFIG_PINCTRL_SC7180=y
>  CONFIG_PINCTRL_SC7280=y
> +CONFIG_PINCTRL_SC7280_LPASS_LPI=m
>  CONFIG_PINCTRL_SC8180X=y
>  CONFIG_PINCTRL_SC8280XP=y
> +CONFIG_PINCTRL_SDM660=y
> +CONFIG_PINCTRL_SDM670=y
>  CONFIG_PINCTRL_SDM845=y
>  CONFIG_PINCTRL_SM6115=y
> +CONFIG_PINCTRL_SM6125=y
> +CONFIG_PINCTRL_SM6350=y
> +CONFIG_PINCTRL_SM6375=y
>  CONFIG_PINCTRL_SM8150=y
>  CONFIG_PINCTRL_SM8250=y
>  CONFIG_PINCTRL_SM8250_LPASS_LPI=m
>  CONFIG_PINCTRL_SM8350=y
>  CONFIG_PINCTRL_SM8450=y
> +CONFIG_PINCTRL_SM8450_LPASS_LPI=m
> +CONFIG_PINCTRL_SC8280XP_LPASS_LPI=m
>  CONFIG_PINCTRL_SM8550=y
> +CONFIG_PINCTRL_SM8550_LPASS_LPI=m
>  CONFIG_PINCTRL_LPASS_LPI=m
>  CONFIG_GPIO_ALTERA=m
>  CONFIG_GPIO_DAVINCI=y
