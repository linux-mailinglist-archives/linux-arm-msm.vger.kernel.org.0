Return-Path: <linux-arm-msm+bounces-112514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id Fo8DATCQKWqXZgMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112514-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:24 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 566C066B742
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:26:23 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=p1hgzl2P;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112514-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c0a:e001:db::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112514-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 33C56343F218
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:52:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CAE31480DD5;
	Wed, 10 Jun 2026 15:45:52 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2527A47CC81;
	Wed, 10 Jun 2026 15:45:51 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106352; cv=none; b=Nl8zyQnUnAW7VY1kALsV1+jp+YUkh2R+or0+EBfVvmlwjpKyt2ihcXAo3DiPQvBxS9MkK2OClFlgQYOG8Lx5CKqvprY4jkHW6/prR3Vkg+qjaNZBkZ/U7GD+GZDv9BRrzV+oN4ziJGusTWUhQhBldbtxR2j8JMf6MjpO7D3yEmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106352; c=relaxed/simple;
	bh=uNsTsdweLdyk0cwg/iIKjNwftbw3eWw8Vlk2wDbEjao=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=j7PxLZHINKpn50nbZp2muQVf+2hr2md4yC8cUvLHf5mXLg2ovtwlRc9wwZ0VEB6EhwofLdguqfg2AR439V3lZmLoys3o9zP8+d+lQCmhVmAbSxglLpu5DPs6v4fk7/1Z0jXdqTovAuDvj13WEKiL4kBSHknRdKwhzUJK12ODL/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=p1hgzl2P; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBgA31138091;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xXrXvr1IHYg
	Cf4Ein6I5ULpQrpDgIgG9VaYJflL/K18=; b=p1hgzl2PKN0Rkjr0j7V5fl9dgSx
	5RUk2UQPLlqpWtwkGkhYOVIAjZJ1S9etWUcfwNEkJl7ooaNoJexB7g93KqOWm1R9
	uV5ev50RbtWny0k94CHFmk180ldkT4pHoQEfUYkT7jZXAbsw3FzRriTDfnfsZ6Uo
	CAe91uwmM7/XtuRQ3Sx/W7bHbGwmFY9AHLp35vK55hRtNJkuYKYZS67y11bUfk1+
	DczmueV9CMoqGrbqpHQpOPKJYFaAbcGSNq1VZhZZoSzrPlhNvg4DNyegYghjYF6M
	Yw5B5Y6OkSWPLrFlKlxwK++VKnZByvev5T85U4OHqAYh09XrTZLoHUC+i1w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwr2kaps-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjWvl003512;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fww-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWAD003483;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjWvb003478
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 79896638; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 4/6] ASoC: qcom: q6prm: add Audio IF clock IDs
Date: Wed, 10 Jun 2026 21:15:15 +0530
Message-Id: <20260610154517.134570-5-prasad.kumpatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
References: <20260610154517.134570-1-prasad.kumpatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Authority-Analysis: v=2.4 cv=Gu1yPE1C c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=lFrHCqQP30YjRFDurIEA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX5GpnYZx7B7Sk
 aYDRPz/MoG5piCxxOG7f3/w665RxhEBuoBSCeFkMT/CBSnYelUUcUM8HAIlEI+CDZdi27zUWyuW
 ltubulYkRTyor3rbFdfZYEqltySZNdq1qF/nZNNvWp7LcTmOwsd/UOu6g/cgaBOBlvcZgKXH8xU
 Xq61axbydjoF50uYTXAZhsIBgam8g7JTj+dx46XuLqCvlAC0bEnsr1XhNdEKAsZJ+FqBE/FTtDt
 oRP7qibR4IHcwrhuRRL1D32xsGfPS/5kYDcdrpAob/v6W4uvkdNkWhCfg3Alcw72/+qdyiqDlo4
 R6Q+sKj0soq9QTEzCFLKLBwcFR3GvX4tVyAMQ7NMRZq+vfPyeO46pzOkM4DZTPgOqahOUAQ3xYm
 FolER4jM23h6/AyPaybT7wGnllnJHLewABKmIGXdp29y9+efwWke80vL71tQHDeueS6q3Co4JQo
 qCKhf6ZPE9tLM09GLHA==
