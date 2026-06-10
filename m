Return-Path: <linux-arm-msm+bounces-112513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id lTbnBW6LKWp7ZAMAu9opvQ
	(envelope-from <linux-arm-msm+bounces-112513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:06:06 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id E227466B28B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 18:06:05 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b="pk1VB5/h";
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-112513-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-112513-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 136983275D6C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Jun 2026 15:51:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5529A47DD63;
	Wed, 10 Jun 2026 15:45:51 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32A23DDDBD;
	Wed, 10 Jun 2026 15:45:49 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781106351; cv=none; b=IrzTCgHNkhkaXEfrRUERZob2uRB3a4I5IlOAuujU2gsiATCcNVvvelMY3Chx/hztsdNWkBKml+v5GvXSHuIcUNdDA0JCDdgcvyrNSMJOOIp1aInZZeFSI88o00ebgLhcLXEysZ+MHkTR8TMzY7lC929wbquxXbO20Xa+DaEU+Ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781106351; c=relaxed/simple;
	bh=8HqqgLPkWeQVtmg+MS/rk8VfhqmZy8QFS944gT3C6rI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NQK29+YifJSQs/E7mhC0HD9RmVb+NSw1jF7GuZRPT+tPU18nxGHl+sgz4A61uwUXs5uNRvh1lebHjkrI75nWUJFn8sKOhsBmJlgpa6RccdxBTbECOEJJba260zwF+cWPbvnx23ZCjpPpgqfmxwKmVUFzacQlNahJi6DtbbKkAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pk1VB5/h; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65ACBeo71137390;
	Wed, 10 Jun 2026 15:45:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+NN/ou4LRYf
	enaqjVMkcC/pmtmn5RBW0prMObg/VLrQ=; b=pk1VB5/hwP6lysjGzmucAqdWGaH
	L2kP4mEzRtkxF5x0L28POBzKsBYoULg2AmEQRwTcGhWBPS2T2tQTKJqJPKTVi604
	toMl4bG7/P+/z+3KN/gz/sTT/CbisXVV8w06yOeJyCh5vEIRuBd/v/j/AF61052x
	qUzpm0CkG87EwIIeMBESrfDrQ/dVE/g0iX0EXXs+pvAuAR7EoPKnmqNNq8QDXE1N
	5wVh0eGR9djIFSKK8xH7J9SawvL8Zv1Yfm/l1pKCoU9NvJHt1JiaeEI9fqshDn4I
	4h/4BLFsWeuKFGBGK9ePiB/QTEYkZve7OG5vBRcBQsnDkUCyQz+HI7X24VA==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4epwnh3cq7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:36 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65AFjWVh003511;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4emcmk7fwv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65AFjWdB003482;
	Wed, 10 Jun 2026 15:45:32 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65AFjWbL003479
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jun 2026 15:45:32 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 755DA637; Wed, 10 Jun 2026 21:15:31 +0530 (+0530)
From: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Srinivas Kandagatla <srini@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
Subject: [PATCH v1 3/6] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Wed, 10 Jun 2026 21:15:14 +0530
Message-Id: <20260610154517.134570-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjEwMDE0OSBTYWx0ZWRfX3ohKW6b+b4l2
 aHc+AFkDfxpo3fb5PaAnvLfEFfPK3ZcE7qlaa/qq95rMTEZR8xc0FYHjB9gpTicBq5WNcH3bdpc
 ynENwlNwrNZQKYAe2xR47qZ8Ak2phSlhdE5L+ze4nzS+h0xgS/fIpTouJhKytUwHjUoN0+hirri
 c52JJun3KMwL4cm+UaBVbQVB6Ync3HzwjhQ6MCOJ+0bZQMQLrfRRkkcbh6CapBl6eSlH7g8AJmq
 CdSaLms9qG1dAfvqPCCPrqsHGDRSPvZ37BrwtLtVu41wARs+L9qJxf3Vh+qo8yZ6YHUzW8H7C3f
 gUUWn2b6FFAagWu7i7LV0lVzYiWyCgd8xpd13zTRH+9rxJdPG/yEOvyPj8T9EsSGiNhGAyW6qKP
 ui0EoOzDP4e0brhU1wzcFb9RN4mtPeHxtRzR+nuNd7s/bpfUp/jP41Zn4lDaQ9jYCw8Hq9limtp
 HxEHqh0ZxGmo7iCJj+Q==
X-Authority-Analysis: v=2.4 cv=Xce5Co55 c=1 sm=1 tr=0 ts=6a2986a1 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=c7mLAEsDfJ1tomV-q_4A:9
X-Proofpoint-ORIG-GUID: Mon5rI9aGBSoVntNKmq59Ywpw5eQ8PWo
X-Proofpoint-GUID: Mon5rI9aGBSoVntNKmq59Ywpw5eQ8PWo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-10_03,2026-06-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 bulkscore=0 spamscore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-112513-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,sto.lore.kernel.org:rdns,sto.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: E227466B28B

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4..bc860fcbf 100644
--- a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
+++ b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
@@ -233,6 +233,63 @@
 /* Clock ID for RX CORE MCLK2 2X  MCLK */
 #define LPASS_CLK_ID_RX_CORE_MCLK2_2X_MCLK	70
 
+/** Clock ID of the Audio Intf 0 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF0_IBIT 71
+/** Clock ID of the Audio Intf 0 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF0_EBIT 72
+/** Clock ID of the Audio Intf 1 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF1_IBIT 73
+/** Clock ID of the Audio Intf 1 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF1_EBIT 74
+/** Clock ID of the Audio Intf 2 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF2_IBIT 75
+/** Clock ID of the Audio Intf 2 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF2_EBIT 76
+/** Clock ID of the Audio Intf 3 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF3_IBIT 77
+/** Clock ID of the Audio Intf 3 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF3_EBIT 78
+/** Clock ID of the Audio Intf 4 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF4_IBIT 79
+/** Clock ID of the Audio Intf 4 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF4_EBIT 80
+/** Clock ID of the Audio Intf 5 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF5_IBIT 81
+/** Clock ID of the Audio Intf 5 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF5_EBIT 82
+/** Clock ID of the Audio Intf 6 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF6_IBIT 83
+/** Clock ID of the Audio Intf 6 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF6_EBIT 84
+/** Clock ID of the Audio Intf 7 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF7_IBIT 85
+/** Clock ID of the Audio Intf 7 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF7_EBIT 86
+/** Clock ID of the Audio Intf 8 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF8_IBIT 87
+/** Clock ID of the Audio Intf 8 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF8_EBIT 88
+/** Clock ID of the Audio Intf 9 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF9_IBIT 89
+/** Clock ID of the Audio Intf 9 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF9_EBIT 90
+/** Clock ID of the Audio Intf 10 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF10_IBIT 91
+/** Clock ID of the Audio Intf 10 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF10_EBIT 92
+/** Clock ID of the Audio Intf 11 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF11_IBIT 93
+/** Clock ID of the Audio Intf 11 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF11_EBIT 94
+/** Clock ID of the Audio Intf 12 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_INTF12_IBIT 95
+/** Clock ID of the Audio Intf 12 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_INTF12_EBIT 96
+/** Clock ID of the Audio VA Intf 0 internal bit clock (IBIT). */
+#define LPASS_CLK_ID_AUD_VA_INTF0_IBIT 97
+/** Clock ID of the Audio VA Intf 0 external bit clock (EBIT). */
+#define LPASS_CLK_ID_AUD_VA_INTF0_EBIT 98
+
 #define LPASS_HW_AVTIMER_VOTE		101
 #define LPASS_HW_MACRO_VOTE		102
 #define LPASS_HW_DCODEC_VOTE		103
-- 
2.34.1


