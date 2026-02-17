Return-Path: <linux-arm-msm+bounces-93052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4DAhMosVlGl3/wEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-93052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:15:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EB8C14929B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 08:15:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 55F9A3017380
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Feb 2026 07:15:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB4222D47EF;
	Tue, 17 Feb 2026 07:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eCp3gnLQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7756B2D46D6;
	Tue, 17 Feb 2026 07:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771312511; cv=none; b=XLZLlCqGyrOIhJSImXOdRj0yMfCj7kMG0vZ0gqPwrZFmgdP3IGEDBBSehYt73nQjxV2a+pWlwWFR3tLszU/I2L8XfB5/wrvH5Z/9NtIj1fAWa91NxcM1zVhgN1sYmFkcFd28uYx+CfCQmVG9xxu7y3tFzsmR7/2WVL2Bhhlcw0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771312511; c=relaxed/simple;
	bh=pA0cnsLSSAmS/1wair5Sm1DBUSv6Zhuqfpmh2dh3fmo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tHKevqHXBlW+RULmhxMCJ5/p7DodntR+cTHQ25KoCyuOLrcbRP7PLBxfPqUPb6HfXpyBTLNUyLiMDG9X0kcaaVX3+MpSw0gkCJHcK8/kxi6d0ChrOFwOUKuyV0sq/Sa4pGucuy+zQrJ7+KJjhDfX7kUtXcm2sADZLUxC6GvkC9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eCp3gnLQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=qti.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61GH4S5G985268;
	Tue, 17 Feb 2026 07:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=a9thpeIp40M
	fH9q7I1E2VqXkD6Ks8gqHDNM6SrYHW4M=; b=eCp3gnLQRbvzqYgcXPt//n4ftR4
	kwfjTO5vPNBQDmZDv1Fy/xgRtRTYArk0A9YRqJ4Lfgy1oEnebf617kAmQ6G/P15x
	8ohR+SwOIYM+hkgjwaLsYcZ21cmtbkNC8PMQBtJTebwiKpY3Kf7aYQLIOWLIKPLL
	Ve3l1z6I5GnScwHI7wld3kftqgXC9FzmO3+1hpzZt7+QCmF1vNJGxmcqRBqVlFNn
	7opODgejq7bNahRfn+VKDVROJCIrpu3p0WVG12zqNnk5B73oNlxEV6Fil5dYBzyE
	+E1HF0tGVZ2o5WG5cxUkLqpp5/vUjO7rO4/9C3JJxiuIA/KYEyrBTlUYq3w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cc7ap1c48-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:51 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61H7EmS3006293;
	Tue, 17 Feb 2026 07:14:48 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4caj4m5s9j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:48 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61H7EmQB006285;
	Tue, 17 Feb 2026 07:14:48 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 61H7Elwk006281
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 17 Feb 2026 07:14:48 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id 4BC6A5D5; Tue, 17 Feb 2026 12:44:47 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <mkuntuma@qti.qualcomm.com>
To: dmitry.baryshkov@oss.qualcomm.com, marijn.suijten@somainline.org,
        swboyd@chromium.org, mripard@kernel.org, abel.vesa@linaro.org,
        andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, robin.clark@oss.qualcomm.com,
        jessica.zhang@oss.qualcomm.com, abhinav.kumar@linux.dev,
        sean@poorly.run, airlied@gmail.com, simona@ffwll.ch,
        alex.vinarskis@gmail.com
Cc: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        freedreno@lists.freedesktop.org, quic_rajeevny@quicinc.com,
        quic_vproddut@quicinc.com, dri-devel@lists.freedesktop.org,
        quic_riteshk@quicinc.com
