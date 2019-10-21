Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D0BBDE391
	for <lists+linux-arm-msm@lfdr.de>; Mon, 21 Oct 2019 07:13:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727151AbfJUFNi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 21 Oct 2019 01:13:38 -0400
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46988 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727137AbfJUFNh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 21 Oct 2019 01:13:37 -0400
Received: by mail-pl1-f193.google.com with SMTP id q24so6005237plr.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 20 Oct 2019 22:13:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Qzuor+bz/mXJf07v2LRthYyEraVLXhacVjkIIk2IeZE=;
        b=LQZFUctjPRYCbUtUlKaw/G/Llv4lfiGh9aY74galAxqNDlDXrdKciJZggxi7q6sRPK
         C1LMGiR/kZ9fp2v6OX41g/tnhDrtZjN3Gu7WpaKYQGGxXiJScCBXejryWVs0AVJw+zT2
         R5q1FDwlgFfPFbmeV0FkJ9n79ZCj7WPwGaom7qrz/D4iAoAS47A9MFWR+qEt2ffRhli1
         ndbnLYgTxM9VJ/Mmb+S9nq3U7+6CEto9V4hvxoVlnrDEbu/G0pYCVU0T6jVMxPSrXlZr
         BYr0DPcKErCfpH8CG4zjLHA51gjNc5sziXcW9BqEIzpxX5QP4b8eB4ko4DMY3FLTAcAb
         aAPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Qzuor+bz/mXJf07v2LRthYyEraVLXhacVjkIIk2IeZE=;
        b=QXomum5jd87GZPiMD0xInTIdbvuaW3377Wu5M5FYZWJEiluJvFsawDDGhqq7OM+eGY
         sQ8APxrLOUpKcPcgiEjn/NIRZmNeuMn+QEWN9y19dMV+fZ6t9YVJNwp7raKFlAm2gNnG
         jGqSWSSvcOQWb0NmC/r77nnPjgNPVidBgTNYsq+ZLHtHH8yy4SYlwdN9ZUwPCBcNSOqj
         a78iAW4nwwyJMRtNYI9x3IT0mWgtr1/Gv4cyx30hesvga9UdYeknXLURC4h/zIRGmHku
         PodluycByVZTNXs3gSOMdZrLjjR29wREPQ0gBW1f7q+iDP3HPoYz4ZUGZWamvVdPeTe7
         eRJQ==
X-Gm-Message-State: APjAAAWX0ps9UPWN/y5Nzge2oAe14JomDWlBHRL0E5eP5J2DX72CEisM
        nikimicuNuk/QTa9FSBxnxlOTw==
X-Google-Smtp-Source: APXvYqzdGhzM4ofoT/l0GvlpCPxF4ayTAiSBtOcG1NfJOejYhLahLJflbm+hdZzcP+uXXIx2QGKyrw==
X-Received: by 2002:a17:902:7d8e:: with SMTP id a14mr22819853plm.260.1571634816597;
        Sun, 20 Oct 2019 22:13:36 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id h68sm15716862pfb.149.2019.10.20.22.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2019 22:13:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 08/11] arm64: dts: qcom: msm8996: Pad addresses
