Return-Path: <linux-arm-msm+bounces-106016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8GywJPZO+mndMAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-106016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:11:34 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CC64D37E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 05 May 2026 22:11:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 9B0CF3070C7D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 May 2026 20:10:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1FF523E3C71;
	Tue,  5 May 2026 20:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b="WetIelqQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BA363DBD7D
	for <linux-arm-msm@vger.kernel.org>; Tue,  5 May 2026 20:10:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778011811; cv=none; b=PECg11P7rjJe+/KtoiV8Nn3WGnygHSb/Q9geHUIBOPGiEJn9ZpVAIdu9fUon/R07KEJP9MPazK3l9NsZZbKtjR87EZkBrAK8fQkjRTpb5zXfIjaeHGDrdwuh6A+yN4kD4Po0kLgWn0HkoHhMuhPrtoJaHADoTLsU40dPKYbPahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778011811; c=relaxed/simple;
	bh=M8q85cHuD0IjA1YEFkE69hYJVLVnkgwDfpkr7khlWG8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D0a3d7jzHHIVo3HR/+MQgmaIOeEQOZp0ftznqqJbg8vNgPGE67uJamj06cpbsU4rrM+k1A0X7gcnRW4zCfkW2eUPf7ueQQnMaAD/VF8cmXuBLLTDX7T4tZq/0s75R8Gtd9YH0WOjvrmXXGYUkaq5/I37XDGPQ/SsXVLLxBZ9qOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com; spf=pass smtp.mailfrom=imd-tec.com; dkim=pass (2048-bit key) header.d=imd-tec.com header.i=@imd-tec.com header.b=WetIelqQ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=imd-tec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=imd-tec.com
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4893940bb5eso31187895e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 May 2026 13:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=imd-tec.com; s=google; t=1778011807; x=1778616607; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H96GoGVNWeBT3mnRxUx/mo6k/EMQS91J6elkRaHR/kE=;
        b=WetIelqQTXWZxLtj0FE6Sf1Lix4JxWyWaV0kzYG14n66GL9yVWAUjo++DZHSIP6MES
         +tPP+j9I5pgecY4nMHCyunspJC9Frlqw3CXi4lVc2miC9BSvzp4i1VSCaRQ0HC5UFgMp
         xvzR7YGauueNd3Y03hmHpLc19ewp2VSQrP4UcWwbysDHLjq6TfdM5GAAX7tu0DxiyHHn
         dpmdXWvwfoGNbdZyC0LhhdOHCChCSwiN9N836xn3BEHKey7sd0VPKWi2Bh/5gKDbyPXG
         7pJcpUchFsK1NY1CAfgrkUgfsC+6pvuztOk/ohG5FA2WssbLB0DV9XX6lb8fIRzQZqxZ
         ogzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778011807; x=1778616607;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H96GoGVNWeBT3mnRxUx/mo6k/EMQS91J6elkRaHR/kE=;
        b=o7ZjKXN3/w+2G7NhBMgCGsx1EzeH4IEFYSyLw4ZXtZXHQ/3RaoaFkmrf99pttY2NzH
         1yVUcnGAudKvUKGaoEYn9CwcJgm7BZ0PCh9SgAjKk1aPbVd2J4MwS7hQswudzUyMZr3B
         09W6VGQNoZz3EVBahBaDi6Y8vG2T4Dou4IWpeCOAcxBsn9hgHdsmyPVIqmt2alj9jzym
         UoAfcsTZHLISRbXePR0BFlcXR7I454kI1xiVpjMorxv3/SnvXEYctu321Dkemafib3Mr
         melaFXdwoebf4Exn2GHdWctdkysv1toLWJJvB1ApnHogZCt7QMnY2MAxGWhesuDjFI4x
         7SGg==
X-Forwarded-Encrypted: i=1; AFNElJ8CnNNwpS6WOSqdEpOi8TwBQr1Bpc8o2K06WJ+m/YBg8pDBM3x5jqWUGCohjiGKJqIM1dF7A7MPZhwMWLPt@vger.kernel.org
X-Gm-Message-State: AOJu0YwddMHFXUsYVlvA++E/qcEgn4FJYuOWVH5A1YfP2/nAnGucLcWr
	om2dQ36+XT836EG08pSYx6IJ7Jro7ZGE/Hn5utJQLUQVGPEZfZ+c/1GLh2KFF1Cs8wA=
