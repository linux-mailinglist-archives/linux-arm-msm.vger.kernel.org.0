Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98B939A0DD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Jun 2021 14:29:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229950AbhFCMbN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Jun 2021 08:31:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:44030 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229840AbhFCMbN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Jun 2021 08:31:13 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9C918610CB;
        Thu,  3 Jun 2021 12:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1622723369;
        bh=/G11w5FLwHxE5Tq0kQPZxtcdlFmawxWi+yDU36snoDA=;
        h=From:To:Cc:Subject:Date:From;
        b=f6ZQRlxjTxsLVkxgLMeW7fNB6fxd1WSKlifnNTOTxcKIqhtHjUNsDQlgdYAz1j5Gd
         gSgRlCRFozk54iDf9DhEtmgGAt8A7039miAvAS+CI4pWPFgTb3bdmhj858AxoxUAjL
         CqnghustkpLua4YkA9NRZq8CbWceCyWN52OBAmGwXqrTnweOAbEzf1WbfuRS7SGohM
         2nrJaQeRuVkY51tn8YFa0BM/jGLgRR19Uva609wqnfRGowDMMKx2GJUQ4Cz6RTyK65
         b++ZB4nOeYDNf/KTiKLE9eHckdCixS0I3sgPro61LmLNHu9Qb1JrLaITo7QEjdDpzt
         x9f2ljDUr9jVQ==
From:   Felipe Balbi <balbi@kernel.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Felipe Balbi <felipe.balbi@microsoft.com>
Subject: [PATCH v2] arm64: dts: qcom: add initial device-tree for Microsoft Surface Duo
Date:   Thu,  3 Jun 2021 15:29:23 +0300
Message-Id: <20210603122923.1919624-1-balbi@kernel.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Felipe Balbi <felipe.balbi@microsoft.com>

Microsoft Surface Duo is based on SM8150 chipset. This new Device Tree
is a copy of sm8150-mtp with a the addition of the volume up key and
relevant i2c nodes.

Signed-off-by: Felipe Balbi <felipe.balbi@microsoft.com>
---
Changes since v1:

	- Sort nodes alphabetically
	- Change path for FW blobs
	- Rebase and retest on v5.13-rc4

 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../dts/qcom/sm8150-microsoft-surface-duo.dts | 543 ++++++++++++++++++
 2 files changed, 544 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 456502aeee49..9cfd409207cc 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -70,6 +70,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-oneplus-fajita.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-xiaomi-beryllium.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-hdk.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-microsoft-surface-duo.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8150-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-hdk.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sm8250-mtp.dtb
