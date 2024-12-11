Return-Path: <linux-arm-msm+bounces-41426-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3C39EC71B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 09:26:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C3C0A16848C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 08:26:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC86D1D9593;
	Wed, 11 Dec 2024 08:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="doVfenfD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB2C1D86CE;
	Wed, 11 Dec 2024 08:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733905604; cv=none; b=Gvp4Vmj5dCMCkJsBDZpHLeRTtiLSJzdXaWyoSaXg2nvIXcjz3ugYZLxafWEyVuOCJftNFTHQrzUtvV7vvopY04kw3zGUR16sRL9oXwNuiFC/UG+KrIzNDsiMUAcdhjHVMN5Jw8nhzKAwDT0KTZ2pJKzN5QWbEHgVR1t6XKVtT40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733905604; c=relaxed/simple;
	bh=mVpAqsy1aA0cbGjqmTcLmjny6yYK6GhxldjOqqGbDWA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=rezs2wP+UvnHMbceVBsXjzFzz6hwWU4STykvKk/zSApD/Kdl7llDrByYVvYMhY9B3V48fm9SzIUIO2l5eAqMuTb/lIB1nn6XsCzg8G5btR9f14yspcS1vQHyIsJlcSs0aOEbmV3AgGPG3C1/v2gLfQvsqQFOli3ooDUPailZGZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=doVfenfD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BB8Bfgf006129;
	Wed, 11 Dec 2024 08:26:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oZHdwPQ6yI/YJlopl6prrMFH5HidtUoqTMdEInaKvZ8=; b=doVfenfDFDbbZ3P1
	CXQiyliJq2lzcWAicbL92NkatvMde11W/4zQu5hJOQseFvK7p1/5PAcq+/KgjFC8
	jaLYxgBi9HO5jgnERZ4pQ5n8C1MMYkTjLgPGzJtTWpQz54eE6lppL6Bi6+OYC1N5
	iAKsRoK57fyu5+1pXcoBnhxG22Hwia7WZgB+hFswbh+d95F8qCg1UOVWR1Vkf+XX
	jw+g+x9W0iFnKHuZZOmwsc5dAcf6SeV/f7limA6kYS1TS+h+MFrGE+qBAqbG6PIO
	Hh77XNGA2b+UUs9w6j3Bb3gvOvLU6hHckmex198nWr30L+15JP6t5WksBbVsk5sd
	u6mv5w==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43f70w01b0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BB8QdkP025429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 11 Dec 2024 08:26:39 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Dec 2024 00:26:34 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Wed, 11 Dec 2024 16:26:08 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: Add support for secondary USB
 node on QCS615
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241211-add_usb_host_mode_for_qcs615-v2-1-2c4abdf67635@quicinc.com>
References: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
In-Reply-To: <20241211-add_usb_host_mode_for_qcs615-v2-0-2c4abdf67635@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733905591; l=3037;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=JWzUL+cmHZLWPJRHVLpUGOTp59j1kN739LWxLj5Y50U=;
 b=8F0b0Y1ZOuhAHbgd5oFVmoF2LrjVNmaDA8OD6J/oR6YjmBTNSM/b+Wvpd6zVWzfpb/RQtkBw1
 /T4IIFuqMvWBImaAN4AZ60OsNc79vSuN2nB9ijzQy6KNJzgttvD3ivH
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: swQaADSHdXraL5Q51CHlYRvxxUi9a5Hb
X-Proofpoint-ORIG-GUID: swQaADSHdXraL5Q51CHlYRvxxUi9a5Hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 clxscore=1015 phishscore=0 malwarescore=0 mlxlogscore=928 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 mlxscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412110063

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
index b8388dcca94cd8f4e6f1360305d5f6c7fff4eec3..651c6c8b8bc40886139fa235874e834928e14e77 100644
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
+			reg = <0x0 0x0a8f8800 0x0 0x400>;
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
+				reg = <0x0 0x0a800000 0x0 0xcd00>;
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


