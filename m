Return-Path: <linux-arm-msm+bounces-37744-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7279C69E8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 08:26:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DD369284B97
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 07:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D340F18991A;
	Wed, 13 Nov 2024 07:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="ZKfuNwJ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0B3E189916;
	Wed, 13 Nov 2024 07:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731482686; cv=none; b=Z2Yg8hPkw7PlqukErwDoeWx7jXthGfzwgVNXFaAoPrh9adAtoapYSG4vgGjERpCbFGofgXuyPKUDFdUWyFz729NutSixLE9LExD5pkhb6/emtmvFS7FsRyVGKIJhecBHuc938Kcz6iqr/sZN7C3OarJlMjuGD3Q+nJnPmjrDhjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731482686; c=relaxed/simple;
	bh=2K/0iVdAzteMa18znwWL0iuSTFy9Pm5ZvASmA4F7+08=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=L13jrWe0xYEVswANUwO6hM79Hndbp6mS/cgzvUev0HXr0uV2toMek+X3xbJkhd0x6ChGh+frBJy3GXUzz6hJV29nLop+hkawRdvk1IJFEMd+3J7udpsSZVJdb1maBTUUHN90Mo4UdXQcvouUJ8/u4kOBDo1ufsmperVVimD+cwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=ZKfuNwJ+; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACNSu4V026721;
	Wed, 13 Nov 2024 07:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a5UHNVoWXaPCMcdfJjFCxoF2nnSHgsxacYHtIHFeee4=; b=ZKfuNwJ+b7WdvQSE
	7XVSz6hCjMMpMxbn+VbpUKlptO7Vw2yYH0iwVz1fFNb0bosknwW3+Y/rglXFuzR9
	RvvKLZx3r7+lSL1dGh3DYE6SzsHB84v+FdKtiGfg7iHOXlWQ93PwY/NTCOclWeD4
	7DQyiwr53Y1VVbMtgZe0mX3WhyNsBjMHf2bVg3gUiJA3PKMlhK5vzBGzUHILyZdJ
	5hz2G+iGiDrQbiUMoFrejTwsvvCJXKkO2OnzLG8I5KDkE3JlQh46U4jD/l6Qsppe
	vAiw3B63p0LTdBAFjINhoWZvO/6nV50wa0j0+PKjbmjTVWYDuyiyQSbEnrYFkxCC
	2yvCrQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vgqqs01b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:24:37 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AD7Oa7n017193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 07:24:36 GMT
Received: from hu-varada-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 23:24:30 -0800
From: Varadarajan Narayanan <quic_varada@quicinc.com>
To: <vkoul@kernel.org>, <kishon@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <gregkh@linuxfoundation.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <dmitry.baryshkov@linaro.org>,
        <mantas@8devices.com>, <quic_rohiagar@quicinc.com>,
        <quic_kriskura@quicinc.com>, <manivannan.sadhasivam@linaro.org>,
        <abel.vesa@linaro.org>, <quic_kbajaj@quicinc.com>,
        <quic_varada@quicinc.com>, <quic_wcheng@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>
Subject: [PATCH v2 6/6] arm64: dts: qcom: Add USB controller and phy nodes for IPQ5424
Date: Wed, 13 Nov 2024 12:53:16 +0530
Message-ID: <20241113072316.2829050-7-quic_varada@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113072316.2829050-1-quic_varada@quicinc.com>
References: <20241113072316.2829050-1-quic_varada@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: MwrDIQhS9g4SIvdEx2SZoA0pJGxhYwBZ
X-Proofpoint-GUID: MwrDIQhS9g4SIvdEx2SZoA0pJGxhYwBZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 clxscore=1015
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130064

The IPQ5424 SoC has both USB2.0 and USB3.0 controllers. The USB3.0
can connect to either of USB2.0 or USB3.0 phy and operate in the
respective mode.

Signed-off-by: Varadarajan Narayanan <quic_varada@quicinc.com>
---
v2: Add dm/dp_hs_phy_irq to usb3@8a00000 node
    Add u1/u2-entry quirks to usb@8a00000 node
---
 arch/arm64/boot/dts/qcom/ipq5424-rdp466.dts |  67 +++++++++
 arch/arm64/boot/dts/qcom/ipq5424.dtsi       | 159 ++++++++++++++++++++
 2 files changed, 226 insertions(+)

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
index 5e219f900412..f8afd6f0412d 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -233,6 +233,165 @@ intc: interrupt-controller@f200000 {
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
+					      <&intc GIC_SPI 414 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 423 IRQ_TYPE_LEVEL_HIGH>,
+					      <&intc GIC_SPI 424 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "pwr_event",
+					  "qusb2_phy",
+					  "dm_hs_phy_irq",
+					  "dp_hs_phy_irq";
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
+				snps,dis-u1-entry-quirk;
+				snps,dis-u2-entry-quirk;
+			};
+		};
+
 		timer@f420000 {
 			compatible = "arm,armv7-timer-mem";
 			reg = <0 0xf420000 0 0x1000>;
-- 
2.34.1


