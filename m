Return-Path: <linux-arm-msm+bounces-110176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KIJeBoORGGoMlQgAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110176-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:03:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 711DD5F6D32
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 21:03:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BE48C319E005
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2026 18:58:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8474A32C923;
	Thu, 28 May 2026 18:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CEdmOLUp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnRnEOTT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE5F3328E6
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779994722; cv=none; b=bn67phVbuV9A96XE4x5Q9/BviJ77Srxh9R6/DnrLjr8fYX8/wPnSCwSmb2I7cV0HCDH5Zeu0sg51136bkzFkvYEBXil4vdbFCttRTqvMDMdk+PdDQiAG71+/m8hzKGLEhWl8tcKxsUMPfFcXb66vYlglAZ43LFrWdMBdQ8i046M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779994722; c=relaxed/simple;
	bh=f8ON3seXiBC4PP8iYLytKvnzTFD/bo/frUMYwfPs5SI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=o0J8xYtG22WfKe03KleGS0F9PxKIo6ozweALk9GWuqCKFAa16DSifls0XWBumt8H4VayWFLLKUzGoAQhpY9VwE9FVziRwNTNWYPXshfOgM6F8Ik3iU2tZuWPJG/osG5WnrbPa6YiRHY8MFIdWWyo7ENah/PhOb2ILqqvZ31HQ0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CEdmOLUp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnRnEOTT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64SGtpl63204751
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=+PFci7Clpma
	ENpXCHboxKKWeOXbrMw24+6hrewU5IwA=; b=CEdmOLUpNl+K32eaUYKB6HxyDSN
	LF3OeUB99rxfdorFhFHHSn2AL8mB0T75I2kksQ2b1NZ6M4NL8eaMtDcu8p3hkfCw
	s9r4ZASq0MJAd+f2T7ndu4ci60X7lPgWFMJCfS/vKau/Q3zmZJvQ2QuhBd4Ljs3Q
	K4IQ1yn/XSFFlhit1cg3TzXkkF2F4XwKs+x7ON/tp6Ih3XzAwXVT7x2wsWqsy24e
	c+EWSCP0L8PsU1WX+hd7icLeMwBD+HYdsTCumhiQ9s2DZ/2+nDbUT+YalYjuTsCJ
	OzAkheU3fwaLBbcqlDBplAoG+lKkFU/HrmRrDA3whRYbBGp5aXp+4e9n4Aw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ee7ynma88-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 18:58:38 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-5165d10e036so232269191cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 May 2026 11:58:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779994718; x=1780599518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+PFci7ClpmaENpXCHboxKKWeOXbrMw24+6hrewU5IwA=;
        b=EnRnEOTT8i1i3eGG/ZD1Ksv6qbRVQF2Yb6QS+bVgM5t716x4ZPKfZ1X0NvuIiVv6go
         gR8mkPaNsvl5nW12rWTUGHFug9OBjVB9ljFu0iI5n5/kgZppXvvDCOITCLWTzgM3yhCT
         81gLQujytFwCsFAZPHGBUbjYNbaHnph5UYd6TG6NoT5GUWcSUNUSkx0BF8JPAhVEyak2
         7ax8xmKaab+TSP0mMOUB9Y7ZT11AbDhMdhzs+NyoLzyVtPXGPCl1vw80AzffAi4cHzkf
         lUDNtTD1G667Nnn7ROuuwmJyO/RgWqxvZXkFkBztOT60h/nDvkPUd00bKPOdFYwUo9yS
         +cuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779994718; x=1780599518;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+PFci7ClpmaENpXCHboxKKWeOXbrMw24+6hrewU5IwA=;
        b=tFUc2teEaMtDH5eoQCIsyu+NPf2j+XWeLAFCOw9gZ3JsDOgfixPUk51bx/vKmdVrNk
         nYrcNCF1/olWRSDjk4w2BpIa0lfKGya3xxgUalP/e+pMZK5GGfSuIQLO0N2YX76xa51L
         3RRudJVqt+H6bXH6ooDKvxSXkC83OKDtGXKh8AUnsavdXIsP5/zIHj15CanawHwtpWOC
         MqajeBNXOTN4wzYI1FpzqYvP4K3GpGcEkO2gVilmbF+IKFHpjGusLZQXfZDmgxq/hxkv
         wSMc4lQN4GbM1Ocb3ngqfI0Qlmr3yN2Udm9xu71rTbVkUxVdKsXmQqoE9rcwEYXq6/lC
         C0Bw==
