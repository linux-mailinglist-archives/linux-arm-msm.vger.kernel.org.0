Return-Path: <linux-arm-msm+bounces-115339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id 6MciHxWMQ2pdbAoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115339-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:27:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F926E22AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:27:49 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="d/461mu+";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115339-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115339-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 66A46301DAEF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:20:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5E41F3839A9;
	Tue, 30 Jun 2026 09:20:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5EE732B132;
	Tue, 30 Jun 2026 09:20:32 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811234; cv=none; b=rYlt9Uw+ejnAaxGDMaMnzo3MrU0WsoozdUhuCFoVqJDTW4742EBPs5qkI9v3l4hVYqFObhUtoVE4BrUcMOiZ+l85bTT8u6Uy87MM/LpvYq+tt8QK37hcM3OszvmTlovjr7doybsINOROLDyFZiSc4oGtkBDVjDi5LllKoZkxin0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811234; c=relaxed/simple;
	bh=siF3hx+1KT/CodqWVFzOR1hh4X03EHH8Hmy6Xk94FRY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OLhptUZbPcsMxSkoKpOPByTgjzzbaDs+tkshuMpicHhxebWutpUwYOiRJE82ovFa5nAE0seBykBnUR5EhCuYrxVWtKow+MWmn10f/JspAIwrl+B4pBRecDUpijUA28Bovk0PytKIEPfo2513SCL/pELv7s+vUmsRXmSVuIEZeAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d/461mu+; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CNSm1073927;
	Tue, 30 Jun 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+BfcYJt5Zjt
	YK379G9o5JmpxmZHDHzrSzByFWP3BalM=; b=d/461mu+6pjRIuIIj3bcCiSBxCQ
	jhPCcLq9ovsg4EjfQzbmN20bQW7lYM8jM3Vpq/gYiHbOjsGY6FkvuAzxvILAcRW+
	z/UzzUZ7Y2c1Y0vu7tmRQrs+t5eQrQkYxfV4qMAmCK4meP2S86kiER8qXMhQxDQB
	NvowiUHKiwL0MO4af4i6b/YXtB9n5gDyl2+CAhFpvxZ0TRpQxJ93h7Inuj3EXj68
	Ym+Go1/sWLsX31ErXi7HgzFeSLHxCCjmTtZze44ijcHPPYFNNat+BygC4pT+dCAG
	dI+GccWCKsYgk8D0OUPA4OKfekvP4e54sLq8OpoGnzd1KOw1kOEbhxmZSNw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3y9k2p40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KIAg010624;
	Tue, 30 Jun 2026 09:20:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmep3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KHJV010596;
	Tue, 30 Jun 2026 09:20:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KHSU010581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 8CCE7638; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v2 4/7] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Tue, 30 Jun 2026 14:46:02 +0530
Message-Id: <20260630091605.4043426-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260630091605.4043426-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX7N0VZrfNkejU
 C1Z2UFZe2gj1D2SSQfSiaIvpFA/9zNXYW+vnnAppSS4vVFQCv4Dvl9yHMkyJh4/P5pCgVBpJjLN
 dnuqzFw4WhZWU0qUw8/Wz4ihIMm+d58=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX1P7B/VNgQwEG
 eetk57NkgHse9MyoUXMEgYRtyFi+mnEKvD9b97vG61c0p5MsgjKIKE/+yMBV2QRNfXrnDCulPB5
 F5OiOUr4FQy4viphQjd/Vmixxmoo8jjWgPSNCeDlEf+dJZSUHbSSfH1BPt37GldKN8Tn9FBqcaj
 Z/ndElj8O3vAsasyKLb7eexar5IPIZGwaCvjfTuAOH3pZPl5VtxF6/JyYJiPcUIn8MdFvqXuXcc
 uh3qkxUsyARcsn9C21ufZX5j8fOeNAjnWvTyG8zZj4yuXesJSRrK62KUjb0MyPmkKW2ng/ewSnq
 sTJ/Bdt3x2RvC/8b9BA50cRFMv+s7FwuTYJQqr6vCPpEkwV+BYam08IkBM1xJMDLnSJ2jW7US7b
 lFOFR7ox5Q/6ypuCbfnd7rdPOfl4VvTRQd6AH+kGtHw2dtUDZ0bhjcIFALS7wRimtmJ3zWrkEEu
 a/+iuW8DkrfEO22T65Q==
X-Proofpoint-ORIG-GUID: 4LKrfzzqOPYQJAdncEOy1Kzuh9yEAe3I
X-Authority-Analysis: v=2.4 cv=TeqmcxQh c=1 sm=1 tr=0 ts=6a438a55 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=CMnRxhekojnJuyglMZYA:9
X-Proofpoint-GUID: 4LKrfzzqOPYQJAdncEOy1Kzuh9yEAe3I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300083
X-Rspamd-Action: no action
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115339-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,vger.kernel.org:from_smtp];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 12F926E22AE

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
index 51b131fa9531..b04b66237c1b 100644
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
index 7b751486c12b..21f6fb9134c9 100644
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


