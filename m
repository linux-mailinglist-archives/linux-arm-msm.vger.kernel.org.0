Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22D5A358AD3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Apr 2021 19:06:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232599AbhDHRGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 13:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232516AbhDHRFy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 13:05:54 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120E2C0613DC
        for <linux-arm-msm@vger.kernel.org>; Thu,  8 Apr 2021 10:05:43 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id l123so2284524pfl.8
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Apr 2021 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wSY1KNrsEzDWYatM0ZrxRoCpvrDbm9YIr/BDATB7Pqw=;
        b=S4N4+piSDP/RqA1P2ZEDRzM/qxGON3DJDhcHo2VC7B8JpKcnalB531U4STQDAiIE1G
         BGqK1AMLLVDL9ZwyoaGKYSx8dIZ5Ar3iGQMjAFYh1Vbr4iUBk0kC9Iu3kTKi89yoYjKv
         ctmbxpISESiklAqZKOCSQoEJN5EDzf9anuhdbV2sZksCnsgxPmWtdvNWeS99wooC2jg2
         yblZg1FYu5X+deK6djieqKBS6vuBjYLe7BLtrdcfLnjhSrX9qXWaCQK5YaDlP/71rBlk
         Pc7Bbqf2zQ/t0V6ydrSVc/wenYx9Lejb58XreUVnBS2N1shdwbiMHqOSgb7JTQEDoIOp
         CJqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wSY1KNrsEzDWYatM0ZrxRoCpvrDbm9YIr/BDATB7Pqw=;
        b=HyGzFt/Pvs/JMVLHbM4/MITPIFbSAB1dIEIK2bc2SDZ9ETbm1AafNAZeqUCwETdWIj
         xU9H9SHzYEn+1wNVWP+7qCsIy6Dmz/b4hZTGt0S27HVoiP6KMghO9/mPYadNyT+iKb0T
         r4O57K0OSFQnihMA5Zpavgd8GyTepHUS9aYzxf/uEAf1ZXrRobpG8U+HkAIhBMYT2EAY
         WFKdL9ap0cCzSv5eYWuV+kR5RUkhly8gCYmXd5SwUqWBaa0HbmW7KKPu0txF+6OF5BUb
         vtHw41hglHDHIU7z9WLrZ9xCzhOD9ZJa2PPdwRhaWlCooXsDv6q3MfORaeeg30lirhgb
         iRFQ==
X-Gm-Message-State: AOAM5307VJ3lgghFJy/AFmd8xAtIQ+UE5NJoNI0WDDeg9bNzK1APc05a
        TOfN08lICDqrWFVnk00gr1aUcov54fpx
X-Google-Smtp-Source: ABdhPJxt+lT/v+j6r2SlT/HpnRO+nFytFl5/UkG2qqPCe8rQATmQ2o05daXY+aFj0q3kVWDX+ZGYeA==
X-Received: by 2002:a63:f104:: with SMTP id f4mr8801166pgi.241.1617901542536;
        Thu, 08 Apr 2021 10:05:42 -0700 (PDT)
Received: from localhost.localdomain ([103.77.37.191])
        by smtp.gmail.com with ESMTPSA id y194sm65183pfb.21.2021.04.08.10.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Apr 2021 10:05:42 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     bjorn.andersson@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 13/15] ARM: dts: qcom: sdx55: Add basic devicetree support for Thundercomm T55
Date:   Thu,  8 Apr 2021 22:34:55 +0530
Message-Id: <20210408170457.91409-14-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
References: <20210408170457.91409-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thundercomm T55 is the development platform based on the Qualcomm SDX55
chipset. This basic support includes support for debug serial, NAND
flash, BAM DMA, USB and regulators support.

https://www.thundercomm.com/app_en/product/1593506006365532

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 arch/arm/boot/dts/Makefile           |   3 +-
 arch/arm/boot/dts/qcom-sdx55-t55.dts | 281 +++++++++++++++++++++++++++
 2 files changed, 283 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/qcom-sdx55-t55.dts

diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index 874ab2b66187..1d314fdf6014 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -930,7 +930,8 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8974-sony-xperia-honami.dtb \
 	qcom-mdm9615-wp8548-mangoh-green.dtb \
 	qcom-sdx55-mtp.dtb \
-	qcom-sdx55-telit-fn980-tlb.dtb
+	qcom-sdx55-telit-fn980-tlb.dtb \
+	qcom-sdx55-t55.dtb
 dtb-$(CONFIG_ARCH_RDA) += \
 	rda8810pl-orangepi-2g-iot.dtb \
 	rda8810pl-orangepi-i96.dtb
