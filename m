Return-Path: <linux-arm-msm+bounces-90423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GF1LFyIudWmYBgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:40:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A98D67EF11
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 21:40:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 02F8D300BDB2
	for <lists+linux-arm-msm@lfdr.de>; Sat, 24 Jan 2026 20:39:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1E1A27FD71;
	Sat, 24 Jan 2026 20:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="aKQ57ZhH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69F65273D75;
	Sat, 24 Jan 2026 20:39:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769287191; cv=none; b=ONSg6HCCsXHelDwrg0boxcP3qRqPg1RMt7C8OVFqWK7fuISPVbJcr3HCL+5RZcQXYBRL6KhWObTvVnB80O8S37J/Qsvfix5p3qjnoT4QFWZv0vFtgA0tVjwQVII3n1Ozs6QWD6YjfPmE75/oP7kxMtvhrwMolD8Z4c8b7D1N184=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769287191; c=relaxed/simple;
	bh=EMCqChS/1XawaJpcswaK7c3gAMSBFsBizP/+0o0+FR4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YQGu/0L4Syjsyv01ESLAl+ifzNPNVtszOvCEXKOGUdlclFxu81SglhuNRmWQ6m5E/b/uTDdPfrY5SPdYKYz8nwohEhiw8bSdCFzwuNetJhntDAT9dnLi/5gnLwPevmEEVKdLWhxnGxuALEM6vSRQHffqZImZY/mXZ1NluaCZzhc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=aKQ57ZhH; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60OJinbA2157256;
	Sat, 24 Jan 2026 20:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=umHuqkgBRog
	k16QGuJ3hdtSRnIIjgnm2Y7kCkh8Qctw=; b=aKQ57ZhH03nfLW4iuZL5WKPhP/0
	3wNg4JdrkE0pM9rM/bGWrk+msskVGuK/qKCjRU1OFz+SK+uYLOX6QzkK2ixhpe9x
	GBr79S+Vxz4BmDs4BuaemKE4AG0VMp8Kl6zuKbHFJ8jgjScXNURKQ4ybhkaEIIK3
	2wYVUfzYY+XYzWDz9NUsIt3dX4yReQJSb7I62htMaNX5tnqp0UfoSvwrHWerTbuZ
	Ihs5YmnHawibUzeRuATIYqpTuc+rlAkJNFMGMkxhVCf2f2gxxi/lO93BV4ePn2zP
	GF+9byklNf5+6blsnx4qeE3N/a0FM6RKZuc/p+gMrW3J0/w2pAMhoaOoACw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwty8kbt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:32 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 60OKdTCW031206;
	Sat, 24 Jan 2026 20:39:29 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4bvq5ke8jb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:29 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 60OKdSeF031188;
	Sat, 24 Jan 2026 20:39:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-amakhija-hyd.qualcomm.com [10.213.99.91])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 60OKdSRZ031182
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 24 Jan 2026 20:39:28 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4090850)
	id EE1325CB; Sun, 25 Jan 2026 02:09:27 +0530 (+0530)
From: Ayushi Makhija <quic_amakhija@quicinc.com>
To: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc: Ayushi Makhija <quic_amakhija@quicinc.com>, robdclark@gmail.com,
        dmitry.baryshkov@oss.qualcomm.com, sean@poorly.run,
        marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
        robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
        conor+dt@kernel.org, andrzej.hajda@intel.com,
        neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonathan@marek.ca, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com
