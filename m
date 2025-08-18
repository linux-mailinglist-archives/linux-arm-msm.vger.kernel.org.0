Return-Path: <linux-arm-msm+bounces-69531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C95AEB2A081
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:36:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BDEA9163937
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:29:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A6E931A06C;
	Mon, 18 Aug 2025 11:28:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IsJf6K3B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C468731B138
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516508; cv=none; b=n66u65ZZd3vtXi8NFhMoPPBh5DZdCJYV64uNkMtJqwAl12yuQc8FzdEoJlJN1fiwQaDS7Rj6DByxAdnxrsiGMuvwh5U9LvAWXh+FHyZ1IIn8xoQ30fOdAVcMnJVAOKlr722qp+JMdPDmqE6ihambMuCpeCc7TmUqtjXVgwyKCNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516508; c=relaxed/simple;
	bh=kCCoJ5RwKQolBiAA1kQB5iFFOpCZeo+oFkwyg/N17Sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AIgakmHLPHq4hdsgaPlRjvXsVPSKmUUWUBZ5orsILtRE++KQmy4Za2VDgLAqAOSdKBRae4slNr4m2faTllWPW5mZ1K+KaDErIQidxp/XZiMzaD8AfaHVWIzbwJJGH6NNk/MpP2zqZCtl2hD5j0bFxF4jsun0TCnVGphItLRDZxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IsJf6K3B; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8IwWs001035
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=aEG/pSOILoj
	2TU1370f8on43zZiCQpPRxIAIX2faToc=; b=IsJf6K3B8XjZ+57NZHLNc5llHgi
	PUhrNITiWYmruBALhdGIOU1yr6CSxWMdpirfDdVHVcFW0GdTEDcqU2qbGs71qmHd
	pPTolNvT5M9KduDzgFauWV5JobE58U++mqLrs3btwkGOp6kGX/GogNxNMpE2d/Yy
	ByNhJgmidTgk9Os2yTog+0qPfgktWtoWKqhPG5bLqTcDvqwBq7BkiQwNgTPLSEDq
	k1C1b18p4O544STMFhKf+WwlBJVmaQ9VJpHZkZJuiapAWRsH2WAhccHe9AWea1cD
	Sfa9e0ubyccNXHi6kaWRs7pWTLSLSFnB4/zjkYKnCrNUC3opijkivSkHMDQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jgxtckj2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:26 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a928dc378so101086966d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516505; x=1756121305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aEG/pSOILoj2TU1370f8on43zZiCQpPRxIAIX2faToc=;
        b=vR1VCt8FjBzVQF+U5Hg2gI/XGA31F/3krD/aJXnrH3RP+p2h1rpQMeO08dtTjq2Lqx
         uwZQhtyNn4npdAmJoAvpvsCAW+H6l3Hjn0RYw8gDhbMvhVxJVu9sA6k24qtksMJog8W7
         3L/+Kcs0CrsTrbY7aZUmNvlfhR50mU+ekGsPpOIX+28otyUGmBeh1wqMoxny6mvbkhoq
         YmooET7toBdJ/8bb7BaXY3vETSM3cQ2KEGkjoeRJpryHcj6iYlRxlm1BpFD5Nai3yXUV
         ZK2n5ksylcYwgwcfeAy3VTZbCk0fK7cfSFVvwmDkVVv5bCGDpjlm2IYjOyDiT1jy85v+
         Zrag==
X-Forwarded-Encrypted: i=1; AJvYcCU1UrQYho199zuzB5hRohqCkrbCWthZt1qal0J5GJSIykW6hunxYlW9Bzp9rUhgDFmT9eBcUSxL7imPVo8+@vger.kernel.org
X-Gm-Message-State: AOJu0Yzb+kBypo7zxdRlwQ8JI9BThRhE1sIjTkoiw/TZg6f/GDfUq28A
	LsobPoylQxSoyipieYquxVV/24v83Norm1v1Yrx7KYgZGrXv/eMWU9fUN/qAOX1JLgeZLSNPgei
	o3gHFg1Gg8eY3KdAh5LJS0buoic+ioOY0r5gJhsDPBcC3Dk0beV2Uj0WfPuI2n4JQuk59
X-Gm-Gg: ASbGnct82RxKb+nLYw6q1rR6mTfcvotH7sWI34OpLxXfFzjhZrXeIR+sI1qUsD6RPr9
	FLX+EyG7ZGSBLavBnb7sQwv4fQoaGudWnQ4ZOUbSiBJHYYj7tCR51PNhpG6TgK0W1aoA5Jc1dDx
	fnaV4Ljbuj5jeKAlxdfgFR8wQJbG/s1ZJLP1Bpv9VesceM/7HisOtHnsoJXl3E5kwgOm9lpbZ1d
	3eBQHxkGICtUPN8N/Fe12JJHR7CnZI0C2n5sB7YEFIvp6Y/auQUrHKEDrFQdFSkcQoJ8iR3mMhy
	syX/3EW1aAgnIFddYhcbaL9SrbzUxAx8yhh7RZjUYuAEblyjqHkrkw==
