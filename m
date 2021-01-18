Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7FF6B2FA614
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Jan 2021 17:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406655AbhARQ0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Jan 2021 11:26:10 -0500
Received: from relay02.th.seeweb.it ([5.144.164.163]:52243 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2406665AbhARQZw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Jan 2021 11:25:52 -0500
Received: from localhost.localdomain (abaf224.neoplus.adsl.tpnet.pl [83.6.169.224])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 500AB1FD04;
        Mon, 18 Jan 2021 17:25:03 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 05/11] arm64: dts: qcom: msm/apq8994-kitakami: Add regulator config
Date:   Mon, 18 Jan 2021 17:24:25 +0100
Message-Id: <20210118162432.107275-5-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118162432.107275-1-konrad.dybcio@somainline.org>
References: <20210118162432.107275-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add regulator config for all Kitakami devices, commonizing where
applicable.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 ...q8094-sony-xperia-kitakami-karin_windy.dts |   3 +
 .../qcom/msm8994-sony-xperia-kitakami-ivy.dts |  13 +
 .../msm8994-sony-xperia-kitakami-karin.dts    |  22 ++
 .../msm8994-sony-xperia-kitakami-satsuki.dts  |   5 +
 .../msm8994-sony-xperia-kitakami-sumire.dts   |   2 +
 .../msm8994-sony-xperia-kitakami-suzuran.dts  |   7 +
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 304 ++++++++++++++----
 7 files changed, 297 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
index 60497457a555..a8dffc8c64ea 100644
--- a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
+++ b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
@@ -18,3 +18,6 @@ / {
 	 */
 	qcom,msm-id = <253 0x20000>, <253 0x20001>;
 };
+
+/delete-node/ &pm8994_l1;
+/delete-node/ &pm8994_l19;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
index 4c7a90987f08..b5e90c85aaf6 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
@@ -11,3 +11,16 @@ / {
 	model = "Sony Xperia Z3+/Z4";
 	compatible = "sony,ivy-row", "qcom,msm8994";
 };
+
+&pm8994_l3 {
+	regulator-min-microvolt = <1000000>;
+	regulator-max-microvolt = <1000000>;
+};
+
+&pm8994_l17 {
+	regulator-min-microvolt = <2700000>;
+	regulator-max-microvolt = <2700000>;
+};
+
+/delete-node/ &pm8994_l19;
+/delete-node/ &pm8994_l32;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
index 7e657861387b..743a2a076552 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -19,3 +19,25 @@ &blsp_i2c5 {
 	 * sii8620 HDMI/MHL bridge @ 72 (kitakami-common)
 	 */
 };
+
+&pm8994_l3 {
+	regulator-min-microvolt = <1050000>;
+	regulator-max-microvolt = <1050000>;
+};
+
+&pm8994_l17 {
+	regulator-min-microvolt = <2700000>;
+	regulator-max-microvolt = <2700000>;
+};
+
+&pm8994_l22 {
+	regulator-min-microvolt = <3100000>;
+	regulator-max-microvolt = <3100000>;
+};
+
+&pm8994_l25 {
+	regulator-min-microvolt = <1037500>;
+	regulator-max-microvolt = <1037500>;
+};
+
+/delete-node/ &pm8994_l32;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
index 1081fe6a4d67..1385956a69f3 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
@@ -11,3 +11,8 @@ / {
 	model = "Sony Xperia Z5 Premium";
 	compatible = "sony,satsuki-row", "qcom,msm8994";
 };
