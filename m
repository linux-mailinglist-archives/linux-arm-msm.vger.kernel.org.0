Return-Path: <linux-arm-msm+bounces-95323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJj1Fi8wqGlPpQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95323-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:14:23 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FD12002F0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 04 Mar 2026 14:14:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BCA7E30584E8
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Mar 2026 13:08:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2C3943A6EF9;
	Wed,  4 Mar 2026 13:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTwiyvl3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Jpd3WMkd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE5F239A051
	for <linux-arm-msm@vger.kernel.org>; Wed,  4 Mar 2026 13:07:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772629660; cv=none; b=XO+EfV/1eu4Pl+zlwfaVqILOCdr60rENO39zkqBBeByHHnyr80xbAcst6acsBrv+IV+cu6dm6AXzcqlFtcGrstVsUyPzA1gNspy66U8Yrj3InXBK4ymg3WE3ocWisT1se+Kt4T4yENuxkjHJI9wKWk4OvUKgYeh+zD/bPfA6fK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772629660; c=relaxed/simple;
	bh=sljgOhpaU8wHMtLfJBiR4fUV3hNt3/HmvH6kZPwy9as=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=crQrCvVqo09zcw6Kmd7OfvCMcqXmesbsMfos0WKRBADQNcDq2BICjzVqwbhwEWJ5JK1CFt63CfBIDQQZEKdmMOLDrp73BFjvqVfOb1SdOrIw6yV8APXE+ob1YhFjBZ1jDNAeMHhhJprI+RNotnekFr5AwD2VFXeSRfYvbO6rYRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTwiyvl3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Jpd3WMkd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 624C7WrA3110358
	for <linux-arm-msm@vger.kernel.org>; Wed, 4 Mar 2026 13:07:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=79Hssidv5J9
	yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=; b=hTwiyvl31OaC7ApzylVMWQsVubV
	4U6Z/UUXpDl3dlYAyeX8nkLZ1MWamba3PIqec9PNZrFX5gOgns3kfstv0zqNYS2N
	C+OS+Ucb09yIWW0ZtyDMe6ZO4lmwZevL0NNhw3FN88M4tjfb1tqY2/IiQ0JVCMKy
	lxJcz3XAGhATaNOtLGkvVn/CJIpLkHcTRKu7aNy7g7vg289pk6k3rxUGbGL9SYxj
	2t45hNWNB9+OZw2b7U7JyYCrtYI9FsSABfOHz31+rA2l7JisWyfXtiHFcTcRhuH5
	8rPJCFq4FFRJWDkIOVRzyZRSgCpVJMSFJUAFNZrc2ugmAQm7zGseXVKvbYA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cp5h2b7s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 13:07:36 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8cb706313beso859029485a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Mar 2026 05:07:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772629655; x=1773234455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=Jpd3WMkduXYW4/kARlwwIesKU76kTV2Ie7n9E39INm5Sf6w4sSAD9akqv/212DysJL
         VvWgMBmYXhpfBSA+FpRHN0eQYyMs12QIO++tlRFLAiswdeDZc0Zypr3CXU4CyuA5tKXA
         PGToI0j6HK4sEcW34hmMqc0CQ4P4T6E3ZX0rq/04ENOo4NbYtyI3LGcXXHph7MwC9jr7
         1/hV2OUR1eprH+Q1tNL0dTGvU/vfncpL2vVxexadWIOJicLaU5W+vQIOAs0EDUXYFnBi
         ezcNGMPZR3E6fQghQx/DpSvJJYfEdjpx1yLH4r7k0IY0kdiQrajr5c2ert7w7HaLldQA
         d3zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772629655; x=1773234455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=79Hssidv5J9yhS1Hc5RwtLaxh/YVdwsl6nwkjjN6Bow=;
        b=F6omEcYojkOaT/rMSNbjU2LPjil9Fr/pEV66z6VaGBJNSgBY6ur9L6rEDkgvEpXh17
         MxD5GGOQkDlRo8sxzQ2AlzYLNQZqbKafewWNEYoJRZ1sAb4PYfICoO6W20+xcc3/yUwf
         nmNla/rl2S1vicN9lt/AU4lHq8W8tp+g5wdSjyE2i9Y4kSnVRdav2g6h8mISZnhbPjQm
         c38g1dVVa3DAogorPodsFrH3746fSf9VSbWhUzoChHuz+tRjYpA5B8+clsvfvw2Pw7CS
         XTy+VrfgyduOGffvYMq2XP3Ld1+fv58fV4WUngnVGPy9UGsmSQBMAQntXBaX0A34Tc6j
         8M+w==