X-Forwarded-Encrypted: i=1; AFNElJ+o8pYdBSXYva6C2uysd/GNKKZlD/assQgBh2V+lTml4+0p2UImFsNSNL9JmXtdW0gjoo9bwMIoDlgNNRWX@vger.kernel.org
X-Gm-Message-State: AOJu0YxmWWAlGenntwIvbDh7LdccCaJBHyGQhyldUo2oNemBizzNSdKy
	KsA/YTMXkR7euXvh0tGeqdhkmyKjA0EDUe1wFFp767Q5zAJvG9jYCS0cVIemTkHsE0/K3/kostl
	uvKSrKROL9MNGTPl8xjCkGgY6wnRoy5G1p83lMqcaT0d8kA+8F8TLgc5pyVmvVIks0XZT
X-Gm-Gg: Acq92OE/TDEaQOnd/HmRz8ncoREaMpfb3O61aqhDdiqG2t7yKUUacns2MjBiYAoxYy4
	DOu4pr8yow8Uj4/i9XEdwe6HR7661Mtt8vfW2b4ZTj2e9mJeqi4cJWeXM2UMGarEN9lTJWqOw0Q
	jcg58Svrt9UHKMLKZIdaqAPGRY6pbWOB3XioW7we1gBSCDDC64JiOrVv6lRhVEhL+1O+LIVEkbN
	MuseuZKnWUCbrA3HObf5OdMmHBXyn7clRaXMtY2gaH7CkGzoYFplF1Z56mpbT1scSu/aHPZS5U4
	3SWA0ZDST7L64EOugcdexHF1rEbFK2q1NtexCwp9Dn+Lg285Ty0cENCSEaGQrD/71nJQvMTYHvQ
	Cte+9Mu2kqPdYOW5HxNkde/soKSQB6wxcUoHf6wZ1GouaJYpNJlV/gaF6JHgcDJac9Lbd9Q==
X-Received: by 2002:ac8:5756:0:b0:50f:c5d3:a191 with SMTP id d75a77b69052e-5172cb3807cmr1742001cf.13.1779994717823;
        Thu, 28 May 2026 11:58:37 -0700 (PDT)
X-Received: by 2002:ac8:5756:0:b0:50f:c5d3:a191 with SMTP id d75a77b69052e-5172cb3807cmr1741601cf.13.1779994717321;
        Thu, 28 May 2026 11:58:37 -0700 (PDT)
Received: from debian (71.248.69.85.rev.sfr.net. [85.69.248.71])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49099feef7esm3107165e9.0.2026.05.28.11.58.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 May 2026 11:58:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com,
        krzysztof.kozlowski@oss.qualcomm.com, alexey.klimov@linaro.org,
        mohammad.rafi.shaik@oss.qualcomm.com, ravi.hothi@oss.qualcomm.com,
        mathieu.poirier@linaro.org, andersson@kernel.org, kees@kernel.org,
        verhaegen@google.com, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 6/6] ASoC: qcom: q6apm-dai: add push-pull and watermark event support
