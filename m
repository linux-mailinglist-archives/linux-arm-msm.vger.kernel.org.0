Return-Path: <linux-arm-msm+bounces-38173-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 728389D09BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 07:46:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 050BD1F21D1F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Nov 2024 06:46:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 673A6153836;
	Mon, 18 Nov 2024 06:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="gDWahNLa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4DBE14D28C;
	Mon, 18 Nov 2024 06:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731912356; cv=none; b=hsCRwefIyws1rckGPKOH0AkLWrHb/NV4jjlLHalUroIC/g27eJr9euKeez1R9HoIE1fdylmbkfjrfL/TSOyouKrBt0C4zSbQahKFQyRTtjbk4XP8njcT3P1u8Bflhdh5zYSs6KYr5HhQWNcOeIPI3PeyrESwzb9NG2bShe9Bgac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731912356; c=relaxed/simple;
	bh=oaK7pEsUwJ1CiioSy/+R6Xjbr688QfDlgRiTpbwDTgU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=cZJZezePxCHg4se/PxYcJqkhjUCVtyvWvwiCh4XdvZzaAoluJFoCuFXi4dyRITvValhYmi2OfSWItWZOeIdrMBsw8OZrZeLvc14fnzxvOBa26a2CfijxhxpAtd6KdOAIHcLnYDKSXgeZ0dzRPMD3nExl3acQm9NDfYqMGYSRKQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=gDWahNLa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AI5Rgsb029179;
	Mon, 18 Nov 2024 06:45:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Lma49vGjgcH2mUtAXs1rTWHYh0Xlg+vvrMh0gCtkG/E=; b=gDWahNLaHrepijsT
	zyZ52fQJ3vUxOlSl3OQjuNw8GgF5jHKBdrasz12Ch6kRHCO2+g66p0jwiq5jL5KG
	0qCvwaAsnw3hEvOAh43kwaIg8+CYJFNLAwRygww3MmIzLv9fLECqkSfKDwOCw7Ej
	YClrciHTgPVq83KI0z2LVSY3s6rfriKVxUa/YoEbtC3ltk6WNKsYBbUQemIuVog9
	uDjlpgFcAcVAecS7ze8wFMja1gn2RX0V+8bwVfHkBp1506cpcQD8lJkZ5PODn3H4
	z3SqzD6uA1S4b2G128wjwiphaqLRaAzlml4mKDHFChw3PbRqEALj90HrE4sKN9GN
	HKkbMw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42xkv3bks7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:50 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AI6jnb5005711
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 18 Nov 2024 06:45:49 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 17 Nov 2024 22:45:46 -0800
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Mon, 18 Nov 2024 14:44:02 +0800
Subject: [PATCH v2 2/2] arm64: dts: qcom: qcs615-ride: Enable ethernet node
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241118-dts_qcs615-v2-2-e62b924a3cbd@quicinc.com>
References: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
In-Reply-To: <20241118-dts_qcs615-v2-0-e62b924a3cbd@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran
	<richardcochran@gmail.com>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <netdev@vger.kernel.org>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731912338; l=3111;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=oaK7pEsUwJ1CiioSy/+R6Xjbr688QfDlgRiTpbwDTgU=;
 b=fmY0ECxk/bifGGiGBvuLL+CXjuMicDNueTMS72wxbBv7HLHvzzQwn9KnhhWHmjbJYS+FZAmMv
 +QKSbOx0Zj+AtUgjm3SlXkj64UX78iN0bmxpS2Jx3QtoXHKWmfDrodt
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: T4QdPJbwK7V7uVj2Oqrnd0g98CEf-6QE
X-Proofpoint-GUID: T4QdPJbwK7V7uVj2Oqrnd0g98CEf-6QE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 clxscore=1015 mlxscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411180055

Enable the ethernet node, add the phy node and pinctrl for ethernet.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..299be3aa17a0633d808f4b5d32aed946f07d5dfd 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
+#include <dt-bindings/gpio/gpio.h>
 #include "qcs615.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
@@ -196,6 +197,60 @@ vreg_l17a: ldo17 {
 	};
 };
 
+&ethernet {
+	status = "okay";
+
+	pinctrl-0 = <&ethernet_defaults>;
+	pinctrl-names = "default";
+
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii";
+	max-speed = <1000>;
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+
+	mdio: mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rgmii_phy: phy@7 {
+			compatible = "ethernet-phy-ieee802.3-c22";
+			reg = <0x7>;
+
+			interrupts-extended = <&tlmm 121 IRQ_TYPE_EDGE_FALLING>;
+			device_type = "ethernet-phy";
+			reset-gpios = <&tlmm 104 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <1>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <1>;
+		snps,tx-sched-wrr;
+
+		queue0 {
+			snps,weight = <0x10>;
+			snps,dcb-algorithm;
+			snps,priority = <0x0>;
+		};
+	};
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&rpmhcc RPMH_CXO_CLK_A>,
@@ -210,6 +265,57 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&tlmm {
+	ethernet_defaults: ethernet-defaults-state {
+		mdc-pins {
+			pins = "gpio113";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		mdio-pins {
+			pins = "gpio114";
+			function = "rgmii";
+			bias-pull-up;
+		};
+
+		rgmii-rx-pins {
+			pins = "gpio81", "gpio82", "gpio83", "gpio102", "gpio103", "gpio112";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <2>;
+		};
+
+		rgmii-tx-pins {
+			pins = "gpio92", "gpio93", "gpio94", "gpio95", "gpio96", "gpio97";
+			function = "rgmii";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+
+		phy-intr-pins {
+			pins = "gpio121";
+			function = "gpio";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		pps-pins {
+			pins = "gpio91";
+			function = "rgmii";
+			bias-disable;
+			drive-strength = <8>;
+		};
+
+		phy-reset-pins {
+			pins = "gpio104";
+			function = "gpio";
+			bias-pull-up;
+			drive-strength = <16>;
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.34.1


