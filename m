Return-Path: <linux-arm-msm+bounces-37573-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E7719C51B1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 10:17:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A6A231F21A7A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2024 09:17:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9FC9620DD78;
	Tue, 12 Nov 2024 09:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="B6F57GzH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0866D2123FE;
	Tue, 12 Nov 2024 09:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731402900; cv=none; b=qiA5GUBXH9r46ckPAb93gTdFeuAOKEvnJNTD9S+Igd9NO1dOgBNBKs8W+sVGGcmo7uWU2vKcJB/cr7XvcrtpPKCODmtlmeZD0qwWZU/CquYoI53A0JpS2WWdG+V78R9EhVsY7RBpnNNsqOqCxUU8SFp5caU/6V0rNpWwLQKBOPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731402900; c=relaxed/simple;
	bh=5Tbb1R/bU2JeJKDhCCLhuSe9H0eEgugVL2FrqSbkDAk=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LblSExWsbX6+KPiN1YxjK5B6/9a83f2JS+pSSt/7vfloCPC2MGQNIwCjDPl7jcHuAeTnULK0a4akefLJTnznXx0fhBhMedGt7xAe7yv155t2YiwTT/DXaw3WB+18bDNiCqrvXIjxFdzPFYytAm1tzH4g0XTMJbRYjMZrfFCzVtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=B6F57GzH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AC218Nk027992;
	Tue, 12 Nov 2024 09:14:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vqGePVFqvQTgRhclS4mVQNfTpgdTgf7WvESo5J3OVrg=; b=B6F57GzHyv6y1lid
	TlkJz0KrY1yASQI8yqTJ8KqLbfowyIWl7RfbDOwD0aB4jvsQa11pjKG6KLQXA206
	Gu44aA/NqD/GYRCvRqNdWt/2h0U3fV2/UdAXeTHZjLD63jZ1qxMrR/lYfWVC8nUN
	qeEruq5p1er73VY8PWO122b199cELj6c+yeuiYJ9vMcOSqAQUVbtXIG0v2Z88hEB
	UHqr9mSbKLyKrC34OVZtT3rHAdGoRBC9h9Ts23qOn8GU6g/mX6Ht8LEsN/h7hC5w
	1ha+YE9rJwh8mIqFSX0UfhgzRZQtcFiIZtH/qFGTjA+v+BjRHLmolBuGt7wKgHi/
	oCOQxA==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42sxpqeuac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:14:52 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC9EqQU022340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 09:14:52 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 01:14:45 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_rohiagar@quicinc.com>,
        <johan+linaro@kernel.org>, <quic_kriskura@quicinc.com>,
        <abel.vesa@linaro.org>, <quic_kbajaj@quicinc.com>,
        <quic_wcheng@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <linux-phy@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-usb@vger.kernel.org>
CC: Varadarajan Narayanan <quic_varada@quicinc.com>
Subject: [PATCH v1 6/6] arm64: dts: qcom: Add USB controller and phy nodes for IPQ5424
Date: Tue, 12 Nov 2024 14:43:55 +0530
Message-ID: <20241112091355.2028018-7-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112091355.2028018-1-quic_varada@quicinc.com>
References: <20241112091355.2028018-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0Cs7gt2dWLP47eNtI6szkmZ_QYa5uKpj
X-Proofpoint-ORIG-GUID: 0Cs7gt2dWLP47eNtI6szkmZ_QYa5uKpj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 phishscore=0
 suspectscore=0 impostorscore=0 mlxscore=0 priorityscore=1501 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2409260000
 definitions=main-2411120075

The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  67 +++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 153 ++++++++++++++++++++
 2 files changed, 220 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
index d4d31026a026..3d50a419139d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
+++ b/arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts
@@ -16,12 +16,71 @@ / {
 	aliases {
 		serial0 = &uart1;
 	};
+
+	regulator_fixed_3p3: s3300 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "fixed_3p3";
+	};
+
+	regulator_fixed_1p8: s1800 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "fixed_1p8";
+	};
+
+	regulator_fixed_0p925: s0925 {
+		compatible = "regulator-fixed";
+		regulator-min-microvolt = <925000>;
+		regulator-max-microvolt = <925000>;
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-name = "fixed_0p925";
+	};
+
+};
+
+&dwc_0 {
+	dr_mode = "host";
+};
+
+&dwc_1 {
+	dr_mode = "host";
+};
+
+&qusb_phy_0 {
+	vdd-supply = <&regulator_fixed_0p925>;
+	vdda-pll-supply = <&regulator_fixed_1p8>;
+	vdda-phy-dpdm-supply = <&regulator_fixed_3p3>;
+
+	status = "okay";
+};
+
+&qusb_phy_1 {
+	vdd-supply = <&regulator_fixed_0p925>;
+	vdda-pll-supply = <&regulator_fixed_1p8>;
+	vdda-phy-dpdm-supply = <&regulator_fixed_3p3>;
+
+	status = "okay";
 };
 
 &sleep_clk {
 	clock-frequency = <32000>;
 };
 