X-Gm-Gg: AeBDieshxlrPHuRfknGqKzgzTXmXSwmVZf9FixN+JJozIXqn0AHr4ry0h+yaMm+gh9n
	Pq3G8XN9TNuhrLhTkuZ4Hv42YJH1mklhMkYNmP6zMPIAkdV5KSYM39HqAXFRYQmOKPzn7XbbYDW
	R4AJ+0sNcXL/5+9GHYgAEWrUd4lmJk2M5muxiotm0pj+O9UVRlMj4oZ+1LPe6WM00S56QdkX59p
	HIqRewv5LOQU43GKY1DW65IahFDjbffZld+JiLRdRiGgNqHO8YKnyq0UbE3W+vZpmUb3PU1T9FE
	STfC92WydpBwkNCygrN28KLrVad03rDB6142XqGArwvE6fhC/kitkw9VUqig1XJ0vg2tdx2srcu
	Vzaoz8CVgTm6kgqVgzYj4HzuwsfLu2KRMYwW+0nsL591J14gmC/IuSEqOQL1Lv4k5wms8kbLU0Q
	wLKKdZxUPz73ZE2fcTWm6S1HtyonKKjfMWdlm0UDTGKfniYh9ap7TkyQMhK/zMKM5fr8d7ODVKM
	A1O/cKlwOY44GJrC35z3lJOoBQNDNy8Lew=
X-Received: by 2002:a05:600c:43d5:b0:489:1d74:56d with SMTP id 5b1f17b1804b1-48e51f4940emr5829045e9.29.1778011806939;
        Tue, 05 May 2026 13:10:06 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:23c6:2736:8e01:fc8c:f883:9efa:3625])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5285ffc5sm1752205e9.2.2026.05.05.13.10.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 13:10:06 -0700 (PDT)
