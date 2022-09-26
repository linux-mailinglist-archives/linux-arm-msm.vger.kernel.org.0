Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 368CA5E9C76
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 Sep 2022 10:51:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233680AbiIZIvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 26 Sep 2022 04:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229613AbiIZIvG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 26 Sep 2022 04:51:06 -0400
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 872BD2183D
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:51:04 -0700 (PDT)
Received: by mail-wr1-x42c.google.com with SMTP id cc5so9082168wrb.6
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 Sep 2022 01:51:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date;
        bh=23K9mktk1PipGt+2cteektluJX33ahCAvQ1DGF6APT4=;
        b=JmssjflPqoPY9anMurCZuqhieS6y3ia/3PGdGODIDzU05ComsQHirsz6xrCPfNV7zx
         wtx3/hpTVAIoaf6w/0QCt824bChE8DApjkS+ughVXtMNqa+/betw0/t5r5oR5uhGtA70
         9WwbTcOyi0rs8EmJlrsL6YerHYyJnGN2nluKPDvta1S7Nb+4dDYq80UTGFHpc0Yl27p7
         UloD8hS8ZSN1Xa2MBIA1iU3pHp437ZUug7bz8wxg7O9uDuMigCZjp7VX0zNqPIhb8BOy
         d4jISGb3wDMfsqEGmCKF6yw4IjO9DFtyjhiXnJT5Wc2NmLxoWaV1GYW/QTcZNnfqfF+l
         VV6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:from:reply-to
         :references:cc:to:content-language:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date;
        bh=23K9mktk1PipGt+2cteektluJX33ahCAvQ1DGF6APT4=;
        b=oLFyyLzsnue6bn4djXLXjIb84tyBDxAqqdVx6h+bXedrozlSBB/dz7ZvoMUhSQJ49J
         eqOX+7bmaed6jxyaqlXhNPndZOXC9qjCoqoe/J1CGl5zP/x5IMtYqRlyoWSCQh90iLoJ
         2wuHPs4c/kLNaGlNBraXQrFP8rI77/xQbgddt0R3PFLcTr5B2r8tad8BILXNbSPPlF20
         tNdG05dnrSSoPRF6i2WcJKVdYExCYxTzuKhzKJryKg1LuXlcwrBRqn4hl8NCFfpX895f
         1t04XMMPc3Qh9UYrGFp7FB/bAFcOLbqjUUxcxqoGSAjLPPA5ypb7+0Sv0CF8O6TSsOnU
         pmrQ==
X-Gm-Message-State: ACrzQf0h2NFV5w7zX6xArD2E7cegPR7EtqPAmkdDMnvdxF/naTH3zBmV
        Lho6xsJE6VlHmq0aWI9sMAw/Og==
X-Google-Smtp-Source: AMsMyM50EBUEmT0EBoFm8XVGuuN4X5dJUr4H1dnP3Kz+Hi9L3OwRFxsgT9Sn8oqcDVZvLh+FH/p1WA==
X-Received: by 2002:a05:6000:1cc:b0:22a:e8c6:9f57 with SMTP id t12-20020a05600001cc00b0022ae8c69f57mr12101861wrx.527.1664182263030;
        Mon, 26 Sep 2022 01:51:03 -0700 (PDT)
Received: from [192.168.27.65] (home.beaume.starnux.net. [82.66.176.246])
        by smtp.gmail.com with ESMTPSA id f13-20020a05600c4e8d00b003b33de17577sm11880036wmq.13.2022.09.26.01.50.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Sep 2022 01:51:02 -0700 (PDT)
Message-ID: <b0f42da0-c302-dd95-8fd7-95f125a9d4f2@linaro.org>
Date:   Mon, 26 Sep 2022 10:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] ARM: dts: qcom: msm8974-sony-*: fix multi-led node name
Content-Language: en-US
To:     Luca Weiss <luca@z3ntu.xyz>, linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220925175631.103535-1-luca@z3ntu.xyz>
Reply-To: neil.armstrong@linaro.org
From:   Neil Armstrong <neil.armstrong@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <20220925175631.103535-1-luca@z3ntu.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/09/2022 19:56, Luca Weiss wrote:
> The name rgb-led is not allowed, multi-led is supposed to be used.
> 
> <snip>/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine-amami.dtb: pm8941@1: pwm: 'rgb-led' does not match any of the regexes: '^led@[0-9a-f]$', 'pinctrl-[0-9]+'
>          From schema: <snip>/Documentation/devicetree/bindings/mfd/qcom,spmi-pmic.yaml
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
>   arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi           | 2 +-
>   .../arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> index 5a70683d9103..c1d97190ea71 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -178,7 +178,7 @@ &pm8941_lpg {
>   
>   	qcom,power-source = <1>;
>   
> -	rgb-led {
> +	multi-led {
>   		color = <LED_COLOR_ID_RGB>;
>   		function = LED_FUNCTION_STATUS;
>   
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> index 85348562e861..94daa1a3240a 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -295,7 +295,7 @@ &pm8941_lpg {
>   
>   	qcom,power-source = <1>;
>   
> -	rgb-led {
> +	multi-led {
>   		color = <LED_COLOR_ID_RGB>;
>   		function = LED_FUNCTION_STATUS;
>   

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