Subject: [PATCH v3 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
Date: Tue, 17 Feb 2026 12:44:20 +0530
Message-Id: <20260217071420.2240380-3-mkuntuma@qti.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
References: <20260217071420.2240380-1-mkuntuma@qti.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDA1OCBTYWx0ZWRfXx8GgcTq+fRlB
 BoMg6yKGgTicMV7VcXR4u/M0Wn8Wt/0EPRlh1hc7hXbcEUWosIKBVZ6YK3hLaMUMJwDHiP0YPHb
 /5eKUaqFSQXuJIua6O/KPASGxk81QEHrJnkDv0G5J64rdlRg4CaeTgBr0vPArx1AtpGc8PuDtxK
 KE/Id5KgcOms8QN6Oq3lqZUWRUQdzJElHeWUaCwONpHUjLCcpwCK1UhVQGr0EwrZRiWF5Anzhfh
 hHwPOCMTm5vm32s7EehIaR9fRrDtE+I8Nb+cf3na8aOVl3irmGX6WatRhVuKQCxwPi/5Hngwsrz
 KaS6ePc4oKz7vBXhFYoSA8pLJXgVhhFbc6S5alyEU57nuDExxr82p8n6rAiuB1tuqpnTeBLaZ1U
 7qLZTvsMPf/MX4pT2Cy3CYD5Mb3d17bt782gmy1FrYJ4Ud0vBXSSiYClk4tc0yMC4Dky7iOGRMX
 PUX5ZgEPv7rtMCFT5kw==
X-Proofpoint-ORIG-GUID: s7pih29GowKt0_kyqBbT7r26rkDyXrQ4
X-Proofpoint-GUID: s7pih29GowKt0_kyqBbT7r26rkDyXrQ4
X-Authority-Analysis: v=2.4 cv=Rfydyltv c=1 sm=1 tr=0 ts=6994156c cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22
 a=GgsMoib0sEa3-_RKJdDe:22 a=COk6AnOGAAAA:8 a=lcgM4KOETyTTvZj5T8AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_01,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 clxscore=1011 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602170058
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[27];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-93052-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[mkuntuma@qti.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	PRECEDENCE_BULK(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,qualcomm.com:dkim,qti.qualcomm.com:mid];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 3EB8C14929B
X-Rspamd-Action: no action

From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>

This change enables DP controllers, DPTX0 and DPTX1 alongside
their corresponding PHYs of mdss1 which corresponds to edp2
and edp3.

Signed-off-by: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
---
 .../boot/dts/qcom/lemans-ride-common.dtsi     | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
index 8fb7d1fc6d56..abeb4cca0a6e 100644
--- a/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans-ride-common.dtsi
@@ -180,6 +180,30 @@ dp1_connector_in: endpoint {
 		};
 	};
 
+	dp2-connector {
+		compatible = "dp-connector";
+		label = "eDP2";
+		type = "full-size";
+
+		port {
+			dp2_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp0_out>;
+			};
+		};
+	};
+
+	dp3-connector {
+		compatible = "dp-connector";
+		label = "eDP3";
+		type = "full-size";
+
+		port {
+			dp3_connector_in: endpoint {
+				remote-endpoint = <&mdss1_dp1_out>;
+			};
+		};
+	};
+
 	dp-dsi0-connector {
 		compatible = "dp-connector";
 		label = "DSI0";
@@ -639,6 +663,50 @@ &mdss0_dsi1_phy {
 	status = "okay";
 };
 
+&mdss1 {
+	status = "okay";
+};
+
+&mdss1_dp0 {
+	pinctrl-0 = <&dp2_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp0_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp2_connector_in>;
+};
+
+&mdss1_dp0_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
+&mdss1_dp1 {
+	pinctrl-0 = <&dp3_hot_plug_det>;
+	pinctrl-names = "default";
+
+	status = "okay";
+};
+
+&mdss1_dp1_out {
+	data-lanes = <0 1 2 3>;
+	link-frequencies = /bits/ 64 <1620000000 2700000000 5400000000 8100000000>;
+	remote-endpoint = <&dp3_connector_in>;
+};
+
+&mdss1_dp1_phy {
+	vdda-phy-supply = <&vreg_l1c>;
+	vdda-pll-supply = <&vreg_l4a>;
+
+	status = "okay";
+};
+
 &pmm8654au_0_gpios {
 	gpio-line-names = "DS_EN",
 			  "POFF_COMPLETE",
@@ -816,6 +884,18 @@ dp1_hot_plug_det: dp1-hot-plug-det-state {
 		bias-disable;
 	};
 
+	dp2_hot_plug_det: dp2-hot-plug-det-state {
+		pins = "gpio104";
+		function = "edp2_hot";
+		bias-disable;
+	};
+
+	dp3_hot_plug_det: dp3-hot-plug-det-state {
+		pins = "gpio103";
+		function = "edp3_hot";
+		bias-disable;
+	};
+
 	io_expander_intr_active: io-expander-intr-active-state {
 		pins = "gpio98";
 		function = "gpio";
-- 
2.34.1


