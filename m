Return-Path: <linux-arm-msm+bounces-95676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QF7NJW+/qWnNDQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95676-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:37:51 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 95DBA216595
	for <lists+linux-arm-msm@lfdr.de>; Thu, 05 Mar 2026 18:37:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 2A12B3007AE8
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2026 17:29:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7DC173CD8C3;
	Thu,  5 Mar 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="gZ0V1y94";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="BioZy1C/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCD9F2459DC;
	Thu,  5 Mar 2026 17:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772731790; cv=none; b=HgBNVlo+oAcldFiZaK/c1Y9actJgIoCIG0x0uPWZZYipClhYRwIgpabvnNu4G/At4O3q5hBT5/lDwSCYBc43WGKFDXA2DOzZB5zHFMncXrrPUnpl3wofN6RP3PoBntwYaqO5OmzEojVi3NZF1ecF7ST5Tlv2iAREkPM0N/COJoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772731790; c=relaxed/simple;
	bh=3VpF+h/vRabFh0pawhkU/Ozvs+mTWi7ja9sIUaz4JBo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y7q5Uu+f/lzXCdGztj24A2hn7fU8IML2VzSFVxi2wk5xu85jZw7Y+L7i76q3f3qziYmLZZtnecM4b3hEAvy6aN6UFVuZHJTGi7p3vsMfqpz/HBz2djRmlUqEOp7soPmsJpdnYxpq9Mgr8p8k7LMiPLRHN4L9DO9TFWYXKheU+XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=gZ0V1y94; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=BioZy1C/; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731727; bh=9XaD5tYlo5c/PkvlJoEp5qp
	dJ+IVXcb+kkQadbkR0KE=; b=gZ0V1y94JL3Iz7NTlA+bkIAdReiLor4hv1jUHm/vQyHTUfmA5K
	EpT+03atkyAVlDk19tzOevf1Doe8INZpniSlCHaAUZiDlZneJG49XvzXjH7LqXQoh6K1wz9gVXp
	i5zpk8OIr8zt7P35Y/yy/wDfXplvyq0NFobknsV1tYG6Cz0U1ILGfvbzMx05BnqdMVmHXRKkqhn
	bthpf1xH1JpKI57fx1tJsBkN91IyWC+ZKVUuPWEjRXXZkvgcSrQ+oy6AnLxXxvOJHKcwacHucxB
	V56yUH/vmZoXf85x+gyECSn11UM8JcRMrpne4kv2C8a2E+L/Ksb7Kd5mOvMn1+3eXcw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1772731727; bh=9XaD5tYlo5c/PkvlJoEp5qp
	dJ+IVXcb+kkQadbkR0KE=; b=BioZy1C/t1vizXmqscTormcgC+D14JgApCGU6pOEIS4ei7HSY7
	o0YJ9mfR2abIJ6ikcIrwjU0UbhbDwMzfBbDA==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Date: Thu, 05 Mar 2026 18:28:33 +0100
