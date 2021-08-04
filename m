Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5880D3E0199
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Aug 2021 15:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238290AbhHDNE2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Aug 2021 09:04:28 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:30033 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237040AbhHDNE0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Aug 2021 09:04:26 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628082254; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=jg2S+e24+nFM9SFhu8c8HQXKG6FsVjRCt/knshH0txY=; b=jdD8AO/71eDQ3vYrgEhhwudV3E+3nkzZZd0hj9a0++2virLAUMftkd8Cw6Jf7WZ+sR+ZT884
 sx85OsE3s5Wq9AXE1q/HiZ1oafZSs7KptwseSsmumgUvyxjt7GRwtm3C9ZfVBLJu82VWAd7B
 BcGJd6fnDgkEHfKJ5WQOZ5XZM6E=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 610a903f1b76afb446225620 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Aug 2021 13:03:59
 GMT
Sender: rnayak=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3CB2FC433F1; Wed,  4 Aug 2021 13:03:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-173.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CDA8BC43460;
        Wed,  4 Aug 2021 13:03:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CDA8BC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=rnayak@codeaurora.org
From:   Rajendra Nayak <rnayak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, skakit@codeaurora.org,
        konrad.dybcio@somainline.org, swboyd@chromium.org,
        dianders@chromium.org, mka@chromium.org,
        Rajendra Nayak <rnayak@codeaurora.org>
Subject: [PATCH v2 2/2] arm64: dts: qcom: sc7280-idp: Add device tree files for IDP2
Date:   Wed,  4 Aug 2021 18:33:19 +0530
Message-Id: <1628082199-17002-3-git-send-email-rnayak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1628082199-17002-1-git-send-email-rnayak@codeaurora.org>
References: <1628082199-17002-1-git-send-email-rnayak@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move all the common device tree bits for both sc7280 IDPs into a
sc7280-idp.dtsi and create 2 different dts files (sc7280-idp.dts
and sc7280-idp2.dts) in order to manage differences across the
IDP SKU1 and SKU2 Boards.
PMR735A is present on IDP board only and is not present on IDP2.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 arch/arm64/boot/dts/qcom/sc7280-idp.dts            | 328 +--------------------
 .../dts/qcom/{sc7280-idp.dts => sc7280-idp.dtsi}   |  55 +---
 arch/arm64/boot/dts/qcom/sc7280-idp2.dts           |  23 ++
 4 files changed, 27 insertions(+), 380 deletions(-)
 copy arch/arm64/boot/dts/qcom/{sc7280-idp.dts => sc7280-idp.dtsi} (84%)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-idp2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index a571bfdd..50cf2cf 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -61,6 +61,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-pompom-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-idp2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-discovery.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-nile-pioneer.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
index ee76d96..8390b88 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
@@ -7,17 +7,12 @@
 
 /dts-v1/;
 
-#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
-#include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
-#include "sc7280.dtsi"
-#include "pm7325.dtsi"
+#include "sc7280-idp.dtsi"
 #include "pmr735a.dtsi"
