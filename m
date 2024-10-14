Return-Path: <linux-arm-msm+bounces-34302-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 661BF99C6BC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 12:09:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8560C1C22749
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 10:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C678915B104;
	Mon, 14 Oct 2024 10:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="a4CH1TR9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAA4158DD4;
	Mon, 14 Oct 2024 10:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728900539; cv=none; b=VU8E2jM22a9zLP6+GzgbkPQkS96dfWdJ7yIrKjJ3yBToBAe/NYwEpqt3XTZ0Jqwfff/EItQaD4z/iDQJw281TfIrGE3JQ9ZouELYR6HZ47r8AAMmzc/XbwO1FNDMsS0fix+hB4qSq3lLNMZe/Ybt/3GrQjs16i5mtYHcCFEcSWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728900539; c=relaxed/simple;
	bh=3PfaXSOyq0q3WdndxuU7FGq5dYmARb8iqqPUCt4NFNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:To:CC; b=lHIPvd6I4+U6hPGYf3VtLVu2PyimuSBvTz/59t7p6VL+vwL8Y1vl0Y+0c0xtp7eEZfyTK3shgzYXz4Z3FvT/M9hLZ08uoVkT7LaO3N+R3P6vMBUGBey6AmZ9zX8TY4XsTdLJzCeqET5WWfFnJ2oPt/KXZs5VIWwBQ9B4x7v5pMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=a4CH1TR9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49DNrX9i029704;
	Mon, 14 Oct 2024 10:08:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=edWDa5xwSTQAr7cUxHOYwI
	271RHROsLz7v70NjlPbSU=; b=a4CH1TR9O7xS/fE21+vba6GUXrFFKElS0u23yj
	pU+0X6pEA5WFsO0kOOApoM1gn4JcaS+Ro+AVFvenauqQ4paKqwKRe3aW167cv9Q5
	fsedefQV/nEPl19cHa1YUWC3I7f5KaBx+3OFwVEVADY5/oqzA/skB739xd+VrYfW
	NXRlzIV+11hQevYuxt4VO2vs9xxHx8t5MUNF0yzxJ0uxueH5yOUcuWhlHaeySrZL
	wtpM2h9nzU/7Rr9XuI7DYloico1yG/F4OTqV9M8XUapFMbyCFbHMia9YuPlII2QR
	3obAlfqMPCq6KsiF9aumPNam0xHZ1jTcb8QwP0gvz3ie2sKw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 427g45c44w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 10:08:53 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49EA8qnh030326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 14 Oct 2024 10:08:52 GMT
Received: from cse-cd02-lnx.ap.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 14 Oct 2024 03:08:46 -0700
From: Tingguo Cheng <quic_tingguoc@quicinc.com>
Date: Mon, 14 Oct 2024 18:08:17 +0800
Subject: [PATCH] arm64: dts: qcom: qcs615: Adds SPMI bus, PMIC and
 peripherals
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241014-adds-spmi-pmic-peripherals-for-qcs615-v1-1-8a3c67d894d8@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAJTtDGcC/5WQy26DMBBFfwV5XVce8ANY5T+qCPkxLpYSIDZBr
 SL+vYZEqrrogsUs7ki+54wfJGEMmEhbPEjEJaQwDjnAW0Fsr4dPpMHlTEpWctaUDdXOJZqma6B
 5LJ3y86nHqC+J+jHSm00SBAWJKCpQjVaO5K4pog9fO+fj/MwRb/eMm5/LX1pbvFh8Y3VhCHPQl
 y7dp2mMc5ch3QuiGRhTOselYO1SbRyjE1I7Xq9hbgtbV56ZuhSKg7GmcbVWBqWysvLSNIwLVzE
 vNNmM+pDmMX7vH7HArnTw5gUoUKOU8r5W4Ct7ygfaMNj3LLTJbX3AAI70NdzVpXTgncV/+viRP
 ikEaqWdB/3X77yu6w9cA7ISDgIAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728900526; l=4809;
 i=quic_tingguoc@quicinc.com; s=20240917; h=from:subject:message-id;
 bh=3PfaXSOyq0q3WdndxuU7FGq5dYmARb8iqqPUCt4NFNU=;
 b=m6WhXR8j5fiDzXfIxViPqBAr7fdvt3gFz62Lsc6JldC4Vw992EWqeDMoaBxMvRsx47dcl/iqD
 YOzC0rcqHl8Dck0mtyZPutCbUsprSvg5/g2HLgEcV0SPC4QPCHB+OOa
X-Developer-Key: i=quic_tingguoc@quicinc.com; a=ed25519;
 pk=PiFYQPN5GCP7O6SA43tuKfHAbl9DewSKOuQA/GiHQrI=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: SxxbkWxLpSNYMpXjCrxPpYewHZxxbdkT
