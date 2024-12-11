Return-Path: <linux-arm-msm+bounces-41391-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 202209EC1CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 02:59:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BE925165275
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 01:59:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E330E1DF75A;
	Wed, 11 Dec 2024 01:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="VE5XKxGd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 307701DF733;
	Wed, 11 Dec 2024 01:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733882362; cv=none; b=Vcm1gTmtiSWdXvTPvO+wVcFtTJ5rt87mcl+kQgdyUXJKyY/VpujjuMRhvZWLxMeP5vYPkCdoNEiCN3QWWPdNOkXFf3UCfqIhv7Vrf/ZOZgXDhwddL4F3PjByQGIRByyRgVEKz0yn+uQEDrmSruyoWgKqwiRuAH7P2G1UV0z3p7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733882362; c=relaxed/simple;
	bh=KEjmGe/TKv4+PCay/VECQdcXdi8Uz0WEI1WSKDVwixA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=tWXJNp7scUd0SpoTe88YvaMTofFGjrWsNRoXCjJUI77/3+9JBO7LYLq9GhpeRzKf8tiSRWyA/iWb8i3S2xklSKFj2yJO9AV9lX0vkI+yoNY2WNjoMF8mO9hwV89nG3fp/gTBg1M1KIJu8c7xbIapO6lxYV+12GikCdhEoDnr9E4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=VE5XKxGd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BAHIhch002489;
	Wed, 11 Dec 2024 01:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KH2r6G7DANoBRuT8BNlzXYkIFySPvaZ2ggAovQXeiJw=; b=VE5XKxGd77WzxKt1
	8n+mn3zywxuYyg6fb16Gwm2ehHkT9cDIoZzUzWMPVOoRSPGpMZ6xGvXt6QBjJQkU
	5C5yhT2HyJuypuptqi2kZKGvbPjOrrLZ3zJKFIzdQXe/LLLeheRRVDbbxMgwLGOh
	TOJOhfD825Cd+VHIW+cGGgWSUkKQIWpOwN16zYtyr45kh2lLma0hagEbYXo6qrpv
	vJZBPsnoggSPi8J8Eb8hWpqOKv1evaCnA712QY98cPn44BOpc/ZbDtVcTjx9UqQi
	ndYE//V3cfThyg2Z2j5H9cvO1XNIWfjgpxQ2bBrbjjcj0DXjGXfJRkbnHhLRZfU8
	9mTYCA==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43dxw465bc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:17 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB1xGlx020290
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 01:59:16 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 10 Dec 2024 17:59:11 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Wed, 11 Dec 2024 09:57:57 +0800
Subject: [PATCH 1/2] arm64: dts: qcom: Add support for secondary usb node
 on QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v1-1-edce37204a85@quicinc.com>
References: <20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com>
In-Reply-To: <20241211-add_usb_host_mode_for_qcs615-v1-0-edce37204a85@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733882348; l=3029;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=ZU6mzm7e+mY7SzHCvxWc39BXcE6CkKvFlMzdpzou3t8=;
 b=bPoG3jD9VaAqYd6kVmB8VaLDeAGPaO9ymRuxEobeqLbCm9cTwlgeXvGrBsmzcE30JV8RsTPpQ
 D8CSmqi1vwwDnx4IDBv1TCZraM5mqAsXxl4bHjGPpL5S5zhbdwenScm
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: B4ZTNsih-xmvUz0-gnoir32qLwjWux2u
X-Proofpoint-GUID: B4ZTNsih-xmvUz0-gnoir32qLwjWux2u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 adultscore=0 mlxlogscore=927
 clxscore=1015 spamscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110014

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Add support for secondary USB controller and its high-speed phy
on QCS615.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 76 ++++++++++++++++++++++++++++++++++++
 1 file changed, 76 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index b8388dcca94cd8f4e6f1360305d5f6c7fff4eec3..8ebcb886e8ebfacc436dac2c6f27beb9a6405bfe 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -3079,6 +3079,20 @@ usb_1_hsphy: phy@88e2000 {
 			status = "disabled";
 		};
 
+		usb_hsphy_2: phy@88e3000 {
+			compatible = "qcom,qcs615-qusb2-phy";
+			reg = <0x0 0x088e3000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_WEST_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_SEC_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
 		usb_qmpphy: phy@88e6000 {
 			compatible = "qcom,qcs615-qmp-usb3-phy";
 			reg = <0x0 0x88e6000 0x0 0x1000>;
@@ -3168,6 +3182,68 @@ usb_1_dwc3: usb@a600000 {
 				snps,usb3_lpm_capable;
 			};
 		};
+
+		usb_2: usb@a8f8800 {
+			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
+			reg = <0 0x0a8f8800 0 0x400>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_SEC_AXI_CLK>,
+				 <&gcc GCC_USB20_SEC_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB2_SEC_AXI_CLK>,
+				 <&gcc GCC_USB20_SEC_SLEEP_CLK>,
+				 <&gcc GCC_USB20_SEC_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB2_PRIM_CLKREF_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB20_SEC_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_SEC_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 663 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 662 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 11 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			power-domains = <&gcc USB20_SEC_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB20_SEC_BCR>;
+
+			qcom,select-utmi-as-pipe-clk;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_2_dwc3: usb@a800000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a800000 0 0xcd00>;
+
+				iommus = <&apps_smmu 0xe0 0x0>;
+				interrupts = <GIC_SPI 664 IRQ_TYPE_LEVEL_HIGH>;
+
+				phys = <&usb_hsphy_2>;
+				phy-names = "usb2-phy";
+
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+
+				maximum-speed = "high-speed";
+			};
+		};
 	};
 
 	arch_timer: timer {

-- 
2.25.1


