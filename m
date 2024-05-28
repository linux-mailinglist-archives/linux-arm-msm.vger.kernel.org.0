Return-Path: <linux-arm-msm+bounces-20780-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6BA8D1E5D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 16:20:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D6E0D2863F9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:20:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C96316F905;
	Tue, 28 May 2024 14:20:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="GFRrkoTJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B189216F8F9;
	Tue, 28 May 2024 14:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716906011; cv=none; b=PkUKYs6P90GliI3/A2PKCfyqdO18RG4sg3fLVYXWW3XpeGYbvCnxF1YOO6mRyO7CUc2gBqeabUlvyz5ydltK6PepC0zC43qP3JOi1+K9pEV7eeQS1+jyneXgFxkM2sNj0johqk3gFiH1109/SN6WdEZ1eB0TYFtXAVdgcbFoKoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716906011; c=relaxed/simple;
	bh=1+rOQCPzQu4wnm8yOqRMSgFlDz1Ezy+l2FUt3lEFBhM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=JUc1DWo2ZxmT6lZczHVPulEnMkinHle1CabPZrNeQnfNxq269wpeEkaJfhWuLjMm4Bp1DDmgHLOLAJ43wGLy4E03NFJBknQg/HyOds/t218wVi6VbxY7rmSx21Ce5N5LboiPPzL2B0b+hGKGzPPvH0/Z+N+nIbRIrVuFLi+J9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=GFRrkoTJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44SABn8I004417;
	Tue, 28 May 2024 14:20:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:date:from:in-reply-to:message-id:references:subject:to; s=
	qcppdkim1; bh=vKGPqik3ovC6mzbEe2S8aeqPg5Uz19n7KBUYuqPmDec=; b=GF
	RrkoTJ4bh9Rl9vlkCwPXrPyfOafogozd1rUXWVNLA3f41kVGUgtq331NlewNxHfe
	T3y9AYL4YjIxDzMb4LY99oIWG5pVNNhMzC/uYwfQ3Hpcg5fzNHbZ6wS8zi8xRlNi
	b8DDDs83BN8QhgVvJa8fWF/AjjW3juJhDcaStuy8igrmS7wQeSo4qKROjPdWI4UL
	/JicOIFxzQbJF8JEigOJ+pPaHf/cTKTurG+vQM93MeAPUVqkvtNLjZBO4JloNIZc
	6ugb1h8/FiNEh+Dy/yCscTNztOG/VW5gzOJHCxK6Gz/muKJpWJHGWsPCD7tuUJMJ
	oHkr7FiRuhEZ7mCBXqzw==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2ppbdt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 28 May 2024 14:20:03 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 44SEK0oj012595;
	Tue, 28 May 2024 14:20:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3yb92kpxd6-1;
	Tue, 28 May 2024 14:20:00 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 44SEK0kJ012590;
	Tue, 28 May 2024 14:20:00 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vvalluru-hyd.qualcomm.com [10.213.106.176])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 44SEJxhd012587;
	Tue, 28 May 2024 14:20:00 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 482827)
	id 85FF152D383; Tue, 28 May 2024 19:49:58 +0530 (+0530)
From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
To: dmitry.baryshkov@linaro.org
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
        konrad.dybcio@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        quic_abhinavk@quicinc.com, quic_nankam@quicinc.com,
        quic_vvalluru@quicinc.com, robh@kernel.org
Subject: [PATCH v4] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Date: Tue, 28 May 2024 19:49:54 +0530
Message-Id: <20240528141954.7567-1-quic_vvalluru@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
References: <CAA8EJpo=Q4_=JU83-9ooSqiSr=xUeHh2awDhzq9q3Xd56h83zw@mail.gmail.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: y2GYyrNt7T8FJHTpc8MuI1cFFEH0RmXn
X-Proofpoint-ORIG-GUID: y2GYyrNt7T8FJHTpc8MuI1cFFEH0RmXn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-28_10,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 phishscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405280108
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>

Rb3Gen2 has a lt9611uxc DSI-to-HDMI bridge on i2c0, with
reset gpio from pm7250b gpio2 and irq gpio from tlmm gpio24.
Bridge supplies are Vdd connected to input supply directly
and vcc to L11c. Enable HDMI output, bridge and corresponding
DSI output.

Signed-off-by: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
---
v4: added fixed regulator for vdd

v3: - Updated commit text
    - Arranged nodes in alphabetical order
    - Fixed signoff
    - Fixed drive strength for lt9611_irq_pin
    - Removed 'label' from hdmi-connector, which is optional

v2: Addressed dtschema errors
	- Fixed lt9611-irq
	- vdd-supply error to be ignored, as it is connected to
	  input supply directly, on rb3gen2
---
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 94 ++++++++++++++++++++
 1 file changed, 94 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a085ff5b5fb2..7f00fca131a2 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -52,6 +52,25 @@
 		};
 	};
 
+	hdmi-connector {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+
+	lt9611_1v2: lt9611-vdd12-regulator {
+		compatible = "regulator-fixed";
+		regulator-name = "LT9611_1V2";
+
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+	};
+
 	reserved-memory {
 		xbl_mem: xbl@80700000 {
 			reg = <0x0 0x80700000 0x0 0x100000>;
@@ -530,6 +549,46 @@
 			   <GCC_WPSS_RSCP_CLK>;
 };
 
+&i2c0 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	lt9611_codec: hdmi-bridge@2b {
+		compatible = "lontium,lt9611uxc";
+		reg = <0x2b>;
+
+		interrupts-extended = <&tlmm 24 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&pm7250b_gpios 2 GPIO_ACTIVE_HIGH>;
+
+		vdd-supply = <&lt9611_1v2>;
+		vcc-supply = <&vreg_l11c_2p8>;
+
+		pinctrl-names = "default";
+		pinctrl-0 = <&lt9611_irq_pin &lt9611_rst_pin>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mdss_dsi0_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+};
+
 &i2c1 {
 	status = "okay";
 
@@ -587,6 +646,21 @@
 	remote-endpoint = <&usb_dp_qmpphy_dp_in>;
 };
 
+&mdss_dsi {
+	vdda-supply = <&vreg_l6b_1p2>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&lt9611_a>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi_phy {
+	vdds-supply = <&vreg_l10c_0p88>;
+	status = "okay";
+};
+
 &mdss_edp {
 	status = "okay";
 };
@@ -711,3 +785,23 @@
 	function = "gpio";
 	bias-disable;
 };
+
+&pm7250b_gpios {
+	lt9611_rst_pin: lt9611-rst-state {
+		pins = "gpio2";
+		function = "normal";
+
+		output-high;
+		input-disable;
+		power-source = <0>;
+	};
+};
+
+&tlmm {
+	lt9611_irq_pin: lt9611-irq-state {
+		pins = "gpio24";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+};
-- 
2.17.1