diff --git a/arch/arm/boot/dts/qcom-sdx55-t55.dts b/arch/arm/boot/dts/qcom-sdx55-t55.dts
new file mode 100644
index 000000000000..ddcd53aa533d
--- /dev/null
+++ b/arch/arm/boot/dts/qcom-sdx55-t55.dts
@@ -0,0 +1,281 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2021, Linaro Ltd.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include "qcom-sdx55.dtsi"
+#include "qcom-pmx55.dtsi"
+
+/ {
+	model = "Thundercomm T55 Development Kit";
+	compatible = "qcom,sdx55-t55", "qcom,sdx55";
+	qcom,board-id = <0xb010008 0x4>;
+
+	aliases {
+		serial0 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reserved-memory {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges;
+
+		mpss_debug_mem: memory@8ef00000 {
+			no-map;
+			reg = <0x8ef00000 0x800000>;
+		};
+
+		ipa_fw_mem: memory@8fced000 {
+			no-map;
+			reg = <0x8fced000 0x10000>;
+		};
+
+		mpss_adsp_mem: memory@90800000 {
+			no-map;
+			reg = <0x90800000 0xf800000>;
+		};
+	};
+
+	vph_pwr: vph-pwr-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "vph_pwr";
+		regulator-min-microvolt = <3700000>;
+		regulator-max-microvolt = <3700000>;
+	};
+
+	vreg_bob_3p3: pmx55-bob {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_bob_3p3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_s7e_mx_0p752: pmx55-s7e {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_s7e_mx_0p752";
+		regulator-min-microvolt = <752000>;
+		regulator-max-microvolt = <752000>;
+
+		vin-supply = <&vph_pwr>;
+	};
+
+	vreg_sd_vdd: sd-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vreg_sd_vdd";
+		regulator-min-microvolt = <2950000>;
+		regulator-max-microvolt = <2950000>;
+
+		vin-supply = <&vreg_vddpx_2>;
+	};
+
+	vreg_vddpx_2: vddpx-2 {
+		compatible = "regulator-gpio";
+		regulator-name = "vreg_vddpx_2";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <2850000>;
+		enable-gpios = <&tlmm 98 GPIO_ACTIVE_HIGH>;
+		gpios = <&tlmm 100 GPIO_ACTIVE_HIGH>;
+		states = <1800000 0>, <2850000 1>;
+		startup-delay-us = <200000>;
+		enable-active-high;
+		regulator-boot-on;
+
+		vin-supply = <&vph_pwr>;
+	};
+};
+
+&apps_rsc {
+	pmx55-rpmh-regulators {
+		compatible = "qcom,pmx55-rpmh-regulators";
+		qcom,pmic-id = "e";
+
+		vdd-s1-supply = <&vph_pwr>;
+		vdd-s2-supply = <&vph_pwr>;
+		vdd-s3-supply = <&vph_pwr>;
+		vdd-s4-supply = <&vph_pwr>;
+		vdd-s5-supply = <&vph_pwr>;
+		vdd-s6-supply = <&vph_pwr>;
+		vdd-s7-supply = <&vph_pwr>;
+		vdd-l1-l2-supply = <&vreg_s2e_1p224>;
+		vdd-l3-l9-supply = <&vreg_s3e_0p824>;
+		vdd-l4-l12-supply = <&vreg_s4e_1p904>;
+		vdd-l5-l6-supply = <&vreg_s4e_1p904>;
+		vdd-l7-l8-supply = <&vreg_s3e_0p824>;
+		vdd-l10-l11-l13-supply = <&vreg_bob_3p3>;
+		vdd-l14-supply = <&vreg_s7e_mx_0p752>;
+		vdd-l15-supply = <&vreg_s2e_1p224>;
+		vdd-l16-supply = <&vreg_s4e_1p904>;
+
+		vreg_s2e_1p224: smps2 {
+			regulator-min-microvolt = <1280000>;
+			regulator-max-microvolt = <1400000>;
+		};
+
+		vreg_s3e_0p824: smps3 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_s4e_1p904: smps4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1960000>;
+		};
+
+		vreg_l1e_bb_1p2: ldo1 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo2 {
+			regulator-min-microvolt = <1128000>;
+			regulator-max-microvolt = <1128000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo3 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l4e_bb_0p875: ldo4 {
+			regulator-min-microvolt = <872000>;
+			regulator-max-microvolt = <872000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l5e_bb_1p7: ldo5 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo7 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo8 {
+			regulator-min-microvolt = <480000>;
+			regulator-max-microvolt = <900000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo9 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		vreg_l10e_3p1: ldo10 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo11 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo12 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo13 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <2928000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo14 {
+			regulator-min-microvolt = <600000>;
+			regulator-max-microvolt = <800000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo15 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+
+		ldo16 {
+			regulator-min-microvolt = <1704000>;
+			regulator-max-microvolt = <1904000>;
+			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
+		};
+	};
+};
+
+&blsp1_uart3 {
+	status = "ok";
+};
+
+&qpic_bam {
+	status = "ok";
+};
+
+&qpic_nand {
+	status = "ok";
+
+	nand@0 {
+		reg = <0>;
+
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+		/* efs2 partition is secured */
+		secure-regions = <0x500000 0xb00000>;
+	};
+};
+
+&remoteproc_mpss {
+	status = "okay";
+	memory-region = <&mpss_adsp_mem>;
+};
+
+&usb_hsphy {
+	status = "okay";
+	vdda-pll-supply = <&vreg_l4e_bb_0p875>;
+	vdda33-supply = <&vreg_l10e_3p1>;
+	vdda18-supply = <&vreg_l5e_bb_1p7>;
+};
+
+&usb_qmpphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l4e_bb_0p875>;
+	vdda-pll-supply = <&vreg_l1e_bb_1p2>;
+};
+
+&usb {
+	status = "okay";
+};
+
+&usb_dwc3 {
+	dr_mode = "peripheral";
+};
-- 
2.25.1

