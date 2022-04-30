Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2ED7B515F2D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383076AbiD3Q1o (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383088AbiD3Q1n (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:27:43 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [5.144.164.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F65C5F8F0
        for <linux-arm-msm@vger.kernel.org>; Sat, 30 Apr 2022 09:24:16 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id 40D903F72C;
        Sat, 30 Apr 2022 18:24:14 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 14/14] arm64: dts: qcom: msm8998-mtp: Merge and fix up the DT
Date:   Sat, 30 Apr 2022 18:23:52 +0200
Message-Id: <20220430162353.607709-14-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220430162353.607709-1-konrad.dybcio@somainline.org>
References: <20220430162353.607709-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Merge the two DT files into one, sort the nodes and fix up a couple of style
incoherencies by adding some newlines, removing some, sorting properties etc.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/msm8998-mtp.dts  | 441 +++++++++++++++++++++-
 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi | 421 ---------------------
 2 files changed, 440 insertions(+), 422 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi

diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
index 66540d2ca13b..a9bdf06a6e5b 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/msm8998-mtp.dts
@@ -3,11 +3,450 @@
 
 /dts-v1/;
 
-#include "msm8998-mtp.dtsi"
+#include "msm8998.dtsi"
+#include "pm8005.dtsi"
+#include "pm8998.dtsi"
+#include "pmi8998.dtsi"
 
 / {
 	model = "Qualcomm Technologies, Inc. MSM8998 v1 MTP";
 	compatible = "qcom,msm8998-mtp";
 
 	qcom,board-id = <8 0>;
+
+	aliases {
+		serial0 = &blsp2_uart1;
+		serial1 = &blsp1_uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
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
+&blsp1_uart3 {
+	status = "okay";
+
+	bluetooth {
+		compatible = "qcom,wcn3990-bt";
+
+		vddio-supply = <&vreg_s4a_1p8>;
+		vddxo-supply = <&vreg_l7a_1p8>;
+		vddrf-supply = <&vreg_l17a_1p3>;
+		vddch0-supply = <&vreg_l25a_3p3>;
+		max-speed = <3200000>;
+	};
+};
+
+&blsp1_uart3_on {
+	rx {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-up on 45 (RX). This is needed to
+		 * avoid garbage data when the TX pin of the Bluetooth
+		 * module is in tri-state (module powered off or not
+		 * driving the signal yet).
+		 */
+		bias-pull-up;
+	};
+
+	cts {
+		/delete-property/ bias-disable;
+		/*
+		 * Configure a pull-down on 47 (CTS) to match the pull
+		 * of the Bluetooth module.
+		 */
+		bias-pull-down;
+	};
+};
+
+&blsp2_uart1 {
+	status = "okay";
+};
+
+&etf {
+	status = "okay";
+};
+
+&etm1 {
+	status = "okay";
+};
+
+&etm2 {
+	status = "okay";
+};
+
+&etm3 {
+	status = "okay";
+};
+
+&etm4 {
+	status = "okay";
+};
+
+&etm5 {
+	status = "okay";
+};
+
+&etm6 {
+	status = "okay";
+};
+
+&etm7 {
+	status = "okay";
+};
+
+&etm8 {
+	status = "okay";
+};
+
+&etr {
+	status = "okay";
+};
+
+&funnel1 {
+	status = "okay";
+};
+
+&funnel2 {
+	status = "okay";
+};
+
+&funnel3 {
+	status = "okay";
+};
+
+&funnel4 {
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
+};
+
+&funnel5 {
+	// FIXME: Figure out why clock late_initcall crashes the board with
+	// this enabled.
+	// status = "okay";
+};
+
+&pcie0 {
+	status = "okay";
+};
+
+&pcie_phy {
+	status = "okay";
+};
+
+&pm8005_regulators {
+	vdd_s1-supply = <&vph_pwr>;
+
+	pm8005_s1: s1 { /* VDD_GFX supply */
+		regulator-min-microvolt = <524000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-enable-ramp-delay = <500>;
+
+		/* Hack until we rig up the gpu consumer */
+		regulator-always-on;
+	};
+};
+
+&qusb2phy {
+	status = "okay";
+
+	vdda-pll-supply = <&vreg_l12a_1p8>;
+	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
+};
+
+&replicator1 {
+	status = "okay";
+};
+
+&rpm_requests {
+	pm8998-regulators {
+		compatible = "qcom,rpm-pm8998-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_s2-supply = <&vph_pwr>;
+		vdd_s3-supply = <&vph_pwr>;
+		vdd_s4-supply = <&vph_pwr>;
+		vdd_s5-supply = <&vph_pwr>;
+		vdd_s6-supply = <&vph_pwr>;
+		vdd_s7-supply = <&vph_pwr>;
+		vdd_s8-supply = <&vph_pwr>;
+		vdd_s9-supply = <&vph_pwr>;
+		vdd_s10-supply = <&vph_pwr>;
+		vdd_s11-supply = <&vph_pwr>;
+		vdd_s12-supply = <&vph_pwr>;
+		vdd_s13-supply = <&vph_pwr>;
+		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
+		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
+		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
+		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
+		vdd_l6-supply = <&vreg_s5a_2p04>;
+		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
+		vdd_l9-supply = <&vreg_bob>;
+		vdd_l10_l23_l25-supply = <&vreg_bob>;
+		vdd_l13_l19_l21-supply = <&vreg_bob>;
+		vdd_l16_l28-supply = <&vreg_bob>;
+		vdd_l18_l22-supply = <&vreg_bob>;
+		vdd_l20_l24-supply = <&vreg_bob>;
+		vdd_l26-supply = <&vreg_s3a_1p35>;
+		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
+
+		vreg_s3a_1p35: s3 {
+			regulator-min-microvolt = <1352000>;
+			regulator-max-microvolt = <1352000>;
+		};
+
+		vreg_s4a_1p8: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_s5a_2p04: s5 {
+			regulator-min-microvolt = <1904000>;
+			regulator-max-microvolt = <2040000>;
+		};
+
+		vreg_s7a_1p025: s7 {
+			regulator-min-microvolt = <900000>;
+			regulator-max-microvolt = <1028000>;
+		};
+
+		vreg_l1a_0p875: l1 {
+			regulator-min-microvolt = <880000>;
+			regulator-max-microvolt = <880000>;
+		};
+
+		vreg_l2a_1p2: l2 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l3a_1p0: l3 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_l5a_0p8: l5 {
+			regulator-min-microvolt = <800000>;
+			regulator-max-microvolt = <800000>;
+		};
+
+		vreg_l6a_1p8: l6 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <1808000>;
+		};
+
+		vreg_l7a_1p8: l7 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l8a_1p2: l8 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l11a_1p0: l11 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l13a_2p95: l13 {
+			regulator-min-microvolt = <1808000>;
+			regulator-max-microvolt = <2960000>;
+		};
+
+		vreg_l14a_1p88: l14 {
+			regulator-min-microvolt = <1880000>;
+			regulator-max-microvolt = <1880000>;
+		};
+
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+
+		vreg_l17a_1p3: l17 {
+			regulator-min-microvolt = <1304000>;
+			regulator-max-microvolt = <1304000>;
+		};
+
+		vreg_l18a_2p7: l18 {
+			regulator-min-microvolt = <2704000>;
+			regulator-max-microvolt = <2704000>;
+		};
+
+		vreg_l19a_3p0: l19 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
+		};
+
+		vreg_l20a_2p95: l20 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l21a_2p95: l21 {
+			regulator-min-microvolt = <2960000>;
+			regulator-max-microvolt = <2960000>;
+			regulator-system-load = <800000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l22a_2p85: l22 {
+			regulator-min-microvolt = <2864000>;
+			regulator-max-microvolt = <2864000>;
+		};
+
+		vreg_l23a_3p3: l23 {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3312000>;
+		};
+
+		vreg_l24a_3p075: l24 {
+			regulator-min-microvolt = <3088000>;
+			regulator-max-microvolt = <3088000>;
+		};
+
+		vreg_l25a_3p3: l25 {
+			regulator-min-microvolt = <3104000>;
+			regulator-max-microvolt = <3312000>;
+		};
+
+		vreg_l26a_1p2: l26 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+		};
+
+		vreg_l28_3p0: l28 {
+			regulator-min-microvolt = <3008000>;
+			regulator-max-microvolt = <3008000>;
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
+
+	};
+
+	pmi8998-regulators {
+		compatible = "qcom,rpm-pmi8998-regulators";
+
+		vdd_bob-supply = <&vph_pwr>;
+
+		vreg_bob: bob {
+			regulator-min-microvolt = <3312000>;
+			regulator-max-microvolt = <3600000>;
+		};
+	};
+};
+
+&remoteproc_adsp {
+	status = "okay";
+};
+
+&remoteproc_mss {
+	status = "okay";
+};
+
+&remoteproc_slpi {
+	status = "okay";
+};
+
+&tlmm {
+	gpio-reserved-ranges = <0 4>, <81 4>;
+};
+
+&sdhc2 {
+	status = "okay";
+	cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sdc2_on &sdc2_cd>;
+	pinctrl-1 = <&sdc2_off &sdc2_cd>;
+};
+
+&stm {
+	status = "okay";
+};
+
+&ufshc {
+	status = "okay";
+	vcc-supply = <&vreg_l20a_2p95>;
+	vccq-supply = <&vreg_l26a_1p2>;
+	vccq2-supply = <&vreg_s4a_1p8>;
+	vcc-max-microamp = <750000>;
+	vccq-max-microamp = <560000>;
+	vccq2-max-microamp = <750000>;
+};
+
+&ufsphy {
+	status = "okay";
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
+	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
+};
+
+&usb3 {
+	status = "okay";
+};
+
+&usb3_dwc3 {
+	dr_mode = "host"; /* Force to host until we have Type-C hooked up */
+};
+
+&usb3phy {
+	status = "okay";
+
+	vdda-phy-supply = <&vreg_l1a_0p875>;
+	vdda-pll-supply = <&vreg_l2a_1p2>;
+};
+
+&wifi {
+	status = "okay";
+
+	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
+	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
+	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
+	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
deleted file mode 100644
index 9d505a2a2652..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8998-mtp.dtsi
+++ /dev/null
@@ -1,421 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/* Copyright (c) 2016, The Linux Foundation. All rights reserved. */
-
-#include "msm8998.dtsi"
-#include "pm8005.dtsi"
-#include "pm8998.dtsi"
-#include "pmi8998.dtsi"
-
-/ {
-	aliases {
-		serial0 = &blsp2_uart1;
-		serial1 = &blsp1_uart3;
-	};
-
-	chosen {
-		stdout-path = "serial0:115200n8";
-	};
-
-	vph_pwr: vph-pwr-regulator {
-		compatible = "regulator-fixed";
-		regulator-name = "vph_pwr";
-		regulator-always-on;
-		regulator-boot-on;
-	};
-};
-
-&blsp1_uart3 {
-	status = "okay";
-
-	bluetooth {
-		compatible = "qcom,wcn3990-bt";
-
-		vddio-supply = <&vreg_s4a_1p8>;
-		vddxo-supply = <&vreg_l7a_1p8>;
-		vddrf-supply = <&vreg_l17a_1p3>;
-		vddch0-supply = <&vreg_l25a_3p3>;
-		max-speed = <3200000>;
-	};
-};
-
-&blsp2_uart1 {
-	status = "okay";
-};
-
-&etf {
-	status = "okay";
-};
-
-&etm1 {
-	status = "okay";
-};
-
-&etm2 {
-	status = "okay";
-};
-
-&etm3 {
-	status = "okay";
-};
-
-&etm4 {
-	status = "okay";
-};
-
-&etm5 {
-	status = "okay";
-};
-
-&etm6 {
-	status = "okay";
-};
-
-&etm7 {
-	status = "okay";
-};
-
-&etm8 {
-	status = "okay";
-};
-
-&etr {
-	status = "okay";
-};
-
-&funnel1 {
-	status = "okay";
-};
-
-&funnel2 {
-	status = "okay";
-};
-
-&funnel3 {
-	status = "okay";
-};
-
-&funnel4 {
-	// FIXME: Figure out why clock late_initcall crashes the board with
-	// this enabled.
-	// status = "okay";
-};
-
-&funnel5 {
-	// FIXME: Figure out why clock late_initcall crashes the board with
-	// this enabled.
-	// status = "okay";
-};
-
-&pcie0 {
-	status = "okay";
-};
-
-&pcie_phy {
-	status = "okay";
-};
-
-&pm8005_lsid1 {
-	pm8005-regulators {
-		compatible = "qcom,pm8005-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-
-		pm8005_s1: s1 { /* VDD_GFX supply */
-			regulator-min-microvolt = <524000>;
-			regulator-max-microvolt = <1100000>;
-			regulator-enable-ramp-delay = <500>;
-
-			/* hack until we rig up the gpu consumer */
-			regulator-always-on;
-		};
-	};
-};
-
-&qusb2phy {
-	status = "okay";
-
-	vdda-pll-supply = <&vreg_l12a_1p8>;
-	vdda-phy-dpdm-supply = <&vreg_l24a_3p075>;
-};
-
-&replicator1 {
-	status = "okay";
-};
-
-&rpm_requests {
-	pm8998-regulators {
-		compatible = "qcom,rpm-pm8998-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_s2-supply = <&vph_pwr>;
-		vdd_s3-supply = <&vph_pwr>;
-		vdd_s4-supply = <&vph_pwr>;
-		vdd_s5-supply = <&vph_pwr>;
-		vdd_s6-supply = <&vph_pwr>;
-		vdd_s7-supply = <&vph_pwr>;
-		vdd_s8-supply = <&vph_pwr>;
-		vdd_s9-supply = <&vph_pwr>;
-		vdd_s10-supply = <&vph_pwr>;
-		vdd_s11-supply = <&vph_pwr>;
-		vdd_s12-supply = <&vph_pwr>;
-		vdd_s13-supply = <&vph_pwr>;
-		vdd_l1_l27-supply = <&vreg_s7a_1p025>;
-		vdd_l2_l8_l17-supply = <&vreg_s3a_1p35>;
-		vdd_l3_l11-supply = <&vreg_s7a_1p025>;
-		vdd_l4_l5-supply = <&vreg_s7a_1p025>;
-		vdd_l6-supply = <&vreg_s5a_2p04>;
-		vdd_l7_l12_l14_l15-supply = <&vreg_s5a_2p04>;
-		vdd_l9-supply = <&vreg_bob>;
-		vdd_l10_l23_l25-supply = <&vreg_bob>;
-		vdd_l13_l19_l21-supply = <&vreg_bob>;
-		vdd_l16_l28-supply = <&vreg_bob>;
-		vdd_l18_l22-supply = <&vreg_bob>;
-		vdd_l20_l24-supply = <&vreg_bob>;
-		vdd_l26-supply = <&vreg_s3a_1p35>;
-		vdd_lvs1_lvs2-supply = <&vreg_s4a_1p8>;
-
-		vreg_s3a_1p35: s3 {
-			regulator-min-microvolt = <1352000>;
-			regulator-max-microvolt = <1352000>;
-		};
-		vreg_s4a_1p8: s4 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-		};
-		vreg_s5a_2p04: s5 {
-			regulator-min-microvolt = <1904000>;
-			regulator-max-microvolt = <2040000>;
-		};
-		vreg_s7a_1p025: s7 {
-			regulator-min-microvolt = <900000>;
-			regulator-max-microvolt = <1028000>;
-		};
-		vreg_l1a_0p875: l1 {
-			regulator-min-microvolt = <880000>;
-			regulator-max-microvolt = <880000>;
-		};
-		vreg_l2a_1p2: l2 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-		vreg_l3a_1p0: l3 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-		vreg_l5a_0p8: l5 {
-			regulator-min-microvolt = <800000>;
-			regulator-max-microvolt = <800000>;
-		};
-		vreg_l6a_1p8: l6 {
-			regulator-min-microvolt = <1808000>;
-			regulator-max-microvolt = <1808000>;
-		};
-		vreg_l7a_1p8: l7 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l8a_1p2: l8 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-		vreg_l9a_1p8: l9 {
-			regulator-min-microvolt = <1808000>;
-			regulator-max-microvolt = <2960000>;
-		};
-		vreg_l10a_1p8: l10 {
-			regulator-min-microvolt = <1808000>;
-			regulator-max-microvolt = <2960000>;
-		};
-		vreg_l11a_1p0: l11 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-		vreg_l12a_1p8: l12 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l13a_2p95: l13 {
-			regulator-min-microvolt = <1808000>;
-			regulator-max-microvolt = <2960000>;
-		};
-		vreg_l14a_1p88: l14 {
-			regulator-min-microvolt = <1880000>;
-			regulator-max-microvolt = <1880000>;
-		};
-		vreg_l15a_1p8: l15 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-		vreg_l16a_2p7: l16 {
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-		};
-		vreg_l17a_1p3: l17 {
-			regulator-min-microvolt = <1304000>;
-			regulator-max-microvolt = <1304000>;
-		};
-		vreg_l18a_2p7: l18 {
-			regulator-min-microvolt = <2704000>;
-			regulator-max-microvolt = <2704000>;
-		};
-		vreg_l19a_3p0: l19 {
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3008000>;
-		};
-		vreg_l20a_2p95: l20 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-allow-set-load;
-		};
-		vreg_l21a_2p95: l21 {
-			regulator-min-microvolt = <2960000>;
-			regulator-max-microvolt = <2960000>;
-			regulator-allow-set-load;
-			regulator-system-load = <800000>;
-		};
-		vreg_l22a_2p85: l22 {
-			regulator-min-microvolt = <2864000>;
-			regulator-max-microvolt = <2864000>;
-		};
-		vreg_l23a_3p3: l23 {
-			regulator-min-microvolt = <3312000>;
-			regulator-max-microvolt = <3312000>;
-		};
-		vreg_l24a_3p075: l24 {
-			regulator-min-microvolt = <3088000>;
-			regulator-max-microvolt = <3088000>;
-		};
-		vreg_l25a_3p3: l25 {
-			regulator-min-microvolt = <3104000>;
-			regulator-max-microvolt = <3312000>;
-		};
-		vreg_l26a_1p2: l26 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-allow-set-load;
-		};
-		vreg_l28_3p0: l28 {
-			regulator-min-microvolt = <3008000>;
-			regulator-max-microvolt = <3008000>;
-		};
-
-		vreg_lvs1a_1p8: lvs1 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_lvs2a_1p8: lvs2 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-	};
-
-	pmi8998-regulators {
-		compatible = "qcom,rpm-pmi8998-regulators";
-
-		vdd_bob-supply = <&vph_pwr>;
-
-		vreg_bob: bob {
-			regulator-min-microvolt = <3312000>;
-			regulator-max-microvolt = <3600000>;
-		};
-	};
-};
-
-&remoteproc_adsp {
-	status = "okay";
-};
-
-&remoteproc_mss {
-	status = "okay";
-};
-
-&remoteproc_slpi {
-	status = "okay";
-};
-
-&tlmm {
-	gpio-reserved-ranges = <0 4>, <81 4>;
-};
-
-&sdhc2 {
-	status = "okay";
-	cd-gpios = <&tlmm 95 GPIO_ACTIVE_LOW>;
-
-	vmmc-supply = <&vreg_l21a_2p95>;
-	vqmmc-supply = <&vreg_l13a_2p95>;
-
-	pinctrl-names = "default", "sleep";
-	pinctrl-0 = <&sdc2_on &sdc2_cd>;
-	pinctrl-1 = <&sdc2_off &sdc2_cd>;
-};
-
-&stm {
-	status = "okay";
-};
-
-&ufshc {
-	status = "okay";
-	vcc-supply = <&vreg_l20a_2p95>;
-	vccq-supply = <&vreg_l26a_1p2>;
-	vccq2-supply = <&vreg_s4a_1p8>;
-	vcc-max-microamp = <750000>;
-	vccq-max-microamp = <560000>;
-	vccq2-max-microamp = <750000>;
-};
-
-&ufsphy {
-	status = "okay";
-	vdda-phy-supply = <&vreg_l1a_0p875>;
-	vdda-pll-supply = <&vreg_l2a_1p2>;
-	vddp-ref-clk-supply = <&vreg_l26a_1p2>;
-};
-
-&usb3 {
-	status = "okay";
-};
-
-&usb3_dwc3 {
-	dr_mode = "host"; /* Force to host until we have Type-C hooked up */
-};
-
-&usb3phy {
-	status = "okay";
-
-	vdda-phy-supply = <&vreg_l1a_0p875>;
-	vdda-pll-supply = <&vreg_l2a_1p2>;
-};
-
-&wifi {
-	status = "okay";
-
-	vdd-0.8-cx-mx-supply = <&vreg_l5a_0p8>;
-	vdd-1.8-xo-supply = <&vreg_l7a_1p8>;
-	vdd-1.3-rfa-supply = <&vreg_l17a_1p3>;
-	vdd-3.3-ch0-supply = <&vreg_l25a_3p3>;
-};
-
-/* PINCTRL - board-specific pinctrl */
-&blsp1_uart3_on {
-	rx {
-		/delete-property/ bias-disable;
-		/*
-		 * Configure a pull-up on 45 (RX). This is needed to
-		 * avoid garbage data when the TX pin of the Bluetooth
-		 * module is in tri-state (module powered off or not
-		 * driving the signal yet).
-		 */
-		bias-pull-up;
-	};
-
-	cts {
-		/delete-property/ bias-disable;
-		/*
-		 * Configure a pull-down on 47 (CTS) to match the pull
-		 * of the Bluetooth module.
-		 */
-		bias-pull-down;
-	};
-};
-- 
2.35.2

