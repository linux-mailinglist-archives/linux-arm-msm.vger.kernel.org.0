Return-Path: <linux-arm-msm+bounces-79506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 45751C1BC67
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 16:48:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 38765188F9B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 15:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 24D8534D4F1;
	Wed, 29 Oct 2025 15:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="so3PFGmE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CA34DCEE;
	Wed, 29 Oct 2025 15:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761752710; cv=none; b=aqMchBIot/FFrA24hNGZj5oeLfz51D80QElRKVSaH2ogMVaMr03XpMP8SFFj8StF0S6timzCZn2/4TrhWZusFmmTDOk8HYYe6lQQ35sR5OMko11whNvnD7Az/TOFFxueGCNxQge/9sJNKWLFk9VEAq//GpSfdPO0YBUVG5NGwlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761752710; c=relaxed/simple;
	bh=MRm3TarntppjsXNsPEV5BrslhGYY00w4hNhu+KLG8aU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmlysj4SzsxMOMY70901tmPeWYimm6LniXUlE/JBrQP17aRF/8zJqFD/n2w5qgwqr7mbqI/SKVb1KtVnOfXVlZRA0lzrJCtVHJ/veU0dWQ3sIECJiPn1Wnmiz75pXsOI5iLOGL5L9HysOQwg87T1EryOaq6/1KnVutzmEYcIs8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=so3PFGmE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B650AC4CEFF;
	Wed, 29 Oct 2025 15:45:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761752709;
	bh=MRm3TarntppjsXNsPEV5BrslhGYY00w4hNhu+KLG8aU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=so3PFGmEZuT750aOPrHlhbF4UJ0j8S7oDGjJ1rjZNzv7YYtc3iBCeN9yBYRJ5H06K
	 45s440ei6aqy6fE+REiwHevRCmnc9lkVm3zC6JuApW0GgXKOa5bDpzu17Q5RbknV06
	 vEG7XMZex5/85/ApPRli5W0WaStGZW5M3K8fL21aTXpD4/jPh+ynsLEGgpntmWYdVk
	 9iBBBot8my6aFqD3JCGtHpdRQ1r79+ksohdGZswuMjeFPH0hkW07ZhR46O1As9fPCr
	 UUcml3QnN2IT78W3fPz7rRrZsaWUKhx8QSu93Y+lD2+FfMNPL7B+0rCWRA3AzPw4Di
	 KfEOH1SouBFpg==
Date: Wed, 29 Oct 2025 10:48:13 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] arm64: dts: qcom: talos-evk: Add support for
 dual-channel LVDS panel
Message-ID: <fvtwdsthi242vxxlaqsbvqec4xkduch3fcslwqsjzkz4fidewn@mku374rrwlp7>
References: <20251028061636.724667-1-tessolveupstream@gmail.com>
 <20251028061636.724667-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028061636.724667-2-tessolveupstream@gmail.com>

On Tue, Oct 28, 2025 at 11:46:36AM +0530, Sudarshan Shetty wrote:
> This patch introduces a new device tree for the QCS615 Talos

"This patch" doesn't make sense when you look at the git log once the
patch has been accepted, please avoid it.

Please read https://docs.kernel.org/process/submitting-patches.html#describe-your-changes

Start your commit message with a "problem description", describe what
this LVDS talos is, why it should have it's own dts file etc.

> EVK platform with dual-channel LVDS display support.
> 
> The new DTS file (`talos-evk-lvds.dts`) is based on the existing
> `talos-evk.dts` and extends it to enable a dual-channel LVDS display
> configuration using the TI SN65DSI84 DSI-to-LVDS bridge.
> 
> where channel-A carries odd pixel and channel-B carries even pixel
> on the QCS615 talos evk platform.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile           |   1 +
>  arch/arm64/boot/dts/qcom/talos-evk-lvds.dts | 128 ++++++++++++++++++++
>  2 files changed, 129 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index d5a3dd98137d..6e7b04e67287 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -307,6 +307,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-lvds.dtb
>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> new file mode 100644
> index 000000000000..7ba4ab96ada6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-lvds.dts
> @@ -0,0 +1,128 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +#include "talos-evk.dts"

We don't include .dts files, split the existing one in a dtsi and dts
file and then include the dtsi here. Or provide provide this as a dtso
overlay on top of the dts.

It's not clear to me which is the correct way, because you didn't
adequately described how the SN65DSI84 enter the picture. Is it always
there, but not part of the standard dip-switch configuration? Or is this
some mezzanine?

Regards,
Bjorn

> +
> +/ {
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&tlmm 115 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	lcd0_pwm_en {
> +		compatible = "pwm-gpio";
> +		gpios = <&tlmm 59 GPIO_ACTIVE_HIGH>;
> +		pinctrl-0 = <&lcd0_bklt_pwm>;
> +		pinctrl-names = "default";
> +		#pwm-cells = <3>;
> +	};
> +
> +	panel-lvds {
> +		compatible = "auo,g133han01";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			/* LVDS A (Odd pixels) */
> +			port@0 {
> +				reg = <0>;
> +				dual-lvds-odd-pixels;
> +
> +				lvds_panel_out_a: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_a>;
> +				};
> +			};
> +
> +			/* LVDS B (Even pixels) */
> +			port@1 {
> +				reg = <1>;
> +				dual-lvds-even-pixels;
> +
> +				lvds_panel_out_b: endpoint {
> +					remote-endpoint = <&sn65dsi84_out_b>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&adv7535 {
> +	status = "disabled";
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	sn65dsi84: sn65dsi84@2c {
> +		compatible = "ti,sn65dsi84";
> +		reg = <0x2c>;
> +		enable-gpios = <&tlmm 42 GPIO_ACTIVE_HIGH>;
> +		ti,dsi-lanes = <4>;
> +		ti,lvds-format = "jeida-24";
> +		ti,lvds-bpp = <24>;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				sn65dsi84_in: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&mdss_dsi0_out>;
> +				};
> +			};
> +
> +			port@2 {
> +				reg = <2>;
> +
> +				sn65dsi84_out_a: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&lvds_panel_out_a>;
> +				};
> +			};
> +
> +			port@3 {
> +				reg = <3>;
> +
> +				sn65dsi84_out_b: endpoint {
> +					data-lanes = <0 1 2 3>;
> +					remote-endpoint = <&lvds_panel_out_b>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +
> +	status = "okay";
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&sn65dsi84_in>;
> +	data-lanes = <0 1 2 3>;
> +};
> +
> +&tlmm {
> +	lcd0_bklt_en: lcd0-bklt-en-state {
> +		pins = "gpio115";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +
> +	lcd0_bklt_pwm: lcd0-bklt-pwm-state {
> +		pins = "gpio59";
> +		function = "gpio";
> +		bias-disable;
> +	};
> +};
> -- 
> 2.34.1
> 