X-Received: by 2002:ad4:5d42:0:b0:707:6302:90aa with SMTP id 6a1803df08f44-70ba7c0b327mr153413836d6.27.1755516504644;
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEoAaVCg7dtdc43vun4MXHoAIdJDtyb/wj94R1p37DqIMjS5Ciwuah0xG3L7hnzi3f02mBhig==
X-Received: by 2002:ad4:5d42:0:b0:707:6302:90aa with SMTP id 6a1803df08f44-70ba7c0b327mr153413286d6.27.1755516504156;
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 3/4] ASoC: qcom: audioreach: add support for static calibration
Date: Mon, 18 Aug 2025 12:28:09 +0100
Message-ID: <20250818112810.1207033-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818112810.1207033-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: RxPQSetm-mdqTWZD0bfSAA197aXfizAk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfXzx50zRHrH5ob
 9kGlnLgjODqciEm3+2vMXLL9FBUtYIh7pKrynS2S+EeW+jvxSO5AqQjnM1GeplyHtt2saZZFtFj
 1jjQo2LZ822jHgiM0ypRMnfJtVHaFKnc8wNEi8+G7nIe2PeNHVsziazhZiyX3wBZEvyEqzGcEu5
 zC6acJ6kZmqKbXa+iEXlgEc/qhckEIGG7ahdqPXhweodRBxOfbce9Qyn75rruUg4rBwPagz+qTl
 G4fmgRyCIue6znIxsWin7otojGwxBHap+Y4VngQaeMLJ210XxTiFCFNq09fOcLOM2CwS0V9gGC0
 Zw3lUm9bj06+k7cr2Fjc8ostXSSwL79+viNqiFPxH+AjIRGqT88n3HbDJpWsfqAq31NonRE1X7i
 GdDUFttO
X-Proofpoint-GUID: RxPQSetm-mdqTWZD0bfSAA197aXfizAk
X-Authority-Analysis: v=2.4 cv=V7B90fni c=1 sm=1 tr=0 ts=68a30e5a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 adultscore=0 clxscore=1015
 suspectscore=0 impostorscore=0 bulkscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160020

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This change adds support for static calibration data via ASoC topology
file. This static calibration data could include binary blob of data
that is required by specific module and is not part of topology tokens.

Reason for adding this support is to allow loading module specific data
that can not be part of the tplg tokens, example, Echo and Noise cancelling
module needs a blob of calibration data to function correctly.

This support is also one of the building block for adding speaker
protection support.

Tested this with Single Mic ECNS(Echo and Noise Cancellation).

tplg can now contain this calibration data like:

SectionWidget."stream2.SMECNS_V224" {
	...
	data [
		...
		"stream2.SMECNS_V224_cfg_data"
	]
}

SectionData."stream2.SMECNS_V224_cfg_data" {
	words "0x00000330, 0x01001006,0x00000000,0x00000000,
		0x00004145,0x08001026,0x00000004,0x00000000,
		..."
	}
}

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 include/uapi/sound/snd_ar_tokens.h |  8 ++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 3aa5f4928a2b..4896d8f02165 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -238,4 +238,12 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_LOG_TAP_POINT_ID	260
 #define AR_TKN_U32_MODULE_LOG_MODE		261
 
+#define SND_SOC_AR_TPLG_MODULE_CFG_TYPE 0x01001006
+struct audioreach_module_priv_data {
+	__le32 size;	/* size in bytes of the array, including all elements */
+	__le32 type;	/* SND_SOC_AR_TPLG_MODULE_CFG_TYPE */
+	__le32 priv[2];	/* Private data for future expansion */
+	__le32 data[0];	/* config data */
+};
+
 #endif /* __SND_AR_TOKENS_H__ */
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 9b30177463e6..617bda051cf8 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -4,6 +4,7 @@
 #define __AUDIOREACH_H__
 #include <linux/types.h>
 #include <linux/soc/qcom/apr.h>
+#include <uapi/sound/snd_ar_tokens.h>
 #include <sound/soc.h>
 struct q6apm;
 struct q6apm_graph;
@@ -742,6 +743,7 @@ struct audioreach_module {
 	struct list_head node;
 	struct audioreach_container *container;
 	struct snd_soc_dapm_widget *widget;
+	struct audioreach_module_priv_data *data;
 };
 
 struct audioreach_module_config {
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index a3b0f558260c..ec51fabd98cb 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -305,6 +305,34 @@ static struct snd_soc_tplg_vendor_array *audioreach_get_module_array(
 	return NULL;
 }
 
+static struct audioreach_module_priv_data *audioreach_get_module_priv_data(
+		struct snd_soc_tplg_private *private)
+{
+	int sz;
+
+	for (sz = 0; sz < le32_to_cpu(private->size); ) {
+		struct snd_soc_tplg_vendor_array *mod_array;
+
+		mod_array = (struct snd_soc_tplg_vendor_array *)((u8 *)private->array + sz);
+		if (mod_array->type == SND_SOC_AR_TPLG_MODULE_CFG_TYPE) {
+			struct audioreach_module_priv_data *pdata;
+
+			pdata = kzalloc(struct_size(pdata, data, le32_to_cpu(mod_array->size)),
+				       GFP_KERNEL);
+			if (!pdata)
+				return ERR_PTR(-ENOMEM);
+
+			memcpy(pdata, ((u8 *)private->data + sz), struct_size(pdata, data,
+						le32_to_cpu(mod_array->size)));
+			return pdata;
+		}
+
+		sz = sz + le32_to_cpu(mod_array->size);
+	}
+
+	return NULL;
+}
+
 static struct audioreach_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
 						       struct snd_soc_tplg_private *private)
 {
@@ -582,6 +610,8 @@ static int audioreach_widget_load_module_common(struct snd_soc_component *compon
 	if (IS_ERR(mod))
 		return PTR_ERR(mod);
 
+	mod->data = audioreach_get_module_priv_data(&tplg_w->priv);
+
 	dobj = &w->dobj;
 	dobj->private = mod;
 
@@ -939,6 +969,7 @@ static int audioreach_widget_unload(struct snd_soc_component *scomp,
 	cont->num_modules--;
 
 	list_del(&mod->node);
+	kfree(mod->data);
 	kfree(mod);
 	/* Graph Info has N sub-graphs, sub-graph has N containers, Container has N Modules */
 	if (list_empty(&cont->modules_list)) { /* if no modules in the container then remove it */
-- 
2.50.0


