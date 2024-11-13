Return-Path: <linux-arm-msm+bounces-37773-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C139C6EDB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 13:15:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6E9B6B27E9C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 Nov 2024 11:59:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 600F620103A;
	Wed, 13 Nov 2024 11:54:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="NNOuIzn6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A382003D4;
	Wed, 13 Nov 2024 11:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731498842; cv=none; b=YVJlqdIWfbtqCAsz844+TtsVTijGC/vAVAwE7+Qp9ZWbjlQbCh4s+q7ytYPytQrq2U4ZdKHm3CzRzpnkojoC3CVYTlJ5In27zS9eEXjkvpUjddEQ/kwbP0QzI6vgAY/uzxMCge6qEmen6louVY/zE6S3ujMaZMAT+Btps2i/AxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731498842; c=relaxed/simple;
	bh=xGVU5E7ORuOqbHPm/9XSSLymTNEEq5cXk4e93Mj34r0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-ID:References:
	 In-Reply-To:To:CC; b=p9JQGuDtVC8jeYHzsVMjCWU8sKatc8sqFw9RHYd45qo/Qf4/73oER4/kdZCYv5YQ0jk+yqB3w7ihaPlwPOV+18P1Srra6YEMQwxy5NzXc6h5YDl6H7hYuAtMw2o3yCCyKn7gzfycMRRwJ6L9IhTz8QAJf/JqudD7dOC2UspqL7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=NNOuIzn6; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AD9Qt26014572;
	Wed, 13 Nov 2024 11:53:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7Q5b/v6hP49ousuu3y0QjqsGXEOrcXaZ0nuJKp5PUfg=; b=NNOuIzn68KNshNRB
	eyGkfFt9MILGzW0I2vvygtpRyk8c0RjLggUpcKvnihKMi2/voELO9bH0JMntgyih
	Z+4upGz/nZIqbvh+dkTTMDLDssBKDV6AbCTwG/z+RAH+7w2Jql2uFmaB/HTwz/Ny
	Uh4Iu5fU3BP0cFQ8jFmGWEaDQkGAsRsuJq8Eo/uNQgnbjsBZ+knvK1twmYw8/U58
	gLOq1WijfBj2Yrtv7Bp5oAhJOExWrAAAMAoO4YbD5FW4tI3IomYiW2zTvbC/g+M1
	QY+XqUfqkOwCkqQ/HCDBBEzIYsGC3P7tKDSgWiU0uD1w3pQlpepp+TRAqQ9EkRtG
	dk8wrg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42vsg50bwq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:42 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ADBrf6H024860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Nov 2024 11:53:41 GMT
Received: from robotics-lnxbld017.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 13 Nov 2024 03:53:34 -0800
From: Fange Zhang <quic_fangez@quicinc.com>
Date: Wed, 13 Nov 2024 19:51:50 +0800
Subject: [PATCH v2 8/9] arm64: dts: qcom: Add display support for QCS615
 RIDE board
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241113-add-display-support-for-qcs615-platform-v2-8-2873eb6fb869@quicinc.com>
References: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
In-Reply-To: <20241113-add-display-support-for-qcs615-platform-v2-0-2873eb6fb869@quicinc.com>
To: Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar
	<quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard
	<mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, "Li
 Liu" <quic_lliu6@quicinc.com>,
        Fange Zhang <quic_fangez@quicinc.com>,
        "Xiangxu Yin" <quic_xiangxuy@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
        <freedreno@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1731498759; l=2941;
 i=quic_fangez@quicinc.com; s=20241014; h=from:subject:message-id;
 bh=Q8LiZhb/Ep/nJO5Y1DyMDYqgsfi76f6BBkbAUE5K5UM=;
 b=9pdLoyJ16hbwESroVM8oIGkXSblxtKo2DyQGcCymOT5Bk2gR62TqfAKpGig0w0pFH78s420qg
 7fPfblIlKNqBfNqaPIONgiNmplUXoA607/Ny6kZ81/HhOB6jnWEO3t3
X-Developer-Key: i=quic_fangez@quicinc.com; a=ed25519;
 pk=tJv8Cz0npA34ynt53o5GaQfBC0ySFhyb2FGj+V2Use4=
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: a8yQUXGi8b9-YeX12m6xZxLfLitS-NF_
X-Proofpoint-ORIG-GUID: a8yQUXGi8b9-YeX12m6xZxLfLitS-NF_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 phishscore=0 malwarescore=0 lowpriorityscore=0
 mlxscore=0 mlxlogscore=999 impostorscore=0 bulkscore=0 adultscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411130102

From: Li Liu <quic_lliu6@quicinc.com>

Add display MDSS and DSI configuration for QCS615.
QCS615 has a DP port, and DP support will be added in a later patch.

Signed-off-by: Li Liu <quic_lliu6@quicinc.com>
Signed-off-by: Fange Zhang <quic_fangez@quicinc.com>
---
 arch/arm64/boot/dts/qcom/qcs615-ride.dts | 109 +++++++++++++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615-ride.dts b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
index ee6cab3924a6d71f29934a8debba3a832882abdd..8b9029e96b07cbef950b074a7412180d6c27d39a 100644
--- a/arch/arm64/boot/dts/qcom/qcs615-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs615-ride.dts
@@ -202,6 +202,115 @@ &gcc {
 		 <&sleep_clk>;
 };
 
+&i2c2 {
+	clock-frequency = <400000>;
+	pinctrl-0 = <&qup_i2c2_data_clk &ioexp_intr_active &ioexp_reset_active>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	ioexp: gpio@3e {
+		compatible = "semtech,sx1509q";
+		reg = <0x3e>;
+		interrupt-parent = <&tlmm>;
+		interrupts = <58 0>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		semtech,probe-reset;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi_dp_hpd_cfg_pins &dsi_dp_cdet_cfg_pins>;
+
+		// HPD configuration for DSI to DP port
+		dsi_dp_hpd_cfg_pins: gpio0-cfg {
+			pins = "gpio0";
+			bias-pull-up;
+		};
+
+		// Connection detect configuration for DSI to DP port
+		dsi_dp_cdet_cfg_pins: gpio1-cfg {
+			pins = "gpio1";
+			bias-pull-down;
+		};
+	};
+
+	i2c-mux@77 {
+		compatible = "nxp,pca9542";
+		reg = <0x77>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			anx7625@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupt-parent = <&ioexp>;
+				interrupts = <0 0>;
+				enable-gpios = <&tlmm 4 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&tlmm 5 GPIO_ACTIVE_HIGH>;
+				wakeup-source;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+						anx_7625_in: endpoint {
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+						anx_7625_out: endpoint {
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
+&mdss {
+	status = "okay";
+};
+
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l11a>;
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	remote-endpoint = <&anx_7625_in>;
+	data-lanes = <0 1 2 3>;
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l5a>;
+	status = "okay";
+};
+
+&tlmm {
+	ioexp_intr_active: ioexp_intr_active {
+		pins = "gpio58";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
+	ioexp_reset_active: ioexp_reset_active {
+		pins = "gpio3";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+		output-high;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };

-- 
2.34.1


