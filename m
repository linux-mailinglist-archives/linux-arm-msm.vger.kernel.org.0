Return-Path: <linux-arm-msm+bounces-34726-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D87D9A1FF5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 12:28:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 345F31F2330C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Oct 2024 10:28:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8E7D01DC1BF;
	Thu, 17 Oct 2024 10:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="L3o2JqpM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736241DBB37;
	Thu, 17 Oct 2024 10:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729160885; cv=none; b=MTwE9e7HceZxqYSg9S2CSeXbSksTPOm8uIBg05TwjElJYQdkVZEMjCcIbbSKK+kIQR2otjxr9E0bSBh9FmjQtfsFUbauzeT5khhteX4UUwAbI9dniCchipusKpdULwoxf/F3c2XFxsUp2xqaqLnL9+OXQAbRPOttbDo410i2wJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729160885; c=relaxed/simple;
	bh=/fcjKYv2h13cPyJtZoXl5mkyJ3UFwfCQpv4lzTngA0E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TL+ad3X7uhSwUlVh++MgM/F/P4ig3BRjZUMGzl3vXBcboQT6U7I7RZPYot7PUueLaNyMOV+xKoZFezu4kPRpQVdOrhs90sjsBDvi7b27Q4aVKXXq8vvw1R1j3gdPzT8d4sPAZQ1ww3SxhVAup/Hhw0JYXW5J3dm6qrndhS2a+C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=L3o2JqpM; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49H8caZc027138;
	Thu, 17 Oct 2024 10:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NXIgPQI66LisoplJ2RL5M/MSjG9wf5a1UvWeeMJ0ZC8=; b=L3o2JqpMY6plqmPx
	Q9jyjIDE6iAolxPAfQSxvVset8je8JST/U/gDey2FwYm0V/oae61sOuQSUMLI1m5
	qaToJu3A86Rwh/AGDSBcep9QLmJMpMas7CDYVFY3EJFlJgmh0VW/89FBjmhlXQ+t
	dclVnZXOLtKu0Ht+g3BL02Y5WhE0kJ+fQL4u0Vws2eW2iC+3ptH9py7JGsPWD569
	4hb+EqAJLBsVbVIgPAnFP+u+yJ1qT2TR2fN/EA/IpsHZNeB5ql3wCEld7bC2PHTh
	tV3r0vcxQotPc4aerQ50F7K3kxHIuTAjsxNL164QnPAbR6ZVKdaovXqE0Nw30dtR
	5d6Ycw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42ay8j89jw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:56 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49HARtw5012037
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Oct 2024 10:27:55 GMT
Received: from yijiyang-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 17 Oct 2024 03:27:50 -0700
From: YijieYang <quic_yijiyang@quicinc.com>
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
        <quic_tingweiz@quicinc.com>, <quic_aiquny@quicinc.com>,
        Yijie Yang
	<quic_yijiyang@quicinc.com>
Subject: [PATCH v2 3/5] arm64: dts: qcom: qcs8300-ride: enable ethernet0
Date: Thu, 17 Oct 2024 18:27:26 +0800
Message-ID: <20241017102728.2844274-4-quic_yijiyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
References: <20241017102728.2844274-1-quic_yijiyang@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iYuxCZExmlf9o0-1REzfDubO1vhQ6ZQB
X-Proofpoint-ORIG-GUID: iYuxCZExmlf9o0-1REzfDubO1vhQ6ZQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410170070

From: Yijie Yang <quic_yijiyang@quicinc.com>

Enable the SerDes PHY on qcs8300-ride.
Add the MDC and MDIO pin functions for ethernet0 on qcs8300-ride.
Enable the first 1Gb ethernet port on qcs8300-ride development board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++
 1 file changed, 112 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index 7eed19a694c3..b1c9f2cb9749 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -210,6 +210,95 @@ vreg_l9c: ldo9 {
 	};
 };
 
+&ethernet0 {
+	phy-mode = "sgmii";
+	phy-handle = <&sgmii_phy0>;
+
+	pinctrl-0 = <&ethernet0_default>;
+	pinctrl-names = "default";
+
+	snps,mtl-rx-config = <&mtl_rx_setup>;
+	snps,mtl-tx-config = <&mtl_tx_setup>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		sgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id0141.0dd4";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 4 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&tlmm 31 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+	};
+
+	mtl_rx_setup: rx-queues-config {
+		snps,rx-queues-to-use = <4>;
+		snps,rx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x0>;
+			snps,route-up;
+			snps,priority = <0x1>;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+			snps,map-to-dma-channel = <0x1>;
+			snps,route-ptp;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x2>;
+			snps,route-avcp;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,map-to-dma-channel = <0x3>;
+			snps,priority = <0xc>;
+		};
+	};
+
+	mtl_tx_setup: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
+		snps,tx-sched-sp;
+
+		queue0 {
+			snps,dcb-algorithm;
+		};
+
+		queue1 {
+			snps,dcb-algorithm;
+		};
+
+		queue2 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+
+		queue3 {
+			snps,avb-algorithm;
+			snps,send_slope = <0x1000>;
+			snps,idle_slope = <0x1000>;
+			snps,high_credit = <0x3e800>;
+			snps,low_credit = <0xffc18000>;
+		};
+	};
+};
+
 &gcc {
 	clocks = <&rpmhcc RPMH_CXO_CLK>,
 		 <&sleep_clk>,
@@ -247,6 +336,29 @@ &rpmhcc {
 	clock-names = "xo";
 };
 
+&serdes0 {
+	phy-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio5";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio6";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+};
+
 &uart7 {
 	status = "okay";
 };
-- 
2.34.1


