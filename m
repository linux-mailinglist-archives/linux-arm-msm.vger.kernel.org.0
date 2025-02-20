Return-Path: <linux-arm-msm+bounces-48672-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 673B9A3D8BD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 12:33:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 6521E3BE0A1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 11:30:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B3041F3D59;
	Thu, 20 Feb 2025 11:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="cGJkDuqJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668D21F2B83;
	Thu, 20 Feb 2025 11:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740051018; cv=none; b=CtHoUhqBmKf4pvqhQOenZ4V9BecKZyQGUQVs5bN2wqMg7Jwfm9ROHLDIdbZA01zXvgQCmqc/pREU7OtXTjEoAHyYfpUiGmtmeYzWBWai4O/W8XDlROqEVbWI0j8vh9biBz0/WSwRhNPAOntQJS4BHkLlzzm6soGl9ZnfMY5eaH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740051018; c=relaxed/simple;
	bh=uMiUNFC5LiPLdVCuuAvDS7c6E5BDQL/GKvikJWKSI/A=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HAKTPMck9WZO6pUJStpZxatnx9uXSkG/zSJVFsZ6QXrYts+j4aTr29fYpFtKVN434VsJUbxp4ArpZfsFBDDPdfs6i43Ris3ylJu/w64I8RSvc3H6vMsrG0n3f0Vkh4/IVrfwC8iTSmF9dfuOEAoe5c2CA8iXL+SkDOLE00d7LF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=cGJkDuqJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51K7KAex032122;
	Thu, 20 Feb 2025 11:30:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TRHU6OdR6dfiv+Z2ca7NsUbEQpRdZwEpb5iYfFEAfQw=; b=cGJkDuqJMGKzXXsx
	/uttp0lAN0TjcdS41l4IHZQFloSReTKxn9gD9PjI1fvNlq6Ffibg5TN+WDmx+UHu
	mJ67sSKL/EA9Dzuv8lRTDUec8wR9VV8et4xca+quWAUNkF3uYdifuTKsERZkR5oy
	S0MaH3H9gTaFFwREdSCH58faAFaROOIVV4yAqYHjvWd8hnzZqT4VZr8PxTbDGPwX
	Mt3MnZf05lGWf7vIp8SxOjeWl+sFMkPUpojcwst0XMC9dXojVUEFIPlgKJ3YPBD5
	Zj8aLat/NT6NEnpuWUgvwodRJP9i8fEeg85aHCg+CFZbycDTPBu0C8A6HmDlY4+q
	OR6aFA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy3p1pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 11:30:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51KBU9pQ032045
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Feb 2025 11:30:09 GMT
Received: from hu-janathot-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 03:30:04 -0800
From: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Marcel Holtmann
	<marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>
CC: <quic_mohamull@quicinc.com>, <quic_hbandi@quicinc.com>,
        <quic_anubhavg@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-bluetooth@vger.kernel.org>
Subject: [RESEND PATCH v9 1/2] arm64: dts: qcom: qcs6490-rb3gen: add and enable BT node
Date: Thu, 20 Feb 2025 16:59:44 +0530
Message-ID: <20250220112945.3106086-2-quic_janathot@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250220112945.3106086-1-quic_janathot@quicinc.com>
References: <20250220112945.3106086-1-quic_janathot@quicinc.com>
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
X-Proofpoint-GUID: Kw0YbTKnXG_CKH-CK7-4yT3QGM2ZVNgX
X-Proofpoint-ORIG-GUID: Kw0YbTKnXG_CKH-CK7-4yT3QGM2ZVNgX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_04,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 malwarescore=0 phishscore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502200086

Add the PMU node for WCN6750 present on the qcs6490-rb3gen
board and assign its power outputs to the Bluetooth module.

In WCN6750 module sw_ctrl and wifi-enable pins are handled
in the wifi controller firmware. Therefore, it is not required
to have those pins' entries in the PMU node.