X-Forwarded-Encrypted: i=1; AJvYcCWzDkuQyHomdo/GOenJv3LlI2m3L0XGdvDa5unG/4lzWj0O7MGD9Z8r5zfpuZ9T1ZJFLFG6ZU6cc1GKLukj@vger.kernel.org
X-Gm-Message-State: AOJu0YyLBdBAoitmYs+1W/0rQB3t0PUzMQRPTWQ8DlfQ9TCEdzINUO9i
	ZuwGJ242UB85oz0ClcSYNj1ESJmYYGCH1mQuK1Sv6YfpLECNlz3pVtqIc4QKkFQC0o4V1tQ9N9b
	h8xIGqf/Ua+17ubFijAAsT8WfjqRmcWg9pPt6DOLc8mozdD13y5vJwW5FtfX5Zndsi2B/
X-Gm-Gg: ATEYQzxTMsBtVDkUbkkbAZRZ1Swy6iGNgF22wOO8c6/42pHfv73xVRZ7soCVcHAKeUS
	B+nZi2JtkKt/rwGNlxppE97rlKY42wTMxc7rVLlPIdWnbiM0oaFP7MIVecV8Kg0AIWqp2RfognC
	r26/PEQQBMiYIgZ1xJPOh8uLel9JkG/ScFWux5tmzq6FmxiK/HCHx7pFdRpYJlN9icw7TWqY0h6
	EYREhEPEZ8b9++7VVbZKaQrJoSyTjUnHNR8bNvGCodGuUbqk91dwQWvNbTC1/ta2zxYUZcKD4C6
	pl5IIp4oQ09EG5VoY5zuC281e4kEyFe/PnBGS/r6H8VMTm/sYfZG1BuWLDDivasP4aiwn1F4J19
	+tmK602nAac7K7plelNvRYNDMbzlAbbWkJcOrzBvmzQJ30vkeuZ1AD2U=
X-Received: by 2002:a05:620a:290d:b0:8c5:38c3:7cca with SMTP id af79cd13be357-8cd5af0dd89mr216125285a.31.1772629651912;
        Wed, 04 Mar 2026 05:07:31 -0800 (PST)
X-Received: by 2002:a05:620a:290d:b0:8c5:38c3:7cca with SMTP id af79cd13be357-8cd5af0dd89mr216096085a.31.1772629648720;
        Wed, 04 Mar 2026 05:07:28 -0800 (PST)
Received: from localhost.localdomain ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485188122a6sm49969745e9.12.2026.03.04.05.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 05:07:28 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: mohammad.rafi.shaik@oss.qualcomm.com, linux-sound@vger.kernel.org,
        lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, johan@kernel.org,
        dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, srini@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 10/14] ASoC: qcom: common: validate cpu dai id during parsing
Date: Wed,  4 Mar 2026 13:07:08 +0000
Message-ID: <20260304130712.222246-11-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260304130712.222246-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JqL8bc4C c=1 sm=1 tr=0 ts=69a82e98 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=FTFSxu1yF2iZ1NjiFwcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: ty8-mQrV8ZS_uxSw1crgBySfVFcZtZH2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA0MDEwNSBTYWx0ZWRfX/ei9ONWqnVBf
 jINaMZg8VevC3urY6irx1btxax7hwyLKMRQTY15xFuZ+0MJDCH5oLlNeWUXzMovWEC+FnkK+Idg
 4pGKY11sDkx8C36XJrSVa1MzPzz3/cb/QiHavKPsYSizYS1hIjX88izZRgDuv+MePBPP9mgIIla
 sIfuSXUQUqZFTmxQcB2XXbdc8iz5Kx4KNx1OmHh+h6FYcUr3Pes4+8O7KBCrqjAFP5Cx7nBGueK
 pRaEZl+Cx42RyzJWT4Q76BmojAlLA2ca1j0KrhxWbp5hUB6tABpTGizsh5Ib8t+c/lLG+X4XEfL
 F53qIUQHSm5oi0NEk/R1qk4zcHUwgqApkRRz7wMnp2LNqaU8qgg2ZDyM3eY0kSl6VaE9st0NmF6
 j2+bt2uF31DK0r8TJA6A7nRKZglNF/JsLXpJkGbRdc9z9jijhcqp5wBEN8yymshJkmmlBXJxhII
 Nb1IDyipx5DrzZLza8A==
X-Proofpoint-GUID: ty8-mQrV8ZS_uxSw1crgBySfVFcZtZH2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-04_06,2026-03-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2603040105
X-Rspamd-Queue-Id: 02FD12002F0
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.84 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,vger.kernel.org,gmail.com,perex.cz,suse.com,kernel.org];
	RCPT_COUNT_TWELVE(0.00)[17];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-95323-lists,linux-arm-msm=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:rdns,tor.lore.kernel.org:helo,qualcomm.com:dkim,qualcomm.com:email,oss.qualcomm.com:dkim,oss.qualcomm.com:mid];
	TAGGED_RCPT(0.00)[linux-arm-msm,dt];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Action: no action

