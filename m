Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A6C132725C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Feb 2021 14:10:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbhB1NJm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Feb 2021 08:09:42 -0500
Received: from relay04.th.seeweb.it ([5.144.164.165]:37359 "EHLO
        relay04.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230395AbhB1NJj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Feb 2021 08:09:39 -0500
Received: from localhost.localdomain (abab236.neoplus.adsl.tpnet.pl [83.6.165.236])
        by m-r1.th.seeweb.it (Postfix) with ESMTPA id 06C5D1F571;
        Sun, 28 Feb 2021 14:08:56 +0100 (CET)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: qcom: pm8994: Add RESIN node
Date:   Sun, 28 Feb 2021 14:08:26 +0100
Message-Id: <20210228130831.203765-8-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210228130831.203765-1-konrad.dybcio@somainline.org>
References: <20210228130831.203765-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a RESIN node to support RESIN-connected buttons on some
devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi | 19 +++++--------------
 arch/arm64/boot/dts/qcom/pm8994.dtsi         |  8 +++++++-
 2 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
index e6ef76971c31..d2a5fb0c8df1 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
@@ -249,6 +249,11 @@ &mmcc {
 	vdd-gfx-supply = <&vdd_gfx>;
 };
 
+&pm8994_resin {
+	status = "okay";
+	linux,code = <KEY_VOLUMEDOWN>;
+};
+
 &tlmm {
 	gpio-line-names =
 		"[SPI0_DOUT]", /* GPIO_0, BLSP1_SPI_MOSI, LSEC pin 14 */
@@ -1030,20 +1035,6 @@ codec {
 	};
 };
 
-&spmi_bus {
-	pmic@0 {
-		pon@800 {
-			resin {
-				compatible = "qcom,pm8941-resin";
-				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-				debounce = <15625>;
-				bias-pull-up;
-				linux,code = <KEY_VOLUMEDOWN>;
-			};
-		};
-	};
-};
-
 &ufsphy {
 	status = "okay";
 
diff --git a/arch/arm64/boot/dts/qcom/pm8994.dtsi b/arch/arm64/boot/dts/qcom/pm8994.dtsi
index c3876c82c874..ad19016df047 100644
--- a/arch/arm64/boot/dts/qcom/pm8994.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8994.dtsi
@@ -45,7 +45,6 @@ rtc@6000 {
 
 		pm8994_pon: pon@800 {
 			compatible = "qcom,pm8916-pon";
-
 			reg = <0x800>;
 			mode-bootloader = <0x2>;
 			mode-recovery = <0x1>;
@@ -58,6 +57,13 @@ pwrkey {
 				linux,code = <KEY_POWER>;
 			};
 
+			pm8994_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				status = "disabled";
+			};
 		};
 
 		pm8994_temp: temp-alarm@2400 {
-- 
2.30.1

