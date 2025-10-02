Return-Path: <linux-arm-msm+bounces-75771-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D085ABB26DE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 02 Oct 2025 05:28:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7439E320B6A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Oct 2025 03:28:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 822321F237A;
	Thu,  2 Oct 2025 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zaftvh9Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D657149E17;
	Thu,  2 Oct 2025 03:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759375679; cv=none; b=tWajrCP8iTBDEfOK3+kKrU/+0FPSwwhIub9I5+PrHO1pGjETJfXIvsfeByAPFVw4iYqvJQi3j1XX7oQ8N3wTgIK5NEreNrKuoSTUmZE1/IdGYGEFZpSsXjmBHblscUEc25oYaD7GYFH8ba0rCTcmtv4Q1v5drhVS5gZEpxu3u48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759375679; c=relaxed/simple;
	bh=mDdiru9yJ4NNnnyT5R/t1lfGJETaGl02z3EU0OriEhU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ihd+jvCsqiZpzGnXnANrLNv+PYkDQ61GVn8x+dgPzhiUjIRKNsHgK91BO4CyYZyIQ5BNtUey7OEboRurlweUKpaJFv/dXRbvkr+HWt0W4o0ZMDVAKSO36mbZJgjr6r2fKWJsNfMmZfx0dUwB5JFK9v36H4WUr95PUSP2QW0Z4rU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zaftvh9Z; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D94C4CEF9;
	Thu,  2 Oct 2025 03:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759375679;
	bh=mDdiru9yJ4NNnnyT5R/t1lfGJETaGl02z3EU0OriEhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Zaftvh9ZFEjqLDTEJVDyXcP4o7RM///Vsn9AEdN8kdpeNFs55hGRVU8RVvVEH2VMh
	 gQYwlhtUopEftq/1Cdz+yzJrYlowoFCT9xSGFCytSzyfCQxRz1NeKyNztz66ccwxrK
	 bGIDVU3MX0zHklfzqhQ4Ou1XNH/JSW0o/STBae7Ahc8gO5VhKdY6icOjbBFSawzpYR
	 cur4HW9MZv/EQM+XJ++/TQx2zCP1rxHJpFfz7HVeNZv3Zc6uiYdMEtM+Mv26ec5BZL
	 420QqhWQQ77RLqb1GsLh+Hcn/dlN9dcc8d1CtiVo8E0qw+tVmLf/96GJRo0FZgSw4I
	 1q+zKhMX288iw==
Date: Wed, 1 Oct 2025 22:27:56 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Jingzhou Zhu <newwheatzjz@zohomail.com>
Cc: konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: Add support for Huawei MateBook
 E 2019
Message-ID: <njknmya7qcxypc5pb3ddj27oulvtf723hkzgx2qdtyt2tuefh2@lbo55224blkq>
References: <20251001142107.21860-1-newwheatzjz@zohomail.com>
 <20251001142107.21860-3-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251001142107.21860-3-newwheatzjz@zohomail.com>