X-Proofpoint-ORIG-GUID: SxxbkWxLpSNYMpXjCrxPpYewHZxxbdkT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 lowpriorityscore=0 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0
 mlxscore=0 priorityscore=1501 adultscore=0 clxscore=1011 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410140073

Create a new file qcs615-pmic.dtsi to add on-board PMIC and peripher-
als in the PMIC that controlled by SPMI bus. The peripherals include
GPIO, RTC, PON, power key and resin-key for QCS615 platform. The power
key and volume down key are controlled by PMIC PON hardware on QCS615.

Signed-off-by: Tingguo Cheng <quic_tingguoc@quicinc.com>
---
This patch depends on the patch series:
- https://lore.kernel.org/all/20240926-add_initial_support_for_qcs615-v3-0-e37617e91c62@quicinc.com/
---
 arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi | 56 +++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs615-ride.dts  |  1 +
 arch/arm64/boot/dts/qcom/qcs615.dtsi      | 23 +++++++++++++
 3 files changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi b/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..d5e98503bb32aa6c75f9a9c613d562c6140ddf14
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs615-pmic.dtsi
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/spmi/spmi.h>
+
+&spmi_bus {
+	pmm6155au_0: pmic@0 {
+		compatible = "qcom,spmi-pmic";
+		reg = <0x0 SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmm6155au_0_pon: pon@800 {
+			compatible = "qcom,pm8998-pon";
+			reg = <0x800>;
+
+			pon_pwrkey: pwrkey {
+				compatible = "qcom,pm8941-pwrkey";
+				interrupts = <0x0 0x8 0x0 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_POWER>;
+			};
+
+			pon_resin: resin {
+				compatible = "qcom,pm8941-resin";
+				interrupts = <0x0 0x8 0x1 IRQ_TYPE_EDGE_BOTH>;
+				debounce = <15625>;
+				bias-pull-up;
+				linux,code = <KEY_VOLUMEDOWN>;
+			};
+		};
+
+		pmm6155au_0_rtc: rtc@6100 {
+			compatible = "qcom,pm8941-rtc";
+			reg = <0x6100>, <0x6200>;
+			reg-names = "rtc", "alarm";
+			interrupts = <0x0 0x61 0x1 IRQ_TYPE_EDGE_RISING>;
+			allow-set-time;
+		};
+
+		pmm6155au_0_gpios: gpio@c000 {
+			compatible = "qcom,pm8150-gpio";
+			reg = <0xc000>;
+			gpio-controller;
+			gpio-ranges = <&pmm6155au_0_gpios 0 0 12>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+	};
+};
+
diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index 4ef969a6af150933c72a7a83374a5a2657eebc1b..b79c22730920e3097425e1d1933e744205b3c18e 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
+#include "qcs615-pmic.dtsi"
 / {
 	model = "Qualcomm Technologies, Inc. QCS615 Ride";
 	compatible = "qcom,qcs615-ride", "qcom,qcs615";
diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index ac4c4c751da1fbb28865877555ba317677bc6bd2..9793161db515a2ef1df6465c8d0a04a11e71ffc1 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -517,6 +517,29 @@ sram@c3f0000 {
 			reg = <0x0 0x0c3f0000 0x0 0x400>;
 		};
 
+		spmi_bus: qcom,spmi@c440000 {
+			compatible = "qcom,spmi-pmic-arb";
+			reg = <0x0 0xc440000 0x0 0x1100>,
+			      <0x0 0xc600000 0x0 0x2000000>,
+			      <0x0 0xe600000 0x0 0x100000>,
+			      <0x0 0xe700000 0x0 0xa0000>,
+			      <0x0 0xc40a000 0x0 0x26000>;
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
base-commit: c83f0b825741bcb9d8a7be67c63f6b9045d30f5a
change-id: 20240929-adds-spmi-pmic-peripherals-for-qcs615-16ee53179a7d
prerequisite-change-id: 20240924-add_initial_support_for_qcs615-a01bb2dd4650:v3
prerequisite-patch-id: 09782474af7eecf1013425fd34f9d2f082fb3616
prerequisite-patch-id: 624720e543d7857e46d3ee49b8cea413772deb4c
prerequisite-patch-id: 04ca722967256efddc402b7bab94136a5174b0b9
prerequisite-patch-id: ab88a42ec69ad90e8509c9c5b7c6bdd595a7f783
prerequisite-patch-id: 918724fafe43acaa4c4b980bfabe36e9c3212cd1
prerequisite-patch-id: 91cb230c6d129ff21c24d124fad9e37a66cb6a22
prerequisite-patch-id: 57afeee80c9aa069ee243f5a5b634702867d20f1

Best regards,
-- 
Tingguo Cheng <quic_tingguoc@quicinc.com>


