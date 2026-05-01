Return-Path: <linux-arm-msm+bounces-105561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wNzKAVku9WknJQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-105561-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 00:51:05 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8E34B0145
	for <lists+linux-arm-msm@lfdr.de>; Sat, 02 May 2026 00:51:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 67FB4301D300
	for <lists+linux-arm-msm@lfdr.de>; Fri,  1 May 2026 22:50:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1E4337D120;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P0azUMRW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9718637C924;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777675856; cv=none; b=DtSS1qusGQwBt043tmkonYPQBQ/DSoR30TcqBHf39MXz2B/WTfLZm174f+Wg0T+CAq0OWZXkvqSN3YPkk/4DMGjtPOl2k1lkiVUo9CLSEXQLbHpE6XiQx9AVyYuxm+YPYuPcaqi+AdD2dBm9kJi7I1VUtSUg9A3h1RukLV1jWxc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777675856; c=relaxed/simple;
	bh=JsKQZwT7twmRx3oEqUH0SYKC6E0mKWOX2JdLdQ0Tj4c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M+E56IsUIq7cPjVf7CtfolyaW3C8Vw1ZxDGw0SXRlIClQd+Yh4gNBTVObANIgOFvpf2uUsGJmuZ/AlpeV89hMYFtzS2gZsBx+uuMYeypD8NImMHGEQMvh0FpF3u2KNik6yXv8xIVTc+9f0NBykhAoo6Rl959HghkyKxcFpop60k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P0azUMRW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 59F21C2BCB8;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777675856;
	bh=JsKQZwT7twmRx3oEqUH0SYKC6E0mKWOX2JdLdQ0Tj4c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=P0azUMRW63s2kCBIhx1Vj/VdDpuaJGCW4DGVhq4a1Vayu5ZMwJfbQSiMoZUzkNsWu
	 FJKpeTdH+pGPPnHraJ5SD9erTIwDrhB9clyrbtfwyIRPzSrDM4F6H/SbDTptYx99si
	 cUgqdOwhKJtFQTbebRy9iBaOGwaCQzV18005xYRU60bgaslmGiTUQ/tiezTgOfEeem
	 VUB+Zdv3u5RtdARW8PBqFcfv7+xGrKMOOvr4T2V1CLDm4+vscBqN6B6xs1dSGZPLTz
	 2TLB52SbpWrp7wH2/ApBrgYqAiqCtW6YwQ+gWY5l0goUlOnuvkd6hVdZhD/LGscINz
	 nMiLpKIgrXEGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D11ACD342C;
	Fri,  1 May 2026 22:50:56 +0000 (UTC)
From: David Wales via B4 Relay <devnull+daviewales.disroot.org@kernel.org>
Date: Sat, 02 May 2026 08:50:18 +1000
Subject: [PATCH v2 2/2] ARM: dts: qcom: Support Motorola Moto G2 (2014)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260502-device-motorola-titan-mainline-v2-2-c791277c740a@disroot.org>
References: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
In-Reply-To: <20260502-device-motorola-titan-mainline-v2-0-c791277c740a@disroot.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, David Wales <daviewales@disroot.org>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=9249;
 i=daviewales@disroot.org; h=from:subject:message-id;
 bh=Y/D2bPYseKj91h+dSiR9jAud0Qe3ndBFvxMnLZT8Yo0=;
 b=owEBbQGS/pANAwAKAW1jV4FG9KFmAcsmYgBp9S5OxYhBaSvVuvwGdC+0iTVqij15XfRR8WMQI
 fqHgAGGgR2JATMEAAEKAB0WIQTXikd3yUPmOPWSLPJtY1eBRvShZgUCafUuTgAKCRBtY1eBRvSh
 ZlOZB/oD2DQ4eWtMC7AI8n1v7T9//nRXovMSQLhoVqYxG5ftAyzUXjUvrxkcYCICecGIN4gmnma
 Tk+NewWDdmqDfXc6MbxS93DeFDiPw+0c9GlfUoemqGm7Ft1pnyVuMDJhLvhqI8MSX7eaW0tNbyr
 ZwqE+XyB7j6RQo/0t8ogEIUWVC1s1DkrqTn+IaSmBjtVsWRLHaMunlWhZZc4nZlerUnfSCR9BZu
 1o+iKJLhqgFXHlVhQBWcS0VJgw/SriljjsZ7mFnZDjhkmg1N527qlAU5etl33JmqqWqYC6NJZVu
 c2RHiHFO7Hx5oa14t7y5GfK+eQpgZsXDpnh6HOPRzeMRtiJy
