Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CB6EE6DE530
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Apr 2023 22:00:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229593AbjDKUAD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Apr 2023 16:00:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjDKUAC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Apr 2023 16:00:02 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E6B84690
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:59:57 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id e3so953787ljn.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Apr 2023 12:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681243195;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UOnv27oAzzr2T2qTyawJ8DpSDdV/ZA6ea5Exe/TMRJ0=;
        b=hHq85MqWShgOf2+7bKqcWB09t9Z7Mf8yB7XF1IEyDVAZIgMa7jJhtiyilzulSUJUaW
         n83nFUpOqH0w09O4t/XzH/DpD+jFM6fVJOaCq135IfO23znHeNZ6I7BNg3kyF/mCBKLb
         JUBXR212oHVGhjzgk1qrovWWg/Vef27z6K23P9vlc1GV6/s87eFdpET3CH6UIuyQi+qI
         otcf5g94EbDGbO9HeJmAY0aepf4SzsPOAefefnNA9gqSjZy6M/a2y2cCw49q0pjQ9OYA
         OuyhrsEEjOyzw6wa7xmD/6Jkn8U2AnHAp22fT/+cqqlNK+aU2lPpWdvc2Mlke6S6Zat9
         wwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681243195;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UOnv27oAzzr2T2qTyawJ8DpSDdV/ZA6ea5Exe/TMRJ0=;
        b=3KC+5+nzsaz+JqJg0bNTKB5U0lqy8UkRPqkmjfMs2q7jrPvXOkB3aOUGcdMf4FJKFp
         gQ4yOMrNSBHVgKYW4vSDdhrOWSFruUChAafEqjA6182BUTJc2YrbHBRoILwgqwheKAYU
         iJeKc0ZAFFh9HxRb97KSDOnJwm4aQ3/BN75YPCEws2oqUwg9U8Wgx8XdfT0GCZQ59RjL
         ez7t3jFk9LvaYxoCzOgt308ztVCuMgLKeva4SzEscVv0/W38gwWJsbTAbaaN2KXO7xLS
         O29BTtbG1QRLsu2j7n9YJ0oB6jk9TjBEWlQe8aMzVvQAxSN/PBpnfIEbaLglKWtOdBw3
         ZGkg==
X-Gm-Message-State: AAQBX9fE8b/3VPx3J6c/Pic5q0ZKFRFSzFRXT+GVlgWB6wOCs0piFffd
        IsrFfpx7XP6/jDGsv9MvDYJalg==
X-Google-Smtp-Source: AKy350Ylxcri9P2B81aM/9JqwvEkpEaIFpOWLxdSaZWziuB+axAWyY/sGKvFIYKepFVdMhHycljxyQ==
X-Received: by 2002:a2e:9d49:0:b0:298:b335:de49 with SMTP id y9-20020a2e9d49000000b00298b335de49mr3329400ljj.25.1681243195720;
        Tue, 11 Apr 2023 12:59:55 -0700 (PDT)
Received: from [192.168.1.101] (abxj23.neoplus.adsl.tpnet.pl. [83.9.3.23])
        by smtp.gmail.com with ESMTPSA id f7-20020a2e9e87000000b002a6168181d7sm2936579ljk.7.2023.04.11.12.59.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Apr 2023 12:59:55 -0700 (PDT)
Message-ID: <45ce0cf4-b00a-6309-616f-d8dd8cb91c2e@linaro.org>
Date:   Tue, 11 Apr 2023 21:59:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 3/3] ARM: dts: qcom: msm8974: remove superfluous
 "input-enable"
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230410181005.25853-1-krzysztof.kozlowski@linaro.org>
 <20230410181005.25853-3-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230410181005.25853-3-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10.04.2023 20:10, Krzysztof Kozlowski wrote:
> Pin configuration property "input-enable" was used with the intention to
> disable the output, but this is done by default by Linux drivers.  Since
> patch ("dt-bindings: pinctrl: qcom: tlmm should use output-disable, not
> input-enable") the property is not accepted anymore.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts      | 2 --
>  arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi         | 1 -
>  arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts           | 1 -
>  arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts            | 4 ----
>  .../boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts   | 1 -
>  5 files changed, 9 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> index ab35f2d644c0..861695cecf84 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -592,7 +592,6 @@ mpu6515_pin: mpu6515-state {
>  		pins = "gpio73";
>  		function = "gpio";
>  		bias-disable;
> -		input-enable;
>  	};
>  
>  	touch_pin: touch-state {
> @@ -602,7 +601,6 @@ int-pins {
>  
>  			drive-strength = <2>;
>  			bias-disable;
> -			input-enable;
>  		};
>  
>  		reset-pins {
> diff --git a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> index d3bec03b126c..68a2f9094e53 100644
> --- a/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -433,7 +433,6 @@ ts_int_pin: touch-int-state {
>  		function = "gpio";
>  		drive-strength = <2>;
>  		bias-disable;
> -		input-enable;
>  	};
>  
>  	sdc1_on: sdc1-on-state {
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> index 8d2a054d8fee..8230d0e1d95d 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-oneplus-bacon.dts
> @@ -461,7 +461,6 @@ int-pins {
>  			function = "gpio";
>  			drive-strength = <2>;
>  			bias-disable;
> -			input-enable;
>  		};
>  
>  		reset-pins {
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> index b9698ffb66ca..eb505d6d7f31 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-samsung-klte.dts
> @@ -704,7 +704,6 @@ hostwake-pins {
>  			pins = "gpio75";
>  			function = "gpio";
>  			drive-strength = <16>;
> -			input-enable;
>  		};
>  
>  		devwake-pins {
> @@ -760,14 +759,12 @@ cmd-data-pins {
>  	i2c_touchkey_pins: i2c-touchkey-state {
>  		pins = "gpio95", "gpio96";
>  		function = "gpio";
> -		input-enable;
>  		bias-pull-up;
>  	};
>  
>  	i2c_led_gpioex_pins: i2c-led-gpioex-state {
>  		pins = "gpio120", "gpio121";
>  		function = "gpio";
> -		input-enable;
>  		bias-pull-down;
>  	};
>  
> @@ -781,7 +778,6 @@ gpioex_pin: gpioex-state {
>  	wifi_pin: wifi-state {
>  		pins = "gpio92";
>  		function = "gpio";
> -		input-enable;
>  		bias-pull-down;
>  	};
>  
> diff --git a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> index 04bc58d87abf..0f650ed31005 100644
> --- a/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -631,7 +631,6 @@ ts_int_pin: ts-int-pin-state {
>  		function = "gpio";
>  		drive-strength = <2>;
>  		bias-disable;
> -		input-enable;
>  	};
>  
>  	bt_host_wake_pin: bt-host-wake-state {
