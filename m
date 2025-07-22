Return-Path: <linux-arm-msm+bounces-66119-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EBA3B0DFA1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 16:55:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8DE46176948
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:50:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5C032ECE9D;
	Tue, 22 Jul 2025 14:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dVWrdTHq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B796C2DF3CF;
	Tue, 22 Jul 2025 14:49:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753195799; cv=none; b=nBwxAx7kIkovcKr3dvfB09dhZySNfWaxerUJz5iNCgnj/3PxNw9ff7U2D9Mj7/um69BE86iG2YWWDGdq8NxiwjeCvpRrWVnj9SEgtTg3T/l04mgGchh/jkM2E5kzNN51Fzc+AF6+ifHs3JAl/9S7y0vJfJizqTArRFG8X4bV14E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753195799; c=relaxed/simple;
	bh=ZDHlzVOF+RK96B24o7j42nVX5R9+BETkS6nWvT0fTAs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rHS7yhCKpLHkHO/FE10C1s4qlo/x+5JDbA0opf2u5NQIh+7J4CQfGiYVJ3seQgAyaN0LJPQVva0hef7HJqUktBUazMY/RH63gZKrX3HiMAbSycpxy+6jBcRg/Y8PmmDaev3wMasbAi89XXa17joqrI7+2K2shJGOf5cXc8O055g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dVWrdTHq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56M7WIU6009369;
	Tue, 22 Jul 2025 14:49:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YYgr/mzNPvZ
	/3Dozih2AOOmCOubYHKe7WtXOAp+ZmHg=; b=dVWrdTHqLDh7q9wJHvbt6FvLaF+
	EKRiqL5J3jvmoYgZYwe0qcFlw1owT/NtcozuWfz8H9MHVYCFAyqIBenB0KqrIdRx
	t7KNMnK/240EEbWasXipverYviTlUQqFX2i4xeK4BTXYwP6AGmQuxYsEj3wWlW/j
	JsZ1pbLWSfmcibxWTDmxZTvc8FcM2ZLT4NlbN0kMRVkSXFAjZmN4HhzgYy43Zzpe
	K1b1bZ1MkJ1wdh16S7jsWY8Y2MFJ4zmjBwtWlJ8nR7k5XS+HsPjkRvrSHNwaSDnS
	tyJmBNyDVTsCIdOXpch4qqg1KyOz+HtloZvtnQ6tAFT8xiAlg4i73zcKhrw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48045w06vh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 56MEnlUR023764;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4804ekgevd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 56MEnlW7023732;
	Tue, 22 Jul 2025 14:49:47 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 56MEnk2I023726
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Jul 2025 14:49:47 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id DEB975E6; Tue, 22 Jul 2025 20:19:45 +0530 (+0530)
From: Wasim Nazir <wasim.nazir@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@oss.qualcomm.com, Wasim Nazir <wasim.nazir@oss.qualcomm.com>
Subject: [PATCH 3/7] arm64: dts: qcom: lemans: Separate out ethernet card for ride & ride-r3
Date: Tue, 22 Jul 2025 20:19:22 +0530
Message-ID: <20250722144926.995064-4-wasim.nazir@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
References: <20250722144926.995064-1-wasim.nazir@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=LL1mQIW9 c=1 sm=1 tr=0 ts=687fa510 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=iKZuLqDWvF8HZk_ksXwA:9
X-Proofpoint-GUID: UIi_OY-LvUkidEtscZ8FYfYexjFE92dK
X-Proofpoint-ORIG-GUID: UIi_OY-LvUkidEtscZ8FYfYexjFE92dK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDEyMyBTYWx0ZWRfXyhlgh5SFyprw
 QqwqKPAlU9zRdrR/8U0XPubMP4xKnMUB8gRFe7+6mZwjRD0nto3k+imDI3eu2XC2txnzE2l7UPC
 jmEAAqTJ6NPTv2nouvXZFa4txHJQGxyyXdJ5+rVIchpkszbhO1fMtuyDZt3hFqvok9OYR3qrFy8
 fS1fPoVcOZ3BlBeqF+twwqvn3Np1ud4q1yVMZYoygPxJBIwf6Pnhxb2fQ4UcdJhMaA4LkeN6T02
 zAFN1k7GiFQ+n5IGmdspPRTc2kL1u0OMYd1ZqwGC6nyYOmz6XozIZzMRrnxej1BRCIha4lExfFG
 nefmQEB1WdpuHQyAYU/ZU1zQAD/GEGlLKHvDNUUEPAomy3JsECgLmBtJh8lLPCboHq55RGGglnk
 77sNeDRDDFKc2eAwRHheKwq6GM2q3xYCQ6CGj7xJVRijmbKcKEh3TjmzlgtFQdq61DRVcY0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_02,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1011 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220123

Ride & Ride-r3 in lemans/lemans-auto uses different ethernet cards
with different phy capabilities. Separate out the ethernet card
information from main board so that it can be reused for all the
variants of ride & ride-r3 platforms in lemans/lemans-auto.

Lemans/lemans-auto Ride uses 1G phy while Lemans/lemans-auto Ride-r3
uses 2.5G phy.

Introduce ethernet cards with 1G & 2.5G phy capabilities respectively:
  *-88ea1512.dtsi is for 2x 1G - SGMII (Marvell 88EA1512-B2) phy
  *-aqr115c.dtsi is for 2x 2.5G - HSGMII (Marvell AQR115c) phy

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
2.49.0


