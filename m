Return-Path: <linux-arm-msm+bounces-28284-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 920CB94E579
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 05:09:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4A432283AFF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Aug 2024 03:09:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EA2ED160796;
	Mon, 12 Aug 2024 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uBsOrWR5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB21B15F40D;
	Mon, 12 Aug 2024 03:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723432067; cv=none; b=lK17fiO0W9LuH+eaYfZQsXNbRWO2z1u0ds5ABAbqkKSm4vciQ3uPVSksuu2ZAAKXuWUAG1CR4XRioeb4+g0Cc66FSE+n8xfM7350KjZhOzH1lmWkUE8ccuSq1ZnFCyOFNT4ECYGA39ScePtxDj2o8TPx2xTOu/Op2s8tUn48JMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723432067; c=relaxed/simple;
	bh=ZMLJ9pPIi9kHRkPk2K0NygFWecglovZdtcmo/TeKBtM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sKVEwrK93ysidthHEnPd+5qUP1IPxl6RXvXOApI9LmiamzU13v1szyKtAKRqnPqSNsE1m7IgVycMV6eto3/7iniuens9e7dPWEyJaTdVJ2CVexhIcNIlnyNUmp8ExmH/E/Rd9dxZbyaTuEgYPTTtu5Ni1DtDMTgLlDkHJ5ovy68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uBsOrWR5; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC6FC4AF16;
	Mon, 12 Aug 2024 03:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723432067;
	bh=ZMLJ9pPIi9kHRkPk2K0NygFWecglovZdtcmo/TeKBtM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uBsOrWR5MCIiPResDGlQd9kA/PD27JYl9xsJHJ0p2KX6TPpfpIIAIXiNTWoQSeEuI
	 YDpWk/umtQ6zONqOWfMnrCkO7CsAVSa1M0LcTyUVIvJzx3/N2fuHevwx/gEF+s8N7d
	 5NUv2lybYGsfkIq9VvOF5YN7q1L7wWYOr9dG6NxPwB9/LJJqFXIfFdu1fi77Vrlt3l
	 0JeV1weDVCutZLYWY83gz+OyPzAtlIveyGw6ORJfqOyuDeoVrLxAR7vp95RCifjtqK
	 3d+qgb976bHblS7qaiC/Sh37gauyKrpVy24rFiFTfseNxZ7c1QkxsSObzHrgnzSTzp
	 x7kJ79Q7+Qyvg==
From: Bjorn Andersson <andersson@kernel.org>
Date: Sun, 11 Aug 2024 20:12:04 -0700
Subject: [PATCH v2 7/7] arm64: dts: qcom: sc8280x: Flatten the USB nodes
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240811-dwc3-refactor-v2-7-91f370d61ad2@quicinc.com>
References: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
In-Reply-To: <20240811-dwc3-refactor-v2-0-91f370d61ad2@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, 
 Saravana Kannan <saravanak@google.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10789;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=ggefVf6XQBGQDWN2yAfMd09rN0KNdbHw8e8F3SkA0gg=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmuX2AllSynWe3srRI+4Ss6O6cBQU1GZxHaaxPk
 xlQAJ0KX9uJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZrl9gBUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcUIpQ/5AcDYk0bJalO67iJ0pGNwz79/7hTUsEhY3IQY6R6
 n0Ssl9D/F+PFPPjXrl/ZRIQ6afwTOj4mcKa/Cg6auMHVkXusd5D7EXQMl0tS6tHccW5auNIJjQz
 U1fon7KOL9Py4sZDpSVL2iLfi0u9qqbi45jhi3bARws7uIbRCXnv/IN9z1xM6ClSDm2Yv6XSYvv
 kbWnI964Dam2n74CfDaEUnBy1cDgC+1rm4Hwl5jh5T/lCLX7ojWElUMNeKpWb16fWqC74gneCp+
 t2kbrhpUN71ZILh9PHrcU4M/T1+HaZP9wK/oSFnat/1XhbwBFQD07NQU13s7vCpIaZhBAZUS830
 VrNwh2naarcfz6GYE0SyPaEYqhykECOxxf67S0gKGu+3rutT1L8ceabmm6aIu54rt6DAPqWDj2/
 233ODQqX5fmQre0Kn/p8mtUfWWprFTDp+MaAB0KSnbo5vygvlAhbipn94/CuSxO1XUG3obAuThy
 ABjAWCw6xvayCo+89i2nGiVkHpAzDzWxzpWp3ZuJ5iyYQUc/5xSf0/idr9od/wrs/i4VhGlnSa/
 8dQRsO67idZHZyGjcgB3NMorWAZ1Q4ZkF+PX8UTdrPlmFT6VBLpmRijKQUhg3TKl5sg01QuD1K+
 QCXUI4qYbhflzrWYwRy/JqYXWuLInDJ7FEaU4FCRMK2Y=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5

