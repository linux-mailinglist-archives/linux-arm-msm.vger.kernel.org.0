Return-Path: <linux-arm-msm+bounces-69698-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id DB972B2BD6F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:33:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12E3E189459F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:28:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A18C231CA7C;
	Tue, 19 Aug 2025 09:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e9gvmYe/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C79A731AF05
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595622; cv=none; b=XsZIkvUqWe9TX0NBepKcTClBSZ5m/dB6g82JV/U1XP5p2WI8yhIC2+gO/Dhm26GLBtKK4JFH9H24K0WwRVUNRzTS1kkSNSpi8Sf+hrA4jyZvMnun3hIntbL4Wsy1DxOGumJ2lV4rGrI5xwI/vxbPPN9Cc4TQddteGG9l64dKMIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595622; c=relaxed/simple;
	bh=XBbKaJVEpJ0GLksbf9mqJRlB8lYIex/t0O9ath5WT6s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qZdSg84RKPbCmVcOrKXDOJEKKbUTFcJCAh8qNo7XjxNk6gKshBFnBisglHv9G8YEkQ2oiufwLMamVwKnqetzbBQU2+oJO47W+Fh1/jpnGAHRSGDf2VdSKqnB95LYXDm5/N2FmfiLMvHaFlcjOFUHxM7SK5WiKZOC/msJHTgcoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e9gvmYe/; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Y8c008305
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=tRc0HsrjFgZ
	QuPsk7St9wVUwcmnzl+/hXr2r0k0gJLw=; b=e9gvmYe/0D4sgudbU6Z+lCkMKQU
	xJx+Mnc1bgnTKkr0DCT+lDGPB+bEocMM2hpieyNwzmnOguDHc3PTVUBC3u4yIacP
	FBukPP2mn6455AVHVCoBsMWGrb368lg5N3e/itYuiQTKLrGPN0QP73zZI2rrqpLG
	88du91ZNoTJxdH7g1xMKYzDctD8ImObnfdCsxBEWlvSyROIgI1l4nq8vXkDRwVxY
	sFlyT3UJ4sfqvThYYuCHYWzmrcstieK0QsKam4O6l+K99EsKtU4EMGEdjZhipxSj
	+ERbxNR2uQ8iD3BhHs/Wshhlsi524TDGXQPSLC6JvtxbWmgGrn2DinbMm9g==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99qx2v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:27:00 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70ba7aa13c3so156800966d6.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:26:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595619; x=1756200419;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tRc0HsrjFgZQuPsk7St9wVUwcmnzl+/hXr2r0k0gJLw=;
        b=iA0EcW24TAlUn88d1KYv8VOBsE8jTxDoXcU87f3blorDZbDjx2COqwEsZYQCrDK617
         nPTCRWAOFV0Es4CQzXNJm0QlGdOt0j0ZrlmGlv8rWqfD2C6FTas012JoDNFQRqF/eQjN
         95j828Nbn7yix7A78NeJgHgcTuFZydRc98O8+CZ+J+A3i0KQYZTpMLJKdCeOLcmClq+J
         Szbd2BNdvd0wXeu1y76ph9GNmzT+CLHvEisplJYKOziGOiNUh506iePMNWNO5YJFQr3H
         LCaMKIP0cWZ7C1WXIANNIYBFZT7n1ta2Dm7/YRnyMjo/OuvIwih8ajGHr19OmWj8xqGL
         iwDw==
X-Forwarded-Encrypted: i=1; AJvYcCWpSWSFVE4NVz8Mf7Plm+kf6c+asCEAV1zZ5UVBsvNHzJseNe/bi7ssEnUhn6NLQf45l2s558lKipGc/OIU@vger.kernel.org
X-Gm-Message-State: AOJu0YwwWaghuxJjWKblE4x2gN6UpLjYLK11+L69+uef94gSMdnveA4f
	yTHeW4QsluwWCbFGkE4/7+eVt7F+OasBNL62+2LeloL56jmDS10iyRuAEuuFfYwd1F2D3fE7GiL
	EsxRUHFQJ6iUSEOy3IJC2bUmEmiKmS121k0m7D5IVjuei5MJR1aZ9wqg1n3L7T0sTWwvO
X-Gm-Gg: ASbGncsJZ+Fwbr6XiG73hcNQS9jC9yP3U+TvEL8eXcrpMOtwLOMjtEFIXlEfFHtDETd
	0RhT2mmdOiOEAArs7PvpRoItcC9gqV0aGRQ2vRKh1IGBM0emGUFwLhm9mAnf4GkYODjtGvaiIKl
	UdgJjuag5BjlQ8bfIRvXNA6nz28bQlEK91QOO7xDCK1trox1CiWPa3iIowKXil9YLlJNLcSp+el
	SczKM12i0kPIw1iDpsHNq9Tlxz4LrYANzDvfEluJK4EEGhGG4LInjUnDpozHvjET+srh3PDFrIj
	0tSrjWyCC9UF+qZKappQ02yZBYt8HTu3XRG/Kre9KRDUttay6VguUQ==
X-Received: by 2002:a05:6214:29cc:b0:702:daca:9049 with SMTP id 6a1803df08f44-70c2b5a86fdmr22294756d6.7.1755595618714;
        Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEEczTvtMT3V84/iEznyx6fTKSBBBtCMsz8auju4qZpC8eBk0cvZJO3sjSyfGCn392n67dzuw==
X-Received: by 2002:a05:6214:29cc:b0:702:daca:9049 with SMTP id 6a1803df08f44-70c2b5a86fdmr22294496d6.7.1755595618120;
        Tue, 19 Aug 2025 02:26:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 3/6] ASoC: qcom: audioreach: add support for static calibration
Date: Tue, 19 Aug 2025 10:26:49 +0100
Message-ID: <20250819092652.1291164-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250819092652.1291164-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TJuYEKKY_B2e1P-hBlydr-56zrp2fIRg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX2TXbIsiS2KQ0
 aY8o45U6RQJ90imJST0rB8NgHEcO/xC9f1tQeXSsR/ug0oh9cQD91XHLwZkPlBL5nayIbQptzlq
 F74oVy5L79egRCemuG4HmRNEOvv2H32HMRmqlF8NxHVH+g4eCAxbGEYL2w3K3lWWsbLN0QXI466
 +kAedJpDZaMdKg6C7a+xkLSotisQve4p9Zov/uqmdMF6QAxO167/32pcMq1jy3u3vvi6c0Y/G1u
 l91afumcoxPRi9N60Eri2psqV+MCpoSLuXl0lSNwDj2ZhQDl/H1rK1y5R3gQWN2vgXCpbpcO68B
 RWOYk+lFhcuTJWHxuiDEnSGcTUEPpDOUi/CP9VxmGRT+x+A4laQjyIEhiwrsSg+bSEAS3QT0akK
 DM8y+1Uc
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a44364 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: TJuYEKKY_B2e1P-hBlydr-56zrp2fIRg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h | 10 ++++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 92cf72a6fdd4..6b8102eaa121 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -3,6 +3,8 @@
 #ifndef __SND_AR_TOKENS_H__
 #define __SND_AR_TOKENS_H__
 
+#include <linux/types.h>
+
 #define APM_SUB_GRAPH_PERF_MODE_LOW_POWER	0x1
 #define APM_SUB_GRAPH_PERF_MODE_LOW_LATENCY	0x2
 
@@ -238,4 +240,12 @@ enum ar_event_types {
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


