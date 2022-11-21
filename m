Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 86E87632CA9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Nov 2022 20:11:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230451AbiKUTLj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Nov 2022 14:11:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230522AbiKUTLf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Nov 2022 14:11:35 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B678D32A0
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 11:11:34 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id u2so15567676ljl.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Nov 2022 11:11:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=C/Yb4u4vAXLl0RD4Ud1kZs2nHt/xeWgvV9BVqgCPKu0=;
        b=i5UYUEBmzaGHMYjHmkixREUwgZanvPATQhd9asTEO89+W8hjFw2CIKoPE3Rs/uRI7E
         LBQcvIHxm4gITtP9T/fULMgi/101lHNEbqJ6mtHkIuxpubVVJpB9ePYhVn+xX23N+aq/
         AhMmJ2SDFAtSbCZDs1Utp3LNoi2cWpNHfKVGiNjOCJMygNjxyQ/DclkpE0nDO1nUFC5j
         zrt7TlENYXMUSoX23I4nvohBNZHxRM1VP3d/R2Z1ftoCdOjgzxy3zVipFILFOe0H9YNv
         XFnIWF/cccJWOjmwHVM7NSxA6wL7hsi0vCXs/7rfIS2AjutkuTD70Eq5skJbb5BfOOuc
         Y/WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C/Yb4u4vAXLl0RD4Ud1kZs2nHt/xeWgvV9BVqgCPKu0=;
        b=0/urUJP1sgl/P+bUed+M7aC8LD/fv5ebEV5MWii38njiUWuO7rj5bwWx9beF0v/kqD
         kGRcFuS+wJbleIrfheWBZGGZJmC9g4i+vS0Mn/z4EbUjD99aiIfGd1LX6E9XKS9+uE1+
         HgdReALRj6ffv7a622qA811JGUDX2zBzw7JxzlIaySZkUypG6tqTJG9iEVCucgwGmVHU
         Xynw0b01HPtWV6EadXChaD4yLlwaF1Y3CvV9wAOo6zNXbsXFbJIfJyYP0O4hFROE874H
         1vj0/fLU/++FVJaCtpNpTzSg3R/2SIF1NWh9gp062neZ+wJxQqgkpyTlF8FaPo46TEfA
         Qg8w==
X-Gm-Message-State: ANoB5pkiL5CsJp41ChziX4CcNHxmSF/hlkMeCfU3rLWIKUeTluojMkKE
        zIcCjvQmoId52sNbX7/zGP8D9A==
X-Google-Smtp-Source: AA0mqf6mzth+T/x/GDDSJFbvgPy6ZC11/l6SqsOPxNHA3Xe5b0AmoRJL5+vwtXNOt7YZwuQG7u32Dw==
X-Received: by 2002:a2e:a5c6:0:b0:277:22c3:afbb with SMTP id n6-20020a2ea5c6000000b0027722c3afbbmr1798149ljp.204.1669057892774;
        Mon, 21 Nov 2022 11:11:32 -0800 (PST)
Received: from [192.168.1.101] (95.49.32.48.neoplus.adsl.tpnet.pl. [95.49.32.48])
        by smtp.gmail.com with ESMTPSA id j8-20020ac253a8000000b004946a1e045fsm2111963lfh.197.2022.11.21.11.11.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Nov 2022 11:11:32 -0800 (PST)
Message-ID: <9e16e159-2c3f-f6e1-7f94-09e94728fd7a@linaro.org>
Date:   Mon, 21 Nov 2022 20:11:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sc8280xp-x13s: Add soundcard
 support
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        agross@kernel.org, andersson@kernel.org
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20221121130403.161817-1-srinivas.kandagatla@linaro.org>
 <20221121130403.161817-4-srinivas.kandagatla@linaro.org>
