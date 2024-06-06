Return-Path: <linux-arm-msm+bounces-21992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C06278FF499
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 20:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 32FDD1F2735C
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 18:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55293199394;
	Thu,  6 Jun 2024 18:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ce2+UUsY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C3FC02;
	Thu,  6 Jun 2024 18:26:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717698361; cv=none; b=KlFT+ikozAPlenCU0QD7N28Me478rF+OLRVvgOlOJfX/d91IUJVOg8mh6PXuHAGNANcZ3fqFNYeHAc94gxh5Qh8QsOvjerBnXPkmGq6dxt7Gg40TINw3h8YbtUwigGjawlYkX3zPId3SD7tBp+Lg9C3DJZ3AxJK+iOfEiGWyYSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717698361; c=relaxed/simple;
	bh=QP1BTZpwU6d9DwGDTSQVDuYczKU85rpooFsQhLZMceE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M5UIaYFrmmaOFwF4UsspkGhXo0/dB3+ReTJlSvMiP+wPj6daIEZyQB/gDcReCHpsjC4UmR18XxyVE3P3QFFxYQ9BUTHg/h44MjqiZqKqu+Lt5CzNU7/JiaVF8UBOB+rcLYD67tPXgbYTMlOH4G1gHnvnGOIcENaB3sQeTvmnZk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ce2+UUsY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31D9C2BD10;
	Thu,  6 Jun 2024 18:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717698360;
	bh=QP1BTZpwU6d9DwGDTSQVDuYczKU85rpooFsQhLZMceE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ce2+UUsYTSCYC8nN3/vt9IYa/Pa8Clo19dL9ggG93nt3N4mB86j30sbk8VYMnzXqo
	 doL5zkOloCG2p/YMrtQ7jE0a/PyqpDdSHS8eFRkI73kmmut9vh/ujm4pjWiMwbdyFp
	 yElOlInrdxq3lWJuKs7C8+mP96NIyVnqZm04ywLsroI07ZxorJC/Wvni5Vsel7IsGx
	 EWM3+IGiPrzPQ3UhhcUkIumCCtenos/v7iNGtXhHc0LO78iAtrXSyIs/zOetPYx7tE
	 YFq53pd0B3PeoM+oaYBB1vhQ5e5eIA8yTAEIpIr9ZD7nM3R8O14Owb8Q9Sd7mAnIxw
	 gL4TvJUTChMMA==
Date: Thu, 6 Jun 2024 13:25:58 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Subject: Re: [PATCH v6] arch: arm64: dts: sm8650-hdk: add support for the
 Display Card overlay
Message-ID: <pmg5nlbfvysbm2vbdd3r7kiiuh5vbk5gawzzbrb7tcfbfcds5s@d6dbmygje52r>
References: <20240606-topic-sm8650-upstream-hdk-v6-1-fb034fe864cc@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606-topic-sm8650-upstream-hdk-v6-1-fb034fe864cc@linaro.org>

On Thu, Jun 06, 2024 at 02:50:22PM GMT, Neil Armstrong wrote:
> With the SM8650-HDK, a Display Card kit can be connected to provide
> a VTDR6130 display with Goodix Berlin Touch controller.
> 
> In order to route the DSI lanes to the connector for the Display
> Card kit, a switch must be changed on the board.
> 
> The HDMI nodes are disabled since the DSI lanes are shared with
> the DSI to HDMI transceiver.
> 
> Add support for this card as an overlay and apply it it at
> build-time to the sm8650-hdk dtb.
> 
> Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Tested-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

Please double check your subject prefix to match other similar files in
the future.

Thanks,
Bjorn