From: Bjorn Andersson <quic_bjorande@quicinc.com>

Transition the three USB controllers found in sc8280xp to the newly
introduced, flattened representation of the Qualcomm USB block, i.e.
qcom,snps-dwc3, to show the end result.

The reg and interrupts properties from the usb child node are merged
with their counterpart in the outer node, remaining properties and child
nodes are simply moved.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           |  12 +-
 arch/arm64/boot/dts/qcom/sa8540p-ride.dts          |   5 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  12 +-
 .../dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts     |  11 +-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 138 +++++++++------------
 5 files changed, 74 insertions(+), 104 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
index 78e933c42c31..f19c39a34607 100644
--- a/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
+++ b/arch/arm64/boot/dts/qcom/sa8295p-adp.dts
@@ -590,12 +590,10 @@ &ufs_card_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "peripheral";
+
+	status = "okay";
 };
 
 &usb_0_hsphy {
@@ -614,12 +612,10 @@ &usb_0_qmpphy {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	/* TODO: Define USB-C connector properly */
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
index 177b9dad6ff7..7be803fb7cbe 100644
--- a/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8540p-ride.dts
@@ -466,11 +466,8 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "peripheral";
+	status = "okay";
 };
 
 &usb_0_hsphy {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
index b98b2f7752b5..c910c7096e11 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-crd.dts
@@ -668,11 +668,9 @@ &ufs_mem_phy {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -705,11 +703,9 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
index b27143f81867..f66c87e0c10c 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
+++ b/arch/arm64/boot/dts/qcom/sc8280xp-lenovo-thinkpad-x13s.dts
@@ -1225,11 +1225,9 @@ bluetooth {
 };
 
 &usb_0 {
-	status = "okay";
-};
-
-&usb_0_dwc3 {
 	dr_mode = "host";
+
+	status = "okay";
 };
 
 &usb_0_dwc3_hs {
@@ -1262,11 +1260,8 @@ &usb_0_qmpphy_out {
 };
 
 &usb_1 {
-	status = "okay";
-};
-
-&usb_1_dwc3 {
 	dr_mode = "host";
+	status = "okay";
 };
 
 &usb_1_dwc3_hs {
diff --git a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
index 80a57aa22839..f4c8f76c0bea 100644
--- a/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc8280xp.dtsi
@@ -3439,12 +3439,9 @@ system-cache-controller@9200000 {
 			interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		usb_2: usb@a4f8800 {
-			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,dwc3";
-			reg = <0 0x0a4f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_2: usb@a400000 {
+			compatible = "qcom,sc8280xp-dwc3-mp", "qcom,snps-dwc3";
+			reg = <0 0x0a400000 0 0x10000>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_MP_AXI_CLK>,
 				 <&gcc GCC_USB30_MP_MASTER_CLK>,
@@ -3462,7 +3459,8 @@ usb_2: usb@a4f8800 {
 					  <&gcc GCC_USB30_MP_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 857 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 856 IRQ_TYPE_LEVEL_HIGH>,
@@ -3481,7 +3479,8 @@ usb_2: usb@a4f8800 {
 					      <&pdc 16 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
 
-			interrupt-names = "pwr_event_1", "pwr_event_2",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event_1", "pwr_event_2",
 					  "pwr_event_3", "pwr_event_4",
 					  "hs_phy_1",	 "hs_phy_2",
 					  "hs_phy_3",	 "hs_phy_4",
@@ -3491,6 +3490,7 @@ usb_2: usb@a4f8800 {
 					  "dp_hs_phy_4", "dm_hs_phy_4",
 					  "ss_phy_1",	 "ss_phy_2";
 
+			iommus = <&apps_smmu 0x800 0x0>;
 			power-domains = <&gcc USB30_MP_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3500,33 +3500,25 @@ usb_2: usb@a4f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_MP 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
+			       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
+			       <&usb_2_hsphy2>,
+			       <&usb_2_hsphy3>;
+			phy-names = "usb2-0", "usb3-0",
+				    "usb2-1", "usb3-1",
+				    "usb2-2",
+				    "usb2-3";
+
 			wakeup-source;
 
-			status = "disabled";
+			dr_mode = "host";
 
-			usb_2_dwc3: usb@a400000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a400000 0 0xcd00>;
-				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x800 0x0>;
-				phys = <&usb_2_hsphy0>, <&usb_2_qmpphy0>,
-				       <&usb_2_hsphy1>, <&usb_2_qmpphy1>,
-				       <&usb_2_hsphy2>,
-				       <&usb_2_hsphy3>;
-				phy-names = "usb2-0", "usb3-0",
-					    "usb2-1", "usb3-1",
-					    "usb2-2",
-					    "usb2-3";
-				dr_mode = "host";
-			};
+			status = "disabled";
 		};
 
-		usb_0: usb@a6f8800 {
-			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a6f8800 0 0x400>;
-			#address-cells = <2>;
-			#size-cells = <2>;
-			ranges;
+		usb_0: usb@a600000 {
+			compatible = "qcom,sc8280xp-dwc3", "qcom,snps-dwc3";
+			reg = <0 0x0a600000 0 0x20000>;
 
 			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
 				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
@@ -3544,17 +3536,20 @@ usb_0: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 804 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 805 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 138 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x820 0x0>;
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3564,43 +3559,37 @@ usb_0: usb@a6f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_0 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
 			wakeup-source;
 
 			status = "disabled";
 
-			usb_0_dwc3: usb@a600000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a600000 0 0xcd00>;
-				interrupts = <GIC_SPI 803 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x820 0x0>;
-				phys = <&usb_0_hsphy>, <&usb_0_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_0_dwc3_hs: endpoint {
-						};
+					usb_0_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_0_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
-						};
+					usb_0_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_0_qmpphy_usb_ss_in>;
 					};
 				};
 			};
 		};
 
-		usb_1: usb@a8f8800 {
+		usb_1: usb@a800000 {
 			compatible = "qcom,sc8280xp-dwc3", "qcom,dwc3";
-			reg = <0 0x0a8f8800 0 0x400>;
+			reg = <0 0x0a800000 0 0x10000>;
 			#address-cells = <2>;
 			#size-cells = <2>;
 			ranges;
@@ -3621,17 +3610,20 @@ usb_1: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <200000000>;
 
-			interrupts-extended = <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts-extended = <&intc GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 811 IRQ_TYPE_LEVEL_HIGH>,
 					      <&intc GIC_SPI 790 IRQ_TYPE_LEVEL_HIGH>,
 					      <&pdc 12 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 13 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 136 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "pwr_event",
+			interrupt-names = "dwc_usb3",
+					  "pwr_event",
 					  "hs_phy_irq",
 					  "dp_hs_phy_irq",
 					  "dm_hs_phy_irq",
 					  "ss_phy_irq";
 
+			iommus = <&apps_smmu 0x860 0x0>;
 			power-domains = <&gcc USB30_SEC_GDSC>;
 			required-opps = <&rpmhpd_opp_nom>;
 
@@ -3641,35 +3633,29 @@ usb_1: usb@a8f8800 {
 					<&gem_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_USB3_1 0>;
 			interconnect-names = "usb-ddr", "apps-usb";
 
+			phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
+			phy-names = "usb2-phy", "usb3-phy";
+
 			wakeup-source;
 
 			status = "disabled";
 
-			usb_1_dwc3: usb@a800000 {
-				compatible = "snps,dwc3";
-				reg = <0 0x0a800000 0 0xcd00>;
-				interrupts = <GIC_SPI 810 IRQ_TYPE_LEVEL_HIGH>;
-				iommus = <&apps_smmu 0x860 0x0>;
-				phys = <&usb_1_hsphy>, <&usb_1_qmpphy QMP_USB43DP_USB3_PHY>;
-				phy-names = "usb2-phy", "usb3-phy";
-
-				ports {
-					#address-cells = <1>;
-					#size-cells = <0>;
+			ports {
+				#address-cells = <1>;
+				#size-cells = <0>;
 
-					port@0 {
-						reg = <0>;
+				port@0 {
+					reg = <0>;
 
-						usb_1_dwc3_hs: endpoint {
-						};
+					usb_1_dwc3_hs: endpoint {
 					};
+				};
 
-					port@1 {
-						reg = <1>;
+				port@1 {
+					reg = <1>;
 
-						usb_1_dwc3_ss: endpoint {
-							remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
-						};
+					usb_1_dwc3_ss: endpoint {
+						remote-endpoint = <&usb_1_qmpphy_usb_ss_in>;
 					};
 				};
 			};

-- 
2.45.2