+
+&pm8994_l14 {
+	regulator-min-microvolt = <1850000>;
+	regulator-max-microvolt = <1850000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
index 5d6bbbf6c119..868a2c9d6496 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -11,3 +11,5 @@ / {
 	model = "Sony Xperia Z5";
 	compatible = "sony,sumire-row", "qcom,msm8994";
 };
+
+/delete-node/ &pm8994_l19;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
index 2c670ab28613..f129479bbf95 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
@@ -11,3 +11,10 @@ / {
 	model = "Sony Xperia Z5 Compact";
 	compatible = "sony,suzuran-row", "qcom,msm8994";
 };
+
+&pm8994_l14 {
+	regulator-min-microvolt = <2000000>;
+	regulator-max-microvolt = <2000000>;
+};
+
+/delete-node/ &pm8994_l19;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 71d7187eb090..e31c31c2b936 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -161,59 +161,233 @@ &blsp2_uart2 {
 &rpm_requests {
 	pm8994_regulators: pm8994-regulators {
 		compatible = "qcom,rpm-pm8994-regulators";
-		vdd_l1-supply = <&pm8994_s1>;
-		vdd_l2_26_28-supply = <&pm8994_s3>;
-		vdd_l3_11-supply = <&pm8994_s3>;
-		vdd_l4_27_31-supply = <&pm8994_s3>;
-		vdd_l5_7-supply = <&pm8994_s3>;
-		vdd_l6_12_32-supply = <&pm8994_s5>;
-		vdd_l8_16_30-supply = <&vreg_vph_pwr>;
-		vdd_l9_10_18_22-supply = <&vreg_vph_pwr>;
-		vdd_l13_19_23_24-supply = <&vreg_vph_pwr>;
-		vdd_l14_15-supply = <&pm8994_s5>;
-		vdd_l17_29-supply = <&vreg_vph_pwr>;
-		vdd_l20_21-supply = <&vreg_vph_pwr>;
-		vdd_l25-supply = <&pm8994_s5>;
-		vdd_lvs1_2 = <&pm8994_s4>;
-
-		pm8994_s1: s1 {};
-		pm8994_s2: s2 {};
-		pm8994_s3: s3 {};
-		pm8994_s4: s4 {};
-		pm8994_s5: s5 {};
-		pm8994_s6: s6 {};
-		pm8994_s7: s7 {};
-
-		pm8994_l1: l1 {};
-		pm8994_l2: l2 {};
-		pm8994_l3: l3 {};
-		pm8994_l4: l4 {};
-		pm8994_l6: l6 {};
-		pm8994_l8: l8 {};
-		pm8994_l9: l9 {};
-		pm8994_l10: l10 {};
-		pm8994_l11: l11 {};
-		pm8994_l12: l12 {};
-		pm8994_l13: l13 {};
-		pm8994_l14: l14 {};
-		pm8994_l15: l15 {};
-		pm8994_l16: l16 {};
-		pm8994_l17: l17 {};
-		pm8994_l18: l18 {};
-		pm8994_l19: l19 {};
-		pm8994_l20: l20 {};
-		pm8994_l21: l21 {};
-		pm8994_l22: l22 {};
-		pm8994_l23: l23 {};
-		pm8994_l24: l24 {};
-		pm8994_l25: l25 {};
-		pm8994_l26: l26 {};
-		pm8994_l27: l27 {};
-		pm8994_l28: l28 {};
-		pm8994_l29: l29 {};
-		pm8994_l30: l30 {};
-		pm8994_l31: l31 {};
-		pm8994_l32: l32 {};
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
+		vdd_l1-supply = <&pmi8994_s1>;
+		vdd_l2_l26_l28-supply = <&pm8994_s3>;
+		vdd_l3_l11-supply = <&pm8994_s3>;
+		vdd_l4_l27_l31-supply = <&pm8994_s3>;
+		vdd_l5_l7-supply = <&pm8994_s5>;
+		vdd_l6_l12_l32-supply = <&pm8994_s5>;
+		vdd_l8_l16_l30-supply = <&vph_pwr>;
+		vdd_l9_l10_l18_l22-supply = <&pmi8994_bby>;
+		vdd_l13_l19_l23_l24-supply = <&pmi8994_bby>;
+		vdd_l14_l15-supply = <&pm8994_s5>;
+		vdd_l17_l29-supply = <&pmi8994_bby>;
+		vdd_l20_l21-supply = <&pmi8994_bby>;
+		vdd_l25-supply = <&pm8994_s3>;
+		vdd_lvs1_lvs2-supply = <&pm8994_s4>;
+
+		/* S1, S2, S6 and S12 are managed by RPMPD */
+
+		pm8994_s3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+		};
+
+		pm8994_s4: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-always-on;
+			regulator-system-load = <325000>;
+		};
+
+		pm8994_s5: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+		};
+
+		pm8994_s7: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		/*
+		 * S8 - SPMI-managed VDD_APC0
+		 * S9, S10 and S11 (the main one) - SPMI-managed VDD_APC1
+		 */
+
+		pm8994_l1: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l2: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-allow-set-load;
+			regulator-system-load = <10000>;
+		};
+
+		pm8994_l3: l3 {
+			regulator-min-microvolt = <1100000>;
+			regulator-max-microvolt = <1100000>;
+		};
+
+		pm8994_l4: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		/* L5 is inaccessible from RPM */
+
+		pm8994_l6: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		/* L7 is inaccessible from RPM */
+
+		pm8994_l8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l9: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l10: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l11: l11 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l12: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-system-load = <10000>;
+		};
+
+		pm8994_l13: l13 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <2950000>;
+		};
+
+		pm8994_l14: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-system-load = <10000>;
+		};
+
+		pm8994_l15: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l16: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l17: l17 {
+			regulator-min-microvolt = <2200000>;
+			regulator-max-microvolt = <2200000>;
+		};
+
+		pm8994_l18: l18 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+		};
+
+		pm8994_l19: l19 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+		};
+
+		pm8994_l20: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-system-load = <570000>;
+		};
+
+		pm8994_l21: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+		};
+
+		pm8994_l22: l22 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+		};
+
+		pm8994_l23: l23 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+		};
+
+		pm8994_l24: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3150000>;
+		};
+
+		pm8994_l25: l25 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		pm8994_l26: l26 {
+			regulator-min-microvolt = <987500>;
+			regulator-max-microvolt = <987500>;
+		};
+
+		pm8994_l27: l27 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+		};
+
+		pm8994_l28: l28 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-allow-set-load;
+			regulator-system-load = <10000>;
+		};
+
+		pm8994_l29: l29 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		pm8994_l30: l30 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		pm8994_l31: l31 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-allow-set-load;
+			regulator-system-load = <10000>;
+		};
+
+		pm8994_l32: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
 
 		pm8994_lvs1: lvs1 {};
 		pm8994_lvs2: lvs2 {};
