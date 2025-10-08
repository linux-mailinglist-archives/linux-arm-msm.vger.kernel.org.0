Return-Path: <linux-arm-msm+bounces-76410-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E203BC518F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 08 Oct 2025 15:03:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 0C4AA4F9E9E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Oct 2025 13:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80E7D1FAC4B;
	Wed,  8 Oct 2025 13:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b="Kqg+XKCp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-o95.zoho.com (sender4-pp-o95.zoho.com [136.143.188.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C825421256C;
	Wed,  8 Oct 2025 13:01:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.95
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759928484; cv=pass; b=Z9fs2EJFPdcEgpZ/4tR2IZTR6pX3b6AuYxIHEYYHzk2BANHOW1ze/w/Ls+mfigTASamOmHiOFgBZnEpm4ZT44zRZIVA36XwJdiIbyoS1YfOAwmKeMGQRwWKsTW1hO8Qo5w6V9IeuClraaUL3KN1kPKZf8F2tO2i2L9VTr1+dbq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759928484; c=relaxed/simple;
	bh=AdqnScbGJUFs0TkoayKeSYrz/Cvwz2Lto5dWMTGPyt4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TmuJepkl+Lp1VzA6k3xecn7etCTovWjYyjPemM7ZX9Agjt/JNpZk3TPycTHiIlSyNLss7ubNYNMpGFi9HNNVuF9MNXyZ7Yk78EBkiGcvOz60zPnIhQeK1KSiHBFZNKhCBvsrBC2nSZYpZRuKKPlYU/bqZAzDge/lx3LL+1+UJD8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com; spf=pass smtp.mailfrom=zohomail.com; dkim=pass (1024-bit key) header.d=zohomail.com header.i=newwheatzjz@zohomail.com header.b=Kqg+XKCp; arc=pass smtp.client-ip=136.143.188.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=zohomail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zohomail.com
ARC-Seal: i=1; a=rsa-sha256; t=1759928468; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PmWa/TGNnL8AboNGFkXjjajh4xn+OTNT/jiB5hAj91HteDtvT9j2oWxNtuMOKzxtFCS79hiToZ7joaJr9/FQxfymXwTczKpBqyDa5JHF5a25zd1c5IVk9A9x2NRrURlamopFDe3HNIxuN4rEszUzjA6bLIH0yyA5fiXnpjI55WY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1759928468; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=iW/yoJqD2Lz0tQa1uzP51thx8uMAfjNwbQQ4oco3Z+c=; 
	b=edXwaFbR/YRstl5I5ROfP3/bi5u4BLSOLQx46Qfc6mZD5DhU5GhewFRX4KWxzXdVc0LYW0sDZJCCCB7PqUy7PW8YVmZfIU3n0sD1vVrQon4B2uQVImKX+/716TFODrNf7J2wITQ8zhtYT/B0O5uTAf8OOBQ8NsF62pfEi06z0b8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=newwheatzjz@zohomail.com;
	dmarc=pass header.from=<newwheatzjz@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1759928468;
	s=zm2022; d=zohomail.com; i=newwheatzjz@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Message-Id:Reply-To;
	bh=iW/yoJqD2Lz0tQa1uzP51thx8uMAfjNwbQQ4oco3Z+c=;
	b=Kqg+XKCpKYbslnr/fO9+lGUxaiPmTXYeR3BbxVeqnigC+8u21BLEq83S+Nk6zpiA
	58F7k7xGDO+geqznKXs4SwKyIkmI2yjDLqpTS87NmGlRj25vNw4/n1cqU+X6XH6/lUC
	puNBwHq4H/ao0JUcrT7SxPMeZUpNCmUg7G9zqNGU=
Received: by mx.zohomail.com with SMTPS id 1759928465443897.6334952462956;
	Wed, 8 Oct 2025 06:01:05 -0700 (PDT)
From: Jingzhou Zhu <newwheatzjz@zohomail.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jingzhou Zhu <newwheatzjz@zohomail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 2/2] arm64: dts: qcom: Add support for Huawei MateBook E 2019
Date: Wed,  8 Oct 2025 21:00:52 +0800
Message-ID: <20251008130052.11427-3-newwheatzjz@zohomail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251008130052.11427-1-newwheatzjz@zohomail.com>
References: <20251008130052.11427-1-newwheatzjz@zohomail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Feedback-ID: rr08011227f468fa59e43f4f7d8ddc0a450000c8b6b38caf80b61158c3a056c29317a8f0fc32985cedb00cc7:zu08011227a945c8bdd6d0fb1862546f700000ddd73bdb13e4c417b9c7919144765a0c322e068f1447b22e38:rf08011226bf0ecf9a164e6507f579c7060000e68dfc175631193cddd442346ece65b0d07ede2fc7425123:ZohoMail
X-ZohoMailClient: External

