Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 411827473AB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 16:08:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231268AbjGDOIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Jul 2023 10:08:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231455AbjGDOIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Jul 2023 10:08:15 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1896EE6E
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Jul 2023 07:08:14 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so8780425e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Jul 2023 07:08:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688479692; x=1691071692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5AFiGBS/zGuc9xugDm8aCJCV9O8BpIrsJn4xnO04hvw=;
        b=MYYW6i2PjUCxN9BKpcD5ZCbG/m9u7nk5o4NUSLVE9nY/Fw3eDroK/iBbNcUzB5IQqJ
         7W+tsyg7GbE+XnhOz2DfzE5CYlQNNukegI74XCwa8OEpYK1cdqRDH13XoomxL7eXebH4
         mdeWWoK0wP1/pqfjwWMTG/80mm+gxwCAcNIeehmbzN2YaA7aDkUKpRI5aaYuhZrI4Zog
         rc2ZS4Ie0P6ekNtxhDZvemCHdAkpPYz75SQX6prK7VjJxSHuQnz9TdmPYbqCNqYaG/JZ
         xyzvcX6eGBn3OFIsGyLJX6/1ls1T+KqEWQ7DF17giOYNBvnryrZI4sBLYEq9ulwkxMGr
         +8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688479692; x=1691071692;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5AFiGBS/zGuc9xugDm8aCJCV9O8BpIrsJn4xnO04hvw=;
        b=O6vWTexF2ctqUIbf5i1wuktEnBkBekCyMIDiYyUReUmXy9L4pG0LEcn3PQVhBILECW
         5FQbq/5YIuku21eDppQ6iJdy8VHx+uAkBUbyPfrysAaZCrkAVvljxYlAOz/qGoHABYDK
         DCJVOOWc387th3rfOj8EOKY02hwOrndZUpqiRZ8Osk0iadqUoXzWKu7Q8lEGunqdi4ur
         0QA4SkAZPqJrOvj6hQLSW0Z5fYsgi6qrlaPslXI/TCmU8ovnNfKh11w8jVK6j4DXY65k
         /BxUK87U7pAoLZSu6ub0ndnpldS2GWxCa4Khc7DZ7CeVYUpZRun1OEkohzLkVkSQM1+g
         n5NA==
X-Gm-Message-State: ABy/qLYe+cA8MykOc8S2F8k2P3hGi7z8XghcO3jaG2H1G6RQHlhtkECD
        tbgWi/GmTbgmPD57w/YxIelMcg==
X-Google-Smtp-Source: APBJJlGd+o2133PP/vmFNrjZ4qJJbfEXkrdeEphzHNIhUR9iyY2YaFMxTeGRJ5rpJ09gurP/j9BjiA==
X-Received: by 2002:a05:6512:6cd:b0:4f8:6d54:72fa with SMTP id u13-20020a05651206cd00b004f86d5472famr10936976lff.2.1688479692051;
        Tue, 04 Jul 2023 07:08:12 -0700 (PDT)
Received: from [192.168.1.101] (abyj26.neoplus.adsl.tpnet.pl. [83.9.29.26])
        by smtp.gmail.com with ESMTPSA id g1-20020a19ee01000000b004fba101946dsm2769084lfb.187.2023.07.04.07.08.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jul 2023 07:08:11 -0700 (PDT)
Message-ID: <399f29d0-ca1e-932c-6d7f-e07d6d0c0159@linaro.org>
Date:   Tue, 4 Jul 2023 16:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 27/27] ARM: dts: qcom: msm8974: move regulators to
 board files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230702134320.98831-1-dmitry.baryshkov@linaro.org>
 <20230702134320.98831-28-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230702134320.98831-28-dmitry.baryshkov@linaro.org>
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

