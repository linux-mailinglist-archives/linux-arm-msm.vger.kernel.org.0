Return-Path: <linux-arm-msm+bounces-37072-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 26A349BD2D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 17:50:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 47F631C2232A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2024 16:50:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E82A1DD0E8;
	Tue,  5 Nov 2024 16:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="UPMk1FWT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529C61DD0C2;
	Tue,  5 Nov 2024 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730825414; cv=none; b=DEWeRMFHi3bkK7t0EOsKkqLYAuXwygvWods7zFfkD7tewghII9q1MBKqVyun4RgLClXNBTRNZpDQDUg4LL8qvMoRft6Z7ObgbTDGnfYPJab8ZCxhA5Jy9UZpS+4gDrrW+ZuTfzIsDN8OX/Z8owojuW1SM75JZnzJxyXjvhpnwQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730825414; c=relaxed/simple;
	bh=Fm9nIWdaXrd1RY1iFm11tTN2yVSB5++ZqBvZzusoP9o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VpQEGghFVvQWdXnq1TK5uVE0zccVGKS8OrYXYK35wu6u8wbQybOmZvwTaqkryquZQBd7zAoD8na03yPlgrYAuNUdrbXX0Jxf75b79Yq2V6ZTuHGzFuMnnjR7wqsU3tQxZEFHUHi597RBeHXj6ahcmR+8+/exBfFiVeXa+sHwuTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=UPMk1FWT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A59ZkoD017275;
	Tue, 5 Nov 2024 16:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	stYxMDQBDL6o2/d89SMBonegQ1c7ef6E5GHL769nYFg=; b=UPMk1FWTw4tNOuJg
	m65mL0W3GfJlhKDkUezk5zT7ORC9m9+WWHLb5VWL6WA719z1IWZz/PclHXA5PdJ3
	0NBs27SLZYXtrbNrAJclBd1HAIFL+g5ImwjbDDNcJLIYYSdMnyYYV2c2NXQNhbYL
	vcDO2EE5jEMoqixxznTNz0Xz+fV+a+otlAPPkLZUmRg/bnxeDyCnpbDReajQLVGI
	MOPHgbLGZMFKRTl2wCF4/xd309Kc6TbaBlgd4oZ9NL/eI3TPn4ye4a2msdL3vvw5
	lfPJWJIci77Z7EixmSiRjJ8IFloXMAliYhisYdyDPXI1U3ma+LPwD0dYCA/ZpuhG
	Yw6JDw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd2r8cup-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 16:50:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A5Go8QZ011122
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 16:50:08 GMT
Received: from hu-kriskura-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 5 Nov 2024 08:50:04 -0800
From: Krishna Kurapati <quic_kriskura@quicinc.com>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Dmitry
 Baryshkov" <dmitry.baryshkov@linaro.org>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_ppratap@quicinc.com>,
        <quic_jackp@quicinc.com>, Krishna Kurapati <quic_kriskura@quicinc.com>
Subject: [PATCH v3 1/2] arm64: dts: qcom: Add support for usb nodes on QCS8300
Date: Tue, 5 Nov 2024 22:19:45 +0530
Message-ID: <20241105164946.2357821-2-quic_kriskura@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
References: <20241105164946.2357821-1-quic_kriskura@quicinc.com>
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
X-Proofpoint-ORIG-GUID: jUHZDb13uJaDmVwpmA39V4jQb-YvesLK
X-Proofpoint-GUID: jUHZDb13uJaDmVwpmA39V4jQb-YvesLK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 phishscore=0 spamscore=0
 mlxscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050130

Add support for USB controllers on QCS8300. The second
controller is only High Speed capable.

Signed-off-by: Krishna Kurapati <quic_kriskura@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300.dtsi | 181 ++++++++++++++++++++++++++
 1 file changed, 181 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300.dtsi b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
index 2c35f96c3f28..0e4ca6e238db 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs8300.dtsi
@@ -1363,6 +1363,187 @@ IPCC_MPROC_SIGNAL_GLINK_QMP
 				qcom,remote-pid = <5>;
 			};
 		};
