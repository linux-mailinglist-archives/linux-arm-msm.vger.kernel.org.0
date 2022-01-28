Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E2A3949F0A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jan 2022 02:44:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345148AbiA1BoS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 20:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345143AbiA1BoH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 20:44:07 -0500
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15518C061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 17:44:07 -0800 (PST)
Received: by mail-ed1-x534.google.com with SMTP id n10so6634486edv.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 17:44:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2ahN5K88P4X/nGxY716dNxPODdD2BcTjilWrEV2o10=;
        b=pW/6AbQ3sH3YM9fCazaY0iOpYAqhV35DakupYDdIL5J7Oz2CdzKpeuGOas16Hjvj6V
         Fvz/CaeDPchwWKdDlJpVB69eeS/WQBJKRnA4ShgOEqtRNs+rggkd8ZnwZCSQ3O8kbFhR
         PWsJwO4HTYdyJHp3cpV6KJ2SmHcxrSaeGZebpousnRP7gqBYinWQhd+22Q+vpW5VA0aV
         IgZWKp5COCwrO85hln+n2BV5VfX/c5w6OgzwU1DiJzZK3IizUCfoR7MG+TCkmWwdhXNg
         Gq1Ppp4DsCbIutGWyj1BFZwRDRfLHmR7N6DB77MvGAePK+fmmra7olHPIAFEIytSXH8m
         nsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t2ahN5K88P4X/nGxY716dNxPODdD2BcTjilWrEV2o10=;
        b=xcSQp3XGGRiHyiwgpcgUBhLjW+I9TfuJ5qvCHSSzEW8dDRHRgMtCMlrpObRxY6+g0s
         xQi/wmybbHBxP37OJ1jYmQCNZixeFCD1EhAAM4NcxW4Ets4Rv6eY7FRwqrr4pdddbtUf
         1Pj8EKhXUHhMFJfMLIAwEU4g9kzA9z/9+El00o8JnxoP8EaqSzISP/f8mfpdFZRe86P3
         DW4Ph8689TMvhSs2pxW1tUQpmXVDIrc7vPU7jy0+klH08r+TK4L/3bxVxob/UmNLwibm
         iocWMLt2ATkGi1WWfxDIZ0f+TP3tDv8fm14Lijz4weUxrJGL+mB1iiigfDGvhD+mA5ZG
         Qgjw==
X-Gm-Message-State: AOAM531Yfne5s8AP5X4hozeMDB+vVpJAOSNe+MgVzDe13DhTQchgfHFP
        6tnbva6w1y1CTDPaR7gD5ppIX+rblD6aLRXY
X-Google-Smtp-Source: ABdhPJzDlJSBDz4kU5HISUf9rgSjJMqNntoCF6ONAZyj9fA1JzI+dgGUC/pZa1XeUihQ5FqASHTAYA==
X-Received: by 2002:aa7:c5cf:: with SMTP id h15mr6040568eds.352.1643334245361;
        Thu, 27 Jan 2022 17:44:05 -0800 (PST)
Received: from localhost.localdomain (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id gr24sm9214672ejb.185.2022.01.27.17.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jan 2022 17:44:04 -0800 (PST)
From:   Petr Vorel <petr.vorel@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Petr Vorel <petr.vorel@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Gustave Monce <gustave.monce@outlook.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH 1/2] arm64: dts: qcom: msm8994: Create common DTS for RPM
Date:   Fri, 28 Jan 2022 02:43:56 +0100
Message-Id: <20220128014357.262236-1-petr.vorel@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

from msm8994-msft-lumia-octagon.dtsi and reuse it in
msm8994-sony-xperia-kitakami.dtsi.

Configs were nearly the same, few
regulator-{allow-set-load,always-on,system-load = ...} are added to
kitakami now.

Use vreg_* names over pm8994_* as they are more widely used in qcom dts
although name is less readable.

Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
---
Hi all,

