Return-Path: <linux-arm-msm+bounces-106070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCNzJnPz+mnfUgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:53:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EB2014D7780
	for <lists+linux-arm-msm@lfdr.de>; Wed, 06 May 2026 09:53:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 5AE4F3010509
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 May 2026 07:53:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC6B23CCFB5;
	Wed,  6 May 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k3kTkBZ0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A738A2F12C6;
	Wed,  6 May 2026 07:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778053984; cv=none; b=EzEtE9nZyq1o3WWaxIhaxTyYRQdFuLyXAK8T568ZFWcZGDMjWHD3i+1rv/HNpTU4zLtbeqpCdFUn3W14vbf7YcEJSDamEb0zlh0Fr8UsGQ7IvruQl8VpzlHPLca7CHA/4/kLb5Ynw6oUs/wR+S2exjzMIr60d3tG1sEUedZMqKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778053984; c=relaxed/simple;
	bh=ujoMgw0KTaFRI5Rhg7nsyMJfTN2kAJDhrQY8gy4rLM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3bBfQnZbvQGRFTRFkgEqXBIUnr83STI/xPgNKuIw7948KRFA+/zAgz9OgoZlO7A5zjCuodHJ9SDL7vMGFJdr1I7wkbn4SVh8uI5RYvbR91zmPkgde8TKG9ILjeq48SJMf68Qt8FK8JLYhOATJ0naQS3M3ef2tkDoe3ly81I5+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k3kTkBZ0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35B8C2BCB8;
	Wed,  6 May 2026 07:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778053984;
	bh=ujoMgw0KTaFRI5Rhg7nsyMJfTN2kAJDhrQY8gy4rLM4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k3kTkBZ0g34L2cGHZDCgLzsx8aC1kw4htLAG+xnIbz9hEzUSmXfQ6EwuNoXmrwUQI
	 McBO4I+Lk0ea7MijSdiATtcMVn+1fsUSfLr5ZRXS/kG4Sm38/bCb2WU80QPFQ3CRCq
	 DA0ys+PFliTp3y1BxGdcxDGM4CytH4/fQdlHK5U9s9FcaBdineuFtlsjaSc+IRl36X
	 lxQ6sdDhtYFXhlkbMhCkRGKy9dpGgqlDtgYbqEa2lisRQzFYEPA/sB5uCJaeU+mD5C
	 7SdD5+cGR7TQMJc6B5m+mACGKI2guhGO4wKZHKeGpx10g25hQE7q2mypiSb7ZbJNzv
	 4aUz5bun6i/kQ==
Date: Wed, 6 May 2026 09:53:01 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: William Bright <william.bright@imd-tec.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Message-ID: <20260506-aquatic-shrew-of-engineering-09fbe8@quoll>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
 <20260505-imdt-qcs8550-sbc-rfc-v2-4-b4767d0dd421@imd-tec.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-4-b4767d0dd421@imd-tec.com>
X-Rspamd-Queue-Id: EB2014D7780
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-106070-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DKIM_TRACE(0.00)[kernel.org:+];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	DBL_PROHIBIT(0.00)[0.0.0.43:email];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[krzk@kernel.org,linux-arm-msm@vger.kernel.org];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