Date: Thu, 28 May 2026 19:58:05 +0100
Message-ID: <20260528185806.6316-7-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20260528185806.6316-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI4MDE5MSBTYWx0ZWRfX0w0MDoc2TA1x
 tooCTAY/9aPFNm4PGopAEHMH2Doi/c7kND7PY9I3dW64Owl71jMwObFCj3fh8cN2OXkW8GRDL2e
 sdNkDRzRuPr4LuzMaxsLWAACbW+f0RZeKRoOc8nOCrrw368Y5uipkwQ3lzjH8G5Z5nk8LLwTpdo
 5TMnqMQ7BSBQXSYxqL2bkm29hOiAJJk9ecaLVhN+VViWfjDiTLtXFizNY75vsNSmhVkrB6oZR9Y
 +v8Gw2YdOlrDcv7EwS5VDUEzoLZgKUyzWImvmcr7pmzpqGltVr5Zxds+leha75CXSSMQ1yyUvm2
 lcLWMrMsISThLQDncok1UuNzwJewnJXnXzDy9slX7dZMdn2waku7ZzEMpXxAxdEV26OkvSRrd/v
 AW+EaPI5snvWuH41OKNnpTpX9HR7TqSBeUY3LpKVtVeTn548Y4OWBs1pBHWzZ2coxTHfLpTyZ/b
 16/gnedH5SkCpaw1g4g==
