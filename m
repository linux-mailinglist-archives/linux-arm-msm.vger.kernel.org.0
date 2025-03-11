Return-Path: <linux-arm-msm+bounces-51020-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DE8A5CAE3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 17:32:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 185DA17889A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 16:32:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A282D25F7A9;
	Tue, 11 Mar 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K7Gao5kP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1A25C6F9;
	Tue, 11 Mar 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741710720; cv=none; b=tSofEbn0k7ohgVJ/Wptsz5bNVBPGjeUITbMBs1epVqpH5dGIgg/FKYWDIB4NpcONl/Uv6GgdQCjaHx5ybYgSqLVEETEj7AYbj7KyKLMJ6FtHuTUz3HUWsu6SrHw1lbCwit+hA/ShfFx4QFvmcLgOnDAAEjqnyoiJm8iFy2DR6SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741710720; c=relaxed/simple;
	bh=kli/27tDi+RYlPqX2bhJ2TuIz1lPgxcKET8b517wpPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ew75n/+5mug6xL++uicplo4bNRyGJ5+2G7E7WoYGF241zoOecWMK7yYl6Wqv5ENVL1rwOlcSjGn9ydat9hukMdJZpra5hBmrI9NH/1VUrOnwaflEFAnY9AAkgqSFjNJ4vwUG+kR50BzLatb+upuxMUOI0r2D45jRQ3LaYJRpOLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K7Gao5kP; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97FBC4CEE9;
	Tue, 11 Mar 2025 16:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741710719;
	bh=kli/27tDi+RYlPqX2bhJ2TuIz1lPgxcKET8b517wpPs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K7Gao5kPaA2Z4H2TPZS1Ntt7tL+9AIYfDWmotpIX17gNI/61K9bGuQ+orPb0zA1Dv
	 KWVz+OxIoVE4vTPBEn5GDhgrXZzzXpCz4GHsS4lcrI1skdxqjMwVtrYCvnhshs8UPK
	 vNm6akE20cBs/KuAM2eZhE9sW2KTxUfTRO4FoynhMjoZeCxucaMLIn1j1FG5bmWZ+9
	 E0nVETzp9hJy2TcNcrm20y8bBDCSUjskSgpOiGCkHx3CE+sTaqZXnSPkee15x1kdp1
	 6zSMfkP7pNu1hQ7nCq4Lcq/eUo7TCkvl0IUhnzO3mC3+5dd+WFSgFsfhdn2+frn05U
	 SoWzI8+3zj0Rg==
Date: Tue, 11 Mar 2025 18:31:54 +0200
From: Dmitry Baryshkov <lumag@kernel.org>
To: david@ixit.cz
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>, 
	Tony Luck <tony.luck@intel.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Ivan Belokobylskiy <belokobylskij@gmail.com>
Subject: Re: [PATCH v4] ARM: dts: nexus4: Initial dts
Message-ID: <6bgnui5ygiw5c6erf4mhtod4ww645ntgy267snhrf5efgetajy@kbi6aw23knqe>
References: <20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz>

