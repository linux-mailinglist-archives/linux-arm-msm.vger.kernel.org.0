Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 04D7C73FAEE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jun 2023 13:19:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbjF0LTe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Jun 2023 07:19:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230159AbjF0LTe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Jun 2023 07:19:34 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BD771FE2
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:19:31 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4f8689fbf59so6737615e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Jun 2023 04:19:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687864769; x=1690456769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/d52kfhZdEXNNVCq4DRzkO0fiWRIsOnCg14A4lUPXg=;
        b=oaCD8gxMGimpz/2ASA3GuyQNhfpVODkY4dk7wGN6/fGRRokzuHbQZiYz225B9IOD7o
         JwCg2juXF3o/NsWa9NgGQF1i/JkRX/OXx0kbdiGSd48NUIsGDKPCI5a5hKkjZj8Mf+zC
         tHFaPqQh6eEn0nO8GV4KQeMafzHCYBJdUKxbvP8shZX9f6Y47+3ukyHfvLk6YOsu2aBS
         V2HdFezsgO6GcnOVPc6qmB4O2FyPfFkQ8Na2TSgCWc/RGbyA+C+1LfaJHHKp4qJD2B+0
         b1dmuhpq8p1wKN5AFDCU60F9GWm54Ws7TvLpxHtUTNR8+g4BbdGnmraCEbzv5CQjTMTx
         StPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687864769; x=1690456769;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/d52kfhZdEXNNVCq4DRzkO0fiWRIsOnCg14A4lUPXg=;
        b=eM6gy0SohTzO9WoMv9Ge4T2v0hIuUt3pUXPKpe33TUug3eHN4/RlOduL8ZAODL0LTl
         7hTkYE0xe4yOQnhkmDUtfnchV8znDtaWbfSymQYcg1YbcGTCgtvyN5quSfsgjqSDmfUM
         hKKwn7rGowLLnpdH7LwyKW2sn4UyDxGcYEhOTMgX41ViXZcCydjH79oAX0wGH1uMhX0V
         SP8+9bLn3QCG71kboAolubXf1vdrojeWYA4+d2Rs/KBGXUbU7S1qoX+p2ziJN37HdZcG
         qoKNszdS0VL2gqRX/GRak5wZIsozyIfwvVBPL/jzj0rQRVSL312Su/rX7xJtknSpUxUZ
         oVXA==
X-Gm-Message-State: AC+VfDzl9BrvZhdI/K6UkITMcDuRpp54Ufvxrg+i3eKFBXiCETMZosz8
        zT86Dk4mTRpwJxuPgJRfXpi5eQ==
X-Google-Smtp-Source: ACHHUZ723NnyiIRVK1rSh9VbhiSvwc6+778R997zTjvjr/jAFycOmSy5eu5crTsWa/TdQn8XTO+xBg==
X-Received: by 2002:a19:2d19:0:b0:4f8:6d9d:abe0 with SMTP id k25-20020a192d19000000b004f86d9dabe0mr8816824lfj.33.1687864769490;
        Tue, 27 Jun 2023 04:19:29 -0700 (PDT)
Received: from [192.168.1.101] (abxj103.neoplus.adsl.tpnet.pl. [83.9.3.103])
        by smtp.gmail.com with ESMTPSA id v3-20020a056512048300b004faf404bedbsm1164000lfq.297.2023.06.27.04.19.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jun 2023 04:19:29 -0700 (PDT)
Message-ID: <28231a25-b35e-715f-9d94-931716d58840@linaro.org>
Date:   Tue, 27 Jun 2023 13:19:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 12/15] ARM: dts: qcom: apq8064: move RPM regulators to
 board files
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20230627012422.206077-1-dmitry.baryshkov@linaro.org>
 <20230627012422.206077-13-dmitry.baryshkov@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230627012422.206077-13-dmitry.baryshkov@linaro.org>
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