X-Developer-Key: i=daviewales@disroot.org; a=openpgp;
 fpr=8F5BAFB15444A769DC3B61684022B817D275D037
X-Endpoint-Received: by B4 Relay for daviewales@disroot.org/default with
 auth_id=737
X-Original-From: David Wales <daviewales@disroot.org>
Reply-To: daviewales@disroot.org
X-Rspamd-Queue-Id: 9E8E34B0145
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-105561-lists,linux-arm-msm=lfdr.de,daviewales.disroot.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[devnull@kernel.org,linux-arm-msm@vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[9];
	HAS_REPLYTO(0.00)[daviewales@disroot.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.48.212.0:email,f500000:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]

From: David Wales <daviewales@disroot.org>

Add device tree for Motorola Moto G2 (2014) (motorola-titan) smartphone
based on the Qualcomm MSM8226 SoC.

Initially supported features:
  - Buttons (Volume Down/Up, Power)
  - eMMC
  - Hall Effect Sensor
  - Simple framebuffer display
  - Vibrator

Based on device tree for similar device msm8226-motorola-falcon.
Initial commit for falcon notes that dhob and shob reserved-memory
regions seem to be related to a Motorola specific mechanism. [1]

[1] https://github.com/LineageOS/android_kernel_motorola_msm8226/blob/cm-14.1/Documentation/devicetree/bindings/misc/hob_ram.txt

Signed-off-by: David Wales <daviewales@disroot.org>
---
 arch/arm/boot/dts/qcom/Makefile                   |   1 +
 arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts | 357 ++++++++++++++++++++++
 2 files changed, 358 insertions(+)

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index c7873dcef154..de311293ce16 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_QCOM) += \
 	msm8226-motorola-falcon.dtb \
+	msm8226-motorola-titan.dtb \
 	qcom-apq8016-sbc.dtb \
 	qcom-apq8026-asus-sparrow.dtb \
 	qcom-apq8026-huawei-sturgeon.dtb \
