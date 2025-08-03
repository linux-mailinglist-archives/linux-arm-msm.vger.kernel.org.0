Return-Path: <linux-arm-msm+bounces-67583-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 47EC0B193AF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 13:03:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 80D293ABA23
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 Aug 2025 11:02:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FEC926AABE;
	Sun,  3 Aug 2025 11:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="P6OQ1mcE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0BB21ABC9;
	Sun,  3 Aug 2025 11:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754218898; cv=none; b=FZjmTFZDTscDJ8tUfxwHxg2n0uGI72inmSHXrYUxA923OF1hrRhw9Qj/0g0Ky7RMkKPgp4LlbGTgcXRl9t2HZZ4OlL3Olk9CW86db93qvfSIaKvyxkzwfVseFNs0wNsZ3V3XnCkh+eGhMkDhuUrQeP4i3a2znwxPCuJqFaCCsvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754218898; c=relaxed/simple;
	bh=AtcfNUNneaVxZFHLW0ce8QX0IyvuV+jom1ZL/A0Qv3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AxmTRMZfsE7aJ/3q0ob6AkmyhdNi21RzyOgHmbbc+k+AqBYI79Dr2KWxsoqKKt9NvV1rG+6xOFl6XhC4GhIwpmaTKzmfFSnYk3WvJaJ81opHYmYBsNl1Px6Tujjip7zaOrwLfkFnXlznVc6jiVnueznQlZbGsHJdkDPDfbsGVYk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=P6OQ1mcE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57387W9N019071;
	Sun, 3 Aug 2025 11:01:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6ssc8CAz4Ur
	N/XKnsStlVizgy1upHk+RxkKBjB41sPM=; b=P6OQ1mcEwrQHIPMKwKZuxum8msd
	S2onRJyXWLzys5UGKfsglEeT1M/0AG6/EW2XmxLozg/s60vxGvOLUYhTh6bYv3B0
	SfKBJ9qGAzGUYshSh4kSuTb4qUbSTdMkovUtN5Rb66donGcTZfsgHgyBL6q/eZL1
	nuwXaA6Ax9SbaA2JC/Y9GdKANlmZO5jZinqRom8sSuFdpgHZiX5VX/L5hBfstxUk
	KCKxJeGsVE/c+dz0BQlbKSOONaYoXhBantgo6lyBjqiA85X8zLFGm392149nzUeP
	qMJwzA3lf/BL15ijagAmtwejSsf48biV4MH8KFXc92AnmOqL6gu6LWqh9pA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 489b2a24v4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 573B1JPl015298;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 489brke03p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 573B1JQS015275;
	Sun, 3 Aug 2025 11:01:19 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 573B1JPs015272
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 03 Aug 2025 11:01:19 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 7B4875DA; Sun,  3 Aug 2025 16:31:18 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/8] arm64: dts: qcom: lemans: Separate out ethernet card for ride & ride-r3
Date: Sun,  3 Aug 2025 16:31:07 +0530
Message-ID: <20250803110113.401927-4-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
References: <20250803110113.401927-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=OKwn3TaB c=1 sm=1 tr=0 ts=688f4183 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=2OwXVqhp2XgA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iKZuLqDWvF8HZk_ksXwA:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8prr0R4SCPKpDT1ndtIx7uoIEMfUn2Es
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAzMDA3MyBTYWx0ZWRfX62UbWtJyvlPK
 TJyvqzOz6zf3DXBIxelIpaUF2EkEGle7nGnX+0EiPhLE6rUCtlDIir5Ap8kB7rC7pXDCv/+DdHa
 WCQnmk/ybO+Q054hgxmeMVmaMGXXMzvfvC1s/J2ExpoeywFAAhhMp2LPkneTiHoEL17gabA+yDC
 Q6cdSR0UvzT0nxM/XNkMx3N24uzzKUZXRB6cB1IlXMAypxqN4/HS1P70CLOGdRfFju0WJntj0w6
 bazR3wBa2409i8bTQmxmlPKZYA/Rkp9Br3KFs/QfwakOtrtf+EngjZRgBcyBjcWGkIdDaZqy5hq
 jVZOpRyrbI+/WlsVTQMPAPZTovEz88OTK5t76+8ha7l8IQyTjM+G+5gdiuhg1tX7Gj4HHfdJDcL
 25AguvsWkB8SIQZPmNyre1HjjDDy8lPkzM9JB4CHV4rmYDGC2iUP3MgIEBdKoJtM8CWO8Ze1
X-Proofpoint-GUID: 8prr0R4SCPKpDT1ndtIx7uoIEMfUn2Es
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-03_03,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 mlxlogscore=999 clxscore=1011
 phishscore=0 impostorscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508030073