+
+		usb_1_hsphy: phy@8904000 {
+			compatible = "qcom,qcs8300-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0x0 0x08904000 0x0 0x400>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_USB2_PHY_PRIM_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_2_hsphy: phy@8906000 {
+			compatible = "qcom,qcs8300-usb-hs-phy",
+				     "qcom,usb-snps-hs-7nm-phy";
+			reg = <0x0 0x08906000 0x0 0x400>;
+
+			clocks = <&rpmhcc RPMH_CXO_CLK>;
+			clock-names = "ref";
+
+			resets = <&gcc GCC_USB2_PHY_SEC_BCR>;
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_qmpphy: phy@8907000 {
+			compatible = "qcom,qcs8300-qmp-usb3-uni-phy";
+			reg = <0x0 0x08907000 0x0 0x2000>;
+
+			clocks = <&gcc GCC_USB3_PRIM_PHY_AUX_CLK>,
+				 <&gcc GCC_USB_CLKREF_EN>,
+				 <&gcc GCC_USB3_PRIM_PHY_COM_AUX_CLK>,
+				 <&gcc GCC_USB3_PRIM_PHY_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "com_aux",
+				      "pipe";
+
+			resets = <&gcc GCC_USB3_PHY_PRIM_BCR>,
+				 <&gcc GCC_USB3PHY_PHY_PRIM_BCR>;
+			reset-names = "phy", "phy_phy";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+
+			#clock-cells = <0>;
+			clock-output-names = "usb3_prim_phy_pipe_clk_src";
+
+			#phy-cells = <0>;
+
+			status = "disabled";
+		};
+
+		usb_1: usb@a6f8800 {
+			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
+			reg = <0x0 0x0a6f8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB30_PRIM_SLEEP_CLK>,
+				 <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB30_PRIM_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB30_PRIM_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <200000000>;
+
+			interrupts-extended = <&intc GIC_SPI 287 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 14 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 15 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 12 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq",
+					  "ss_phy_irq";
+
+			power-domains = <&gcc GCC_USB30_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB30_PRIM_BCR>;
+			interconnects = <&aggre1_noc MASTER_USB3_0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_USB3_0 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			wakeup-source;
+
+			status = "disabled";
+
+			usb_1_dwc3: usb@a600000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a600000 0x0 0xe000>;
+				interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x80 0x0>;
+				phys = <&usb_1_hsphy>, <&usb_qmpphy>;
+				phy-names = "usb2-phy", "usb3-phy";
+				snps,dis_enblslpm_quirk;
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		usb_2: usb@a4f8800 {
+			compatible = "qcom,qcs8300-dwc3", "qcom,dwc3";
+			reg = <0x0 0x0a4f8800 0x0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_CFG_NOC_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_MASTER_CLK>,
+				 <&gcc GCC_AGGRE_USB2_PRIM_AXI_CLK>,
+				 <&gcc GCC_USB20_SLEEP_CLK>,
+				 <&gcc GCC_USB20_MOCK_UTMI_CLK>;
+			clock-names = "cfg_noc",
+				      "core",
+				      "iface",
+				      "sleep",
+				      "mock_utmi";
+
+			assigned-clocks = <&gcc GCC_USB20_MOCK_UTMI_CLK>,
+					  <&gcc GCC_USB20_MASTER_CLK>;
+			assigned-clock-rates = <19200000>, <120000000>;
+
+			interrupts-extended = <&intc GIC_SPI 444 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 443 IRQ_TYPE_LEVEL_HIGH>,
+					      <&pdc 10 IRQ_TYPE_EDGE_BOTH>,
+					      <&pdc 9 IRQ_TYPE_EDGE_BOTH>;
+			interrupt-names = "pwr_event",
+					  "hs_phy_irq",
+					  "dp_hs_phy_irq",
+					  "dm_hs_phy_irq";
+
+			power-domains = <&gcc GCC_USB20_PRIM_GDSC>;
+			required-opps = <&rpmhpd_opp_nom>;
+
+			resets = <&gcc GCC_USB20_PRIM_BCR>;
+
+			interconnects = <&aggre1_noc MASTER_USB2 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_USB2 QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "usb-ddr", "apps-usb";
+
+			qcom,select-utmi-as-pipe-clk;
+			wakeup-source;
+
+			status = "disabled";
+
+			usb_2_dwc3: usb@a400000 {
+				compatible = "snps,dwc3";
+				reg = <0x0 0x0a400000 0x0 0xe000>;
+				interrupts = <GIC_SPI 442 IRQ_TYPE_LEVEL_HIGH>;
+				iommus = <&apps_smmu 0x20 0x0>;
+				phys = <&usb_2_hsphy>;
+				phy-names = "usb2-phy";
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+				snps,dis_enblslpm_quirk;
+			};
+		};
 	};
 
 	arch_timer: timer {
-- 
2.34.1


