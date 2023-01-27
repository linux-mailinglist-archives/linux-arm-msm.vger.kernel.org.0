Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A2E9867E4CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Jan 2023 13:12:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233691AbjA0MMf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Jan 2023 07:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232321AbjA0MMS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Jan 2023 07:12:18 -0500
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD49280159
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:39 -0800 (PST)
Received: by mail-lj1-x232.google.com with SMTP id c3so5335148ljh.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Jan 2023 04:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+yWMNM6AGMiV4ErCsSEpF9hQ0sDfKpsA/Kfhm10d+WY=;
        b=e3jvv410VqkFZKxI178+7rLi06UNBiPeR4LbMTj8lS2UliFzMBBQrIshBnzOmalOuV
         4wJ70GSQ5k7w3KBXSpnTH4oWJSSMX3n5gBklG8AcP7e1Jv1GtdFLzlIC/miQ/KV6rx0W
         kEut85r4UvChkffE4SMvRoF+LhuCrYFCnNG3rfjarBDgdskxM9r44HiDdq0ixlute8Bl
         VcydyxFjE3VRlQt+X9zZxNMdpszuHFHo6Ci8c3jUATSpGuESDe60z0BJINyqEZd8Ey/e
         7JitpR5Z3ch/8iOhgl1kZzoUK9XYvzyD7GT9LMbh7A+OvRSjUfuN4WuOVZmlJIRus+NH
         o1ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+yWMNM6AGMiV4ErCsSEpF9hQ0sDfKpsA/Kfhm10d+WY=;
        b=CR4RFscdqxpPERqXVA2qNr6lMaGnZO9k0LvoKFk5yhtVYR0rpCKFvu2qY4BBpgRvmA
         g+eoa4DJOqfJHUbL5CG4YtD6Ei9pAHnKWac0Rtb7FDoQ/WkZyXURcgD47yTAah+GrUNf
         M0JeCpkPShRdHD7nC/BhkTwwOUY4wtu3Ai4t7tnfmL5/QB2+/FpC/mC0lY/rD7mBh3x5
         kkXOIvRe41ey2kcF9UL1V5bvcYbWhenlemPeqTBWnY/AGun9OaxsmIHep9C7BaZ79f60
         sVRB0+/725JGDYPyAau7t6q5oPIL+8JEZCe1zQalPzt3nxyuL+ZL5vt6DjYcg9E3tYed
         bimg==
X-Gm-Message-State: AO0yUKUwtNkttaQvpn0fDmKIPCi/JkiAwa5DRW4BI7m8wBcgpjI0vUE4
        XIR2ZcNgluLLC+mSrOX0D1QvXL2oXTJtg0/j
X-Google-Smtp-Source: AK7set/StpXwIge8xiM2pDM6CeP+nm68GszLmrtstMamg6WiBhnnPSSFwXGRskUZzwef1beNqyQ67Q==
X-Received: by 2002:a17:907:77cf:b0:87b:d4e8:5f9a with SMTP id kz15-20020a17090777cf00b0087bd4e85f9amr1538439ejc.50.1674820679047;
        Fri, 27 Jan 2023 03:57:59 -0800 (PST)
Received: from [192.168.1.101] (abyl20.neoplus.adsl.tpnet.pl. [83.9.31.20])
        by smtp.gmail.com with ESMTPSA id hw19-20020a170907a0d300b0080c433a9eeesm2047167ejc.182.2023.01.27.03.57.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:57:58 -0800 (PST)
Message-ID: <57017ca1-89c0-9173-951c-375d3ae23d5d@linaro.org>
Date:   Fri, 27 Jan 2023 12:57:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH 11/11] arm64: dts: qcom: sm8450: align RPMh regulator
 nodes with bindings
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230127114347.235963-1-krzysztof.kozlowski@linaro.org>
 <20230127114347.235963-11-krzysztof.kozlowski@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230127114347.235963-11-krzysztof.kozlowski@linaro.org>
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



On 27.01.2023 12:43, Krzysztof Kozlowski wrote:
> Device node names should be generic and bindings expect certain pattern
> for RPMh regulator nodes.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  arch/arm64/boot/dts/qcom/sm8450-hdk.dts                 | 8 ++++----
>  arch/arm64/boot/dts/qcom/sm8450-qrd.dts                 | 8 ++++----
>  arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi | 8 ++++----
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> index 5bdc2c1159ae..feef3837e4cd 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-hdk.dts
> @@ -99,7 +99,7 @@ vph_pwr: vph-pwr-regulator {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -190,7 +190,7 @@ vreg_l9b_1p2: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -303,7 +303,7 @@ vreg_l13c_3p0: ldo13 {
>  		};
>  	};
>  
> -	pm8450-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8450-rpmh-regulators";
>  		qcom,pmic-id = "h";
>  
> @@ -346,7 +346,7 @@ vreg_l3h_0p91: ldo3 {
>  
>  	};
>  
> -	pmr735a-rpmh-regulators {
> +	regulators-3 {
>  		compatible = "qcom,pmr735a-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> index 134ffdfc2c63..f7592946c783 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> +++ b/arch/arm64/boot/dts/qcom/sm8450-qrd.dts
> @@ -39,7 +39,7 @@ vph_pwr: vph-pwr-regulator {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -130,7 +130,7 @@ vreg_l9b_1p2: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -242,7 +242,7 @@ vreg_l13c_3p0: ldo13 {
>  		};
>  	};
>  
> -	pm8450-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8450-rpmh-regulators";
>  		qcom,pmic-id = "h";
>  
> @@ -285,7 +285,7 @@ vreg_l3h_0p91: ldo3 {
>  
>  	};
>  
> -	pmr735a-rpmh-regulators {
> +	regulators-3 {
>  		compatible = "qcom,pmr735a-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
> diff --git a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> index 53d0ee2dbfa9..5be52468489b 100644
> --- a/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara.dtsi
> @@ -116,7 +116,7 @@ vph_pwr: vph-pwr-regulator {
>  };
>  
>  &apps_rsc {
> -	pm8350-rpmh-regulators {
> +	regulators-0 {
>  		compatible = "qcom,pm8350-rpmh-regulators";
>  		qcom,pmic-id = "b";
>  
> @@ -212,7 +212,7 @@ pm8350_l9: ldo9 {
>  		};
>  	};
>  
> -	pm8350c-rpmh-regulators {
> +	regulators-1 {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
>  
> @@ -348,7 +348,7 @@ pm8350c_l13: ldo13 {
>  		};
>  	};
>  
> -	pm8450-rpmh-regulators {
> +	regulators-2 {
>  		compatible = "qcom,pm8450-rpmh-regulators";
>  		qcom,pmic-id = "h";
>  
> @@ -392,7 +392,7 @@ pm8450_l3: ldo3 {
>  		};
>  	};
>  
> -	pmr735a-rpmh-regulators {
> +	regulators-3 {
>  		compatible = "qcom,pmr735a-rpmh-regulators";
>  		qcom,pmic-id = "e";
>  