-#include "pm8350c.dtsi"
-#include "pmk8350.dtsi"
 
 / {
-	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
+	model = "Qualcomm Technologies, Inc. sc7280 IDP SKU1 platform";
 	compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
 
 	aliases {
@@ -30,186 +25,6 @@
 };
 
 &apps_rsc {
-	pm7325-regulators {
-		compatible = "qcom,pm7325-rpmh-regulators";
-		qcom,pmic-id = "b";
-
-		vreg_s1b_1p8: smps1 {
-			regulator-min-microvolt = <1856000>;
-			regulator-max-microvolt = <2040000>;
-		};
-
-		vreg_s7b_0p9: smps7 {
-			regulator-min-microvolt = <535000>;
-			regulator-max-microvolt = <1120000>;
-		};
-
-		vreg_s8b_1p2: smps8 {
-			regulator-min-microvolt = <1256000>;
-			regulator-max-microvolt = <1500000>;
-		};
-
-		vreg_l1b_0p8: ldo1 {
-			regulator-min-microvolt = <825000>;
-			regulator-max-microvolt = <925000>;
-		};
-
-		vreg_l2b_3p0: ldo2 {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
-		};
-
-		vreg_l6b_1p2: ldo6 {
-			regulator-min-microvolt = <1140000>;
-			regulator-max-microvolt = <1260000>;
-		};
-
-		vreg_l7b_2p9: ldo7 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-		};
-
-		vreg_l8b_0p9: ldo8 {
-			regulator-min-microvolt = <870000>;
-			regulator-max-microvolt = <970000>;
-		};
-
-		vreg_l9b_1p2: ldo9 {
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1304000>;
-		};
-
-		vreg_l11b_1p7: ldo11 {
-			regulator-min-microvolt = <1504000>;
-			regulator-max-microvolt = <2000000>;
-		};
-
-		vreg_l12b_0p8: ldo12 {
-			regulator-min-microvolt = <751000>;
-			regulator-max-microvolt = <824000>;
-		};
-
-		vreg_l13b_0p8: ldo13 {
-			regulator-min-microvolt = <530000>;
-			regulator-max-microvolt = <824000>;
-		};
-
-		vreg_l14b_1p2: ldo14 {
-			regulator-min-microvolt = <1080000>;
-			regulator-max-microvolt = <1304000>;
-		};
-
-		vreg_l15b_0p8: ldo15 {
-			regulator-min-microvolt = <765000>;
-			regulator-max-microvolt = <1020000>;
-		};
-
-		vreg_l16b_1p2: ldo16 {
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1300000>;
-		};
-
-		vreg_l17b_1p8: ldo17 {
-			regulator-min-microvolt = <1700000>;
-			regulator-max-microvolt = <1900000>;
-		};
-
-		vreg_l18b_1p8: ldo18 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2000000>;
-		};
-
-		vreg_l19b_1p8: ldo19 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-	};
-
-	pm8350c-regulators {
-		compatible = "qcom,pm8350c-rpmh-regulators";
-		qcom,pmic-id = "c";
-
-		vreg_s1c_2p2: smps1 {
-			regulator-min-microvolt = <2190000>;
-			regulator-max-microvolt = <2210000>;
-		};
-
-		vreg_s9c_1p0: smps9 {
-			regulator-min-microvolt = <1010000>;
-			regulator-max-microvolt = <1170000>;
-		};
-
-		vreg_l1c_1p8: ldo1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1980000>;
-		};
-
-		vreg_l2c_1p8: ldo2 {
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <1980000>;
-		};
-
-		vreg_l3c_3p0: ldo3 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3540000>;
-		};
-
-		vreg_l4c_1p8: ldo4 {
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		vreg_l5c_1p8: ldo5 {
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <3300000>;
-		};
-
-		vreg_l6c_2p9: ldo6 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-		};
-
-		vreg_l7c_3p0: ldo7 {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3544000>;
-		};
-
-		vreg_l8c_1p8: ldo8 {
-			regulator-min-microvolt = <1620000>;
-			regulator-max-microvolt = <2000000>;
-		};
-
-		vreg_l9c_2p9: ldo9 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-		};
-
-		vreg_l10c_0p8: ldo10 {
-			regulator-min-microvolt = <720000>;
-			regulator-max-microvolt = <1050000>;
-		};
-
-		vreg_l11c_2p8: ldo11 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <3544000>;
-		};
-
-		vreg_l12c_1p8: ldo12 {
-			regulator-min-microvolt = <1650000>;
-			regulator-max-microvolt = <2000000>;
-		};
-
-		vreg_l13c_3p0: ldo13 {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <3544000>;
-		};
-
-		vreg_bob: bob {
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3960000>;
-		};
-	};
-
 	pmr735a-regulators {
 		compatible = "qcom,pmr735a-rpmh-regulators";
 		qcom,pmic-id = "e";
@@ -242,148 +57,9 @@
 };
 
 &pmk8350_vadc {
-	pmk8350_die_temp {
-		reg = <PMK8350_ADC7_DIE_TEMP>;
-		label = "pmk8350_die_temp";
-		qcom,pre-scaling = <1 1>;
-	};
-
 	pmr735a_die_temp {
 		reg = <PMR735A_ADC7_DIE_TEMP>;
 		label = "pmr735a_die_temp";
 		qcom,pre-scaling = <1 1>;
 	};
 };
