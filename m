Return-Path: <linux-arm-msm+bounces-111373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id vbpkOd+rImqObwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-111373-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:39 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1BE647900
	for <lists+linux-arm-msm@lfdr.de>; Fri, 05 Jun 2026 12:58:39 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=qualcomm.com header.s=qcppdkim1 header.b=j5dYgnQQ;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-111373-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-111373-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=reject) header.from=qualcomm.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 48D7930EDA4D
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Jun 2026 10:38:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB4444C6F16;
	Fri,  5 Jun 2026 10:38:04 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D15524183C7;
	Fri,  5 Jun 2026 10:38:01 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780655884; cv=none; b=jWwyQma11VU+QxIJ5ThIye86zFHHG4edns+yNurw7xbdxwY2xoNygS0URyU8VMdH+1vUc5WTlONF7VBb8mJaElHWC1mStYdwumzPaobFHKdPN0W/ZF/NqMPCWfWoCDN1+sA2nlBbxaoGbIB6nYdAuP13JAN51nMvBkKIaTIdOAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780655884; c=relaxed/simple;
	bh=g8AbOkSXcU/8GItxMeSd2As/AfiC03vjCGKOW/TEu6w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aMzkcJ8DhtT1WVt8f52EU4CPUZWSCS/sr0szBMZc+z4t01rvTUpkU9Kv1e/PNm8px3YGMauhN9+MF8VhJqDfRpVRbEBqszkT7apMk8NO2We26HDO7CF7724sw+40W7GGhSIaxJa5eXB55na4372f/I2o39oOPgv9wIJcJ0R4L0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j5dYgnQQ; arc=none smtp.client-ip=205.220.168.131
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6555qLrF2428783;
	Fri, 5 Jun 2026 10:37:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=dxvZiMITXar
	Y2Wg7jDIvSuF9WeIimNknXWUyES4VKvQ=; b=j5dYgnQQcv2p1GiJ/NMjDMSS5dA
	k3439/lgNsYV0ko86/N9unRGihZQ5H2gjNgKyV+ZySY9zFB2grhREqlxfzJJw7Oe
	Lbrf63A2dbDrDS6C1hhY7hG/jEB/HnssaQ6iDDqPGOf5wCeMZQligBuHzxx0yg8P
	eDly2V16mofcefqkaiAgD1JLcNZup740cS5TuAbt48kjTW44oNMMzCXAw3xlevry
	X331jqFbX475GCbZ/cZqjjm7/Hpx4qmNIOSnoJj70paeNfCXJCTkEOolaNRtjMKm
	nF66DTyrN+n7kJBpsW7T0dKBw0iZkLXgaSQ4m7JM4R805s/olUuagMTo9uA==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ekrphh43w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 Jun 2026 10:37:59 +0000 (GMT)
Received: from hu-hgautam-hyd.qualcomm.com (hu-hgautam-hyd.qualcomm.com [10.147.247.91])
	by APBLRPPMTA01.qualcomm.com (8.18.1.7/8.18.1.7) with ESMTP id 655Abk6t011714;
	Fri, 5 Jun 2026 10:37:56 GMT
From: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>
Cc: Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 8/13] ASoC: qcom: Add generic of_xlate_dai_name helper to common
Date: Fri,  5 Jun 2026 16:07:34 +0530
Message-Id: <20260605103739.3557573-9-harendra.gautam@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: J7OGugiKoen5ox8BXGG3Fwm9rxFwhiqP
X-Proofpoint-GUID: J7OGugiKoen5ox8BXGG3Fwm9rxFwhiqP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA1MDEwMyBTYWx0ZWRfX2rO8JyAc0dUt
 vjPO47Owy1NNOllwHHSPz6cUfrErLEYWqm1c5xA62wy0utZ0OiLa69y4pEgzc7bjkPQ9g4O4jyf
 orc+5bUPTka0rzBmgux28QQegcC/+qXP8DD1pKiV0O9PvGvdiazNcHuz/t/p5FijNDJ/DSAEKjX
 9OLSzSyjoTpzb4JilSXftv56yp1cqK+TMDZp0p4wPginY4rUsUwzdqtgzitDKKOHNxfTxbyqnWs
 feJlu66kJYJK+ie+pRgyavgg80yQxd5hjGBUlJxrDBxov45o8d6Lc6zWrcrDfGVs2LgS5BLxa2k
 Kcu5B+3WIJckBjxLa6wnFHfA9o5fzvwv7vWWBZUwOu/q30oboW6JhKm7coRhLhdZIny/5yin8hk
 uEDepDe0ngX8is7LYT/Noh5QdMRz+N+lYCWJ22zMsZzcrohUvIktMHCJ0xECKkIP9W2W3zK8a5H
 USQM0rnurm6jcLAbYPQ==