Subject: [PATCH 1/5] arm64: dts: qcom: msm8917-xiaomi-riva: Commonize for
 Redmi 4A and GO
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260305-riva-common-v1-1-436f1f4b7399@mainlining.org>
References: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
In-Reply-To: <20260305-riva-common-v1-0-436f1f4b7399@mainlining.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, phone-devel@vger.kernel.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772731726; l=15618;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=3VpF+h/vRabFh0pawhkU/Ozvs+mTWi7ja9sIUaz4JBo=;
 b=yz7kiUy2kV1YOugg6bHBXwg/E+r0auvImPGTzrakEs2X1Z1pnXsqjZUHRzkScNXukqbZk9VE0
 sQtuV0jni9GCN3WQsB9jRny7lzqF7hxSnQhBfkLF428CP9+MdFBE0nb
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=
X-Rspamd-Queue-Id: 95DBA216595
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.33 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MIXED_CHARSET(0.83)[subject];
	DMARC_POLICY_ALLOW(-0.50)[mainlining.org,reject];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[mainlining.org:s=202507r,mainlining.org:s=202507e];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-95676-lists,linux-arm-msm=lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	RCPT_COUNT_TWELVE(0.00)[12];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[barnabas.czeman@mainlining.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[mainlining.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.38:email,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo,mainlining.org:dkim,mainlining.org:email,mainlining.org:mid,5.93.78.104:email]
X-Rspamd-Action: no action

Redmi 5A is very similar for Redmi 4A (rolex) and Redmi GO (tiare),
it can be commonized for avoid unnecessary code duplications.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
 .../boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi  | 317 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts   | 304 +-------------------
 2 files changed, 320 insertions(+), 301 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
new file mode 100644
index 000000000000..f0a534106e11
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva-common.dtsi
@@ -0,0 +1,317 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023, Barnabas Czeman
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "msm8917.dtsi"
+#include "pm8937.dtsi"
+
+/delete-node/ &qseecom_mem;
+
+/ {
+	chassis-type = "handset";
+
+	qcom,msm-id = <QCOM_ID_MSM8917 0>;
+
+	pwm_backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pm8937_pwm 0 100000>;
+		brightness-levels = <0 255>;
+		num-interpolated-steps = <255>;
+		default-brightness-level = <128>;
+	};
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		stdout-path = "framebuffer0";
+
+		framebuffer0: framebuffer@90001000 {
+			compatible = "simple-framebuffer";
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			width = <720>;
+			height = <1280>;
+			stride = <(720 * 3)>;
+			format = "r8g8b8";
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+			power-domains = <&gcc MDSS_GDSC>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_keys_default>;
+		pinctrl-names = "default";
+
+		key-volup {
+			label = "Volume Up";
+			linux,code = <KEY_VOLUMEUP>;
+			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
+			debounce-interval = <15>;
+		};
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
+	reserved-memory {
+		qseecom_mem: qseecom@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		framebuffer_mem: memory@90001000 {
+			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
+			no-map;
+		};
+	};
+};
+
+&blsp1_i2c3 {
+	status = "okay";
+
+	edt_ft5306: touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
+		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
+		pinctrl-0 = <&tsp_int_rst_default>;
+		pinctrl-names = "default";
+		vcc-supply = <&pm8937_l10>;
+		iovcc-supply = <&pm8937_l5>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+
+		status = "disabled";
+	};
+};
+
+&pm8937_gpios {
+	pwm_enable_default: pwm-enable-default-state {
+		pins = "gpio8";
+		function = "dtest2";
+		output-low;
+		bias-disable;
+		qcom,drive-strength = <2>;
+	};
+};
+
+&pm8937_pwm {
+	pinctrl-0 = <&pwm_enable_default>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&pm8937_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm8937-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+
+		vdd_l1_l19-supply = <&pm8937_s3>;
+		vdd_l2_l23-supply = <&pm8937_s3>;
+		vdd_l3-supply = <&pm8937_s3>;
+		vdd_l4_l5_l6_l7_l16-supply = <&pm8937_s4>;
+		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
+		vdd_l9_l10_l13_l14_l15_l18-supply = <&vph_pwr>;
+
+		pm8937_s1: s1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8937_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8937_s4: s4 {
+			regulator-min-microvolt = <2050000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8937_l2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8937_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l8: l8 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l10: l10 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8937_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+			regulator-system-load = <200000>;
+		};
+
+		pm8937_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8937_l13: l13 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3075000>;
+		};
+
+		pm8937_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8937_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8937_l17: l17 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2900000>;
+		};
+
+		pm8937_l19: l19 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8937_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8937_l23: l23 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8937_l8>;
+	vqmmc-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 67 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&pm8937_l11>;
+	vqmmc-supply = <&pm8937_l12>;
+	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&sleep_clk {
+	clock-frequency = <32768>;
+};
+
+&tlmm {
+	gpio_keys_default: gpio-keys-default-state {
+		pins = "gpio91";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	sdc2_cd_default: sdc2-cd-default-state {
+		pins = "gpio67";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	tsp_int_rst_default: tsp-int-rst-default-state {
+		pins = "gpio64", "gpio65";
+		function = "gpio";
+		drive-strength = <8>;
+		bias-pull-up;
+	};
+};
+
+&wcnss {
+	vddpx-supply = <&pm8937_l5>;
+
+	status = "okay";
+};
+
+&wcnss_iris {
+	compatible = "qcom,wcn3620";
+	vddxo-supply = <&pm8937_l7>;
+	vddrfa-supply = <&pm8937_l19>;
+	vddpa-supply = <&pm8937_l9>;
+	vdddig-supply = <&pm8937_l5>;
+};
+
+&wcnss_mem {
+	status = "okay";
+};
+
+&xo_board {
+	clock-frequency = <19200000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
index 9db503e21888..564ec94d7f97 100644
--- a/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
+++ b/arch/arm64/boot/dts/qcom/msm8917-xiaomi-riva.dts
@@ -1,33 +1,18 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2023, Barnabas Czeman
+ * Copyright (c) 2026, Barnabas Czeman
  */
 
 /dts-v1/;
 
-#include <dt-bindings/arm/qcom,ids.h>
-#include <dt-bindings/gpio/gpio.h>
-#include "msm8917.dtsi"
-#include "pm8937.dtsi"
-
-/delete-node/ &qseecom_mem;
+#include "msm8917-xiaomi-riva-common.dtsi"
 
 / {
 	model = "Xiaomi Redmi 5A (riva)";
 	compatible = "xiaomi,riva", "qcom,msm8917";
-	chassis-type = "handset";
 
-	qcom,msm-id = <QCOM_ID_MSM8917 0>;
 	qcom,board-id = <0x1000b 2>, <0x2000b 2>;
 
-	pwm_backlight: backlight {
-		compatible = "pwm-backlight";
-		pwms = <&pm8937_pwm 0 100000>;
-		brightness-levels = <0 255>;
-		num-interpolated-steps = <255>;
-		default-brightness-level = <128>;
-	};
-
 	battery: battery {
 		compatible = "simple-battery";
 		charge-full-design-microamp-hours = <3000000>;
@@ -38,84 +23,6 @@ battery: battery {
 		charge-term-current-microamp = <60000>;
 		voltage-min-design-microvolt = <3400000>;
 	};
-
-	chosen {
-		#address-cells = <2>;
-		#size-cells = <2>;
-		ranges;
-
-		stdout-path = "framebuffer0";
-
-		framebuffer0: framebuffer@90001000 {
-			compatible = "simple-framebuffer";
-			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
-			width = <720>;
-			height = <1280>;
-			stride = <(720 * 3)>;
-			format = "r8g8b8";
-
-			clocks = <&gcc GCC_MDSS_AHB_CLK>,
-				 <&gcc GCC_MDSS_AXI_CLK>,
-				 <&gcc GCC_MDSS_VSYNC_CLK>,
-				 <&gcc GCC_MDSS_MDP_CLK>,
-				 <&gcc GCC_MDSS_BYTE0_CLK>,
-				 <&gcc GCC_MDSS_PCLK0_CLK>,
-				 <&gcc GCC_MDSS_ESC0_CLK>;
-			power-domains = <&gcc MDSS_GDSC>;
-		};
-	};
-
-	gpio-keys {
-		compatible = "gpio-keys";
-
-		pinctrl-0 = <&gpio_keys_default>;
-		pinctrl-names = "default";
-
-		key-volup {
-			label = "Volume Up";
-			linux,code = <KEY_VOLUMEUP>;
-			gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
-			debounce-interval = <15>;
-		};
-	};
-
-	vph_pwr: regulator-vph-pwr {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-min-microvolt = <3700000>;
-		regulator-max-microvolt = <3700000>;
-		regulator-always-on;
-		regulator-boot-on;
-	};
-
-	reserved-memory {
-		qseecom_mem: qseecom@84a00000 {
-			reg = <0x0 0x84a00000 0x0 0x1900000>;
-			no-map;
-		};
-
-		framebuffer_mem: memory@90001000 {
-			reg = <0x0 0x90001000 0x0 (720 * 1280 * 3)>;
-			no-map;
-		};
-	};
-};
-
-&blsp1_i2c3 {
-	status = "okay";
-
-	touchscreen@38 {
-		compatible = "edt,edt-ft5306";
-		reg = <0x38>;
-		interrupts-extended = <&tlmm 65 IRQ_TYPE_LEVEL_LOW>;
-		reset-gpios = <&tlmm 64 GPIO_ACTIVE_LOW>;
-		pinctrl-0 = <&tsp_int_rst_default>;
-		pinctrl-names = "default";
-		vcc-supply = <&pm8937_l10>;
-		iovcc-supply = <&pm8937_l5>;
-		touchscreen-size-x = <720>;
-		touchscreen-size-y = <1280>;
-	};
 };
 
 &blsp2_i2c1 {
@@ -139,172 +46,10 @@ bq25601@6b {
 	};
 };
 
-&pm8937_gpios {
-	pwm_enable_default: pwm-enable-default-state {
-		pins = "gpio8";
-		function = "dtest2";
-		output-low;
-		bias-disable;
-		qcom,drive-strength = <2>;
-	};
-};
-
-&pm8937_pwm {
-	pinctrl-0 = <&pwm_enable_default>;
-	pinctrl-names = "default";
-
-	status = "okay";
-};
-
-&pm8937_resin {
-	linux,code = <KEY_VOLUMEDOWN>;
-
-	status = "okay";
-};
-
-&rpm_requests {
-	regulators-0 {
-		compatible = "qcom,rpm-pm8937-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_s2-supply = <&vph_pwr>;
-		vdd_s3-supply = <&vph_pwr>;
-		vdd_s4-supply = <&vph_pwr>;
-
-		vdd_l1_l19-supply = <&pm8937_s3>;
-		vdd_l2_l23-supply = <&pm8937_s3>;
-		vdd_l3-supply = <&pm8937_s3>;
-		vdd_l4_l5_l6_l7_l16-supply = <&pm8937_s4>;
-		vdd_l8_l11_l12_l17_l22-supply = <&vph_pwr>;
-		vdd_l9_l10_l13_l14_l15_l18-supply = <&vph_pwr>;
-
-		pm8937_s1: s1 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1225000>;
-		};
-
-		pm8937_s3: s3 {
-			regulator-min-microvolt = <1300000>;
-			regulator-max-microvolt = <1300000>;
-		};
-
-		pm8937_s4: s4 {
-			regulator-min-microvolt = <2050000>;
-			regulator-max-microvolt = <2050000>;
-		};
-
-		pm8937_l2: l2 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-
-		pm8937_l5: l5 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8937_l6: l6 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8937_l7: l7 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8937_l8: l8 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2900000>;
-		};
-
-		pm8937_l9: l9 {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		pm8937_l10: l10 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3000000>;
-		};
-
-		pm8937_l11: l11 {
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-allow-set-load;
-			regulator-system-load = <200000>;
-		};
-
-		pm8937_l12: l12 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-		};
-
-		pm8937_l13: l13 {
-			regulator-min-microvolt = <3075000>;
-			regulator-max-microvolt = <3075000>;
-		};
-
-		pm8937_l14: l14 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		pm8937_l15: l15 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		pm8937_l16: l16 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8937_l17: l17 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2900000>;
-		};
-
-		pm8937_l19: l19 {
-			regulator-min-microvolt = <1225000>;
-			regulator-max-microvolt = <1350000>;
-		};
-
-		pm8937_l22: l22 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-		};
-
-		pm8937_l23: l23 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-	};
-
-};
-
-&sdhc_1 {
-	vmmc-supply = <&pm8937_l8>;
-	vqmmc-supply = <&pm8937_l5>;
-
+&edt_ft5306 {
 	status = "okay";
 };
 
-&sdhc_2 {
-	cd-gpios = <&tlmm 67 GPIO_ACTIVE_LOW>;
-	vmmc-supply = <&pm8937_l11>;
-	vqmmc-supply = <&pm8937_l12>;
-	pinctrl-0 = <&sdc2_default &sdc2_cd_default>;
-	pinctrl-1 = <&sdc2_sleep &sdc2_cd_default>;
-	pinctrl-names = "default", "sleep";
-
-	status = "okay";
-};
-
-&sleep_clk {
-	clock-frequency = <32768>;
-};
-
 &tlmm {
 	bq25601_int_default: bq25601-int-default-state {
 		pins = "gpio61";
@@ -312,47 +57,4 @@ bq25601_int_default: bq25601-int-default-state {
 		drive-strength = <2>;
 		bias-pull-up;
 	};
-
-	gpio_keys_default: gpio-keys-default-state {
-		pins = "gpio91";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-
-	sdc2_cd_default: sdc2-cd-default-state {
-		pins = "gpio67";
-		function = "gpio";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	tsp_int_rst_default: tsp-int-rst-default-state {
-		pins = "gpio64", "gpio65";
-		function = "gpio";
-		drive-strength = <8>;
-		bias-pull-up;
-	};
-};
-
-&wcnss {
-	vddpx-supply = <&pm8937_l5>;
-
-	status = "okay";
-};
-
-&wcnss_iris {
-	compatible = "qcom,wcn3620";
-	vddxo-supply = <&pm8937_l7>;
-	vddrfa-supply = <&pm8937_l19>;
-	vddpa-supply = <&pm8937_l9>;
-	vdddig-supply = <&pm8937_l5>;
-};
-
-&wcnss_mem {
-	status = "okay";
-};
-
-&xo_board {
-	clock-frequency = <19200000>;
 };

-- 
2.53.0