lpass ports numbers have been added but the afe/apm driver never got
updated with new max port value that it uses to store dai specific data.
There are more than one places these values are cached and always become
out of sync.

This will result in array out of bounds and weird driver behaviour.

To catch such issues, first add a single place where we can define max
port and second add a check in common parsing code which can error
out before corrupting the memory with out of bounds array access.

This should help both avoid and catch these type of mistakes in future.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/common.c      | 6 ++++++
 sound/soc/qcom/common.h      | 3 +++
 sound/soc/qcom/lpass.h       | 3 ++-
 sound/soc/qcom/qdsp6/q6afe.h | 3 ++-
 sound/soc/qcom/qdsp6/q6apm.h | 3 ++-
 5 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/sound/soc/qcom/common.c b/sound/soc/qcom/common.c
index 7ee60a58a336..878b42babcc3 100644
--- a/sound/soc/qcom/common.c
+++ b/sound/soc/qcom/common.c
@@ -120,6 +120,12 @@ int qcom_snd_parse_of(struct snd_soc_card *card)
 
 		link->id = args.args[0];
 
+		if (link->id > LPASS_MAX_PORT) {
+			dev_err(dev, "%s: Invalid cpu dai id %d\n", link->name, link->id);
+			ret = -EINVAL;
+			goto err;
+		}
+
 		if (platform) {
 			link->platforms->of_node = of_parse_phandle(platform,
 					"sound-dai",
diff --git a/sound/soc/qcom/common.h b/sound/soc/qcom/common.h
index 1b8d3f90bffa..ee6662885593 100644
--- a/sound/soc/qcom/common.h
+++ b/sound/soc/qcom/common.h
@@ -4,8 +4,11 @@
 #ifndef __QCOM_SND_COMMON_H__
 #define __QCOM_SND_COMMON_H__
 
+#include <dt-bindings/sound/qcom,q6afe.h>
 #include <sound/soc.h>
 
+#define LPASS_MAX_PORT			(SENARY_MI2S_TX + 1)
+
 int qcom_snd_parse_of(struct snd_soc_card *card);
 int qcom_snd_wcd_jack_setup(struct snd_soc_pcm_runtime *rtd,
 			    struct snd_soc_jack *jack, bool *jack_setup);
diff --git a/sound/soc/qcom/lpass.h b/sound/soc/qcom/lpass.h
index de3ec6f594c1..68b71039b981 100644
--- a/sound/soc/qcom/lpass.h
+++ b/sound/soc/qcom/lpass.h
@@ -14,10 +14,11 @@
 #include <linux/regmap.h>
 #include <dt-bindings/sound/qcom,lpass.h>
 #include <dt-bindings/sound/qcom,q6afe.h>
+#include "common.h"
 #include "lpass-hdmi.h"
 
 #define LPASS_AHBIX_CLOCK_FREQUENCY		131072000
-#define LPASS_MAX_PORTS			(DISPLAY_PORT_RX_7 + 1)
+#define LPASS_MAX_PORTS			(LPASS_MAX_PORT)
 #define LPASS_MAX_MI2S_PORTS			(8)
 #define LPASS_MAX_DMA_CHANNELS			(8)
 #define LPASS_MAX_HDMI_DMA_CHANNELS		(4)
diff --git a/sound/soc/qcom/qdsp6/q6afe.h b/sound/soc/qcom/qdsp6/q6afe.h
index a29abe4ce436..0b8c3ec1315c 100644
--- a/sound/soc/qcom/qdsp6/q6afe.h
+++ b/sound/soc/qcom/qdsp6/q6afe.h
@@ -2,8 +2,9 @@
 
 #ifndef __Q6AFE_H__
 #define __Q6AFE_H__
+#include "../common.h"
 
-#define AFE_PORT_MAX		137
+#define AFE_PORT_MAX		(LPASS_MAX_PORT)
 
 #define MSM_AFE_PORT_TYPE_RX 0
 #define MSM_AFE_PORT_TYPE_TX 1
diff --git a/sound/soc/qcom/qdsp6/q6apm.h b/sound/soc/qcom/qdsp6/q6apm.h
index 7ce08b401e31..5cf538397841 100644
--- a/sound/soc/qcom/qdsp6/q6apm.h
+++ b/sound/soc/qcom/qdsp6/q6apm.h
@@ -14,9 +14,10 @@
 #include <linux/of_platform.h>
 #include <linux/jiffies.h>
 #include <linux/soc/qcom/apr.h>
+#include "../common.h"
 #include "audioreach.h"
 
-#define APM_PORT_MAX		127
+#define APM_PORT_MAX		LPASS_MAX_PORT
 #define APM_PORT_MAX_AUDIO_CHAN_CNT 8
 #define PCM_CHANNEL_NULL 0
 #define PCM_CHANNEL_FL    1	/* Front left channel. */
-- 
2.47.3


