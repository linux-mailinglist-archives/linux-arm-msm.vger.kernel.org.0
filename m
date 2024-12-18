Return-Path: <linux-arm-msm+bounces-42675-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5983E9F65A4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 13:14:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 15EB918959E2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:14:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0076C1ACEAE;
	Wed, 18 Dec 2024 12:14:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="h3ZZwMAS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457681A4F12;
	Wed, 18 Dec 2024 12:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734524053; cv=none; b=NHmdRDhyR68U18JZwWdxFBuuH0Dvj2zdz8ENEvaorfm2hJjhy01qieoE99/5A8w6o+opnmtXfqK6F6B/SvfwJ+d8stInqvvZJ8nA0yglR72v5h+4TvcPzj/Atu9RtRhXpCs2Jl+J84EVAFhQW54kjxCWFS/5u7FRUm7jKbRElM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734524053; c=relaxed/simple;
	bh=P/0fZ9zu49u7JnH42Bn0P2hSIJbGqbvwVDfRM6DQp/c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=O0gBp7eBou1ZDpdQlcx8q1N+QlvPr98fKXKloWwzUSk7fKW4pl4fspDBlAiNSIiunnrLcXCTOHUvRnMmxR2q4e62Cgbkr++Ak55+9Sgf/oFotC6vwzUbE0aiVbfdopEd4ogdd5xDeFiaxxN07bd4RDkA+VoS319KkfzhnMWwQp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=h3ZZwMAS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BI6VYWg024607;
	Wed, 18 Dec 2024 12:14:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bEprDjyzuym3GMKlYLFhUUPtBEAOz35QObzQYAOL0yk=; b=h3ZZwMASMUg0tVpX
	zHC/EtvoZGL5QEKL4KP03vq29CvdM2kZJitiBFPkTrZG8C3yxOKaJqFVMkCb5nJW
	djDg/f3VVnXiSno0CWBSl6biOcSP3Nui5P/vxc8Q2GZOSINGpKTV8BchOST5VPI1
	rWCbR8sv4zWA8lUfM9hakX6ZYwURAC6C5QAvp1B7xeoC7KvNTeIibaGLN1SIXxPe
	Iiqv1b9rd1P0xPL9qaxIPg374shQN1uYc06cp+yNlsvoE4tRrOL15SC1s989vBr7
	W07+HKcBZwfPvJkjbQw+GKGqY9G0kvCiI0x0YwrYLG2u7xRVV8rAt6760/iV/ky+
	4A8fMA==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ks6ygube-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:14:09 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BICE9LE021089
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Dec 2024 12:14:09 GMT
Received: from songxue-gv.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 18 Dec 2024 04:14:03 -0800
From: Song Xue <quic_songxue@quicinc.com>
Date: Wed, 18 Dec 2024 20:12:57 +0800
Subject: [PATCH v3 2/2] arm64: dts: qcom: qcs615-ride: Enable secondary USB
 controller on QCS615 Ride
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241218-add_usb_host_mode_for_qcs615-v3-2-d9d29fe39a4b@quicinc.com>
References: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
In-Reply-To: <20241218-add_usb_host_mode_for_qcs615-v3-0-d9d29fe39a4b@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        Krishna Kurapati
	<krishna.kurapati@oss.qualcomm.com>,
        Song Xue <quic_songxue@quicinc.com>
X-Mailer: b4 0.15-dev-88a27
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734524036; l=2234;
 i=quic_songxue@quicinc.com; s=20240911; h=from:subject:message-id;
 bh=jamDY4APYyBLUyA42FN/U6o4cdT9e86Tt6RNWvLVV9s=;
 b=tHsEHtHI5zrjWPpAEE9MsXL94eS2adRamlnB09vGNnKGQjTqHcekHP2Tyvi3rqh20OPGLPHyt
 UaCVWscPoCKBfmspIVb9SspkIZi0Qa5OXEQDazns3UR8pfU7SzQ/cFU
X-Developer-Key: i=quic_songxue@quicinc.com; a=ed25519;
 pk=Z6tjs+BBbyg1kYqhBq0EfW2Pl/yZdOPXutG9TOVA1yc=
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: J3FcNTorTILRUDqwFr5X3sB6BC4UfHla
X-Proofpoint-GUID: J3FcNTorTILRUDqwFr5X3sB6BC4UfHla
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=961 mlxscore=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 phishscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412180098

From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

Enable secondary USB controller on QCS615 Ride platform. The secondary
USB controller is made "host", as it is a Type-A port.

Secondary USB controller of QCS615 Ride has Type-A port exposed for
connecting peripheral. The VBUS to the peripheral is provided by
TPS2549IRTERQ1 regulator connected to the port. The regulator has an
enable pin controlled by PM8150. Model it as fixed regulator and keep it
Always-On at boot, since the regulator is GPIO controlled regulator.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Co-developed-by: Song Xue <quic_songxue@quicinc.com>
Signed-off-by: Song Xue <quic_songxue@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 36 ++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index f41319ff47b983d771da52775fa78b4385c4e532..66f988104697367e87c1a9e688b3e1ff4c10a644 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -4,6 +4,7 @@
  */
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
 #include "qcs615.dtsi"
 #include "pm8150.dtsi"
@@ -33,6 +34,16 @@ xo_board_clk: xo-board-clk {
 			#clock-cells = <0>;
 		};
 	};
+
+	regulator-usb2-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "USB2_VBUS";
+		gpio = <&pm8150_gpios 10 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&usb2_en>;
+		pinctrl-names = "default";
+		enable-active-high;
+		regulator-always-on;
+	};
 };
 
 &apps_rsc {
@@ -203,6 +214,15 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&pm8150_gpios {
+	usb2_en: usb2-en-state {
+		pins = "gpio10";
+		function = "normal";
+		output-enable;
+		power-source = <0>;
+	};
+};
+
 &pon_pwrkey {
 	status = "okay";
 };
@@ -248,6 +268,22 @@ &usb_1_dwc3 {
 	dr_mode = "peripheral";
 };
 
+&usb_hsphy_2 {
+	vdd-supply = <&vreg_l5a>;
+	vdda-pll-supply = <&vreg_l12a>;
+	vdda-phy-dpdm-supply = <&vreg_l13a>;
+
+	status = "okay";
+};
+
+&usb_2 {
+	status = "okay";
+};
+
+&usb_2_dwc3 {
+	dr_mode = "host";
+};
+
 &watchdog {
 	clocks = <&sleep_clk>;
 };

-- 
2.25.1


