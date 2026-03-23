Return-Path: <linux-arm-msm+bounces-99211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eCQ4A9UfwWnCQwQAu9opvQ
	(envelope-from <linux-arm-msm+bounces-99211-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:11:17 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 132F62F0EE1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 12:11:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 33DB4300185B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Mar 2026 11:00:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1ECA839098F;
	Mon, 23 Mar 2026 11:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G2EHsniN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EOaJ2JS0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2D78386571
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774263630; cv=none; b=GaGJIRvZgnT6SMZpGoPkgtPXrFOjwH8zsplyWUZwTis6p6h8p4oUXBU+1cNnl6AcM5IRHPxo8ADuAMQcTz/LVzbCAhjl1OLRRh6iXaADRJI59smGBXv2d3Wlho/GXrVpGNAyjgHCDdU1y4w9qGIk5tG9+3A119ipijJ85Zp22ng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774263630; c=relaxed/simple;
	bh=RBivVUJD+h5CCKNlpG1JCSp6JTzbV+335BBoc8zMPwA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qUWaAs4geLx6I2EIgSsECOM3SpW1CS3R/W4fB2zZRPnSYcBWZP0EWDMmCl+/QL7HCrnEp1Z6gWcs/k7Utw665SCjjCroZRN5Tohee3k3FPvD5axFj3IfIxdzg9aoPoERGPotnmD5ieHtKPXNyLXeiWDLB877bP2cL5Nwr+VExao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G2EHsniN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EOaJ2JS0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62NAEK2M3541579
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:00:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1
	Ow8Ng0OA=; b=G2EHsniNuiTiaXMLBfHKOXTTuqIMcbC8L20y0lLMBeawi1nfrFO
	4/gFOE800VsyRZAYFwgZQqu7uLz4mKNtfUEmRI/3GBPBqgudrMx/2c+iuksNUbu+
	bBi5vAGHAWI8IaeyB+wl827eh08yuZ+UIT2AXlCL3fHbHm/qlMtLXRuFPCetIIZN
	ct2my368VBIb+ysHDOL5ji44p5dXZww+3Me6ptESppjF2Hfq0n2XoYDT7uLjvN88
	GgLZoMGLhPGk7qFyf4apW+OSFlGVjNVeFanz9u60EvLl6r9vO82DC5bl/O5uRiOH
	PiQvVXpb/w9cokvkC0UuYis18U977CyySpQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d33k30526-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 11:00:27 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ad30f8fe0dso24356085ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 23 Mar 2026 04:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774263627; x=1774868427; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1Ow8Ng0OA=;
        b=EOaJ2JS0fMlV4pE72Eh4NzUjuq/F8/Dc6d6vLa0MSUShGOQZoK6XmS8m4Eu5yuNcTD
         jqtWGc8eAcQeap+Jla7ZahIbkNKs0WdEbIw4k9eh0nscG1bh20u6Oc5tz153EV0W+bfA
         GclwcVGJrPp6Nu4WW0mVt/eV7TQ+PG0QOCCNyzGRjYzZCGwu/iD43TXkn37lC+yHYEte
         52H/Qt8XUfza8cRLzryBq9dnUjUFmnnUu5v8n79kxpeGfTT0agIZcT5NirABiw0pR7eZ
         8shi3V8+JdQqCgdne7vkqUiE3G+NYkhda1TS0cwA5PiRLI/JHZixHF787wyewkPan8Tb
         eyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774263627; x=1774868427;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1Nb/obKIzqn0aOR5lxwUJngaS+rDj32kWj1Ow8Ng0OA=;
        b=XDZ1e4fvkwVDGG/x6on8UF3eh+6pDpx3H26wDWz9y+PWG1F1E6SZSP6eXRRspLdUk6
         sjdS28eWwDGJA0SKUpUzbyXL1Ay5H/+dYzShfvO7hhbEZ1nQ3hczL4JAOH6aheLws3FO
         hedkGhwKJ/UX9FXwBUf7jA2PlKrF/cgyNKll2y2NydyudafgAZt7ty0r7HurAB/ofjsw
         XWsqxfTcr0FjRSA+btj9wYSPTJIvo+mCOkCNYsiYXFnEghCKU9woRkNXClXHSPXVLD8h
         0yhC46aak/h622IJXVq7Z43EVwwWkgarqrAKI3L+enbyCxBCIUGjojvPSyrR/Woc+3TF
         Z12w==
X-Gm-Message-State: AOJu0YyQYIUnQyy+tK2zAAMDH2cLgHs0ulVtFjuBPRJDGA/C0BYP7x4M
	vSXVW4+++BybJsFY9qPAs87XmLAeV45T7N0oBVihAiVH01KQImn6+y3s0h08TMKBAF4ovHyD2q+
	nvpaFo5Cw4WRoE/wPdcRv+F5coE2a7Pb8/InynXAdfLpV8ksTZbryXNTy+tvAWbTzwt0=
X-Gm-Gg: ATEYQzyMu3eLR5iKwYMVvWCx+mGRSVZCKeFxw5QP8MReicUyVM0Ayx6OJHDyKengt3f
	H+wxYpRaUBYfchKfspWJMAPECLiW2MQRCWt80D25biYyi9+zkao/WGhYLYhOo3/++7vwFFEIuIt
	EMIRuNwHndCd5oFhxza+awPkzxGaFQuJ7t3hpSc9sm1IkMBcgQLpTKrRUsFB8emNKXgX4ABtE3i
	NdGcGIdU6Cy1BvCdvlI/AOo+4HzQKaGyYvxgiVDKNJ3fXoEOynGn03G6eH3U0z7t/SNU2AGRJJ2
	uMtu7RZKb1RDnpjc2RcufCdNWwn28fEJpVq9ieNTzt7EyfHz68KKmWTFDKEdlHMIgBCNHLMckxx
	bHQ5md9lS703aMG2b/ow5HS278jEmzBEJTgawrYK2DlLtDrkjPn72
X-Received: by 2002:a17:903:283:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2b0827be4bfmr68664015ad.3.1774263626692;
        Mon, 23 Mar 2026 04:00:26 -0700 (PDT)
X-Received: by 2002:a17:903:283:b0:2b0:606b:6fc5 with SMTP id d9443c01a7336-2b0827be4bfmr68663785ad.3.1774263626190;
        Mon, 23 Mar 2026 04:00:26 -0700 (PDT)
Received: from hu-sartgarg-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b083516908sm134571075ad.1.2026.03.23.04.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 04:00:25 -0700 (PDT)
From: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, quic_nguyenb@quicinc.com,
        quic_rampraka@quicinc.com, quic_pragalla@quicinc.com,
        quic_sayalil@quicinc.com, quic_nitirawa@quicinc.com,
        quic_bhaskarv@quicinc.com, kernel@oss.qualcomm.com,
        Sarthak Garg <sarthak.garg@oss.qualcomm.com>
Subject: [PATCH] arm64: dts: qcom: purwa-iot-evk: Add SDC2 node for purwa iot evk board
Date: Mon, 23 Mar 2026 16:30:17 +0530
Message-Id: <20260323110017.2527956-1-sarthak.garg@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CYYFJbrl c=1 sm=1 tr=0 ts=69c11d4b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ZtXvRwAlPpC7nlbJvkEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzIzMDA4NSBTYWx0ZWRfX0f7icYbXF8o1
 I8PvG7A9osIaadk2+tXClDxPm0qXoAAifkMQN3lddsYKyxuNNdzDn/19Vswdrs5LJiZT8bdDisy
 NwwjjSpTgwu14O59EtSJsH41fCyhkI0T3G+2+InzXeRpQw/BFP/DVQbmt+F9/gm99Ub7wOtuF7K
 8CRDOJFqSZOZ1U0GLPAJLWgeQfGlluBhnpVPPcMrKQJKunglM94Db+2vz3tjbpse+NMg07eJibc
 vzRVsM1AqaQs9pE2U+1Qep0dLTbREyNeUbc/lDdCF2E7ARxZUEaG17aSRD6NrKvYWQ3nMo4qcoF
 Xa8/Fr7eYfgzbyFmbtLLJ/uAwsHikwrJIUvPDjnMOSZbJqdYT9weWW4YDBC+ir0GwQXXfZIAUGd
 vSnqFdTgvbdsUJarYypHxMdi3Fs7TQeW5hbQFpmvLiXphifHcVcDWlCpOoPao4+qCU2i2Ha7Mwm
 mJZGFDq+iHibXlioX5Q==
X-Proofpoint-GUID: qMWwok8kX10-IW5771uDv5YmwI4s936G
X-Proofpoint-ORIG-GUID: qMWwok8kX10-IW5771uDv5YmwI4s936G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-23_03,2026-03-20_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 spamscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603230085
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-99211-lists,linux-arm-msm=lfdr.de];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sarthak.garg@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 132F62F0EE1
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Enable SD Card host controller for purwa iot evk board.

