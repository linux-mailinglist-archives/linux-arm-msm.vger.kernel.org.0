Return-Path: <linux-arm-msm+bounces-50897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B29BA5B3EE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 01:35:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B8B461890DE9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 00:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857121E87B;
	Tue, 11 Mar 2025 00:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b="cs/A6iuZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25D3118E2A;
	Tue, 11 Mar 2025 00:34:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741653290; cv=none; b=uBIX2af0V0bLbhg+DZhNHPTBtH4+zW61YCBUoNP9aemsSXp9lnii2dX15KdQcmQqmJHzEnahgukfEiTY7l6OwFFy0PwyW+6z0OuOJsNFJsHcii/bwBhdU22BpbtvNSnnFBxUf2C+KTgzJO3WcbrU46nplPDdw+3qeIipUrKyCDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741653290; c=relaxed/simple;
	bh=8Jmh3g2bmFd5Vp8KXq7XkPMX5pLRKW6JPOmo3V4xUvY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=u4/Hcop1Gn1fbZdldNKMu+8Vt1TiIHG2ZzVs1Okl1E3fhq3YrphsNpyQFXnYBvM40vGm5nvdO9uFpWRkzYzQz0l2MKBdyqHPVuRVyX1dKSckolljNVrtfuVrPRTjriiXlapM6/fkJDuu/93Ewtw749SJ0nN20lJGfwVJbGhuvPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org; spf=pass smtp.mailfrom=disroot.org; dkim=pass (2048-bit key) header.d=disroot.org header.i=@disroot.org header.b=cs/A6iuZ; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=disroot.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=disroot.org
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8A2B720937;
	Tue, 11 Mar 2025 01:34:46 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gj0UgNCP7dwy; Tue, 11 Mar 2025 01:34:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1741653282; bh=8Jmh3g2bmFd5Vp8KXq7XkPMX5pLRKW6JPOmo3V4xUvY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=cs/A6iuZqqP+N1avsySSpeLEYsfWlac/mMjW4BUHvDIaSu+apJGOTE+Up7fNEL0zt
	 S5fUvuy/squ9iqCEcEZkKdbyz5SANllDc4nLSAgumaQwlHBwPWQvhicG/qvcazz7h9
	 giRQ5wmSiYJ3h6sMQQu1p5c7w1/yfEuhM+2h8uTvHVl00duneBCZ5IdiynzH4Xtxwv
	 ZxUFBvMOnpJYBcnhpiwZm+pFOhicYJGJDLlivobHJjPdjsxTUfqx+e3rc/niq+rgyr
	 C1AGGHXtg0p0IXH0rUw3bU5FcjtZcSFFeIWHoV6aGPNRJJ1IAPMyvnw0IE4UeIyUwF
	 p9rzkIy6r5LZg==
From: Gabriel Gonzales <semfault@disroot.org>
To: 
Cc: Gabriel Gonzales <semfault@disroot.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH v3 2/2] arm64: dts: qcom: sm6125: Initial support for xiaomi-ginkgo
Date: Tue, 11 Mar 2025 08:33:48 +0800
Message-ID: <20250311003353.8250-3-semfault@disroot.org>
In-Reply-To: <20250311003353.8250-1-semfault@disroot.org>
References: <20250308013019.10321-1-semfault@disroot.org>
 <20250311003353.8250-1-semfault@disroot.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support for the Xiaomi Redmi Note 8 based on the SM6125 SoC.

Defined features:
- dmesg output to bootloader preconfigured display
- USB
- eMMC
- SD card
- SMD RPM regulators
- Volume Up, Down and Power buttons

Signed-off-by: Gabriel Gonzales <semfault@disroot.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo.dts    | 295 ++++++++++++++++++
 2 files changed, 296 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2ab..4d7d54f69 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -246,6 +246,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6115p-lenovo-j606f.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-sony-xperia-seine-pdx201.dtb
