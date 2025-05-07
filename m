Return-Path: <linux-arm-msm+bounces-57070-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 473B4AAD685
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 08:54:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 01D129873D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 06:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E07121FF4E;
	Wed,  7 May 2025 06:51:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="Grbv7hPF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5017821422A;
	Wed,  7 May 2025 06:51:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746600697; cv=none; b=msXqCuTwjqUkZGVY4Fian6NXlHy/6HqO/XuIYkf2in0Px1icnSi+WR2CR+MNrcHOMzPnGw64zhuKn6+keyHebRRnzvpijjD2xumNxzvgdSaKuBDe096C6OMgqb6nHB6n11g6+PQiwtYzUcQmzf3k0/T/lOmn1gnzL6MCzBePfn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746600697; c=relaxed/simple;
	bh=+Qk5RhgwE7mEuK1IqzbNYvEhgm1tpbkWrwLnF2n1u3Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gqZbh33d3vM0NJIOvGqBhITeB//TFH5x74a9YuwjenuJxB+ERIYI36hcd9+VikvIyl3ZttlUYRR/xr90H6X67I2fyJjX8K0OBJOLe/cSWl+Az5S6j5TqJh3aMPIci5Xd1KZrYtHrQvGuEKoqK2ZrkmVPhaIuqGKRgo3dsaJi6TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=Grbv7hPF; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5471Glvb002516;
	Wed, 7 May 2025 06:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=EIXsCpHtRrV
	EcQZ15hrtNzriFYW+XKLrIpTaz7oZEUI=; b=Grbv7hPFuDjmLzglAbfXj0JffVy
	CZAuNZWJUGwNkjqZt18B3zi9TdlkDoYNxKx3N+lRcHVnGUDnK9fyGtTX82rYTTep
	SXScdH7MAc08iLxC0SCQKCOzYRDVBSsFe2xBslgm99x9F3cX7YS+GxjOonrE0s7Y
	MHv5NmOwLG0NYYRDbQak10dofcMdnbDnhhEA72F2VCfJFT7FiDxvTanBS8UBfOKK
	dcTSHe9waTGfHXVfCiOUWc++Ckv5jP/JXymsEEABV63r/IG0mS8kuroZEcMEVRQR
	5mYrS/C4wgXDl6cTV/bDojwZGYFn2MscHu/aIzyKLl2GlmxRB1P9LMYvYwA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fsmt17dc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:29 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5476pPJN009491;
	Wed, 7 May 2025 06:51:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 46dc7ms9r8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:25 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5476pOF3009460;
	Wed, 7 May 2025 06:51:24 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-wasimn-hyd.qualcomm.com [10.147.246.180])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5476pOjd009448
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 07 May 2025 06:51:24 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3944840)
	id 3AA755B1; Wed,  7 May 2025 12:21:23 +0530 (+0530)
From: Wasim Nazir <quic_wasimn@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        kernel@quicinc.com, kernel@oss.qualcomm.com,
        Wasim Nazir <quic_wasimn@quicinc.com>
Subject: [PATCH 3/8] arm64: dts: qcom: sa8775p: Add ethernet card for ride & ride-r3
Date: Wed,  7 May 2025 12:21:11 +0530
Message-ID: <20250507065116.353114-4-quic_wasimn@quicinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507065116.353114-1-quic_wasimn@quicinc.com>
References: <20250507065116.353114-1-quic_wasimn@quicinc.com>
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
X-Authority-Analysis: v=2.4 cv=U9KSDfru c=1 sm=1 tr=0 ts=681b02f1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=V7uKYF5pdr8CP6xZKmcA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: wpgWaEYxb_-9jWP0n9gkXCU7yIqz2Arw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA3MDA2MiBTYWx0ZWRfXwt3O0XqT1ALq
 z5ydeQ2tv6klvpOo6yLUs/GCENWK51rAsd91TqEasup+tyRhQTeeqrOiDaB/jstlVDbgDgH+XPU
 S11YYHWNw6Ke9vgK9xsdPl8wxHpuhOilGJ39kobyt1ba8M5n0t/DsP26tb/WmIbpn8EAx/TJ9vo
 s86USPF95GKm/KaE8T6FfKZGR0mCzf6LlmGXr3txoM5Bkwy54a8r7dLBrZeufmij4xTaLMuZz/v
 j29OZB72z3D1WZtcO+HR8IgfW3TyG5gj0fdrZ6RuOa6YXbwhl7JU4kT58BIjHfp1zuHr6Fif6bH
 dbBlW382DvO0F7RkbfXjPX46eD2lBkjGS3B0rZns+wYUCMGsAcydXY6zN4DCsx5aZFinfSS9O9Q
 yUiFfAA+SYyEUXjIlrv8zxFpVJTJ74B4iLSFGZeRQtr58aZwp+ITKjLG1n1pXBJdevawt+FI
X-Proofpoint-ORIG-GUID: wpgWaEYxb_-9jWP0n9gkXCU7yIqz2Arw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-07_02,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 mlxlogscore=999 phishscore=0 clxscore=1015
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505070062

Add separate ethernet card with 1G & 2.5G phy capabilities respectively.
  *-88ea1512.dtsi is for 2x 1G - SGMII (Marvell 88EA1512-B2) phy
  *-aqr115c.dtsi is for 2x 2.5G - HSGMII (Marvell AQR115c) phy

Signed-off-by: Wasim Nazir <quic_wasimn@quicinc.com>
---
 .../qcom/sa8775p-ride-ethernet-88ea1512.dtsi  | 205 ++++++++++++++++++
 .../qcom/sa8775p-ride-ethernet-aqr115c.dtsi   | 205 ++++++++++++++++++
 arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts  |  36 +--
 arch/arm64/boot/dts/qcom/sa8775p-ride.dts     |  36 +--
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi    | 163 --------------
 5 files changed, 414 insertions(+), 231 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-88ea1512.dtsi
 create mode 100644 arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-aqr115c.dtsi

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-88ea1512.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-88ea1512.dtsi
new file mode 100644
index 000000000000..28102b9a7dd5
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-88ea1512.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Ethernet card for sa8775p based ride boards.
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
diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-aqr115c.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-aqr115c.dtsi
new file mode 100644
index 000000000000..98c3368f3ae8
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-ethernet-aqr115c.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+/*
+ * Ethernet card for sa8775p based ride r3 boards.
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
index ae065ae92478..3e2aa34763ee 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dts
@@ -1,47 +1,15 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */

 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "sa8775p-ride-ethernet-aqr115c.dtsi"

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
index 2e87fd760dbd..4e77178cf66b 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dts
@@ -1,47 +1,15 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
  * Copyright (c) 2023, Linaro Limited
+ * Copyright (c) 2025, Qualcomm Innovation Center, Inc. All rights reserved.
  */

 /dts-v1/;

 #include "sa8775p-ride.dtsi"
+#include "sa8775p-ride-ethernet-88ea1512.dtsi"

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
index 967913169539..04f02572a96b 100644
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
@@ -361,151 +359,6 @@ vreg_l8e: ldo8 {
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
 	pinctrl-0 = <&qup_i2c11_default>;
@@ -696,22 +549,6 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
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
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
--
2.49.0


