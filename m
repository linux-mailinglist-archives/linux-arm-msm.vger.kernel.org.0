Return-Path: <linux-arm-msm+bounces-19381-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A4F8BE92C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 18:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 06A0F1C23E3A
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 16:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0614D79D0;
	Tue,  7 May 2024 16:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="A0GSbALb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83E3154BEA;
	Tue,  7 May 2024 16:31:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715099478; cv=none; b=GStC4+78v/3KuTAU7mfT6pgVEHrRWzUQUpA5m2X83CHf2WXSUN+YHnOLdwsUkdLHTNxS284qdG1comfnLcExxavRk0JahNk4mYXm1+Yjni/psilhmevxobd12M3c3itMSCcXO3kE8cgnLKB4ho6WAgAi6OKkKoq2hOEeucNO5Os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715099478; c=relaxed/simple;
	bh=xf6vF2tLiDkxdORBNe7B9Y/dP2uQ/drLwUdwAmkrcok=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=p2FmEYJhkR2I7Ryvv6qlCf1Og4IXoW3TvUuuuvc+DiJ2IuTPCJ/M+DrJrijuDvsqGIZa6CW8KBqrukR0nPXE5tKTtbowQ+0zKtKrurSEGB4KxrEUvEK3XGjxzg8vjNEZAPhBKhxuyZ6LNs9KXl6c0Jb97sF0vdGyDpKjd72HEks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=A0GSbALb; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 447EQX3A024156;
	Tue, 7 May 2024 16:31:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references; s=
	qcppdkim1; bh=sEybrDKAPFJvrVijAN/jPDUy4nJOcnX3S0FLFrbEuEQ=; b=A0
	GSbALbLY1tGVoTdMik5SlnMEx8oz52PpI6chAuSawAlQJAgiLDry1fLi/gF7ch6X
	3H/xOq1d+dAXB1odkeLWXpnI5EDtVsPCPrC4W1DQFKAiuEwBCNKbnGtNThEdw2Vf
	mdrW9lZSb06Y/OZlj/kkyB2ITfVbTqhifxGQFwyzGh4z3pojVpk5t4boXrH0/28/
	T/BMZ/2lNFneXSYl0GvBG2UiU49c8YE8Y6a+Y9J6ICuL6PZ70IFd5M3sRTWWzGh0
	pEgldUzyg+sI5w8eBcqFSxU9aIHGjAfhVka0GIYUV1ZZBBEZNfFfj+MQDb9A7+Db
	j35NM5AJ+72J6PGWtYLQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyp2frc56-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 16:31:10 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 447GV7vo019583;
	Tue, 7 May 2024 16:31:07 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3xwe3krrx3-1;
	Tue, 07 May 2024 16:31:07 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 447GV78H019578;
	Tue, 7 May 2024 16:31:07 GMT
Received: from hu-maiyas-hyd.qualcomm.com (hu-vvalluru-hyd.qualcomm.com [10.213.106.176])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 447GV6kq019576;
	Tue, 07 May 2024 16:31:07 +0000
Received: by hu-maiyas-hyd.qualcomm.com (Postfix, from userid 482827)
	id 4B9A75006A2; Tue,  7 May 2024 22:01:06 +0530 (+0530)
From: Venkata Prahlad Valluru <quic_vvalluru@quicinc.com>
To: andersson@kernel.org
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, konrad.dybcio@linaro.org,
        krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_abhinavk@quicinc.com,
        quic_nankam@quicinc.com, quic_vvalluru@quicinc.com, robh@kernel.org
Subject: [PATCH v3] arm64: dts: qcom: qcs6490-rb3gen2: enable hdmi bridge
Date: Tue,  7 May 2024 22:00:45 +0530
Message-Id: <20240507163045.28450-1-quic_vvalluru@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
References: <jr3ble6sxr5mr6cvm6ldvpyk5j4rucj3xy6vbha6ttoecte3d7@llu6qf6oasuc>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: DsHK6veQ039EtKq0nzYV5JB_UfF5P8jv
X-Proofpoint-ORIG-GUID: DsHK6veQ039EtKq0nzYV5JB_UfF5P8jv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_09,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 adultscore=0 spamscore=0 phishscore=0
 impostorscore=0 bulkscore=0 clxscore=1015 mlxlogscore=949 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2405070112
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
 arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts | 85 ++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
index a085ff5b5fb2..24b0b9525ea4 100644
--- a/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
+++ b/arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts
@@ -52,6 +52,17 @@
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
 	reserved-memory {
 		xbl_mem: xbl@80700000 {
 			reg = <0x0 0x80700000 0x0 0x100000>;
@@ -530,6 +541,45 @@
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
 
@@ -587,6 +637,21 @@
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
@@ -711,3 +776,23 @@
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