On Wed, Oct 01, 2025 at 10:21:07PM +0800, Jingzhou Zhu wrote:
> Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
> on Qualcomm's sdm850 platform.
> 
> Supported features:
>  - ACSP, CDSP and SLPI
>  - Volume Key
>  - Power Key
>  - Tablet Mode Switching
>  - Display
>  - Touchscreen
>  - Stylus
>  - WiFi
>  - Bluetooth
>  - GPU
>  - USB
>  - Keyboard
>  - Touchpad
>  - UFS
>  - SD Card
>  - Audio (right internal mic and headphone mic not working)
>  - Mobile Network
> 
> Features not supported yet:
>  - Panel Backlight
>  - Lid Detection
>  - Battery
>  - EFI Variable Access
>  - Cameras
> 
> 1. Panel backlight, lid detection and battery will be supported with the
>    EC driver upstreamed.
> 2. EFI variables can only be read with the QSEECOM driver, and will be
>    enabled when the driver is fixed.
> 3. Cameras are tested to work with modified downstream driver, and once
>    drivers for these camera modules are included in the tree, cameras can
>    be enabled.
> 
> Features won't be supported:
>  - External Display
>  - Fingerprint
> 
> 1. To make external display work, more reverse engineering may be required,
>    but it's beyond my ability.
> 2. Fingerprint is controlled by TrustZone, meaning direct access to it
>    isn't possible.
> 
> Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile             |   1 +
>  .../qcom/sdm850-huawei-matebook-e-2019.dts    | 962 ++++++++++++++++++
>  2 files changed, 963 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index 296688f7cb26..a6bcebe66dd7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -258,6 +258,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium-ebbg.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium-tianma.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-polaris.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-shift-axolotl.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
> diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> new file mode 100644
> index 000000000000..ec786286a604
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
> @@ -0,0 +1,962 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Huawei MateBook E 2019
> + *
> + * Copyright (c) 2025, Jingzhou Zhu <newwheatzjz@zohomail.com>
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/gpio-keys.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
> +#include <dt-bindings/sound/qcom,q6afe.h>
> +#include <dt-bindings/sound/qcom,q6asm.h>
> +#include <dt-bindings/sound/qcom,wcd934x.h>
> +#include "sdm850.dtsi"
> +#include "sdm845-wcd9340.dtsi"
> +#include "pm8998.dtsi"
> +
> +/*
> + * Update following upstream (sdm845.dtsi) reserved
> + * memory mappings for firmware loading to succeed
> + * and enable the IPA device.
> + */
> +/delete-node/ &tz_mem;
> +/delete-node/ &rmtfs_mem;
> +/delete-node/ &qseecom_mem;
> +/delete-node/ &ipa_fw_mem;
> +/delete-node/ &ipa_gsi_mem;
> +/delete-node/ &gpu_mem;
> +/delete-node/ &adsp_mem;
> +/delete-node/ &wlan_msa_mem;
> +/delete-node/ &slpi_mem;
> +
> +/ {
> +	model = "Huawei MateBook E 2019";
> +	compatible = "huawei,planck", "qcom,sdm845";
> +	chassis-type = "convertible";
> +
> +	aliases {
> +		serial0 = &uart9;
> +		serial1 = &uart6;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		pinctrl-0 = <&volume_up_gpio &mode_pin_active>;
> +		pinctrl-names = "default";
> +
> +		key-vol-up {
> +			label = "Volume up";
> +			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
> +			linux,code = <KEY_VOLUMEUP>;
> +			debounce-interval = <15>;
> +			wakeup-source;
> +		};
> +
> +		switch-mode {
> +			label = "Tablet mode switch";
> +			gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
> +			linux,input-type = <EV_SW>;
> +			linux,code = <SW_TABLET_MODE>;
> +			wakeup-source;
> +		};
> +	};
> +
> +	reserved-memory {
> +		cont_splash_mem: framebuffer@80100000 {
> +			reg = <0 0x80100000 0 0xd00000>;
> +			no-map;
> +		};
> +
> +		tz_mem: tz@86d00000 {
> +			reg = <0 0x86d00000 0 0x4600000>;
> +			no-map;
> +		};
> +
> +		qseecom_mem: qseecom@8b500000 {
> +			reg = <0 0x8b500000 0 0xa00000>;
> +			no-map;
> +		};
> +
> +		wlan_msa_mem: wlan-msa@8c400000 {
> +			reg = <0 0x8c400000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		adsp_mem: adsp@8c500000 {
> +			reg = <0 0x8c500000 0 0x1a00000>;
> +			no-map;
> +		};
> +
> +		ipa_fw_mem: ipa-fw@8df00000 {
> +			reg = <0 0x8df00000 0 0x100000>;
> +			no-map;
> +		};
> +
> +		slpi_mem: slpi@96700000 {
> +			reg = <0 0x96700000 0 0x1200000>;
> +		};
> +
> +		gpu_mem: gpu@97900000 {
> +			reg = <0 0x97900000 0 0x5000>;
> +			no-map;
> +		};
> +
> +		rmtfs_mem: rmtfs@97c00000 {
> +			compatible = "qcom,rmtfs-mem";
> +			reg = <0 0x97c00000 0 0x200000>;
> +			no-map;
> +
> +			qcom,client-id = <1>;
> +			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
> +
> +		};
> +	};
> +
> +	sw_edp_1p2: edp-1p2-regulator {

Please see and adjust according to "Order of Nodes" section in
Documentation/devicetree/bindings/dts-coding-style.rst ("edp" <
"leds" < "regulator" < "reserved" ...)

> +		compatible = "regulator-fixed";
> +		regulator-name = "sw_edp_1p2";
> +
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +
> +		pinctrl-0 = <&sw_edp_1p2_en>;
> +		pinctrl-names = "default";
> +
> +		gpio = <&pm8998_gpios 9 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&vreg_l2a_1p2>;
> +	};
> +
> +	sn65dsi86_refclk: sn65dsi86-refclk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +
> +		clock-frequency = <19200000>;
> +	};
> +
[..]
> +&i2c5 {
> +	status = "okay";

And for these, look at the "Order of Properties in Device Node" section.


> +	clock-frequency = <400000>;
> +

Regards,
Bjorn

