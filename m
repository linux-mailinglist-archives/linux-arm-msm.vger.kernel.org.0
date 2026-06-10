Return-Path: <linux-arm-msm+bounces-112375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LZ8uH2woKWreRgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112375-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:40 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD6E667962
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 11:03:40 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=imd-tec.com header.s=google header.b=HoGmEyMc;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112375-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112375-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=imd-tec.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 7F38930CFB55
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 08:58:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0028B3B8124;
	Wed, 10 Jun 2026 08:57:56 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E0273B2FD8
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 08:57:53 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781081875; cv=none; b=Fjc9x+C06FDmvrV+MvDdZXiCOjqyuR4VT0I5Mr45QV0P5oM2apJAGR/gwppUueDRUDcOSRDDNrcnd0DHj4WQm+Y6sVb57jEvHj/n0P20PL/ybQPF4GTLJrDrPU06die3w3Pq0Uvwk8bojP+SVF0rGXZSzMsb52IB7pgTRZ90Ysk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781081875; c=relaxed/simple;
	bh=Bmb/jdb79ScNfgEaQhXxzYFAKPMo6ICZ/HkJlSn3W9s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oyY8KRMyciBlhIlPBJUxHebtoGCbtDiLZfTCkmxu3n6JdOIoZjbe5+L01RmREZEoxhhn7dqX7UX/NAr7HMfgsXYpISHNChF3K/btVkEiy8A9HtshLO9vyk9ssWrr7/lSAAm/Iv+DxYtblvkWg7e2VvZYD3lA4iBs7hMJlQOXxqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=HoGmEyMc; arc=none smtp.client-ip=209.85.128.50
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490b915ded5so56032545e9.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Jun 2026 01:57:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1781081872; x=1781686672; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+6P4VpUR3VCsOUPgNYgmKJmSrYMEeTa2/05tV33mp2c=;
        b=HoGmEyMcXnkCE0oZqj2wBddPO99GjQeMunRBOVK444bE3R0UjJ3Rlr7sBgFMNKZBEu
         7uqHuH0iD/eUKnfTcMJkO1j/nGQM/UIEQZCrAEGrmtiBy9PNWslKdXkewyYiTAIup9jb
         ZGkqbwfUjSi6J0V6UXUfc4c1rF9/OT5tSJKCNBiygm7YIWdrigxzxEVgwViPUVRU7hFr
         d3mYHIHW0uDVZlJJ9LWkUhWmRifqhVw4OkG47A+gKdzNGQKIjqfdmLnXC7ss9WAIVfVh
         abuG1J+pzPmpvo7bd1CB6slfZfNRyeJeMcKN78D3ZS/LeRsQfWo5AHNbSlXkawGkyxtf
         nPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781081872; x=1781686672;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+6P4VpUR3VCsOUPgNYgmKJmSrYMEeTa2/05tV33mp2c=;
        b=j0DeZicUEDAU5fNHWUMkYXn2U4aZY+IvMxS1h0PV+QAl7PW5ZH69K/hBMMLCZxWDxb
         OwkXcqFDa06xPyN1yGKO5PBX9PcREgnD3+OI/xSJQbg6rHHXaxPFEaQusBdN1JxEDCre
         ZdH2d/HA028u6mNKQ+y9ltUXviJvxe83CmRVk9XWHGUm+eLXBcOu/Rw9ZB18fmKfLyTP
         8IThfUWYrQ6IPlMjnhSS8BANKlItH8jiOFHi1to9EFQ05gzQBFZgo2ZR4PZwXRgm0Sy4
         SgSABCxq2uZvhectmvoJ3fsJ94km7NJAJlXhcte3i1x4ifKIjEmK2wPR3njuIOQSLCbF
         tzKA==
X-Forwarded-Encrypted: i=1; AFNElJ/JVexoVbnuzYovfQSDiQYf7rnV6Qo4pYQayLPpiLuiQ8VufbeJnvne0P74HRfsLWGccwO2fGnY3yd4tdOk@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Veogk0PWvqcsyQ/G5EEa7QNZC9ph7ZS4AMWFUVY1ebMwJkU0
	NP3OyNrx/9uh+gpUmgszOrlc1BOtI3lhD4ya9agBeCbNHRuDs43yuMvo3QLSK/MFHnU=
X-Gm-Gg: Acq92OEuOi50mdPWY2s0+06IN/CJ9KH5Kq7H9RBjPLIBD8DEQSuw7dOtmtWkA5sFI2l
	M8BEGJg0bqbrRYEDfJwrIuzQgNA+UMPJoEv3jRevpMU7bG1nnSgzctDLQxf/CTkTHqwL7sb1xg7
	z4y3E3Qk/wWb9C4uDlOdtFoqplvEgXXGAORAWqI551544mOVpHBBOw02m/vEHL3cjjTTBnWolQR
	vR1Mzu+wwU1UAFf069Be6fLEcYKg6Gm9GTNKHB80lwZ8jsY7Tvzio+dWwx/pejkHLcH0nGBL6Mq
	hqx9JwardwyIP/du6zcAso8csLBa/2gHeZ3p00pwRNkPFnc/BwQGg8n0TO+9tycrkLTKA41r6RF
	PtZyIq99SYkaSPwcyX4lbVappx0je2tdpLMa31v8GscFxqtCoAz8dccAKgBQapo9aYgBpU0ymWP
	lTLG+Sxm43eXbBN4lmU97XQ8zdXzYYwD3a98Sl5wvDVSFagHQwi8sXV0CD3FHs/wN7lW2rbPi9+
	U3d+jqEsiKOk8VrdhG1NPCClm2TyvS5TWa37+qSr30O