Add device tree for Huawei MateBook E 2019, which is a 2-in-1 tablet based
on Qualcomm's sdm850 platform.

Supported features:
 - ADSP, CDSP and SLPI
 - Volume Key
 - Power Key
 - Tablet Mode Switching
 - Display
 - Touchscreen
 - Stylus
 - WiFi [1]
 - Bluetooth [2]
 - GPU
 - USB
 - Keyboard
 - Touchpad
 - UFS
 - SD Card
 - Audio (right internal mic and headphone mic not working)
 - Mobile Network

[1] WiFi probing log:
ath10k_snoc 18800000.wifi: Adding to iommu group 12
ath10k_snoc 18800000.wifi: qmi chip_id 0x30214 chip_family 0x4001 board_id 0xff soc_id 0x40030001
ath10k_snoc 18800000.wifi: qmi fw_version 0x2009856b fw_build_timestamp 2018-07-19 12:28 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HL.2.0-01387-QCAHLSWMTPLZ-1
ath10k_snoc 18800000.wifi: wcn3990 hw1.0 target 0x00000008 chip_id 0x00000000 sub 0000:0000
ath10k_snoc 18800000.wifi: kconfig debug 1 debugfs 1 tracing 1 dfs 0 testmode 0
ath10k_snoc 18800000.wifi: firmware ver  api 5 features wowlan,mgmt-tx-by-reference,non-bmi crc32 b3d4b790
ath10k_snoc 18800000.wifi: htt-ver 3.53 wmi-op 4 htt-op 3 cal file max-sta 32 raw 0 hwcrypto 1
ath10k_snoc 18800000.wifi: invalid MAC address; choosing random

[2] Bluetooth probing log:
Bluetooth: hci0: setting up wcn399x
Bluetooth: hci0: QCA Product ID   :0x0000000a
Bluetooth: hci0: QCA SOC Version  :0x40010214
Bluetooth: hci0: QCA ROM Version  :0x00000201
Bluetooth: hci0: QCA Patch Version:0x00000001
Bluetooth: hci0: QCA controller version 0x02140201
Bluetooth: hci0: QCA Downloading qca/crbtfw21.tlv
Bluetooth: hci0: QCA Downloading qca/crnv21.bin
Bluetooth: hci0: QCA setup on UART is completed

Features not supported yet:
 - Panel Backlight
 - Lid Detection
 - Battery
 - EFI Variable Access
 - Cameras

1. Panel backlight, lid detection and battery will be supported with the
   EC driver upstreamed.
2. EFI variables can only be read with the QSEECOM driver, and will be
   enabled when the driver is fixed.
3. Cameras are tested to work with modified downstream driver, and once
   drivers for these camera modules are included in the tree, cameras can
   be enabled.

Features won't be supported:
 - External Display
 - Fingerprint

1. To make external display work, more reverse engineering may be required,
   but it's beyond my ability.
2. Fingerprint is controlled by TrustZone, meaning direct access to it
   isn't possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Jingzhou Zhu <newwheatzjz@zohomail.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../qcom/sdm850-huawei-matebook-e-2019.dts    | 972 ++++++++++++++++++
 2 files changed, 973 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 296688f7cb26..a6bcebe66dd7 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -258,6 +258,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium-ebbg.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium-tianma.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-polaris.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-shift-axolotl.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-huawei-matebook-e-2019.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-samsung-w737.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