> ---
> The SM8650-HDK is an embedded development platforms for the
> Snapdragon 8 Gen 3 SoC aka SM8650, with the following features:
> - Qualcomm SM8650 SoC
> - 16GiB On-board LPDDR5
> - On-board WiFi 7 + Bluetooth 5.3/BLE
> - On-board UFS4.0
> - M.2 Key B+M Gen3x2 PCIe Slot
> - HDMI Output
> - USB-C Connector with DP Almode & Audio Accessory mode
> - Micro-SDCard Slot
> - Audio Jack with Playback and Microphone
> - 2 On-board Analog microphones
> - 2 On-board Speakers
> - 96Boards Compatible Low-Speed and High-Speed connectors [1]
> - For Camera, Sensors and external Display cards
> - Compatible with the Linaro Debug board [2]
> - SIM Slot for Modem
> - Debug connectors
> - 6x On-Board LEDs
> 
> An optional Display Card kit can be connected on top,
> an overlay is handled to add support for the DSI Display
> and Touch Controller.
> 
> Product Page: [3]
> 
> Dependencies: None
> 
> [1] https://www.96boards.org/specifications/
> [2] https://git.codelinaro.org/linaro/qcomlt/debugboard
> [3] https://www.lantronix.com/products/snapdragon-8-gen-3-mobile-hardware-development-kit/
> 
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konrad.dybcio@linaro.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> 
> Changes in v6:
> - added comment explaining why we disable nodes
> - removed useles comment on why we add the port/endpoint/address/size-cells
> - added Konrad's review
> - Link to v5: https://lore.kernel.org/r/20240606-topic-sm8650-upstream-hdk-v5-1-5d878f3047e3@linaro.org
> 
> Changes in v5:
> - Resend the display card overlay now the I2C crash is fixed
> - Link to v4: https://lore.kernel.org/r/20240422-topic-sm8650-upstream-hdk-v4-0-b33993eaa2e8@linaro.org
> 
> Changes in v4:
> - Rebased on next and fixed the apply failures
> - Link to v3: https://lore.kernel.org/r/20240325-topic-sm8650-upstream-hdk-v3-0-4f365d7932af@linaro.org
> 
> Changes in v3:
> - fixed regulator node name to fix ordering
> - deleted pcie_1_phy_aux clock
> - removed undeeded mdss_mdp status okay
> - collected revied & tested tags
> - Link to v2: https://lore.kernel.org/r/20240318-topic-sm8650-upstream-hdk-v2-0-b63a5d45a784@linaro.org
> 
> Changes in v2:
> - Fixed commit messages with links, and recently added product page URL
> - Swapped i2c3/i2c6 nodes
> - Moved pcie_1_phy_aux_clk under pcie1_phy
> - Removed duplicate mdp_vsync pinctrl state
> - Collected review & tested tags
> - Link to v1: https://lore.kernel.org/r/20240223-topic-sm8650-upstream-hdk-v1-0-ccca645cd901@linaro.org
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |   4 +
>  .../boot/dts/qcom/sm8650-hdk-display-card.dtso     | 141 +++++++++++++++++++++
>  2 files changed, 145 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 56992fc3fc59..0c1cebd16649 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -250,6 +250,10 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-samsung-q5q.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8550-sony-xperia-yodo-pdx234.dtb
> +
> +sm8650-hdk-display-card-dtbs	:= sm8650-hdk.dtb sm8650-hdk-display-card.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk-display-card.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-hdk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
> new file mode 100644
> index 000000000000..cb102535838d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sm8650-hdk-display-card.dtso
> @@ -0,0 +1,141 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) 2024, Linaro Limited
> + */
> +
> +/*
> + * Display Card kit overlay
> + * This requires S5702 Switch 7 to be turned to OFF to route DSI0 to the display panel
> + */
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/dts-v1/;
> +/plugin/;
> +
> +/* Disable HDMI bridge related nodes (mutually exclusive with the display card) */
> +
> +&i2c6 {
> +	status = "disabled";
> +};
> +
> +&lt9611_1v2 {
> +	status = "disabled";
> +};
> +
> +&lt9611_3v3 {
> +	status = "disabled";
> +};
> +
> +&vreg_bob_3v3 {
> +	status = "disabled";
> +};
> +
> +&lt9611_codec {
> +	status = "disabled";
> +};
> +
> +&mdss_dsi0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	panel@0 {
> +		compatible = "visionox,vtdr6130";
> +		reg = <0>;
> +
> +		reset-gpios = <&tlmm 133 GPIO_ACTIVE_LOW>;
> +
> +		vddio-supply = <&vreg_l12b_1p8>;
> +		vci-supply = <&vreg_l13b_3p0>;
> +		vdd-supply = <&vreg_l11b_1p2>;
> +
> +		pinctrl-0 = <&disp0_reset_n_active>, <&mdp_vsync>;
> +		pinctrl-1 = <&disp0_reset_n_suspend>, <&mdp_vsync>;
> +		pinctrl-names = "default", "sleep";
> +
> +		port {
> +			panel0_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			mdss_dsi0_out: endpoint {
> +				remote-endpoint = <&panel0_in>;
> +			};
> +		};
> +	};
> +};
> +
> +&spi4 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	touchscreen@0 {
> +		compatible = "goodix,gt9916";
> +		reg = <0>;
> +
> +		interrupt-parent = <&tlmm>;
> +		interrupts = <162 IRQ_TYPE_LEVEL_LOW>;
> +
> +		reset-gpios = <&tlmm 161 GPIO_ACTIVE_LOW>;
> +
> +		avdd-supply = <&vreg_l14b_3p2>;
> +
> +		spi-max-frequency = <1000000>;
> +
> +		touchscreen-size-x = <1080>;
> +		touchscreen-size-y = <2400>;
> +
> +		pinctrl-0 = <&ts_irq>, <&ts_reset>;
> +		pinctrl-names = "default";
> +	};
> +};
> +
> +&tlmm {
> +	disp0_reset_n_active: disp0-reset-n-active-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-disable;
> +	};
> +
> +	disp0_reset_n_suspend: disp0-reset-n-suspend-state {
> +		pins = "gpio133";
> +		function = "gpio";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	mdp_vsync: mdp-vsync-state {
> +		pins = "gpio86";
> +		function = "mdp_vsync";
> +		drive-strength = <2>;
> +		bias-pull-down;
> +	};
> +
> +	ts_irq: ts-irq-state {
> +		pins = "gpio161";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +		output-disable;
> +	};
> +
> +	ts_reset: ts-reset-state {
> +		pins = "gpio162";
> +		function = "gpio";
> +		drive-strength = <8>;
> +		bias-pull-up;
> +	};
> +};
> 
> ---
> base-commit: 234cb065ad82915ff8d06ce01e01c3e640b674d2
> change-id: 20240223-topic-sm8650-upstream-hdk-e21cfd6f1de8
> 
> Best regards,
> -- 
> Neil Armstrong <neil.armstrong@linaro.org>
> 
> 

