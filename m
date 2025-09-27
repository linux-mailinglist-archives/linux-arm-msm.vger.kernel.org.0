Return-Path: <linux-arm-msm+bounces-75387-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBED2BA5F9F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 15:22:47 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 2206117B9EE
	for <lists+linux-arm-msm@lfdr.de>; Sat, 27 Sep 2025 13:22:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D1C82D73A2;
	Sat, 27 Sep 2025 13:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b="tNtbAUJW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-244108.protonmail.ch (mail-244108.protonmail.ch [109.224.244.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0A7D2E1C56
	for <linux-arm-msm@vger.kernel.org>; Sat, 27 Sep 2025 13:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758979355; cv=none; b=CXOINF1iob/cZHDT8frX7XSVlPFv9tn+wTp/ACrcE+xsifm4hbuJjxmTNvapfNBujq+MIcwBdHl86eCQJhxSsXnYfsK7zCyktnly1hkzjuPDF22Z9gQYbtZnHM5+SE6ZjavAAgQBV/hjRd4ack+ewbNri7OUQ53YAbSLg3EccnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758979355; c=relaxed/simple;
	bh=YtGcufu/ITc44g855sUwISKS2Dx6Je6CP4Z31fjMYHA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=etwAeL3/iyZYbHci7kDac6/t9Gyk/nRcBxLBlrs93sXgSjd/rq2akIH1YYHJlJBHpuu/Y+2X3UCP19aTe+t6mKcPoT7iII2xbWMQb/rmJzOzaeZOWOhLjdG4fSkPEKP9jrCK4hyL7LXXeFoc1/fbXzcx65iL+4EbHlsvJmj+n3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com; spf=pass smtp.mailfrom=vinarskis.com; dkim=pass (2048-bit key) header.d=vinarskis.com header.i=@vinarskis.com header.b=tNtbAUJW; arc=none smtp.client-ip=109.224.244.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vinarskis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vinarskis.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vinarskis.com;
	s=protonmail; t=1758979343; x=1759238543;
	bh=zk34UKVdJ86AcX5Z6j/3OLm/UxEes6A718y1QSMiRl4=;
	h=From:Date:Subject:Message-Id:References:In-Reply-To:To:Cc:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=tNtbAUJWzss+eXlPkxXV6drGxo15qykJt+QNGv0Sldet7p1R1kiQb8wYG3MwXo5LU
	 wG0maHpXKIFAz+Pz0tc1CCtA4VEueGHHz93GlW+sdE1XT1Sh5yL677ioujIPwncm+g
	 4ucitL5i+lgPZeCdk6lJvXCMHFvfMX4wVrO0wuqS/GChkRZlvIAfrVHrxvkWZZ5Gp6
	 APPRc1fEMlGiscXVUNSbgH2lrDXiD7MPsjTTeAmcXyRCCnbUmk6fZlq7KeyrbZVXMz
	 jRiCdI3kAvHENW8KFX9zTGHsmnJ8aUugkyuIelksG7LTlixslacFXHD666h2gDv0tZ
	 xuWKal2rtG4Bw==
X-Pm-Submission-Id: 4cYp5n0WL8z1DF4J
From: Aleksandrs Vinarskis <alex@vinarskis.com>
Date: Sat, 27 Sep 2025 15:21:36 +0200
Subject: [PATCH v3 2/3] arm64: dts: qcom: Rework X1-based Asus Zenbook
 A14's displays
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250927-zenbook-improvements-v3-2-d46c7368dc70@vinarskis.com>
References: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
In-Reply-To: <20250927-zenbook-improvements-v3-0-d46c7368dc70@vinarskis.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=13805; i=alex@vinarskis.com;
 h=from:subject:message-id; bh=YtGcufu/ITc44g855sUwISKS2Dx6Je6CP4Z31fjMYHA=;
 b=owGbwMvMwCX2dl3hIv4AZgHG02pJDBnXn7If2TDt+7sY9S3RXTu+7BHn+/zF4/Vm20bzGV+MZ
 Qz4v7RYdJSyMIhxMciKKbJ0//ma1rVo7lqG6xrfYOawMoEMYeDiFICJuP9hZNgS+bcyfYnCR529
 xg/mz5hoecvk/IGPh5zmvFH3lzpcWXGd4a/kqk2s6o8cF50WXPpjQaz5XFHNxi3CHcbX0u/U3/2
 3yIATAA==
