Return-Path: <linux-arm-msm+bounces-61789-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 87845ADFE54
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 09:07:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA4A53B0B6D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Jun 2025 07:02:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EE77424EA8D;
	Thu, 19 Jun 2025 07:02:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="CrHAH/No"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68012248F4F;
	Thu, 19 Jun 2025 07:02:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316575; cv=none; b=qgMtyV8ZJ+3WXRB1hgGAVCF+24MhGi4zne9+N46Kj7hSyAiKjU4MGKpZa/dquZv+EqdL56BTBXC5TbQqbnlzPHV5e+mKPkSzF35gpoBs+VRqc2hIjmxy4NgjRhtRi2kUfVjD+bZ2Frur8HFmspMz6GEO7E+7gM7on9DYvKeOeUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316575; c=relaxed/simple;
	bh=sHquwmF5aG6ilK/37iY/IRSwGbeQDt6yNg8Do/mek3s=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Abfl8N8NDib9aQLLR25j9e4VgH2i2UMtU//WHIt7g+j/curFIgHL/rWqQEsyZPRN2tQh4CbwyW9s+NdokgqFCWhuMgSruoBR2vS5EgauUyF4JzycaqtozvM+6sUg65ZkkhY2ScrsIjfBYeGtt76HpkMI77wTS8OUCS1FnM8Dwa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=CrHAH/No; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55IKmKMk028781;
	Thu, 19 Jun 2025 07:02:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=b0UhmtAgYI/krCN4ms5bmdIZ
	fQHEZVVDIsmtfZRXRzA=; b=CrHAH/NoEbyPYSm1g/Oc80JMV3UDlbQX32Yg5/pa
	eecdAx6zcXsYA1iTGx1nbNa9L/J3iMxZ4ep9prQKTnuCxPIsG1kZuN5SJi3Ezc2J
	qO6t6td2KPY+4Gq5Qry+j2wLGK4bfzm8EbL00JM/roYvTWj6K6KKAj6IW+mecuf4
	IAoWxBDl5WY6b2xX+DtuVzaqEvOzsTL7D9JI4ikGix4T+bDvKRKn0ZyBAZf4T9uZ
	b+3CmlNPiPcuZlTpdqo30pChwcgvihUT2MsSib+YaUn8apaWu9liIaka8SFCog0L
	LbkXs4kG0nPFdMbfLfxxtLsyq6EBvMcmCk99dAynvb816A==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mpty5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:51 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 55J72oI4023860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Jun 2025 07:02:50 GMT
Received: from hu-sayalil-hyd.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 19 Jun 2025 00:02:47 -0700
From: Sayali Lokhande <quic_sayalil@quicinc.com>
To: <andersson@kernel.org>, <konradybcio@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH V2 1/2] arm64: dts: qcom: Add eMMC support for qcs8300
Date: Thu, 19 Jun 2025 12:32:23 +0530
Message-ID: <20250619070224.23428-2-quic_sayalil@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250619070224.23428-1-quic_sayalil@quicinc.com>
References: <20250619070224.23428-1-quic_sayalil@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA1OCBTYWx0ZWRfXy/4rM+G+0mUE
 0peQxvDWL3QEDLb/KylIehJtFbJFlKXG7i/mv0J3nxZDdkP9gf/q3WZdNVdndMjFRIWdYd0wTJd
 oHL3s8Jtvf4jEF/kduYVkEecnRFalcVWj9hIRTRwJLFrs+M0BAfKWGN0k84ZzdUALNBwtNITH1l
 8XeyVEIpeBlj7gp0DGJ4vRFmq6X906TE0VpZrzkcQzZ3OCMdOCFUP2Ie3GRvMIHDg9iWN4kk9O0
 gfmxc7LvHUnANLEAZDANbdLT42LsCWMIErCcRzmTvTClOTPhsuGhj3kRYErL8J5JG6smoPz21cP
 Dkq6EmCoqNADXTDHD/iSeQQLjxEQ9DK53aziMP8w9GFb+k7p+6PLVauJiWhNPBIYOBJ1Cd04GRW
 PaG7ENURKzaiUMvkSCyzsL53u2aSv86t84CyqSpMIDTZZBBM3SmvxkZWdXCw8u3ur5t4IeX/
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6853b61b cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=FEaU7U9pTnpxpSdij5MA:9
 a=BdfXicskiAmEiWxH:21 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 4B0RZxXDxXbN__w7K4enDbln864aRpVT