+dtb-$(CONFIG_ARCH_QCOM) += sm6125-xiaomi-ginkgo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6125-xiaomi-laurel-sprout.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6350-sony-xperia-lena-pdx213.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm6375-sony-xperia-murray-pdx225.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
new file mode 100644
index 000000000..68a237215
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts
@@ -0,0 +1,295 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Gabriel Gonzales <semfault@disroot.org>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/arm/qcom,ids.h>
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include "sm6125.dtsi"
+#include "pm6125.dtsi"
+
+/ {
+	model = "Xiaomi Redmi Note 8";
+	compatible = "xiaomi,ginkgo", "qcom,sm6125";
+	chassis-type = "handset";
+
+	/* required for bootloader to select correct board */
+	qcom,msm-id = <QCOM_ID_SM6125>;
+	qcom,board-id = <22 0>;
+
+	chosen {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer0: framebuffer@5c000000 {
+			compatible = "simple-framebuffer";
+			reg = <0 0x5c000000 0 (2340 * 1080 * 4)>;
+			width = <1080>;
+			height = <2340>;
+			stride = <(1080 * 4)>;
+			format = "a8r8g8b8";
+		};
+	};
+
+	reserved-memory {
+		debug_mem: debug@ffb00000 {
+			reg = <0x0 0xffb00000 0x0 0xc0000>;
+			no-map;
+		};
+
+		last_log_mem: lastlog@ffbc0000 {
+			reg = <0x0 0xffbc0000 0x0 0x80000>;
+			no-map;
+		};
+
+		pstore_mem: ramoops@ffc00000 {
+			compatible = "ramoops";
+			reg = <0x0 0xffc40000 0x0 0xc0000>;
+			record-size = <0x1000>;
+			console-size = <0x40000>;
+			pmsg-size = <0x20000>;
+		};
+
+		cmdline_mem: memory@ffd00000 {
+			reg = <0x0 0xffd40000 0x0 0x1000>;
+			no-map;
+		};
+	};
+
+	extcon_usb: extcon-usb {
+		compatible = "linux,extcon-usb-gpio";
+		id-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&vol_up_n>;
+		pinctrl-names = "default";
+
+		key-volume-up {
+			label = "Volume Up";
+			gpios = <&pm6125_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			linux,can-disable;
+			wakeup-source;
+		};
+	};
+};
+
+&pm6125_gpios {
+	vol_up_n: vol-up-n-state {
+		pins = "gpio6";
+		function = "normal";
+		power-source = <1>;
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&hsusb_phy1 {
+	vdd-supply = <&vreg_l7a>;
+	vdda-pll-supply = <&vreg_l10a>;
+	vdda-phy-dpdm-supply = <&vreg_l15a>;
+	status = "okay";
+};
+
+&pon_pwrkey {
+	status = "okay";
+};
+
+&pon_resin {
+	linux,code = <KEY_VOLUMEDOWN>;
+	status = "okay";
+};
+
+&rpm_requests {
+	regulators-0 {
+		compatible = "qcom,rpm-pm6125-regulators";
+
+		vreg_s6a: s6 {
+			regulator-min-microvolt = <936000>;
+			regulator-max-microvolt = <1422000>;
+		};
+
+		vreg_l1a: l1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1256000>;
+		};
+
+		vreg_l2a: l2 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1056000>;
+		};
+
+		vreg_l3a: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1064000>;
+		};
+
+		vreg_l4a: l4 {
+			regulator-min-microvolt = <872000>;
+			regulator-max-microvolt = <976000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l5a: l5 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l6a: l6 {
+			regulator-min-microvolt = <576000>;
+			regulator-max-microvolt = <656000>;
+		};
+
+		vreg_l7a: l7 {
+			regulator-min-microvolt = <872000>;
+			regulator-max-microvolt = <976000>;
+		};
+
+		vreg_l8a: l8 {
+			regulator-min-microvolt = <400000>;
+			regulator-max-microvolt = <728000>;
+		};
+
+		vreg_l9a: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1896000>;
+		};
+
+		vreg_l10a: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1896000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l11a: l11 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1952000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l12a: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1996000>;
+		};
+
+		vreg_l13a: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1832000>;
+		};
+
+		vreg_l14a: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		vreg_l15a: l15 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3232000>;
+		};
+
+		vreg_l16a: l16 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1904000>;
+		};
+
+		vreg_l17a: l17 {
+			regulator-min-microvolt = <1248000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l18a: l18 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1264000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l19a: l19 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		vreg_l20a: l20 {
+			regulator-min-microvolt = <1648000>;
+			regulator-max-microvolt = <2952000>;
+		};
+
+		vreg_l21a: l21 {
+			regulator-min-microvolt = <2600000>;
+			regulator-max-microvolt = <2856000>;
+		};
+
+		vreg_l22a: l22 {
+			regulator-min-microvolt = <2944000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l23a: l23 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3400000>;
+		};
+
+		vreg_l24a: l24 {
+			regulator-min-microvolt = <2944000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-allow-set-load;
+		};
+
+	};
+};
+
+&sdc2_off_state {
+	sd-cd-pins {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&sdc2_on_state {
+	sd-cd-pins {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+};
+
+&sdhc_1 {
+	vmmc-supply = <&vreg_l24a>;
+	vqmmc-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&sdhc_2 {
+	cd-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+	vmmc-supply = <&vreg_l22a>;
+	vqmmc-supply = <&vreg_l5a>;
+	no-sdio;
+	no-mmc;
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <22 2>, <28 6>;
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	extcon = <&extcon_usb>;
+};
-- 
2.48.1


