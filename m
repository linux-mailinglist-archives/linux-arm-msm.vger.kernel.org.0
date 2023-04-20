Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 13B7B6E9106
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Apr 2023 12:53:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235052AbjDTKxC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 20 Apr 2023 06:53:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233992AbjDTKwo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 20 Apr 2023 06:52:44 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E76407D91
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:50:08 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4edbd6cc46bso464332e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Apr 2023 03:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681987787; x=1684579787;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=InyLlK4ZtefcdVP8ZL9xZOCBp894Qu9V02DBGf4WABw=;
        b=hwxCE0kwvpWsmhPDmqhYOWdsEvTGtOMuY9PfG9/0bBzNaMSaIPbHp7grf4S6EUuSgH
         HIQh40NwJcX+xqX/l+oMjW6uj5YaYoLGZ+FOSzT4lqHRa5oW/m62IqHkXUHGNjpgKEoZ
         Wfg8yH0ShGhjLPD7LA25IWjzz7RhDGjOzaH4jVq6+Sr2JDyzuz7tsN5IeNr4wZS4YqOs
         FuzLdXyXq6s1HieL9s5kQ0n3IZIwFOWo3czcw1hhuXSpI+B/hOPDc7X6dJ+Kr8BtC8+H
         h7o+empLmdYjc0kTf039TeD7PSceGZ3ZjUv7LCa3PxO/IpNUm8NWAiN9RM5ghYNa78xt
         QBwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681987787; x=1684579787;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=InyLlK4ZtefcdVP8ZL9xZOCBp894Qu9V02DBGf4WABw=;
        b=lCkv/WZbEEwwoRx7OkFyf9Jd+rGAc0nxfPc6FljmfLznfrn7zRIrqXvq6Spu//E9It
         od7ZNFHxhNhceGzwA3Vp92o0g/kpxa6VfA4L7eeFk75CSpoIirPyfpdEFtKO9nwFQ9pa
         mZQPFp57WLsDJ643ejIdPSd/Qc/frmPmy6HILFakXEWTcQhzkuhHDr993ZFrBiXTchUO
         R6k00pOxyIutLb4fAFrL60IPWdT9Hb4YFu3hEoIkkRNEBMt/NhFbbd0QXCaHen2v2BKV
         P6hbo3wyLEXkCeZjxtSXdkh3Z7RyTpvllWd5bUFesYd+hAc/QRIvjwXYsLWN1HIrHrQE
         aIeg==
X-Gm-Message-State: AAQBX9dXDhkE/x+cl6Z1Rr6QaV7jMLFk8AlWFkXiBsTaNy5fYbq4+b0z
        XZdjQR+kYRsi5gMwvbt7UdAeQg==
X-Google-Smtp-Source: AKy350YSZFVa83jooVWaAgBJ/WWjOs/wEnd2zsHegiDhOqtGMl92F7BKp48PPSVqPUqqkJgLz0LjXg==
X-Received: by 2002:a05:6512:38af:b0:4ed:d216:8217 with SMTP id o15-20020a05651238af00b004edd2168217mr292199lft.11.1681987786777;
        Thu, 20 Apr 2023 03:49:46 -0700 (PDT)
Received: from [192.168.1.101] (abyj144.neoplus.adsl.tpnet.pl. [83.9.29.144])
        by smtp.gmail.com with ESMTPSA id p16-20020a05651211f000b004edc5a39121sm172914lfs.242.2023.04.20.03.49.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Apr 2023 03:49:46 -0700 (PDT)
Message-ID: <686ee776-8f5f-9814-1f89-0ab9f0e7b2b8@linaro.org>
Date:   Thu, 20 Apr 2023 12:49:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH 08/10] ARM: dts: qcom: apq8060-dragonboard: move
 regulators out of simple-bus
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230420075053.41976-1-krzysztof.kozlowski@linaro.org>
 <20230420075053.41976-8-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230420075053.41976-8-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.8 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 20.04.2023 09:50, Krzysztof Kozlowski wrote:
> Regulators is not a bus, so drop incomplete simple-bus usage to fix dtbs
> W=1 warnings:
> 
>   Warning (simple_bus_reg): /regulators/regulator-fixed: missing or empty reg/ranges property
>   Warning (simple_bus_reg): /regulators/xc622a331mrg: missing or empty reg/ranges property
>   Warning (simple_bus_reg): /regulators/nds332p: missing or empty reg/ranges property
>   Warning (simple_bus_reg): /regulators/txb0104rgyr: missing or empty reg/ranges property
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../arm/boot/dts/qcom-apq8060-dragonboard.dts | 80 +++++++++----------
>  1 file changed, 38 insertions(+), 42 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> index 8e4b61e4d4b1..e830cb2395aa 100644
> --- a/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom-apq8060-dragonboard.dts
> @@ -18,50 +18,46 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> -	regulators {
> -		compatible = "simple-bus";
> -
> -		/* Main power of the board: 3.7V */
> -		vph: regulator-fixed {
> -			compatible = "regulator-fixed";
> -			regulator-min-microvolt = <3700000>;
> -			regulator-max-microvolt = <3700000>;
> -			regulator-name = "VPH";
> -			regulator-type = "voltage";
> -			regulator-always-on;
> -			regulator-boot-on;
> -		};
> -
> -		/* GPIO controlled ethernet power regulator */
> -		dragon_veth: xc622a331mrg {
> -			compatible = "regulator-fixed";
> -			regulator-name = "XC6222A331MR-G";
> -			regulator-min-microvolt = <3300000>;
> -			regulator-max-microvolt = <3300000>;
> -			vin-supply = <&vph>;
> -			gpio = <&pm8058_gpio 40 GPIO_ACTIVE_HIGH>;
> -			enable-active-high;
> -			pinctrl-names = "default";
> -			pinctrl-0 = <&dragon_veth_gpios>;
> -			regulator-always-on;
> -		};
> +	/* Main power of the board: 3.7V */
> +	vph: regulator-fixed {
> +		compatible = "regulator-fixed";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-name = "VPH";
> +		regulator-type = "voltage";
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	/* GPIO controlled ethernet power regulator */
> +	dragon_veth: xc622a331mrg {
These names could also be fixed up, but that's for another day..

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
> +		compatible = "regulator-fixed";
> +		regulator-name = "XC6222A331MR-G";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vph>;
> +		gpio = <&pm8058_gpio 40 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dragon_veth_gpios>;
> +		regulator-always-on;
> +	};
>  
> -		/* VDDvario fixed regulator */
> -		dragon_vario: nds332p {
> -			compatible = "regulator-fixed";
> -			regulator-name = "NDS332P";
> -			regulator-min-microvolt = <1800000>;
> -			regulator-max-microvolt = <1800000>;
> -			vin-supply = <&pm8058_s3>;
> -		};
> +	/* VDDvario fixed regulator */
> +	dragon_vario: nds332p {
> +		compatible = "regulator-fixed";
> +		regulator-name = "NDS332P";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&pm8058_s3>;
> +	};
>  
> -		/* This is a levelshifter for SDCC5 */
> -		dragon_vio_txb: txb0104rgyr {
> -			compatible = "regulator-fixed";
> -			regulator-name = "Dragon SDCC levelshifter";
> -			vin-supply = <&pm8058_l14>;
> -			regulator-always-on;
> -		};
> +	/* This is a levelshifter for SDCC5 */
> +	dragon_vio_txb: txb0104rgyr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "Dragon SDCC levelshifter";
> +		vin-supply = <&pm8058_l14>;
> +		regulator-always-on;
>  	};
>  
>  	/*