On Tue, Mar 11, 2025 at 05:10:02PM +0100, David Heidelberg via B4 Relay wrote:
> From: Ivan Belokobylskiy <belokobylskij@gmail.com>
> 
> Add initial support for LG Nexus 4 (mako).
> 
> Features currently working: regulators, eMMC, and volume keys.
> 
> Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v4:
> - Sorted regulators and added regulators compatible.
> - Corrected pmic include and references.
> - Moved &rpm outside of / node.
> - Moved and simplify pm8921 keypad.
> - Added chasis-type.
> - Dropped incomplete WiFi node, will be provided in future
>   contributions.
> - Link to v3: https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz
> 
> Changes in v3:
> - rebased against next-20250307
> - dropped backlight until driver gets converted to DT
> 
> Changes in v2:
> - lge vendor doesn't exist anymore, rename to lg
> - sdcc@ to mmc@ to comply with dt-schema
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 344 +++++++++++++++++++++
>  2 files changed, 345 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
> index f06c6d425e91dd73c2b453d15543d95bd32383b9..0c1d116f6e84f76994aa8c8286350bdcd1657a42 100644
> --- a/arch/arm/boot/dts/qcom/Makefile
> +++ b/arch/arm/boot/dts/qcom/Makefile
> @@ -12,6 +12,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
>  	qcom-apq8064-ifc6410.dtb \
>  	qcom-apq8064-sony-xperia-lagan-yuga.dtb \
>  	qcom-apq8064-asus-nexus7-flo.dtb \
> +	qcom-apq8064-lg-nexus4-mako.dtb \
>  	qcom-apq8074-dragonboard.dtb \
>  	qcom-apq8084-ifc6540.dtb \
>  	qcom-apq8084-mtp.dtb \
> diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..51edd661e4bd903a32445d15955585a194574f30
> --- /dev/null
> +++ b/arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/mfd/qcom-rpm.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +
> +#include "qcom-apq8064-v2.0.dtsi"
> +#include "pm8821.dtsi"
> +#include "pm8921.dtsi"
> +
> +/ {
> +	model = "LG Nexus 4 (mako)";
> +	compatible = "lg,nexus4-mako", "qcom,apq8064";
> +	chassis-type = "handset";
> +
> +	aliases {
> +		serial0 = &gsbi7_serial;
> +		serial1 = &gsbi6_serial;
> +		serial2 = &gsbi4_serial;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:115200n8";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		ramoops@88d00000{
> +			compatible = "ramoops";
> +			reg = <0x88d00000 0x100000>;
> +			record-size = <0x20000>;
> +			console-size = <0x20000>;
> +			ftrace-size = <0x20000>;
> +		};
> +	};
> +
> +	battery_cell: battery-cell {
> +		compatible = "simple-battery";
> +		constant-charge-current-max-microamp = <900000>;
> +		operating-range-celsius = <0 45>;
> +	};

Ideally this should also be sorted, although I don't feel like putting
it before /chosen/.

> +};
> +
> +&rpm {

Please sort nodes alphabetically. &rpm definitely comes after &gsbi1.

> +	regulators {

[...]

> +};
> +
> +&gsbi1 {
> +	qcom,mode = <GSBI_PROT_I2C>;
> +
> +	status = "okay";
> +};
> +
> +&gsbi1_i2c {
> +	clock-frequency = <200000>;
> +
> +	status = "okay";
> +};
> +
> +&gsbi4 {
> +	qcom,mode = <GSBI_PROT_I2C_UART>;
> +
> +	status = "okay";
> +};
> +
> +&gsbi4_serial {
> +	status = "okay";
> +};
> +
> +&pm8821 {
> +	interrupts-extended = <&tlmm_pinmux 76 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&pm8921 {
> +	interrupts-extended = <&tlmm_pinmux 74 IRQ_TYPE_LEVEL_LOW>;
> +};
> +
> +&pm8921_keypad {
> +	linux,keymap = <
> +		MATRIX_KEY(0, 0, KEY_VOLUMEDOWN)
> +		MATRIX_KEY(0, 1, KEY_VOLUMEUP)
> +	>;
> +
> +	keypad,num-rows = <1>;
> +	keypad,num-columns = <5>;
> +
> +	status = "okay";
> +};
> +
> +
> +/* eMMC */
> +&sdcc1 {
> +	vmmc-supply = <&pm8921_l5>;
> +	vqmmc-supply = <&pm8921_s4>;
> +
> +	status = "okay";
> +};
> 
> ---
> base-commit: 0a2f889128969dab41861b6e40111aa03dc57014
> change-id: 20250309-lg-nexus4-mako-da0833885b26
> 
> Best regards,
> -- 
> David Heidelberg <david@ixit.cz>
> 
> 

-- 
With best wishes
Dmitry

