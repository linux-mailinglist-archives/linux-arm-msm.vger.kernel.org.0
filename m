Return-Path: <linux-arm-msm+bounces-25789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CDA1692CE6F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 11:43:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4F6BF1F21F4E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jul 2024 09:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC51A18FA10;
	Wed, 10 Jul 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lrWWzOMT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B08EF127B56;
	Wed, 10 Jul 2024 09:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720604622; cv=none; b=S8tcLAbU+XRnLKvN01PEVs96JDvXAAuYvn5ZFS0+SvXKeSQ49Q4jTybBCNAB7J5GsGPXp+BKnLX1+xl1WxUFRDsXVdGgVFE0vmzWueF91LWjP6wW/F1feEr8pbapQljnkxHBFM7+OiX9H+Fsw0U5jt2CTdGx557pDdOCo8kpCU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720604622; c=relaxed/simple;
	bh=V6/rLI5eK2Bd/k+91a+tVhir4BqHhZO2eZehfW1uqPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=N+eNef4VWQqpVWyrdezVYJis+C4znXYE6ig/QsI1X6Q8rbmMgIO4gxM8Grs1ALDuzRywDOp8k4rDmyGdlpxmQXyehR4GfcJcBRVktEBjFkEhf7s9JLPpJwzTWj0hPElYSZsGjfwyPSjWe8RZtbU3iAINC72/dve++mfdAqEBRsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lrWWzOMT; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC8E3C32782;
	Wed, 10 Jul 2024 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720604622;
	bh=V6/rLI5eK2Bd/k+91a+tVhir4BqHhZO2eZehfW1uqPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lrWWzOMTHoxOFmlV9CuqamyfElDVz8QFUOgnfRl8X3iAPdUtY2DHwDwEwL7E21KJj
	 Jwa8hTy7aXTckqoPQBKcmiOLDI5cEG2058JIX4CwFggCxGQBN85r61QdyVKRRHJjqn
	 HNv9rGwFLbSSf972+xYY45ilG4FMNU0Wyoy2b6ELCJZ0Y9p/a4AHuFE3olGUV85erM
	 KKr2JS3kzMAV1ILnDPFJvtKSu4vzxKMNUT1/3kj0E6TVZnzy9TOEG4QZ//WMTcXTLT
	 woyuOAq1Ew51/l5nVQcLvF8phDoyd9w/f0iIjn385AtQBwgUFDzBjS/rGNMpUG3wAe
	 3s+jPQMt6oXRg==
Message-ID: <8854136e-c75f-40de-9ba1-a2f3cf0211a1@kernel.org>
Date: Wed, 10 Jul 2024 11:43:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] ARM: dts: qcom: apq8064: adhere to pinctrl dtschema
To: Rayyan Ansari <rayyan.ansari@linaro.org>, linux-arm-msm@vger.kernel.org
Cc: Bjorn Andersson <andersson@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org,
 Rob Herring <robh@kernel.org>
References: <20240710084250.11342-1-rayyan.ansari@linaro.org>
 <20240710084250.11342-2-rayyan.ansari@linaro.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20240710084250.11342-2-rayyan.ansari@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/07/2024 10:41, Rayyan Ansari wrote:
> Pass dt_binding_check for qcom,apq8064-pinctrl.yaml.

dtbs_check

> Also correct spelling error ("drive-strengh" -> "drive-strength").
> 
> Signed-off-by: Rayyan Ansari <rayyan.ansari@linaro.org>
> ---
>  .../dts/qcom/qcom-apq8064-asus-nexus7-flo.dts |   4 -
>  .../boot/dts/qcom/qcom-apq8064-cm-qs600.dts   |  25 +-
>  .../boot/dts/qcom/qcom-apq8064-ifc6410.dts    |  25 +-
>  arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi | 362 +++++++-----------
>  .../qcom-apq8064-sony-xperia-lagan-yuga.dts   |  10 +-
>  arch/arm/boot/dts/qcom/qcom-apq8064.dtsi      |  34 +-
>  6 files changed, 172 insertions(+), 288 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> index d460743fbb94..947183992850 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-asus-nexus7-flo.dts
> @@ -125,8 +125,6 @@ &gsbi1 {
>  &gsbi1_i2c {
>  	status = "okay";
>  	clock-frequency = <200000>;
> -	pinctrl-0 = <&i2c1_pins>;
> -	pinctrl-names = "default";

This looks unrelated - probably candidate for its own patch.

>  
>  	eeprom@52 {
>  		compatible = "atmel,24c128";
> @@ -148,8 +146,6 @@ &gsbi3 {
>  
>  &gsbi3_i2c {
>  	clock-frequency = <200000>;
> -	pinctrl-0 = <&i2c3_pins>;
> -	pinctrl-names = "default";
>  	status = "okay";
>  
>  	trackpad@10 {
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> index 671d58cc2741..178c55c1efeb 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-cm-qs600.dts
> @@ -188,24 +188,17 @@ &sdcc4 {
>  };
>  
>  &tlmm_pinmux {
> -	card_detect: card_detect {
> -		mux {
> -			pins = "gpio26";
> -			function = "gpio";
> -			bias-disable;
> -		};
> +	card_detect: card-detect-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		bias-disable;
>  	};
>  
> -	pcie_pins: pcie_pinmux {
> -		mux {
> -			pins = "gpio27";
> -			function = "gpio";
> -		};
> -		conf {
> -			pins = "gpio27";
> -			drive-strength = <12>;
> -			bias-disable;
> -		};
> +	pcie_pins: pcie-state {
> +		pins = "gpio27";
> +		function = "gpio";
> +		drive-strength = <12>;
> +		bias-disable;
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> index ed86b24119c9..b3ff8010b149 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-ifc6410.dts
> @@ -321,24 +321,17 @@ &sdcc4 {
>  };
>  
>  &tlmm_pinmux {
> -	card_detect: card_detect {
> -		mux {
> -			pins = "gpio26";
> -			function = "gpio";
> -			bias-disable;
> -		};
> +	card_detect: card-detect-state {
> +		pins = "gpio26";
> +		function = "gpio";
> +		bias-disable;
>  	};
>  
> -	pcie_pins: pcie_pinmux {
> -		mux {
> -			pins = "gpio27";
> -			function = "gpio";
> -		};
> -		conf {
> -			pins = "gpio27";
> -			drive-strength = <12>;
> -			bias-disable;
> -		};
> +	pcie_pins: pcie-state {
> +		pins = "gpio27";
> +		function = "gpio";
> +		drive-strength = <12>;
> +		bias-disable;
>  	};
>  };
>  
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> index 7c545c50847b..e53de709e9d1 100644
> --- a/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-pins.dtsi
> @@ -1,318 +1,218 @@
>  // SPDX-License-Identifier: GPL-2.0
>  
>  &tlmm_pinmux {
> -	sdc4_gpios: sdc4-gpios {
> -		pios {
> -			pins = "gpio63", "gpio64", "gpio65", "gpio66", "gpio67", "gpio68";
> -			function = "sdc4";
> -		};
> -	};
> -
> -	sdcc1_pins: sdcc1-pin-active {
> -		clk {
> +	sdcc1_default_state: sdcc1-default-state {
> +		clk-pins {
>  			pins = "sdc1_clk";
> -			drive-strengh = <16>;
> +			drive-strength = <16>;

Such corrections should be separate patches.

>  			bias-disable;
>  		};
>  

> -		cmd {
> +		cmd-pins {
>  			pins = "sdc1_cmd";
> -			drive-strengh = <10>;
> +			drive-strength = <10>;
>  			bias-pull-up;
>  		};


Best regards,
Krzysztof