From: William Bright <william.bright@imd-tec.com>
Date: Tue, 05 May 2026 21:09:54 +0100
Subject: [PATCH v2 4/4] arm64: dts: qcom: Add IMDT QCS8550 SBC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260505-imdt-qcs8550-sbc-rfc-v2-4-b4767d0dd421@imd-tec.com>
References: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
In-Reply-To: <20260505-imdt-qcs8550-sbc-rfc-v2-0-b4767d0dd421@imd-tec.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, William Bright <william.bright@imd-tec.com>
X-Mailer: b4 0.15.2
X-Rspamd-Queue-Id: 04CC64D37E3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[imd-tec.com,none];
	R_DKIM_ALLOW(-0.20)[imd-tec.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[imd-tec.com:+];
	TAGGED_FROM(0.00)[bounces-106016-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[william.bright@imd-tec.com,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[9];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imd-tec.com:email,imd-tec.com:dkim,imd-tec.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,0.0.0.43:email]

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
 arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts | 827 ++++++++++++++++++++++++++
 2 files changed, 828 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 88c5c0c1cb8e..d38fb3c43c13 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -181,6 +181,7 @@ qcs8300-ride-el2-dtbs := qcs8300-ride.dtb monaco-el2.dtbo
 
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride-el2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-imdt-sbc.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 
diff --git a/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
new file mode 100644
index 000000000000..d8ed92e746a2
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs8550-imdt-sbc.dts
@@ -0,0 +1,827 @@
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
+		serial1 = &uart14;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	backlight: backlight {
+		compatible = "gpio-backlight";
+		gpios = <&pm8550_gpios 6 GPIO_ACTIVE_HIGH>;
+		default-on;
+	};
+
+	cam_1v2_reg: regulator-cam-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_1v2_reg";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		vin-supply = <&hr_cam_pwr>;
+	};
+
+	cam_1v8_reg: regulator-cam-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_1v8_reg";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&hr_cam_pwr>;
+	};
+
+	cam_2v8_reg: regulator-cam-2v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_2v8_reg";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+		vin-supply = <&hr_cam_pwr>;
+	};
+
+	cam_3v3_reg: regulator-cam-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "cam_3v3_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&hr_cam_pwr>;
+	};
+
+	display_panel_pwr_en: regulator-display-panel-en {
+		compatible = "regulator-fixed";
+		regulator-name = "display_panel_pwr_en";
+		regulator-min-microvolt = <8000000>;
+		regulator-max-microvolt = <8000000>;
+		startup-delay-us = <10000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&panel_en_default>;
+
+		gpio = <&tlmm 123 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&som_vph_pwr>;
+	};
+
+	/* 5V VIN to backlight LED driver PMIC */
+	dsi_5v_en: regulator-dsi-5v-en {
+		compatible = "regulator-fixed";
+		regulator-name = "dsi_5v_en";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi_5v_en_default>;
+
+		gpio = <&tlmm 140 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&som_vph_pwr>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* Enables 1V2, 1V8_CAM and 3V3_CAM */
+	hr_cam_pwr: regulator-hr-cam-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "hr_cam_pwr";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&hr_cam_en_default>;
+
+		gpio = <&tlmm 146 GPIO_ACTIVE_LOW>;
+
+		vin-supply = <&som_vph_pwr>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	/* Enables V2MB_3V8 and V2ME_3V3 */
+	m2_pd_pwr: regulator-m2-pd-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "m2_pd_pwr";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&m2_pd_en_default>;
+
+		gpio = <&tlmm 144 GPIO_ACTIVE_LOW>;
+
+		vin-supply = <&som_vph_pwr>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		gpio-open-drain;
+	};
+
+	per_1v8_reg: regulator-per-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "per_1v8_reg";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&per_pwr>;
+	};
+
+	per_3v3_reg: regulator-per-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "per_3v3_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&per_pwr>;
+	};
+
+	per_5v_reg: regulator-per-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "per_5v_reg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&per_pwr>;
+	};
+
+	/* Enables 5V_PER, 3V3_PER and 1V8_PER */
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
+		vin-supply = <&som_vph_pwr>;
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
+	sdhci_4_vqmmc: regulator-sdhci-4-vqmmc {
+		compatible = "regulator-fixed";
+		regulator-name = "sdhci_4_vqmmc";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	som_vph_pwr: regulator-som-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "som_vph_pwr";
+		regulator-min-microvolt = <3900000>;
+		regulator-max-microvolt = <3900000>;
+		regulator-always-on;
+		regulator-boot-on;
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
+
+	vsys_sd_3v3_reg: regulator-vsys-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_sd_3v3_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vsys_wlan_3v3_reg: regulator-vsys-wlan-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vsys_wlan_3v3_reg";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		/*
+		 * NXP IW416 chip enables: PMIC_EN (master) and WLAN_EN.
+		 * Held asserted (low) before SDHC4 powers up, then
+		 * released after vmmc/vqmmc are stable.
+		 */
+		reset-gpios = <&tlmm 19 GPIO_ACTIVE_LOW>,
+			      <&tlmm 5 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <50>;
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
+&lpass_rxmacro {
+	status = "disabled";
+};
+
+&lpass_tlmm {
+	status = "disabled";
+};
+
+&lpass_txmacro {
+	status = "disabled";
+};
+
+&lpass_vamacro {
+	status = "disabled";
+};
+
+&lpass_wsa2macro {
+	status = "disabled";
+};
+
+&lpass_wsamacro {
+	status = "disabled";
+};
+
+&pcie0 {
+	wake-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+	perst-gpios = <&tlmm 94 GPIO_ACTIVE_LOW>;
+
+	/*
+	 * pcie0 hosts the M.2 Key-E slot. Apply the SDIO reset
+	 * de-assert here so any module's chip enable is settled
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
+&pmk8550_gpios {
+	pmk8550_sleep_clk: sleep-clk-state {
+		pins = "gpio3";
+		function = "func1";
+		input-disable;
+		output-enable;
+		bias-disable;
+		power-source = <1>; /* 1.8 V */
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
+&remoteproc_mpss {
+	firmware-name = "qcom/sm8550/modem.mbn",
+			"qcom/sm8550/modem_dtb.mbn";
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
+	vmmc-supply = <&vsys_sd_3v3_reg>;
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
+	bt_default: bt-default-state {
+		bt-en-pins {
+			pins = "gpio81";
+			function = "gpio";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		sw-ctrl-pins {
+			pins = "gpio82";
+			function = "gpio";
+			bias-pull-down;
+		};
+	};
+
+	dsi_5v_en_default: dsi-5v-en-default-state {
+		pins = "gpio140";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	goodix_int_default: goodix-int-default-state {
+		goodix-int-pins {
+			pins = "gpio88";
+			function = "gpio";
+			bias-disable;
+		};
+	};
+
+	goodix_reset_default: goodix-reset-default-state {
+		goodix-reset-pins {
+			pins = "gpio122";
+			function = "gpio";
+			drive-strength = <8>;
+			drive-open-drain;
+			bias-disable;
+		};
+	};
+
+	hr_cam_en_default: hr-cam-en-default-state {
+		hr-cam-en-pins {
+			pins = "gpio146";
+			function = "gpio";
+			drive-strength = <16>;
+		};
+	};
+
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio8";
+		function = "gpio";
+		bias-disable;
+	};
+
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio7";
+		function = "gpio";
+		output-high;
+	};
+
+	m2_pd_en_default: m2-pd-en-default-state {
+		m2-pd-en-pins {
+			pins = "gpio144";
+			function = "gpio";
+			drive-strength = <16>;
+			drive-open-drain;
+		};
+	};
+
+	panel_en_default: panel-en-default-state {
+		pins = "gpio123";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	panel_reset_default: panel-reset-default-state {
+		pins = "gpio133";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-disable;
+		drive-open-drain;
+	};
+
+	pwr_per_en_default: pwr-per-en-default-state {
+		pwr-per-en-pins {
+			pins = "gpio142";
+			function = "gpio";
+			drive-strength = <16>;
+		};
+	};
+
+	sd_vset_default: sd-vset-default-state {
+		sd-vset-pins {
+			pins = "gpio4";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
+
+	sdc4_default: sdc4-default-state {
+		clk-pins {
+			pins = "gpio50";
+			function = "sdc4_clk";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		cmd-pins {
+			pins = "gpio51";
+			function = "sdc4_cmd";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		data0-pins {
+			pins = "gpio89";
+			function = "sdc40";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		data1-pins {
+			pins = "gpio90";
+			function = "sdc41";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		data2-pins {
+			pins = "gpio48";
+			function = "sdc42";
+			bias-disable;
+			drive-strength = <16>;
+		};
+
+		data3-pins {
+			pins = "gpio49";
+			function = "sdc43";
+			bias-disable;
+			drive-strength = <16>;
+		};
+	};
+
+	sdc4_sleep: sdc4-sleep-state {
+		clk-pins {
+			pins = "gpio50";
+			function = "sdc4_clk";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		cmd-pins {
+			pins = "gpio51";
+			function = "sdc4_cmd";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		data0-pins {
+			pins = "gpio89";
+			function = "sdc40";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		data1-pins {
+			pins = "gpio90";
+			function = "sdc41";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		data2-pins {
+			pins = "gpio48";
+			function = "sdc42";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		data3-pins {
+			pins = "gpio49";
+			function = "sdc43";
+			bias-disable;
+			drive-strength = <2>;
+		};
+	};
+
+	wcd_default: wcd-reset-n-active-state {
+		pins = "gpio108";
+		function = "gpio";
+		drive-strength = <16>;
+		bias-disable;
+		output-low;
+	};
+
+	wlan_en: wlan-en-state {
+		pins = "gpio80";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-down;
+	};
+
+	audio-speaker-dac-reset-default-state {
+		pins = "gpio171";
+		function = "gpio";
+		drive-strength = <2>;
+		drive-open-drain;
+	};
+
+	/*
+	 * Drive LAN743x reset high (de-asserted) when pcie1 probes,
+	 * so the PHY enumerates on the bus. Open-drain matches the
+	 * board's external pull-up on the reset line.
+	 */
+	gbe_reset_default: gbe-reset-default-state {
+		pins = "gpio138";
+		function = "gpio";
+		drive-strength = <2>;
+		drive-open-drain;
+		bias-disable;
+		output-high;
+	};
+
+	/*
+	 * We drive this GPIO physically high on the M2 Key-E
+	 * connector to make sure the module is enabled. An M2
+	 * Key-E module could be using this pin as a chip enable.
+	 */
+	m2e_sdio_resetn_default: m2e-sdio-resetn-default-state {
+		pins = "gpio41";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
+	/* Force the on-board PCIe switch to select the GbE upstream port. */
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
+&uart14 {
+	status = "okay";
+
+	/*
+	 * NXP IW416 WiFi+BT combo, BT side over UART. The btnxpuart
+	 * driver auto-detects the chip ID at runtime; the upstream
+	 * binding only enumerates 88w8987/8997 compatibles, so use
+	 * the closest match until an iw416-bt compatible is added.
+	 */
+	bluetooth {
+		compatible = "nxp,88w8987-bt";
+		fw-init-baudrate = <115200>;
+		max-speed = <3000000>;
+		firmware-name = "uartiw416_bt.bin";
+		reset-gpios = <&tlmm 160 GPIO_ACTIVE_LOW>;
+	};
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