Ride & Ride-r3 in lemans/lemans-auto uses different ethernet cards
with different phy capabilities. Separate out the ethernet card
information from main board so that it can be reused for all the
variants of ride & ride-r3 platforms in lemans/lemans-auto.

Lemans/lemans-auto Ride uses 1G phy while Lemans/lemans-auto Ride-r3
uses 2.5G phy.

Introduce ethernet cards with 1G & 2.5G phy capabilities respectively:
  *-88ea1512.dtsi is for 2x 1G - SGMII (Marvell 88EA1512-B2) phy
  *-aqr115c.dtsi is for 2x 2.5G - HSGMII (Marvell AQR115c) phy

Nacked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
---
 .../qcom/lemans-ride-ethernet-88ea1512.dtsi   | 205 ++++++++++++++++++
 .../qcom/lemans-ride-ethernet-aqr115c.dtsi    | 205 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  35 +--
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  35 +--
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 163 --------------
 5 files changed, 412 insertions(+), 231 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
new file mode 100644
index 000000000000..9d6bbe1447a4
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-88ea1512.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/*
+ * Ethernet card for Lemans based Ride boards.
+ * It supports 2x 1G - SGMII (Marvell 88EA1512-B2) phy for Main domain
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
+	};
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&sgmii_phy0>;
+	phy-mode = "sgmii";
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
+			interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		sgmii_phy1: phy@a {
+			compatible = "ethernet-phy-id0141.0dd4";
+			reg = <0xa>;
+			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
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
+&ethernet1 {
+	phy-handle = <&sgmii_phy1>;
+	phy-mode = "sgmii";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
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
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
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
diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
new file mode 100644
index 000000000000..2d2d9ee5f0d9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-ethernet-aqr115c.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Linaro Limited
+ */
+
+/*
+ * Ethernet card for Lemans based Ride r3 boards.
+ * It supports 2x 2.5G - HSGMII (Marvell hsgmii) phy for Main domain
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	aliases {
+		ethernet0 = &ethernet0;
+		ethernet1 = &ethernet1;
+	};
+};
+
+&tlmm {
+	ethernet0_default: ethernet0-default-state {
+		ethernet0_mdc: ethernet0-mdc-pins {
+			pins = "gpio8";
+			function = "emac0_mdc";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+
+		ethernet0_mdio: ethernet0-mdio-pins {
+			pins = "gpio9";
+			function = "emac0_mdio";
+			drive-strength = <16>;
+			bias-pull-up;
+		};
+	};
+};
+
+&ethernet0 {
+	phy-handle = <&hsgmii_phy0>;
+	phy-mode = "2500base-x";
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
+		hsgmii_phy0: phy@8 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x8>;
+			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
+			reset-assert-us = <11000>;
+			reset-deassert-us = <70000>;
+		};
+
+		hsgmii_phy1: phy@0 {
+			compatible = "ethernet-phy-id31c3.1c33";
+			reg = <0x0>;
+			device_type = "ethernet-phy";
+			interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
+			reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
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
+&ethernet1 {
+	phy-handle = <&hsgmii_phy1>;
+	phy-mode = "2500base-x";
+
+	snps,mtl-rx-config = <&mtl_rx_setup1>;
+	snps,mtl-tx-config = <&mtl_tx_setup1>;
+	snps,ps-speed = <1000>;
+
+	status = "okay";
+
+	mtl_rx_setup1: rx-queues-config {
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
+	mtl_tx_setup1: tx-queues-config {
+		snps,tx-queues-to-use = <4>;
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
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
index ae065ae92478..a7f377dc4733 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -6,42 +6,9 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "lemans-ride-ethernet-aqr115c.dtsi"

 / {
 	model = "Qualcomm SA8775P Ride Rev3";
 	compatible = "qcom,sa8775p-ride-r3", "qcom,sa8775p";
 };
-
-&ethernet0 {
-	phy-mode = "2500base-x";
-};
-
-&ethernet1 {
-	phy-mode = "2500base-x";
-};
-
-&mdio {
-	compatible = "snps,dwmac-mdio";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	sgmii_phy0: phy@8 {
-		compatible = "ethernet-phy-id31c3.1c33";
-		reg = <0x8>;
-		device_type = "ethernet-phy";
-		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <11000>;
-		reset-deassert-us = <70000>;
-	};
-
-	sgmii_phy1: phy@0 {
-		compatible = "ethernet-phy-id31c3.1c33";
-		reg = <0x0>;
-		device_type = "ethernet-phy";
-		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <11000>;
-		reset-deassert-us = <70000>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
index 2e87fd760dbd..b765794f7e54 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -6,42 +6,9 @@
 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "lemans-ride-ethernet-88ea1512.dtsi"

 / {
 	model = "Qualcomm SA8775P Ride";
 	compatible = "qcom,sa8775p-ride", "qcom,sa8775p";
 };
-
-&ethernet0 {
-	phy-mode = "sgmii";
-};
-
-&ethernet1 {
-	phy-mode = "sgmii";
-};
-
-&mdio {
-	compatible = "snps,dwmac-mdio";
-	#address-cells = <1>;
-	#size-cells = <0>;
-
-	sgmii_phy0: phy@8 {
-		compatible = "ethernet-phy-id0141.0dd4";
-		reg = <0x8>;
-		device_type = "ethernet-phy";
-		interrupts-extended = <&tlmm 7 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&pmm8654au_2_gpios 8 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <11000>;
-		reset-deassert-us = <70000>;
-	};
-
-	sgmii_phy1: phy@a {
-		compatible = "ethernet-phy-id0141.0dd4";
-		reg = <0xa>;
-		device_type = "ethernet-phy";
-		interrupts-extended = <&tlmm 26 IRQ_TYPE_EDGE_FALLING>;
-		reset-gpios = <&pmm8654au_2_gpios 9 GPIO_ACTIVE_LOW>;
-		reset-assert-us = <11000>;
-		reset-deassert-us = <70000>;
-	};
-};
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index a9ec6ded412e..f512363f6222 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -13,8 +13,6 @@

 / {
 	aliases {
-		ethernet0 = &ethernet0;
-		ethernet1 = &ethernet1;
 		i2c11 = &i2c11;
 		i2c18 = &i2c18;
 		serial0 = &uart10;
@@ -443,151 +441,6 @@ vreg_l8e: ldo8 {
 	};
 };

-&ethernet0 {
-	phy-handle = <&sgmii_phy0>;
-
-	pinctrl-0 = <&ethernet0_default>;
-	pinctrl-names = "default";
-
-	snps,mtl-rx-config = <&mtl_rx_setup>;
-	snps,mtl-tx-config = <&mtl_tx_setup>;
-	snps,ps-speed = <1000>;
-
-	status = "okay";
-
-	mdio: mdio {
-		compatible = "snps,dwmac-mdio";
-		#address-cells = <1>;
-		#size-cells = <0>;
-	};
-
-	mtl_rx_setup: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
-	};
-
-	mtl_tx_setup: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-	};
-};
-
-&ethernet1 {
-	phy-handle = <&sgmii_phy1>;
-
-	snps,mtl-rx-config = <&mtl_rx_setup1>;
-	snps,mtl-tx-config = <&mtl_tx_setup1>;
-	snps,ps-speed = <1000>;
-
-	status = "okay";
-
-	mtl_rx_setup1: rx-queues-config {
-		snps,rx-queues-to-use = <4>;
-		snps,rx-sched-sp;
-
-		queue0 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x0>;
-			snps,route-up;
-			snps,priority = <0x1>;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-			snps,map-to-dma-channel = <0x1>;
-			snps,route-ptp;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x2>;
-			snps,route-avcp;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,map-to-dma-channel = <0x3>;
-			snps,priority = <0xc>;
-		};
-	};
-
-	mtl_tx_setup1: tx-queues-config {
-		snps,tx-queues-to-use = <4>;
-
-		queue0 {
-			snps,dcb-algorithm;
-		};
-
-		queue1 {
-			snps,dcb-algorithm;
-		};
-
-		queue2 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-
-		queue3 {
-			snps,avb-algorithm;
-			snps,send_slope = <0x1000>;
-			snps,idle_slope = <0x1000>;
-			snps,high_credit = <0x3e800>;
-			snps,low_credit = <0xffc18000>;
-		};
-	};
-};
-
 &i2c11 {
 	clock-frequency = <400000>;
 	status = "okay";
@@ -960,22 +813,6 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};

-	ethernet0_default: ethernet0-default-state {
-		ethernet0_mdc: ethernet0-mdc-pins {
-			pins = "gpio8";
-			function = "emac0_mdc";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-
-		ethernet0_mdio: ethernet0-mdio-pins {
-			pins = "gpio9";
-			function = "emac0_mdio";
-			drive-strength = <16>;
-			bias-pull-up;
-		};
-	};
-
 	io_expander_intr_active: io-expander-intr-active-state {
 		pins = "gpio98";
 		function = "gpio";
--
2.50.1