On 27.06.2023 03:24, Dmitry Baryshkov wrote:
> The set of regulators available over the RPM requests is not a property
> of the SoC. Move them to board files.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |  49 ++++----
>  .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  26 ++---
>  .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  33 +++---
>  .../qcom-apq8064-sony-xperia-lagan-yuga.dts   | 105 ++++++++++--------
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  63 -----------
>  5 files changed, 115 insertions(+), 161 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> index d5dee70620c2..1caa73e20bc9 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> @@ -192,22 +192,20 @@ &mdp_dsi1_out {
>  &rpm {
>  	regulators {
>  		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
> -		vin_lvs1_3_6-supply = <&pm8921_s4>;
> -		vin_lvs4_5_7-supply = <&pm8921_s4>;
> -
> -
>  		vdd_l24-supply = <&pm8921_s1>;
>  		vdd_l25-supply = <&pm8921_s1>;
> -		vin_lvs2-supply = <&pm8921_s1>;
> -
>  		vdd_l26-supply = <&pm8921_s7>;
>  		vdd_l27-supply = <&pm8921_s7>;
>  		vdd_l28-supply = <&pm8921_s7>;
>  
> +		vin_lvs1_3_6-supply = <&pm8921_s4>;
> +		vin_lvs2-supply = <&pm8921_s1>;
> +		vin_lvs4_5_7-supply = <&pm8921_s4>;
> +
>  		vdd_ncp-supply = <&pm8921_l6>;
>  
>  		/* Buck SMPS */
> -		s1 {
> +		pm8921_s1: s1 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1225000>;
>  			regulator-max-microvolt = <1225000>;
> @@ -216,7 +214,7 @@ s1 {
>  		};
>  
>  		/* msm otg HSUSB_VDDCX */
> -		s3 {
> +		pm8921_s3: s3 {
>  			regulator-min-microvolt = <500000>;
>  			regulator-max-microvolt = <1150000>;
>  			qcom,switch-mode-frequency = <4800000>;
> @@ -229,55 +227,58 @@ s3 {
>  		 * tabla2x-slim-CDC_VDD_CP
>  		 * tabla2x-slim-VDDIO_CDC
>  		 */
> -		s4 {
> +		pm8921_s4: s4 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  			regulator-always-on;
>  		};
>  
> -		s7 {
> +		pm8921_s7: s7 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
>  		/* mipi_dsi.1-dsi1_pll_vdda */
> -		l2 {
> +		pm8921_l2: l2 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			regulator-always-on;
>  		};
>  
>  		/* msm_otg-HSUSB_3p3 */
> -		l3 {
> +		pm8921_l3: l3 {
>  			regulator-min-microvolt = <3075000>;
>  			regulator-max-microvolt = <3075000>;
>  			bias-pull-down;
>  		};
>  
>  		/* msm_otg-HSUSB_1p8 */
> -		l4 {
> +		pm8921_l4: l4 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
>  		/* msm_sdcc.1-sdc_vdd */
> -		l5 {
> +		pm8921_l5: l5 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <2950000>;
>  			regulator-always-on;
>  			bias-pull-down;
>  		};
>  
> -		l6 {
> +		pm8921_l6: l6 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <2950000>;
>  		};
>  
> +		pm8921_l8: l8 {
> +		};
> +
>  		/* mipi_dsi.1-dsi1_avdd */
> -		l11 {
> +		pm8921_l11: l11 {
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3000000>;
>  			bias-pull-down;
> @@ -285,14 +286,14 @@ l11 {
>  		};
>  
>  		/* pwm_power for backlight */
> -		l17 {
> +		pm8921_l17: l17 {
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3000000>;
>  			regulator-always-on;
>  		};
>  
>  		/* camera, qdsp6 */
> -		l23 {
> +		pm8921_l23: l23 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
> @@ -302,32 +303,32 @@ l23 {
>  		 * tabla2x-slim-CDC_VDDA_A_1P2V
>  		 * tabla2x-slim-VDDD_CDC_D
>  		 */
> -		l25 {
> +		pm8921_l25: l25 {
>  			regulator-min-microvolt = <1250000>;
>  			regulator-max-microvolt = <1250000>;
>  			bias-pull-down;
>  		};
>  
> -		lvs1 {
> +		pm8921_lvs1: lvs1 {
>  			bias-pull-down;
>  		};
>  
> -		lvs4 {
> +		pm8921_lvs4: lvs4 {
>  			bias-pull-down;
>  		};
>  
> -		lvs5 {
> +		pm8921_lvs5: lvs5 {
>  			bias-pull-down;
>  		};
>  
> -		lvs6 {
> +		pm8921_lvs6: lvs6 {
>  			bias-pull-down;
>  		};
>  		/*
>  		 * mipi_dsi.1-dsi1_vddio
>  		 * pil_riva-pll_vdd
>  		 */
> -		lvs7 {
> +		pm8921_lvs7: lvs7 {
>  			bias-pull-down;
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> index ffd654ab0b57..6472277d1c6d 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> @@ -85,10 +85,6 @@ pinconf {
>  
>  &rpm {
>  	regulators {
> -		vin_lvs1_3_6-supply = <&pm8921_s4>;
> -		vin_lvs2-supply = <&pm8921_s1>;
> -		vin_lvs4_5_7-supply = <&pm8921_s4>;
> -
>  		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
>  		vdd_l24-supply = <&pm8921_s1>;
>  		vdd_l25-supply = <&pm8921_s1>;
> @@ -96,9 +92,12 @@ regulators {
>  		vdd_l27-supply = <&pm8921_s7>;
>  		vdd_l28-supply = <&pm8921_s7>;
>  
> +		vin_lvs1_3_6-supply = <&pm8921_s4>;
> +		vin_lvs2-supply = <&pm8921_s1>;
> +		vin_lvs4_5_7-supply = <&pm8921_s4>;
>  
>  		/* Buck SMPS */
> -		s1 {
> +		pm8921_s1: s1 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1225000>;
>  			regulator-max-microvolt = <1225000>;
> @@ -106,52 +105,51 @@ s1 {
>  			bias-pull-down;
>  		};
>  
> -		s3 {
> +		pm8921_s3: s3 {
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1400000>;
>  			qcom,switch-mode-frequency = <4800000>;
>  		};
>  
> -		s4 {
> +		pm8921_s4: s4 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
> -		s7 {
> +		pm8921_s7: s7 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
> -		l3 {
> +		pm8921_l3: l3 {
>  			regulator-min-microvolt = <3050000>;
>  			regulator-max-microvolt = <3300000>;
>  			bias-pull-down;
>  		};
>  
> -		l4 {
> +		pm8921_l4: l4 {
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
> -		l5 {
> +		pm8921_l5: l5 {
>  			regulator-min-microvolt = <2750000>;
>  			regulator-max-microvolt = <3000000>;
>  			bias-pull-down;
>  		};
>  
> -		l23 {
> +		pm8921_l23: l23 {
>  			regulator-min-microvolt = <1700000>;
>  			regulator-max-microvolt = <1900000>;
>  			bias-pull-down;
>  		};
>  
> -		lvs6 {
> +		pm8921_lvs6: lvs6 {
>  			bias-pull-down;
>  		};
> -
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> index 12bf8ea3fb93..39c44fae9d14 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> @@ -196,10 +196,6 @@ pinconf {
>  
>  &rpm {
>  	regulators {
> -		vin_lvs1_3_6-supply = <&pm8921_s4>;
> -		vin_lvs2-supply = <&pm8921_s1>;
> -		vin_lvs4_5_7-supply = <&pm8921_s4>;
> -
>  		vdd_l1_l2_l12_l18-supply = <&pm8921_s4>;
>  		vdd_l24-supply = <&pm8921_s1>;
>  		vdd_l25-supply = <&pm8921_s1>;
> @@ -207,9 +203,12 @@ regulators {
>  		vdd_l27-supply = <&pm8921_s7>;
>  		vdd_l28-supply = <&pm8921_s7>;
>  
> +		vin_lvs1_3_6-supply = <&pm8921_s4>;
> +		vin_lvs2-supply = <&pm8921_s1>;
> +		vin_lvs4_5_7-supply = <&pm8921_s4>;
>  
>  		/* Buck SMPS */
> -		s1 {
> +		pm8921_s1: s1 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1225000>;
>  			regulator-max-microvolt = <1225000>;
> @@ -217,59 +216,63 @@ s1 {
>  			bias-pull-down;
>  		};
>  
> -		s3 {
> +		pm8921_s3: s3 {
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1400000>;
>  			qcom,switch-mode-frequency = <4800000>;
>  		};
>  
> -		s4 {
> +		pm8921_s4: s4 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
> -		s7 {
> +		pm8921_s7: s7 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
> -		l3 {
> +		pm8921_l3: l3 {
>  			regulator-min-microvolt = <3050000>;
>  			regulator-max-microvolt = <3300000>;
>  			bias-pull-down;
>  		};
>  
> -		l4 {
> +		pm8921_l4: l4 {
>  			regulator-min-microvolt = <1000000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
> -		l5 {
> +		pm8921_l5: l5 {
>  			regulator-min-microvolt = <2750000>;
>  			regulator-max-microvolt = <3000000>;
>  			bias-pull-down;
>  		};
>  
> -		l6 {
> +		pm8921_l6: l6 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <2950000>;
>  			bias-pull-down;
>  		};
>  
> -		l23 {
> +		pm8921_l23: l23 {
>  			regulator-min-microvolt = <1700000>;
>  			regulator-max-microvolt = <1900000>;
>  			bias-pull-down;
>  		};
>  
> -		lvs1 {
> +		pm8921_lvs1: lvs1 {
> +			bias-pull-down;
> +		};
> +
> +		pm8921_lvs6: lvs6 {
>  			bias-pull-down;
>  		};
>  
> -		lvs6 {
> +		pm8921_hdmi_switch: hdmi-switch {
>  			bias-pull-down;
>  		};
>  	};
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> index 53dd9d79556f..6988bd212924 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-sony-xperia-lagan-yuga.dts
> @@ -85,23 +85,36 @@ gpio_keys_pin_a: gpio-keys-active-state {
>  &riva {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&riva_wlan_pin_a>, <&riva_bt_pin_a>, <&riva_fm_pin_a>;
> +
> +	vddcx-supply = <&pm8921_s3>;
> +	vddmx-supply = <&pm8921_l24>;
> +	vddpx-supply = <&pm8921_s4>;
> +
>  	status = "okay";
> +
> +	iris {
> +		vddxo-supply = <&pm8921_l4>;
> +		vddrfa-supply = <&pm8921_s2>;
> +		vddpa-supply = <&pm8921_l10>;
> +		vdddig-supply = <&pm8921_lvs2>;
> +	};
>  };
>  
>  &rpm {
>  	regulators {
>  		vin_l1_l2_l12_l18-supply = <&pm8921_s4>;
> -		vin_lvs_1_3_6-supply = <&pm8921_s4>;
> -		vin_lvs_4_5_7-supply = <&pm8921_s4>;
> -		vin_ncp-supply = <&pm8921_l6>;
> -		vin_lvs2-supply = <&pm8921_s4>;
>  		vin_l24-supply = <&pm8921_s1>;
>  		vin_l25-supply = <&pm8921_s1>;
>  		vin_l27-supply = <&pm8921_s7>;
>  		vin_l28-supply = <&pm8921_s7>;
>  
> +		vin_lvs_1_3_6-supply = <&pm8921_s4>;
> +		vin_lvs2-supply = <&pm8921_s4>;
> +		vin_lvs_4_5_7-supply = <&pm8921_s4>;
> +		vin_ncp-supply = <&pm8921_l6>;
> +
>  		/* Buck SMPS */
> -		s1 {
> +		pm8921_s1: s1 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1225000>;
>  			regulator-max-microvolt = <1225000>;
> @@ -109,21 +122,21 @@ s1 {
>  			bias-pull-down;
>  		};
>  
> -		s2 {
> +		pm8921_s2: s2 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  			bias-pull-down;
>  		};
>  
> -		s3 {
> +		pm8921_s3: s3 {
>  			regulator-min-microvolt = <500000>;
>  			regulator-max-microvolt = <1150000>;
>  			qcom,switch-mode-frequency = <4800000>;
>  			bias-pull-down;
>  		};
>  
> -		s4 {
> +		pm8921_s4: s4 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
> @@ -132,205 +145,207 @@ s4 {
>  			qcom,force-mode = <QCOM_RPM_FORCE_MODE_AUTO>;
>  		};
>  
> -		s7 {
> +		pm8921_s7: s7 {
>  			regulator-min-microvolt = <1300000>;
>  			regulator-max-microvolt = <1300000>;
>  			qcom,switch-mode-frequency = <3200000>;
>  		};
>  
> -		s8 {
> +		pm8921_s8: s8 {
>  			regulator-min-microvolt = <2200000>;
>  			regulator-max-microvolt = <2200000>;
>  			qcom,switch-mode-frequency = <1600000>;
>  		};
>  
>  		/* PMOS LDO */
> -		l1 {
> +		pm8921_l1: l1 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1100000>;
>  			regulator-max-microvolt = <1100000>;
>  			bias-pull-down;
>  		};
>  
> -		l2 {
> +		pm8921_l2: l2 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
>  
> -		l3 {
> +		pm8921_l3: l3 {
>  			regulator-min-microvolt = <3075000>;
>  			regulator-max-microvolt = <3075000>;
>  			bias-pull-down;
>  		};
>  
> -		l4 {
> +		pm8921_l4: l4 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
> -		l5 {
> +		pm8921_l5: l5 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <2950000>;
>  			bias-pull-down;
>  		};
>  
> -		l6 {
> +		pm8921_l6: l6 {
>  			regulator-min-microvolt = <2950000>;
>  			regulator-max-microvolt = <2950000>;
>  			bias-pull-down;
>  		};
>  
> -		l7 {
> +		pm8921_l7: l7 {
>  			regulator-min-microvolt = <1850000>;
>  			regulator-max-microvolt = <2950000>;
>  			bias-pull-down;
>  		};
>  
> -		l8 {
> +		pm8921_l8: l8 {
>  			regulator-min-microvolt = <2800000>;
>  			regulator-max-microvolt = <2800000>;
>  			bias-pull-down;
>  		};
>  
> -		l9 {
> +		pm8921_l9: l9 {
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3000000>;
>  			bias-pull-down;
>  		};
>  
> -		l10 {
> +		pm8921_l10: l10 {
>  			regulator-min-microvolt = <2900000>;
>  			regulator-max-microvolt = <2900000>;
>  			bias-pull-down;
>  		};
>  
> -		l11 {
> +		pm8921_l11: l11 {
>  			regulator-min-microvolt = <3000000>;
>  			regulator-max-microvolt = <3000000>;
>  			bias-pull-down;
>  		};
>  
> -		l12 {
> +		pm8921_l12: l12 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
>  
> -		l14 {
> +		pm8921_l14: l14 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
> -		l15 {
> +		pm8921_l15: l15 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <2950000>;
>  			bias-pull-down;
>  		};
>  
> -		l16 {
> +		pm8921_l16: l16 {
>  			regulator-min-microvolt = <2800000>;
>  			regulator-max-microvolt = <2800000>;
>  			bias-pull-down;
>  		};
>  
> -		l17 {
> +		pm8921_l17: l17 {
>  			regulator-min-microvolt = <2000000>;
>  			regulator-max-microvolt = <2000000>;
>  			bias-pull-down;
>  		};
>  
> -		l18 {
> +		pm8921_l18: l18 {
>  			regulator-min-microvolt = <1200000>;
>  			regulator-max-microvolt = <1200000>;
>  			bias-pull-down;
>  		};
>  
> -		l21 {
> +		pm8921_l21: l21 {
>  			regulator-min-microvolt = <1050000>;
>  			regulator-max-microvolt = <1050000>;
>  			bias-pull-down;
>  		};
>  
> -		l22 {
> +		pm8921_l22: l22 {
>  			regulator-min-microvolt = <2600000>;
>  			regulator-max-microvolt = <2600000>;
>  			bias-pull-down;
>  		};
>  
> -		l23 {
> +		pm8921_l23: l23 {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			bias-pull-down;
>  		};
>  
> -		l24 {
> +		pm8921_l24: l24 {
>  			regulator-min-microvolt = <750000>;
>  			regulator-max-microvolt = <1150000>;
>  			bias-pull-down;
>  		};
>  
> -		l25 {
> +		pm8921_l25: l25 {
>  			regulator-always-on;
>  			regulator-min-microvolt = <1250000>;
>  			regulator-max-microvolt = <1250000>;
>  			bias-pull-down;
>  		};
>  
> -		l27 {
> +		pm8921_l27: l27 {
>  			regulator-min-microvolt = <1100000>;
>  			regulator-max-microvolt = <1100000>;
>  		};
>  
> -		l28 {
> +		pm8921_l28: l28 {
>  			regulator-min-microvolt = <1050000>;
>  			regulator-max-microvolt = <1050000>;
>  			bias-pull-down;
>  		};
>  
> -		l29 {
> +		pm8921_l29: l29 {
>  			regulator-min-microvolt = <2000000>;
>  			regulator-max-microvolt = <2000000>;
>  			bias-pull-down;
>  		};
>  
>  		/* Low Voltage Switch */
> -		lvs1 {
> +		pm8921_lvs1: lvs1 {
>  			bias-pull-down;
>  		};
>  
> -		lvs2 {
> +		pm8921_lvs2: lvs2 {
>  			bias-pull-down;
>  		};
>  
> -		lvs3 {
> +		pm8921_lvs3: lvs3 {
>  			bias-pull-down;
>  		};
>  
> -		lvs4 {
> +		pm8921_lvs4: lvs4 {
>  			bias-pull-down;
>  		};
>  
> -		lvs5 {
> +		pm8921_lvs5: lvs5 {
>  			bias-pull-down;
>  		};
>  
> -		lvs6 {
> +		pm8921_lvs6: lvs6 {
>  			bias-pull-down;
>  		};
>  
> -		lvs7 {
> +		pm8921_lvs7: lvs7 {
>  			bias-pull-down;
>  		};
>  
> -		usb-switch {};
> +		pm8921_usb_switch: usb-switch {};
>  
> -		hdmi-switch {};
> +		pm8921_hdmi_switch: hdmi-switch {
> +			bias-pull-down;
> +		};
>  
> -		ncp {
> +		pm8921_ncp: ncp {
>  			regulator-min-microvolt = <1800000>;
>  			regulator-max-microvolt = <1800000>;
>  			qcom,switch-mode-frequency = <1600000>;
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> index 2a5a3b2fb8e9..36c68ee5be65 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
> @@ -795,60 +795,6 @@ rpmcc: clock-controller {
>  				clocks = <&pxo_board>, <&cxo_board>;
>  				clock-names = "pxo", "cxo";
>  			};
> -
> -			regulators {
> -				compatible = "qcom,rpm-pm8921-regulators";
> -
> -				pm8921_s1: s1 {};
> -				pm8921_s2: s2 {};
> -				pm8921_s3: s3 {};
> -				pm8921_s4: s4 {};
> -				pm8921_s7: s7 {};
> -				pm8921_s8: s8 {};
> -
> -				pm8921_l1: l1 {};
> -				pm8921_l2: l2 {};
> -				pm8921_l3: l3 {};
> -				pm8921_l4: l4 {};
> -				pm8921_l5: l5 {};
> -				pm8921_l6: l6 {};
> -				pm8921_l7: l7 {};
> -				pm8921_l8: l8 {};
> -				pm8921_l9: l9 {};
> -				pm8921_l10: l10 {};
> -				pm8921_l11: l11 {};
> -				pm8921_l12: l12 {};
> -				pm8921_l14: l14 {};
> -				pm8921_l15: l15 {};
> -				pm8921_l16: l16 {};
> -				pm8921_l17: l17 {};
> -				pm8921_l18: l18 {};
> -				pm8921_l21: l21 {};
> -				pm8921_l22: l22 {};
> -				pm8921_l23: l23 {};
> -				pm8921_l24: l24 {};
> -				pm8921_l25: l25 {};
> -				pm8921_l26: l26 {};
> -				pm8921_l27: l27 {};
> -				pm8921_l28: l28 {};
> -				pm8921_l29: l29 {};
> -
> -				pm8921_lvs1: lvs1 {};
> -				pm8921_lvs2: lvs2 {};
> -				pm8921_lvs3: lvs3 {};
> -				pm8921_lvs4: lvs4 {};
> -				pm8921_lvs5: lvs5 {};
> -				pm8921_lvs6: lvs6 {};
> -				pm8921_lvs7: lvs7 {};
> -
> -				pm8921_usb_switch: usb-switch {};
> -
> -				pm8921_hdmi_switch: hdmi-switch {
> -					bias-pull-down;
> -				};
> -
> -				pm8921_ncp: ncp {};
> -			};
>  		};
>  
>  		usb1: usb@12500000 {
> @@ -1528,10 +1474,6 @@ riva: riva-pil@3200800 {
>  
>  			memory-region = <&wcnss_mem>;
>  
> -			vddcx-supply = <&pm8921_s3>;
> -			vddmx-supply = <&pm8921_l24>;
> -			vddpx-supply = <&pm8921_s4>;
> -
>  			status = "disabled";
>  
>  			iris {
> @@ -1539,11 +1481,6 @@ iris {
>  
>  				clocks = <&cxo_board>;
>  				clock-names = "xo";
> -
> -				vddxo-supply = <&pm8921_l4>;
> -				vddrfa-supply = <&pm8921_s2>;
> -				vddpa-supply = <&pm8921_l10>;
> -				vdddig-supply = <&pm8921_lvs2>;
>  			};
>  
>  			smd-edge {
