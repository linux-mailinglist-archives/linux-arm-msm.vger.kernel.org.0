Return-Path: <linux-arm-msm+bounces-111376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id QlukJsCnImpQbgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111376-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:41:04 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C386476EF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:41:04 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=Hj8jE5GL;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111376-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.232.135.74 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111376-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4C2A43035E5D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B40E4C8FF4;
	Fri,  5 Jun 2026 10:38:06 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBEA04C77AB;
	Fri,  5 Jun 2026 10:38:04 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655886; cv=none; b=evLH9W7Oihv4YKxgar0zLk4yQLW44DA+LlIHmDeTdik2vdrcIqemEz2yF/OtaSzUiqmPzts8DdIRPYHCvBMrDueGrU9OuM/asVtVYck6gHJjWD0tOamFfg9MFkGIuJ2GMDJ431Dn+/VLN7E7XUhVFjEhCI7Bl761pZutbTuiPBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655886; c=relaxed/simple;
	bh=nF1bRL+0i+sdOb4OP2N9xnfU/mirbjvsHliu1OlK+mg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ixeeo/GekdsTs/o1O8dWXCHoiJ4paTfkAOjB9fiaKHELjCU1GyFc4MBn4Gs+9nuycWIcOW0nrumh8fqdXttcdSspNYub49+85Am/zsOiOV/vezVzREdZG21PbFTEltNGJphL7bkQpwWVVVsSRCZRlzwqXsAEhG3rAly98mGj4MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Hj8jE5GL; arc=none smtp.client-ip=205.220.180.131
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 655A5sBh2974958;
	Fri, 5 Jun 2026 10:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pkfnQ/nPGko
	XdiZ9aGhJnWQ3C2t7kl778gfFKiG53m0=; b=Hj8jE5GL4ieyQxqPnRQGnPHLXcA
	DyOymz2CNjTwt3SFma4PNglo4j2HNorO+DkpfnkVvjyjZc+hfXeVtfuYJJP8oF5D
	wVnIbW+qm7rc6kqbPb3QDQ81/Dbj49T+t69sU0zBm9AAK53TI4ey/Lv/TO5iImwT
	O9Frh7w0mZuzJUqg5T2OPpmxAzKbUDX7Uaov/1tnrTOkMevBmGJ/hzTM07rIFz0f
	e0YSRYzrxaT+PTEld6PFtriCkZCIX+4T84NjN6LOS2UdsuDOV3ncMBs4KqNw4Mym
	XDhkGsgtzKrCRJZsCe1/QiBtMuQuysrya+AC286O1ibsT+8+qRBdHOBtcHA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekpnu9hd3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:38:02 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6u011714;
	Fri, 5 Jun 2026 10:37:58 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 9/13] ASoC: qcom: lpass-cpu: Use asoc_qcom_of_xlate_dai_name helper
Date: Fri,  5 Jun 2026 16:07:35 +0530
Message-Id: <20260605103739.3557573-10-harendra.gautam@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
References: <20260605103739.3557573-1-harendra.gautam@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-Proofpoint-GUID: kW4k7W0KTxswYaIy9eosMol04mRNgCM6
X-Authority-Analysis: v=2.4 cv=Ksl9H2WN c=1 sm=1 tr=0 ts=6a22a70a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=Hfps_RfwFyUEpd0PCboA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfXxH0sPpyV1B2V
 9kGhnkhhz77MI8jvYEnk8xyJk9W1xi0HseuRzjtK5+jg8Fnlm33ZTaNwhWUB6/TIOHLxGXLGzIw
 PF0UAl4hkJKBP7GGo848YOql7R3bSPCZQKOtZqUKv1YwlLfuZOnxVO5xTzrO3KSKtwoJAP4bTo/
 1xNTiJFF2+LTUINLnpl/ViyXqf7jtC4hj74AHD04ai9+GIOk49pIzTUS6rCUm/e/9NFgRJWUbm2
 +IUjipqEUix6TVYmW/tNjcKwqWw6MJkIU1U6zXhsy9kPB5bA47WAr3ex3hjjD7s5C+FUP2cvyTI
 cQihUD12cxzPRVUoJQYpoH1UDz9smItuKrJa6WwVttOYn09s9W54q1EjeVanYn8EqVi1KWE37FO
 V2myGWA0iiIUIwULuq3jvoHJU1gR4Pv+cSB1Wh0d9zGzoWnZqqc6Ck33j1m9IcH31mTFi2j65Ug
 SJKQSjc0OIrMH14oJgw==
X-Proofpoint-ORIG-GUID: kW4k7W0KTxswYaIy9eosMol04mRNgCM6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 lowpriorityscore=0 spamscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111376-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	RCPT_COUNT_SEVEN(0.00)[10];
	ALIAS_RESOLVED(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,vger.kernel.org:from_smtp,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 36C386476EF

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