On 2.07.2023 15:43, Dmitry Baryshkov wrote:
> The vph-pwr and boost regulators (even if they are unified by design)
> are not a property of SoC, so move them to board files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/qcom-apq8074-dragonboard.dts     | 27 +++++++++++++++++++
>  .../qcom-msm8974-lge-nexus5-hammerhead.dts    | 27 +++++++++++++++++++
>  .../qcom/qcom-msm8974-sony-xperia-rhine.dtsi  | 27 +++++++++++++++++++
>  arch/arm/boot/dts/qcom/qcom-msm8974.dtsi      | 27 -------------------
>  .../qcom/qcom-msm8974pro-fairphone-fp2.dts    | 27 +++++++++++++++++++
>  .../qcom/qcom-msm8974pro-oneplus-bacon.dts    | 27 +++++++++++++++++++
>  .../dts/qcom/qcom-msm8974pro-samsung-klte.dts | 10 ++++++-
>  ...-msm8974pro-sony-xperia-shinano-castor.dts | 27 +++++++++++++++++++
>  8 files changed, 171 insertions(+), 28 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
> index 5a8af16bf02d..3e5311e7196e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8074-dragonboard.dts
> @@ -49,6 +49,33 @@ mpss_region: mpss@ac00000 {
>  			no-map;
>  		};
>  	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &blsp1_uart2 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> index da99f770d4f5..ca402b4a68bd 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-lge-nexus5-hammerhead.dts
> @@ -60,6 +60,33 @@ vibrator {
>  		enable-gpios = <&tlmm 60 GPIO_ACTIVE_HIGH>;
>  	};
>  
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
> +
>  	vreg_wlan: wlan-regulator {
>  		compatible = "regulator-fixed";
>  
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> index 23ae474698aa..a43341ae4495 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine.dtsi
> @@ -65,6 +65,33 @@ ramoops@3e8e0000 {
>  			pmsg-size = <0x80000>;
>  		};
>  	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &blsp1_i2c2 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> index aeca504918a0..a4ff1fe63903 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974.dtsi
> @@ -2376,31 +2376,4 @@ timer {
>  			     <GIC_PPI 1 0xf08>;
>  		clock-frequency = <19200000>;
>  	};
> -
> -	vreg_boost: vreg-boost {
> -		compatible = "regulator-fixed";
> -
> -		regulator-name = "vreg-boost";
> -		regulator-min-microvolt = <3150000>;
> -		regulator-max-microvolt = <3150000>;
> -
> -		regulator-always-on;
> -		regulator-boot-on;
> -
> -		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> -		enable-active-high;
> -
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&boost_bypass_n_pin>;
> -	};
> -
> -	vreg_vph_pwr: vreg-vph-pwr {
> -		compatible = "regulator-fixed";
> -		regulator-name = "vph-pwr";
> -
> -		regulator-min-microvolt = <3600000>;
> -		regulator-max-microvolt = <3600000>;
> -
> -		regulator-always-on;
> -	};
>  };
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
> index 24f9521a0be6..9cbdfe62051e 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-fairphone-fp2.dts
> @@ -57,6 +57,33 @@ vibrator {
>  		enable-gpios = <&tlmm 86 GPIO_ACTIVE_HIGH>;
>  		vcc-supply = <&pm8941_l18>;
>  	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &blsp1_i2c2 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> index c0ca264d8140..6d1412aec45a 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-oneplus-bacon.dts
> @@ -51,6 +51,33 @@ event-hall-sensor {
>  			debounce-interval = <150>;
>  		};
>  	};
> +
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &blsp1_i2c1 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
> index 325feb89b343..ca3aa16b4b10 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-samsung-klte.dts
> @@ -155,7 +155,15 @@ vreg_panel: panel-regulator {
>  		enable-active-high;
>  	};
>  
> -	/delete-node/ vreg-boost;
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
>  };
>  
>  &blsp1_i2c2 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> index efe21289c9fe..b76d51b1b667 100644
> --- a/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-msm8974pro-sony-xperia-shinano-castor.dts
> @@ -84,6 +84,33 @@ vreg_vsp: lcd-dcdc-regulator {
>  		pinctrl-0 = <&lcd_dcdc_en_pin_a>;
>  	};
>  
> +	vreg_boost: vreg-boost {
> +		compatible = "regulator-fixed";
> +
> +		regulator-name = "vreg-boost";
> +		regulator-min-microvolt = <3150000>;
> +		regulator-max-microvolt = <3150000>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio = <&pm8941_gpios 21 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&boost_bypass_n_pin>;
> +	};
> +
> +	vreg_vph_pwr: vreg-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph-pwr";
> +
> +		regulator-min-microvolt = <3600000>;
> +		regulator-max-microvolt = <3600000>;
> +
> +		regulator-always-on;
> +	};
> +
>  	vreg_wlan: wlan-regulator {
>  		compatible = "regulator-fixed";
>  
