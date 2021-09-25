Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85425418297
	for <lists+linux-arm-msm@lfdr.de>; Sat, 25 Sep 2021 16:18:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245656AbhIYOUU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 10:20:20 -0400
Received: from relay02.th.seeweb.it ([5.144.164.163]:57735 "EHLO
        relay02.th.seeweb.it" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238275AbhIYOUU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 10:20:20 -0400
Received: from Marijn-Arch-PC.localdomain (94-209-165-62.cable.dynamic.v4.ziggo.nl [94.209.165.62])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r1.th.seeweb.it (Postfix) with ESMTPSA id 7BDD31F698;
        Sat, 25 Sep 2021 16:18:42 +0200 (CEST)
From:   Marijn Suijten <marijn.suijten@somainline.org>
To:     phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Pavel Dubrova <pashadubrova@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: qcom: sm6125: Improve indentation of multiline properties
Date:   Sat, 25 Sep 2021 16:18:41 +0200
Message-Id: <20210925141841.407257-1-marijn.suijten@somainline.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some multiline properties (spread out over multiple lines to keep length
in check) were not indented properly, leading to misalignment with the
items above.  The DT file is still small enough to address this early in
the process.

Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
Reviewed-by: Martin Botka <martin.botka@somainline.org>
---
 arch/arm64/boot/dts/qcom/sm6125.dtsi | 46 ++++++++++++++--------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index 2b37ce6a9f9c..e92fab5a2484 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -326,8 +326,8 @@ tcsr_mutex: hwlock@340000 {
 		tlmm: pinctrl@500000 {
 			compatible = "qcom,sm6125-tlmm";
 			reg = <0x00500000 0x400000>,
-				<0x00900000 0x400000>,
-				<0x00d00000 0x400000>;
+			      <0x00900000 0x400000>,
+			      <0x00d00000 0x400000>;
 			reg-names = "west", "south", "east";
 			interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
@@ -391,12 +391,12 @@ sdhc_1: sdhci@4744000 {
 			reg-names = "hc", "core";
 
 			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
-				<&gcc GCC_SDCC1_APPS_CLK>,
-				<&xo_board>;
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&xo_board>;
 			clock-names = "iface", "core", "xo";
 			bus-width = <8>;
 			non-removable;
@@ -409,12 +409,12 @@ sdhc_2: sdhci@4784000 {
 			reg-names = "hc";
 
 			interrupts = <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
-				<GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
+				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "hc_irq", "pwr_irq";
 
 			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
-				<&gcc GCC_SDCC2_APPS_CLK>,
-				<&xo_board>;
+				 <&gcc GCC_SDCC2_APPS_CLK>,
+				 <&xo_board>;
 			clock-names = "iface", "core", "xo";
 
 			pinctrl-0 = <&sdc2_state_on>;
@@ -433,11 +433,11 @@ usb3: usb@4ef8800 {
 			ranges;
 
 			clocks = <&gcc GCC_USB30_PRIM_MASTER_CLK>,
-				<&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
-				<&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
-				<&gcc GCC_USB3_PRIM_CLKREF_CLK>,
-				<&gcc GCC_USB30_PRIM_SLEEP_CLK>,
-				<&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+				 <&gcc GCC_SYS_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
 
 			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
@@ -462,11 +462,11 @@ usb3_dwc3: usb@4e00000 {
 
 		spmi_bus: spmi@1c40000 {
 			compatible = "qcom,spmi-pmic-arb";
-			reg =	<0x01c40000 0x1100>,
-				<0x01e00000 0x2000000>,
-				<0x03e00000 0x100000>,
-				<0x03f00000 0xa0000>,
-				<0x01c0a000 0x26000>;
+			reg = <0x01c40000 0x1100>,
+			      <0x01e00000 0x2000000>,
+			      <0x03e00000 0x100000>,
+			      <0x03f00000 0xa0000>,
+			      <0x01c0a000 0x26000>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
 			interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
@@ -497,7 +497,7 @@ timer@f120000 {
 			frame@0f121000 {
 				frame-number = <0>;
 				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
-						<GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
 				reg = <0x0f121000 0x1000>,
 				      <0x0f122000 0x1000>;
 			};
@@ -548,7 +548,7 @@ frame@f128000 {
 		intc: interrupt-controller@f200000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0f200000 0x20000>,
-				<0x0f300000 0x100000>;
+			      <0x0f300000 0x100000>;
 			#interrupt-cells = <3>;
 			interrupt-controller;
 			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
@@ -558,9 +558,9 @@ intc: interrupt-controller@f200000 {
 	timer {
 		compatible = "arm,armv8-timer";
 		interrupts = <GIC_PPI 1 0xf08
-				GIC_PPI 2 0xf08
-				GIC_PPI 3 0xf08
-				GIC_PPI 0 0xf08>;
+			      GIC_PPI 2 0xf08
+			      GIC_PPI 3 0xf08
+			      GIC_PPI 0 0xf08>;
 		clock-frequency = <19200000>;
 	};
 };
-- 
2.33.0

