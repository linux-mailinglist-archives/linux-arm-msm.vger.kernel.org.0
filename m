Return-Path: <linux-arm-msm+bounces-1568-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 800D97F505D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 20:14:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 200E4B20CE0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Nov 2023 19:14:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A0C55C902;
	Wed, 22 Nov 2023 19:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CORhtxzX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A64918E;
	Wed, 22 Nov 2023 11:14:39 -0800 (PST)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AMHj3k1015562;
	Wed, 22 Nov 2023 19:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=lV5CUkjp0mJjA1MdbbLRFvxGUyuxj7niHvM/mYwrlnw=;
 b=CORhtxzXaPHOkHkiK/yyu9sKijVJCopkbuZWRJTKU+gmPbpSS3KcPPEb6987WbDAxF0M
 LFc08A91gqS6FW8fCVcebYKQCswCtI7MclW9wuVExA2Sd5OzydbT0xbMTYHrAddnj42B
 v8tJ1tztCYrGQS1alJ+TNMkYV8OSLWov7eOz8RrVAZCq4e2XLx/TrWp1OpKSSgNyoKDX
 2IkFjeu2M3PUTPMyzamapH3Hd0B+wLAi+Qq8fQn4Y/aix74IAJwaaXGS5zRAtyF2Uxuh
 BQXeNBRYGjCkkZVYzUYVGbNugGg50Glzrm8h6eWo/IAprSUida5Opk3rlebfBBxAvXLB EA== 
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ugvt2m5pd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 19:14:35 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AMJEZNV032557
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Nov 2023 19:14:35 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Wed, 22 Nov 2023 11:14:30 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, <quic_wcheng@quicinc.com>,
        Krishna Kurapati
	<quic_kriskura@quicinc.com>
Subject: [PATCH 3/6] arm64: dts: qcom: Fix hs_phy_irq for QUSB2 targets
Date: Thu, 23 Nov 2023 00:44:21 +0530
Message-ID: <20231122191421.3132-1-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: jqYkEVxxPwYgvWn_wlkpp2FduFSzn2bE
X-Proofpoint-ORIG-GUID: jqYkEVxxPwYgvWn_wlkpp2FduFSzn2bE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-22_13,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 phishscore=0
 impostorscore=0 mlxlogscore=839 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2311060000 definitions=main-2311220139

On several QUSB2 Targets, the hs_phy_irq mentioned is actually
qusb2_phy interrupt specific to QUSB2 Phy's. Rename hs_phy_irq
to qusb_phy for such targets.

In actuality, the hs_phy_irq is also present in these targets, but
kept in for debug purposes in hw test environments. This is not
triggered by default and its functionality is mutually exclusive
to that of qusb2_phy interrupt.

