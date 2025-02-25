Return-Path: <linux-arm-msm+bounces-49294-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E505A43F2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 13:19:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 51C2F3B043E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Feb 2025 12:18:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8C921268685;
	Tue, 25 Feb 2025 12:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="MbE9xlnY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8276620C012;
	Tue, 25 Feb 2025 12:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740485934; cv=none; b=Jn4qfvMAXJPUyAjMbSGDKiNtrVvTLWzbhZM+Ec8GcZ/yWGE4O2lWzU66hkfvEJai4yJqiIJQnirIt3N/o25Z2Sps3tnamp7IcbFC8Q3qoVCE9LUXMEUyaQ2MwSYE+nExePVeBIWeNPqzTmMW14uMzDgWBlTba9DMJVaSXmjJZZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740485934; c=relaxed/simple;
	bh=uDTt8aNAwQ4bGIoIkCAnkK7a6bZaN6y9u1/snMhd7BI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Q1HzcqqHOslreeZay3V6xOdJX9gAUL9vI3gnB8uDsQEMnooVirp+rini+LJF1CqKD7TKzJ89LKLyIz/OicvMsy5i/S404Y4wiSJYnKGdzqsl6DuFGLkMqapg2tooEXxno8vTPTAmThYuWHOIv8dllCUwot6oqwyVFsv9XQwFInI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=MbE9xlnY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51P8Fbrp030174;
	Tue, 25 Feb 2025 12:18:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Eh+JTm9jQ8D
	Sd3ImsdnoomCRpMDnUsaYSUlaPU1wMhw=; b=MbE9xlnYxtxIWGgJ4fZfGIaXsTN
	dAThnrPSJ0Ai4m7wCt9BmP1CMXG2I8taMM7J4O/0aIrpnZHtYSxwaVc7yDdIRX8j
	MSsduovD0urQuIsouc4/jNAaSbaQ0nsrq2F45xqW0L6m+pQO9gwB9YXmCb2ZFUgH
	LCDMM0FS+aQ9CytHudEj2i31kX+ppKP3CjDfLnoSir20oz8HTd74DX26Zub2cQBZ
	oeYR3DmLUw4Nzi3Yon31Xx1YvEH+NorRJ+dMsB76+TW5o3vWj7/XGwh44Rf1s/Jf
	oefEFxKwSOJ2LdK3N9VEVDK+9XOV3QC+ZVFnsyZGenaj2z9BOAgQ4zXzixA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y49egya0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:37 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 51PCIYYg004545;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 44y7nkx1yc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 51PCIYAQ004513;
	Tue, 25 Feb 2025 12:18:34 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 51PCIYbf004501
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Feb 2025 12:18:34 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id A315A58B; Tue, 25 Feb 2025 17:48:32 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_abhinavk@quicinc.com,
        quic_rajeevny@quicinc.com, quic_vproddut@quicinc.com,
        quic_jesszhan@quicinc.com
Subject: [PATCH 07/11] arm64: dts: qcom: sa8775p-ride: add anx7625 DSI to DP bridge nodes
Date: Tue, 25 Feb 2025 17:48:20 +0530
Message-Id: <20250225121824.3869719-8-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
References: <20250225121824.3869719-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-ORIG-GUID: _SL81gX0XeJnKqcA5a3whcdoQQugG1TX
X-Proofpoint-GUID: _SL81gX0XeJnKqcA5a3whcdoQQugG1TX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-25_04,2025-02-25_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0 mlxscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2502250086

Add anx7625 DSI to DP bridge device nodes.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi | 136 ++++++++++++++++++++-
 1 file changed, 135 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
index 175f8b1e3b2d..151f66512303 100644
--- a/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
+++ b/arch/arm64/boot/dts/qcom/sa8775p-ride.dtsi
@@ -517,9 +517,128 @@ &i2c11 {
 
 &i2c18 {
 	clock-frequency = <400000>;
-	pinctrl-0 = <&qup_i2c18_default>;
+	pinctrl-0 = <&qup_i2c18_default>,
+			<&io_expander_intr_active>,
+			<&io_expander_reset_active>;
 	pinctrl-names = "default";
+
 	status = "okay";
+
+	io_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <98 IRQ_TYPE_EDGE_BOTH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+
+		pinctrl-0 = <&dsi0_int_pin>,
+				<&dsi0_cbl_det_pin>,
+				<&dsi1_int_pin>,
+				<&dsi1_cbl_det_pin>;
+		pinctrl-names = "default";
+
+		dsi0_int_pin: gpio2_cfg {
+			pins = "gpio2";
+			input-enable;
+			bias-disable;
+		};
+
+		dsi0_cbl_det_pin: gpio3_cfg {
+			pins = "gpio3";
+			bias-pull-down;
+		};
+
+		dsi1_int_pin: gpio10_cfg {
+			pins = "gpio10";
+			input-enable;
+			bias-disable;
+		};
+
+		dsi1_cbl_det_pin: gpio11_cfg {
+			pins = "gpio11";
+			bias-pull-down;
+		};
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		#address-cells = <1>;
+
+		#size-cells = <0>;
+		reg = <0x70>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx_bridge_1: anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&io_expander>;
+				interrupts = <2 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 1 0>;
+				reset-gpios = <&io_expander 0 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi2dp_bridge_1_in: port@0 {
+						reg = <0>;
+
+						anx7625_1_in: endpoint {
+							remote-endpoint = <&mdss0_dsi0_out>;
+						};
+					};
+
+					dsi2dp_bridge_1_out: port@1 {
+						reg = <1>;
+
+						anx7625_1_out: endpoint { };
+					};
+				};
+			};
+		};
+
+		i2c@1 {
+			reg = <1>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx_bridge_2: anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&io_expander>;
+				interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 9 0>;
+				reset-gpios = <&io_expander 8 0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					dsi2dp_bridge_2_in: port@0 {
+						reg = <0>;
+
+						anx7625_2_in: endpoint {
+							remote-endpoint = <&mdss0_dsi1_out>;
+						};
+					};
+
+					dsi2dp_bridge_2_out: port@1 {
+						reg = <1>;
+
+						anx7625_2_out: endpoint { };
+					};
+				};
+			};
+		};
+	};
+
 };
 
 &mdss0 {
@@ -714,6 +833,21 @@ ethernet0_mdio: ethernet0-mdio-pins {
 		};
 	};
 
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio98";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio97";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+
 	qup_uart10_default: qup-uart10-state {
 		pins = "gpio46", "gpio47";
 		function = "qup1_se3";
-- 
2.34.1


