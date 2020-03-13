Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5FACF18487C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Mar 2020 14:52:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726713AbgCMNwv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 Mar 2020 09:52:51 -0400
Received: from mail.kernel.org ([198.145.29.99]:51594 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726323AbgCMNwu (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 Mar 2020 09:52:50 -0400
Received: from localhost (unknown [171.76.107.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A492C20724;
        Fri, 13 Mar 2020 13:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584107569;
        bh=gbQYfc95VUt2xsmHphOrZ4dB5Q3e2DQEEkyOEiCVu+I=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=epZzDc9IPI4mcc2M4oFk1ni+nevBZsI67E8xm0cfmRRBZAQy5Mamup/jvVk69ZQKd
         Nz21udT9XPwziB6k1fpOn0CwT43kAPVdSlsNyAABh0xaM/6rOMO1ET2B0g5GjBsAS9
         zpC+oOfo+C8PXCN2bJ0O+l8EaIxcSQOaT2S19MfE=
Date:   Fri, 13 Mar 2020 19:22:43 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        robh+dt@kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] arm64: dts: qcom: c630: Enable audio support
Message-ID: <20200313135243.GL4885@vkoul-mobl>
References: <20200312143024.11059-1-srinivas.kandagatla@linaro.org>
 <20200312143024.11059-4-srinivas.kandagatla@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200312143024.11059-4-srinivas.kandagatla@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 12-03-20, 14:30, Srinivas Kandagatla wrote:
> This patch add support to audio via WSA881x Speakers and Headset.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
> ---
>  .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 113 ++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> index b255be3a4a0a..31c22836f84e 100644
> --- a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
> @@ -7,7 +7,10 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
>  #include "sdm845.dtsi"
>  #include "pm8998.dtsi"
>  
> @@ -353,6 +356,107 @@
>  	status = "okay";
>  };
>  
> +&wcd9340{

We sort this alphabetically, so this should come little later, other
than this, lgtm

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
> +	swm: swm@c85 {
> +		left_spkr: wsa8810-left{
> +			compatible = "sdw10217211000";
> +			reg = <0 3>;
> +			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_HIGH>;
> +			#thermal-sensor-cells = <0>;
> +			sound-name-prefix = "SpkrLeft";
> +			#sound-dai-cells = <0>;
> +		};
> +
> +		right_spkr: wsa8810-right{
> +			compatible = "sdw10217211000";
> +			powerdown-gpios = <&wcdgpio 3 GPIO_ACTIVE_HIGH>;
> +			reg = <0 4>;
> +			#thermal-sensor-cells = <0>;
> +			sound-name-prefix = "SpkrRight";
> +			#sound-dai-cells = <0>;
> +		};
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
> +		direction = <1>;
> +	};
> +};
> +
> +&sound {
> +	compatible = "qcom,db845c-sndcard";
> +	model = "Lenovo-YOGA-C630-13Q50";
> +
> +	audio-routing =
> +		"RX_BIAS", "MCLK",
> +		"AMIC2", "MIC BIAS2",
> +		"SpkrLeft IN", "SPK1 OUT",
> +		"SpkrRight IN", "SPK2 OUT",
> +		"MM_DL1",  "MultiMedia1 Playback",
> +		"MultiMedia2 Capture", "MM_UL2";
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
> +
>  &tlmm {
>  	gpio-reserved-ranges = <0 4>, <81 4>;
>  
> @@ -382,6 +486,15 @@
>  		bias-pull-up;
>  		drive-strength = <2>;
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
> -- 
> 2.21.0

-- 
~Vinod