Add missing hs_phy_irq's, pwr_event irq's for qusb2 phy targets.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq6018.dtsi | 15 ++++++++++++++-
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 14 ++++++++++++++
 arch/arm64/boot/dts/qcom/msm8953.dtsi |  7 +++++--
 arch/arm64/boot/dts/qcom/msm8996.dtsi | 19 ++++++++++++++-----
 arch/arm64/boot/dts/qcom/msm8998.dtsi |  7 +++++--
 arch/arm64/boot/dts/qcom/sdm630.dtsi  | 19 ++++++++++++++-----
 arch/arm64/boot/dts/qcom/sm6115.dtsi  |  9 +++++++--
 arch/arm64/boot/dts/qcom/sm6125.dtsi  |  9 +++++++++
 8 files changed, 82 insertions(+), 17 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 9aec89d5e095..4edad51e0481 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -395,7 +395,7 @@ tcsr: syscon@1937000 {
 		};
 
 		usb2: usb@70f8800 {
-			compatible = "qcom,ipq6018-dwc3", "qcom,dwc3";
+			compatible = "qcom,ipq6018-dwc3-sec", "qcom,dwc3";
 			reg = <0x0 0x070f8800 0x0 0x400>;
 			#address-cells = <2>;
 			#size-cells = <2>;
@@ -411,6 +411,12 @@ usb2: usb@70f8800 {
 					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
 			assigned-clock-rates = <133330000>,
 					       <24000000>;
+
+			interrupts-extended = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy";
+
 			resets = <&gcc GCC_USB1_BCR>;
 			status = "disabled";
 
@@ -559,6 +565,13 @@ usb3: usb@8af8800 {
 					       <133330000>,
 					       <20000000>;
 
+			interrupts-extended = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+
 			resets = <&gcc GCC_USB0_BCR>;
 			status = "disabled";
 
diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index 5d05819f356d..2977ef424986 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -619,6 +619,13 @@ usb_0: usb@8af8800 {
 						<133330000>,
 						<19200000>;
 
+			interrupts-extended = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+
 			power-domains = <&gcc USB0_GDSC>;
 
 			resets = <&gcc GCC_USB0_BCR>;
@@ -661,6 +668,13 @@ usb_1: usb@8cf8800 {
 						<133330000>,
 						<19200000>;
 
+			interrupts-extended = <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+					      <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+
 			power-domains = <&gcc USB1_GDSC>;
 
 			resets = <&gcc GCC_USB1_BCR>;
diff --git a/arch/arm64/boot/dts/qcom/msm8953.dtsi b/arch/arm64/boot/dts/qcom/msm8953.dtsi
index e7de7632669a..29a6f9ad3df3 100644
--- a/arch/arm64/boot/dts/qcom/msm8953.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8953.dtsi
@@ -1118,9 +1118,12 @@ usb3: usb@70f8800 {
 			#size-cells = <1>;
 			ranges;
 
-			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 220 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
 
 			clocks = <&gcc GCC_USB_PHY_CFG_AHB_CLK>,
 				 <&gcc GCC_USB30_MASTER_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/msm8996.dtsi b/arch/arm64/boot/dts/qcom/msm8996.dtsi
index 6ba9da9e6a8b..a5400d7dfb9c 100644
--- a/arch/arm64/boot/dts/qcom/msm8996.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996.dtsi
@@ -3026,9 +3026,14 @@ usb3: usb@6af8800 {
 			#size-cells = <1>;
 			ranges;
 
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
 
 			clocks = <&gcc GCC_SYS_NOC_USB3_AXI_CLK>,
 				 <&gcc GCC_USB30_MASTER_CLK>,
@@ -3382,14 +3387,18 @@ blsp2_spi6: spi@75ba000 {
 		};
 
 		usb2: usb@76f8800 {
-			compatible = "qcom,msm8996-dwc3", "qcom,dwc3";
+			compatible = "qcom,msm8996-dwc3-sec", "qcom,dwc3";
 			reg = <0x076f8800 0x400>;
 			#address-cells = <1>;
 			#size-cells = <1>;
 			ranges;
 
-			interrupts = <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq";
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy";
 
 			clocks = <&gcc GCC_PERIPH_NOC_USB20_AHB_CLK>,
 				<&gcc GCC_USB20_MASTER_CLK>,
diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index b485bf925ce6..9b7d22c4f197 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -2135,9 +2135,12 @@ usb3: usb@a8f8800 {
 					  <&gcc GCC_USB30_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <120000000>;
 
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB_30_GDSC>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm630.dtsi b/arch/arm64/boot/dts/qcom/sdm630.dtsi
index 775700f78e0f..5be337c07393 100644
--- a/arch/arm64/boot/dts/qcom/sdm630.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm630.dtsi
@@ -1303,9 +1303,14 @@ usb3: usb@a8f8800 {
 			assigned-clock-rates = <19200000>, <120000000>,
 					       <19200000>;
 
-			interrupts = <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB_30_GDSC>;
 			qcom,select-utmi-as-pipe-clk;
@@ -1467,7 +1472,7 @@ opp-384000000 {
 		};
 
 		usb2: usb@c2f8800 {
-			compatible = "qcom,sdm660-dwc3", "qcom,dwc3";
+			compatible = "qcom,sdm660-dwc3-sec", "qcom,dwc3";
 			reg = <0x0c2f8800 0x400>;
 			status = "disabled";
 			#address-cells = <1>;
@@ -1485,8 +1490,12 @@ usb2: usb@c2f8800 {
 					  <&gcc GCC_USB20_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <60000000>;
 
-			interrupts = <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq";
+			interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy";
 
 			qcom,select-utmi-as-pipe-clk;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index 839c60351240..748dfb4dc6c7 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1301,9 +1301,14 @@ usb: usb@4ef8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <66666667>;
 
-			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq";
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
 
 			resets = <&gcc GCC_USB30_PRIM_BCR>;
 			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
index eb07eca3a48d..d5b6ee4e104c 100644
--- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
@@ -1185,6 +1185,15 @@ usb3: usb@4ef8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <66666667>;
 
+			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 422 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hs_phy_irq",
+					  "pwr_event",
+					  "qusb2_phy",
+					  "ss_phy_irq";
+
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 			qcom,select-utmi-as-pipe-clk;
 			status = "disabled";
-- 
2.42.0


