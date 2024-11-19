Return-Path: <linux-arm-msm+bounces-38272-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AE0619D1F90
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 06:29:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2850D1F228E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 05:29:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E98215443C;
	Tue, 19 Nov 2024 05:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="IPBP6ywI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 565EE2563;
	Tue, 19 Nov 2024 05:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731994160; cv=none; b=CBqi5Y4ESrpaAPW/hrcJybr1iTTy44q6DSVWkfJ5FUIoorGRYjmC+fCuu95u9Z18C652Ts7ADU1/nGJy7a9qQ+HanIvt5U/TTYrXI8g21LSEveWmhORl2j2YcbRh67CjOxpthuL+5gVclhjZb1pjWZVgmeuIx1VJE9OMGwOfR3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731994160; c=relaxed/simple;
	bh=Cdivbf5gtAGyoX+EW0NF5eeQMZREeJWH525pb5sSe6Q=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WohoFP7I2NzJ33BkNKtOf0Nbz94FxQnBBDjnX4J3l2zcPouoUs3ZgAUEimwOZYkcWxl5Uq9fbUCoLhjJ3v7gbPLZNyngoLQIGee43r6KDdCxpZQVkZRmoYJVxgGCkwRSI3rdQT444z8/qPwuw2wba447LdjRP73nsv9ZsVlQ5F4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=IPBP6ywI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AIGGkgM009964;
	Tue, 19 Nov 2024 05:29:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	68HlIb+0s6095duyklGRsEQmrQNtYqntAs55/blTeGU=; b=IPBP6ywIw8Q3h7gv
	CUZ5D4g4Ws/ytDoKM+PuScd3MXQQYL/VauZwR9K0Jz7QL4wy+p87TMI1I5ZuZY4U
	Dzh5iv0cI7NZ/3HLO7VRLweDGMF/W7fxo82rbR0j8WqPjr9NriXoLQe4csZlep1D
	jjNHH66QylcV3Drq77FdPYZF1RoX4V79f32NA6Nr069AU1LlzmGEN6rOagp4nglv
	Q03M68LZ41CczmfMpojptVcHqkPfW7uYpouXcRl4Dng0oYETalJwHe5sF1+BxbRH
	gboPvq/4TTYf0J1Rn/pBUKsM2InYpOsvcaoo3MPK8pSiQof8oCsrAxZWwmO7UKkC
	fILy0g==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4308y91h0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 05:29:14 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AJ5TDOp003991
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 19 Nov 2024 05:29:13 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 18 Nov 2024 21:29:09 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH 1/2] arm64: dts: qcom: Add support for usb node on QCS615
Date: Tue, 19 Nov 2024 10:58:53 +0530
Message-ID: <20241119052854.995691-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241119052854.995691-1-quic_kriskura@quicinc.com>
References: <20241119052854.995691-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: nbTCyCa4LW1IfFr7W-8ta2zK6lIsAlPC
X-Proofpoint-GUID: nbTCyCa4LW1IfFr7W-8ta2zK6lIsAlPC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2411190040

Add support for primary USB controller on QCS615.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 110 +++++++++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 590beb37f441..e676e76a337e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -397,6 +397,11 @@ qfprom: efuse@780000 {
 			reg = <0x0 0x00780000 0x0 0x7000>;
 			#address-cells = <1>;
 			#size-cells = <1>;
+
+			qusb2_hstx_trim: hstx-trim@1f8 {
+				reg = <0x1fb 0x1>;
+				bits = <1 4>;
+			};
 		};
 
 		qupv3_id_0: geniqup@8c0000 {
@@ -758,6 +763,111 @@ rpmhpd_opp_turbo_l1: opp-9 {
 				};
 			};
 		};
+
+		usb_1_hsphy: phy@88e2000 {
+			compatible = "qcom,qcs615-qusb2-phy";
+			reg = <0x0 0x88e2000 0x0 0x180>;
+
+			clocks = <&gcc GCC_AHB2PHY_WEST_CLK>, <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+			nvmem-cells = <&qusb2_hstx_trim>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@88e6000 {
+			compatible = "qcom,qcs615-qmp-usb3-phy";
+			reg = <0x0 0x88e6000 0x0 0x1000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>,
+				 <&gcc GCC_AHB2PHY_WEST_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_SP0_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_SP0_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			qcom,tcsr-reg = <&tcsr 0xb244>;
+
+			clock-output-names = "usb3_phy_pipe_clk_src";
+			#clock-cells = <0>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,qcs615-dwc3", "qcom,dwc3";
+			reg = <0 0x0a6f8800 0 0x400>;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB3_PRIM_CLKREF_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi",
+				      "xo";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 8 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 6 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x0a600000 0 0xcd00>;
+
+				iommus = <&apps_smmu 0x140 0x0>;
+				interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>;
+
+				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+				snps,has-lpm-erratum;
+				snps,hird-threshold = /bits/ 8 <0x10>;
+				snps,usb3_lpm_capable;
+			};
+		};
 	};
 
 	arch_timer: timer {
-- 
2.34.1