Konrad, can you please ack that these
regulator-{allow-set-load,always-on,system-load = ...} are ok to use for
kitakami? Or should I avoid them and just redefine them just in
msm8994-msft-lumia-octagon.dtsi? They are defined for s3, s5, l3, l6,
l11-14, l17-19, l22-25, l27-31 (in the end quite a lot of them - is that
the reason why they don't share code?).

I don't see these regulator-* definitions in downstream code for kitakami
(their downstream equivalents)
msm8994 general
https://github.com/LineageOS/android_kernel_sony_msm8994/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8994-regulator.dtsi
https://github.com/LineageOS/android_kernel_sony_msm8994/blob/cm-14.1/arch/arm/boot/dts/qcom/msm-pm8994-rpm-regulator.dtsi
kitakami specific
https://github.com/LineageOS/android_kernel_sony_msm8994/blob/cm-14.1/arch/arm/boot/dts/qcom/msm8994-kitakami_common.dtsi

vreg_* vs. pm8994_*:
$ git grep -l pm8994_[ls] |wc -l
8

$ git grep -l vreg_[ls] |wc -l
57

Kind regards,
Petr

 ...q8094-sony-xperia-kitakami-karin_windy.dts |   4 +-
 .../dts/qcom/msm8994-msft-lumia-octagon.dtsi  | 307 +----------------
 arch/arm64/boot/dts/qcom/msm8994-rpm.dtsi     | 311 ++++++++++++++++++
 .../qcom/msm8994-sony-xperia-kitakami-ivy.dts |   8 +-
 .../msm8994-sony-xperia-kitakami-karin.dts    |  10 +-
 .../msm8994-sony-xperia-kitakami-satsuki.dts  |   2 +-
 .../msm8994-sony-xperia-kitakami-sumire.dts   |   2 +-
 .../msm8994-sony-xperia-kitakami-suzuran.dts  |   4 +-
 .../qcom/msm8994-sony-xperia-kitakami.dtsi    | 270 +--------------
 9 files changed, 334 insertions(+), 584 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-rpm.dtsi

diff --git a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
index 314d2dc4726a..0a12663dd6c6 100644
--- a/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
+++ b/arch/arm64/boot/dts/qcom/apq8094-sony-xperia-kitakami-karin_windy.dts
@@ -20,5 +20,5 @@ / {
 	qcom,msm-id = <253 0x20000>, <253 0x20001>;
 };
 
-/delete-node/ &pm8994_l1;
-/delete-node/ &pm8994_l19;
+/delete-node/ &vreg_l1a_1p0;
+/delete-node/ &vreg_l19a_3p3;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
index cc038f9b641f..0c2f54e7759a 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi
@@ -9,6 +9,7 @@
 
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
+#include "msm8994-rpm.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 #include <dt-bindings/pinctrl/qcom,pmic-gpio.h>
@@ -546,312 +547,6 @@ vdd_gfx: s2@1700 {
 	};
 };
 