Subject: [PATCH v6 2/2] arm64: dts: qcom: qcs8300-ride: add anx7625 DSI to DP bridge node
Date: Sun, 25 Jan 2026 02:09:25 +0530
Message-Id: <20260124203925.2614008-3-quic_amakhija@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
References: <20260124203925.2614008-1-quic_amakhija@quicinc.com>
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
X-Proofpoint-GUID: r6wKDZQk-EoOzHAXmjma4B7pO0DfDMJz
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=69752e04 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=vUbySO9Y5rIA:10 a=VkNPw1HP01LnGYTKEx00:22 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=PkzH0pPD3_lowiemrhkA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: r6wKDZQk-EoOzHAXmjma4B7pO0DfDMJz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI0MDE2OCBTYWx0ZWRfXwesprPk743QV
 UaWsxD1jCMSeaRoM7EujvNiUQnVIfYKL6ur9rnEW0ZAjJLr2Fi7o3GMoJRZ9E7wY8wfvmszc7o1
 +PPcR0YhvWZAcqwxtiTrAvmcCRPSJPLbBFQVVIdoCCZzourVHK36zXKHT3J9RE5JoXCBXtfJcoE
 Nd8eJvtYU9ZlkhKR0C5R2c674j3DicjG6lGxfC/R/y7DDtVu/XLqQ5hi21pYWW4Mr2b1VL9k9wY
 g1QbKL9UyAXXr7qXVbLNExGo3yWqxYHp7DrccmPcIBxv66rz/idh3cEQU+56J6YwnJG2GL7gyGg
 w8LObUGuVgQbV4uKoFfaYV3099LRdMIhyNotjjHblu0/gmO0JpmS1BWmErnQSGJBut9ZxGiv6vJ
 GC0At0jjrdsuT/HxwkiySOlXP0dKi8dLEcfhicGNMemq/nTZ8PQ6iQXZtt0+xdSsRQ09p92omru
 oGEW8fFSmHBM8mP1/bQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-24_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601240168
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[quicinc.com,gmail.com,oss.qualcomm.com,poorly.run,somainline.org,kernel.org,intel.com,linaro.org,ideasonboard.com,marek.ca,kwiboo.se];
	TAGGED_FROM(0.00)[bounces-90423-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[25];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_amakhija@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[0.0.0.58:email,quicinc.com:email,quicinc.com:dkim,quicinc.com:mid,0.0.0.0:email,0.0.0.1:email,qualcomm.com:email,0.0.0.74:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns];
	NEURAL_HAM(-0.00)[-0.993];
	DBL_PROHIBIT(0.00)[0.0.0.70:email];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: A98D67EF11
X-Rspamd-Action: no action

Add anx7625 DSI to DP bridge device node.

Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs8300-ride.dts | 179 ++++++++++++++++++++++
 1 file changed, 179 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
index c04e0ad53eec..36cbcea32881 100644
--- a/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
+++ b/arch/arm64/boot/dts/qcom/qcs8300-ride.dts
@@ -24,6 +24,69 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 
+	vreg_1p0: regulator-vreg-1p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P0";
+
+		regulator-min-microvolt = <1000000>;
+		regulator-max-microvolt = <1000000>;
+
+		vin-supply = <&vreg_1p8>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_1p8: regulator-vreg-1p8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_1P8";
+
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+
+		vin-supply = <&vreg_5p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_3p0: regulator-vreg-3p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_3P0";
+
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+
+		vin-supply = <&vreg_12p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_5p0: regulator-vreg-5p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_5P0";
+
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+
+		vin-supply = <&vreg_12p0>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vreg_12p0: regulator-vreg-12p0 {
+		compatible = "regulator-fixed";
+		regulator-name = "VREG_12P0";
+
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
 	dp0-connector {
 		compatible = "dp-connector";
 		label = "DP0";
@@ -36,6 +99,18 @@ dp0_connector_in: endpoint {
 		};
 	};
 
+	dp-dsi0-connector {
+		compatible = "dp-connector";
+		label = "DSI0";
+		type = "full-size";
+
+		port {
+			dp_dsi0_connector_in: endpoint {
+				remote-endpoint = <&dsi2dp_bridge_out>;
+			};
+		};
+	};
+
 	regulator-usb2-vbus {
 		compatible = "regulator-fixed";
 		regulator-name = "USB2_VBUS";
@@ -316,6 +391,75 @@ &gpu_zap_shader {
 	firmware-name = "qcom/qcs8300/a623_zap.mbn";
 };
 
+&i2c8 {
+	clock-frequency = <400000>;
+
+	status = "okay";
+
+	io_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		interrupts-extended = <&tlmm 93 IRQ_TYPE_EDGE_BOTH>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-controller;
+		#interrupt-cells = <2>;
+		reset-gpios = <&tlmm 66 GPIO_ACTIVE_LOW>;
+
+		pinctrl-0 = <&io_expander_intr_active>,
+			    <&io_expander_reset_active>;
+		pinctrl-names = "default";
+	};
+
+	i2c-mux@70 {
+		compatible = "nxp,pca9543";
+		reg = <0x70>;
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		i2c@0 {
+			reg = <0>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			bridge@58 {
+				compatible = "analogix,anx7625";
+				reg = <0x58>;
+				interrupts-extended = <&io_expander 2 IRQ_TYPE_EDGE_FALLING>;
+				enable-gpios = <&io_expander 1 GPIO_ACTIVE_HIGH>;
+				reset-gpios = <&io_expander 0 GPIO_ACTIVE_HIGH>;
+				vdd10-supply = <&vreg_1p0>;
+				vdd18-supply = <&vreg_1p8>;
+				vdd33-supply = <&vreg_3p0>;
+
+				ports {
+					#address-cells = <1>;
+					#size-cells = <0>;
+
+					port@0 {
+						reg = <0>;
+
+						dsi2dp_bridge_in: endpoint {
+
+							remote-endpoint = <&mdss_dsi0_out>;
+						};
+					};
+
+					port@1 {
+						reg = <1>;
+
+						dsi2dp_bridge_out: endpoint {
+
+							remote-endpoint = <&dp_dsi0_connector_in>;
+						};
+					};
+				};
+			};
+		};
+	};
+};
+
 &pmm8650au_1_gpios {
 	usb2_en: usb2-en-state {
 		pins = "gpio7";
@@ -391,10 +535,31 @@ &pcie1_phy {
 	status = "okay";
 };
 
+&mdss_dsi0 {
+	vdda-supply = <&vreg_l5a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_phy {
+	vdds-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss_dsi0_out {
+	data-lanes = <0 1 2 3>;
+	remote-endpoint = <&dsi2dp_bridge_in>;
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
 
+&qupv3_id_1 {
+	status = "okay";
+};
+
 &remoteproc_adsp {
 	firmware-name = "qcom/qcs8300/adsp.mbn";
 	status = "okay";
@@ -498,6 +663,20 @@ perst-pins {
 		};
 	};
 
+	io_expander_reset_active: io-expander-reset-active-state {
+		pins = "gpio66";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
+	io_expander_intr_active: io-expander-intr-active-state {
+		pins = "gpio93";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-disable;
+	};
+
 	dp_hot_plug_det: dp-hot-plug-det-state {
 		pins = "gpio94";
 		function = "edp0_hot";
-- 
2.34.1