X-Proofpoint-ORIG-GUID: 4B0RZxXDxXbN__w7K4enDbln864aRpVT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190058

Add eMMC support for qcs8300 board.

Signed-off-by: Sayali Lokhande <quic_sayalil@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts |  21 ++++
 arch/arm64/boot/dts/qcom/qcs8300.dtsi     | 113 ++++++++++++++++++++++
 2 files changed, 134 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 8c166ead912c..9c37a0f5ba25 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -17,6 +17,7 @@
 
 	aliases {
 		serial0 = &uart7;
+		mmc0 = &sdhc_1;
 	};
 
 	chosen {
@@ -332,6 +333,26 @@
 	status = "okay";
 };
 
+&sdhc_1 {
+	pinctrl-0 = <&sdc1_state_on>;
+	pinctrl-1 = <&sdc1_state_off>;
+	pinctrl-names = "default", "sleep";
+
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	vmmc-supply = <&vreg_l8a>;
+	vqmmc-supply = <&vreg_s4a>;
+
+	non-removable;
+	no-sd;
+	no-sdio;
+
+	status = "okay";
+};
+
 &tlmm {
 	ethernet0_default: ethernet0-default-state {
 		ethernet0_mdc: ethernet0-mdc-pins {
diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 7ada029c32c1..98f023def05f 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -3837,6 +3837,69 @@
 			clock-names = "apb_pclk";
 		};
 
+		sdhc_1: mmc@87C4000 {
+			compatible = "qcom,qcs8300-sdhci", "qcom,sdhci-msm-v5";
+			reg = <0x0 0x87C4000 0x0 0x1000>,
+			      <0x0 0x87C5000 0x0 0x1000>;
+			reg-names = "hc",
+				    "cqhci";
+
+			interrupts = <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
+				     <GIC_SPI 521 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "hc_irq",
+					  "pwr_irq";
+
+			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
+				 <&gcc GCC_SDCC1_APPS_CLK>,
+				 <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "iface",
+				      "core",
+				      "xo";
+
+			resets = <&gcc GCC_SDCC1_BCR>;
+
+			power-domains = <&rpmhpd RPMHPD_CX>;
+			operating-points-v2 = <&sdhc1_opp_table>;
+			iommus = <&apps_smmu 0x0 0x0>;
+			interconnects = <&aggre1_noc MASTER_SDC QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_SDCC_1 QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "sdhc-ddr",
+					     "cpu-sdhc";
+
+			qcom,dll-config = <0x000F64EE>;
+			qcom,ddr-config = <0x80040868>;
+			supports-cqe;
+			dma-coherent;
+
+			status = "disabled";
+
+			sdhc1_opp_table: opp-table {
+				compatible = "operating-points-v2";
+
+				opp-50000000 {
+					opp-hz = /bits/ 64 <50000000>;
+					required-opps = <&rpmhpd_opp_low_svs>;
+				};
+
+				opp-100000000 {
+					opp-hz = /bits/ 64 <100000000>;
+					required-opps = <&rpmhpd_opp_svs>;
+				};
+
+				opp-200000000 {
+					opp-hz = /bits/ 64 <200000000>;
+					required-opps = <&rpmhpd_opp_svs_l1>;
+				};
+
+				opp-384000000 {
+					opp-hz = /bits/ 64 <384000000>;
+					required-opps = <&rpmhpd_opp_nom>;
+				};
+			};
+		};
+
 		usb_1_hsphy: phy@8904000 {
 			compatible = "qcom,qcs8300-usb-hs-phy",
 				     "qcom,usb-snps-hs-7nm-phy";
@@ -5042,6 +5105,56 @@
 				pins = "gpio13";
 				function = "qup2_se0";
 			};
+
+			sdc1_state_on: sdc1-on-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-disable;
+					drive-strength = <16>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-pull-up;
+					drive-strength = <10>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-pull-down;
+				};
+			};
+
+			sdc1_state_off: sdc1-off-state {
+				clk-pins {
+					pins = "sdc1_clk";
+					bias-bus-hold;
+					drive-strength = <2>;
+				};
+
+				cmd-pins {
+					pins = "sdc1_cmd";
+					bias-bus-hold;
+					drive-strength = <2>;
+				};
+
+				data-pins {
+					pins = "sdc1_data";
+					bias-bus-hold;
+					drive-strength = <2>;
+				};
+
+				rclk-pins {
+					pins = "sdc1_rclk";
+					bias-bus-hold;
+				};
+			};
 		};
 
 		sram: sram@146d8000 {
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