Signed-off-by: Janaki Ramaiah Thota <quic_janathot@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 167 ++++++++++++++++++-
 1 file changed, 166 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index 7a36c90ad4ec..0a3243499dfb 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: BSD-3-Clause
 /*
- * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
 /dts-v1/;
@@ -34,6 +34,7 @@ / {
 
 	aliases {
 		serial0 = &uart5;
+		serial1 = &uart7;
 	};
 
 	chosen {
@@ -218,6 +219,63 @@ vph_pwr: vph-pwr-regulator {
 		regulator-min-microvolt = <3700000>;
 		regulator-max-microvolt = <3700000>;
 	};
+
+	wcn6750-pmu {
+		compatible = "qcom,wcn6750-pmu";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_en>;
+		vddaon-supply = <&vreg_s7b_0p972>;
+		vddasd-supply = <&vreg_l11c_2p8>;
+		vddpmu-supply = <&vreg_s7b_0p972>;
+		vddrfa0p8-supply = <&vreg_s7b_0p972>;
+		vddrfa1p2-supply = <&vreg_s8b_1p272>;
+		vddrfa1p7-supply = <&vreg_s1b_1p872>;
+		vddrfa2p2-supply = <&vreg_s1c_2p19>;
+
+		bt-enable-gpios = <&tlmm 85 GPIO_ACTIVE_HIGH>;
+
+		regulators {
+			vreg_pmu_rfa_cmn: ldo0 {
+				regulator-name = "vreg_pmu_rfa_cmn";
+			};
+
+			vreg_pmu_aon_0p59: ldo1 {
+				regulator-name = "vreg_pmu_aon_0p59";
+			};
+
+			vreg_pmu_wlcx_0p8: ldo2 {
+				regulator-name = "vreg_pmu_wlcx_0p8";
+			};
+
+			vreg_pmu_wlmx_0p85: ldo3 {
+				regulator-name = "vreg_pmu_wlmx_0p85";
+			};
+
+			vreg_pmu_btcmx_0p85: ldo4 {
+				regulator-name = "vreg_pmu_btcmx_0p85";
+			};
+
+			vreg_pmu_rfa_0p8: ldo5 {
+				regulator-name = "vreg_pmu_rfa_0p8";
+			};
+
+			vreg_pmu_rfa_1p2: ldo6 {
+				regulator-name = "vreg_pmu_rfa_1p2";
+			};
+
+			vreg_pmu_rfa_1p7: ldo7 {
+				regulator-name = "vreg_pmu_rfa_1p7";
+			};
+
+			vreg_pmu_pcie_0p9: ldo8 {
+				regulator-name = "vreg_pmu_pcie_0p9";
+			};
+
+			vreg_pmu_pcie_1p8: ldo9 {
+				regulator-name = "vreg_pmu_pcie_1p8";
+			};
+		};
+	};
 };
 
 &apps_rsc {
@@ -799,6 +857,39 @@ &pon_resin {
 	status = "okay";
 };
 
+&qup_uart7_cts {
+	/*
+	 * Configure a bias-bus-hold on CTS to lower power
+	 * usage when Bluetooth is turned off. Bus hold will
+	 * maintain a low power state regardless of whether
+	 * the Bluetooth module drives the pin in either
+	 * direction or leaves the pin fully unpowered.
+	 */
+	bias-bus-hold;
+};
+
+&qup_uart7_rts {
+	/* We'll drive RTS, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
+&qup_uart7_rx {
+	/*
+	 * Configure a pull-up on RX. This is needed to avoid
+	 * garbage data when the TX pin of the Bluetooth module is
+	 * in tri-state (module powered off or not driving the
+	 * signal yet).
+	 */
+	bias-pull-up;
+};
+
+&qup_uart7_tx {
+	/* We'll drive TX, so no pull */
+	drive-strength = <2>;
+	bias-disable;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
@@ -842,12 +933,86 @@ &sdhc_2 {
 &tlmm {
 	gpio-reserved-ranges = <32 2>, /* ADSP */
 			       <48 4>; /* NFC */
+
+	bt_en: bt-en-state {
+		pins = "gpio85";
+		function = "gpio";
+		output-low;
+		bias-disable;
+	};
+
+	qup_uart7_sleep_cts: qup-uart7-sleep-cts-state {
+		pins = "gpio28";
+		function = "gpio";
+		/*
+		 * Configure a bias-bus-hold on CTS to lower power
+		 * usage when Bluetooth is turned off. Bus hold will
+		 * maintain a low power state regardless of whether
+		 * the Bluetooth module drives the pin in either
+		 * direction or leaves the pin fully unpowered.
+		 */
+		bias-bus-hold;
+	};
+
+	qup_uart7_sleep_rts: qup-uart7-sleep-rts-state {
+		pins = "gpio29";
+		function = "gpio";
+		/*
+		 * Configure pull-down on RTS. As RTS is active low
+		 * signal, pull it low to indicate the BT SoC that it
+		 * can wakeup the system anytime from suspend state by
+		 * pulling RX low (by sending wakeup bytes).
+		 */
+		bias-pull-down;
+	};
+
+	qup_uart7_sleep_rx: qup-uart7-sleep-rx-state {
+		pins = "gpio31";
+		function = "gpio";
+		/*
+		 * Configure a pull-up on RX. This is needed to avoid
+		 * garbage data when the TX pin of the Bluetooth module
+		 * is floating which may cause spurious wakeups.
+		 */
+		bias-pull-up;
+	};
+
+	qup_uart7_sleep_tx: qup-uart7-sleep-tx-state {
+		pins = "gpio30";
+		function = "gpio";
+		/*
+		 * Configure pull-up on TX when it isn't actively driven
+		 * to prevent BT SoC from receiving garbage during sleep.
+		 */
+		bias-pull-up;
+	};
 };
 
 &uart5 {
 	status = "okay";
 };
 
+&uart7 {
+	/delete-property/interrupts;
+	interrupts-extended = <&intc GIC_SPI 608 IRQ_TYPE_LEVEL_HIGH>,
+				<&tlmm 31 IRQ_TYPE_EDGE_FALLING>;
+	pinctrl-1 =  <&qup_uart7_sleep_cts>, <&qup_uart7_sleep_rts>,
+		<&qup_uart7_sleep_tx>, <&qup_uart7_sleep_rx>;
+	pinctrl-names = "default", "sleep";
+	status = "okay";
+
+	bluetooth: bluetooth {
+		compatible = "qcom,wcn6750-bt";
+		vddrfacmn-supply = <&vreg_pmu_rfa_cmn>;
+		vddaon-supply = <&vreg_pmu_aon_0p59>;
+		vddbtcmx-supply = <&vreg_pmu_btcmx_0p85>;
+		vddrfa0p8-supply = <&vreg_pmu_rfa_0p8>;
+		vddrfa1p7-supply = <&vreg_pmu_rfa_1p7>;
+		vddrfa1p2-supply = <&vreg_pmu_rfa_1p2>;
+		max-speed = <3200000>;
+	};
+};
+
 &usb_1 {
 	status = "okay";
 };
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project