diff --git a/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
new file mode 100644
index 000000000000..73d414b1ddcf
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/msm8226-motorola-titan.dts
@@ -0,0 +1,357 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2026, David Wales <daviewales@disroot.org>
+ */
+
+/dts-v1/;
+
+#include "qcom-msm8226.dtsi"
+#include "pm8226.dtsi"
+
+/delete-node/ &smem_region;
+
+/ {
+	model = "Motorola Moto G2 (2014)";
+	compatible = "motorola,titan", "qcom,msm8226";
+	chassis-type = "handset";
+
+	aliases {
+		mmc0 = &sdhc_1; /* eMMC */
+	};
+
+	chosen {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@3200000 {
+			compatible = "simple-framebuffer";
+			reg = <0x03200000 0x800000>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+			vsp-supply = <&reg_lcd_pos>;
+			vsn-supply = <&reg_lcd_neg>;
+			vddio-supply = <&vddio_disp_vreg>;
+
+			clocks = <&mmcc MDSS_AHB_CLK>,
+				 <&mmcc MDSS_AXI_CLK>,
+				 <&mmcc MDSS_BYTE0_CLK>,
+				 <&mmcc MDSS_ESC0_CLK>,
+				 <&mmcc MDSS_MDP_CLK>,
+				 <&mmcc MMSS_MISC_AHB_CLK>,
+				 <&mmcc MDSS_PCLK0_CLK>,
+				 <&mmcc MDSS_VSYNC_CLK>;
+			power-domains = <&mmcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		event-hall-sensor {
+			label = "Hall Effect Sensor";
+			gpios = <&tlmm 109 GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LID>;
+			linux,can-disable;
+		};
+
+		key-volume-down {
+			label = "Volume Down";
+			gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <15>;
+		};
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 106 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	vddio_disp_vreg: regulator-vddio-disp {
+		compatible = "regulator-fixed";
+		regulator-name = "vddio_disp";
+
+		gpio = <&tlmm 10 GPIO_ACTIVE_HIGH>;
+		startup-delay-us = <300>;
+		enable-active-high;
+		regulator-boot-on;
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		framebuffer@3200000 {
+			reg = <0x03200000 0xfa0000>;
+			no-map;
+		};
+
+		dhob@f500000 {
+			reg = <0x0f500000 0x40000>;
+			no-map;
+		};
+
+		shob@f540000 {
+			reg = <0x0f540000 0x2000>;
+			no-map;
+		};
+
+		smem_region: smem@fa00000 {
+			reg = <0x0fa00000 0x100000>;
+			no-map;
+		};
+
+		reserved@fb00000 {
+			reg = <0x0fb00000 0x400000>;
+			no-map;
+		};
+	};
+};
+
+&blsp1_i2c4 {
+	status = "okay";
+
+	regulator@3e {
+		compatible = "ti,tps65132";
+		reg = <0x3e>;
+
+		pinctrl-0 = <&reg_lcd_default>;
+		pinctrl-names = "default";
+
+		reg_lcd_pos: outp {
+			regulator-name = "outp";
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5600000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		reg_lcd_neg: outn {
+			regulator-name = "outn";
+			regulator-min-microvolt = <5400000>;
+			regulator-max-microvolt = <5600000>;
+			regulator-active-discharge = <1>;
+			regulator-boot-on;
+			enable-gpios = <&tlmm 13 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&pm8226_vib {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8226-regulators";
+
+		pm8226_s3: s3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8226_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2200000>;
+		};
+
+		pm8226_s5: s5 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+		};
+
+		pm8226_l1: l1 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l3: l3 {
+			regulator-min-microvolt = <750000>;
+			regulator-max-microvolt = <1337500>;
+		};
+
+		pm8226_l4: l4 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l5: l5 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8226_l6: l6 {
+			/* Hall effect sensor */
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+		};
+
+		pm8226_l7: l7 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <1850000>;
+		};
+
+		pm8226_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l9: l9 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8226_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8226_l14: l14 {
+			regulator-min-microvolt = <2750000>;
+			regulator-max-microvolt = <2750000>;
+		};
+
+		pm8226_l15: l15 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8226_l16: l16 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3350000>;
+		};
+
+		pm8226_l17: l17 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l18: l18 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8226_l20: l20 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8226_l21: l21 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8226_l22: l22 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l23: l23 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8226_l24: l24 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8226_l25: l25 {
+			regulator-min-microvolt = <1775000>;
+			regulator-max-microvolt = <2125000>;
+		};
+
+		pm8226_l26: l26 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8226_l27: l27 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8226_l28: l28 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-boot-on;
+		};
+
+		pm8226_lvs1: lvs1 {
+			/* Pull-up for I2C lines */
+			regulator-always-on;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8226_l17>;
+	vqmmc-supply = <&pm8226_l6>;
+	bus-width = <8>;
+	non-removable;
+
+	status = "okay";
+};
+
+&smbb {
+	qcom,fast-charge-safe-current = <2000000>;
+	qcom,fast-charge-current-limit = <1900000>;
+	qcom,fast-charge-safe-voltage = <4400000>;
+	qcom,minimum-input-voltage = <4300000>;
+
+	status = "okay";
+};
+
+&usb {
+	extcon = <&smbb>;
+	dr_mode = "peripheral";
+
+	status = "okay";
+};
+
+&usb_hs_phy {
+	extcon = <&smbb>;
+	v1p8-supply = <&pm8226_l10>;
+	v3p3-supply = <&pm8226_l20>;
+};
+
+&tlmm {
+	reg_vddio_disp_default: reg-vddio-disp-default-state {
+		pins = "gpio10";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	reg_lcd_default: reg-lcd-default-state {
+		pins = "gpio12", "gpio13";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};

-- 
2.53.0