Content-Language: en-US
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221121130403.161817-4-srinivas.kandagatla@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 21.11.2022 14:04, Srinivas Kandagatla wrote:
> Add support for SoundCard on X13s. This patch adds support for Headset
> Playback, record and 2 DMICs on the Panel along with the regulators
> required for powering up the LPASS codecs.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  .../qcom/sc8280xp-lenovo-thinkpad-x13s.dts    | 213 ++++++++++++++++++
>  1 file changed, 213 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> index 568c6be1ceaa..eefa22ea1ed7 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
> @@ -172,6 +172,14 @@ vreg_wwan: regulator-wwan {
>  
>  		regulator-boot-on;
>  	};
> +
> +	vreg_vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VPH_VCC3R9";
> +		regulator-min-microvolt = <3900000>;
> +		regulator-max-microvolt = <3900000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  &apps_rsc {
> @@ -181,6 +189,13 @@ pmc8280-1-rpmh-regulators {
>  
>  		vdd-l3-l5-supply = <&vreg_s11b>;
>  
> +		vreg_s10b: smps10 {
> +			regulator-name = "vreg_s10b";
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_s11b: smps11 {
>  			regulator-name = "vreg_s11b";
>  			regulator-min-microvolt = <1272000>;
> @@ -188,6 +203,13 @@ vreg_s11b: smps11 {
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
> +		vreg_s12b: smps12 {
> +			regulator-name = "vreg_s12b";
> +			regulator-min-microvolt = <984000>;
> +			regulator-max-microvolt = <984000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
> +		};
> +
>  		vreg_l3b: ldo3 {
>  			regulator-name = "vreg_l3b";
>  			regulator-min-microvolt = <1200000>;
> @@ -216,6 +238,7 @@ vreg_l6b: ldo6 {
>  	pmc8280c-rpmh-regulators {
>  		compatible = "qcom,pm8350c-rpmh-regulators";
>  		qcom,pmic-id = "c";
> +		vdd-bob-supply = <&vreg_vph_pwr>;
>  
>  		vreg_l1c: ldo1 {
>  			regulator-name = "vreg_l1c";
> @@ -237,6 +260,13 @@ vreg_l13c: ldo13 {
>  			regulator-max-microvolt = <3072000>;
>  			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
> +
> +		vreg_bob: bob {
> +			regulator-name = "vreg_bob";
> +			regulator-min-microvolt = <3008000>;
> +			regulator-max-microvolt = <3960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
> +		};
>  	};
>  
>  	pmc8280-2-rpmh-regulators {
> @@ -596,6 +626,161 @@ &remoteproc_nsp0 {
>  	status = "okay";
>  };
>  
> +&soc {
> +	wcd938x: codec {
> +		compatible = "qcom,wcd9380-codec";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&wcd_default>;
> +		reset-gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <1>;
> +
> +		vdd-buck-supply = <&vreg_s10b>;
> +		vdd-rxtx-supply = <&vreg_s10b>;
> +		vdd-io-supply = <&vreg_s10b>;
> +		vdd-mic-bias-supply = <&vreg_bob>;
> +		qcom,micbias1-microvolt = <1800000>;
> +		qcom,micbias2-microvolt = <1800000>;
> +		qcom,micbias3-microvolt = <1800000>;
> +		qcom,micbias4-microvolt = <1800000>;
> +		qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000 500000 500000 500000 500000>;
> +		qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
> +		qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
> +		qcom,rx-device = <&wcd_rx>;
> +		qcom,tx-device = <&wcd_tx>;
> +	};
> +};
> +
> +&sound {
> +	compatible = "qcom,sc8280xp-sndcard";
> +	model = "SC8280XP-LENOVO-X13S";
> +	audio-routing =
> +		"SpkrLeft IN", "WSA_SPK1 OUT",
> +		"SpkrRight IN", "WSA_SPK2 OUT",
> +		"IN1_HPHL", "HPHL_OUT",
> +		"IN2_HPHR", "HPHR_OUT",
> +		"AMIC2", "MIC BIAS2",
> +		"VA DMIC0", "MIC BIAS1",
> +		"VA DMIC1", "MIC BIAS1",
> +		"VA DMIC2", "MIC BIAS3",
> +		"TX DMIC0", "MIC BIAS1",
> +		"TX DMIC1", "MIC BIAS2",
> +		"TX DMIC2", "MIC BIAS3",
> +		"TX SWR_ADC1", "ADC2_OUTPUT";
> +
> +	wcd-playback-dai-link {
> +		link-name = "WCD Playback";
> +		cpu {
> +			sound-dai = <&q6apmbedai RX_CODEC_DMA_RX_0>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd938x 0>, <&swr1 0>, <&rxmacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	wcd-capture-dai-link {
> +		link-name = "WCD Capture";
> +		cpu {
> +			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd938x 1>, <&swr2 0>, <&txmacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	wsa-dai-link {
> +		link-name = "WSA Playback";
> +		cpu {
> +			sound-dai = <&q6apmbedai WSA_CODEC_DMA_RX_0>;
> +		};
> +
> +		codec {
> +			sound-dai = <&left_spkr>, <&right_spkr>, <&swr0 0>, <&wsamacro 0>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +	};
> +
> +	va-dai-link {
> +		link-name = "VA Capture";
> +		cpu {
> +			sound-dai = <&q6apmbedai TX_CODEC_DMA_TX_3>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6apm>;
> +		};
> +
> +		codec {
> +			sound-dai = <&vamacro 0>;
> +		};
> +	};
> +};
> +
> +&swr0 {
> +	left_spkr: wsa8830-left@0,1 {
> +		compatible = "sdw10217020200";
> +		reg = <0 1>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spkr_1_sd_n_default>;
> +		powerdown-gpios = <&tlmm 178 GPIO_ACTIVE_LOW>;
> +		#thermal-sensor-cells = <0>;
> +		sound-name-prefix = "SpkrLeft";
> +		#sound-dai-cells = <0>;
> +		vdd-supply = <&vreg_s10b>;
> +	};
> +
> +	right_spkr: wsa8830-right@0,2{
> +		compatible = "sdw10217020200";
> +		reg = <0 2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&spkr_2_sd_n_default>;
> +		powerdown-gpios = <&tlmm 179 GPIO_ACTIVE_LOW>;
> +		#thermal-sensor-cells = <0>;
> +		sound-name-prefix = "SpkrRight";
> +		#sound-dai-cells = <0>;
> +		vdd-supply = <&vreg_s10b>;
> +	};
> +};
> +
> +&swr1 {
> +	status = "okay";
> +
> +	wcd_rx: wcd9380-rx@0,4 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 4>;
> +		qcom,rx-port-mapping = <1 2 3 4 5>;
> +	};
> +};
> +
> +&swr2 {
> +	status = "okay";
> +
> +	wcd_tx: wcd9380-tx@0,3 {
> +		compatible = "sdw20217010d00";
> +		reg = <0 3>;
> +		qcom,tx-port-mapping = <1 1 2 3>;
> +	};
> +};
> +
> +&vamacro {
> +	pinctrl-0 = <&dmic01_default>, <&dmic02_default>;
> +	pinctrl-names = "default";
> +	vdd-micb-supply = <&vreg_s10b>;
> +	qcom,dmic-sample-rate = <600000>;
> +};
> +
>  &usb_0 {
>  	status = "okay";
>  };
> @@ -808,6 +993,26 @@ qup2_i2c5_default: qup2-i2c5-default-state {
>  		drive-strength = <16>;
>  	};
>  
> +	spkr_1_sd_n_default: spkr-1-sd-n-default-state {
> +		perst-n-pins {
> +			pins = "gpio178";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +			output-high;
> +		};
> +	};
> +
> +	spkr_2_sd_n_default: spkr-2-sd-n-default-state {
> +		perst-n-pins {
> +			pins = "gpio179";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-disable;
> +			output-high;
> +		};
> +	};
> +
>  	tpad_default: tpad-default-state {
>  		int-n-pins {
>  			pins = "gpio182";
> @@ -830,4 +1035,12 @@ reset-n-pins {
>  			drive-strength = <16>;
>  		};
>  	};
> +
> +	wcd_default: wcd-default-state {
> +		reset-pins {
> +			pins = "gpio106";
> +			function = "gpio";
> +			bias-disable;
> +		};
> +	};
>  };
