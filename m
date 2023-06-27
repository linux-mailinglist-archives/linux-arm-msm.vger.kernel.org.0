Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C38873FAD0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231203AbjF0LMa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:12:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjF0LM3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:12:29 -0400
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com [IPv6:2a00:1450:4864:20::235])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FBC81FF3
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:12:27 -0700 (PDT)
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2b69f71a7easo34202031fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687864346; x=1690456346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5IViKxuWkT8R6Vu35gNcwUmh7gpEQM4V6Erd6Xl5M6E=;
        b=oKLRAFEz5YWztwSIBAkDkLOUaoBUXDGfWI61UGclLBWyFEOFUwK+N1igM216z1q9Oe
         v1bPx7fNZlDDeyq5TWfwpwIqiaBsoBiiVB+T0QCD2H5koU/vFOALqIKDhu+bZENIsb7g
         GsY2Rq6GGPVKhMErETNmLM1oUlSJPNfe7s9LLg2M22HiYXQ91ADMXnBwfRKHIguiFcEv
         UJF+EPWUt9fIezRwd2gXBXCQYaB/GZGkqoBLJHT0y8d7IO4VBJwOdpJtuEzFcVE2/1+h
         wZlYORRzHPTcZWEI5pBSNYRaEqAI4muvalG/V1zKwL9i5qMmNmS1TEqH+KDmkRmU2GNU
         tAGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864346; x=1690456346;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5IViKxuWkT8R6Vu35gNcwUmh7gpEQM4V6Erd6Xl5M6E=;
        b=UkJougwkTwX8dspCc/f+6AfWflGrGhw4POIqu1bgm/4QLGB+3TcFb5BZKzxcvbg7h9
         NSPsB3+/AwxLZ9O4MsLIYeuoYrjBJaScRt7l18F16YFBN4WB77vX6ZHwDJUn7YWq0txU
         FZ9bLd5dzJT/APPPZQ7IXYWE68OtEZqEhiBmx7WyR7CpKSQmAuNDt4ZgEiJnPVgejm1f
         YBQgbtb2AVHu6s5q1w1oeKaLGMsoQvE32fFpZBe0CxLQDnkEBdz8xGPE71PO91iHHlw3
         GtyJYwrVRe4au7wDYmMW3IEFqiEuk62/JcX7Q01gRrM0M4P26JXVntCclH0ptELOr0pK
         9lug==
X-Gm-Message-State: AC+VfDwRkFzt2ODyADZiD11tB8ToGsCHThwwUeRoNdxfKodNF4L5UqL5
        8kBZAU2/p64YZnpQwG6lBFccWA==
X-Google-Smtp-Source: ACHHUZ5u1H3czWJQ6OgZSnKfVRQ3/3MufDOFjG+NcBaoOHZVIP8dNJ5WMJNUV00rmYF+cA1JBRLtsw==
X-Received: by 2002:a05:6512:224f:b0:4fb:772a:af17 with SMTP id i15-20020a056512224f00b004fb772aaf17mr3541168lfu.37.1687864345705;
        Tue, 27 Jun 2023 04:12:25 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id q9-20020ac25109000000b004f84372e40csm1471458lfb.179.2023.06.27.04.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:12:25 -0700 (PDT)
Message-ID: <282fb5e7-2713-2f78-75db-917012c0f545@linaro.org>
Date:   Tue, 27 Jun 2023 13:12:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 07/15] ARM: dts: qcom: apq8064: split PMICs to separate
 dtsi files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-8-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-8-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> The PMICs are not a part of the SoC, so move PMICs to separate files and
> include them from the board files.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Please split moving and cleaning up into separate patches.

Also, please consider using interrupts-extended

