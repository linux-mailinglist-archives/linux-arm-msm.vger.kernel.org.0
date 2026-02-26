Return-Path: <linux-arm-msm+bounces-94283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEcVBwEroGmLfwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-94283-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:14:09 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6D1A4EB0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 12:14:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 54C6D3020982
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Feb 2026 11:13:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8038C33A9CE;
	Thu, 26 Feb 2026 11:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="eOzu6Pb4"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17870338905;
	Thu, 26 Feb 2026 11:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772104433; cv=none; b=bfIcwP2SGuYL3w3TlZJx8ZmfV5kSzgCg8nILlUTMB/gI2SvadgX54REuiHuAHaIL1Q6yDKhbvDsWOEUS7JSPphJou8Dpb0lDqbOi0YYl0QQ+5yBk8rU6DIU7Qms2w6XSxv+Tc5ZY7qbuw88/THZQ2ZNEN2Y6Lwvc+6/UZFVXLm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772104433; c=relaxed/simple;
	bh=yLa68gBOlIrjDvUSpqmDNuZ+nTTxx6SmJeav+xstJcI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=jkyDB4+xeGcTh2SpZcqzDvplqVZpP4NLbZXKUxJ8A48d0gGlFhcZ3WR96jnt+UUxmmDT8YhfjkGbKDHW5yxE/I0wNQgSQpw/Tr+GeIwtx927Lzc1pTi8WLnjW+WquBMA40E+G+PWi0vAZUe74lOA1UQp9VE9yV72/9semfrKn50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=eOzu6Pb4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61QAL8kI3987221;
	Thu, 26 Feb 2026 11:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lTFreEYIylh
	0/5vkZDUX91u2n4TL2Vmegs88I+0j47E=; b=eOzu6Pb4KZP5F6KKkpkSXp7J/GD
	L7OXbimrVdjFYkaxM62pg//DB7DtTtr6/GbxikdPKm+LdORgtuQBT+U9i+0U7MsA
	AcxELNwo2TlgdTqMqRb/n8AjB/8C6s96LaHeukph1rs8tDeJs+mAkPmLNGMDhKCh
	+JMxekUjH+OTBdfqRwoN5VJidrWDyhP4ikDyHJmpZST0MUUYkXLNZ7Qj0kPLesn0
	rIo8XahVxP1xhS1qsKNuM0z107oVbDoak3NYkQR9cACRYzf/iGyJVRlqW5KGPaKX
	0YzRC8l8O9hKybTQi6j4gDSOlg6qU9+efAuYhEB//5uDQsLIlUgTxri823A==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjdph1egj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:33 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 61QBDURP017513;
	Thu, 26 Feb 2026 11:13:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4cf5smjsf6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 61QBDT37017496;
	Thu, 26 Feb 2026 11:13:29 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-mkuntuma-hyd.qualcomm.com [10.213.97.145])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 61QBDTOw017494
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 26 Feb 2026 11:13:29 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 4582077)
	id B68E05E7; Thu, 26 Feb 2026 16:43:28 +0530 (+0530)
From: Mani Chandana Ballary Kuntumalla <quic_mkuntuma@quicinc.com>
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
Subject: [PATCH v4 2/2] arm64: dts: qcom: lemans-ride: Enable mdss1 display Port
Date: Thu, 26 Feb 2026 16:43:22 +0530
Message-Id: <20260226111322.250176-3-quic_mkuntuma@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
References: <20260226111322.250176-1-quic_mkuntuma@quicinc.com>
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
X-Proofpoint-ORIG-GUID: LaFbp-VtcUHl-orN4rSZIEU3CTYgtjXE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDEwMSBTYWx0ZWRfXwjNSV/ILHQkS
 V5Bu9r0YKtHRyQsGFIQhYn+NY0M/gdXu7OE/QfkXBHHzXsBu2EELWm8+Wl+byOpRBCukbKz8wAt
 M78GZjneQW55/4JjwA6y92EB4Klb1TuCu9wGeknmRbvIL5vYL8933EE4Zn3tsZf7C4HRGUf8Vda
 dNq/m5VjYz9U0muvTZgoQ4MMP/ZftNYcn8K5KxUk7rs/4MVRuwRtv6tI/6b9aPStbd3bGBl1GIx
 GutwdtCjy3i6Z80QONJIfBVWqr2Jyw1P2UieElsJa9TF5mGwZbp5d3XlxS0q5W1+9EW3D95tKym
 InI/Q9rXDFJSck/K3cGPgdY1i3ZmOO053Jawkvvuskczcq3aVAgpCBKDIfmv2MXp58i/k3xhz9h
 j24jyn0xbIqanWL18DUY8GmfUIyp5lZkBIORJKBPlaqm0aLTfIJex6qyuUCqQZeNCWhpHERIw9z
 mP21219Mh+s0VKuJPAg==
X-Authority-Analysis: v=2.4 cv=NJLYOk6g c=1 sm=1 tr=0 ts=69a02add cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=HzLeVaNsDn8A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=COk6AnOGAAAA:8 a=lcgM4KOETyTTvZj5T8AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: LaFbp-VtcUHl-orN4rSZIEU3CTYgtjXE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1011 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260101
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[quicinc.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[quicinc.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,somainline.org,chromium.org,kernel.org,linaro.org,linux.dev,poorly.run,gmail.com,ffwll.ch];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-94283-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[quic_mkuntuma@quicinc.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[quicinc.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-0.999];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Queue-Id: 30D6D1A4EB0
X-Rspamd-Action: no action

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


