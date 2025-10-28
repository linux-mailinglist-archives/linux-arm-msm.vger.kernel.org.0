Return-Path: <linux-arm-msm+bounces-79121-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 26494C136A8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 09:00:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 76B984F0FCF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Oct 2025 07:59:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09D542D5C6E;
	Tue, 28 Oct 2025 07:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JtvVYmhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFC8E2D46CE;
	Tue, 28 Oct 2025 07:59:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761638385; cv=none; b=FNoNHzsTRHcNkBZChBuzRKABQ4KbSPQA1YP4YhfQwU/Y5Z2wzNJQRuD0TH/Yh3kmwva30QaJ8UJDN+fks+AyTYhzke+L92VDL2AIgpciEo4Y1n/C27tb7deHgRGR8Nv7ulN5ljnORHGgzF91QZQruLJqvYqTTA4swJG+VOaAygA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761638385; c=relaxed/simple;
	bh=HfhMDobu1SUJQyYm0YX92oqWhBmLIXxHwW9QTp0RVDI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kKGphsjSFYFn8NIWTJIx9NpBBjrUK6dDiCuIw2aG+iWuy2PARAgeCO19TphhBPL5I8Oja+2T4pKn99aypP4eJDM8hSGEh/IqJeLaYluTq1AuzsGy+OXUIVBwCOLI1UH4KE7+YnZThEp1Gck+SwsZkEta0aGTaghVj12vFaAlecU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JtvVYmhE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF859C113D0;
	Tue, 28 Oct 2025 07:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761638385;
	bh=HfhMDobu1SUJQyYm0YX92oqWhBmLIXxHwW9QTp0RVDI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JtvVYmhEA4zlBpixwOQbzKeOOcqy/fJn6a/Bz4ie9T8WY7sF/wFRGACulRgv+IdpU
	 Oz3v0SSL1haWVDAXEZ/jaxgoc86TaMjmMRCk7H0Y/rr/BB4qnt/9I6i0KYIpsyr0xx
	 yaaOxA14HikP4WQr9MB2N99NzfZrXs1D1Nk7w/TxKXSIOmpB53dQV/obmN9QO2pakQ
	 MuqdjU2lBHhM0cRTE52LdeQhUqtTV6PzbOmmkk1yTVhwNnXUOLVL2cSNF3HGmGMEkE
	 OZJvQII9P/pVEPYHcoyBK+inEdFLs0raFw5xIWuNc5vxmx7xkggmbLskDcM9XRgKER
	 9Fx6yOYSTnifA==
Date: Tue, 28 Oct 2025 08:59:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] arm64: dts: qcom: talos-evk: Add support for
 QCS615 talos evk board
Message-ID: <20251028-proud-bullfrog-of-aurora-e2cdba@kuoka>
References: <20251028053248.723560-1-tessolveupstream@gmail.com>
 <20251028053248.723560-3-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251028053248.723560-3-tessolveupstream@gmail.com>

On Tue, Oct 28, 2025 at 11:02:48AM +0530, Sudarshan Shetty wrote:
> Introduce the device tree support for the QCS615-based talos-evk
> platform, which follows the SMARC (Smart Mobility ARChitecture)
> standard. The platform is composed of two main hardware
> components: the talos-evk-som and the talos-evk carrier board.
> 
> The talos-evk-som is a compact System on Module that integrates the
> QCS615 SoC, PMIC, and essential GPIO connectivity. It follows the
> SMARC standard, which defines a modular form factor allowing the SoM
> to be paired with different carrier boards for varied applications.

Drop paragraph, completely redundant. Please write concise, informative
messages, not something redundant and obvious. Or worse - marketing
junk.

> 
> The talos-evk is one such carrier board, designed for evaluation
> and development purposes. It provides additional peripherals
> such as UART, USB, and other interfaces to enable rapid
> prototyping and hardware bring-up.
> 
> This initial device tree provides the basic configuration needed
> to boot the platform to a UART shell. Further patches will extend
> support for additional peripherals and subsystems.

Drop paragraph, it is contradictory to the next one.

> 
> The initial device tree includes basic support for:
> 
> - CPU and memory
> 

Drop blank lines

between

each

of

points. No need to inflate already huge commit msg.


> - UART
> 
> - GPIOs
> 
> - Regulators
> 
> - PMIC
> 
> - Early console
> 
> - AT24MAC602 EEPROM
> 
> - MCP2515 SPI to CAN
> 
> - Hook up the ADV7535 DSI-to-HDMI bridge
> 
> - Add DP connector node and MDSS DisplayPort controller.
> 
> QCS615 talos-evk uses a Quectel AF68E WiFi/BT module (PCIe for
> WiFi and UART for Bluetooth), which is different from the RIDE
> platform. Plan to enable these in a follow-up patch series.

Drop plans, not related. I also do not understand why you mention here
RIDE. Does it mean you are duplicating the board?

> 

..


> +&sdhc_1 {
> +	pinctrl-0 = <&sdc1_state_on>;
> +	pinctrl-1 = <&sdc1_state_off>;
> +	pinctrl-names = "default", "sleep";
> +
> +	bus-width = <8>;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	vmmc-supply = <&vreg_l17a>;
> +	vqmmc-supply = <&vreg_s4a>;
> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	status = "okay";
> +};
> +
> +&spi6 {
> +	status = "okay";
> +
> +	mcp2515@0 {

Still no improvements.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +		compatible = "microchip,mcp2515";
> +		reg = <0>;
> +		clock-frequency = <20000000>;
> +		interrupts-extended = <&tlmm 87 IRQ_TYPE_LEVEL_LOW>;
> +		spi-max-frequency = <10000000>;
> +		vdd-supply = <&vreg_v3p3_can>;
> +		xceiver-supply = <&vreg_v5p0_can>;
> +	};
> +};

..

> diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
> new file mode 100644
> index 000000000000..5c2ac67383e7
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
> @@ -0,0 +1,133 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-evk-som.dtsi"
> +
> +/ {
> +	model = "Qualcomm QCS615 IQ 615 EVK";
> +	compatible = "qcom,talos-evk", "qcom,qcs615", "qcom,sm6150";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		mmc1 = &sdhc_2;
> +	};
> +
> +	dp0-connector {

dp-connector, unless there is here dp1. But then follow standard
practice of adding suffixes, so connector-0, connector-1, etc. I could
understand dp-connector-1 if you find dp-connector here:

https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

> +		compatible = "dp-connector";
> +		label = "DP0";
> +		type = "full-size";
> +
> +		hpd-gpios = <&tlmm 104 GPIO_ACTIVE_HIGH>;
> +
> +		port {
> +			dp0_connector_in: endpoint {
> +				remote-endpoint = <&mdss_dp0_out>;
> +			};
> +		};
> +	};

...

> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	adv7535: adv7535@3d {

Still no improvements.

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

Best regards,
Krzysztof


