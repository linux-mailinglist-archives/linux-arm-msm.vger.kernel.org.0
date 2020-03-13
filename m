Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 790C8184884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 14:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726794AbgCMNxb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 09:53:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:51744 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726695AbgCMNxb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 09:53:31 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 3A965206B7;
        Fri, 13 Mar 2020 13:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584107609;
        bh=HnEW42TbU4FLknhXioegkFJkSnYu92M53fwbC4zqmK0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KPOuFAn394Mu4Iz+JJ1Q3IFT9X+2cnQcdxpclr7Yglb6urdp1d9VnbgruAtmIMNmH
         jQvKnUywG/4i7w3zaCCkPsfI7wwj3VrOjm3BkkeQO5IeqZCL1fHTcVRP0A88v3GX4q
         QfGtGMf1hFvkvE2oyskDyI2FU0Ec3zPiPXgs8KZc=
Date:   Fri, 13 Mar 2020 19:23:24 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: db845c: add analog audio support
Message-ID: <20200313135324.GM4885@vkoul-mobl>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
 <20200312143024.11059-6-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312143024.11059-6-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-03-20, 14:30, Srinivas Kandagatla wrote:
> This patch adds support to Analog audio via WSA881x speakers.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts | 159 +++++++++++++++++++++
>  1 file changed, 159 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index 6e60e81f8db7..94aa9227ca51 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -8,6 +8,8 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include "sdm845.dtsi"
>  #include "pm8998.dtsi"
>  #include "pmi8998.dtsi"
> @@ -200,6 +202,40 @@
>  	firmware-name = "qcom/sdm845/adsp.mdt";
>  };
>  
> +
> +&wcd9340{

Here as well :)

> +	pinctrl-0 = <&wcd_intr_default>;
> +	pinctrl-names = "default";
> +	clock-names = "extclk";
> +	clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
> +	reset-gpios = <&tlmm 64 0>;
> +	vdd-buck-supply = <&vreg_s4a_1p8>;
> +	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
> +	vdd-tx-supply = <&vreg_s4a_1p8>;
> +	vdd-rx-supply = <&vreg_s4a_1p8>;
> +	vdd-io-supply = <&vreg_s4a_1p8>;
> +
> +	swm: swm@c85 {
> +		left_spkr: wsa8810-left{
> +			compatible = "sdw10217201000";
> +			reg = <0 1>;
> +			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
> +			#thermal-sensor-cells = <0>;
> +			sound-name-prefix = "SpkrLeft";
> +			#sound-dai-cells = <0>;
> +		};
> +
> +		right_spkr: wsa8810-right{
> +			compatible = "sdw10217201000";
> +			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
> +			reg = <0 2>;
> +			#thermal-sensor-cells = <0>;
> +			sound-name-prefix = "SpkrRight";
> +			#sound-dai-cells = <0>;
> +		};
> +	};
> +};
> +
>  &apps_rsc {
>  	pm8998-rpmh-regulators {
>  		compatible = "qcom,pm8998-rpmh-regulators";
> @@ -535,6 +571,15 @@
>  		function = "gpio";
>  		bias-pull-up;
>  	};
> +
> +	wcd_intr_default: wcd_intr_default {
> +		pins = <54>;
> +		function = "gpio";
> +
> +		input-enable;
> +		bias-pull-down;
> +		drive-strength = <2>;
> +	};
>  };
>  
>  &uart6 {
> @@ -674,3 +719,117 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +/* QUAT I2S Uses 4 I2S SD Lines for audio on LT9611 HDMI Bridge */
> +&q6afedai {
> +	qi2s@22 {
> +		reg = <22>;
> +		qcom,sd-lines = <0 1 2 3>;
> +	};
> +};
> +
> +&q6asmdai {
> +	dai@0 {
> +		reg = <0>;
> +		direction = <2>;
> +	};
> +
> +	dai@1 {
> +		reg = <1>;
> +		direction = <2>;
> +	};
> +
> +	dai@2 {
> +		reg = <2>;
> +		direction = <1>;
> +	};
> +
> +	dai@3 {
> +		reg = <3>;
> +		direction = <2>;
> +		is-compress-dai;
> +	};
> +};
> +
> +&sound {
> +	compatible = "qcom,db845c-sndcard";
> +	pinctrl-0 = <&quat_mi2s_active
> +			 &quat_mi2s_sd0_active
> +			 &quat_mi2s_sd1_active
> +			 &quat_mi2s_sd2_active
> +			 &quat_mi2s_sd3_active>;
> +	pinctrl-names = "default";
> +	model = "DB845c";
> +	audio-routing =
> +		"RX_BIAS", "MCLK",
> +		"AMIC1", "MIC BIAS1",
> +		"AMIC2", "MIC BIAS2",
> +		"DMIC0", "MIC BIAS1",
> +		"DMIC1", "MIC BIAS1",
> +		"DMIC2", "MIC BIAS3",
> +		"DMIC3", "MIC BIAS3",
> +		"SpkrLeft IN", "SPK1 OUT",
> +		"SpkrRight IN", "SPK2 OUT",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MM_DL2",  "MultiMedia2 Playback",
> +		"MM_DL4",  "MultiMedia4 Playback",
> +		"MultiMedia3 Capture", "MM_UL3";
> +
> +	mm1-dai-link {
> +		link-name = "MultiMedia1";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA1>;
> +		};
> +	};
> +
> +	mm2-dai-link {
> +		link-name = "MultiMedia2";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA2>;
> +		};
> +	};
> +
> +	mm3-dai-link {
> +		link-name = "MultiMedia3";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA3>;
> +		};
> +	};
> +
> +	mm4-dai-link {
> +		link-name = "MultiMedia4";
> +		cpu {
> +			sound-dai = <&q6asmdai  MSM_FRONTEND_DAI_MULTIMEDIA4>;
> +		};
> +	};
> +
> +	slim-dai-link {
> +		link-name = "SLIM Playback";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_RX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai =  <&left_spkr>, <&right_spkr>, <&swm 0>, <&wcd9340 0>;
> +		};
> +	};
> +
> +	slimcap-dai-link {
> +		link-name = "SLIM Capture";
> +		cpu {
> +			sound-dai = <&q6afedai SLIMBUS_0_TX>;
> +		};
> +
> +		platform {
> +			sound-dai = <&q6routing>;
> +		};
> +
> +		codec {
> +			sound-dai = <&wcd9340 1>;
> +		};
> +	};
> +};
> -- 
> 2.21.0

-- 
~Vinod