Konrad
>  arch/arm/boot/dts/qcom/pm8821.dtsi            |  22 +++
>  arch/arm/boot/dts/qcom/pm8921.dtsi            | 126 +++++++++++++++++
>  .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   6 +-
>  .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |   5 +-
>  .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |   5 +-
>  .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |   5 +-
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      | 132 +-----------------
>  7 files changed, 169 insertions(+), 132 deletions(-)
>  create mode 100644 arch/arm/boot/dts/qcom/pm8821.dtsi
>  create mode 100644 arch/arm/boot/dts/qcom/pm8921.dtsi
> 
> diff --git a/arch/arm/boot/dts/qcom/pm8821.dtsi b/arch/arm/boot/dts/qcom/pm8821.dtsi
> new file mode 100644
> index 000000000000..064e3ba54e18
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/pm8821.dtsi
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/* This PMIC is used on a secondary SSBI bus */
> +&ssbi2 {
> +	pm8821: pmic {
> +		compatible = "qcom,pm8821";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pm8821_mpps: mpps@50 {
> +			compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
> +			reg = <0x50>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pm8821_mpps 0 0 4>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/qcom/pm8921.dtsi b/arch/arm/boot/dts/qcom/pm8921.dtsi
> new file mode 100644
> index 000000000000..63e95b56dcf1
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/pm8921.dtsi
> @@ -0,0 +1,126 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +&ssbi {
> +	pm8921: pmic {
> +		compatible = "qcom,pm8921";
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		pwrkey@1c {
> +			compatible = "qcom,pm8921-pwrkey";
> +			reg = <0x1c>;
> +			interrupt-parent = <&pm8921>;
> +			interrupts = <50 IRQ_TYPE_EDGE_RISING>,
> +				     <51 IRQ_TYPE_EDGE_RISING>;
> +			debounce = <15625>;
> +			pull-up;
> +		};
> +
> +		pm8921_mpps: mpps@50 {
> +			compatible = "qcom,pm8921-mpp",
> +				     "qcom,ssbi-mpp";
> +			reg = <0x50>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pm8921_mpps 0 0 12>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		rtc@11d {
> +			compatible = "qcom,pm8921-rtc";
> +			reg = <0x11d>;
> +			interrupt-parent = <&pm8921>;
> +			interrupts = <39 IRQ_TYPE_EDGE_RISING>;
> +			allow-set-time;
> +		};
> +
> +		pm8921_gpio: gpio@150 {
> +			compatible = "qcom,pm8921-gpio",
> +				     "qcom,ssbi-gpio";
> +			reg = <0x150>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pm8921_gpio 0 0 44>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		pm8921_xoadc: xoadc@197 {
> +			compatible = "qcom,pm8921-adc";
> +			reg = <0x197>;
> +			interrupts-extended = <&pm8921 78 IRQ_TYPE_EDGE_RISING>;
> +			#address-cells = <2>;
> +			#size-cells = <0>;
> +			#io-channel-cells = <2>;
> +
> +			vcoin: adc-channel@0 {
> +				reg = <0x00 0x00>;
> +			};
> +
> +			vbat: adc-channel@1 {
> +				reg = <0x00 0x01>;
> +			};
> +
> +			dcin: adc-channel@2 {
> +				reg = <0x00 0x02>;
> +			};
> +
> +			vph_pwr: adc-channel@4 {
> +				reg = <0x00 0x04>;
> +			};
> +
> +			batt_therm: adc-channel@8 {
> +				reg = <0x00 0x08>;
> +			};
> +
> +			batt_id: adc-channel@9 {
> +				reg = <0x00 0x09>;
> +			};
> +
> +			usb_vbus: adc-channel@a {
> +				reg = <0x00 0x0a>;
> +			};
> +
> +			die_temp: adc-channel@b {
> +				reg = <0x00 0x0b>;
> +			};
> +
> +			ref_625mv: adc-channel@c {
> +				reg = <0x00 0x0c>;
> +			};
> +
> +			ref_1250mv: adc-channel@d {
> +				reg = <0x00 0x0d>;
> +			};
> +
> +			chg_temp: adc-channel@e {
> +				reg = <0x00 0x0e>;
> +			};
> +
> +			ref_muxoff: adc-channel@f {
> +				reg = <0x00 0x0f>;
> +			};
> +		};
> +	};
> +};
> +
> +/ {
> +	/*
> +	 * These channels from the ADC are simply hardware monitors.
> +	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
> +	 * ADC.
> +	 */
> +	iio-hwmon {
> +		compatible = "iio-hwmon";
> +		io-channels = <&pm8921_xoadc 0x00 0x01>, /* Battery */
> +			      <&pm8921_xoadc 0x00 0x02>, /* DC in (charger) */
> +			      <&pm8921_xoadc 0x00 0x04>, /* VPH the main system voltage */
> +			      <&pm8921_xoadc 0x00 0x0b>, /* Die temperature */
> +			      <&pm8921_xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
> +			      <&pm8921_xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
> +			      <&pm8921_xoadc 0x00 0x0e>; /* Charger temperature */
> +	};
> +};
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> index 0e80a5a8e3c6..d5dee70620c2 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> @@ -1,8 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include "qcom-apq8064-v2.0.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
>  / {
>  	model = "Asus Nexus7(flo)";
>  	compatible = "asus,nexus7-flo", "qcom,apq8064";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> index d6ecfd8addb7..ffd654ab0b57 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> @@ -1,8 +1,11 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include "qcom-apq8064-v2.0.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
>  / {
>  	model = "CompuLab CM-QS600";
>  	compatible = "qcom,apq8064-cm-qs600", "qcom,apq8064";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> index 96307550523a..12bf8ea3fb93 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> @@ -1,9 +1,12 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include "qcom-apq8064-v2.0.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
>  / {
>  	model = "Qualcomm APQ8064/IFC6410";
>  	compatible = "qcom,apq8064-ifc6410", "qcom,apq8064";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> index 9244512b74d1..53dd9d79556f 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> @@ -1,10 +1,13 @@
>  // SPDX-License-Identifier: GPL-2.0
> -#include "qcom-apq8064-v2.0.dtsi"
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/input/input.h>
>  #include <dt-bindings/mfd/qcom-rpm.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
>  / {
>  	model = "Sony Xperia Z";
>  	compatible = "sony,xperia-yuga", "qcom,apq8064";
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 4f4393e11580..2a5a3b2fb8e9 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -324,23 +324,6 @@ scm {
>  		};
>  	};
>  
> -
> -	/*
> -	 * These channels from the ADC are simply hardware monitors.
> -	 * That is why the ADC is referred to as "HKADC" - HouseKeeping
> -	 * ADC.
> -	 */
> -	iio-hwmon {
> -		compatible = "iio-hwmon";
> -		io-channels = <&xoadc 0x00 0x01>, /* Battery */
> -			    <&xoadc 0x00 0x02>, /* DC in (charger) */
> -			    <&xoadc 0x00 0x04>, /* VPH the main system voltage */
> -			    <&xoadc 0x00 0x0b>, /* Die temperature */
> -			    <&xoadc 0x00 0x0c>, /* Reference voltage 1.25V */
> -			    <&xoadc 0x00 0x0d>, /* Reference voltage 0.625V */
> -			    <&xoadc 0x00 0x0e>; /* Charger temperature */
> -	};
> -
>  	soc: soc {
>  		#address-cells = <1>;
>  		#size-cells = <1>;
> @@ -683,132 +666,25 @@ rng@1a500000 {
>  			clock-names = "core";
>  		};
>  
> -		ssbi@c00000 {
> +		ssbi2: ssbi@c00000 {
>  			compatible = "qcom,ssbi";
>  			reg = <0x00c00000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pm8821: pmic {
> -				compatible = "qcom,pm8821";
> +			pmic {
>  				interrupt-parent = <&tlmm_pinmux>;
>  				interrupts = <76 IRQ_TYPE_LEVEL_LOW>;
> -				#interrupt-cells = <2>;
> -				interrupt-controller;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				pm8821_mpps: mpps@50 {
> -					compatible = "qcom,pm8821-mpp", "qcom,ssbi-mpp";
> -					reg = <0x50>;
> -					interrupt-controller;
> -					#interrupt-cells = <2>;
> -					gpio-controller;
> -					#gpio-cells = <2>;
> -					gpio-ranges = <&pm8821_mpps 0 0 4>;
> -				};
>  			};
>  		};
>  
> -		ssbi@500000 {
> +		ssbi: ssbi@500000 {
>  			compatible = "qcom,ssbi";
>  			reg = <0x00500000 0x1000>;
>  			qcom,controller-type = "pmic-arbiter";
>  
> -			pmicintc: pmic {
> -				compatible = "qcom,pm8921";
> +			pmic {
>  				interrupt-parent = <&tlmm_pinmux>;
>  				interrupts = <74 8>;
> -				#interrupt-cells = <2>;
> -				interrupt-controller;
> -				#address-cells = <1>;
> -				#size-cells = <0>;
> -
> -				pm8921_gpio: gpio@150 {
> -
> -					compatible = "qcom,pm8921-gpio",
> -						     "qcom,ssbi-gpio";
> -					reg = <0x150>;
> -					interrupt-controller;
> -					#interrupt-cells = <2>;
> -					gpio-controller;
> -					gpio-ranges = <&pm8921_gpio 0 0 44>;
> -					#gpio-cells = <2>;
> -
> -				};
> -
> -				pm8921_mpps: mpps@50 {
> -					compatible = "qcom,pm8921-mpp",
> -						     "qcom,ssbi-mpp";
> -					reg = <0x50>;
> -					gpio-controller;
> -					#gpio-cells = <2>;
> -					gpio-ranges = <&pm8921_mpps 0 0 12>;
> -					interrupt-controller;
> -					#interrupt-cells = <2>;
> -				};
> -
> -				rtc@11d {
> -					compatible = "qcom,pm8921-rtc";
> -					interrupt-parent = <&pmicintc>;
> -					interrupts = <39 1>;
> -					reg = <0x11d>;
> -					allow-set-time;
> -				};
> -
> -				pwrkey@1c {
> -					compatible = "qcom,pm8921-pwrkey";
> -					reg = <0x1c>;
> -					interrupt-parent = <&pmicintc>;
> -					interrupts = <50 1>, <51 1>;
> -					debounce = <15625>;
> -					pull-up;
> -				};
> -
> -				xoadc: xoadc@197 {
> -					compatible = "qcom,pm8921-adc";
> -					reg = <0x197>;
> -					interrupts-extended = <&pmicintc 78 IRQ_TYPE_EDGE_RISING>;
> -					#address-cells = <2>;
> -					#size-cells = <0>;
> -					#io-channel-cells = <2>;
> -
> -					vcoin: adc-channel@0 {
> -						reg = <0x00 0x00>;
> -					};
> -					vbat: adc-channel@1 {
> -						reg = <0x00 0x01>;
> -					};
> -					dcin: adc-channel@2 {
> -						reg = <0x00 0x02>;
> -					};
> -					vph_pwr: adc-channel@4 {
> -						reg = <0x00 0x04>;
> -					};
> -					batt_therm: adc-channel@8 {
> -						reg = <0x00 0x08>;
> -					};
> -					batt_id: adc-channel@9 {
> -						reg = <0x00 0x09>;
> -					};
> -					usb_vbus: adc-channel@a {
> -						reg = <0x00 0x0a>;
> -					};
> -					die_temp: adc-channel@b {
> -						reg = <0x00 0x0b>;
> -					};
> -					ref_625mv: adc-channel@c {
> -						reg = <0x00 0x0c>;
> -					};
> -					ref_1250mv: adc-channel@d {
> -						reg = <0x00 0x0d>;
> -					};
> -					chg_temp: adc-channel@e {
> -						reg = <0x00 0x0e>;
> -					};
> -					ref_muxoff: adc-channel@f {
> -						reg = <0x00 0x0f>;
> -					};
> -				};
>  			};
>  		};
>  
