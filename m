Return-Path: <linux-arm-msm+bounces-117389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 7mkcAQxNTWp9xwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-117389-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:01:32 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5C371ECD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 07 Jul 2026 21:01:31 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pN/gkkKs";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-117389-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-117389-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id DCC3D3017468
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jul 2026 19:01:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E7B973A2540;
	Tue,  7 Jul 2026 19:01:28 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636E635E1B6;
	Tue,  7 Jul 2026 19:01:27 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783450888; cv=none; b=I1M034LktDwQ0iLCZD+6esz64k0nuTWZYIaRNr4MpcOCVospx5vHiyNbf6ZGW87a2r1PfDA/n0X4GbUvTKK/bA+d1hdXV+6cTYt18H/VJ+mx57JisdqHNb/4+iGuTSr8M1C9ZXFo1xX088rmCv3yuAI6TgBf21Rt5TFyABVTzfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783450888; c=relaxed/simple;
	bh=1aZGy/ON5urdDf3PvGJfiadOe9AdbOgQ45NOgkAYzWI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bCJhLLmPITci4mwdumtOmzt0Jwk2cfPa0B3dqGqZBNWqke9iScfwKI3CpfXs4XKCvlJowlmr0C1OE9BpoeOO7vv8yhXL68XaDHroJT2NhIhhX4ZktE90HqnNUz1ZRGOve9N3ipGort8Myg7ohobWX+wDTRueiQhdPp+yGqDeKu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pN/gkkKs; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667FT2YG4073513;
	Tue, 7 Jul 2026 19:01:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=St1Nsfm0mSu
	1CcCTNvSLJT4eeUotIaN9NCqzzDA5trg=; b=pN/gkkKsHvU/Mpx20qCLL49oO1S
	1rqF6temAQFZfn/kuPh6LGYUkUpgBhbV9ek8C08CJv2zxcGnDJbBL+32xw54Vn+R
	gjxP4ohiimbcoTSrOrSRz1ti3HCeZezd144O2X4TxP4qyT00sBHmLhITF/539JVU
	XRySvoxa5jphIBgVaC9AkJvwoWswfcXmvGBQCuXTkQz9u11zAeDcPERNN6cbLTpw
	2HedXI0MDWm4rwa9vVgJClyaecA67T1IRHpAaNUQVfWPx5Wmzkui/2x4zd4echAV
	p0XDRGIYAdngxi8gzJK/LV5z9KmYC5pY+ZhYklnBzh6ctzrDJ0VWMXJkKYQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8vun3024-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 667J1AUw019106;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f6u8k6b44-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:10 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 667J19Z5019083;
	Tue, 7 Jul 2026 19:01:10 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 667J19P0019074
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 Jul 2026 19:01:09 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id B01BD63F; Wed,  8 Jul 2026 00:31:08 +0530 (+0530)
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
Subject: [PATCH v3 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Wed,  8 Jul 2026 00:31:02 +0530
Message-Id: <20260707190106.2876465-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX16iLI7Qb9B6y
 oiP3qCzNHlgUfzvBfkiVCJ2DsjTEfxCgRFVPn9bhZrxfenI3522jwaEqfU+zgN90BKkxnpb6hUN
 +xvLjFI4JVsv+PyGbeaRI2EXuTJaX34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDE4NiBTYWx0ZWRfX4WkvyMDUkvbO
 FVGc+zrcTFl81AD4G5KK5SjJ4QKsyjJLZ5MTnZP2AXzxOjM5r5/TeVMkuxsbQYRBaybIdWtUofh
 G+Do2cQ1aTARE/W6FSffncKpNxhrlsZhWdONwWRSt/wpfRzhu0cs6I/II6W/ZPqdbkG3qCGroaM
 UUky9RlebgTkBpaICWvllTmuPiJWHqpbTsAyYXzdYfukA92iFC22341+pSBPtQngbeJiQVQHXF0
 f9mUfv+CWpy42wdVAF3NXA5Sa88vMJ2I/SRI4eXD+4hJlWtgPe3Mb/9nrGVrEsu8v7ySI8/HbkR
 K4BJBsiUhNkOIQj5OGzOtJW2yMdEc62gSEqtcm6d9JuA2H0yMzT6wojEuOsuUExhme9j5sgpNDU
 KAZBZ5xy0vBdeCt156Ypc9ip7F8Fy9qn8TggaIb2lCah4iBz2gCTq3kE9elYzThrBOVH/79YTbX
 /KrD9+xOJOMg1gEDyPg==
X-Proofpoint-GUID: p8RyhJO_cW3IiW4t_J1xZd1UxZOIt2KV
X-Authority-Analysis: v=2.4 cv=N+IZ0W9B c=1 sm=1 tr=0 ts=6a4d4cfa cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=HqMH4ZOH3FVCEH9kUM0A:9
X-Proofpoint-ORIG-GUID: p8RyhJO_cW3IiW4t_J1xZd1UxZOIt2KV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_04,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
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
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-117389-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 7F5C371ECD7

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..a3aea029c 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -233,6 +233,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
+#define LPASS_CLK_ID_INTF0_IBIT		71
+#define LPASS_CLK_ID_INTF0_EBIT		72
+#define LPASS_CLK_ID_INTF1_IBIT		73
+#define LPASS_CLK_ID_INTF1_EBIT		74
+#define LPASS_CLK_ID_INTF2_IBIT		75
+#define LPASS_CLK_ID_INTF2_EBIT		76
+#define LPASS_CLK_ID_INTF3_IBIT		77
+#define LPASS_CLK_ID_INTF3_EBIT		78
+#define LPASS_CLK_ID_INTF4_IBIT		79
+#define LPASS_CLK_ID_INTF4_EBIT		80
+#define LPASS_CLK_ID_INTF5_IBIT		81
+#define LPASS_CLK_ID_INTF5_EBIT		82
+#define LPASS_CLK_ID_INTF6_IBIT		83
+#define LPASS_CLK_ID_INTF6_EBIT		84
+#define LPASS_CLK_ID_INTF7_IBIT		85
+#define LPASS_CLK_ID_INTF7_EBIT		86
+#define LPASS_CLK_ID_INTF8_IBIT		87
+#define LPASS_CLK_ID_INTF8_EBIT		88
+#define LPASS_CLK_ID_INTF9_IBIT		89
+#define LPASS_CLK_ID_INTF9_EBIT		90
+#define LPASS_CLK_ID_INTF10_IBIT	91
+#define LPASS_CLK_ID_INTF10_EBIT	92
+#define LPASS_CLK_ID_INTF11_IBIT	93
+#define LPASS_CLK_ID_INTF11_EBIT	94
+#define LPASS_CLK_ID_INTF12_IBIT	95
+#define LPASS_CLK_ID_INTF12_EBIT	96
+#define LPASS_CLK_ID_VA_INTF0_IBIT	97
+#define LPASS_CLK_ID_VA_INTF0_EBIT	98
+
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
-- 
2.34.1