Signed-off-by: Sarthak Garg <sarthak.garg@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/purwa-iot-evk.dts | 23 ++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
index fe539b1f4567..2c1fdded5672 100644
--- a/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
+++ b/arch/arm64/boot/dts/qcom/purwa-iot-evk.dts
@@ -1180,6 +1180,22 @@ &pmk8550_pwm {
 	status = "okay";
 };
 
+&sdhc_2 {
+	cd-gpios = <&tlmm 71 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vreg_l9b_2p9>;
+	vqmmc-supply = <&vreg_l6b_1p8>;
+
+	no-sdio;
+	no-mmc;
+
+	pinctrl-0 = <&sdc2_default &sdc2_card_det_n>;
+	pinctrl-1 = <&sdc2_sleep &sdc2_card_det_n>;
+	pinctrl-names = "default", "sleep";
+
+	status = "okay";
+};
+
 &smb2360_0 {
 	status = "okay";
 };
@@ -1362,6 +1378,13 @@ rtmr2_default: rtmr2-reset-n-active-state {
 		bias-disable;
 	};
 
+	sdc2_card_det_n: sd-card-det-n-state {
+		pins = "gpio71";
+		function = "gpio";
+		drive-strength = <2>;
+		bias-pull-up;
+	};
+
 	usb1_pwr_1p15_reg_en: usb1-pwr-1p15-reg-en-state {
 		pins = "gpio188";
 		function = "gpio";
-- 
2.34.1