X-Received: by 2002:a05:600c:528f:b0:490:c7dd:de3e with SMTP id 5b1f17b1804b1-490c7dddf1fmr302388405e9.31.1781081872046;
        Wed, 10 Jun 2026 01:57:52 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc17:adf2:34ee:6df])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490bc40716bsm584495835e9.12.2026.06.10.01.57.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:57:51 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Wed, 10 Jun 2026 09:57:48 +0100
Subject: [PATCH v4 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260610-imdt-qcs8550-sbc-rfc-v4-4-358e71d606bc@imd-tec.com>
References: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
In-Reply-To: <20260610-imdt-qcs8550-sbc-rfc-v4-0-358e71d606bc@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	FORWARDED(0.00)[lists@lfdr.de];
	TAGGED_FROM(0.00)[bounces-112375-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:andersson@kernel.org,m:konradybcio@kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:william.bright@imd-tec.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	ALIAS_RESOLVED(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[9];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,imd-tec.com:dkim,imd-tec.com:email,imd-tec.com:mid,imd-tec.com:from_mime,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 0CD6E667962

The IMDT QCS8550 SBC is a two-board design from IMD Technologies Ltd
built around the Qualcomm QCS8550 SoC. An IMDT QCS8550 SoM is soldered
onto the IMDT QCS8550 carrier board that supplies VPH_PWR and exposes
the off-module peripherals.

With this DTS, the board can boot to shell with a UFS rootfs with
debugging through uart7. USB and ethernet also are fully functional.

Features enabled are:
- On-board regulators
- uSD
- UART
- UFS
- PCIe0
- PCIe1
- USB (gadget only)
- Ethernet via LAN7430 (PCIe1)
- ADSP, CDSP

Assisted-by: Claude:claude-opus-4.7
Signed-off-by: William Bright <william.bright@imd-tec.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts | 392 ++++++++++++++++++++++++++
 2 files changed, 393 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6f33c4e2f09c..26b78cd9127e 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -190,6 +190,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-imdt-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
new file mode 100644
index 000000000000..e8afe683c962
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
@@ -0,0 +1,392 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026 IMD Technologies Ltd
+ */
+
+/dts-v1/;
+
+#include "qcs8550-imdt-som.dtsi"
+
+/ {
+	model = "IMDT QCS8550 SBC";
+	compatible = "imdt,qcs8550-sbc", "imdt,qcs8550-som",
+		     "qcom,qcs8550", "qcom,sm8550";
+	chassis-type = "embedded";
+
+	aliases {
+		serial0 = &uart7;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	/* Enables 5V_PER, 3V3_PER and 1V8_PER rails. These rails
+	 * aren't used by anything within the device-tree but are used
+	 * for on board logic level conversion and as rails for
+	 * pull-ups.
+	 */
+	per_pwr: regulator-per-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "per_pwr";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&pwr_per_en_default>;
+
+		gpio = <&tlmm 142 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	sdhci_2_vqmmc: regulator-sdhci-2-vqmmc {
+		compatible = "regulator-gpio";
+
+		regulator-name = "sdhci_2_vqmmc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-type = "voltage";
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&sd_vset_default>;
+
+		gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		gpios-states = <0>;
+		states = <3300000 0>,
+			 <1800000 1>;
+
+		startup-delay-us = <10000>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&apps_rsc {
+	regulators-0 {
+		vdd-bob1-supply = <&vph_pwr>;
+		vdd-bob2-supply = <&vph_pwr>;
+	};
+
+	regulators-3 {
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+	};
+
+	regulators-4 {
+		vdd-s4-supply = <&vph_pwr>;
+	};
+
+	regulators-5 {
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+	};
+};
+
+&gpi_dma1 {
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/sm8550/a740_zap.mbn";
+	/* Zap shader doesn't load so is disabled */
+	status = "disabled";
+};
+
+&i2c_master_hub_0 {
+	status = "okay";
+};
+
+&i2c_hub_2 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	ptn3222: redriver@43 {
+		compatible = "nxp,ptn3222";
+		reg = <0x43>;
+		#phy-cells = <0>;
+
+		vdd1v8-supply = <&vreg_l15b_1p8>;
+		vdd3v3-supply = <&vreg_l5b_3p1>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&eusb2_repeater_reset_default>;
+
+		reset-gpios = <&pm8550vs_d_gpios 4 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sm8550/ipa_fws.mbn";
+	status = "okay";
+};
+
+&iris {
+	status = "okay";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	/*
+	 * pcie0 hosts the M.2 Key-E slot. Apply the SDIO
+	 * reset de-assert here so any module's chip enable is settled
+	 * before pcie0 trains its link.
+	 */
+	pinctrl-0 = <&pcie0_default_state>, <&m2e_sdio_resetn_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie0_phy {
+	vdda-phy-supply = <&vreg_l1e_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&pcie1 {
+	wake-gpios = <&tlmm 99 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 97 GPIO_ACTIVE_LOW>;
+
+	/*
+	 * pcie_switch_sel_default and gbe_reset_default are board-init
+	 * lines that must be stable before pcie1 trains its link: the
+	 * PCIe switch needs its mode-select strap settled, and the
+	 * downstream LAN743x must be out of reset to enumerate.
+	 * Applying them via pcie1's pinctrl-0 fires them during
+	 * qcom-pcie probe, before bus enumeration.
+	 */
+	pinctrl-0 = <&pcie1_default_state>,
+		    <&pcie_switch_sel_default>,
+		    <&gbe_reset_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pcie1_phy {
+	vdda-phy-supply = <&vreg_l3c_0p9>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+	vdda-qref-supply = <&vreg_l1e_0p88>;
+
+	status = "okay";
+};
+
+&pm8550_gpios {
+	sd_card_detect_default: sd-card-detect-default-state {
+		pins = "gpio12";
+		function = "normal";
+		input-enable;
+		output-disable;
+		bias-disable;
+		power-source = <1>; /* 1.8 V */
+	};
+};
+
+&pm8550vs_d_gpios {
+	eusb2_repeater_reset_default: eusb2-repeater-reset-default-state {
+		pins = "gpio4";
+		function = "normal";
+
+		input-enable;
+		output-enable;
+		bias-disable;
+
+		drive-push-pull;
+		power-source = <1>; /* 1.8V */
+		qcom,drive-strength = <3>;
+	};
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&qupv3_id_0 {
+	status = "okay";
+};
+
+&qupv3_id_1 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/sm8550/adsp.mbn",
+			"qcom/sm8550/adsp_dtb.mbn";
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/sm8550/cdsp.mbn",
+			"qcom/sm8550/cdsp_dtb.mbn";
+	status = "okay";
+};
+
+&sdc2_default {
+	clk-pins {
+		drive-strength = <16>;
+	};
+
+	cmd-pins {
+		/delete-property/ bias-pull-up;
+		bias-disable;
+		drive-strength = <16>;
+	};
+
+	data-pins {
+		/delete-property/ bias-pull-up;
+		bias-disable;
+		drive-strength = <16>;
+	};
+};
+
+&sdhc_2 {
+	cd-gpios = <&pm8550_gpios 12 GPIO_ACTIVE_LOW>;
+
+	pinctrl-0 = <&sdc2_default>, <&sd_card_detect_default>;
+	pinctrl-1 = <&sdc2_default>, <&sd_card_detect_default>;
+	pinctrl-names = "default", "sleep";
+
+	vqmmc-supply = <&sdhci_2_vqmmc>;
+
+	bus-width = <4>;
+	no-sdio;
+	no-mmc;
+
+	status = "okay";
+};
+
+&tlmm {
+	/* Reserved I/Os for NFC */
+	gpio-reserved-ranges = <32 8>;
+
+	pwr_per_en_default: pwr-per-en-default-state {
+		pwr-per-en-pins {
+			pins = "gpio142";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	sd_vset_default: sd-vset-default-state {
+		sd-vset-pins {
+			pins = "gpio4";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+	};
+
+	/*
+	 * Drive LAN743x reset high (de-asserted) when pcie1 probes,
+	 * so the PHY enumerates on the bus.
+	 */
+	gbe_reset_default: gbe-reset-default-state {
+		pins = "gpio138";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	/*
+	 * We drive this GPIO physically high on the M2 Key-E connector
+	 * to make sure the module is enabled. An M2 Key-E module could
+	 * be using this pin as a chip enable.
+	 */
+	m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
+		pins = "gpio41";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	/* Force the on-board PCIe switch to select the GbE upstream
+	 * port.
+	 */
+	pcie_switch_sel_default: pcie-switch-sel-default-state {
+		pins = "gpio16";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-low;
+	};
+};
+
+&uart7 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 210 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l17b_2p5>;
+	vcc-max-microamp = <1300000>;
+	vccq-supply = <&vreg_l1g_1p2>;
+	vccq-max-microamp = <1200000>;
+	vdd-hba-supply = <&vreg_l3g_1p2>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vreg_l1d_0p88>;
+	vdda-pll-supply = <&vreg_l3e_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	/delete-property/ usb-role-switch;
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l1e_0p88>;
+	vdda12-supply = <&vreg_l3e_1p2>;
+
+	phys = <&ptn3222>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3e_1p2>;
+	vdda-pll-supply = <&vreg_l3f_0p88>;
+
+	status = "okay";
+};

-- 
2.43.0


