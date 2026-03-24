Return-Path: <linux-arm-msm+bounces-99564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8CMYLuYqwml5ZwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:10:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 191C43029FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 07:10:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AF41430F7DC5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Mar 2026 06:05:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 690903B0AF7;
	Tue, 24 Mar 2026 06:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GSZZuGuc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC6403AA518;
	Tue, 24 Mar 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774332271; cv=none; b=mX8V4cjioBwMuGs4CFiJNmcyOqUc+9gqvHXSnOhm0QNf95/IA+N8ZpDLF93D/Ee0ceCOnXEDDX8GKSfaGoPWdUbR7V4oTO0V94Dc1QvSBJzA++lSj3twoByH1tSrek+jG8VxH5tu/dYc0BGcQmlLi1uKF2r+jVroWGsVtw/FyTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774332271; c=relaxed/simple;
	bh=bqOQRLngNCwfr5wUUzvWc2VS6CTl430NoTL0uYZdxo4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Wsf3FLjE25zt8Zx8XdZe72N1dkM/292VsTd/qak5f94hDg8CEV8dD+rh86QmNfJGEYdsUGmJtcvJVYGoxjy8dnj1uBr1gWnJxZPZ2s4Mik1pn5ySuvluORmqci/+BwHW1WeFMCkKVEKBZNlhh2wiJnOpMq+mgUJExx/zQiOGUvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GSZZuGuc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62O3WNjx3903825;
	Tue, 24 Mar 2026 06:04:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=KKezOkIHf9a
	WZJoeJk/WFrsn2EPRghPYErDoRL+L/js=; b=GSZZuGucVoHo9YrpBsZdMjK7zkc
	uvEPy2BPOURPNlU6elnjcLhIsVBuPSiSssiU5bK8KEM3fC2Knn3S7jDw1HDW3wKR
	bxp1/1MNKBPlByMmJPEuZBxJqRFyCh0+WZPKoqSmhC9myfQxTL4FsYUovQXVOCxA
	uMRkqy1N9RylNweHk+/+cf/PjWS4GY7dBA/NEowepZCPqtn4y0HKutH7DxGq7ycl
	tmIELHUKf1u9A/4PDz3YOamlZ97ZJT44RGB4//gcNTIMdCIrXnRgM4E0tLe26oFc
	2nGzDZUld/KgjHuaTQw5jOLayQSfd8+Aw0GtP/qkd58o7Cptxp09Ah8l6oA==
