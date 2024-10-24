Return-Path: <linux-arm-msm+bounces-35663-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D15119ADE87
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 10:11:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5E8621F2328B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 08:11:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EBD31AF0D5;
	Thu, 24 Oct 2024 08:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="SzajlhbB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECE681AE005;
	Thu, 24 Oct 2024 08:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729757454; cv=none; b=J7H1RLwG6vhtFuU7TQy90JD5CzbY5++GbcO+SUt9y3qPDKdDMIrt860quS7fDK3xTjmkIrWC2mpvP+JSeqD69muoNaib/ghPWGrzSITDPHfv3tCH8I1LQ8VCoMjRp1BX7jkLYrgeDDkj1yR2tGkA7RE3zn3LVUQWytMdkAuDrsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729757454; c=relaxed/simple;
	bh=gscWgojEUanIV0DyFKMS6hDfBu/y+xjxw7+/o7qWgfI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=QUmZohIWjclhOqn1FgdlVoOZae+gs1+FG+ZLujXWVXTjGpUUUBzTyU0Uj71L73Ht4NIzCf0Y5QVM4OIrYkZ3c0pmbE4hpOPuvrCM3Iixq3BMk68KVlK+7hT6Pe29jW+vClKj4baEs6AV0MEI3kC5XbTv4hYzJfBrwPIky9UCC98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=SzajlhbB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49NL4V75028304;
	Thu, 24 Oct 2024 08:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=aDUYIh+5i8guvYp5QFB1wb
	bOqtDS8iKbjDahnB/AU2Q=; b=SzajlhbBPCT/7d4b08/qwFlJ9UYHoqQa75IFyM
	36qYcrj/ZaiMlaKADNdh69O9UWZOuUByhUktpF5upvSs45b4BoDCUZuoBXJwRg6k
	GISUMjntAVXFHOYifxzPadWiCUAC6lvKZ6OUoh/rIzX0ih0hhingOtsqDdg20x7o
	BEIWSRMxwyXrN8kCLURpgeNK85rKRDkV26gjOug++nzNwQt+Pfymnc0CQoUBAaYt
	/PfsGc1eXD8mivazKIN9gDmnyIeMrpkkNewoD5HV8DJrf/uwRLfB3/xTHzFMDW0s
	nSmqYTK+ZmXOjPHBWesEDcW8vp6ZH08C2Tw/JkSmpiE9Lumg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41vwww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 08:10:46 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49O8AjbT006206
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Oct 2024 08:10:45 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 24 Oct 2024 01:10:39 -0700
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Thu, 24 Oct 2024 16:09:48 +0800
Subject: [PATCH v2] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241024-adds-spmi-pmic-peripherals-for-qcs615-v2-1-f262ba243b63@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAM4AGmcC/62QQWrDMBBFrxK0ropHliU5q9yjBDMejRpBYjuSY
 1pC7l45KZQuugh0ocUX6L3/dRWZU+QstpurSLzEHMehBPWyEXTA4Z1l9CULVSldtaqV6H2WeTp
 FWQ7JqTyfDpzwmGUYkzxTNtBIMMxNDbZF60VhTYlD/Lh73vaPnPh8Kbr5cfljK/Ligkqp1dXFI
 c4Rj12+TNOY5q5Ium+JUo0JRmNLSm8XvXp6zCxpPJ3ivN14bmtnwPle9Rh6BrQVuUC6DpUh8t5
 UtdG9EmujQ8zzmD7vH7HAvdKTmxeQIHtrbQjOQqhpVwZSHOi1FFrLPXYBPMNrtXfKeAie+A+ef
 oZnmobRog+A9B88hzUZ693a8xdvf7vdvgDL2uldXgIAAA==
X-Change-ID: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
To: <quic_fenglinw@quicinc.com>, <quic_tingweiz@quicinc.com>,
        <kernel@quicinc.com>, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Tingguo Cheng <quic_tingguoc@quicinc.com>
