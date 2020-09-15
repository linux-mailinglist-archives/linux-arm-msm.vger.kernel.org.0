Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5568269F73
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Sep 2020 09:13:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726087AbgIOHNy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 03:13:54 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([85.215.255.81]:13132 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726122AbgIOHNc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 03:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1600153984;
        s=strato-dkim-0002; d=gerhold.net;
        h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=TWqA+VDwEEG/+aKLsOrl4ZPGaiCjwpu46Erg13FScg0=;
        b=N0v2mx4aE7SVqSzrGu9ezQAv20MQ8WXXBZacoPI2WFeoOe+3Clr0MB9z9dY74bSZPL
        gYRB/KXatZDWocmAZZnWngANIy+wdD903uy/eo/s6ArntFaXPRctyeHkbptm/jEUEkvC
        pB5hjrGPP9pFgMpRA2gHmftjxshigHJxIoVJ+76dhkDJ7WKbtz6TUKpnYouAGaJJx5IC
        MiXJM6jlfbtkBOuGTFlas9rlpiwJHG9txT7oCmbBaYrvBJR06qzcHrdz7qD1k2dN+ZTI
        NADkWKvZz6Wmp44dG9YBkeBlaS5gA4ujtHOMbVlyXX2XUl0Tjg+d1KOcXmZlgWJJU9DL
        EmrQ==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXS7IYBkLahKxB4W6FOVM="
X-RZG-CLASS-ID: mo00
Received: from localhost.localdomain
        by smtp.strato.de (RZmta 46.10.7 DYNA|AUTH)
        with ESMTPSA id g0b6c1w8F7D2rdy
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 15 Sep 2020 09:13:02 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Amit Kucheria <amit.kucheria@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht
Subject: [PATCH 11/14] arm64: dts: qcom: msm8916: Pad addresses
Date:   Tue, 15 Sep 2020 09:12:18 +0200
Message-Id: <20200915071221.72895-12-stephan@gerhold.net>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915071221.72895-1-stephan@gerhold.net>
References: <20200915071221.72895-1-stephan@gerhold.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Just like in commit 86f6d6225e5e ("arm64: dts: qcom: msm8996: Pad addresses"),
pad all addresses to 8 digits to make it easier to see the correct
order of the nodes.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
 arch/arm64/boot/dts/qcom/msm8916.dtsi | 138 +++++++++++++-------------
 1 file changed, 69 insertions(+), 69 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8916.dtsi b/arch/arm64/boot/dts/qcom/msm8916.dtsi
index 47f01e206255..9af528b9979b 100644
--- a/arch/arm64/boot/dts/qcom/msm8916.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916.dtsi
@@ -420,7 +420,7 @@ bimc: interconnect@400000 {
 
 		restart@4ab000 {
 			compatible = "qcom,pshold";
-			reg = <0x4ab000 0x4>;
+			reg = <0x004ab000 0x4>;
 		};
 
 		pcnoc: interconnect@500000 {
@@ -443,7 +443,7 @@ snoc: interconnect@580000 {
 
 		msmgpio: pinctrl@1000000 {
 			compatible = "qcom,msm8916-pinctrl";
-			reg = <0x1000000 0x300000>;
+			reg = <0x01000000 0x300000>;
 			interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
 			gpio-controller;
 			gpio-ranges = <&msmgpio 0 0 122>;
@@ -457,28 +457,28 @@ gcc: clock-controller@1800000 {
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			reg = <0x1800000 0x80000>;
+			reg = <0x01800000 0x80000>;
 		};
 
 		tcsr_mutex: hwlock@1905000 {
 			compatible = "qcom,tcsr-mutex";
-			reg = <0x1905000 0x20000>;
+			reg = <0x01905000 0x20000>;
 			#hwlock-cells = <1>;
 		};
 
 		tcsr: syscon@1937000 {
 			compatible = "qcom,tcsr-msm8916", "syscon";
-			reg = <0x1937000 0x30000>;
+			reg = <0x01937000 0x30000>;
 		};
 
 		rpm_msg_ram: memory@60000 {
 			compatible = "qcom,rpm-msg-ram";
-			reg = <0x60000 0x8000>;
+			reg = <0x00060000 0x8000>;
 		};
 
 		blsp1_uart1: serial@78af000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x78af000 0x200>;
+			reg = <0x078af000 0x200>;
 			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
@@ -492,13 +492,13 @@ blsp1_uart1: serial@78af000 {
 
 		a53pll: clock@b016000 {
 			compatible = "qcom,msm8916-a53pll";
-			reg = <0xb016000 0x40>;
+			reg = <0x0b016000 0x40>;
 			#clock-cells = <0>;
 		};
 
 		apcs: mailbox@b011000 {
 			compatible = "qcom,msm8916-apcs-kpss-global", "syscon";
-			reg = <0xb011000 0x1000>;
+			reg = <0x0b011000 0x1000>;
 			#mbox-cells = <1>;
 			clocks = <&a53pll>, <&gcc GPLL0_VOTE>;
 			clock-names = "pll", "aux";
@@ -507,7 +507,7 @@ apcs: mailbox@b011000 {
 
 		blsp1_uart2: serial@78b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x78b0000 0x200>;
+			reg = <0x078b0000 0x200>;
 			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
 			clock-names = "core", "iface";
@@ -788,8 +788,8 @@ sdhc_2: sdhci@7864000 {
 
 		usb: usb@78d9000 {
 			compatible = "qcom,ci-hdrc";
-			reg = <0x78d9000 0x200>,
-			      <0x78d9200 0x200>;
+			reg = <0x078d9000 0x200>,
+			      <0x078d9200 0x200>;
 			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_USB_HS_AHB_CLK>,
@@ -837,67 +837,67 @@ timer@b020000 {
 			#size-cells = <1>;
 			ranges;
 			compatible = "arm,armv7-timer-mem";
-			reg = <0xb020000 0x1000>;
+			reg = <0x0b020000 0x1000>;
 			clock-frequency = <19200000>;
 
 			frame@b021000 {
 				frame-number = <0>;
 				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
 					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb021000 0x1000>,
-				      <0xb022000 0x1000>;
+				reg = <0x0b021000 0x1000>,
+				      <0x0b022000 0x1000>;
 			};
 
 			frame@b023000 {
 				frame-number = <1>;
 				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb023000 0x1000>;
+				reg = <0x0b023000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@b024000 {
 				frame-number = <2>;
 				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb024000 0x1000>;
+				reg = <0x0b024000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@b025000 {
 				frame-number = <3>;
 				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb025000 0x1000>;
+				reg = <0x0b025000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@b026000 {
 				frame-number = <4>;
 				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb026000 0x1000>;
+				reg = <0x0b026000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@b027000 {
 				frame-number = <5>;
 				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb027000 0x1000>;
+				reg = <0x0b027000 0x1000>;
 				status = "disabled";
 			};
 
 			frame@b028000 {
 				frame-number = <6>;
 				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
-				reg = <0xb028000 0x1000>;
+				reg = <0x0b028000 0x1000>;
 				status = "disabled";
 			};
 		};
 
 		spmi_bus: spmi@200f000 {
 			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x200f000 0x001000>,
-			      <0x2400000 0x400000>,
-			      <0x2c00000 0x400000>,
-			      <0x3800000 0x200000>,
-			      <0x200a000 0x002100>;
+			reg = <0x0200f000 0x001000>,
+			      <0x02400000 0x400000>,
+			      <0x02c00000 0x400000>,
+			      <0x03800000 0x200000>,
+			      <0x0200a000 0x002100>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
 			interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
@@ -918,7 +918,7 @@ rng@22000 {
 
 		qfprom: qfprom@5c000 {
 			compatible = "qcom,qfprom";
-			reg = <0x5c000 0x1000>;
+			reg = <0x0005c000 0x1000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			tsens_caldata: caldata@d0 {
@@ -931,8 +931,8 @@ tsens_calsel: calsel@ec {
 
 		tsens: thermal-sensor@4a9000 {
 			compatible = "qcom,msm8916-tsens", "qcom,tsens-v0_1";
-			reg = <0x4a9000 0x1000>, /* TM */
-			      <0x4a8000 0x1000>; /* SROT */
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
 			nvmem-cells = <&tsens_caldata>, <&tsens_calsel>;
 			nvmem-cell-names = "calib", "calib_sel";
 			#qcom,sensors = <5>;
@@ -946,8 +946,8 @@ apps_iommu: iommu@1ef0000 {
 			#size-cells = <1>;
 			#iommu-cells = <1>;
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
-			ranges = <0 0x1e20000 0x40000>;
-			reg = <0x1ef0000 0x3000>;
+			ranges = <0 0x01e20000 0x40000>;
+			reg = <0x01ef0000 0x3000>;
 			clocks = <&gcc GCC_SMMU_CFG_CLK>,
 				 <&gcc GCC_APSS_TCU_CLK>;
 			clock-names = "iface", "bus";
@@ -980,7 +980,7 @@ gpu_iommu: iommu@1f08000 {
 			#size-cells = <1>;
 			#iommu-cells = <1>;
 			compatible = "qcom,msm8916-iommu", "qcom,msm-iommu-v1";
-			ranges = <0 0x1f08000 0x10000>;
+			ranges = <0 0x01f08000 0x10000>;
 			clocks = <&gcc GCC_SMMU_CFG_CLK>,
 				 <&gcc GCC_GFX_TCU_CLK>;
 			clock-names = "iface", "bus";
@@ -1039,8 +1039,8 @@ opp-19200000 {
 
 		mdss: mdss@1a00000 {
 			compatible = "qcom,mdss";
-			reg = <0x1a00000 0x1000>,
-			      <0x1ac8000 0x3000>;
+			reg = <0x01a00000 0x1000>,
+			      <0x01ac8000 0x3000>;
 			reg-names = "mdss_phys", "vbif_phys";
 
 			power-domains = <&gcc MDSS_GDSC>;
@@ -1063,7 +1063,7 @@ mdss: mdss@1a00000 {
 
 			mdp: mdp@1a01000 {
 				compatible = "qcom,mdp5";
-				reg = <0x1a01000 0x89000>;
+				reg = <0x01a01000 0x89000>;
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
@@ -1095,7 +1095,7 @@ mdp5_intf1_out: endpoint {
 
 			dsi0: dsi@1a98000 {
 				compatible = "qcom,mdss-dsi-ctrl";
-				reg = <0x1a98000 0x25c>;
+				reg = <0x01a98000 0x25c>;
 				reg-names = "dsi_ctrl";
 
 				interrupt-parent = <&mdss>;
@@ -1145,9 +1145,9 @@ dsi0_out: endpoint {
 
 			dsi_phy0: dsi-phy@1a98300 {
 				compatible = "qcom,dsi-phy-28nm-lp";
-				reg = <0x1a98300 0xd4>,
-				      <0x1a98500 0x280>,
-				      <0x1a98780 0x30>;
+				reg = <0x01a98300 0xd4>,
+				      <0x01a98500 0x280>,
+				      <0x01a98780 0x30>;
 				reg-names = "dsi_pll",
 					    "dsi_phy",
 					    "dsi_phy_regulator";
@@ -1289,7 +1289,7 @@ wifi {
 
 		tpiu: tpiu@820000 {
 			compatible = "arm,coresight-tpiu", "arm,primecell";
-			reg = <0x820000 0x1000>;
+			reg = <0x00820000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1307,7 +1307,7 @@ tpiu_in: endpoint {
 
 		funnel0: funnel@821000 {
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x821000 0x1000>;
+			reg = <0x00821000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1348,7 +1348,7 @@ funnel0_out: endpoint {
 
 		replicator: replicator@824000 {
 			compatible = "arm,coresight-dynamic-replicator", "arm,primecell";
-			reg = <0x824000 0x1000>;
+			reg = <0x00824000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1384,7 +1384,7 @@ replicator_in: endpoint {
 
 		etf: etf@825000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x825000 0x1000>;
+			reg = <0x00825000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1410,7 +1410,7 @@ etf_out: endpoint {
 
 		etr: etr@826000 {
 			compatible = "arm,coresight-tmc", "arm,primecell";
-			reg = <0x826000 0x1000>;
+			reg = <0x00826000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1428,7 +1428,7 @@ etr_in: endpoint {
 
 		funnel1: funnel@841000 {	/* APSS funnel only 4 inputs are used */
 			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
-			reg = <0x841000 0x1000>;
+			reg = <0x00841000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1476,7 +1476,7 @@ funnel1_out: endpoint {
 
 		debug0: debug@850000 {
 			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x850000 0x1000>;
+			reg = <0x00850000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			cpu = <&CPU0>;
@@ -1485,7 +1485,7 @@ debug0: debug@850000 {
 
 		debug1: debug@852000 {
 			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x852000 0x1000>;
+			reg = <0x00852000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			cpu = <&CPU1>;
@@ -1494,7 +1494,7 @@ debug1: debug@852000 {
 
 		debug2: debug@854000 {
 			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x854000 0x1000>;
+			reg = <0x00854000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			cpu = <&CPU2>;
@@ -1503,7 +1503,7 @@ debug2: debug@854000 {
 
 		debug3: debug@856000 {
 			compatible = "arm,coresight-cpu-debug", "arm,primecell";
-			reg = <0x856000 0x1000>;
+			reg = <0x00856000 0x1000>;
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
 			cpu = <&CPU3>;
@@ -1512,7 +1512,7 @@ debug3: debug@856000 {
 
 		etm0: etm@85c000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x85c000 0x1000>;
+			reg = <0x0085c000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1533,7 +1533,7 @@ etm0_out: endpoint {
 
 		etm1: etm@85d000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x85d000 0x1000>;
+			reg = <0x0085d000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1554,7 +1554,7 @@ etm1_out: endpoint {
 
 		etm2: etm@85e000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x85e000 0x1000>;
+			reg = <0x0085e000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1575,7 +1575,7 @@ etm2_out: endpoint {
 
 		etm3: etm@85f000 {
 			compatible = "arm,coresight-etm4x", "arm,primecell";
-			reg = <0x85f000 0x1000>;
+			reg = <0x0085f000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>, <&rpmcc RPM_QDSS_A_CLK>;
 			clock-names = "apb_pclk", "atclk";
@@ -1598,7 +1598,7 @@ etm3_out: endpoint {
 		/* CTI 0 - TMC connections */
 		cti0: cti@810000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
-			reg = <0x810000 0x1000>;
+			reg = <0x00810000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1609,7 +1609,7 @@ cti0: cti@810000 {
 		/* CTI 1 - TPIU connections */
 		cti1: cti@811000 {
 			compatible = "arm,coresight-cti", "arm,primecell";
-			reg = <0x811000 0x1000>;
+			reg = <0x00811000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1624,7 +1624,7 @@ cti1: cti@811000 {
 		cti12: cti@858000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
-			reg = <0x858000 0x1000>;
+			reg = <0x00858000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1639,7 +1639,7 @@ cti12: cti@858000 {
 		cti13: cti@859000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
-			reg = <0x859000 0x1000>;
+			reg = <0x00859000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1654,7 +1654,7 @@ cti13: cti@859000 {
 		cti14: cti@85a000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
-			reg = <0x85a000 0x1000>;
+			reg = <0x0085a000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1669,7 +1669,7 @@ cti14: cti@85a000 {
 		cti15: cti@85b000 {
 			compatible = "arm,coresight-cti-v8-arch", "arm,coresight-cti",
 				     "arm,primecell";
-			reg = <0x85b000 0x1000>;
+			reg = <0x0085b000 0x1000>;
 
 			clocks = <&rpmcc RPM_QDSS_CLK>;
 			clock-names = "apb_pclk";
@@ -1704,15 +1704,15 @@ video-encoder {
 
 		camss: camss@1b00000 {
 			compatible = "qcom,msm8916-camss";
-			reg = <0x1b0ac00 0x200>,
-				<0x1b00030 0x4>,
-				<0x1b0b000 0x200>,
-				<0x1b00038 0x4>,
-				<0x1b08000 0x100>,
-				<0x1b08400 0x100>,
-				<0x1b0a000 0x500>,
-				<0x1b00020 0x10>,
-				<0x1b10000 0x1000>;
+			reg = <0x01b0ac00 0x200>,
+				<0x01b00030 0x4>,
+				<0x01b0b000 0x200>,
+				<0x01b00038 0x4>,
+				<0x01b08000 0x100>,
+				<0x01b08400 0x100>,
+				<0x01b0a000 0x500>,
+				<0x01b00020 0x10>,
+				<0x01b10000 0x1000>;
 			reg-names = "csiphy0",
 				"csiphy0_clk_mux",
 				"csiphy1",
@@ -1785,7 +1785,7 @@ cci: cci@1b0c000 {
 			compatible = "qcom,msm8916-cci";
 			#address-cells = <1>;
 			#size-cells = <0>;
-			reg = <0x1b0c000 0x1000>;
+			reg = <0x01b0c000 0x1000>;
 			interrupts = <GIC_SPI 50 IRQ_TYPE_EDGE_RISING>;
 			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
 				<&gcc GCC_CAMSS_CCI_AHB_CLK>,
-- 
2.28.0