new file mode 100644
index 000000000000..117cc0133363
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm850-huawei-matebook-e-2019.dts
@@ -0,0 +1,972 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Huawei MateBook E 2019
+ *
+ * Copyright (c) 2025, Jingzhou Zhu <newwheatzjz@zohomail.com>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/input/gpio-keys.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/sound/qcom,q6afe.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
+#include <dt-bindings/sound/qcom,wcd934x.h>
+#include "sdm850.dtsi"
+#include "sdm845-wcd9340.dtsi"
+#include "pm8998.dtsi"
+
+/*
+ * Update following upstream (sdm845.dtsi) reserved
+ * memory mappings for firmware loading to succeed
+ * and enable the IPA device.
+ */
+/delete-node/ &tz_mem;
+/delete-node/ &rmtfs_mem;
+/delete-node/ &qseecom_mem;
+/delete-node/ &ipa_fw_mem;
+/delete-node/ &ipa_gsi_mem;
+/delete-node/ &gpu_mem;
+/delete-node/ &adsp_mem;
+/delete-node/ &wlan_msa_mem;
+/delete-node/ &slpi_mem;
+
+/ {
+	model = "Huawei MateBook E 2019";
+	compatible = "huawei,planck", "qcom,sdm845";
+	chassis-type = "convertible";
+
+	aliases {
+		serial0 = &uart9;
+		serial1 = &uart6;
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		pinctrl-0 = <&volume_up_gpio &mode_pin_active>;
+		pinctrl-names = "default";
+
+		key-vol-up {
+			label = "Volume up";
+			gpios = <&pm8998_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <15>;
+			wakeup-source;
+		};
+
+		switch-mode {
+			label = "Tablet mode switch";
+			gpios = <&tlmm 79 GPIO_ACTIVE_HIGH>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_TABLET_MODE>;
+			wakeup-source;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		pinctrl-0 = <&cam_indicator_en>;
+		pinctrl-names = "default";
+
+		led: led-camera-indicator {
+			label = "white:camera-indicator";
+			function = LED_FUNCTION_INDICATOR;
+			color = <LED_COLOR_ID_WHITE>;
+			gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "none";
+			default-state = "off";
+			/* Reuse as a panic indicator until we get a "camera on" trigger */
+			panic-indicator;
+		};
+	};
+
+	sw_edp_1p2: regulator-edp-1p2 {
+		compatible = "regulator-fixed";
+		regulator-name = "sw_edp_1p2";
+
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+
+		pinctrl-0 = <&sw_edp_1p2_en>;
+		pinctrl-names = "default";
+
+		gpio = <&pm8998_gpios 9 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vreg_l2a_1p2>;
+	};
+
+	vlcm_3v3: regulator-vlcm-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vlcm_3v3";
+
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		gpio = <&tlmm 88 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vph_pwr: regulator-vph-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+
+		regulator-always-on;
+	};
+
+	reserved-memory {
+		cont_splash_mem: framebuffer@80100000 {
+			reg = <0 0x80100000 0 0xd00000>;
+			no-map;
+		};
+
+		tz_mem: tz@86d00000 {
+			reg = <0 0x86d00000 0 0x4600000>;
+			no-map;
+		};
+
+		qseecom_mem: qseecom@8b500000 {
+			reg = <0 0x8b500000 0 0xa00000>;
+			no-map;
+		};
+
+		wlan_msa_mem: wlan-msa@8c400000 {
+			reg = <0 0x8c400000 0 0x100000>;
+			no-map;
+		};
+
+		adsp_mem: adsp@8c500000 {
+			reg = <0 0x8c500000 0 0x1a00000>;
+			no-map;
+		};
+
+		ipa_fw_mem: ipa-fw@8df00000 {
+			reg = <0 0x8df00000 0 0x100000>;
+			no-map;
+		};
+
+		slpi_mem: slpi@96700000 {
+			reg = <0 0x96700000 0 0x1200000>;
+		};
+
+		gpu_mem: gpu@97900000 {
+			reg = <0 0x97900000 0 0x5000>;
+			no-map;
+		};
+
+		rmtfs_mem: rmtfs@97c00000 {
+			compatible = "qcom,rmtfs-mem";
+			reg = <0 0x97c00000 0 0x200000>;
+			no-map;
+
+			qcom,client-id = <1>;
+			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA>;
+
+		};
+	};
+
+	sn65dsi86_refclk: sn65dsi86-refclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+
+		clock-frequency = <19200000>;
+	};
+};
+
+&adsp_pas {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qcadsp850.mbn";
+
+	status = "okay";
+};
+
+&apps_rsc {
+	regulators-0 {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+		vdd-s9-supply = <&vph_pwr>;
+		vdd-s10-supply = <&vph_pwr>;
+		vdd-s11-supply = <&vph_pwr>;
+		vdd-s12-supply = <&vph_pwr>;
+		vdd-s13-supply = <&vph_pwr>;
+		vdd-l1-l27-supply = <&vreg_s7a_1p025>;
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l3-l11-supply = <&vreg_s7a_1p025>;
+		vdd-l4-l5-supply = <&vreg_s7a_1p025>;
+		vdd-l6-supply = <&vph_pwr>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
+		vdd-l26-supply = <&vreg_s3a_1p35>;
+		vin-lvs-1-2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s2a_1p125: smps2 {
+		};
+
+		vreg_s3a_1p35: smps3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s4a_1p8: smps4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s5a_2p04: smps5 {
+			regulator-min-microvolt = <2040000>;
+			regulator-max-microvolt = <2040000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s6a_0p8: smps6 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_s7a_1p025: smps7 {
+			regulator-min-microvolt = <1028000>;
+			regulator-max-microvolt = <1028000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qusb_hs0:
+		vdda_hp_pcie_core:
+		vdda_mipi_csi0_0p9:
+		vdda_mipi_csi1_0p9:
+		vdda_mipi_csi2_0p9:
+		vdda_mipi_dsi0_pll:
+		vdda_mipi_dsi1_pll:
+		vdda_qlink_lv:
+		vdda_qlink_lv_ck:
+		vdda_qrefs_0p875:
+		vdda_pcie_core:
+		vdda_pll_cc_ebi01:
+		vdda_pll_cc_ebi23:
+		vdda_sp_sensor:
+		vdda_ufs1_core:
+		vdda_ufs2_core:
+		vdda_usb1_ss_core:
+		vdda_usb2_ss_core:
+		vreg_l1a_0p875: ldo1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_10:
+		vreg_l2a_1p2: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l3a_1p0: ldo3 {
+		};
+
+		vdd_wcss_cx:
+		vdd_wcss_mx:
+		vdda_wcss_pll:
+		vreg_l5a_0p8: ldo5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_13:
+		vreg_l6a_1p8: ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8a_1p2: ldo8 {
+		};
+
+		vreg_l9a_1p8: ldo9 {
+		};
+
+		vreg_l10a_1p8: ldo10 {
+		};
+
+		vreg_l11a_1p0: ldo11 {
+		};
+
+		vdd_qfprom:
+		vdd_qfprom_sp:
+		vdda_apc1_cs_1p8:
+		vdda_gfx_cs_1p8:
+		vdda_qrefs_1p8:
+		vdda_qusb_hs0_1p8:
+		vddpx_11:
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_2:
+		vreg_l13a_2p95: ldo13 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p88: ldo14 {
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-always-on;
+		};
+
+		vreg_l15a_1p8: ldo15 {
+		};
+
+		vreg_l16a_2p7: ldo16 {
+		};
+
+		vreg_l17a_1p3: ldo17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l18a_2p7: ldo18 {
+		};
+
+		vreg_l19a_3p0: ldo19 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l20a_2p95: ldo20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l21a_2p95: ldo21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l22a_2p85: ldo22 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+
+			regulator-always-on;
+		};
+
+		vreg_l23a_3p3: ldo23 {
+		};
+
+		vdda_qusb_hs0_3p1:
+		vreg_l24a_3p075: ldo24 {
+			/* 3075000 uV causes -ENOTRECOVERABLE error */
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_hp_pcie_1p2:
+		vdda_hv_ebi0:
+		vdda_hv_ebi1:
+		vdda_hv_ebi2:
+		vdda_hv_ebi3:
+		vdda_mipi_csi_1p25:
+		vdda_mipi_dsi0_1p2:
+		vdda_mipi_dsi1_1p2:
+		vdda_pcie_1p2:
+		vdda_ufs1_1p2:
+		vdda_ufs2_1p2:
+		vdda_usb1_ss_1p2:
+		vdda_usb2_ss_1p2:
+		vreg_l26a_1p2: ldo26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+			/* 3300000 uV causes -ENOTRECOVERABLE error */
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_lvs1a_1p8: lvs1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+	};
+
+	regulators-1 {
+		compatible = "qcom,pm8005-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+
+		vreg_s2c_0p752: smps2 {
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+		};
+	};
+};
+
+&cci_i2c0 {
+	/* chipnext,cn3927e vcm@0xc */
+	/* samsung,s5k3l6 camera@0x10 */
+	/* eeprom@0x50 */
+};
+
+&cci_i2c1 {
+	/* galaxycore,gc5025 camera@0x36 */
+	/* eeprom@0x50 */
+};
+
+&cdsp_pas {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qccdsp850.mbn";
+
+	status = "okay";
+};
+
+&crypto {
+	/* FIXME: qce_start triggers an SError */
+	status = "disabled";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>,
+			   <GCC_LPASS_Q6_AXI_CLK>,
+			   <GCC_LPASS_SWAY_CLK>;
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		memory-region = <&gpu_mem>;
+		firmware-name = "qcom/sdm850/HUAWEI/AL09/qcdxkmsuc850.mbn";
+	};
+};
+
+&i2c5 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	touchscreen: hid@5d {
+		compatible = "hid-over-i2c";
+		reg = <0x5d>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-0 = <&i2c5_hid_active>;
+		pinctrl-names = "default";
+
+		wakeup-source;
+	};
+};
+
+&i2c7 {
+	/* ec@0x76 */
+};
+
+&i2c10 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	sn65dsi86: bridge@2c {
+		compatible = "ti,sn65dsi86";
+		reg = <0x2c>;
+
+		pinctrl-0 = <&sn65dsi86_pin_active>;
+		pinctrl-names = "default";
+
+		enable-gpios = <&tlmm 96 GPIO_ACTIVE_HIGH>;
+
+		vcca-supply = <&sw_edp_1p2>;
+		vcc-supply = <&sw_edp_1p2>;
+		vpll-supply = <&vreg_l14a_1p88>;
+		vccio-supply = <&vreg_l14a_1p88>;
+
+		clocks = <&sn65dsi86_refclk>;
+		clock-names = "refclk";
+
+		no-hpd;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				sn65dsi86_in: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				sn65dsi86_out: endpoint {
+					remote-endpoint = <&panel_in_edp>;
+				};
+			};
+		};
+
+		aux-bus {
+			panel: panel {
+				compatible = "innolux,p120zdg-bf1";
+				power-supply = <&vlcm_3v3>;
+
+				port {
+					panel_in_edp: endpoint {
+						remote-endpoint = <&sn65dsi86_out>;
+					};
+				};
+			};
+		};
+	};
+};
+
+&ipa {
+	qcom,gsi-loader = "self";
+	memory-region = <&ipa_fw_mem>;
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/ipa_fws.elf";
+
+	status = "okay";
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vdda_mipi_dsi0_1p2>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&sn65dsi86_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vdda_mipi_dsi0_pll>;
+
+	status = "okay";
+};
+
+&mss_pil {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qcdsp1v2850.mbn",
+			"qcom/sdm850/HUAWEI/AL09/qcdsp2850.mbn";
+
+	status = "okay";
+};
+
+&pm8998_gpios {
+	sw_edp_1p2_en: sw-edp-1p2-en-state {
+		pins = "gpio9";
+		function = "normal";
+		bias-disable;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+
+	volume_up_gpio: volume-up-gpio-state {
+		pins = "gpio6";
+		function = "normal";
+		input-enable;
+		bias-pull-up;
+		qcom,drive-strength = <PMIC_GPIO_STRENGTH_NO>;
+	};
+};
+
+&pm8998_pwrkey {
+	status = "okay";
+};
+
+&pm8998_resin {
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
+&q6asmdai {
+	dai@0 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
+	};
+
+	dai@1 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
+	};
+
+	dai@2 {
+		reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
+	};
+};
+
+&sdhc_2 {
+	pinctrl-0 = <&sdc2_default_state &sdc2_card_det_n>;
+	pinctrl-names = "default";
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vddpx_2>;
+
+	bus-width = <4>;
+	cd-gpios = <&tlmm 126 GPIO_ACTIVE_HIGH>;
+
+	status = "okay";
+};
+
+&slpi_pas {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qcslpi850.mbn";
+
+	status = "okay";
+};
+
+&sound {
+	compatible = "lenovo,yoga-c630-sndcard", "qcom,sdm845-sndcard";
+	model = "HUAWEI-PAK_AL09-M1040";
+
+	audio-routing = "RX_BIAS", "MCLK",
+			"AMIC2", "MIC BIAS2",
+			"DMIC0", "MCLK",
+			"DMIC0", "MIC BIAS1",
+			"DMIC2", "MCLK",
+			"DMIC2", "MIC BIAS3",
+			"SpkrLeft IN", "SPK1 OUT",
+			"SpkrRight IN", "SPK2 OUT";
+
+	mm1-dai-link {
+		link-name = "MultiMedia1";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA1>;
+		};
+	};
+
+	mm2-dai-link {
+		link-name = "MultiMedia2";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA2>;
+		};
+	};
+
+	mm3-dai-link {
+		link-name = "MultiMedia3";
+
+		cpu {
+			sound-dai = <&q6asmdai MSM_FRONTEND_DAI_MULTIMEDIA3>;
+		};
+	};
+
+	slim-dai-link {
+		link-name = "SLIM Playback";
+
+		codec {
+			sound-dai = <&left_spkr>, <&right_spkr>, <&swm 0>, <&wcd9340 AIF1_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slimcap-dai-link {
+		link-name = "SLIM Capture";
+
+		codec {
+			sound-dai = <&wcd9340 AIF1_CAP>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_0_TX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+
+	slim-wcd-dai-link {
+		link-name = "SLIM WCD Playback";
+
+		codec {
+			sound-dai = <&wcd9340 AIF2_PB>;
+		};
+
+		cpu {
+			sound-dai = <&q6afedai SLIMBUS_1_RX>;
+		};
+
+		platform {
+			sound-dai = <&q6routing>;
+		};
+	};
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, /* Unused */
+			       <81 4>; /* SPI (fingerprint reader) */
+
+	cam_indicator_en: cam-indicator-en-state {
+		pins = "gpio12";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	i2c5_hid_active: i2c5-hid-active-state {
+		pins = "gpio125";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	mode_pin_active: mode-pin-state {
+		pins = "gpio79";
+		function = "gpio";
+		bias-disable;
+	};
+
+	sdc2_default_state: sdc2-default-state {
+		clk-pins {
+			pins = "sdc2_clk";
+			drive-strength = <16>;
+			bias-disable;
+		};
+
+		cmd-pins {
+			pins = "sdc2_cmd";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		data-pins {
+			pins = "sdc2_data";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio126";
+		function = "gpio";
+		bias-pull-up;
+	};
+
+	sn65dsi86_pin_active: sn65dsi86-enable-state {
+		pins = "gpio96";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
+
+&uart6 {
+	pinctrl-0 = <&qup_uart6_4pin>;
+	pinctrl-names = "default";
+
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		vddch1-supply = <&vreg_l23a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&uart9 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	reset-gpios = <&tlmm 150 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+
+	status = "okay";
+};
+
+&ufs_mem_phy {
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
+
+	status = "okay";
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+
+	status = "okay";
+};
+
+&usb_1_qmpphy {
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
+&usb_2_hsphy {
+	vdd-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
+
+	status = "okay";
+};
+
+&usb_2_qmpphy {
+	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb2_ss_core>;
+
+	status = "okay";
+};
+
+&venus {
+	firmware-name = "qcom/sdm850/HUAWEI/AL09/qcvss850.mbn";
+
+	status = "okay";
+};
+
+&wcd9340 {
+	reset-gpios = <&tlmm 64 GPIO_ACTIVE_HIGH>;
+	vdd-buck-supply = <&vreg_s4a_1p8>;
+	vdd-buck-sido-supply = <&vreg_s4a_1p8>;
+	vdd-tx-supply = <&vreg_s4a_1p8>;
+	vdd-rx-supply = <&vreg_s4a_1p8>;
+	vdd-io-supply = <&vreg_s4a_1p8>;
+	qcom,mbhc-buttons-vthreshold-microvolt = <75000 150000 237000 500000
+						  500000 500000 500000 500000>;
+	qcom,mbhc-headset-vthreshold-microvolt = <1700000>;
+	qcom,mbhc-headphone-vthreshold-microvolt = <50000>;
+	qcom,micbias1-microvolt = <1800000>;
+	qcom,micbias2-microvolt = <2700000>;
+	qcom,micbias3-microvolt = <1800000>;
+
+	swm: soundwire@c85 {
+		left_spkr: speaker@0,3 {
+			compatible = "sdw10217211000";
+			reg = <0 3>;
+			powerdown-gpios = <&wcdgpio 1 GPIO_ACTIVE_LOW>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrLeft";
+			#sound-dai-cells = <0>;
+		};
+
+		right_spkr: speaker@0,4 {
+			compatible = "sdw10217211000";
+			reg = <0 4>;
+			powerdown-gpios = <&wcdgpio 2 GPIO_ACTIVE_LOW>;
+			#thermal-sensor-cells = <0>;
+			sound-name-prefix = "SpkrRight";
+			#sound-dai-cells = <0>;
+		};
+	};
+};
+
+&wifi {
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
+	vdd-3.3-ch1-supply = <&vreg_l23a_3p3>;
+
+	qcom,snoc-host-cap-8bit-quirk;
+	qcom,calibration-variant = "Huawei_Planck";
+
+	status = "okay";
+};
-- 
2.47.3


