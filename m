Return-Path: <linux-arm-msm+bounces-117395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id v5drCEdOTWr6xwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117395-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:06:47 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id A81D071EE08
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:06:46 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=BjXV7w1c;
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117395-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117395-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 793673110114
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:01:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 77B303DC4DE;
	Tue,  7 Jul 2026 19:01:32 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67139FCD8;
	Tue,  7 Jul 2026 19:01:30 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450892; cv=none; b=eYLSJRw/cLCI8lCVxvo0SlCc6Hh/JMVn8i8T4snhnESZeECLuUgV1JV2txjro6ZhyXuafNuL7QkexBTm1CUvX2f3Ejn7zICV3p+IwyHbJGDTOCXge1cZyxQoN38J6Dkiiw4eoT9fl0BxsjyVefHco2OAVU3D+j/8ThFJbOVjhkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450892; c=relaxed/simple;
	bh=QTO7/z1UTFgfd1kFQz7bvCz/p+Zqj5fGSY7vGrgvb3A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ls2ukTTtJ+27kJ2KZDykEvlANDdJVPWKEhqydhA5OsAQof0lfui2lq76vonHw9r2d3s4AachgcS5ddto3qEKDRQHR5TwmligUUCCVRgnTUd4cnsb7UL5/ETXWQmcEQIFfb3zVy0+uKIT2s0YceJZle4zgaBQZzSb+Wo9quEchzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BjXV7w1c; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT7jh017879;
	Tue, 7 Jul 2026 19:01:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QSLWIvI2DtL
	AJp+7tyUX2kU7dgM0KtY5shIBkJ98FgE=; b=BjXV7w1cTY9biSUVPCvq/psdryB
	1YG6Ym5SlWkt+UVk3zKelWpQHdADKsfiSABe8o7mxQhs/Wt2wMdBfC1GysU2b+CN
	T/nfXu6eOZZSQHJL6ukOMPs2DYQPsAHOYmiXUcCb7NrmqREXotFEBmurfhBUnmZE
	hItrntdcWz1gIEq2bAGPqVpd6/ua6wFd3icsgjQlIocEOqJ1E1+4jmG6kz5jOgPq
	TzN90f72N3POA5SIWCFj2ImGjFUOSSIR+ubpdq5XCCkAoYwWCfiCuOpGarOTeyRM
	HMNpjYlyxYrWFHhkixH8E51QviDNHyMy0/PNqZm4hH7rdnFsJi0BzBsGELg==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8wep2vr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:13 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 667J1AMo019107;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k6b45-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 667J192x019081;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 667J19RC019077
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id B4AE5640; Wed,  8 Jul 2026 00:31:08 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v3 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Wed,  8 Jul 2026 00:31:03 +0530
Message-Id: <20260707190106.2876465-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260707190106.2876465-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-GUID: lCMOG9ki3dFExpXQ7vor6QEDpUnzvzjA
X-Proofpoint-ORIG-GUID: lCMOG9ki3dFExpXQ7vor6QEDpUnzvzjA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX92wY/Hh94wxC
 ZBRVvna4MEjy34XXpelD1UgjMoX1svAjrnYJdGz7ipaSImGbVXe0Fgqsz1EF7gewKs6dO43y/cB
 8buqHhUOd0YXhytbMMohffuq6IpXI5eykONJDGVh/4Z/bvv2jOrD/fm6UVf56iqrATUWK/KixrX
 haZREHcMucsy/WdrJY0Lgo9j9EAe/dKfuwQnzAcYvc6UD/PgM9VqmJit0bw8KRXvUQtE/XEiEQo
 7h34TrV49rtOt+FKcX9wn4082yIqF2I78nawLCUswXs5AGmX1tVtoFYyrDC3j6d7Svge3ohFap5
 juNvGb8SfUCEFVJjw/WsfDQyQZfJPFfd7HqUktKkVJZr/w4a3ZJZ8jmFecLNCC9LXKThPYMtfUD
 dLpivhhETxt7v7ZuDVlOqC4jl+7zB8mt4WlSJXEOv+0GNwMeydHKHLHyDp2hPAsEe6zXKqQRIvN
 FT/llwFWjoKAc0SPH2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX4R8uXgzeEMlG
 jghfIPZL4iYbelAevzdIPX0jinB/kwtL9Dl9cn3JP+K1wiR5sNLWi3s2vGA1rcl+qna4pHzw5XW
 7x1sEHEbtx+lBip48zRaedMJSmy8uHo=