X-Developer-Key: i=alex@vinarskis.com; a=openpgp;
 fpr=8E21FAE2D2967BB123303E8C684FD4BA28133815

The laptop comes in two variants:

* UX3407RA, higher end, FHD+ OLED or WOXGA+ OLED panels
* UX3407QA, lower end, FHD+ OLED or FHD+ LCD panels

Even though all three panels work with "edp-panel", unfortunately the
brightness adjustmenet of LCD panel is PWM based, requiring a dedicated
device-tree. Convert "x1p42100-asus-zenbook-a14.dts" into ".dtsi" to
allow for this split, introduce new LCD variant. Leave current variant
without postfix and with the unchanged model name, as some distros
(eg. Ubuntu) rely on this for automatic device-tree detection during
kernel installation/upgrade.

As dedicated device-tree is required, update compatibles of OLED
variants to correct ones. Keep "edp-panel" as fallback, since it is
enough to make the panels work.

While at it moving .dts, .dtsi around, drop 'model' from the top level
x1-asus-zenbook-a14.dtsi as well.

Co-developed-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Aleksandrs Vinarskis <alex@vinarskis.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   2 +
 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi  |   7 +-
 .../boot/dts/qcom/x1e80100-asus-zenbook-a14.dts    |   8 ++
 .../dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts     |  62 +++++++++
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dts    | 133 ++------------------
 .../boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi   | 138 +++++++++++++++++++++
 6 files changed, 218 insertions(+), 132 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26550f75bce65826f234bc24110356..dffdb219f33dcd921abf8cbfdeb9d4456d7cb8d1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -344,6 +344,8 @@ x1e80100-qcp-el2-dtbs	:= x1e80100-qcp.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-qcp.dtb x1e80100-qcp-el2.dtb
 x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
+x1p42100-asus-zenbook-a14-lcd-el2-dtbs	:= x1p42100-asus-zenbook-a14-lcd.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14-lcd.dtb x1p42100-asus-zenbook-a14-lcd-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
 x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
