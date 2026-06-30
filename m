Return-Path: <linux-arm-msm+bounces-115345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id K/8sKRWLQ2qbawoAu9opvQ
	(envelope-from <linux-arm-msm+bounces-115345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:23:33 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 10CEE6E2186
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 11:23:33 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=XDvQQKnN;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-115345-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.105.105.114 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-115345-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id E826E306D271
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2026 09:21:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B0A3E833B;
	Tue, 30 Jun 2026 09:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EE583E7BB3;
	Tue, 30 Jun 2026 09:20:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811242; cv=none; b=PoZswa0gaR1lYvgdaXWfnBxzzXZT84aHHYW+JoKCArCvJk6kTU0Kmhnc3MRhzW7fGYi7hLNyL92SPWly3jv7t4AaUQaNyHKLlcLswrlvImMgAJkNKSDIQrSrB13UWYK6wiqwu0m49WkMl/YsHq0ifFrVUayCHsav/cnO4162Fy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811242; c=relaxed/simple;
	bh=vyYBrh+FVPvfYrm6AF8K0hCb4RPgAktRqKCkx8rOUxg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QaZF2IgzxghhkgBC2OwTUPj/E34mb2qBIIewe/qtp/0FhTPIR5lfu5hMvJu+wDH+K76cduTKxJ43zyh+Vp2F+NMyT7Qou7PdcP783/a0xjDi+dfYSIHg15jg7z8tYxoPjKIsJgIKB0fNcqoC8Q0+QTy+UxmYnKmWsPWJ6C/Urjo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XDvQQKnN; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U96cpe1502119;
	Tue, 30 Jun 2026 09:20:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=NKCxkavPHAb
	bO6wrQUMyZnMvIS68Q7PMSSBljnkYLEY=; b=XDvQQKnNiQgyvJItNVXU2qvKv7U
	5TVJrLCJM5EGgNR5v8qTTqP4CqE4wQPb7Lh+pf7My6bDp25izRv76bCF7A6Vf/dR
	oAuR3QcyVahQVNl+AdyG2XiZrntnTRkt+HlXZQI5F1lGZ1azgK/bIuc+xHr10+io
	wa5qKy0RiI+gEHmdYwCobnDZikLJiKIfEf6N5W5y4L8yxTnZ+5DpIz6t1KxS7uey
	67BSSiqnKs/GsvmmFeNNINlCqlH5nMGKCHZ6y4W/Ps4p7M3/Ay356cmx3/0wr6RF
	hXkFy+0gmqCjmEOpQ0Nx+xgeQ1d63P0PLiVjDHmS0G63gpeiq8I1WG7rUKQ==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4avpr2d5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:21 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 65U9KIwV010623;
	Tue, 30 Jun 2026 09:20:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4f27kjmep0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:18 +0000 (GMT)
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.18.1.12/8.18.1.12) with ESMTP id 65U9KHt9010595;
	Tue, 30 Jun 2026 09:20:17 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-pkumpatl-hyd.qualcomm.com [10.147.245.204])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 65U9KHLZ010584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jun 2026 09:20:17 +0000 (GMT)
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 3914174)
	id 88227636; Tue, 30 Jun 2026 14:50:16 +0530 (+0530)
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
Subject: [PATCH v2 3/7] dt-bindings: sound: qcom,q6dsp-lpass-ports: add Audio IF clocks
Date: Tue, 30 Jun 2026 14:46:01 +0530
Message-Id: <20260630091605.4043426-4-prasad.kumpatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: uw1qDMknmbTkkVJjlVkMjFWInHnifZgx
X-Authority-Analysis: v=2.4 cv=KqJ9H2WN c=1 sm=1 tr=0 ts=6a438a56 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=HqMH4ZOH3FVCEH9kUM0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX5/PbEhESsCnu
 fzkp+q51hKhIMu0S12kSPTxsdOzgC/Y7LWIqYBbGjrA5UmIdSPM5KvhtSeT9dSMNbh+y4Vx2WOS
 9t1+qgtGGbazAGiT0EqKpLX91vqYTSozc/F1rravN+7E0VDYcqHqbuQ8TgRVLQzvHXIoBv+ytvD
 nRjR1IQaYG04HoplJbEV2bqQK8Aeu+Iwt+dwGu774rbrFmdkNW1UD8jQLgsNAzQYn0Nzy2FxDrD
 ZXgr+ksqHcSTemAzWv8d1arQbIrdNjJAoqxK/fBila6wHyjxCeISYZnp3I+Fv14jNzc8pR3ovUG
 bnjfe6VQgA1yzf3DvU5T+w8XUBuh6NpKtzpCM07euTsZlcj4ovnB1ukNrMCMIXtMJCSKutHbcQO
 /pygMfofydMAs1g+U5KnBjCmqJitgvoFU/GKpNPjs7UgfNxlXKOwf2djg1od/dud7U6WaGi8x7g
 wygAzzz4FpbDentehzA==
X-Proofpoint-ORIG-GUID: uw1qDMknmbTkkVJjlVkMjFWInHnifZgx
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MyBTYWx0ZWRfX71KnNoDKykHP
 jtLiAbrHnqTuIfIP/GuwxHpbUl5GuPlB2dUfRhwDWv0YSPo8+RoD5f8mEVR9Am6xAlwGKN7OLzr
 jWXLREaVIN6EnBHGuka8CWskNn2BtRo=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 suspectscore=0 spamscore=0
 phishscore=0 bulkscore=0 impostorscore=0 priorityscore=1501 malwarescore=0
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-115345-lists,linux-arm-msm=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:dkim,qualcomm.com:email,vger.kernel.org:from_smtp,oss.qualcomm.com:mid,oss.qualcomm.com:from_mime,tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	RCVD_COUNT_SEVEN(0.00)[10]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 10CEE6E2186

Add the LPASS Audio IF clock IDs used by newer backend interfaces.

Platforms using Audio IF module backends request the interface bit
clocks through q6prm. Add the Audio IF IBIT and EBIT IDs to the binding
header so these clocks can be referenced from device trees.

Signed-off-by: Prasad Kumpatla <prasad.kumpatla@oss.qualcomm.com>
---
 .../sound/qcom,q6dsp-lpass-ports.h            | 29 +++++++++++++++++++
 1 file changed, 29 insertions(+)

diff --git a/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h b/include/dt-bindings/sound/qcom,q6dsp-lpass-ports.h
index 45850f2d4342..a3aea029cb97 100644
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