diff --git a/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
new file mode 100644
index 000000000000..736da9af44e0
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sm8150-microsoft-surface-duo.dts
@@ -0,0 +1,543 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (C) 2021, Microsoft Corporation
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
+#include "sm8150.dtsi"
+#include "pm8150.dtsi"
+#include "pm8150b.dtsi"
+#include "pm8150l.dtsi"
+
+/ {
+	model = "Microsoft Surface Duo";
+	compatible = "microsoft,surface-duo", "qcom,sm8150";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	/*
+	 * Apparently RPMh does not provide support for PM8150 S4 because it
+	 * is always-on; model it as a fixed regulator.
+	 */
+	vreg_s4a_1p8: pm8150-s4 {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s4a_1p8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	gpio_keys {
+		compatible = "gpio-keys";
+
+		vol_up {
+			label = "Volume Up";
+			gpios = <&pm8150_gpios 6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_VOLUMEUP>;
+		};
+	};
+};
+
+&apps_rsc {
+	pm8150-rpmh-regulators {
+		compatible = "qcom,pm8150-rpmh-regulators";
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
+
+		vdd-l1-l8-l11-supply = <&vreg_s6a_0p9>;
+		vdd-l2-l10-supply = <&vreg_bob>;
+		vdd-l3-l4-l5-l18-supply = <&vreg_s6a_0p9>;
+		vdd-l6-l9-supply = <&vreg_s8c_1p3>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p0>;
+		vdd-l13-l16-l17-supply = <&vreg_bob>;
+
+		vreg_s5a_2p0: smps5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2000000>;
+		};
+
+		vreg_s6a_0p9: smps6 {
+			regulator-min-microvolt = <920000>;
+			regulator-max-microvolt = <1128000>;
+		};
+
+		vdda_wcss_pll:
+		vreg_l1a_0p75: ldo1 {
+			regulator-min-microvolt = <752000>;
+			regulator-max-microvolt = <752000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_pdphy:
+		vdda_usb_hs_3p1:
+		vreg_l2a_3p1: ldo2 {
+			regulator-min-microvolt = <3072000>;
+			regulator-max-microvolt = <3072000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l3a_0p8: ldo3 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <932000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_usb_hs_core:
+		vdda_csi_0_0p9:
+		vdda_csi_1_0p9:
+		vdda_csi_2_0p9:
+		vdda_csi_3_0p9:
+		vdda_dsi_0_0p9:
+		vdda_dsi_1_0p9:
+		vdda_dsi_0_pll_0p9:
+		vdda_dsi_1_pll_0p9:
+		vdda_pcie_1ln_core:
+		vdda_pcie_2ln_core:
+		vdda_pll_hv_cc_ebi01:
+		vdda_pll_hv_cc_ebi23:
+		vdda_qrefs_0p875_5:
+		vdda_sp_sensor:
+		vdda_ufs_2ln_core_1:
+		vdda_ufs_2ln_core_2:
+		vdda_usb_ss_dp_core_1:
+		vdda_usb_ss_dp_core_2:
+		vdda_qlink_lv:
+		vdda_qlink_lv_ck:
+		vreg_l5a_0p875: ldo5 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6a_1p2: ldo6 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7a_1p8: ldo7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_10:
+		vreg_l9a_1p2: ldo9 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10a_2p5: ldo10 {
+			regulator-min-microvolt = <2504000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11a_0p8: ldo11 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdd_qfprom:
+		vdd_qfprom_sp:
+		vdda_apc_cs_1p8:
+		vdda_gfx_cs_1p8:
+		vdda_usb_hs_1p8:
+		vdda_qrefs_vref_1p8:
+		vddpx_10_a:
+		vreg_l12a_1p8: ldo12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l13a_2p7: ldo13 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l14a_1p8: ldo14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l15a_1p7: ldo15 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1704000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l16a_2p7: ldo16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l17a_3p0: ldo17 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3008000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8150l-rpmh-regulators {
+		compatible = "qcom,pm8150l-rpmh-regulators";
+		qcom,pmic-id = "c";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-s8-supply = <&vph_pwr>;
+
+		vdd-l1-l8-supply = <&vreg_s4a_1p8>;
+		vdd-l2-l3-supply = <&vreg_s8c_1p3>;
+		vdd-l4-l5-l6-supply = <&vreg_bob>;
+		vdd-l7-l11-supply = <&vreg_bob>;
+		vdd-l9-l10-supply = <&vreg_bob>;
+
+		vdd-bob-supply = <&vph_pwr>;
+		vdd-flash-supply = <&vreg_bob>;
+		vdd-rgb-supply = <&vreg_bob>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <4000000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_AUTO>;
+			regulator-allow-bypass;
+		};
+
+		vreg_s8c_1p3: smps8 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_l1c_1p8: ldo1 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_wcss_adcdac_1:
+		vdda_wcss_adcdac_22:
+		vreg_l2c_1p3: ldo2 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vdda_hv_ebi0:
+		vdda_hv_ebi1:
+		vdda_hv_ebi2:
+		vdda_hv_ebi3:
+		vdda_hv_refgen0:
+		vdda_qlink_hv_ck:
+		vreg_l3c_1p2: ldo3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_5:
+		vreg_l4c_1p8: ldo4 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_6:
+		vreg_l5c_1p8: ldo5 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vddpx_2:
+		vreg_l6c_2p9: ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l7c_3p0: ldo7 {
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <3104000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l8c_1p8: ldo8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l9c_2p9: ldo9 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l10c_3p3: ldo10 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l11c_3p3: ldo11 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3312000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+	};
+
+	pm8009-rpmh-regulators {
+		compatible = "qcom,pm8009-rpmh-regulators";
+		qcom,pmic-id = "f";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vreg_bob>;
+
+		vdd-l2-supply = <&vreg_s8c_1p3>;
+		vdd-l5-l6-supply = <&vreg_bob>;
+
+		vreg_l2f_1p2: ldo2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l5f_2p85: ldo5 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l6f_2p85: ldo6 {
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+			regulator-min-microvolt = <2856000>;
+			regulator-max-microvolt = <2856000>;
+		};
+	};
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bq27742@55 {
+		compatible = "ti,bq27742";
+		reg = <0x55>;
+	};
+
+	da7280@4a {
+		compatible = "dlg,da7280";
+		reg = <0x4a>;
+		interrupts-extended = <&tlmm 42 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "da7280_default";
+		pinctrl-0 = <&da7280_intr_default>;
+
+		dlg,actuator-type = "LRA";
+		dlg,dlg,const-op-mode = <1>;
+		dlg,dlg,periodic-op-mode = <1>;
+		dlg,nom-microvolt = <2000000>;
+		dlg,abs-max-microvolt = <2000000>;
+		dlg,imax-microamp = <129000>;
+		dlg,resonant-freq-hz = <180>;
+		dlg,impd-micro-ohms = <14300000>;
+		dlg,freq-track-enable;
+		dlg,bemf-sens-enable;
+		dlg,mem-array = <
+		  0x06 0x08 0x10 0x11 0x12 0x13 0x14 0x15 0x1c 0x2a
+		  0x33 0x3c 0x42 0x4b 0x4c 0x4e 0x17 0x19 0x27 0x29
+		  0x17 0x19 0x03 0x84 0x5e 0x04 0x08 0x84 0x5d 0x01
+		  0x84 0x5e 0x02 0x00 0xa4 0x5d 0x03 0x84 0x5e 0x06
+		  0x08 0x84 0x5d 0x05 0x84 0x5d 0x06 0x84 0x5e 0x08
+		  0x84 0x5e 0x05 0x8c 0x5e 0x24 0x84 0x5f 0x10 0x84
+		  0x5e 0x05 0x84 0x5e 0x08 0x84 0x5f 0x01 0x8c 0x5e
+		  0x04 0x84 0x5e 0x08 0x84 0x5f 0x11 0x19 0x88 0x00
+		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+		  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+		>;
+	};
+
+	/* SMB1381 @ 0x44 */
+	/* MAX34417 @ 0x1c */
+};
+
+&i2c4 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	/* SMB1355 @ 0x0c */
+	/* SMB1390 @ 0x10 */
+};
+
+&i2c17 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	bq27742@55 {
+		compatible = "ti,bq27742";
+		reg = <0x55>;
+	};
+};
+
+&i2c19 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	/* MAX34417 @ 0x12 */
+	/* MAX34417 @ 0x1a */
+	/* MAX34417 @ 0x1e */
+};
+
+&pon {
+	pwrkey {
+		status = "okay";
+	};
+
+	resin {
+		compatible = "qcom,pm8941-resin";
+		interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
+		debounce = <15625>;
+		bias-pull-up;
+		linux,code = <KEY_VOLUMEDOWN>;
+	};
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
+&qupv3_id_2 {
+	status = "okay";
+};
+
+&remoteproc_adsp {
+	status = "okay";
+	firmware-name = "qcom/sm8150/microsoft/adsp.mdt";
+};
+
+&remoteproc_cdsp {
+	status = "okay";
+	firmware-name = "qcom/sm8150/microsoft/cdsp.mdt";
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	firmware-name = "qcom/sm8150/microsoft/modem.mdt";
+};
+
+&remoteproc_slpi {
+	status = "okay";
+	firmware-name = "qcom/sm8150/microsoft/slpi.mdt";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <126 4>;
+
+	da7280_intr_default: da7280-intr-default {
+		pins = "gpio42";
+		function = "gpio";
+		bias-pull-up;
+		input-enable;
+	};
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	reset-gpios = <&tlmm 175 GPIO_ACTIVE_LOW>;
+
+	vcc-supply = <&vreg_l10a_2p5>;
+	vcc-max-microamp = <750000>;
+	vccq-supply = <&vreg_l9a_1p2>;
+	vccq-max-microamp = <700000>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs_2ln_core_1>;
+	vdda-max-microamp = <90200>;
+	vdda-pll-supply = <&vreg_l3c_1p2>;
+	vdda-pll-max-microamp = <19000>;
+};
+
+&usb_1_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vdd_usb_hs_core>;
+	vdda33-supply = <&vdda_usb_hs_3p1>;
+	vdda18-supply = <&vdda_usb_hs_1p8>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l3c_1p2>;
+	vdda-pll-supply = <&vdda_usb_ss_dp_core_1>;
+};
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vdda_wcss_pll>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vdda_wcss_adcdac_1>;
+	vdd-3.3-ch0-supply = <&vreg_l11c_3p3>;
+};
-- 
2.31.1

