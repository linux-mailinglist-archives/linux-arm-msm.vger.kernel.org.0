Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BB8F63A8DEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 02:58:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231824AbhFPBA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Jun 2021 21:00:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231787AbhFPBA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Jun 2021 21:00:56 -0400
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [IPv6:2001:4b7a:2000:18::169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E163C06175F
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Jun 2021 17:58:51 -0700 (PDT)
Received: from localhost.localdomain (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        by m-r2.th.seeweb.it (Postfix) with ESMTPA id D5EFE3EE8C;
        Wed, 16 Jun 2021 02:58:48 +0200 (CEST)
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
To:     ~postmarketos/upstreaming@lists.sr.ht
Cc:     martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/6] arm64: dts: qcom: sm8250: Commonize PCIe pins
Date:   Wed, 16 Jun 2021 02:58:39 +0200
Message-Id: <20210616005843.79579-2-konrad.dybcio@somainline.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210616005843.79579-1-konrad.dybcio@somainline.org>
References: <20210616005843.79579-1-konrad.dybcio@somainline.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Commonize PCIe pins, along with pin definitions for PCIe-connected
MHI modem (not enabled by default, as it's useless on modem-less boards).

While at it, remove "output-low" from the RB5 board, as it's
not necessary - we already explicitly pull the perst pin low.

Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts |  87 -------------------
 arch/arm64/boot/dts/qcom/sm8250.dtsi     | 101 +++++++++++++++++++++++
 2 files changed, 101 insertions(+), 87 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index d5a4f5a27da6..8ac96f8e79d4 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -669,10 +669,6 @@ wifi-therm@1 {
 
 &pcie0 {
 	status = "okay";
-	perst-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
-	wake-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie0_default_state>;
 };
 
 &pcie0_phy {
@@ -683,10 +679,6 @@ &pcie0_phy {
 
 &pcie1 {
 	status = "okay";
-	perst-gpio = <&tlmm 82 GPIO_ACTIVE_LOW>;
-	wake-gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie1_default_state>;
 };
 
 &pcie1_phy {
@@ -697,10 +689,6 @@ &pcie1_phy {
 
 &pcie2 {
 	status = "okay";
-	perst-gpio = <&tlmm 85 GPIO_ACTIVE_LOW>;
-	wake-gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&pcie2_default_state>;
 };
 
 &pcie2_phy {
@@ -1178,81 +1166,6 @@ lt9611_irq_pin: lt9611-irq {
 		bias-disable;
 	};
 
-	pcie0_default_state: pcie0-default {
-		clkreq {
-			pins = "gpio80";
-			function = "pci_e0";
-			bias-pull-up;
-		};
-
-		reset-n {
-			pins = "gpio79";
-			function = "gpio";
-
-			drive-strength = <2>;
-			output-low;
-			bias-pull-down;
-		};
-
-		wake-n {
-			pins = "gpio81";
-			function = "gpio";
-
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie1_default_state: pcie1-default {
-		clkreq {
-			pins = "gpio83";
-			function = "pci_e1";
-			bias-pull-up;
-		};
-
-		reset-n {
-			pins = "gpio82";
-			function = "gpio";
-
-			drive-strength = <2>;
-			output-low;
-			bias-pull-down;
-		};
-
-		wake-n {
-			pins = "gpio84";
-			function = "gpio";
-
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
-	pcie2_default_state: pcie2-default {
-		clkreq {
-			pins = "gpio86";
-			function = "pci_e2";
-			bias-pull-up;
-		};
-
-		reset-n {
-			pins = "gpio85";
-			function = "gpio";
-
-			drive-strength = <2>;
-			output-low;
-			bias-pull-down;
-		};
-
-		wake-n {
-			pins = "gpio87";
-			function = "gpio";
-
-			drive-strength = <2>;
-			bias-pull-up;
-		};
-	};
-
 	sdc2_default_state: sdc2-default {
 		clk {
 			pins = "sdc2_clk";
diff --git a/arch/arm64/boot/dts/qcom/sm8250.dtsi b/arch/arm64/boot/dts/qcom/sm8250.dtsi
index 1665eac49f3b..e2413aee2f21 100644
--- a/arch/arm64/boot/dts/qcom/sm8250.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8250.dtsi
@@ -1314,6 +1314,12 @@ pcie0: pci@1c00000 {
 			phys = <&pcie0_lane>;
 			phy-names = "pciephy";
 
+			perst-gpio = <&tlmm 79 GPIO_ACTIVE_LOW>;
+			enable-gpio = <&tlmm 81 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie0_default_state>;
+
 			status = "disabled";
 		};
 
@@ -1412,6 +1418,12 @@ pcie1: pci@1c08000 {
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";
 
+			perst-gpio = <&tlmm 82 GPIO_ACTIVE_LOW>;
+			enable-gpio = <&tlmm 84 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie1_default_state>;
+
 			status = "disabled";
 		};
 
@@ -1512,6 +1524,12 @@ pcie2: pci@1c10000 {
 			phys = <&pcie2_lane>;
 			phy-names = "pciephy";
 
+			perst-gpio = <&tlmm 85 GPIO_ACTIVE_LOW>;
+			enable-gpio = <&tlmm 87 GPIO_ACTIVE_HIGH>;
+
+			pinctrl-names = "default";
+			pinctrl-0 = <&pcie2_default_state>;
+
 			status = "disabled";
 		};
 
@@ -3490,6 +3508,89 @@ data {
 					bias-pull-up;
 				};
 			};
+
+			pcie0_default_state: pcie0-default {
+				pcie0_perst_default: perst {
+					pins = "gpio79";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio80";
+					function = "pci_e0";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio81";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			pcie1_default_state: pcie1-default {
+				pcie1_perst_default: perst {
+					pins = "gpio82";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio83";
+					function = "pci_e1";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio84";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			pcie2_default_state: pcie2-default {
+				pcie2_perst_default: perst {
+					pins = "gpio85";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-down;
+				};
+
+				clkreq {
+					pins = "gpio86";
+					function = "pci_e2";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+
+				wake {
+					pins = "gpio87";
+					function = "gpio";
+					drive-strength = <2>;
+					bias-pull-up;
+				};
+			};
+
+			mdm2ap_default: mdm2ap-default {
+				pins = "gpio1", "gpio3";
+				function = "gpio";
+				drive-strength = <8>;
+				bias-disable;
+			};
+
+			ap2mdm_default: ap2mdm-default {
+				pins = "gpio56", "gpio57";
+				function = "gpio";
+				drive-strength = <16>;
+				bias-disable;
+			};
 		};
 
 		apps_smmu: iommu@15000000 {
-- 
2.32.0