On Tue, May 05, 2026 at 09:09:54PM +0100, William Bright wrote:
> +#include "qcs8550-imdt-som.dtsi"
> +
> +/ {
> +	model = "IMDT QCS8550 SBC";
> +	compatible = "imdt,qcs8550-sbc", "imdt,qcs8550-som",
> +		     "qcom,qcs8550", "qcom,sm8550";
> +	chassis-type = "embedded";
> +
> +	aliases {
> +		serial0 = &uart7;
> +		serial1 = &uart14;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	backlight: backlight {
> +		compatible = "gpio-backlight";
> +		gpios = <&pm8550_gpios 6 GPIO_ACTIVE_HIGH>;
> +		default-on;
> +	};
> +
> +	cam_1v2_reg: regulator-cam-1v2 {

This is not used. Drop regulator completely.

> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_1v2_reg";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		vin-supply = <&hr_cam_pwr>;
> +	};
> +
> +	cam_1v8_reg: regulator-cam-1v8 {

Same here

> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_1v8_reg";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&hr_cam_pwr>;
> +	};
> +
> +	cam_2v8_reg: regulator-cam-2v8 {

Same here

> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_2v8_reg";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&hr_cam_pwr>;
> +	};
> +
> +	cam_3v3_reg: regulator-cam-3v3 {

Same here

> +		compatible = "regulator-fixed";
> +		regulator-name = "cam_3v3_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&hr_cam_pwr>;
> +	};
> +
> +	display_panel_pwr_en: regulator-display-panel-en {

Again, unused

> +		compatible = "regulator-fixed";
> +		regulator-name = "display_panel_pwr_en";
> +		regulator-min-microvolt = <8000000>;
> +		regulator-max-microvolt = <8000000>;
> +		startup-delay-us = <10000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&panel_en_default>;
> +
> +		gpio = <&tlmm 123 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&som_vph_pwr>;
> +	};
> +
> +	/* 5V VIN to backlight LED driver PMIC */
> +	dsi_5v_en: regulator-dsi-5v-en {

Also unused.

> +		compatible = "regulator-fixed";
> +		regulator-name = "dsi_5v_en";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&dsi_5v_en_default>;
> +
> +		gpio = <&tlmm 140 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&som_vph_pwr>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	/* Enables 1V2, 1V8_CAM and 3V3_CAM */
> +	hr_cam_pwr: regulator-hr-cam-pwr {

And this becames unused after dropping fake regulators. Why don't you
have proper users of these controllable supplies?

> +		compatible = "regulator-fixed";
> +		regulator-name = "hr_cam_pwr";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hr_cam_en_default>;
> +
> +		gpio = <&tlmm 146 GPIO_ACTIVE_LOW>;
> +
> +		vin-supply = <&som_vph_pwr>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	/* Enables V2MB_3V8 and V2ME_3V3 */
> +	m2_pd_pwr: regulator-m2-pd-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "m2_pd_pwr";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&m2_pd_en_default>;
> +
> +		gpio = <&tlmm 144 GPIO_ACTIVE_LOW>;
> +
> +		vin-supply = <&som_vph_pwr>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +
> +		gpio-open-drain;
> +	};
> +
> +	per_1v8_reg: regulator-per-1v8 {

Drop node

> +		compatible = "regulator-fixed";
> +		regulator-name = "per_1v8_reg";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&per_pwr>;
> +	};
> +
> +	per_3v3_reg: regulator-per-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "per_3v3_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&per_pwr>;
> +	};
> +
> +	per_5v_reg: regulator-per-5v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "per_5v_reg";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&per_pwr>;
> +	};

Drop all these

> +
> +	/* Enables 5V_PER, 3V3_PER and 1V8_PER */
> +	per_pwr: regulator-per-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "per_pwr";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pwr_per_en_default>;
> +
> +		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		vin-supply = <&som_vph_pwr>;
> +
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	sdhci_2_vqmmc: regulator-sdhci-2-vqmmc {
> +		compatible = "regulator-gpio";
> +
> +		regulator-name = "sdhci_2_vqmmc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-type = "voltage";
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sd_vset_default>;
> +
> +		gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +
> +		gpios-states = <0>;
> +		states = <3300000 0>,
> +			 <1800000 1>;
> +
> +		startup-delay-us = <10000>;
> +	};
> +
> +	sdhci_4_vqmmc: regulator-sdhci-4-vqmmc {

Even more completely redundant nodes.

> +		compatible = "regulator-fixed";
> +		regulator-name = "sdhci_4_vqmmc";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	som_vph_pwr: regulator-som-vph-pwr {

Not used (usage by other redundant nodes does not count). Drop.

> +		compatible = "regulator-fixed";
> +		regulator-name = "som_vph_pwr";
> +		regulator-min-microvolt = <3900000>;
> +		regulator-max-microvolt = <3900000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vph_pwr: regulator-vph-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vph_pwr";
> +		regulator-min-microvolt = <3700000>;
> +		regulator-max-microvolt = <3700000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vsys_sd_3v3_reg: regulator-vsys-sd-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys_sd_3v3_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};
> +
> +	vsys_wlan_3v3_reg: regulator-vsys-wlan-3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vsys_wlan_3v3_reg";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +	};

Probably most of them are to be dropped :/

> +
> +	wifi_pwrseq: wifi-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		/*
> +		 * NXP IW416 chip enables: PMIC_EN (master) and WLAN_EN.
> +		 * Held asserted (low) before SDHC4 powers up, then
> +		 * released after vmmc/vqmmc are stable.
> +		 */
> +		reset-gpios = <&tlmm 19 GPIO_ACTIVE_LOW>,
> +			      <&tlmm 5 GPIO_ACTIVE_LOW>;
> +		post-power-on-delay-ms = <50>;
> +	};
> +};
> +
> +&apps_rsc {
> +	regulators-0 {
> +		vdd-bob1-supply = <&vph_pwr>;
> +		vdd-bob2-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-3 {
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-4 {
> +		vdd-s4-supply = <&vph_pwr>;
> +	};
> +
> +	regulators-5 {
> +		vdd-s1-supply = <&vph_pwr>;
> +		vdd-s2-supply = <&vph_pwr>;
> +		vdd-s3-supply = <&vph_pwr>;
> +		vdd-s4-supply = <&vph_pwr>;
> +		vdd-s5-supply = <&vph_pwr>;
> +		vdd-s6-supply = <&vph_pwr>;
> +	};
> +};
> +
> +&gpi_dma1 {
> +	status = "okay";
> +};
> +
> +&gpu {
> +	status = "okay";
> +};
> +
> +&gpu_zap_shader {
> +	firmware-name = "qcom/sm8550/a740_zap.mbn";
> +	/* Zap shader doesn't load so is disabled */
> +	status = "disabled";
> +};
> +
> +&i2c_master_hub_0 {
> +	status = "okay";
> +};
> +
> +&i2c_hub_2 {
> +	clock-frequency = <400000>;
> +	status = "okay";
> +
> +	ptn3222: redriver@43 {
> +		compatible = "nxp,ptn3222";
> +		reg = <0x43>;
> +		#phy-cells = <0>;
> +
> +		vdd1v8-supply = <&vreg_l15b_1p8>;
> +		vdd3v3-supply = <&vreg_l5b_3p1>;
> +
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&eusb2_repeater_reset_default>;
> +
> +		reset-gpios = <&pm8550vs_d_gpios 4 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&ipa {
> +	qcom,gsi-loader = "self";
> +	memory-region = <&ipa_fw_mem>;
> +	firmware-name = "qcom/sm8550/ipa_fws.mbn";
> +	status = "okay";
> +};
> +
> +&iris {
> +	status = "okay";
> +};
> +
> +&lpass_rxmacro {
> +	status = "disabled";
> +};
> +
> +&lpass_tlmm {
> +	status = "disabled";
> +};
> +
> +&lpass_txmacro {
> +	status = "disabled";
> +};
> +
> +&lpass_vamacro {
> +	status = "disabled";
> +};
> +
> +&lpass_wsa2macro {
> +	status = "disabled";
> +};
> +
> +&lpass_wsamacro {
> +	status = "disabled";
> +};

Why are all these LPASS codecs disabled?

Best regards,
Krzysztof