X-Authority-Analysis: v=2.4 cv=atSCzyZV c=1 sm=1 tr=0 ts=6a4d4cf9 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=CMnRxhekojnJuyglMZYA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070186
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117395-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[prasad.kumpatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A81D071EE08

Add the q6prm clock table entries and internal DSP clock IDs for LPASS
Audio IF backend clocks.

The public binding IDs map to q6prm DSP clock IDs starting at 0x500 for
Audio IF0 IBIT/EBIT. Add the internal definitions and register all Audio
IF IBIT and EBIT clocks so machine drivers can request them through the
APM clock controller.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6prm-clocks.c | 28 ++++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/q6prm.h        | 29 +++++++++++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6prm-clocks.c b/sound/soc/qcom/qdsp6/q6prm-clocks.c
index 51b131fa9..b04b66237 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -64,6 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF1_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF1_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF2_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF2_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF3_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF3_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF4_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF4_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF5_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF5_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF6_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF6_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF7_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF7_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF8_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF8_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF9_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF9_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF10_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF10_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF11_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF11_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF12_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_INTF12_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_VA_INTF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index 7b751486c..21f6fb913 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -98,6 +98,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
+#define Q6PRM_LPASS_CLK_ID_INTF0_IBIT		0x500
+#define Q6PRM_LPASS_CLK_ID_INTF0_EBIT		0x501
+#define Q6PRM_LPASS_CLK_ID_INTF1_IBIT		0x502
+#define Q6PRM_LPASS_CLK_ID_INTF1_EBIT		0x503
+#define Q6PRM_LPASS_CLK_ID_INTF2_IBIT		0x504
+#define Q6PRM_LPASS_CLK_ID_INTF2_EBIT		0x505
+#define Q6PRM_LPASS_CLK_ID_INTF3_IBIT		0x506
+#define Q6PRM_LPASS_CLK_ID_INTF3_EBIT		0x507
+#define Q6PRM_LPASS_CLK_ID_INTF4_IBIT		0x508
+#define Q6PRM_LPASS_CLK_ID_INTF4_EBIT		0x509
+#define Q6PRM_LPASS_CLK_ID_INTF5_IBIT		0x50A
+#define Q6PRM_LPASS_CLK_ID_INTF5_EBIT		0x50B
+#define Q6PRM_LPASS_CLK_ID_INTF6_IBIT		0x50C
+#define Q6PRM_LPASS_CLK_ID_INTF6_EBIT		0x50D
+#define Q6PRM_LPASS_CLK_ID_INTF7_IBIT		0x50E
+#define Q6PRM_LPASS_CLK_ID_INTF7_EBIT		0x50F
+#define Q6PRM_LPASS_CLK_ID_INTF8_IBIT		0x510
+#define Q6PRM_LPASS_CLK_ID_INTF8_EBIT		0x511
+#define Q6PRM_LPASS_CLK_ID_INTF9_IBIT		0x512
+#define Q6PRM_LPASS_CLK_ID_INTF9_EBIT		0x513
+#define Q6PRM_LPASS_CLK_ID_INTF10_IBIT		0x514
+#define Q6PRM_LPASS_CLK_ID_INTF10_EBIT		0x515
+#define Q6PRM_LPASS_CLK_ID_INTF11_IBIT		0x516
+#define Q6PRM_LPASS_CLK_ID_INTF11_EBIT		0x517
+#define Q6PRM_LPASS_CLK_ID_INTF12_IBIT		0x518
+#define Q6PRM_LPASS_CLK_ID_INTF12_EBIT		0x519
+#define Q6PRM_LPASS_CLK_ID_VA_INTF0_IBIT		0x550
+#define Q6PRM_LPASS_CLK_ID_VA_INTF0_EBIT		0x551
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.34.1