-&rpm_requests {
-	/* These values were taken from the original firmware ACPI tables */
-	pm8994_regulators: pm8994-regulators {
-		compatible = "qcom,rpm-pm8994-regulators";
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
-		vdd_l1-supply = <&vreg_s1b_1p0>;
-		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
-		vdd_l3_l11-supply = <&vreg_s3a_1p3>;
-		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
-		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
-		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
-		vdd_l8_l16_l30-supply = <&vph_pwr>;
-		vdd_l9_l10_l18_l22-supply = <&vph_pwr_bbyp>;
-		vdd_l13_l19_l23_l24-supply = <&vph_pwr_bbyp>;
-		vdd_l14_l15-supply = <&vreg_s5a_2p15>;
-		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
-		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
-		vdd_l25-supply = <&vreg_s5a_2p15>;
-		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
-
-		/* S1, S2, S6 and S12 are managed by RPMPD */
-
-		vreg_s3a_1p3: s3 {
-			regulator-min-microvolt = <1300000>;
-			regulator-max-microvolt = <1300000>;
-			regulator-allow-set-load;
-			regulator-system-load = <300000>;
-		};
-
-		vreg_s4a_1p8: s4 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-			regulator-always-on;
-			regulator-system-load = <325000>;
-		};
-
-		vreg_s5a_2p15: s5 {
-			regulator-min-microvolt = <2150000>;
-			regulator-max-microvolt = <2150000>;
-			regulator-allow-set-load;
-			regulator-system-load = <325000>;
-		};
-
-		vreg_s7a_1p0: s7 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		/*
-		 * S8 - SPMI-managed VDD_APC0
-		 * S9, S10 and S11 (the main one) - SPMI-managed VDD_APC1
-		 */
-
-		vreg_l1a_1p0: l1 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		vreg_l2a_1p25: l2 {
-			regulator-min-microvolt = <1250000>;
-			regulator-max-microvolt = <1250000>;
-			regulator-allow-set-load;
-			regulator-system-load = <4160>;
-		};
-
-		vreg_l3a_1p2: l3 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <80000>;
-		};
-
-		vreg_l4a_1p225: l4 {
-			regulator-min-microvolt = <1225000>;
-			regulator-max-microvolt = <1225000>;
-		};
-
-		/* L5 is inaccessible from RPM */
-
-		vreg_l6a_1p8: l6 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-			regulator-system-load = <1000>;
-		};
-
-		/* L7 is inaccessible from RPM */
-
-		vreg_l8a_1p8: l8 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_l9a_1p8: l9 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_l10a_1p8: l10 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_l11a_1p2: l11 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <35000>;
-		};
-
-		vreg_l12a_1p8: l12 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <50000>;
-		};
-
-		vreg_l13a_2p95: l13 {
-			regulator-min-microvolt = <1850000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <22000>;
-		};
-
-		vreg_l14a_1p8: l14 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <52000>;
-		};
-
-		vreg_l15a_1p8: l15 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_l16a_2p7: l16 {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-		};
-
-		vreg_l17a_2p7: l17 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <300000>;
-		};
-
-		vreg_l18a_2p85: l18 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2850000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <600000>;
-		};
-
-		vreg_l19a_3p3: l19 {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <500000>;
-		};
-
-		vreg_l20a_2p95: l20 {
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-always-on;
-			regulator-boot-on;
-			regulator-allow-set-load;
-			regulator-system-load = <570000>;
-		};
-
-		vreg_l21a_2p95: l21 {
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <800000>;
-		};
-
-		vreg_l22a_3p0: l22 {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <150000>;
-		};
-
-		vreg_l23a_2p8: l23 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2850000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <80000>;
-		};
-
-		vreg_l24a_3p075: l24 {
-			regulator-min-microvolt = <3075000>;
-			regulator-max-microvolt = <3150000>;
-			regulator-allow-set-load;
-			regulator-system-load = <5800>;
-		};
-
-		vreg_l25a_1p1: l25 {
-			regulator-min-microvolt = <1150000>;
-			regulator-max-microvolt = <1150000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <80000>;
-		};
-
-		vreg_l26a_1p0: l26 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		vreg_l27a_1p05: l27 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <500000>;
-		};
-
-		vreg_l28a_1p0: l28 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <26000>;
-		};
-
-		vreg_l29a_2p8: l29 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2850000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <80000>;
-		};
-
-		vreg_l30a_1p8: l30 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <2500>;
-		};
-
-		vreg_l31a_1p2: l31 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <600000>;
-		};
-
-		vreg_l32a_1p8: l32 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		vreg_lvs1a_1p8: lvs1 { };
-
-		vreg_lvs2a_1p8: lvs2 { };
-	};
-
-	pmi8994_regulators: pmi8994-regulators {
-		compatible = "qcom,rpm-pmi8994-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_bst_byp-supply = <&vph_pwr>;
-
-		vreg_s1b_1p0: s1 {
-			regulator-min-microvolt = <1025000>;
-			regulator-max-microvolt = <1025000>;
-		};
-
-		/* S2 & S3 - VDD_GFX */
-
-		vph_pwr_bbyp: boost-bypass {
-			regulator-min-microvolt = <3300000>;
-			regulator-max-microvolt = <3300000>;
-		};
-	};
-};
-
 &sdhc1 {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/msm8994-rpm.dtsi b/arch/arm64/boot/dts/qcom/msm8994-rpm.dtsi
new file mode 100644
index 000000000000..b08e0339043a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-rpm.dtsi
@@ -0,0 +1,311 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio <konrad.dybcio@somainline.org>
+ * Copyright (c) 2020, Gustave Monce <gustave.monce@outlook.com>
+ */
+
+&rpm_requests {
+	/* These values were taken from the original firmware ACPI tables */
+	pm8994_regulators: pm8994-regulators {
+		compatible = "qcom,rpm-pm8994-regulators";
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
+		vdd_l1-supply = <&vreg_s1b_1p0>;
+		vdd_l2_l26_l28-supply = <&vreg_s3a_1p3>;
+		vdd_l3_l11-supply = <&vreg_s3a_1p3>;
+		vdd_l4_l27_l31-supply = <&vreg_s3a_1p3>;
+		vdd_l5_l7-supply = <&vreg_s5a_2p15>;
+		vdd_l6_l12_l32-supply = <&vreg_s5a_2p15>;
+		vdd_l8_l16_l30-supply = <&vph_pwr>;
+		vdd_l9_l10_l18_l22-supply = <&vph_pwr_bbyp>;
+		vdd_l13_l19_l23_l24-supply = <&vph_pwr_bbyp>;
+		vdd_l14_l15-supply = <&vreg_s5a_2p15>;
+		vdd_l17_l29-supply = <&vph_pwr_bbyp>;
+		vdd_l20_l21-supply = <&vph_pwr_bbyp>;
+		vdd_l25-supply = <&vreg_s5a_2p15>;
+		vdd_lvs1_2-supply = <&vreg_s4a_1p8>;
+
+		/* S1, S2, S6 and S12 are managed by RPMPD */
+
+		vreg_s3a_1p3: s3 {
+			regulator-min-microvolt = <1300000>;
+			regulator-max-microvolt = <1300000>;
+			regulator-allow-set-load;
+			regulator-system-load = <300000>;
+		};
+
+		vreg_s4a_1p8: s4 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-always-on;
+			regulator-system-load = <325000>;
+		};
+
+		vreg_s5a_2p15: s5 {
+			regulator-min-microvolt = <2150000>;
+			regulator-max-microvolt = <2150000>;
+			regulator-allow-set-load;
+			regulator-system-load = <325000>;
+		};
+
+		vreg_s7a_1p0: s7 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		/*
+		 * S8 - SPMI-managed VDD_APC0
+		 * S9, S10 and S11 (the main one) - SPMI-managed VDD_APC1
+		 */
+
+		vreg_l1a_1p0: l1 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_l2a_1p25: l2 {
+			regulator-min-microvolt = <1250000>;
+			regulator-max-microvolt = <1250000>;
+			regulator-allow-set-load;
+			regulator-system-load = <4160>;
+		};
+
+		vreg_l3a_1p2: l3 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <80000>;
+		};
+
+		vreg_l4a_1p225: l4 {
+			regulator-min-microvolt = <1225000>;
+			regulator-max-microvolt = <1225000>;
+		};
+
+		/* L5 is inaccessible from RPM */
+
+		vreg_l6a_1p8: l6 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-allow-set-load;
+			regulator-system-load = <1000>;
+		};
+
+		/* L7 is inaccessible from RPM */
+
+		vreg_l8a_1p8: l8 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l9a_1p8: l9 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l10a_1p8: l10 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l11a_1p2: l11 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <35000>;
+		};
+
+		vreg_l12a_1p8: l12 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <50000>;
+		};
+
+		vreg_l13a_2p95: l13 {
+			regulator-min-microvolt = <1850000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <22000>;
+		};
+
+		vreg_l14a_1p8: l14 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <52000>;
+		};
+
+		vreg_l15a_1p8: l15 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_l16a_2p7: l16 {
+			regulator-min-microvolt = <2700000>;
+			regulator-max-microvolt = <2700000>;
+		};
+
+		vreg_l17a_2p7: l17 {
+			regulator-min-microvolt = <2800000>;
+			regulator-max-microvolt = <2800000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <300000>;
+		};
+
+		vreg_l18a_2p85: l18 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <600000>;
+		};
+
+		vreg_l19a_3p3: l19 {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <500000>;
+		};
+
+		vreg_l20a_2p95: l20 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-boot-on;
+			regulator-allow-set-load;
+			regulator-system-load = <570000>;
+		};
+
+		vreg_l21a_2p95: l21 {
+			regulator-min-microvolt = <2950000>;
+			regulator-max-microvolt = <2950000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <800000>;
+		};
+
+		vreg_l22a_3p0: l22 {
+			regulator-min-microvolt = <3000000>;
+			regulator-max-microvolt = <3000000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <150000>;
+		};
+
+		vreg_l23a_2p8: l23 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <80000>;
+		};
+
+		vreg_l24a_3p075: l24 {
+			regulator-min-microvolt = <3075000>;
+			regulator-max-microvolt = <3150000>;
+			regulator-allow-set-load;
+			regulator-system-load = <5800>;
+		};
+
+		vreg_l25a_1p1: l25 {
+			regulator-min-microvolt = <1150000>;
+			regulator-max-microvolt = <1150000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <80000>;
+		};
+
+		vreg_l26a_1p0: l26 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+		};
+
+		vreg_l27a_1p05: l27 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <500000>;
+		};
+
+		vreg_l28a_1p0: l28 {
+			regulator-min-microvolt = <1000000>;
+			regulator-max-microvolt = <1000000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <26000>;
+		};
+
+		vreg_l29a_2p8: l29 {
+			regulator-min-microvolt = <2850000>;
+			regulator-max-microvolt = <2850000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <80000>;
+		};
+
+		vreg_l30a_1p8: l30 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <2500>;
+		};
+
+		vreg_l31a_1p2: l31 {
+			regulator-min-microvolt = <1200000>;
+			regulator-max-microvolt = <1200000>;
+			regulator-always-on;
+			regulator-allow-set-load;
+			regulator-system-load = <600000>;
+		};
+
+		vreg_l32a_1p8: l32 {
+			regulator-min-microvolt = <1800000>;
+			regulator-max-microvolt = <1800000>;
+		};
+
+		vreg_lvs1a_1p8: lvs1 { };
+
+		vreg_lvs2a_1p8: lvs2 { };
+	};
+
+	pmi8994_regulators: pmi8994-regulators {
+		compatible = "qcom,rpm-pmi8994-regulators";
+
+		vdd_s1-supply = <&vph_pwr>;
+		vdd_bst_byp-supply = <&vph_pwr>;
+
+		vreg_s1b_1p0: s1 {
+			regulator-min-microvolt = <1025000>;
+			regulator-max-microvolt = <1025000>;
+		};
+
+		/* S2 & S3 - VDD_GFX */
+
+		vph_pwr_bbyp: boost-bypass {
+			regulator-min-microvolt = <3300000>;
+			regulator-max-microvolt = <3300000>;
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
index 99388b019a11..0b8b86b4b541 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
@@ -13,15 +13,15 @@ / {
 	chassis-type = "handset";
 };
 
-&pm8994_l3 {
+&vreg_l3a_1p2 {
 	regulator-min-microvolt = <1000000>;
 	regulator-max-microvolt = <1000000>;
 };
 
-&pm8994_l17 {
+&vreg_l17a_2p7 {
 	regulator-min-microvolt = <2700000>;
 	regulator-max-microvolt = <2700000>;
 };
 
-/delete-node/ &pm8994_l19;
-/delete-node/ &pm8994_l32;
+/delete-node/ &vreg_l19a_3p3;
+/delete-node/ &vreg_l32a_1p8;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
index 71758d2cfd5e..7c5b6168580d 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -21,26 +21,26 @@ &blsp2_i2c5 {
 	 */
 };
 
-&pm8994_l3 {
+&vreg_l3a_1p2 {
 	regulator-min-microvolt = <1050000>;
 	regulator-max-microvolt = <1050000>;
 };
 
-&pm8994_l17 {
+&vreg_l17a_2p7 {
 	regulator-min-microvolt = <2700000>;
 	regulator-max-microvolt = <2700000>;
 };
 
-&pm8994_l22 {
+&vreg_l22a_3p0 {
 	regulator-min-microvolt = <3100000>;
 	regulator-max-microvolt = <3100000>;
 };
 
-&pm8994_l25 {
+&vreg_l25a_1p1 {
 	regulator-min-microvolt = <1037500>;
 	regulator-max-microvolt = <1037500>;
 };
 
-/delete-node/ &pm8994_l32;
+/delete-node/ &vreg_l32a_1p8;
 /* Z4 tablets use a different touchscreen. */
 /delete-node/ &touchscreen;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
index 69b7df0ed605..cb65daf52628 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
@@ -13,7 +13,7 @@ / {
 	chassis-type = "handset";
 };
 
-&pm8994_l14 {
+&vreg_l14a_1p8 {
 	regulator-min-microvolt = <1850000>;
 	regulator-max-microvolt = <1850000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
index 466508cd8234..c9149fc14b43 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-sumire.dts
@@ -13,4 +13,4 @@ / {
 	chassis-type = "handset";
 };
 
-/delete-node/ &pm8994_l19;
+/delete-node/ &vreg_l19a_3p3;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
index 76bf50191f9a..b122460c57be 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
@@ -13,9 +13,9 @@ / {
 	chassis-type = "handset";
 };
 
-&pm8994_l14 {
+&vreg_l14a_1p8 {
 	regulator-min-microvolt = <2000000>;
 	regulator-max-microvolt = <2000000>;
 };
 
-/delete-node/ &pm8994_l19;
+/delete-node/ &vreg_l19a_3p3;
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index dde7ed159c4d..3fd860a22057 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -6,6 +6,7 @@
 #include "msm8994.dtsi"
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
+#include "msm8994-rpm.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/gpio-keys.h>
 
@@ -131,8 +132,8 @@ touchscreen: rmi4-i2c-dev@2c {
 		pinctrl-names = "default";
 		pinctrl-0 = <&ts_int_active &ts_reset_active>;
 
-		vdd-supply = <&pm8994_l22>;
-		vio-supply = <&pm8994_s4>;
+		vdd-supply = <&vreg_l22a_3p0>;
+		vio-supply = <&vreg_s4a_1p8>;
 
 		syna,reset-delay-ms = <220>;
 		syna,startup-delay-ms = <220>;
@@ -193,263 +194,6 @@ vdd_gfx: s2@1700 {
 	};
 };
 
-&rpm_requests {
-	pm8994_regulators: pm8994-regulators {
-		compatible = "qcom,rpm-pm8994-regulators";
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
-		vdd_l1-supply = <&pmi8994_s1>;
-		vdd_l2_l26_l28-supply = <&pm8994_s3>;
-		vdd_l3_l11-supply = <&pm8994_s3>;
-		vdd_l4_l27_l31-supply = <&pm8994_s3>;
-		vdd_l5_l7-supply = <&pm8994_s5>;
-		vdd_l6_l12_l32-supply = <&pm8994_s5>;
-		vdd_l8_l16_l30-supply = <&vph_pwr>;
-		vdd_l9_l10_l18_l22-supply = <&pmi8994_bby>;
-		vdd_l13_l19_l23_l24-supply = <&pmi8994_bby>;
-		vdd_l14_l15-supply = <&pm8994_s5>;
-		vdd_l17_l29-supply = <&pmi8994_bby>;
-		vdd_l20_l21-supply = <&pmi8994_bby>;
-		vdd_l25-supply = <&pm8994_s3>;
-		vdd_lvs1_2-supply = <&pm8994_s4>;
-
-		/* S1, S2, S6 and S12 are managed by RPMPD */
-
-		pm8994_s3: s3 {
-			regulator-min-microvolt = <1300000>;
-			regulator-max-microvolt = <1300000>;
-		};
-
-		pm8994_s4: s4 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-			regulator-always-on;
-			regulator-system-load = <325000>;
-		};
-
-		pm8994_s5: s5 {
-			regulator-min-microvolt = <2150000>;
-			regulator-max-microvolt = <2150000>;
-		};
-
-		pm8994_s7: s7 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		/*
-		 * S8 - SPMI-managed VDD_APC0
-		 * S9, S10 and S11 (the main one) - SPMI-managed VDD_APC1
-		 */
-
-		pm8994_l1: l1 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		pm8994_l2: l2 {
-			regulator-min-microvolt = <1250000>;
-			regulator-max-microvolt = <1250000>;
-			regulator-allow-set-load;
-			regulator-system-load = <10000>;
-		};
-
-		pm8994_l3: l3 {
-			regulator-min-microvolt = <1100000>;
-			regulator-max-microvolt = <1100000>;
-		};
-
-		pm8994_l4: l4 {
-			regulator-min-microvolt = <1225000>;
-			regulator-max-microvolt = <1225000>;
-		};
-
-		/* L5 is inaccessible from RPM */
-
-		pm8994_l6: l6 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		/* L7 is inaccessible from RPM */
-
-		pm8994_l8: l8 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_l9: l9 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_l10: l10 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_l11: l11 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-
-		pm8994_l12: l12 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-			regulator-system-load = <10000>;
-		};
-
-		pm8994_l13: l13 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <2950000>;
-		};
-
-		pm8994_l14: l14 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-			regulator-allow-set-load;
-			regulator-system-load = <10000>;
-		};
-
-		pm8994_l15: l15 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_l16: l16 {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-		};
-
-		pm8994_l17: l17 {
-			regulator-min-microvolt = <2200000>;
-			regulator-max-microvolt = <2200000>;
-		};
-
-		pm8994_l18: l18 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2850000>;
-			regulator-always-on;
-		};
-
-		pm8994_l19: l19 {
-			regulator-min-microvolt = <2850000>;
-			regulator-max-microvolt = <2850000>;
-		};
-
-		pm8994_l20: l20 {
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-always-on;
-			regulator-boot-on;
-			regulator-allow-set-load;
-			regulator-system-load = <570000>;
-		};
-
-		pm8994_l21: l21 {
-			regulator-min-microvolt = <2950000>;
-			regulator-max-microvolt = <2950000>;
-			regulator-always-on;
-			regulator-allow-set-load;
-			regulator-system-load = <800000>;
-		};
-
-		pm8994_l22: l22 {
-			regulator-min-microvolt = <3000000>;
-			regulator-max-microvolt = <3000000>;
-		};
-
-		pm8994_l23: l23 {
-			regulator-min-microvolt = <2800000>;
-			regulator-max-microvolt = <2800000>;
-		};
-
-		pm8994_l24: l24 {
-			regulator-min-microvolt = <3075000>;
-			regulator-max-microvolt = <3150000>;
-		};
-
-		pm8994_l25: l25 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-		};
-
-		pm8994_l26: l26 {
-			regulator-min-microvolt = <987500>;
-			regulator-max-microvolt = <987500>;
-		};
-
-		pm8994_l27: l27 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-		};
-
-		pm8994_l28: l28 {
-			regulator-min-microvolt = <1000000>;
-			regulator-max-microvolt = <1000000>;
-			regulator-allow-set-load;
-			regulator-system-load = <10000>;
-		};
-
-		pm8994_l29: l29 {
-			regulator-min-microvolt = <2700000>;
-			regulator-max-microvolt = <2700000>;
-		};
-
-		pm8994_l30: l30 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_l31: l31 {
-			regulator-min-microvolt = <1200000>;
-			regulator-max-microvolt = <1200000>;
-			regulator-allow-set-load;
-			regulator-system-load = <10000>;
-		};
-
-		pm8994_l32: l32 {
-			regulator-min-microvolt = <1800000>;
-			regulator-max-microvolt = <1800000>;
-		};
-
-		pm8994_lvs1: lvs1 {};
-		pm8994_lvs2: lvs2 {};
-	};
-
-	pmi8994_regulators: pmi8994-regulators {
-		compatible = "qcom,rpm-pmi8994-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-		vdd_bst_byp-supply = <&vph_pwr>;
-
-		pmi8994_s1: s1 {
-			regulator-min-microvolt = <1025000>;
-			regulator-max-microvolt = <1025000>;
-		};
-
-		/* S2 & S3 - VDD_GFX */
-
-		pmi8994_bby: boost-bypass {
-			regulator-min-microvolt = <3150000>;
-			regulator-max-microvolt = <3600000>;
-		};
-	};
-};
-
 &sdhc1 {
 	/*
 	 * There is an issue with the eMMC causing permanent
@@ -466,8 +210,8 @@ &sdhc1 {
 	 * that regulator, so let's not use it for now.
 	 * vqmmc is also disabled cause driver stll complains.
 	 *
-	 * vmmc-supply = <&pm8994_l20>;
-	 * vqmmc-supply = <&pm8994_s4>;
+	 * vmmc-supply = <&vreg_l20a_2p95>;
+	 * vqmmc-supply = <&vreg_s4a_1p8>;
 	 */
 };
 
@@ -475,8 +219,8 @@ &sdhc2 {
 	status = "okay";
 
 	cd-gpios = <&tlmm 100 0>;
-	vmmc-supply = <&pm8994_l21>;
-	vqmmc-supply = <&pm8994_l13>;
+	vmmc-supply = <&vreg_l21a_2p95>;
+	vqmmc-supply = <&vreg_l13a_2p95>;
 };
 
 &tlmm {
-- 
2.34.1

