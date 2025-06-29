Return-Path: <linux-arm-msm+bounces-62924-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 1398BAECB40
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 06:45:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 52377174D79
	for <lists+linux-arm-msm@lfdr.de>; Sun, 29 Jun 2025 04:45:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3FE1A1CBEB9;
	Sun, 29 Jun 2025 04:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MnjC1mHO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08BFA29B0;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751172311; cv=none; b=jPKLdTd33ipBo6x2JV6k4Yqv57u2M/ilI1foXW/vVbrgg5hKC+KsrhQwDkbbytswz8N2sSRIVqSLNaQSKXdBpU2/vrAhHtLKrerp2NWHzdUKs0o+PEEAr/hKN1Zec1kNJh4q4t0dLYpFv3Khowy9x6uQGqJ4QHTqHeSMWZIhS/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751172311; c=relaxed/simple;
	bh=z9NgzLPdkixra/QUJxb+x6d8KoigZnVyhXR1Dq4delE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dql7i6H2TdIqC3QjgMekk3ZxCTDX3+RFFi8mnHfXczUMnc5F+UrzRUy6Kt0Ema3CaPvthEetMVKimb4S2SbF4/N98NRoZcdKJ934nh8mr3znyQQDsijru3KE5CEDE2JCBfBV0sJzSdQgssQLaUsYsaefkPm4emuGw0iV01A9f88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MnjC1mHO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96982C4CEF2;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751172310;
	bh=z9NgzLPdkixra/QUJxb+x6d8KoigZnVyhXR1Dq4delE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MnjC1mHON2KyGqNEvl+u72qTl6QXYqiMBrdnJUkNXXSYKklUETtx91muVvZPyGgDz
	 pA1iZE2CMEr7WefaYAgXEiruWGIGqsnXytw80vd7TE3VN8JtyrdKSJ0+MK+kTwmirn
	 /PRhxZ8Lwg/EcBPN/Xc661qIDmRy4eq6anThvGv3+yaNfPipmljQYd4d3daNM38/5I
	 xZOaGnClIVe9b/lUVWU+si1r8W39xNC9eT12x1G1SCqXG3K7NjQYocF723QcE34RW7
	 V5BPXmW9RzdRbqudR3yOSbCC9WMrp9IwoAcjg7pCZdIue1eRhioGN4uIWc1xh3cITQ
	 mnQ4m2l0LTymw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81725C83029;
	Sun, 29 Jun 2025 04:45:10 +0000 (UTC)
From: Cristian Cozzolino via B4 Relay <devnull+cristian_ci.protonmail.com@kernel.org>
Date: Sun, 29 Jun 2025 08:44:39 +0200
Subject: [PATCH v4 3/3] arm64: dts: qcom: msm8953: Add device tree for
 Billion Capture+
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250629-rimob-initial-devicetree-v4-3-7cf84fa142af@protonmail.com>
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 phone-devel@vger.kernel.org, 
 Cristian Cozzolino <cristian_ci@protonmail.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751179514; l=7327;
 i=cristian_ci@protonmail.com; s=20250620; h=from:subject:message-id;
 bh=qtnuNmfCBsjsZNE4PsKOQQMDD+xe/GZt7WSU7ruu8fI=;
 b=5yA7+++w5RU7ETfbg5nyySeTxnfeyV6K5ERETK1ZhYYjI06Gm3K2uY/tQ+aFD/j+PlXzkvwlP
 mTdz4YFCWa+Cs2FXq36vsJQ8vtmh1TBOqBNOsMdnvG8rH3MlVsQ1jRv
X-Developer-Key: i=cristian_ci@protonmail.com; a=ed25519;
 pk=xH5IvIPUNHV1Q8R0/pq2CfuVFR/wTiAyuyi6IwedjZY=
X-Endpoint-Received: by B4 Relay for cristian_ci@protonmail.com/20250620
 with auth_id=438
X-Original-From: Cristian Cozzolino <cristian_ci@protonmail.com>
Reply-To: cristian_ci@protonmail.com

From: Cristian Cozzolino <cristian_ci@protonmail.com>

Billion Capture+ (flipkart,rimob) is a smartphone released in 2017, based
on Snapdragon 625 (MSM8953) SoC.

Add a device tree with initial support for:

- GPIO keys
- SDHCI (internal and external storage)
- USB Device Mode
- Regulators
- Simple framebuffer

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
 2 files changed, 256 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb555b8ef61bd9ed0217d8997800809..af3757ca017b6e3d8c579e43f647a71fc64c62b3 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -70,6 +70,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-samsung-a7.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-sony-xperia-kanuti-tulip.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8939-wingtech-wt82918hd.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-flipkart-rimob.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-motorola-potter.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-daisy.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8953-xiaomi-mido.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