+&ssphy_0 {
+	vdda-pll-supply = <&regulator_fixed_1p8>;
+	vdda-phy-supply = <&regulator_fixed_0p925>;
+
+	status = "okay";
+};
+
 &tlmm {
 	sdc_default_state: sdc-default-state {
 		clk-pins {
@@ -53,6 +112,14 @@ &uart1 {
 	status = "okay";
 };
 
+&usb2 {
+	status = "okay";
+};
+
+&usb3 {
+	status = "okay";
+};
+
 &xo_board {
 	clock-frequency = <24000000>;
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 5e219f900412..d8c045a311c2 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -233,6 +233,159 @@ intc: interrupt-controller@f200000 {
 			msi-controller;
 		};
 
+		qusb_phy_1: phy@71000 {
+			compatible = "qcom,ipq5424-qusb2-phy";
+			reg = <0 0x00071000 0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_1_PHY_BCR>;
+			status = "disabled";
+		};
+
+		usb2: usb2@1e00000 {
+			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
+			reg = <0 0x01ef8800 0 0x400>;
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB1_MASTER_CLK>,
+				 <&gcc GCC_USB1_SLEEP_CLK>,
+				 <&gcc GCC_USB1_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB1_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_CNOC_USB_CLK>;
+
+			clock-names = "core",
+				      "sleep",
+				      "mock_utmi",
+				      "iface",
+				      "cfg_noc";
+
+			assigned-clocks = <&gcc GCC_USB1_MASTER_CLK>,
+					  <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
+
+			resets = <&gcc GCC_USB1_BCR>;
+			qcom,select-utmi-as-pipe-clk;
+			status = "disabled";
+
+			dwc_1: usb@1e00000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x01e00000 0 0xe000>;
+				clocks = <&gcc GCC_USB1_MOCK_UTMI_CLK>;
+				clock-names = "ref";
+				interrupts = <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_1>;
+				phy-names = "usb2-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
+		qusb_phy_0: phy@7b000 {
+			compatible = "qcom,ipq5424-qusb2-phy";
+			reg = <0 0x0007b000 0 0x180>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				<&xo_board>;
+			clock-names = "cfg_ahb", "ref";
+
+			resets = <&gcc GCC_QUSB2_0_PHY_BCR>;
+			status = "disabled";
+		};
+
+		ssphy_0: phy@7d000 {
+			compatible = "qcom,ipq5424-qmp-usb3-phy";
+			reg = <0 0x0007d000 0 0xa00>;
+			#phy-cells = <0>;
+
+			clocks = <&gcc GCC_USB0_AUX_CLK>,
+				 <&xo_board>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_USB0_PIPE_CLK>;
+			clock-names = "aux",
+				      "ref",
+				      "cfg_ahb",
+				      "pipe";
+
+			resets = <&gcc GCC_USB0_PHY_BCR>,
+				 <&gcc GCC_USB3PHY_0_PHY_BCR>;
+			reset-names = "phy",
+				      "phy_phy";
+
+			#clock-cells = <0>;
+			clock-output-names = "usb0_pipe_clk";
+
+			status = "disabled";
+		};
+
+		usb3: usb3@8a00000 {
+			compatible = "qcom,ipq5424-dwc3", "qcom,dwc3";
+			reg = <0 0x08af8800 0 0x400>;
+
+			#address-cells = <2>;
+			#size-cells = <2>;
+			ranges;
+
+			clocks = <&gcc GCC_USB0_MASTER_CLK>,
+				 <&gcc GCC_USB0_SLEEP_CLK>,
+				 <&gcc GCC_USB0_MOCK_UTMI_CLK>,
+				 <&gcc GCC_USB0_PHY_CFG_AHB_CLK>,
+				 <&gcc GCC_CNOC_USB_CLK>;
+
+			clock-names = "core",
+				      "sleep",
+				      "mock_utmi",
+				      "iface",
+				      "cfg_noc";
+
+			assigned-clocks = <&gcc GCC_USB0_MASTER_CLK>,
+					  <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+			assigned-clock-rates = <200000000>,
+					       <24000000>;
+
+			interrupts-extended = <&intc GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy";
+
+			resets = <&gcc GCC_USB_BCR>;
+			status = "disabled";
+
+			dwc_0: usb@8a00000 {
+				compatible = "snps,dwc3";
+				reg = <0 0x08a00000 0 0xcd00>;
+				clocks = <&gcc GCC_USB0_MOCK_UTMI_CLK>;
+				clock-names = "ref";
+				interrupts = <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
+				phys = <&qusb_phy_0>, <&ssphy_0>;
+				phy-names = "usb2-phy", "usb3-phy";
+				tx-fifo-resize;
+				snps,is-utmi-l1-suspend;
+				snps,hird-threshold = /bits/ 8 <0x0>;
+				snps,dis_u2_susphy_quirk;
+				snps,dis_u3_susphy_quirk;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
-- 
2.34.1