diff --git a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
index ee3c8c5e2c50c405937730c2f7feec43f809af6b..6e4d5f8c8136057abbecbf7e252969e603349aec 100644
--- a/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
@@ -14,7 +14,6 @@
 #include "x1e80100-pmics.dtsi"
 
 / {
-	model = "ASUS Zenbook A14";
 	chassis-type = "laptop";
 
 	aliases {
@@ -1005,14 +1004,10 @@ &mdss_dp3 {
 	status = "okay";
 
 	aux-bus {
-		panel {
+		panel: panel {
 			compatible = "edp-panel";
-			enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 			power-supply = <&vreg_edp_3p3>;
 
-			pinctrl-0 = <&edp_bl_en>;
-			pinctrl-names = "default";
-
 			port {
 				edp_panel_in: endpoint {
 					remote-endpoint = <&mdss_dp3_out>;
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
index 0d0bcc50207d7540285d82304dbc99e82858f6f0..f8f541153165c7c28351ef97172bdb698074a5c3 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
+++ b/arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
@@ -22,6 +22,14 @@ &gpu_zap_shader {
 	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcdxkmsuc8380.mbn";
 };
 
+&panel {
+	compatible = "samsung,atna40cu11", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/x1e80100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
 			"qcom/x1e80100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts
new file mode 100644
index 0000000000000000000000000000000000000000..be756069131d7f3580d0e2058c3d9538a3170fb1
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14-lcd.dts
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Aleksandrs Vinarskis <alex@vinarskis.com>
+ */
+
+/dts-v1/;
+
+#include "x1p42100-asus-zenbook-a14.dtsi"
+
+/ {
+	model = "ASUS Zenbook A14 (UX3407QA, LCD)";
+	compatible = "asus,zenbook-a14-ux3407qa-lcd", "asus,zenbook-a14-ux3407qa", "qcom,x1p42100";
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		pwms = <&pmk8550_pwm 0 416667>;
+		enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
+		power-supply = <&vreg_edp_bl>;
+
+		pinctrl-0 = <&edp_bl_en>, <&edp_bl_pwm>;
+		pinctrl-names = "default";
+	};
+
+	vreg_edp_bl: regulator-edp-bl {
+		compatible = "regulator-fixed";
+
+		regulator-name = "VBL9";
+		regulator-min-microvolt = <3600000>;
+		regulator-max-microvolt = <3600000>;
+
+		gpio = <&pmc8380_3_gpios 10 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		pinctrl-0 = <&edp_bl_reg_en>;
+		pinctrl-names = "default";
+
+		regulator-boot-on;
+	};
+};
+
+&panel {
+	backlight = <&backlight>;
+};
+
+&pmc8380_3_gpios {
+	edp_bl_reg_en: edp-bl-reg-en-state {
+		pins = "gpio10";
+		function = "normal";
+	};
+};
+
+&pmk8550_gpios {
+	edp_bl_pwm: edp-bl-pwm-state {
+		pins = "gpio5";
+		function = "func3";
+	};
+};
+
+&pmk8550_pwm {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
index bd75ff898601a0e1d79a5c3986c946046eecf789..68cd318d69073af70e596f935d60d76859dec2c4 100644
--- a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
@@ -6,136 +6,17 @@
 
 /dts-v1/;
 
-#include "x1p42100.dtsi"
-#include "x1-asus-zenbook-a14.dtsi"
-
-/delete-node/ &pmc8380_6;
-/delete-node/ &pmc8380_6_thermal;
+#include "x1p42100-asus-zenbook-a14.dtsi"
 
 / {
 	model = "ASUS Zenbook A14 (UX3407QA)";
-	compatible = "asus,zenbook-a14-ux3407qa", "qcom,x1p42100";
-
-	wcn6855-pmu {
-		compatible = "qcom,wcn6855-pmu";
-
-		vddaon-supply = <&vreg_wcn_0p95>;
-		vddio-supply = <&vreg_wcn_1p9>;
-		vddpcie1p3-supply = <&vreg_wcn_1p9>;
-		vddpcie1p9-supply = <&vreg_wcn_1p9>;
-		vddpmu-supply = <&vreg_wcn_0p95>;
-		vddpmucx-supply = <&vreg_wcn_0p95>;
-		vddpmumx-supply = <&vreg_wcn_0p95>;
-		vddrfa0p95-supply = <&vreg_wcn_0p95>;
-		vddrfa1p3-supply = <&vreg_wcn_1p9>;
-		vddrfa1p9-supply = <&vreg_wcn_1p9>;
-
-		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
-		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
-
-		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
-		pinctrl-names = "default";
-
-		regulators {
-			vreg_pmu_rfa_cmn_0p8: ldo0 {
-				regulator-name = "vreg_pmu_rfa_cmn_0p8";
-			};
-
-			vreg_pmu_aon_0p8: ldo1 {
-				regulator-name = "vreg_pmu_aon_0p8";
-			};
-
-			vreg_pmu_wlcx_0p8: ldo2 {
-				regulator-name = "vreg_pmu_wlcx_0p8";
-			};
-
-			vreg_pmu_wlmx_0p8: ldo3 {
-				regulator-name = "vreg_pmu_wlmx_0p8";
-			};
-
-			vreg_pmu_btcmx_0p8: ldo4 {
-				regulator-name = "vreg_pmu_btcmx_0p8";
-			};
-
-			vreg_pmu_pcie_1p8: ldo5 {
-				regulator-name = "vreg_pmu_pcie_1p8";
-			};
-
-			vreg_pmu_pcie_0p9: ldo6 {
-				regulator-name = "vreg_pmu_pcie_0p9";
-			};
-
-			vreg_pmu_rfa_0p8: ldo7 {
-				regulator-name = "vreg_pmu_rfa_0p8";
-			};
-
-			vreg_pmu_rfa_1p2: ldo8 {
-				regulator-name = "vreg_pmu_rfa_1p2";
-			};
-
-			vreg_pmu_rfa_1p7: ldo9 {
-				regulator-name = "vreg_pmu_rfa_1p7";
-			};
-		};
-	};
+	compatible = "asus,zenbook-a14-ux3407qa-oled", "asus,zenbook-a14-ux3407qa", "qcom,x1p42100";
 };
 
-&gpu {
-	status = "okay";
-};
-
-&gpu_zap_shader {
-	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsucpurwa.mbn";
-};
-
-&pcie4_port0 {
-	wifi@0 {
-		compatible = "pci17cb,1103";
-		reg = <0x10000 0x0 0x0 0x0 0x0>;
-
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
-		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
-		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
-
-		qcom,calibration-variant = "UX3407Q";
-	};
-};
-
-&remoteproc_adsp {
-	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
-			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&remoteproc_cdsp {
-	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
-			"qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
-
-	status = "okay";
-};
-
-&uart14 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn6855-bt";
-
-		vddaon-supply = <&vreg_pmu_aon_0p8>;
-		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
-		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
-		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
-		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
-		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
-		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
-		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+&panel {
+	compatible = "samsung,atna40ct06", "samsung,atna33xc20";
+	enable-gpios = <&pmc8380_3_gpios 4 GPIO_ACTIVE_HIGH>;
 
-		max-speed = <3000000>;
-	};
+	pinctrl-0 = <&edp_bl_en>;
+	pinctrl-names = "default";
 };
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..7ccb2076bab66c64e693e6a1ce570d025fe649f7
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtsi
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2025 Aleksandrs Vinarskis <alex@vinarskis.com>
+ */
+
+/dts-v1/;
+
+#include "x1p42100.dtsi"
+#include "x1-asus-zenbook-a14.dtsi"
+
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	wcn6855-pmu {
+		compatible = "qcom,wcn6855-pmu";
+
+		vddaon-supply = <&vreg_wcn_0p95>;
+		vddio-supply = <&vreg_wcn_1p9>;
+		vddpcie1p3-supply = <&vreg_wcn_1p9>;
+		vddpcie1p9-supply = <&vreg_wcn_1p9>;
+		vddpmu-supply = <&vreg_wcn_0p95>;
+		vddpmucx-supply = <&vreg_wcn_0p95>;
+		vddpmumx-supply = <&vreg_wcn_0p95>;
+		vddrfa0p95-supply = <&vreg_wcn_0p95>;
+		vddrfa1p3-supply = <&vreg_wcn_1p9>;
+		vddrfa1p9-supply = <&vreg_wcn_1p9>;
+
+		bt-enable-gpios = <&tlmm 116 GPIO_ACTIVE_HIGH>;
+		wlan-enable-gpios = <&tlmm 117 GPIO_ACTIVE_HIGH>;
+
+		pinctrl-0 = <&wcn_bt_en>, <&wcn_wlan_en>;
+		pinctrl-names = "default";
+
+		regulators {
+			vreg_pmu_rfa_cmn_0p8: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn_0p8";
+			};
+
+			vreg_pmu_aon_0p8: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p8";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p8: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p8";
+			};
+
+			vreg_pmu_btcmx_0p8: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p8";
+			};
+
+			vreg_pmu_pcie_1p8: ldo5 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+
+			vreg_pmu_pcie_0p9: ldo6 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_rfa_0p8: ldo7 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo8 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo9 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+		};
+	};
+};
+
+&gpu {
+	status = "okay";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcdxkmsucpurwa.mbn";
+};
+
+&pcie4_port0 {
+	wifi@0 {
+		compatible = "pci17cb,1103";
+		reg = <0x10000 0x0 0x0 0x0 0x0>;
+
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddpcie0p9-supply = <&vreg_pmu_pcie_0p9>;
+		vddpcie1p8-supply = <&vreg_pmu_pcie_1p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+
+		qcom,calibration-variant = "UX3407Q";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qcadsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/zenbook-a14/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/ASUSTeK/zenbook-a14/qccdsp8380.mbn",
+			"qcom/x1p42100/ASUSTeK/zenbook-a14/cdsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&uart14 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn6855-bt";
+
+		vddaon-supply = <&vreg_pmu_aon_0p8>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p8>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		vddrfa1p8-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn_0p8>;
+		vddwlcx-supply = <&vreg_pmu_wlcx_0p8>;
+		vddwlmx-supply = <&vreg_pmu_wlmx_0p8>;
+
+		max-speed = <3000000>;
+	};
+};

-- 
2.51.0


