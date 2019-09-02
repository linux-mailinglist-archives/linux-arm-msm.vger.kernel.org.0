Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CE62BA579E
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Sep 2019 15:24:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729983AbfIBNYI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Sep 2019 09:24:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46288 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729889AbfIBNYH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Sep 2019 09:24:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id h7so12680608wrt.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Sep 2019 06:24:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=oDLLqPmZP75En4wDIkvq5LXT/8yT3OmRWh3trcVyjdU=;
        b=tqQncKFuWOcTyTbHLZ/wZk39zG6JZHd3mUOFxDHnm7mD3/lKmGiW8/3cXbF0ibZDYH
         b4fgZbwM12TBM2mMI0JFXzRW7lpXty/k+DfF5tsZlLb0dzltP2N3L9mz2PVmvA2htcLG
         cuzEUafflA3Qe4v5cDQbVK5F5I8md7ugQoDAkd1SqEmFsah0iLa5YPifN3Wa8ECB9k5j
         7x3HLacaVjoitI6oR1KtrSbH/HpRonV4cd+snlXEjP+XTiyw4wj5B5asjZ9CJ/5SQsSM
         IviWceiEvW2jtnU5elfXf35h+hS+tMdQ7cVhULbKsyKfhDPX2ITkHvL7YZew5DnAkI8+
         hzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=oDLLqPmZP75En4wDIkvq5LXT/8yT3OmRWh3trcVyjdU=;
        b=gdVuiS9daxjvhG14wBewPPApHQSF7Ie6++VFTF9sYEL6BNpQR0V1bjBAJDq4/sLWIY
         zP8KJvTORqMvYpE5ku4Si0q3gzXFWgcwVqWcwAVqxYnoa3TQv4/EDs0OZZxocnKRHFhh
         Skij4jRzXcUeTJzTeN7aC/Fwq73fwgVx1cAYBSw0JBNVMVzjP5syBNUuJfymjOyn2juZ
         CuARXZRvIZEJNSaE3q+1fTxfrXmxjrpVObBgCuWerf74UEsf3m6GMSwg5jqgACV2I34M
         vTMxCJP191b9DOvoSJOYMXQMI5om4i5KzOxth4YvoJrq8CugZCbiNBv7q/DK3z0PRerd
         /dnQ==
X-Gm-Message-State: APjAAAVUYR6zGWL9tI96TVFg5b4CVy5El8qD5nABxFWaQ9+sQW5HH6I2
        OlRQY6YcUn98D5BsOcZfPRyr/g==
X-Google-Smtp-Source: APXvYqy1cXndISDlDmqA5f+7s89V6T90qM/ScR51rSvzFFmW6cOHbz3hjo97s+MiE6kX5DwK4T0BNg==
X-Received: by 2002:adf:ed42:: with SMTP id u2mr4226086wro.330.1567430643965;
        Mon, 02 Sep 2019 06:24:03 -0700 (PDT)
Received: from localhost.localdomain ([95.147.198.93])
        by smtp.gmail.com with ESMTPSA id j26sm5787619wrd.2.2019.09.02.06.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2019 06:24:03 -0700 (PDT)
From:   Lee Jones <lee.jones@linaro.org>
To:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Lee Jones <lee.jones@linaro.org>
Subject: [PATCH 1/1] arm64: dts: qcom: Add Lenovo Yoga C630
Date:   Mon,  2 Sep 2019 14:24:00 +0100
Message-Id: <20190902132400.14084-1-lee.jones@linaro.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Bjorn Andersson <bjorn.andersson@linaro.org>

The Lenovo Yoga C630 is built on the SDM850 from Qualcomm, but this seem
to be similar enough to the SDM845 that we can reuse the sdm845.dtsi.

Supported by this patch is: keyboard, battery monitoring, UFS storage,
USB host and Bluetooth.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/sdm850-lenovo-yoga-c630.dts | 450 ++++++++++++++++++
 2 files changed, 451 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 0a7e5dfce6f7..670c6c65f9e9 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -12,5 +12,6 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-cheza-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-db845c.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm845-mtp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sdm850-lenovo-yoga-c630.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-1000.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs404-evb-4000.dtb