X-Mailer: b4 0.15-dev-dedf8
X-Developer-Signature: v=1; a=ed25519-sha256; t=1729757438; l=3846;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=gscWgojEUanIV0DyFKMS6hDfBu/y+xjxw7+/o7qWgfI=;
 b=58eSs6XTVjCBYB/4Q0x/P0kmh4/Y0s9KCZn13irBA3bR5XDMXHcbpPIgJE6M7IRjBNaYclCde
 oWD02rm4DgWDrgeb2J1bY6Qv9RpGdJQfJOxooKRxf4nJ2FdDw3kbbN8
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: LTtkUse2ZST4K8miD4IFJos4w4yzcW1q
X-Proofpoint-ORIG-GUID: LTtkUse2ZST4K8miD4IFJos4w4yzcW1q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410240063

Add SPMI bus arbiter and include pm8150.dtsi for PMIC peripherals in
pmm6155au which is a variant of pm8150. The power key and volume do-
wn key are controlled by PMIC PON hardware on pmm6155au.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
This patch depends on the patch series:
- https://lore.kernel.org/all/20241022-add_initial_support_for_qcs615-v4-0-0a551c6dd342@quicinc.com/
---
Changes in v2:
- Include "pm8150.dtsi" for QCS615 PMIC instead of creating a new
  qcs615-pmic.dtsi in the case that pmm6155au is a variant of pm8150.
- Fixed comments from community in V1.
- Link to v1: https://lore.kernel.org/r/20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 27 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615.dtsi     | 23 +++++++++++++++++++++++
 2 files changed, 50 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..71ea0cb32eebed713b2a80ab692b14fdb4bd0ce4 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "pm8150.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
@@ -210,6 +211,32 @@ &rpmhcc {
 	clocks = <&xo_board_clk>;
 };
 
+&spmi_bus {
+	pmm6155au_0: pmic@0 {
+
+		pon: pon@800 {
+
+			/delete-property/ mode-bootloader;
+			/delete-property/ mode-recovery;
+
+			pon_pwrkey: pwrkey {
+				status = "okay";
+			};
+
+			pon_resin: resin {
+				linux,code = <KEY_VOLUMEDOWN>;
+				status = "okay";
+			};
+		};
+
+		pmm6155au_0_gpios: gpio@c000 {};
+	};
+
+	pmm6155au_1: pmic@1 {
+		status = "disabled";
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1fbb28865877555ba317677bc6bd2..3fc928913239cfc61c24d1b16c183b96f38e589d 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -517,6 +517,29 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		spmi_bus: spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0x0c440000 0x0 0x1100>,
+			      <0x0 0x0c600000 0x0 0x2000000>,
+			      <0x0 0x0e600000 0x0 0x100000>,
+			      <0x0 0x0e700000 0x0 0xa0000>,
+			      <0x0 0x0c40a000 0x0 0x26000>;
+			reg-names = "core",
+				    "chnls",
+				    "obsrvr",
+				    "intr",
+				    "cnfg";
+			interrupts-extended = <&pdc 1 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "periph_irq";
+			interrupt-controller;
+			#interrupt-cells = <4>;
+			#address-cells = <2>;
+			#size-cells = <0>;
+			cell-index = <0>;
+			qcom,channel = <0>;
+			qcom,ee = <0>;
+		};
+
 		intc: interrupt-controller@17a00000 {
 			compatible = "arm,gic-v3";
 			reg = <0x0 0x17a00000 0x0 0x10000>,     /* GICD */

---
base-commit: de938618db2bafbe1a70c8fc43f06ccdd60364b2
change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
prerequisite-change-id: 20241022-add_initial_support_for_qcs615-2256f64a9c24:v4
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 3bd8edd83297815fcb1b81fcd891d3c14908442f
prerequisite-patch-id: fc1cfec4ecd56e669c161c4d2c3797fc0abff0ae

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


