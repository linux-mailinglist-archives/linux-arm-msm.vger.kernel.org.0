Return-Path: <linux-arm-msm+bounces-71052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F8C8B38EEE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Aug 2025 01:07:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 606FC3ABDD7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Aug 2025 23:07:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1C7530FC1F;
	Wed, 27 Aug 2025 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eufPEDRG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CBAF2586C7;
	Wed, 27 Aug 2025 23:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756336074; cv=none; b=Cho1caMaw53rY732Cv6UuXzYCnn9LkUgcZWig4HB7f9NlOrARcO7/eXPvrax4VSMOd3AM18gBPRDkHELJdAeD0LbT+V+ehc8Kgbqms0v29r/SmS7L6vZPFDFS5o7LWtFh2nrSKIo91HyxJP3whQplrdUwGQO2qQ+B/jbhJagcSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756336074; c=relaxed/simple;
	bh=XcAJ/8GaS3GChlT54qoyoeJUvpuYoOy8hejJVCtXf94=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OCjkcA6kGKs04Y82e+1AhThQOsC7R+xDle0sbf1+jba8iONfxQm1bIzmNdW2NwEFIxEEv7zYS5Ofxd1mhkY2gNRPyMOD9RXCVPGCghEl6WlWU4eMO+BBwZkcMG2VSon3GkZYdeZsAZ97EvaETnZTaOJDiTrGeghmvaoCoknXPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eufPEDRG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5811C4CEEB;
	Wed, 27 Aug 2025 23:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756336073;
	bh=XcAJ/8GaS3GChlT54qoyoeJUvpuYoOy8hejJVCtXf94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eufPEDRGDjTZmkB1GhOpmGFtYDeboh79e4JTblBKq+sVj+av5cc75fW1GBQCToRuG
	 hPZvgjNRXV6kHUN8H2QXSbn8YxwxTUpv7g8kIzScm9hJvFJc7Xot8gYXV791Iy80r3
	 GThANKCr9mgOfDFtKx5WUstEQwj8JKzCXtqGqlnQ6hZKQQtTh14oFYvQyncYEkLlUZ
	 KgeA9tjN9F1Wr9id1m8/tq4SxOlKR8BwKRqOywvmHNtoXWOhMjeIAz+TTAaRgqVlMR
	 xT5i6WWuDxWPWyo/ajhwNgS4aoReOkX4O+hRKDibqV6FUpOIlpAsQPwpaoX8i/dg1W
	 bcDQ1S03E+mOg==
Date: Wed, 27 Aug 2025 18:07:51 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Richard Cochran <richardcochran@gmail.com>, 
	kernel@oss.qualcomm.com, linux-mmc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org, 
	Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
Subject: Re: [PATCH 5/5] arm64: dts: qcom: lemans-evk: Add sound card
Message-ID: <kckx3uwj2zdc4iagsxhb6osyv2ki7n4qubyldnvwokkkftda77@ixrgr7vapwxj>
References: <20250826-lemans-evk-bu-v1-0-08016e0d3ce5@oss.qualcomm.com>
 <20250826-lemans-evk-bu-v1-5-08016e0d3ce5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250826-lemans-evk-bu-v1-5-08016e0d3ce5@oss.qualcomm.com>

On Tue, Aug 26, 2025 at 11:51:04PM +0530, Wasim Nazir wrote:
> From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> 
> Add the sound card node with tested playback over max98357a
> I2S speakers amplifier and I2S mic.
> 
> Introduce HS (High-Speed) MI2S pin control support.
> The I2S max98357a speaker amplifier is connected via HS0 and I2S
> microphones utilize the HS2 interface.

Please rewrite this as one fluent description of the hardware, not as 3
separate things thrown into the same commit message.

Regards,
Bjorn

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/lemans-evk.dts | 52 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/lemans.dtsi    | 14 +++++++++
>  2 files changed, 66 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans-evk.dts b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> index 642b66c4ad1e..4adf0f956580 100644
> --- a/arch/arm64/boot/dts/qcom/lemans-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/lemans-evk.dts
> @@ -7,6 +7,7 @@
>  
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
>  
>  #include "lemans.dtsi"
>  #include "lemans-pmics.dtsi"
> @@ -26,6 +27,17 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>  
> +	dmic: audio-codec-0 {
> +		compatible = "dmic-codec";
> +		#sound-dai-cells = <0>;
> +		num-channels = <1>;
> +	};
> +
> +	max98357a: audio-codec-1 {
> +		compatible = "maxim,max98357a";
> +		#sound-dai-cells = <0>;
> +	};
> +
>  	edp0-connector {
>  		compatible = "dp-connector";
>  		label = "EDP0";
> @@ -73,6 +85,46 @@ vreg_sdc: regulator-vreg-sdc {
>  		states = <1800000 0x1
>  			  2950000 0x0>;
>  	};
> +
> +	sound {
> +		compatible = "qcom,qcs9100-sndcard";
> +		model = "LEMANS-EVK";
> +
> +		pinctrl-0 = <&hs0_mi2s_active>, <&hs2_mi2s_active>;
> +		pinctrl-names = "default";
> +
> +		hs0-mi2s-playback-dai-link {
> +			link-name = "HS0 MI2S Playback";
> +
> +			codec {
> +				sound-dai = <&max98357a>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +
> +		hs2-mi2s-capture-dai-link {
> +			link-name = "HS2 MI2S Capture";
> +
> +			codec {
> +				sound-dai = <&dmic>;
> +			};
> +
> +			cpu {
> +				sound-dai = <&q6apmbedai TERTIARY_MI2S_TX>;
> +			};
> +
> +			platform {
> +				sound-dai = <&q6apm>;
> +			};
> +		};
> +	};
>  };
>  
>  &apps_rsc {
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 28f0976ab526..c8e6246b6062 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -5047,6 +5047,20 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
>  				bias-disable;
>  			};
>  
> +			hs0_mi2s_active: hs0-mi2s-active-state {
> +				pins = "gpio114", "gpio115", "gpio116", "gpio117";
> +				function = "hs0_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +			};
> +
> +			hs2_mi2s_active: hs2-mi2s-active-state {
> +				pins = "gpio122", "gpio123", "gpio124", "gpio125";
> +				function = "hs2_mi2s";
> +				drive-strength = <8>;
> +				bias-disable;
> +			};
> +
>  			qup_i2c0_default: qup-i2c0-state {
>  				pins = "gpio20", "gpio21";
>  				function = "qup0_se0";
> 
> -- 
> 2.51.0
> 