X-Proofpoint-ORIG-GUID: JTclb9C1hJ2XKuF-HkvtWQ64qB-zA5Ol
X-Proofpoint-GUID: JTclb9C1hJ2XKuF-HkvtWQ64qB-zA5Ol
X-Authority-Analysis: v=2.4 cv=EdL4hvmC c=1 sm=1 tr=0 ts=6a18905e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=hLrqdhl2Yb02WBc7oxehMg==:17
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=FoGQ1hqfDKlkNBk9xSEA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-28_05,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0
 spamscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2605280191
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,perex.cz,suse.com,oss.qualcomm.com,linaro.org,kernel.org,google.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[16];
	MIME_TRACE(0.00)[0:+];
	TAGGED_FROM(0.00)[bounces-110176-lists,linux-arm-msm=lfdr.de];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[srinivas.kandagatla@oss.qualcomm.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[7]
X-Rspamd-Queue-Id: 711DD5F6D32
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Wire q6apm-dai to use push-pull shared memory graphs.

For push-pull graphs, configure the circular buffer and position buffer,
register watermark events, and use watermark notifications to report PCM
period elapsed. Skip legacy fragment queueing and ACK handling because the
DSP reads/writes directly from the shared circular buffer.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 144 ++++++++++++++++++++++++-------
 1 file changed, 114 insertions(+), 30 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 3a1be41df096..bf1f872a09f4 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -18,6 +18,7 @@
 #include "q6apm.h"
 
 #define DRV_NAME "q6apm-dai"
+#define POS_BUFFER_BYTES	4096
 
 #define PLAYBACK_MIN_NUM_PERIODS	2
 #define PLAYBACK_MAX_NUM_PERIODS	8
@@ -62,8 +63,12 @@ struct q6apm_dai_rtd {
 	struct snd_codec codec;
 	struct snd_compr_params codec_param;
 	struct snd_dma_buffer dma_buffer;
+	struct sh_mem_pull_push_mode_position_buffer *pos_buffer;
+	uint32_t last_pos_index;
 	phys_addr_t phys;
+	phys_addr_t pos_phys;
 	unsigned int pcm_size;
+	unsigned int push_pull_size;
 	unsigned int pcm_count;
 	unsigned int periods;
 	uint64_t bytes_sent;
@@ -128,6 +133,9 @@ static void event_handler(uint32_t opcode, uint32_t token, void *payload, void *
 	struct snd_pcm_substream *substream = prtd->substream;
 
 	switch (opcode) {
+	case APM_CLIENT_EVENT_WATERMARK_EVENT:
+		snd_pcm_period_elapsed(substream);
+		break;
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
 		prtd->state = Q6APM_STREAM_STOPPED;
 		break;
@@ -234,24 +242,47 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		q6apm_free_fragments(prtd->graph, substream->stream);
 	}
 
+	prtd->last_pos_index = 0;
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	/* rate and channels are sent to audio driver */
-	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
-	if (ret < 0) {
-		dev_err(dev, "%s: q6apm_open_write failed\n", __func__);
-		return ret;
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (prtd->pcm_size != prtd->push_pull_size) {
+			ret = q6apm_push_pull_config(prtd->graph, prtd->phys, prtd->pos_phys,
+						     prtd->pcm_size);
+			if (ret < 0) {
+				dev_err(dev, "Push/Pull config failed rc = %d\n", ret);
+				return ret;
+			}
+
+			ret = q6apm_register_watermark_event(prtd->graph,
+							     prtd->pcm_size / prtd->periods,
+							     prtd->periods);
+			if (ret < 0) {
+				dev_err(dev, "WaterMark event config failed rc = %d\n", ret);
+				return ret;
+			}
+			prtd->push_pull_size = prtd->pcm_size;
+		}
+	} else {
+		ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
+					(prtd->pcm_size / prtd->periods), prtd->periods);
+		if (ret < 0) {
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+			return ret;
+		}
+
 	}
 
 	ret = q6apm_graph_media_format_pcm(prtd->graph, &cfg);
-	if (ret < 0)
+	if (ret < 0) {
 		dev_err(dev, "%s: CMD Format block failed\n", __func__);
+		return ret;
+	}
 
-	ret = q6apm_alloc_fragments(prtd->graph, substream->stream, prtd->phys,
-				(prtd->pcm_size / prtd->periods), prtd->periods);
-
+	/* rate and channels are sent to audio driver */
+	ret = q6apm_graph_media_format_shmem(prtd->graph, &cfg);
 	if (ret < 0) {
-		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
-		return -ENOMEM;
+		dev_err(dev, "Failed to set media format %d\n", ret);
+		return ret;
 	}
 
 	ret = q6apm_graph_prepare(prtd->graph);
@@ -265,13 +296,13 @@ static int q6apm_dai_prepare(struct snd_soc_component *component,
 		dev_err(dev, "Failed to Start Graph %d\n", ret);
 		return ret;
 	}
-
-	if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
-		int i;
-		/* Queue the buffers for Capture ONLY after graph is started */
-		for (i = 0; i < runtime->periods; i++)
-			q6apm_read(prtd->graph);
-
+	if (!q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		if (substream->stream == SNDRV_PCM_STREAM_CAPTURE) {
+			int i;
+			/* Queue the buffers for Capture ONLY after graph is started */
+			for (i = 0; i < runtime->periods; i++)
+				q6apm_read(prtd->graph);
+		}
 	}
 
 	/* Now that graph as been prepared and started update the internal state accordingly */
@@ -286,6 +317,9 @@ static int q6apm_dai_ack(struct snd_soc_component *component, struct snd_pcm_sub
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	int i, ret = 0, avail_periods;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph))
+		return 0;
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		avail_periods = (runtime->control->appl_ptr - prtd->queue_ptr)/runtime->period_size;
 		for (i = 0; i < avail_periods; i++) {
@@ -317,6 +351,7 @@ static int q6apm_dai_trigger(struct snd_soc_component *component,
 		/* TODO support be handled via SoftPause Module */
 		prtd->state = Q6APM_STREAM_STOPPED;
 		prtd->queue_ptr = 0;
+		prtd->last_pos_index = 0;
 		break;
 	case SNDRV_PCM_TRIGGER_SUSPEND:
 	case SNDRV_PCM_TRIGGER_PAUSE_PUSH:
@@ -402,6 +437,14 @@ static int q6apm_dai_open(struct snd_soc_component *component,
 	else
 		prtd->phys = substream->dma_buffer.addr | (pdata->sid << 32);
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		void *pos_buffer;
+
+		prtd->pos_phys = prtd->phys + BUFFER_BYTES_MAX;
+		pos_buffer = (void *)(substream->dma_buffer.area + BUFFER_BYTES_MAX);
+		prtd->pos_buffer = (struct sh_mem_pull_push_mode_position_buffer *)(pos_buffer);
+	}
+
 	return 0;
 err:
 	kfree(prtd);
@@ -436,6 +479,25 @@ static snd_pcm_uframes_t q6apm_dai_pointer(struct snd_soc_component *component,
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	snd_pcm_uframes_t ptr;
 
+	if (q6apm_is_graph_in_push_pull_mode(prtd->graph)) {
+		int retries = 10;
+		uint32_t index, fc1, fc2;
+
+		/* index is valid if frame_counter does not change while reading. */
+		do {
+			fc1 = READ_ONCE(prtd->pos_buffer->frame_counter);
+			index = READ_ONCE(prtd->pos_buffer->index);
+			fc2 = READ_ONCE(prtd->pos_buffer->frame_counter);
+		} while (fc1 != fc2 && --retries);
+
+		if (fc1 != fc2)
+			index = prtd->last_pos_index;
+		else
+			prtd->last_pos_index = index;
+
+		ptr = bytes_to_frames(runtime, index);
+		return ptr;
+	}
 	ptr = q6apm_get_hw_pointer(prtd->graph, substream->stream) * runtime->period_size;
 	if (ptr)
 		return ptr - 1;
@@ -468,7 +530,8 @@ static int q6apm_dai_hw_params(struct snd_soc_component *component,
 }
 
 static int q6apm_dai_memory_map(struct snd_soc_component *component,
-				struct snd_pcm_substream *substream, int graph_id)
+				struct snd_pcm_substream *substream,
+				int graph_id, bool is_push_pull)
 {
 	struct q6apm_dai_data *pdata;
 	struct device *dev = component->dev;
@@ -490,6 +553,19 @@ static int q6apm_dai_memory_map(struct snd_soc_component *component,
 	if (ret < 0)
 		dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
 
+	if (is_push_pull) {
+		if (pdata->sid < 0)
+			phys = substream->dma_buffer.addr + BUFFER_BYTES_MAX;
+		else
+			phys = (substream->dma_buffer.addr + BUFFER_BYTES_MAX) | (pdata->sid << 32);
+
+		ret = q6apm_map_pos_buffer(dev, graph_id, phys, POS_BUFFER_BYTES);
+		if (ret < 0)
+			dev_err(dev, "Audio Start: Buffer Allocation failed rc = %d\n",	ret);
+	} else {
+
+	}
+
 	return ret;
 }
 
@@ -504,25 +580,30 @@ static int q6apm_dai_pcm_new(struct snd_soc_component *component, struct snd_soc
 	 */
 	int size = BUFFER_BYTES_MAX + PAGE_SIZE;
 	int graph_id, ret;
-	struct snd_pcm_substream *substream;
+	bool is_push_pull;
+	struct snd_pcm_substream *substream = NULL;
 
 	graph_id = cpu_dai->driver->id;
 
-	ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
-	if (ret)
-		return ret;
-
 	/* Note: DSP backend dais are uni-directional ONLY(either playback or capture) */
-	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream) {
+	if (pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream)
 		substream = pcm->streams[SNDRV_PCM_STREAM_PLAYBACK].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+	else  if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream)
+		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
+
+
+	if (substream) {
+		is_push_pull = q6apm_is_graph_in_push_pull_mode_from_id(component->dev,
+									graph_id,
+									substream->stream);
+		if (is_push_pull)
+			size += POS_BUFFER_BYTES;
+
+		ret = snd_pcm_set_fixed_buffer_all(pcm, SNDRV_DMA_TYPE_DEV, component->dev, size);
 		if (ret)
 			return ret;
-	}
 
-	if (pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream) {
-		substream = pcm->streams[SNDRV_PCM_STREAM_CAPTURE].substream;
-		ret = q6apm_dai_memory_map(component, substream, graph_id);
+		ret = q6apm_dai_memory_map(component, substream, graph_id, is_push_pull);
 		if (ret)
 			return ret;
 	}
@@ -547,6 +628,9 @@ static void q6apm_dai_memory_unmap(struct snd_soc_component *component,
 
 	graph_id = cpu_dai->driver->id;
 	q6apm_unmap_memory_fixed_region(component->dev, graph_id);
+
+	if (q6apm_is_graph_in_push_pull_mode_from_id(component->dev, graph_id, substream->stream))
+		q6apm_unmap_pos_buffer(component->dev, graph_id);
 }
 
 static void q6apm_dai_pcm_free(struct snd_soc_component *component, struct snd_pcm *pcm)
-- 
2.53.0


