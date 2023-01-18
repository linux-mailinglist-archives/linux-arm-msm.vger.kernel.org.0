Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 158346718F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Jan 2023 11:31:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229522AbjARKbm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Jan 2023 05:31:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229718AbjARKbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Jan 2023 05:31:01 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF852460A9
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:37:37 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id f12-20020a7bc8cc000000b003daf6b2f9b9so957005wml.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Jan 2023 01:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SlXdMnohgTgOSmYXN/+nJ2ugAtkkRABO8jUn9gLe5Sg=;
        b=r1DPs+v2CB2WVUYXcG8SE+EAoKOeme4NfjTALyWM0VhdMHRBEztXcRVBsM35asLcrn
         cMS/5XNqtIbZmOck/yAsheG3yr3d/2xJH/n05MkuCty1CuwY89kt5UtgBQyVAYDWLLo9
         E4W4b9eJMztJ9wf5o5RL/q6I8MUhkUUFe1VThWYqYDGqaIBNmvh0N/XzFVZaPXMQ6VsU
         /U3vZMcyHISrPlq1CKqxqkioSfkIjO4yZd/BbakXFcX9hWQG2hamvebqSs+gl0Kf9M/5
         K9s07r2Uvb0qC2U2jM6kAUT62cnNquvZvaSTFI3fkHlMQBh33VIqnAZrcEA/MTRF5UDi
         uX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SlXdMnohgTgOSmYXN/+nJ2ugAtkkRABO8jUn9gLe5Sg=;
        b=4/zDd4iAxrjVUzb0Axqro8iRolrV6qMbuFi5XB/SH9/fjS1o5FKrJe1PNSfgYbZ4Kz
         LA2v4uzqjNZYsiY10eiDGhsu8vDvYc23PVk54R22YBX8KlfuoirENJt/lWn5z/J4cs1u
         SGfjbGtVgVMPWTeozSiv0XKxm4fvdZVzNMu/SYBUsLt4USm02RS4CnoWBS+7yo73BSy3
         Mk99zgPXo92B4TLU+bmHNC1VaOiUvADrB4WaKXpSR8UbaBqFsyeoO00z7JyTqm3GS5T5
         +wb9uF+3TgZShS5NRQHaERDppWrQTPp8kh6U6X0vKBLTdfQ8d7aRNUXKs29PryalV/is
         T0XA==
X-Gm-Message-State: AFqh2koJNSITHQi6KQYAOs5oVsRfGdY9HicKCr2AA9sQm0N4uIaE7kko
        NMnBLhqK7TzGYDkTbcMaMbY6aA==
X-Google-Smtp-Source: AMrXdXvHEiex5NCNHvYJrBnAUED7FeuOpSnjcWK4dWnNn6dxaxsCGW/8tKGGeizKWIb4LC2Vkp4CPg==
X-Received: by 2002:a7b:ce15:0:b0:3da:2932:b61a with SMTP id m21-20020a7bce15000000b003da2932b61amr5908491wmc.18.1674034642413;
        Wed, 18 Jan 2023 01:37:22 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f17-20020a1c6a11000000b003d9fba3c7a4sm1353549wmc.16.2023.01.18.01.37.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Jan 2023 01:37:21 -0800 (PST)
Message-ID: <a516cca3-acf6-61cd-20d8-9961c6bf3e52@linaro.org>
Date:   Wed, 18 Jan 2023 10:37:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] arm64: dts: qcom: sdm845-oneplus-*: add audio devices
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     phone-devel@vger.kernel.org,
        Dylan Van Assche <me@dylanvanassche.be>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20230118092040.1444129-1-caleb.connolly@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230118092040.1444129-1-caleb.connolly@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18/01/2023 10:20, Caleb Connolly wrote:
> Populate the audio devices found on the OnePlus 6 and 6T using the
> sdm845-sndcard driver.
> 
> Both devices have the earpiece and headphone jack connected to the
> WCD9341 codec. The OnePlus 6 uses the MAX98927 speaker codec which is
> already supported upstream. The OnePlus 6T uses a currently unsupported
> TFA9894 codec.
> 
> Two internal microphones are supported, as well as an external headset
> mic. Each DAI link is expected to be used for a single device.
> 
> Alsa UCM2 configs for this setup can be found here, they are not yet
> upstream and include support for call audio which is missing in this
> patch
> 
> https://gitlab.com/sdm845-mainline/alsa-ucm-conf/-/tree/9ed12836b269764c4a853411d38ccb6abb70b383/ucm2/OnePlus
> 
> Co-developed-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: Dylan Van Assche <me@dylanvanassche.be>
> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
> ---
>  .../boot/dts/qcom/sdm845-oneplus-common.dtsi  | 208 ++++++++++++++++++
>  .../dts/qcom/sdm845-oneplus-enchilada.dts     |  40 ++++
>  .../boot/dts/qcom/sdm845-oneplus-fajita.dts   |  29 +++
>  3 files changed, 277 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> index 42cf4dd5ea28..76017fad4443 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-common.dtsi
> @@ -9,6 +9,8 @@
>  
>  #include <dt-bindings/input/linux-event-codes.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  
>  #include "sdm845.dtsi"
>  #include "pm8998.dtsi"
> @@ -466,6 +468,44 @@ &pmi8998_rradc {
>  	status = "okay";
>  };
>  
> +&q6afedai {
> +	qi2s@22 {
> +		reg = <22>;
> +		qcom,sd-lines = <1>;
> +	};
> +
> +	qi2s@23 {
> +		reg = <23>;
> +		qcom,sd-lines = <0>;
> +	};
> +};
> +
> +&q6asmdai {
> +	dai@0 {
> +		reg = <0>;
> +	};
> +
> +	dai@1 {
> +		reg = <1>;
> +	};
> +
> +	dai@2 {
> +		reg = <2>;
> +	};
> +
> +	dai@3 {
> +		reg = <3>;
> +	};
> +
> +	dai@4 {
> +		reg = <4>;
> +	};
> +
> +	dai@5 {
> +		reg = <5>;
> +	};
> +};
> +
>  &qupv3_id_1 {
>  	status = "okay";
>  };
> @@ -505,6 +545,140 @@ pinconf-rx {
>  	};
>  };
>  
> +&sound {
> +	compatible = "qcom,sdm845-sndcard";
> +	pinctrl-0 = <&quat_mi2s_active &quat_mi2s_sd0_active &quat_mi2s_sd1_active>;
> +	pinctrl-names = "default";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm2-dai-link {
> +		link-name = "MultiMedia2";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +		};
> +	};
> +
> +	mm3-dai-link {
> +		link-name = "MultiMedia3";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +		};
> +	};
> +
> +	mm4-dai-link {
> +		link-name = "MultiMedia4";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA4>;
> +		};
> +	};
> +
> +	mm5-dai-link {
> +		link-name = "MultiMedia5";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA5>;
> +		};
> +	};
> +
> +	mm6-dai-link {
> +		link-name = "MultiMedia6";
> +		cpu {
> +			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA6>;
> +		};
> +	};
> +
> +	speaker_playback: speaker-dai-link {
> +		link-name = "Speaker Playback";
> +		cpu {
> +			sound-dai = <&q6afedai QUATERNARY_MI2S_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +	};
> +
> +	slim1-dai-link {
> +		link-name = "SLIM Playback 1";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 0>; /* AIF1_PB */
> +		};
> +	};
> +
> +	slimcap1-dai-link {
> +		link-name = "SLIM Capture 1";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 1>; /* AIF1_CAP */
> +		};
> +	};
> +
> +	slim2-dai-link {
> +		link-name = "SLIM Playback 2";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_1_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 2>; /* AIF2_PB */
> +		};
> +	};
> +
> +	slimcap2-dai-link {
> +		link-name = "SLIM Capture 2";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_1_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 3>; /* AIF2_CAP */
> +		};
> +	};
> +
> +	slimcap3-dai-link {
> +		link-name = "SLIM Capture 3";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_2_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 5>; /* AIF3_CAP */
> +		};
> +	};
> +};
> +
>  &uart6 {
>  	status = "okay";
>  
> @@ -634,6 +808,27 @@ mux {
>  			input-enable;
>  		};
>  	};
> +
> +	speaker_default: speaker-default-state {
> +		mux {

Drop and test dtbs_check with pinctrl bindings.

> +			pins = "gpio69";
> +			function = "gpio";
> +			drive-strength = <16>;
> +			bias-pull-up;
> +			output-high;
> +		};
> +	};
> +
> +	wcd_default: wcd-default-state {
> +		mux {

Drop

> +			pins = "gpio54";
> +			function = "gpio";
> +
> +			input-enable;
> +			bias-pull-down;
> +			drive-strength = <2>;
> +		};
> +	};
>  };
>  
>  &venus {
> @@ -641,6 +836,19 @@ &venus {
>  	firmware-name = "qcom/sdm845/oneplus6/venus.mbn";
>  };
>  
> +&wcd9340 {

I will send today v2 of
https://lore.kernel.org/all/20230113162245.117324-2-krzysztof.kozlowski@linaro.org/
which will conflict here. If my patch gets first, please rebase on top
of it.

> +	pinctrl-0 = <&wcd_default>;
> +	pinctrl-names = "default";
> +	clock-names = "extclk";
> +	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> +	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
> +	vdd-buck-supply = <&vreg_s4a_1p8>;
> +	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
> +	vdd-tx-supply = <&vreg_s4a_1p8>;
> +	vdd-rx-supply = <&vreg_s4a_1p8>;
> +	vdd-io-supply = <&vreg_s4a_1p8>;
> +};
> +
>  &wifi {
>  	status = "okay";
>  	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> index bf2cf92e8976..aae1a3a27144 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-enchilada.dts
> @@ -32,3 +32,43 @@ &display_panel {
>  &bq27441_fg {
>  	monitored-battery = <&battery>;
>  };
> +
> +&i2c4 {
> +	status = "okay";
> +
> +	max98927_codec: max98927@3a {

audio-codec
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "maxim,max98927";
> +		reg = <0x3a>;
> +		#sound-dai-cells = <1>;
> +
> +		pinctrl-0 = <&speaker_default>;
> +		pinctrl-names = "default";
> +
> +		reset-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> +
> +		vmon-slot-no = <1>;
> +		imon-slot-no = <0>;
> +	};
> +};
> +
> +&sound {
> +	model = "OnePlus 6";
> +	audio-routing =	"RX_BIAS", "MCLK",
> +			"AMIC2", "MIC BIAS2",
> +			"AMIC3", "MIC BIAS4",
> +			"AMIC4", "MIC BIAS1",
> +			"AMIC5", "MIC BIAS4";
> +
> +	speaker-dai-link {
> +		codec {
> +			sound-dai = <&max98927_codec 0>;
> +		};
> +	};
> +};
> +
> +&wcd9340 {
> +	qcom,micbias1-microvolt = <1800000>;
> +	qcom,micbias2-microvolt = <2700000>;
> +	qcom,micbias3-microvolt = <1800000>;
> +	qcom,micbias4-microvolt = <1800000>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> index 1b6b5bf368df..4b1a5d3c3713 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dts
> @@ -29,10 +29,39 @@ &display_panel {
>  	compatible = "samsung,s6e3fc2x01";
>  };
>  
> +&i2c4 {
> +	/* nxp,tfa9894 @ 0x34 */

I don't think this is related to this patch.

> +};
> +
>  &bq27441_fg {
>  	monitored-battery = <&battery>;
>  };
>  
> +&sound {
> +	model = "OnePlus 6T";
> +	audio-routing = "RX_BIAS", "MCLK",
> +			"AMIC1", "MIC BIAS3",
> +			"AMIC2", "MIC BIAS2",
> +			"AMIC3", "MIC BIAS4",
> +			"AMIC4", "MIC BIAS1",
> +			"AMIC5", "MIC BIAS3";
> +
> +};
> +
> +/*
> + * The TFA9894 codec is currently unsupported.
> + * We need to delete the node to allow the soundcard
> + * to probe for headphones/earpiece.
> + */
> +/delete-node/ &speaker_playback;
> +
>  &rmi4_f12 {
>  	touchscreen-y-mm = <148>;
>  };
> +
> +&wcd9340 {
> +	qcom,micbias1-microvolt = <2700000>;
> +	qcom,micbias2-microvolt = <2700000>;
> +	qcom,micbias3-microvolt = <2700000>;
> +	qcom,micbias4-microvolt = <2700000>;
> +};

Best regards,
Krzysztof