Received: from aptaippmta01.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com [103.229.16.4])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3jt0geyc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:21 +0000 (GMT)
Received: from pps.filterd (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 62O64IRM018013;
	Tue, 24 Mar 2026 06:04:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 4d1mdmjvwx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:18 +0000
Received: from APTAIPPMTA01.qualcomm.com (APTAIPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 62O64IlN018004;
	Tue, 24 Mar 2026 06:04:18 GMT
Received: from cse-cd01-lnx.ap.qualcomm.com (smtphost-taiwan.qualcomm.com [10.249.136.33])
	by APTAIPPMTA01.qualcomm.com (PPS) with ESMTPS id 62O64Hg1017995
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Mar 2026 06:04:18 +0000
Received: by cse-cd01-lnx.ap.qualcomm.com (Postfix, from userid 4531182)
	id B5A1322C2A; Tue, 24 Mar 2026 14:04:16 +0800 (CST)
From: Le Qi <le.qi@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        Le Qi <le.qi@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH v4 2/2] arm64: dts: qcom: talos-evk: Add sound card support with DA7212 codec
Date: Tue, 24 Mar 2026 14:04:05 +0800
Message-Id: <20260324060405.3098891-3-le.qi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
References: <20260324060405.3098891-1-le.qi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: V--p3LfQle2D9LfePJk25z3ojvMJPEco
X-Authority-Analysis: v=2.4 cv=Nc3rFmD4 c=1 sm=1 tr=0 ts=69c22965 cx=c_pps
 a=nuhDOHQX5FNHPW3J6Bj6AA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=Yq5XynenixoA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=c-OUY-gO7Egmvcr4Y_wA:9
X-Proofpoint-GUID: V--p3LfQle2D9LfePJk25z3ojvMJPEco
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDA0NyBTYWx0ZWRfX8gJuEpqr4OJY
 lWZEDlDaG7EBnOk2+/sJW973NnDZPDPqdSkA0ly4l2mATwx22upAjsQoUkIvv4U1+WwpO57k+Ml
 q6N45MXCLP1KYjg98YX/1T0YhuaXxRge7ywda4693g+sOufeBnQLSZYLQDioA8C8oad8V7VIy9L
 kmt1bL7/nBAJBxHFyVY5zO13o//b0bOR6XaTEF9op6cPh+JFXCqIjpRhIOkY/syingP2CS/yy+3
 t6DFehPb3/Tf8DU3YAwuo+0bqHJag/yGXEIdlWtgoUFm1ciXsnhXWwcWCe+8KUQR/25NLJpDfK+
 A8YK7Fq+SYIDp9RQ3oMDeJoa0DxRjIPkd0J9hbo3ICrCskl2RxlQsJ4y6fPFrrRNNOQDsSefJrP
 lZFGdnx8EB+xs/CSX5iYTFAgAo34+0wkeYoTFDPrmkbve9s1DvFVAeYSyC4b9IEjaf1+a+wONGU
 9xASIb1yyZBHpwTTmZg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_01,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240047
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[12];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99564-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[le.qi@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,oss.qualcomm.com:mid,1a:email,0.0.0.17:email];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 191C43029FE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the sound card node for QCS615 Talos EVK with DA7212 codec
connected over the Primary MI2S interface. The configuration enables
headphone playback and headset microphone capture, both of which have
been tested to work.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Le Qi <le.qi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/talos-evk.dts | 65 ++++++++++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/talos-evk.dts b/arch/arm64/boot/dts/qcom/talos-evk.dts
index af100e22beee..6352d614e288 100644
--- a/arch/arm64/boot/dts/qcom/talos-evk.dts
+++ b/arch/arm64/boot/dts/qcom/talos-evk.dts
@@ -5,6 +5,7 @@
 /dts-v1/;
 
 #include "talos-evk-som.dtsi"
+#include <dt-bindings/sound/qcom,q6afe.h>
 
 / {
 	model = "Qualcomm QCS615 IQ 615 EVK";
@@ -40,6 +41,46 @@ hdmi_con_out: endpoint {
 		};
 	};
 
+	sound {
+		compatible = "qcom,qcs615-sndcard";
+		model = "TALOS-EVK";
+
+		pinctrl-0 = <&mi2s1_pins>, <&mi2s_mclk>;
+		pinctrl-names = "default";
+
+		pri-mi2s-capture-dai-link {
+			link-name = "Primary MI2S Capture";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_TX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+
+		pri-mi2s-playback-dai-link {
+			link-name = "Primary MI2S Playback";
+
+			codec {
+				sound-dai = <&codec_da7212>;
+			};
+
+			cpu {
+				sound-dai = <&q6apmbedai PRIMARY_MI2S_RX>;
+			};
+
+			platform {
+				sound-dai = <&q6apm>;
+			};
+		};
+	};
+
 	vreg_v1p8_out: regulator-v1p8-out {
 		compatible = "regulator-fixed";
 		regulator-name = "vreg-v1p8-out";
@@ -109,6 +150,19 @@ adv7535_out: endpoint {
 	};
 };
 
+&i2c5 {
+	status = "okay";
+
+	codec_da7212: codec@1a {
+		compatible = "dlg,da7212";
+		reg = <0x1a>;
+		#sound-dai-cells = <0>;
+		VDDA-supply = <&vreg_v1p8_out>;
+		VDDIO-supply = <&vreg_v1p8_out>;
+		VDDMIC-supply = <&vreg_v3p3_out>;
+	};
+};
+
 &mdss_dsi0_out {
 	remote-endpoint = <&adv7535_in>;
 	data-lanes = <0 1 2 3>;
@@ -124,6 +178,17 @@ &pon_resin {
 	status = "okay";
 };
 
+&q6apmbedai {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	dai@17 {
+		reg = <PRIMARY_MI2S_TX>;
+		clocks = <&q6prmcc LPASS_CLK_ID_MCLK_2 LPASS_CLK_ATTRIBUTE_COUPLE_NO>;
+		clock-names = "mclk";
+	};
+};
+
 &sdhc_2 {
 	pinctrl-0 = <&sdc2_state_on>;
 	pinctrl-1 = <&sdc2_state_off>;
-- 
2.34.1


