Return-Path: <linux-arm-msm+bounces-4217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C00880C94C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 13:16:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BFF7CB21409
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Dec 2023 12:16:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97ADB3A286;
	Mon, 11 Dec 2023 12:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NA9hIj5L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB47B9B;
	Mon, 11 Dec 2023 04:16:43 -0800 (PST)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB8Q636027377;
	Mon, 11 Dec 2023 12:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=nYDs+ut6+cJdRbrxFvjrbIPGoF/KbuTdxQhUK4XSEBw=; b=NA
	9hIj5LL0N5X5V1jpzGyk3tB8bnfvRRF1LazY4H9cuZQNwpXivj15L7bMKhwW7iED
	rC6sQu646rAEZMNU6Z864G3sn/NNbDnAdMG2sbsB4z1yJyggXk9SR82pmmaH08cC
	GksBVaSrHFw3XlFG7/mBUgRzFpxBtsxuTR049wfCauDvQcC/u7kNXctzMh70TfoO
	OqgEyM7jyAu6BDz12dBHsLxhG2p4BJAJSSxkL8iwL4Zp7RHtv+uQrpfW561x0wku
	+ERXHz7qnmZg+e4hfT5NGhSxnX4DUkfVPUtfse5nKJixvxgqvQfWkgG9MmkGBC5R
	vPhuKj8HupDz2xOZG/Pg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uvnuvk7pq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 12:16:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BBCGexY014890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 12:16:40 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 11 Dec 2023 04:16:35 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Wesley Cheng
	<quic_wcheng@quicinc.com>,
        Johan Hovold <johan@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>,
        <cros-qcom-dts-watchers@chromium.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 3/4] arm64: dts: qcom: Fix hs_phy_irq for SDM670/SDM845/SM6350
Date: Mon, 11 Dec 2023 17:46:10 +0530
Message-ID: <20231211121611.6765-4-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231211121611.6765-1-quic_kriskura@quicinc.com>
References: <20231211121611.6765-1-quic_kriskura@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: bEzKYYfdcMjykyAuTqqn5cnGGDisiR8c
X-Proofpoint-ORIG-GUID: bEzKYYfdcMjykyAuTqqn5cnGGDisiR8c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 malwarescore=0 phishscore=0 mlxscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 mlxlogscore=845 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312110099

For sm6350/sdm670/sdm845, although they are qusb2 phy targets, dp/dm
interrupts are used for wakeup instead of qusb2_phy irq. These targets
were part of a generation that were the last ones to implement QUSB2 PHY
and the design incorporated dedicated DP/DM interrupts which eventually
carried forward to the newer femto based targets.

Add the missing pwr_event irq for these targets. Also modify order of
interrupts in accordance to bindings update. Modifying the order of these
interrupts is harmless as the driver tries to get these interrupts from DT
by name and not by index.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdm670.dtsi | 14 +++++++++-----
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 28 ++++++++++++++++++----------
 arch/arm64/boot/dts/qcom/sm6350.dtsi | 13 ++++++++-----
 3 files changed, 35 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm670.dtsi b/arch/arm64/boot/dts/qcom/sdm670.dtsi
index c873560ae9d5..d189bcfeeb05 100644
--- a/arch/arm64/boot/dts/qcom/sdm670.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm670.dtsi
@@ -1295,12 +1295,16 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <150000000>;
 
-			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
 				     <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 0d2be706505a..e672707ee4de 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -4053,12 +4053,16 @@ usb_1: usb@a6f8800 {
 					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <150000000>;
 
-			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>,
 				     <GIC_SPI 488 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 489 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+				     <GIC_SPI 486 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 
@@ -4104,12 +4108,16 @@ usb_2: usb@a8f8800 {
 					  <&gcc GCC_USB30_SEC_MASTER_CLK>;
 			assigned-clock-rates = <19200000>, <150000000>;
 
-			interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
-				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>,
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 491 IRQ_TYPE_EDGE_BOTH>,
 				     <GIC_SPI 490 IRQ_TYPE_EDGE_BOTH>,
-				     <GIC_SPI 491 IRQ_TYPE_EDGE_BOTH>;
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+				     <GIC_SPI 487 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB30_SEC_GDSC>;
 
diff --git a/arch/arm64/boot/dts/qcom/sm6350.dtsi b/arch/arm64/boot/dts/qcom/sm6350.dtsi
index 8fd6f4d03490..be1ee176b520 100644
--- a/arch/arm64/boot/dts/qcom/sm6350.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6350.dtsi
@@ -1840,12 +1840,15 @@ usb_1: usb@a6f8800 {
 				      "mock_utmi";
 
 			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
-					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
 					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
-					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>;
-
-			interrupt-names = "hs_phy_irq", "ss_phy_irq",
-					  "dm_hs_phy_irq", "dp_hs_phy_irq";
+					      <&pdc 17 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
 
 			power-domains = <&gcc USB30_PRIM_GDSC>;
 
-- 
2.42.0


