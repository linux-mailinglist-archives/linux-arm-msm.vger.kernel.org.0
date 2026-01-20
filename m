Return-Path: <linux-arm-msm+bounces-89874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mD83DyHcb2n8RwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:48:49 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id D43C24ABB9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 20:48:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D47FF7EB512
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 Jan 2026 18:02:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6254B44CF22;
	Tue, 20 Jan 2026 18:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jRPStTcG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B1644CAFA
	for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 18:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768932080; cv=none; b=F7+agQOLtAcCUwcj1WeemF4uldwsPipBZvug5OnqwgPZJVTZm/1+UZSr24NQeV/t0Uf8XzDrS2w+YU/FrNDB1CcHMV6J5sccJaXx+L6173HfMaFyZdTAYULAVLM3AxADGHXJw0+blBwJSRdYxHhw/9UhmbAv8fvlNTBQxbN/hEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768932080; c=relaxed/simple;
	bh=zo6KXXG4jYJD4f3UcZmvtjIsDA2DOYsZLMjNkvq+2ts=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xw9PI2fEQrhQpcHJDkliQ3iUjKOT6oA6YtDAEWAOvrMVk+LKR18+nd8nf514nA6zWVGocB+xzbrlJw4c8OzawDCaHVC+8G6nHLDBkBhBJy3JpuZphd2qC4TwMsgbMu+n54pdCWJgkXREUZLLEddATodOA3EChYIgwYdRLavIYVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jRPStTcG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-47ee0291921so38879155e9.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 20 Jan 2026 10:01:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768932075; x=1769536875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOD1KDE91Gue2VdaOrwNvitqYh5KSJtVXc4kZEOQho4=;
        b=jRPStTcGyPkldbMe1Q5mHL0GR+HwSZe1QocNCmpMDD/675Zi4KBx46tCrw95khfREL
         oR5vxBMm0t24UFrrIF39JtsPuiN/8LmPOaOjiDQGX/t8GZQYJ/hejNSfCqL28UQ5luIZ
         /RLeK387J8k+C7Q+t+H8/fBZtzc7GGeKE0/qXYMAgt/3G9I8tqGizqT+3bRw2ghUhGzS
         dlxKFHIHI+7AprALskzh6BQdBUCytcwnqb0KBiOvYcghVViWsbntcwv2/ygk5i6WE7pr
         EaSmoShnzcxaeqO3lp/Q65up5MDIlLKb1tGVPaRrls/EJk9O4cwR8fMnk8M/NTZH4pzx
         PO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768932075; x=1769536875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QOD1KDE91Gue2VdaOrwNvitqYh5KSJtVXc4kZEOQho4=;
        b=szJvIwpkKJ7vRuTjnaAHDS0wAoj2XD7StaeZwzkhHLGclkUptTDLjJHmxEdsEghhmg
         VkyE+Ve5wUpvAwgMujQnQlI8s5bieNsT0sBigPG/sFT6wBNenirF2wxQfdT4TVex8Q1y
         BDC6fgWfNKWwqcWLdP/mKqDEaqJQ+0G+1BLbPYyyTaDffCdH1aJpCahYsifMHqQ3MLol
         2pAkvxHbxd0ZbZF54dlqDg6p+uOmhl2wtQ534vIGEmT6XTngM8FKNlLDpfrAYK0YsjVe
         HAeNrh41V6agcOaXTbfNJmwam758rV1PdjBIIx06aFv/IwLsM3Z2rsuH3yjkjO9FLcHA
         RMww==
X-Gm-Message-State: AOJu0Yy9hOAViF57YYR2tyCh4wxc9Fv0iooyTULeBzY3z1wajuMKO34x
	iEGQ8LjG9DMiSddITE/j85/ad3ATNwizyoHo7BEEVW9dUQLKndCU/EqxEknGGghm
X-Gm-Gg: AY/fxX4dd5cHt5Zb3oGA5wjsoue9K5HcC6KTibVHFTdzBt80nwAk8BnWRDcoPMBMbAf
	ayb8H6zIkqKzDfZ4engFHCX79jafSmk//39azttDQtaPG4WJyFHqC9TUYvybP83oYLXWU5+Al4A
	PVxCy762FGNQGi614/Mn4ehC+voC5hQ0VH3yGelY1pVv8phE+cnzVkX59e9bJA9NUq6xcrNSQfH
	mCrp/u1PaFbidV/6ZpMZcm1MVENoXHhgvVncJuIOe1JsObXfZBTL7lOx5X3R/qUXv57n/iJO78O
	i77rjISmYbO2293735U0o8/k0NCHdfhpED89v1QI6bO1oBOnHQUVNmKCoDaRQJeBToLaae5LvD3
	JayecBLcr0Wu2VQa/Us3Pq2je5HBo3DO4OMMqeiBfJgwv+zlOgqmxxUCYE6PgvMr2+XLxDVbp0F
	Y4BraBiDaM+ped76cUkpfz
