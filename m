Return-Path: <linux-arm-msm+bounces-111346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id N3kINYyZImrtagEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:40:28 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547B2646EF9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 11:40:28 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=TRD1+2CJ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111346-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111346-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 8AB343050125
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 09:28:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DDB9F4192F6;
	Fri,  5 Jun 2026 09:28:27 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8DF4192EA;
	Fri,  5 Jun 2026 09:28:26 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780651707; cv=none; b=eTSUgfOK20nyrQwCbBToBuLUbB3FDb4YAqvzGJBPJ2CctQBO3YJzbRYWtLpdF08C21wE55PUhN9qSn90FKV1OpNcrcL0QB9uA/vkrALJdIlFXNNiTZrF8ausSwVAxDPgBufnQbBVRcEM/hXDZ3fXWZpbHDsOQ2WBfeq31JSJaOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780651707; c=relaxed/simple;
	bh=nF1bRL+0i+sdOb4OP2N9xnfU/mirbjvsHliu1OlK+mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nrK67N5J4goPDywph1TFBb1XwdrF9SqkyGmT8HvLT6eyVLUWoryDwyxixCWBktJ3T5gOOzk4W5OiKrN9A7ZH64LpvdJ5H9youXezetDuEuRds1KV2ifr8wa+M80zzKlERL9lY+00CzMI7xXOipNmQBUkisWYA2m4GhvdPwyxSWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TRD1+2CJ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655757PK3529092;
	Fri, 5 Jun 2026 09:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkfnQ/nPGko
	XdiZ9aGhJnWQ3C2t7kl778gfFKiG53m0=; b=TRD1+2CJRW7h9DikViofCGRvPDz
	jG6U0VQ8tM2mgF3xdrTg06eXOpd/fTkxT4rRAUTVwvFuhnnR5gMa7HRl3fW8ZeDU
	k2vsRdKiHD7e59DiqQhStzFExLhUZegsohsT6XDJPv6eAItKvZ1BnrNAhqy2dr47
	diRGEQmO0Br91T/7oSVIRqELxQUXDKLu4FhsbNR7F6o5mSxwGihdqvIW9jQjilab
	eiW8tMi0fP7dJJLYWS8LWZlX1AFhFlWxa2NTnge5mafFG+r5yMjpUgEBm7s3+a9q
	tTOvLtXkuFpyzzyg6hudYmo+Vkdrc8Dte1fiYyZzKp4HET21tuVLwV1Ps/w==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eksrp8hpf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 09:28:23 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA02.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 6559SFKB004866;
	Fri, 5 Jun 2026 09:28:20 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] ASoC: qcom: lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper
Date: Fri,  5 Jun 2026 14:58:12 +0530
Message-Id: <20260605092812.3495852-3-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
References: <20260605092812.3495852-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: rp6NMYJ0jFYm2hTWmaOG-LAdZF1iEqiE
X-Proofpoint-ORIG-GUID: rp6NMYJ0jFYm2hTWmaOG-LAdZF1iEqiE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDA5MSBTYWx0ZWRfX1lgyItRhPDln
 qSQk7K+jCX4xIDT1DqnkBH9DVrWKDVl4qowbYE1D/TXqH8ligYdXrLO/UgoFErDy9AToMy5cNwQ
 CVf+Fxklh/W5hQfQDty9C/qnUIU7XlArv0GNdikGQbxvsI915S3jtfIAoMdV3v8lc396fWKbpvu
 sIgyFGp1mczRPgBFfBB7RzQVrfQ9y6Z/MSMRSWACqHHiEt34vxz+htIJ3/ps8WIDvlHQH8zII1b
 r2OeAk0CXyQXH7woC4H35VdgTgpgqKYQf/c61lb0gvc5+5+TiF6cYlS+oizQB4JqewJpGZDnUmw
 44YP+5tjKcgRMrDpDh5SQW+DeuLxekz5rhZ16H6o/+4YUPuclSNNbqf7m9cTM0RN6Cb1lRnhxBD
 GIDWzUeQ5vKQm66zE3P/cNi3OCV3iR812fPXfxhGuHO06C1X1zQKMGR55WQJXk48Rsf/kizBl9I
 OVvKdb4ujEh5MmFZEgw==
X-Authority-Analysis: v=2.4 cv=bJEm5v+Z c=1 sm=1 tr=0 ts=6a2296b8 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=Hfps_RfwFyUEpd0PCboA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 impostorscore=0 adultscore=0 clxscore=1011 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050091
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111346-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	RCVD_COUNT_FIVE(0.00)[6];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,oss.qualcomm.com:from_mime,oss.qualcomm.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 547B2646EF9

Replace the private static asoc_qcom_of_xlate_dai_name() implementation
in lpass-cpu.c with a thin wrapper that calls the new shared helper
from common.c. This removes the duplicate implementation.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/lpass-cpu.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/sound/soc/qcom/lpass-cpu.c b/sound/soc/qcom/lpass-cpu.c
index 242bc16da36d..35c2c8030024 100644
--- a/sound/soc/qcom/lpass-cpu.c
+++ b/sound/soc/qcom/lpass-cpu.c
@@ -18,6 +18,7 @@
 #include <sound/soc-dai.h>
 #include "lpass-lpaif-reg.h"
 #include "lpass.h"
+#include "common.h"
 
 #define LPASS_CPU_MAX_MI2S_LINES	4
 #define LPASS_CPU_I2S_SD0_MASK		BIT(0)
@@ -458,30 +459,20 @@ const struct snd_soc_dai_ops asoc_qcom_lpass_cpu_dai_ops2 = {
 };
 EXPORT_SYMBOL_GPL(asoc_qcom_lpass_cpu_dai_ops2);
 
-static int asoc_qcom_of_xlate_dai_name(struct snd_soc_component *component,
+static int lpass_cpu_of_xlate_dai_name(struct snd_soc_component *component,
 				   const struct of_phandle_args *args,
 				   const char **dai_name)
 {
 	struct lpass_data *drvdata = snd_soc_component_get_drvdata(component);
 	const struct lpass_variant *variant = drvdata->variant;
-	int id = args->args[0];
-	int ret = -EINVAL;
-	int i;
 
-	for (i = 0; i  < variant->num_dai; i++) {
-		if (variant->dai_driver[i].id == id) {
-			*dai_name = variant->dai_driver[i].name;
-			ret = 0;
-			break;
-		}
-	}
-
-	return ret;
+	return asoc_qcom_of_xlate_dai_name(variant->dai_driver,
+					   variant->num_dai, args, dai_name);
 }
 
 static const struct snd_soc_component_driver lpass_cpu_comp_driver = {
 	.name = "lpass-cpu",
-	.of_xlate_dai_name = asoc_qcom_of_xlate_dai_name,
+	.of_xlate_dai_name = lpass_cpu_of_xlate_dai_name,
 	.legacy_dai_naming = 1,
 };
 
-- 
2.34.1


