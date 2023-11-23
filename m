Return-Path: <linux-arm-msm+bounces-1686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44CC07F5E5D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 12:54:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 764101C20F01
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Nov 2023 11:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E4DC241E8;
	Thu, 23 Nov 2023 11:54:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="RUYyE3Lf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF7629A;
	Thu, 23 Nov 2023 03:54:16 -0800 (PST)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ANB0RvQ029134;
	Thu, 23 Nov 2023 11:54:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding : content-type; s=qcppdkim1;
 bh=y/Nd+6w8S23TPbGZaLug3tvcWS5MO7EAocO+wJHDUn0=;
 b=RUYyE3LfAmDE7LpEcUaXhusXEYN+ceogeqoKEoahhg4Cgllt3PCFSHU5lJX7bQ5O8jgD
 bLmQwOVruh1jN2621pK5ExN5byZBCsp7eqR8rLVbq5SXyaojz4dwTS9bc1bCHlKBDhD9
 c5LfjAjYaleIyrA8JBy45h+b8CT+eLNvAQCczMYugJSg0mYQvv4FcMWjvPy00IB/YGJK
 WcQKU5qdFo3qv9p3jvKeGX6zVo8chLOOLoA18mMtGnQmEI9a7bjIPJ5HGZuIKFuXqDDy
 SziAbLb1O0iZkmP7Az8FRof7anjTNf/Fdd9wcch06dphqoPsDXP/vFwY2UkTyKhz7npb bg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uj4hwg6pu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:54:06 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3ANBs5bi022181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Nov 2023 11:54:05 GMT
Received: from hu-jsuraj-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 23 Nov 2023 03:53:55 -0800
From: Suraj Jaiswal <quic_jsuraj@quicinc.com>
To: <quic_jsuraj@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
        Bhupesh Sharma
	<bhupesh.sharma@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        "David S.
 Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        "Jakub
 Kicinski" <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        "Jose
 Abreu" <joabreu@synopsys.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>, <netdev@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        Prasad Sodagudi
	<psodagud@quicinc.com>,
        Andrew Halaney <ahalaney@redhat.com>
CC: <kernel@quicinc.com>
Subject: [PATCH net-next v3 2/3] arm64: dts: qcom: sa8775p: enable Fault IRQ
Date: Thu, 23 Nov 2023 17:23:21 +0530
Message-ID: <66690488f08912698301a2c203d7c562798806a2.1700737841.git.quic_jsuraj@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1700737841.git.quic_jsuraj@quicinc.com>
References: <cover.1700737841.git.quic_jsuraj@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: e21lWNffVAbzzo9pQTLuZthvJdmPTZAd
X-Proofpoint-ORIG-GUID: e21lWNffVAbzzo9pQTLuZthvJdmPTZAd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-23_10,2023-11-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 mlxscore=0 mlxlogscore=662
 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311230084

Add changes to support fault IRQ Handling
Support for ethernet.

Signed-off-by: Suraj Jaiswal <quic_jsuraj@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p.dtsi b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
index 13dd44dd9ed1..15155adcd200 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p.dtsi
@@ -2394,8 +2394,9 @@ ethernet1: ethernet@23000000 {
 			      <0x0 0x23016000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";
 
-			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 929 IRQ_TYPE_LEVEL_HIGH>
+				     <GIC_SPI 781 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "safety";
 
 			clocks = <&gcc GCC_EMAC1_AXI_CLK>,
 				 <&gcc GCC_EMAC1_SLV_AHB_CLK>,
@@ -2427,8 +2428,9 @@ ethernet0: ethernet@23040000 {
 			      <0x0 0x23056000 0x0 0x100>;
 			reg-names = "stmmaceth", "rgmii";
 
-			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "macirq";
+			interrupts = <GIC_SPI 946 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 782 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq", "safety";
 
 			clocks = <&gcc GCC_EMAC0_AXI_CLK>,
 				 <&gcc GCC_EMAC0_SLV_AHB_CLK>,
-- 
2.25.1


