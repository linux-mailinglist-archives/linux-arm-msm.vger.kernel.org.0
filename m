Return-Path: <linux-arm-msm+bounces-33759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EFA997AD5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 04:58:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B2AB5B23BDE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 02:58:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 591F319149F;
	Thu, 10 Oct 2024 02:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="AcW1ZCv4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27E218D623;
	Thu, 10 Oct 2024 02:57:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728529071; cv=none; b=EAbdQFRGyNn+hkWHldmiFoEfr15w6KeGznN8dYTVxJSIRxfE5R0ebmK9HvgWB/rgeEbc/1dewV/4vxCfeo0/5VROEQt1tLmqZ7ZgafE+jkY0CJah4d1LUT1LLH/9bW5/rRebRbnmTgzORdI8jUbPWvgymAG5MO3lPdl3NQhQGSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728529071; c=relaxed/simple;
	bh=QpoSpjPCLu/ZNgvBi29MHKrtjF7sQ+pJQxRCbLYoiNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=f4o9taDRAFLWNQNs+OTu9LqnJkNrdJzrmhUKJRcS6P8PG/crBpZY6/bPr+B6k7PFVQ4fycJ7BTqgww3NbglXXiB0wZ3pGENULax3Q9aX1shNWTmnpYUoLmlxYk+aUWI715T4JN6RHMnCDRKoqhAobFAwvY7sY7xOoXF/XhTnx7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=AcW1ZCv4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49A1bI23011345;
	Thu, 10 Oct 2024 02:57:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RzV/CYDhuLH7rENvOez8U+6ZovO7somL73ud/l8kAd0=; b=AcW1ZCv4cPhVzAUJ
	jIDv8WodaPsKKIeIcBXFEzTwwncAYCRlEXdij7fX/GGO2My3KRfgie/EeUFK39Xf
	qfzeim7slUpjk8dQv/vHFEeE4Nz1R8kAzGh7CfsaT6BUzBFC+kDPTJS/082FBLJ1
	bzUZdYZVYAfG3LXPWdJW4uSRpH4hE3etxXf5PiFg01geCtOrq+PH7qhtCTO1InCD
	o4/lssxVfkWu1yKwb+FwKu3L9j7CxRY2npKFk1xgtZ3weA+M788sVNZDSzTNJQXd
	BlCScL0qIT4Mn0IyAiSjGfrC5WIeZ7WwNZnsBCjD/c7HF6fT/IvXU2vBjfJsVZDT
	6b2s1Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 425xths1ya-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:45 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49A2vjxq028412
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Oct 2024 02:57:45 GMT
Received: from yijiyang-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 9 Oct 2024 19:57:41 -0700
From: Yijie Yang <quic_yijiyang@quicinc.com>
Date: Thu, 10 Oct 2024 10:57:17 +0800
Subject: [PATCH 3/5] arm64: dts: qcom: qcs8300-ride: enable ethernet0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241010-dts_qcs8300-v1-3-bf5acf05830b@quicinc.com>
References: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
In-Reply-To: <20241010-dts_qcs8300-v1-0-bf5acf05830b@quicinc.com>
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
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728529047; l=3088;
 i=quic_yijiyang@quicinc.com; s=20240408; h=from:subject:message-id;
 bh=QpoSpjPCLu/ZNgvBi29MHKrtjF7sQ+pJQxRCbLYoiNM=;
 b=SS3HDQpKqwWxABC5JEEFLE6ZhHKe9o/QTohGfUwkJ28NeGTmbovCWPF3VoSCbDq2ZNfh3nQT7
 ji90q0SezdqAGKVo4wdincDWQseqcjGd+8HNpTjB0gS9xaliH8SxH2+
X-Developer-Key: i=quic_yijiyang@quicinc.com; a=ed25519;
 pk=XvMv0rxjrXLYFdBXoFjTdOdAwDT5SPbQ5uAKGESDihk=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 4if4stgDg6g7p8qhaXbTwO7aRxYTZ2NU
X-Proofpoint-GUID: 4if4stgDg6g7p8qhaXbTwO7aRxYTZ2NU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 phishscore=0 clxscore=1015 mlxlogscore=899 impostorscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2410100018

Enable the SerDes PHY on qcs8300-ride.
Add the MDC and MDIO pin functions for ethernet0 on qcs8300-ride.
Enable the first 1Gb ethernet port on qcs8300-ride development board.

Signed-off-by: Yijie Yang <quic_yijiyang@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 112 ++++++++++++++++++++++++++++++
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