X-Received: by 2002:a05:600c:4451:b0:477:63b5:6f3a with SMTP id 5b1f17b1804b1-4801eb0eeb8mr189671835e9.27.1768932074686;
        Tue, 20 Jan 2026 10:01:14 -0800 (PST)
Received: from unknown.zextras.com ([78.208.157.140])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-47f429071a2sm312013015e9.11.2026.01.20.10.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jan 2026 10:01:14 -0800 (PST)
From: Gianluca Boiano <morf3089@gmail.com>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robh@kernel.org,
	david@ixit.cz,
	Gianluca Boiano <morf3089@gmail.com>,
	Mathesh Velayudan <123v.mathesh@gmail.com>,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH 5/7] arm64: dts: qcom: add device tree for Xiaomi Redmi Note 5 Pro (whyred)
Date: Tue, 20 Jan 2026 19:00:50 +0100
Message-ID: <20260120180052.1031231-6-morf3089@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260120180052.1031231-1-morf3089@gmail.com>
References: <20260120180052.1031231-1-morf3089@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [1.04 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89874-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,ixit.cz,gmail.com,postmarketos.org];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[morf3089@gmail.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[gmail.com:+];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCPT_COUNT_SEVEN(0.00)[11];
	DMARC_POLICY_ALLOW(0.00)[gmail.com,none];
	PRECEDENCE_BULK(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[postmarketos.org:email,0.0.0.1:email,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,0.0.0.20:email,0.0.0.11:email,0.0.0.3:email]
X-Rspamd-Queue-Id: D43C24ABB9
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add initial device tree support for the Xiaomi Redmi Note 5 Pro
(codename: whyred), a smartphone based on Qualcomm SDM636 SoC with
4/6GB RAM and a 5.99" 1080x2160 display.

This enables:
- Booting to a framebuffer console
- USB support
- Hall effect sensor
- Touchscreen (Synaptics RMI4)
- Battery monitoring
- Charging (pm660_charger)
- Status LED (pm660l_lpg)

Co-developed-by: Mathesh Velayudan <123v.mathesh@gmail.com>
Signed-off-by: Mathesh Velayudan <123v.mathesh@gmail.com>
Co-developed-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
Signed-off-by: Gianluca Boiano <morf3089@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm636-xiaomi-whyred.dts    | 374 ++++++++++++++++++
 2 files changed, 375 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm636-xiaomi-whyred.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 6168d204ca91..a1cf067fdfeb 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -244,6 +244,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-fairphone-fp3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm632-motorola-ocean.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-sony-xperia-ganges-mermaid.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-xiaomi-tulip.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm636-xiaomi-whyred.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm660-xiaomi-lavender.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm670-google-sargo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm636-xiaomi-whyred.dts b/arch/arm64/boot/dts/qcom/sdm636-xiaomi-whyred.dts
new file mode 100644
index 000000000000..153c8481c658
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm636-xiaomi-whyred.dts
@@ -0,0 +1,374 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2025, Mathesh Velayudan <123v.mathesh@gmail.com>
+ * Copyright (c) 2025, Alexey Minnekhanov <alexeymin@postmarketos.org>
+ */
+
+/dts-v1/;
+
+#include "sdm636.dtsi"
+#include "sdm660-xiaomi-common.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "Xiaomi Redmi Note 5 Pro";
+	compatible = "xiaomi,whyred", "qcom,sdm636";
+	chassis-type = "handset";
+
+	battery: battery {
+		compatible = "simple-battery";
+		charge-full-design-microamp-hours = <4000000>;
+		voltage-min-design-microvolt = <3400000>;
+		voltage-max-design-microvolt = <4408000>;
+	};
+
+	reserved-memory {
+		ramoops@a0000000 {
+			compatible = "ramoops";
+			reg = <0x0 0xa0000000 0x0 0x400000>;
+			console-size = <0x20000>;
+			record-size = <0x20000>;
+			ftrace-size = <0x0>;
+			pmsg-size = <0x20000>;
+		};
+	};
+};
+
+&blsp_i2c1 {
+	status = "okay";
+
+	/* Synaptics E753 */
+	touchscreen@20 {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x20>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interrupts-extended = <&tlmm 67 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-0 = <&ts_active>;
+		pinctrl-names = "default";
+
+		vio-supply = <&vreg_l11a_1p8>;
+
+		syna,reset-delay-ms = <220>;
+		syna,startup-delay-ms = <600>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f11@11 {
+			reg = <0x11>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&framebuffer0 {
+	width = <1080>;
+	height = <2160>;
+	stride = <(1080 * 4)>;
+
+	status = "okay";
+};
+
+&gpio_hall_sensor {
+	status = "okay";
+};
+
+&pm660_charger {
+	monitored-battery = <&battery>;
+
+	status = "okay";
+};
+
+&pm660l_lpg {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	qcom,power-source = <1>;
+
+	status = "okay";
+
+	led@3 {
+		reg = <3>;
+		color = <LED_COLOR_ID_WHITE>;
+		function = LED_FUNCTION_STATUS;
+	};
+};
+
+&pm660l_wled {
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm660l-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l9_l10-supply = <&vreg_s2b_1p05>;
+		vdd_l2-supply = <&vreg_bob>;
+		vdd_l3_l5_l7_l8-supply = <&vreg_bob>;
+		vdd_l4_l6-supply = <&vreg_bob>;
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_s1b_1p125: s1 {
+			regulator-min-microvolt = <1125000>;
+			regulator-max-microvolt = <1125000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		vreg_s2b_1p05: s2 {
+			regulator-min-microvolt = <1050000>;
+			regulator-max-microvolt = <1050000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		/* LDOs */
+		vreg_l1b_0p925: l1 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <925000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		/* SDHCI 3.3V signal doesn't seem to be supported. */
+		vreg_l2b_2p95: l2 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <3100000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l3b_3p3: l3 {
+			regulator-min-microvolt = <1710000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+			regulator-always-on;
+		};
+
+		vreg_l4b_2p95: l4 {
+			regulator-min-microvolt = <1700000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-enable-ramp-delay = <250>;
+
+			regulator-min-microamp = <200>;
+			regulator-max-microamp = <600000>;
+			regulator-system-load = <570000>;
+			regulator-allow-set-load;
+		};
+
+		/*
+		 * Downstream specifies a range of 1721-3600mV,
+		 * but the only assigned consumers are SDHCI2 VMMC
+		 * and Coresight QPDI that both request pinned 2.95V.
+		 * Tighten the range to 1.8-3.328 (closest to 3.3) to
+		 * make the mmc driver happy.
+		 */
+		vreg_l5b_2p95: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3328000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+
+		vreg_l7b_3p125: l7 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <3125000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l8b_3p3: l8 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3600000>;
+			regulator-enable-ramp-delay = <500>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,rpm-pm660-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+
+		vdd_l1_l6_l7-supply = <&vreg_s5a_1p35>;
+		vdd_l2_l3-supply = <&vreg_s2b_1p05>;
+		vdd_l5-supply = <&vreg_s2b_1p05>;
+		vdd_l8_l9_l10_l11_l12_l13_l14-supply = <&vreg_s4a_2p04>;
+		vdd_l15_l16_l17_l18_l19-supply = <&vreg_bob>;
+
+		/*
+		 * S1A (FTAPC0), S2A (FTAPC1), S3A (HFAPC1) are managed
+		 * by the Core Power Reduction hardened (CPRh) and the
+		 * Operating State Manager (OSM) HW automatically.
+		 */
+
+		vreg_s4a_2p04: s4 {
+			regulator-min-microvolt = <1805000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-enable-ramp-delay = <200>;
+			regulator-always-on;
+		};
+
+		vreg_s5a_1p35: s5 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1350000>;
+			regulator-enable-ramp-delay = <200>;
+		};
+
+		vreg_s6a_0p87: s6 {
+			regulator-min-microvolt = <504000>;
+			regulator-max-microvolt = <992000>;
+			regulator-enable-ramp-delay = <150>;
+		};
+
+		/* LDOs */
+		vreg_l1a_1p225: l1 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l2a_1p0: l2 {
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1010000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <950000>;
+			regulator-max-microvolt = <1010000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l5a_0p848: l5 {
+			regulator-min-microvolt = <525000>;
+			regulator-max-microvolt = <950000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l6a_1p3: l6 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1370000>;
+			regulator-allow-set-load;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l7a_1p2: l7 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l8a_1p8: l8 {
+			regulator-min-microvolt = <1750000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-system-load = <325000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1750000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1780000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+			regulator-system-load = <14000>;
+		};
+
+		vreg_l11a_1p8: l11 {
+			regulator-min-microvolt = <1780000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1780000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		/* This gives power to the LPDDR4: never turn it off! */
+		vreg_l13a_1p8: l13 {
+			regulator-min-microvolt = <1780000>;
+			regulator-max-microvolt = <1950000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-boot-on;
+			regulator-always-on;
+		};
+
+		vreg_l14a_1p8: l14 {
+			regulator-min-microvolt = <1710000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-always-on;
+		};
+
+		vreg_l17a_1p8: l17 {
+			regulator-min-microvolt = <1650000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-enable-ramp-delay = <250>;
+		};
+
+		vreg_l19a_3p3: l19 {
+			regulator-min-microvolt = <3200000>;
+			regulator-max-microvolt = <3400000>;
+			regulator-enable-ramp-delay = <250>;
+			regulator-allow-set-load;
+		};
+	};
+};
+
+&sdhc_2 {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <8 4>; /* Fingerprint SPI */
+
+	ts_active: ts-active-state {
+		pins = "gpio66", "gpio67";
+		function = "gpio";
+		drive-strength = <10>;
+		bias-pull-up;
+	};
+};
-- 
2.52.0