new file mode 100644
index 0000000000000000000000000000000000000000..ef4faf7631327ba3f7d954cef57bb1ebfc09a1cc
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts
@@ -0,0 +1,255 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Cristian Cozzolino
+ */
+/dts-v1/;
+
+#include "msm8953.dtsi"
+#include "pm8953.dtsi"
+#include "pmi8950.dtsi"
+
+/delete-node/ &cont_splash_mem;
+/delete-node/ &qseecom_mem;
+
+/ {
+	model = "Billion Capture+";
+	compatible = "flipkart,rimob", "qcom,msm8953";
+	chassis-type = "handset";
+	qcom,msm-id = <293 0>;
+	qcom,board-id = <0x340008 0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer@90001000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x90001000 0 (1920 * 1080 * 3)>;
+
+			width = <1080>;
+			height = <1920>;
+			stride = <(1080 * 3)>;
+			format = "r8g8b8";
+
+			power-domains = <&gcc MDSS_GDSC>;
+
+			clocks = <&gcc GCC_MDSS_AHB_CLK>,
+				 <&gcc GCC_MDSS_AXI_CLK>,
+				 <&gcc GCC_MDSS_VSYNC_CLK>,
+				 <&gcc GCC_MDSS_MDP_CLK>,
+				 <&gcc GCC_MDSS_BYTE0_CLK>,
+				 <&gcc GCC_MDSS_PCLK0_CLK>,
+				 <&gcc GCC_MDSS_ESC0_CLK>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&gpio_key_default>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&tlmm 85 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+		};
+	};
+
+	reserved-memory {
+		qseecom_mem: qseecom@84a00000 {
+			reg = <0x0 0x84a00000 0x0 0x1900000>;
+			no-map;
+		};
+
+		cont_splash_mem: cont-splash@90001000 {
+			reg = <0x0 0x90001000 0x0 (1080 * 1920 * 3)>;
+			no-map;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+
+&hsusb_phy {
+	vdd-supply = <&pm8953_l3>;
+	vdda-pll-supply = <&pm8953_l7>;
+	vdda-phy-dpdm-supply = <&pm8953_l13>;
+
+	status = "okay";
+};
+
+&pm8953_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators {
+		compatible = "qcom,rpm-pm8953-regulators";
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_l1-supply = <&pm8953_s3>;
+		vdd_l2_l3-supply = <&pm8953_s3>;
+		vdd_l4_l5_l6_l7_l16_l19-supply = <&pm8953_s4>;
+		vdd_l8_l11_l12_l13_l14_l15-supply = <&vph_pwr>;
+		vdd_l9_l10_l17_l18_l22-supply = <&vph_pwr>;
+		vdd_l23-supply = <&pm8953_s3>;
+
+		pm8953_s1: s1 {
+			regulator-min-microvolt = <870000>;
+			regulator-max-microvolt = <1156000>;
+		};
+
+		pm8953_s3: s3 {
+			regulator-min-microvolt = <1224000>;
+			regulator-max-microvolt = <1224000>;
+		};
+
+		pm8953_s4: s4 {
+			regulator-min-microvolt = <1900000>;
+			regulator-max-microvolt = <2050000>;
+		};
+
+		pm8953_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8953_l2: l2 {
+			regulator-min-microvolt = <975000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		pm8953_l3: l3 {
+			regulator-min-microvolt = <925000>;
+			regulator-max-microvolt = <925000>;
+		};
+
+		pm8953_l5: l5 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+
+		pm8953_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l7: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1900000>;
+		};
+
+		pm8953_l8: l8 {
+			regulator-min-microvolt = <2900000>;
+			regulator-max-microvolt = <2900000>;
+			regulator-allow-set-load;
+		};
+
+		pm8953_l9: l9 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3300000>;
+		};
+
+		pm8953_l10: l10 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l11: l11 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8953_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		pm8953_l13: l13 {
+			regulator-min-microvolt = <3125000>;
+			regulator-max-microvolt = <3125000>;
+		};
+
+		pm8953_l16: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8953_l17: l17 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8953_l19: l19 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1350000>;
+		};
+
+		pm8953_l22: l22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8953_l23: l23 {
+			regulator-min-microvolt = <975000>;
+			regulator-max-microvolt = <1225000>;
+		};
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&pm8953_l8>;
+	vqmmc-supply = <&pm8953_l5>;
+
+	status = "okay";
+};
+
+&sdhc_2 {
+	vmmc-supply = <&pm8953_l11>;
+	vqmmc-supply = <&pm8953_l12>;
+
+	cd-gpios = <&tlmm 133 GPIO_ACTIVE_HIGH>;
+
+	pinctrl-0 = <&sdc2_clk_on &sdc2_cmd_on &sdc2_data_on &sdc2_cd_on>;
+	pinctrl-1 = <&sdc2_clk_off &sdc2_cmd_off &sdc2_data_off>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <135 4>;
+
+	gpio_key_default: gpio-key-default-state {
+		pins = "gpio85";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "peripheral";
+};

-- 
2.49.0