X-Proofpoint-ORIG-GUID: WYqo60OWPxy1Vci1AJSUiCL14oVr3_Wv
X-Proofpoint-GUID: WYqo60OWPxy1Vci1AJSUiCL14oVr3_Wv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 adultscore=0
 clxscore=1011 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606100149
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
	TAGGED_FROM(0.00)[bounces-112514-lists,linux-arm-msm=lfdr.de];
	RCPT_COUNT_TWELVE(0.00)[13];
	FREEMAIL_TO(0.00)[gmail.com,kernel.org,perex.cz,suse.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:lgirdwood@gmail.com,m:broonie@kernel.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:perex@perex.cz,m:tiwai@suse.com,m:srini@kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-sound@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:prasad.kumpatla@oss.qualcomm.com,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 566C066B742

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
index 51b131fa9..b6755da6a 100644
--- a/sound/soc/qcom/qdsp6/q6prm-clocks.c
+++ b/sound/soc/qcom/qdsp6/q6prm-clocks.c
@@ -64,6 +64,34 @@ static const struct q6dsp_clk_init q6prm_clks[] = {
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_WSA2_CORE_TX_2X_MCLK),
 	Q6PRM_CLK(LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF0_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF1_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF1_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF2_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF2_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF3_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF3_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF4_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF4_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF5_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF5_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF6_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF6_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF7_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF7_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF8_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF8_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF9_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF9_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF10_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF10_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF11_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF11_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF12_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_INTF12_EBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_VA_INTF0_IBIT),
+	Q6PRM_CLK(LPASS_CLK_ID_AUD_VA_INTF0_EBIT),
 	Q6DSP_VOTE_CLK(LPASS_HW_MACRO_VOTE, Q6PRM_HW_CORE_ID_LPASS,
 		       "LPASS_HW_MACRO"),
 	Q6DSP_VOTE_CLK(LPASS_HW_DCODEC_VOTE, Q6PRM_HW_CORE_ID_DCODEC,
diff --git a/sound/soc/qcom/qdsp6/q6prm.h b/sound/soc/qcom/qdsp6/q6prm.h
index 7b751486c..c1838d80c 100644
--- a/sound/soc/qcom/qdsp6/q6prm.h
+++ b/sound/soc/qcom/qdsp6/q6prm.h
@@ -98,6 +98,35 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define Q6PRM_LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK 0x318
 
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF0_IBIT		0x500
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF0_EBIT		0x501
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF1_IBIT		0x502
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF1_EBIT		0x503
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF2_IBIT		0x504
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF2_EBIT		0x505
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF3_IBIT		0x506
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF3_EBIT		0x507
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF4_IBIT		0x508
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF4_EBIT		0x509
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF5_IBIT		0x50A
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF5_EBIT		0x50B
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF6_IBIT		0x50C
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF6_EBIT		0x50D
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF7_IBIT		0x50E
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF7_EBIT		0x50F
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF8_IBIT		0x510
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF8_EBIT		0x511
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF9_IBIT		0x512
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF9_EBIT		0x513
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF10_IBIT		0x514
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF10_EBIT		0x515
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF11_IBIT		0x516
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF11_EBIT		0x517
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF12_IBIT		0x518
+#define Q6PRM_LPASS_CLK_ID_AUD_INTF12_EBIT		0x519
+#define Q6PRM_LPASS_CLK_ID_AUD_VA_INTF0_IBIT		0x550
+#define Q6PRM_LPASS_CLK_ID_AUD_VA_INTF0_EBIT		0x551
+
 #define Q6PRM_LPASS_CLK_SRC_INTERNAL	1
 #define Q6PRM_LPASS_CLK_ROOT_DEFAULT	0
 #define Q6PRM_HW_CORE_ID_LPASS		1
-- 
2.34.1