Date:   Sun, 20 Oct 2019 22:13:19 -0700
Message-Id: <20191021051322.297560-9-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191021051322.297560-1-bjorn.andersson@linaro.org>
References: <20191021051322.297560-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Pad all addresses in msm8996.dtsi to 8 digits, in order to make it
easier to ensure ordering when adding new nodes.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 144 +++++++++++++-------------
 1 file changed, 72 insertions(+), 72 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 48b5981d01b0..6c1a6774396d 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -520,7 +520,7 @@
 
 		rpm_msg_ram: memory@68000 {
 			compatible = "qcom,rpm-msg-ram";
-			reg = <0x68000 0x6000>;
+			reg = <0x00068000 0x6000>;
 		};
 
 		rng: rng@83000 {
@@ -532,28 +532,28 @@
 
 		tcsr_mutex_regs: syscon@740000 {
 			compatible = "syscon";
-			reg = <0x740000 0x20000>;
+			reg = <0x00740000 0x20000>;
 		};
 
 		tsens0: thermal-sensor@4a9000 {
 			compatible = "qcom,msm8996-tsens";
-			reg = <0x4a9000 0x1000>, /* TM */
-			      <0x4a8000 0x1000>; /* SROT */
+			reg = <0x004a9000 0x1000>, /* TM */
+			      <0x004a8000 0x1000>; /* SROT */
 			#qcom,sensors = <13>;
 			#thermal-sensor-cells = <1>;
 		};
 
 		tsens1: thermal-sensor@4ad000 {
 			compatible = "qcom,msm8996-tsens";
-			reg = <0x4ad000 0x1000>, /* TM */
-			      <0x4ac000 0x1000>; /* SROT */
+			reg = <0x004ad000 0x1000>, /* TM */
+			      <0x004ac000 0x1000>; /* SROT */
 			#qcom,sensors = <8>;
 			#thermal-sensor-cells = <1>;
 		};
 
 		tcsr: syscon@7a0000 {
 			compatible = "qcom,tcsr-msm8996", "syscon";
-			reg = <0x7a0000 0x18000>;
+			reg = <0x007a0000 0x18000>;
 		};
 
 		intc: interrupt-controller@9bc0000 {
@@ -569,7 +569,7 @@
 
 		apcs_glb: mailbox@9820000 {
 			compatible = "qcom,msm8996-apcs-hmss-global";
-			reg = <0x9820000 0x1000>;
+			reg = <0x09820000 0x1000>;
 
 			#mbox-cells = <1>;
 		};
@@ -579,7 +579,7 @@
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			reg = <0x300000 0x90000>;
+			reg = <0x00300000 0x90000>;
 		};
 
 		stm@3002000 {
@@ -1052,7 +1052,7 @@
 
 		kryocc: clock-controller@6400000 {
 			compatible = "qcom,apcc-msm8996";
-			reg = <0x6400000 0x90000>;
+			reg = <0x06400000 0x90000>;
 			#clock-cells = <1>;
 		};
 
@@ -1098,7 +1098,7 @@
 
 		blsp2_uart1: serial@75b0000 {
 			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
-			reg = <0x75b0000 0x1000>;
+			reg = <0x075b0000 0x1000>;
 			interrupts = <GIC_SPI 114 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&gcc GCC_BLSP2_UART2_APPS_CLK>,
 				 <&gcc GCC_BLSP2_AHB_CLK>;
@@ -1164,7 +1164,7 @@
 		sdhc2: sdhci@74a4900 {
 			 status = "disabled";
 			 compatible = "qcom,sdhci-msm-v4";
-			 reg = <0x74a4900 0x314>, <0x74a4000 0x800>;
+			 reg = <0x074a4900 0x314>, <0x074a4000 0x800>;
 			 reg-names = "hc_mem", "core_mem";
 
 			 interrupts = <0 125 IRQ_TYPE_LEVEL_HIGH>,
@@ -1249,11 +1249,11 @@
 
 		spmi_bus: qcom,spmi@400f000 {
 			compatible = "qcom,spmi-pmic-arb";
-			reg = <0x400f000 0x1000>,
-			      <0x4400000 0x800000>,
-			      <0x4c00000 0x800000>,
-			      <0x5800000 0x200000>,
-			      <0x400a000 0x002100>;
+			reg = <0x0400f000 0x1000>,
+			      <0x04400000 0x800000>,
+			      <0x04c00000 0x800000>,
+			      <0x05800000 0x200000>,
+			      <0x0400a000 0x002100>;
 			reg-names = "core", "chnls", "obsrvr", "intr", "cnfg";
 			interrupt-names = "periph_irq";
 			interrupts = <GIC_SPI 326 IRQ_TYPE_LEVEL_HIGH>;
@@ -1267,7 +1267,7 @@
 
 		ufsphy: phy@627000 {
 			compatible = "qcom,msm8996-ufs-phy-qmp-14nm";
-			reg = <0x627000 0xda8>;
+			reg = <0x00627000 0xda8>;
 			reg-names = "phy_mem";
 			#phy-cells = <0>;
 
@@ -1280,7 +1280,7 @@
 
 		ufshc: ufshc@624000 {
 			compatible = "qcom,ufshc";
-			reg = <0x624000 0x2500>;
+			reg = <0x00624000 0x2500>;
 			interrupts = <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>;
 
 			phys = <&ufsphy>;
@@ -1339,7 +1339,7 @@
 			#clock-cells = <1>;
 			#reset-cells = <1>;
 			#power-domain-cells = <1>;
-			reg = <0x8c0000 0x40000>;
+			reg = <0x008c0000 0x40000>;
 			assigned-clocks = <&mmcc MMPLL9_PLL>,
 					  <&mmcc MMPLL1_PLL>,
 					  <&mmcc MMPLL3_PLL>,
@@ -1354,7 +1354,7 @@
 
 		qfprom@74000 {
 			compatible = "qcom,qfprom";
-			reg = <0x74000 0x8ff>;
+			reg = <0x00074000 0x8ff>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 
@@ -1376,7 +1376,7 @@
 
 		pcie_phy: phy@34000 {
 			compatible = "qcom,msm8996-qmp-pcie-phy";
-			reg = <0x34000 0x488>;
+			reg = <0x00034000 0x488>;
 			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1394,9 +1394,9 @@
 			status = "disabled";
 
 			pciephy_0: lane@35000 {
-				reg = <0x035000 0x130>,
-					<0x035200 0x200>,
-					<0x035400 0x1dc>;
+				reg = <0x00035000 0x130>,
+				      <0x00035200 0x200>,
+				      <0x00035400 0x1dc>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_0_pipe_clk_src";
@@ -1407,9 +1407,9 @@
 			};
 
 			pciephy_1: lane@36000 {
-				reg = <0x036000 0x130>,
-					<0x036200 0x200>,
-					<0x036400 0x1dc>;
+				reg = <0x00036000 0x130>,
+				      <0x00036200 0x200>,
+				      <0x00036400 0x1dc>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_1_pipe_clk_src";
@@ -1420,9 +1420,9 @@
 			};
 
 			pciephy_2: lane@37000 {
-				reg = <0x037000 0x130>,
-					<0x037200 0x200>,
-					<0x037400 0x1dc>;
+				reg = <0x00037000 0x130>,
+				      <0x00037200 0x200>,
+				      <0x00037400 0x1dc>;
 				#phy-cells = <0>;
 
 				clock-output-names = "pcie_2_pipe_clk_src";
@@ -1435,7 +1435,7 @@
 
 		usb3phy: phy@7410000 {
 			compatible = "qcom,msm8996-qmp-usb3-phy";
-			reg = <0x7410000 0x1c4>;
+			reg = <0x07410000 0x1c4>;
 			#clock-cells = <1>;
 			#address-cells = <1>;
 			#size-cells = <1>;
@@ -1452,9 +1452,9 @@
 			status = "disabled";
 
 			ssusb_phy_0: lane@7410200 {
-				reg = <0x7410200 0x200>,
-					<0x7410400 0x130>,
-					<0x7410600 0x1a8>;
+				reg = <0x07410200 0x200>,
+				      <0x07410400 0x130>,
+				      <0x07410600 0x1a8>;
 				#phy-cells = <0>;
 
 				clock-output-names = "usb3_phy_pipe_clk_src";
@@ -1465,7 +1465,7 @@
 
 		hsusb_phy1: phy@7411000 {
 			compatible = "qcom,msm8996-qusb2-phy";
-			reg = <0x7411000 0x180>;
+			reg = <0x07411000 0x180>;
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
@@ -1479,7 +1479,7 @@
 
 		hsusb_phy2: phy@7412000 {
 			compatible = "qcom,msm8996-qusb2-phy";
-			reg = <0x7412000 0x180>;
+			reg = <0x07412000 0x180>;
 			#phy-cells = <0>;
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB2PHY_CLK>,
@@ -1493,7 +1493,7 @@
 
 		usb2: usb@76f8800 {
 			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
-			reg = <0x76f8800 0x400>;
+			reg = <0x076f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1513,7 +1513,7 @@
 
 			dwc3@7600000 {
 				compatible = "snps,dwc3";
-				reg = <0x7600000 0xcc00>;
+				reg = <0x07600000 0xcc00>;
 				interrupts = <0 138 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy2>;
 				phy-names = "usb2-phy";
@@ -1522,7 +1522,7 @@
 
 		usb3: usb@6af8800 {
 			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
-			reg = <0x6af8800 0x400>;
+			reg = <0x06af8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
@@ -1543,7 +1543,7 @@
 
 			dwc3@6a00000 {
 				compatible = "snps,dwc3";
-				reg = <0x6a00000 0xcc00>;
+				reg = <0x06a00000 0xcc00>;
 				interrupts = <0 131 IRQ_TYPE_LEVEL_HIGH>;
 				phys = <&hsusb_phy1>, <&ssusb_phy_0>;
 				phy-names = "usb2-phy", "usb3-phy";
@@ -1552,7 +1552,7 @@
 
 		vfe_smmu: iommu@da0000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-			reg = <0xda0000 0x10000>;
+			reg = <0x00da0000 0x10000>;
 
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
@@ -1568,20 +1568,20 @@
 
 		camss: camss@a00000 {
 			compatible = "qcom,msm8996-camss";
-			reg = <0xa34000 0x1000>,
-				<0xa00030 0x4>,
-				<0xa35000 0x1000>,
-				<0xa00038 0x4>,
-				<0xa36000 0x1000>,
-				<0xa00040 0x4>,
-				<0xa30000 0x100>,
-				<0xa30400 0x100>,
-				<0xa30800 0x100>,
-				<0xa30c00 0x100>,
-				<0xa31000 0x500>,
-				<0xa00020 0x10>,
-				<0xa10000 0x1000>,
-				<0xa14000 0x1000>;
+			reg = <0x00a34000 0x1000>,
+			      <0x00a00030 0x4>,
+			      <0x00a35000 0x1000>,
+			      <0x00a00038 0x4>,
+			      <0x00a36000 0x1000>,
+			      <0x00a00040 0x4>,
+			      <0x00a30000 0x100>,
+			      <0x00a30400 0x100>,
+			      <0x00a30800 0x100>,
+			      <0x00a30c00 0x100>,
+			      <0x00a31000 0x500>,
+			      <0x00a00020 0x10>,
+			      <0x00a10000 0x1000>,
+			      <0x00a14000 0x1000>;
 			reg-names = "csiphy0",
 				"csiphy0_clk_mux",
 				"csiphy1",
@@ -1702,7 +1702,7 @@
 
 		adreno_smmu: iommu@b40000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-			reg = <0xb40000 0x10000>;
+			reg = <0x00b40000 0x10000>;
 
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 334 IRQ_TYPE_LEVEL_HIGH>,
@@ -1719,7 +1719,7 @@
 
 		mdp_smmu: iommu@d00000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-			reg = <0xd00000 0x10000>;
+			reg = <0x00d00000 0x10000>;
 
 			#global-interrupts = <1>;
 			interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>,
@@ -1735,7 +1735,7 @@
 
 		lpass_q6_smmu: iommu@1600000 {
 			compatible = "qcom,msm8996-smmu-v2", "qcom,smmu-v2";
-			reg = <0x1600000 0x20000>;
+			reg = <0x01600000 0x20000>;
 			#iommu-cells = <1>;
 			power-domains = <&gcc HLOS1_VOTE_LPASS_CORE_GDSC>;
 
@@ -1922,7 +1922,7 @@
 		{
 			compatible = "qcom,bam-v1.7.0";
 			qcom,controlled-remotely;
-			reg = <0x9184000 0x32000>;
+			reg = <0x09184000 0x32000>;
 			num-channels  = <31>;
 			interrupts = <0 164 IRQ_TYPE_LEVEL_HIGH>;
 			#dma-cells = <1>;
@@ -1932,7 +1932,7 @@
 
 		slim_msm: slim@91c0000 {
 			compatible = "qcom,slim-ngd-v1.5.0";
-			reg = <0x91c0000 0x2C000>;
+			reg = <0x091c0000 0x2C000>;
 			reg-names = "ctrl";
 			interrupts = <0 163 IRQ_TYPE_LEVEL_HIGH>;
 			dmas =	<&slimbam 3>, <&slimbam 4>,
@@ -1976,7 +1976,7 @@
 			compatible = "qcom,adreno-530.2", "qcom,adreno";
 			#stream-id-cells = <16>;
 
-			reg = <0xb00000 0x3f000>;
+			reg = <0x00b00000 0x3f000>;
 			reg-names = "kgsl_3d0_reg_memory";
 
 			interrupts = <0 300 IRQ_TYPE_LEVEL_HIGH>;
@@ -2050,9 +2050,9 @@
 		mdss: mdss@900000 {
 			compatible = "qcom,mdss";
 
-			reg = <0x900000 0x1000>,
-			      <0x9b0000 0x1040>,
-			      <0x9b8000 0x1040>;
+			reg = <0x00900000 0x1000>,
+			      <0x009b0000 0x1040>,
+			      <0x009b8000 0x1040>;
 			reg-names = "mdss_phys",
 				    "vbif_phys",
 				    "vbif_nrt_phys";
@@ -2072,7 +2072,7 @@
 
 			mdp: mdp@901000 {
 				compatible = "qcom,mdp5";
-				reg = <0x901000 0x90000>;
+				reg = <0x00901000 0x90000>;
 				reg-names = "mdp_phys";
 
 				interrupt-parent = <&mdss>;
@@ -2148,12 +2148,12 @@
 			hdmi_phy: hdmi-phy@9a0600 {
 				#phy-cells = <0>;
 				compatible = "qcom,hdmi-phy-8996";
-				reg = <0x9a0600 0x1c4>,
-				      <0x9a0a00 0x124>,
-				      <0x9a0c00 0x124>,
-				      <0x9a0e00 0x124>,
-				      <0x9a1000 0x124>,
-				      <0x9a1200 0x0c8>;
+				reg = <0x009a0600 0x1c4>,
+				      <0x009a0a00 0x124>,
+				      <0x009a0c00 0x124>,
+				      <0x009a0e00 0x124>,
+				      <0x009a1000 0x124>,
+				      <0x009a1200 0x0c8>;
 				reg-names = "hdmi_pll",
 					    "hdmi_tx_l0",
 					    "hdmi_tx_l1",
-- 
2.23.0

