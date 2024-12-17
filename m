Return-Path: <linux-arm-msm+bounces-42475-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 202A99F4488
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 07:56:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3D767A1F92
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2024 06:55:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E320B1F0E52;
	Tue, 17 Dec 2024 06:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="mJIRpnGN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ABEB16EB7C;
	Tue, 17 Dec 2024 06:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734418165; cv=none; b=ADX2UmF7Be+Pi1ajgf6QmotWXY9Ox1Ihd3HgyIgPnYUkWspRhM4LfK9FWWphc75glyfh4qohJZcYo7DRSb3usHkAArBykwdIWxRhEK5BKNpxGeXEVae38MfFMHwkKEei9fR3WIm+BFWBkmu5/ub8A5fkqa0j0oZar0n01DnW3kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734418165; c=relaxed/simple;
	bh=1e3Jejh3k5pxR4blBbZvAPbPO6wIUVRNzYflbiAvsIU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Tu8+aNGGN/y6oeGvXlfoQ/76wpsrJ7L0P/z0+saIDXUNJ1ErdOHYEJVy0Y8eLVI0u09mzWucPpQQ42Xmv77zN+i9u6G1KGIog7d4CN0/Ef/dj1RrTKE7S050cRKrt8iZsieveg4jUDXiVuVkfB6yD/lLIM5f8a0gwpO72YW9pbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=mJIRpnGN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6mRZP012103;
	Tue, 17 Dec 2024 06:49:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=SZHMx5YaHfJ
	GbP6S0hrzbEDKBNwu+eT3c7CFH3xemBA=; b=mJIRpnGN671UNVY0n4FjlH23Fyq
	FMjLApkG5H2nEUG7lfENuvQvKGfPwKNvr01lyjVyTeQ/ro3IQFn+DZSO+wVZiXT4
	s2E5G88CQJJzSKqMeGHU9jjNMsSlb1GZRlxnu37vqFhXnuvtaDgP19iLW7l5ZDTZ
	na87fu7ZcUkXun4xDYXk+E8MumjIk7NntYmhzzvNQ3w3EteCicMoqfURKybIxaKa
	4oYSOeo9FOpExZB+gSBdLWHsnPZkuKGmAeVahLfPaR9Su0XEuSoPd6PVSrWFKiNa
	2d6t9gzIb1K5mrHXhDrlppWcc8Zb0WErVGDJe/6JTlU9TxnwArY6iG1I2hA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43k4bx001x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:04 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 4BH6n0tv014924;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 43h33kx8ys-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 4BH6n0bL014876;
	Tue, 17 Dec 2024 06:49:01 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4BH6n1Q5014928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Dec 2024 06:49:01 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 0A3795AE; Tue, 17 Dec 2024 12:18:59 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        kernel@quicinc.com, Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH v4 5/7] arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3
Date: Tue, 17 Dec 2024 12:18:54 +0530
Message-ID: <20241217064856.2772305-6-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MeMfxgGqj3xJGo61ObBnNAYjBn6vtl8V
X-Proofpoint-ORIG-GUID: MeMfxgGqj3xJGo61ObBnNAYjBn6vtl8V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 suspectscore=0
 spamscore=0 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2411120000 definitions=main-2412170054

Add device tree support for QCS9075 Ride & Ride-r3 boards.

QCS9075 lacks the safety monitoring features of Safety-Island (SAIL)
subsystem which is available in QCS9100, and it affects thermal
management.

Also, between ride and ride-r3 ethernet phy is different.
Ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 arch/arm64/boot/dts/qcom/Makefile            |  2 +
 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts | 46 ++++++++++++++++++++
 arch/arm64/boot/dts/qcom/qcs9075-ride.dts    | 46 ++++++++++++++++++++
 3 files changed, 94 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
 create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 78613a1bd34a..41cb2bbd3472 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -118,6 +118,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qcs6490-rb3gen2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8300-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs8550-aim300-aiot.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-rb8.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= qcs9075-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qcs9100-ride-r3.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= qdu1000-idp.dtb
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
new file mode 100644
index 000000000000..d9a8956d3a76
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride Rev3";
+	compatible = "qcom,qcs9075-ride-r3", "qcom,qcs9075", "qcom,sa8775p";
+};
+
+&ethernet0 {
+	phy-mode = "2500base-x";
+};
+
+&ethernet1 {
+	phy-mode = "2500base-x";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@0 {
+		compatible = "ethernet-phy-id31c3.1c33";
+		reg = <0x0>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/qcs9075-ride.dts b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
new file mode 100644
index 000000000000..3b524359a72d
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/qcs9075-ride.dts
@@ -0,0 +1,46 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2024, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+/dts-v1/;
+
+#include "sa8775p-ride.dtsi"
+
+/ {
+	model = "Qualcomm Technologies, Inc. QCS9075 Ride";
+	compatible = "qcom,qcs9075-ride", "qcom,qcs9075", "qcom,sa8775p";
+};
+
+&ethernet0 {
+	phy-mode = "sgmii";
+};
+
+&ethernet1 {
+	phy-mode = "sgmii";
+};
+
+&mdio {
+	compatible = "snps,dwmac-mdio";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgmii_phy0: phy@8 {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0x8>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+
+	sgmii_phy1: phy@a {
+		compatible = "ethernet-phy-id0141.0dd4";
+		reg = <0xa>;
+		device_type = "ethernet-phy";
+		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
+		reset-assert-us = <11000>;
+		reset-deassert-us = <70000>;
+	};
+};
--
2.47.0