@@ -222,22 +396,34 @@ pm8994_regulators: pm8994-regulators {
 	pmi8994_regulators: pmi8994-regulators {
 		compatible = "qcom,rpm-pmi8994-regulators";
 
-		pmi8994_s1: s1 {};
-		pmi8994_s2: s2 {};
-		pmi8994_s3: s3 {};
-		pmi8994_bby: boost-bypass {};
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		pmi8994_s1: s1 {
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		/* S2 & S3 - VDD_GFX */
+
+		pmi8994_bby: boost-bypass {
+			regulator-min-microvolt = <3150000>;
+			regulator-max-microvolt = <3600000>;
+		};
 	};
 };
 
 &sdhc1 {
-	/* There is an issue with the eMMC causing permanent
+	/*
+	 * There is an issue with the eMMC causing permanent
 	 * damage to the card if a quirk isn't addressed.
 	 * Until it's fixed, disable the MMC so as not to brick
 	 * devices.
 	 */
 	status = "disabled";
 
-	/* Downstream pushes 2.95V to the sdhci device,
+	/*
+	 * Downstream pushes 2.95V to the sdhci device,
 	 * but upstream driver REALLY wants to make vmmc 1.8v
 	 * cause of the hs400-1_8v mode. MMC works fine without
 	 * that regulator, so let's not use it for now.
-- 
2.29.2