diff --git a/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
new file mode 100644
index 000000000000..3177b054035f
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
@@ -0,0 +1,450 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Lenovo Yoga C630
+ *
+ * Copyright (c) 2019, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "sdm845.dtsi"
+#include "pm8998.dtsi"
+
+/ {
+	model = "Lenovo Yoga C630";
+	compatible = "lenovo,yoga-c630", "qcom,sdm845";
+
+	aliases {
+		hsuart0 = &uart6;
+	};
+};
+
+&apps_rsc {
+	pm8998-rpmh-regulators {
+		compatible = "qcom,pm8998-rpmh-regulators";
+		qcom,pmic-id = "a";
+
+		vdd-l2-l8-l17-supply = <&vreg_s3a_1p35>;
+		vdd-l7-l12-l14-l15-supply = <&vreg_s5a_2p04>;
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
+		vreg_s7a_1p025: smps7 {
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
+		};
+
+		vreg_l14a_1p88: ldo14 {
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
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
+			regulator-min-microvolt = <3100000>;
+			regulator-max-microvolt = <3108000>;
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
+		};
+
+		vreg_l22a_2p85: ldo22 {
+		};
+
+		vreg_l23a_3p3: ldo23 {
+		};
+
+		vdda_qusb_hs0_3p1:
+		vreg_l24a_3p075: ldo24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3083000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l25a_3p3: ldo25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3112000>;
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
+			regulator-max-microvolt = <1208000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
+		};
+
+		vreg_l28a_3p0: ldo28 {
+		};
+
+		vreg_lvs1a_1p8: lvs1 {
+		};
+
+		vreg_lvs2a_1p8: lvs2 {
+		};
+	};
+};
+
+&apps_smmu {
+	/* TODO: Figure out how to survive booting with this enabled */
+	status = "disabled";
+};
+
+&gcc {
+	protected-clocks = <GCC_QSPI_CORE_CLK>,
+			   <GCC_QSPI_CORE_CLK_SRC>,
+			   <GCC_QSPI_CNOC_PERIPH_AHB_CLK>;
+};
+
+&i2c1 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	battery@70 {
+		compatible = "some,battery";
+		reg = <0x70>;
+	};
+};
+
+&i2c3 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hid@15 {
+		compatible = "hid-over-i2c";
+		reg = <0x15>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 37 IRQ_TYPE_EDGE_RISING>;
+	};
+
+	hid@2c {
+		compatible = "hid-over-i2c";
+		reg = <0x2c>;
+		hid-descr-addr = <0x20>;
+
+		interrupts-extended = <&tlmm 37 IRQ_TYPE_EDGE_RISING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c2_hid_active>;
+	};
+};
+
+&i2c5 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hid@10 {
+		compatible = "hid-over-i2c";
+		reg = <0x10>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 125 IRQ_TYPE_EDGE_FALLING>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c6_hid_active>;
+	};
+};
+
+&i2c11 {
+	status = "okay";
+	clock-frequency = <400000>;
+
+	hid@5c {
+		compatible = "hid-over-i2c";
+		reg = <0x5c>;
+		hid-descr-addr = <0x1>;
+
+		interrupts-extended = <&tlmm 92 IRQ_TYPE_LEVEL_LOW>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&i2c12_hid_active>;
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
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+
+	i2c2_hid_active: i2c2-hid-active {
+		pins = <37>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
+	i2c6_hid_active: i2c6-hid-active {
+		pins = <125>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+
+	i2c12_hid_active: i2c12-hid-active {
+		pins = <92>;
+		function = "gpio";
+
+		input-enable;
+		bias-pull-up;
+		drive-strength = <2>;
+	};
+};
+
+&uart6 {
+       status = "okay";
+
+       bluetooth {
+	       compatible = "qcom,wcn3990-bt";
+
+	       vddio-supply = <&vreg_s4a_1p8>;
+	       vddxo-supply = <&vreg_l7a_1p8>;
+	       vddrf-supply = <&vreg_l17a_1p3>;
+	       vddch0-supply = <&vreg_l25a_3p3>;
+	       max-speed = <3200000>;
+       };
+};
+
+&ufs_mem_hc {
+	status = "okay";
+
+	vcc-supply = <&vreg_l20a_2p95>;
+	vcc-max-microamp = <600000>;
+};
+
+&ufs_mem_phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_ufs1_core>;
+	vdda-pll-supply = <&vdda_ufs1_1p2>;
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
+	status = "okay";
+
+	vdd-supply = <&vdda_usb1_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_21_6_MA>;
+	qcom,preemphasis-level = <QUSB2_V2_PREEMPHASIS_5_PERCENT>;
+	qcom,preemphasis-width = <QUSB2_V2_PREEMPHASIS_WIDTH_HALF_BIT>;
+};
+
+&usb_1_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_usb1_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb1_ss_core>;
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
+	status = "okay";
+
+	vdd-supply = <&vdda_usb2_ss_core>;
+	vdda-pll-supply = <&vdda_qusb_hs0_1p8>;
+	vdda-phy-dpdm-supply = <&vdda_qusb_hs0_3p1>;
+
+	qcom,imp-res-offset-value = <8>;
+	qcom,hstx-trim-value = <QUSB2_V2_HSTX_TRIM_22_8_MA>;
+};
+
+&usb_2_qmpphy {
+	status = "okay";
+
+	vdda-phy-supply = <&vdda_usb2_ss_1p2>;
+	vdda-pll-supply = <&vdda_usb2_ss_core>;
+};
+
+&qup_i2c12_default {
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart6_default {
+       pinmux {
+               pins = "gpio45", "gpio46", "gpio47", "gpio48";
+               function = "qup6";
+       };
+
+       cts {
+	       pins = "gpio45";
+	       bias-pull-down;
+       };
+
+       rts-tx {
+	       pins = "gpio46", "gpio47";
+	       drive-strength = <2>;
+	       bias-disable;
+       };
+
+       rx {
+	       pins = "gpio48";
+	       bias-pull-up;
+       };
+};
-- 
2.17.1

