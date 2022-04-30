Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9A8D1515F2E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 30 Apr 2022 18:26:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1383096AbiD3Q1s (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 30 Apr 2022 12:27:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1383024AbiD3Q1c (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 30 Apr 2022 12:27:32 -0400
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E0115F8F5;
        Sat, 30 Apr 2022 09:24:06 -0700 (PDT)
Received: from localhost.localdomain (abxh26.neoplus.adsl.tpnet.pl [83.9.1.26])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id AF1843F729;
        Sat, 30 Apr 2022 18:24:04 +0200 (CEST)
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
Subject: [PATCH 07/14] arm64: dts: qcom: msm8998-yoshino/oneplus: Use pm8005_regulators label
Date:   Sat, 30 Apr 2022 18:23:45 +0200
Message-Id: <20220430162353.607709-7-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220430162353.607709-1-konrad.dybcio@somainline.org>
References: <20220430162353.607709-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,SPF_HELO_NONE,
        SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that a label is added, use it!

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 .../boot/dts/qcom/msm8998-oneplus-common.dtsi | 22 +++++++------------
 .../dts/qcom/msm8998-sony-xperia-yoshino.dtsi | 21 +++++++-----------
 2 files changed, 16 insertions(+), 27 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
index 9823d48a91b1..5c4454da6bca 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-oneplus-common.dtsi
@@ -228,20 +228,14 @@ &blsp2_uart1 {
 	status = "okay";
 };
 
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
+&pm8005_regulators {
+	/* VDD_GFX supply */
+	pm8005_s1: s1 {
+		regulator-min-microvolt = <524000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-enable-ramp-delay = <500>;
+		/* Hack until we rig up the gpu consumer */
+		regulator-always-on;
 	};
 };
 
diff --git a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
index 28ec3e0fb201..9a6e10fb4920 100644
--- a/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998-sony-xperia-yoshino.dtsi
@@ -284,19 +284,14 @@ &mmss_smmu {
 	status = "ok";
 };
 
-&pm8005_lsid1 {
-	pm8005-regulators {
-		compatible = "qcom,pm8005-regulators";
-
-		vdd_s1-supply = <&vph_pwr>;
-
-		/* VDD_GFX supply */
-		pm8005_s1: s1 {
-			regulator-min-microvolt = <524000>;
-			regulator-max-microvolt = <1088000>;
-			regulator-enable-ramp-delay = <500>;
-			regulator-always-on;
-		};
+&pm8005_regulators {
+	/* VDD_GFX supply */
+	pm8005_s1: s1 {
+		regulator-min-microvolt = <524000>;
+		regulator-max-microvolt = <1088000>;
+		regulator-enable-ramp-delay = <500>;
+		/* Hack until we rig up the gpu consumer */
+		regulator-always-on;
 	};
 };
 
-- 
2.35.2

