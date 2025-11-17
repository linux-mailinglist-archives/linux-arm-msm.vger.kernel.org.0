Return-Path: <linux-arm-msm+bounces-82168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DC57AC66760
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 23:47:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 64BD035B022
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Nov 2025 22:46:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 208B833CEB6;
	Mon, 17 Nov 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpctVhUG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4503331A69;
	Mon, 17 Nov 2025 22:46:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763419599; cv=none; b=GHYNmn29LEhPf8RNISETQJrzUNtMZCcnenQQHl8nWgiG1NPF+xpug+XB9QBM8WaFL7umz2D0bcCTHyl4Cw26BJw0Vwy0CNSWNzBR3OndSEzpMvruEkgUF/uUEZQYhYG46SKzpBUWbB2Cn762V68uFt7/3HvyXIws8UsnQbsjgF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763419599; c=relaxed/simple;
	bh=Pz7+bgC77TUl0nBd3OUQpsrR8yovxoAiSUIj+X+Srj8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TK745lWsfNuFneoV2/5r7AgsrR41Id49no6/dvLnO904ldfv+XibEcHrul/8Ae4WovYm1t5E6K46Zum18VhrN0KO4qf1kLcdoBxdZHYRB6iLtIXBZCUtxUD0goapJmSwErOiU8pHnPous11imx8jmZk3hCrOGADmmDcmr9GyEWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpctVhUG; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EAD4C2BC86;
	Mon, 17 Nov 2025 22:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763419598;
	bh=Pz7+bgC77TUl0nBd3OUQpsrR8yovxoAiSUIj+X+Srj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpctVhUG9tpH9MTJ+rfbPdCqUvn7CvKPhPB+z/RswWJ3ZB9zAxIdjUiIlME2KdHR0
	 kDnpwIayjdQ9ZFoDqUwaq0jyedaYySlyvjnzo8qSA0u6S3uZj52lDPFzUX47+zRtVL
	 KKvXLtY1KnpuIuzfRsdEzaNgBrfFhgTcE1MgLvpMlY3E01daWmsv5+5Vt5WUgfTnYx
	 e/IoHCqp56EXSvqlSa7cQ2jAiQpbTOkYduVn8MsJAbqquoJn5PpBo8WnJDg4goFRDz
	 BQEUFVYh/5M+c0KVxYHyAIZLyht8AXp5HJQZOyfjKYxM2WgBOjH3aGvYsZ8i6A0u6c
	 ERH2mDlpAVXrA==
Date: Mon, 17 Nov 2025 16:51:22 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] arm64: dts: qcom: Add support to validate direct
 DSI
Message-ID: <2cgc7ghpc5z6cf2j5ikplu7ufcac6hk3nraps5ai2senrl7qsh@hbjcomvspn5b>
References: <20251111104245.3420041-1-tessolveupstream@gmail.com>
 <20251111104245.3420041-2-tessolveupstream@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251111104245.3420041-2-tessolveupstream@gmail.com>

On Tue, Nov 11, 2025 at 04:12:45PM +0530, Sudarshan Shetty wrote:

The subject indicates that you're adding support for validating DSI to
all Qualcomm boards. Rewrite this to be more specific.

> Adds device tree support for the Waveshare 10.1-inch
> MIPI-DSI panel on the QCS615 talos evk platform.
> 
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile          |  1 +
>  arch/arm64/boot/dts/qcom/talos-evk-dsi.dts | 43 ++++++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 282d744acd73..d5a3dd98137d 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -306,6 +306,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm8650-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-mtp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm8750-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= talos-evk-dsi.dtb
>  x1e001de-devkit-el2-dtbs	:= x1e001de-devkit.dtb x1-el2.dtbo
>  dtb-$(CONFIG_ARCH_QCOM)	+= x1e001de-devkit.dtb x1e001de-devkit-el2.dtb
>  x1e78100-lenovo-thinkpad-t14s-el2-dtbs	:= x1e78100-lenovo-thinkpad-t14s.dtb x1-el2.dtbo
> diff --git a/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts
> new file mode 100644
> index 000000000000..8a6dc8b6bf8f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/talos-evk-dsi.dts

This isn't the one and only "EVK with DSI support" board. Please follow
other examples and describe the connected panel as a overlay - and be
specific.

This should likely be talos-evk-waveshare-10.3.dtso - so that one can
support other DSI panels...

> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +/dts-v1/;
> +
> +#include "talos-evk-cb.dtsi"

This file doesn't exist, please make sure you structure your patches
such that we don't have multiple discussions about the same topic in
parallel.

> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +
> +	status = "okay";
> +
> +	display_mcu: display-mcu@45 {
> +		compatible = "waveshare,touchscreen-panel-regulator";
> +		reg = <0x45>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		enable-gpio = <&display_mcu 2 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&mdss_dsi0 {
> +	vdda-supply = <&vreg_l11a>;
> +	status = "okay";
> +
> +	dsi_panel: dsi-panel@1 {
> +		reg = <1>;
> +		compatible = "waveshare,10.1-dsi-touch-a";
> +		reset-gpio = <&display_mcu 1 GPIO_ACTIVE_HIGH>;

Can you confirm that this actually works?

Based on the Waveshare "example" driver I had to enable pins 0, 1, and 4
to make my 12.3 DSI panel to work on my board, and then pin 9 to make
the Goodix touchpad work.


Speaking of which, I want the touchscreen support added in the same
patch.

Regards,
Bjorn

> +		backlight = <&display_mcu>;
> +
> +		port {
> +			panel_in: endpoint {
> +				remote-endpoint = <&mdss_dsi0_out>;
> +			};
> +		};
> +	};
> +};
> +
> +&mdss_dsi0_out {
> +	remote-endpoint = <&panel_in>;
> +};
> -- 
> 2.34.1
> 