X-Authority-Analysis: v=2.4 cv=T9a8ifKQ c=1 sm=1 tr=0 ts=6a22a707 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8 a=oUFy9JDnOWMlxJQm5LIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-05_01,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1011 bulkscore=0 adultscore=0
 priorityscore=1501 phishscore=0 spamscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605210000
 definitions=main-2606050103
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[lists@lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,gmail.com,vger.kernel.org];
	TAGGED_FROM(0.00)[bounces-111373-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:srini@kernel.org,m:broonie@kernel.org,m:lgirdwood@gmail.com,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:linux-sound@vger.kernel.org,m:linux-arm-msm@vger.kernel.org,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[harendra.gautam@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[qualcomm.com:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:from_mime,oss.qualcomm.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp,qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 8B1BE647900

Multiple Qualcomm ASoC CPU DAI drivers need to resolve a sound-dai
phandle argument to a DAI name by searching the component's DAI driver
array by ID. Each driver currently implements this identically.

Extract the common logic into asoc_qcom_of_xlate_dai_name() in
common.c so it can be shared across drivers without duplication.

Signed-off-by: Harendra Gautam <harendra.gautam@oss.qualcomm.com>
---
 sound/soc/qcom/common.c | 34 ++++++++++++++++++++++++++++++++++
 sound/soc/qcom/common.h |  5 +++++
 2 files changed, 39 insertions(+)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index cf1f3a767cee..46569290d44c 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -23,6 +23,40 @@ static const struct snd_soc_dapm_widget qcom_jack_snd_widgets[] = {
 	SND_SOC_DAPM_SPK("DP7 Jack", NULL),
 };
 
+/**
+ * asoc_qcom_of_xlate_dai_name - Resolve a sound-dai phandle argument to a
+ *                               DAI name by searching the DAI driver array.
+ * @dai_drv:  Array of DAI drivers registered by the component.
+ * @num_dai:  Number of entries in @dai_drv.
+ * @args:     Phandle arguments from the sound-dai property; args[0] is the
+ *            DAI ID.
+ * @dai_name: Output pointer set to the matched DAI name on success.
+ *
+ * Returns 0 on success, -EINVAL if args_count != 1 or no match is found.
+ */
+int asoc_qcom_of_xlate_dai_name(const struct snd_soc_dai_driver *dai_drv,
+				int num_dai,
+				const struct of_phandle_args *args,
+				const char **dai_name)
+{
+	int id, i;
+
+	if (args->args_count != 1)
+		return -EINVAL;
+
+	id = args->args[0];
+
+	for (i = 0; i < num_dai; i++) {
+		if (dai_drv[i].id == id) {
+			*dai_name = dai_drv[i].name;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(asoc_qcom_of_xlate_dai_name);
+
 int qcom_snd_parse_of(struct snd_soc_card *card)
 {
 	struct device_node *np;
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index ee6662885593..5baf51a39c97 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -6,6 +6,7 @@
 
 #include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
+#include <sound/soc-dai.h>
 
 #define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
 
@@ -15,5 +16,9 @@ int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 int qcom_snd_dp_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			   struct snd_soc_jack *dp_jack, int id);
 
+int asoc_qcom_of_xlate_dai_name(const struct snd_soc_dai_driver *dai_drv,
+				int num_dai,
+				const struct of_phandle_args *args,
+				const char **dai_name);
 
 #endif
-- 
2.34.1