-
-&qupv3_id_0 {
-	status = "okay";
-};
-
-&sdhc_1 {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc1_on>;
-	pinctrl-1 = <&sdc1_off>;
-
-	non-removable;
-	no-sd;
-	no-sdio;
-
-	vmmc-supply = <&vreg_l7b_2p9>;
-	vqmmc-supply = <&vreg_l19b_1p8>;
-};
-
-&sdhc_2 {
-	status = "okay";
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc2_on>;
-	pinctrl-1 = <&sdc2_off>;
-
-	vmmc-supply = <&vreg_l9c_2p9>;
-	vqmmc-supply = <&vreg_l6c_2p9>;
-
-	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
-};
-
-&uart5 {
-	status = "okay";
-};
-
-&usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
-	dr_mode = "host";
-};
-
-&usb_1_hsphy {
-	status = "okay";
-
-	vdda-pll-supply = <&vreg_l10c_0p8>;
-	vdda33-supply = <&vreg_l2b_3p0>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-};
-
-&usb_1_qmpphy {
-	status = "okay";
-
-	vdda-phy-supply = <&vreg_l6b_1p2>;
-	vdda-pll-supply = <&vreg_l1b_0p8>;
-};
-
-&usb_2 {
-	status = "okay";
-};
-
-&usb_2_dwc3 {
-	dr_mode = "peripheral";
-};
-
-&usb_2_hsphy {
-	status = "okay";
-
-	vdda-pll-supply = <&vreg_l10c_0p8>;
-	vdda33-supply = <&vreg_l2b_3p0>;
-	vdda18-supply = <&vreg_l1c_1p8>;
-};
-
-/* PINCTRL - additions to nodes defined in sc7280.dtsi */
-
-&qup_uart5_default {
-	tx {
-		pins = "gpio46";
-		drive-strength = <2>;
-		bias-disable;
-	};
-
-	rx {
-		pins = "gpio47";
-		drive-strength = <2>;
-		bias-pull-up;
-	};
-};
-
-&sdc1_on {
-	clk {
-		bias-disable;
-		drive-strength = <16>;
-	};
-
-	cmd {
-		bias-pull-up;
-		drive-strength = <10>;
-	};
-
-	data {
-		bias-pull-up;
-		drive-strength = <10>;
-	};
-
-	rclk {
-		bias-pull-down;
-	};
-};
-
-&sdc2_on {
-	clk {
-		bias-disable;
-		drive-strength = <16>;
-	};
-
-	cmd {
-		bias-pull-up;
-		drive-strength = <10>;
-	};
-
-	data {
-		bias-pull-up;
-		drive-strength = <10>;
-	};
-
-	sd-cd {
-		bias-pull-up;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
similarity index 84%
copy from arch/arm64/boot/dts/qcom/sc7280-idp.dts
copy to arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
index ee76d96..7a0baeb 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dtsi
@@ -1,34 +1,17 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * sc7280 IDP board device tree source
+ * sc7280 IDP board device tree source (common between SKU1 and SKU2)
  *
  * Copyright (c) 2021, The Linux Foundation. All rights reserved.
  */
 
-/dts-v1/;
-
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/iio/qcom,spmi-adc7-pmr735a.h>
 #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
 #include "sc7280.dtsi"
 #include "pm7325.dtsi"
-#include "pmr735a.dtsi"
 #include "pm8350c.dtsi"
 #include "pmk8350.dtsi"
 
-/ {
-	model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
-	compatible = "qcom,sc7280-idp", "google,senor", "qcom,sc7280";
-
-	aliases {
-		serial0 = &uart5;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-};
-
 &apps_rsc {
 	pm7325-regulators {
 		compatible = "qcom,pm7325-rpmh-regulators";
@@ -209,36 +192,6 @@
 			regulator-max-microvolt = <3960000>;
 		};
 	};
-
-	pmr735a-regulators {
-		compatible = "qcom,pmr735a-rpmh-regulators";
-		qcom,pmic-id = "e";
-
-		vreg_l2e_1p2: ldo2 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-
-		vreg_l3e_0p9: ldo3 {
-			regulator-min-microvolt = <912000>;
-			regulator-max-microvolt = <1020000>;
-		};
-
-		vreg_l4e_1p7: ldo4 {
-			regulator-min-microvolt = <1776000>;
-			regulator-max-microvolt = <1890000>;
-		};
-
-		vreg_l5e_0p8: ldo5 {
-			regulator-min-microvolt = <800000>;
-			regulator-max-microvolt = <800000>;
-		};
-
-		vreg_l6e_0p8: ldo6 {
-			regulator-min-microvolt = <480000>;
-			regulator-max-microvolt = <904000>;
-		};
-	};
 };
 
 &pmk8350_vadc {
@@ -247,12 +200,6 @@
 		label = "pmk8350_die_temp";
 		qcom,pre-scaling = <1 1>;
 	};
-
-	pmr735a_die_temp {
-		reg = <PMR735A_ADC7_DIE_TEMP>;
-		label = "pmr735a_die_temp";
-		qcom,pre-scaling = <1 1>;
-	};
 };
 
 &qupv3_id_0 {
diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp2.dts b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
new file mode 100644
index 0000000..1fc2add
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-idp2.dts
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * sc7280 IDP2 board device tree source
+ *
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "sc7280-idp.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. sc7280 IDP SKU2 platform";
+	compatible = "qcom,sc7280-idp2", "google,piglin", "qcom,sc7280";
+
+	aliases {
+		serial0 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

