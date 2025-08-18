Return-Path: <linux-arm-msm+bounces-69564-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57828B2A22A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:51:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B55E46209B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60E5A27B355;
	Mon, 18 Aug 2025 12:51:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bbs2Z51K"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93A1431E0FC
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521464; cv=none; b=PGrTEYWziwd5bidPjF2O1SFUItRK/4Jq+U1BUBsdn2i3wllurxBAFmwcBdclj/iexw0zCArI7k67/OxcfbVcAt5zAGCVSzBP3txt2T2VeHedo9pXpRISiBTNnJJuCRMQoXod9ZyDgjpTSx7ulx4D3TPLvkzGOfMhsL9DcviWpPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521464; c=relaxed/simple;
	bh=lMnHikDt2xPUwNu7ernNychdD+CBhIRxNA593e9iJMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iruQIgwfNwSswTRDUanXzEodhUtShHH1WA0zd6fWO8JXmxUpLJ16uoBRH8iAAroM0/mP+BvxUq33duJ8RjLHwsrzUQnYOOdS3d0javuGED92do+inXzns4zp0xTjblOjLZvq0d9GHzGuO0f4puhjzr/ZTV37XeX93ihSUQO2GUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bbs2Z51K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I7pjn7007143
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=259VP3onLw5
	dwQjsAMaa1sY9Z4N6xhGpKI2zjU8vG8o=; b=bbs2Z51Ki6cnBHzBrBApv1BjN7+
	t57YfSEb4k+9vtsj+dPs5ZYO1/8BoT6xS8hXPva422+XL9zTndIF9KiU14Ni3Xzs
	/OvXUu4POFwaJbFL41tR22YNu/f/XiPjMGFdWI0QwiVtIlWwa+u+crZojJlNW4Mk
	EZx5CX2uVZ5PaqG9VMH5cnYVsjNTrhQxWNYDPmuYcmVxa6ZfJEdrw1PX3EE8T+87
	FN2a13CRh8Ix26Jflhn712bTsVqhvj6h1rljEcxxQoGrH7eNlnno+pQyBj9pAVW9
	RzV8m/h0AbnGT8ffxTVFUAUHWB9XJDRyXMSo1MH9K4rQLgKp6tskjETatMg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jjc7vr6j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:01 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a9f55eb56so100659086d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521461; x=1756126261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=259VP3onLw5dwQjsAMaa1sY9Z4N6xhGpKI2zjU8vG8o=;
        b=d+HRybZamR2JXBSFZYPhNhSYfG8eZYRxNhleqV3fM0h+Ye7CzPAJPrd4buDIgSwO0A
         0ZPrnAmAzdAJ+8nK5UIdSzcnuTrDLPFnXfgnvqq5QlTd8EW5GywH7bYwly9TIu5V+fBe
         oPmM9JYEM3qzd0yCBvwlqgcGRPHQxWdgKrAoDSGv5IJD6BOfyryJKY/qkk4grXngyJcF
         b20fLt+GQdEmb7mtfDdCUrTWOJG28eAEAmd+v11B9VQlCi4NpuCe9TOQ9uzG+4ot1RJb
         aFYpLJKZ9xgS+b+EVPoDhMPieI3IyGntFNircPvQo780So3fxZ1k/+qVhw9txxSwPrTW
         tqrA==
X-Forwarded-Encrypted: i=1; AJvYcCU6Wkr6grUmpZ38DkfpgmG/7v5R7HrU07dDy9iQjR0Pm9tAvSlc4ib+Aq0Ih4SfSNAyshuqHN+IhOnHigOB@vger.kernel.org
X-Gm-Message-State: AOJu0YyybW/e5l0YlJ9qvN+gbR7rbuAmcsrLIEeA6zffnrJU+JUz06GJ
	sywHBFoXa2+RKEH5wourRgzBFzhI5vgUPhEMqMGys0CnVwXBQFU1c4CkYwT7VL0H4B6141MfG0D
	sj1vpACDmukzUBVDkhurBYjpOPuVUoAynmLbwJ3S2pDhQTPPMVurba/GJr/BJJ1MM8a4H
X-Gm-Gg: ASbGncszN9JyTSXL1PTvJdBLNazt9MiQwBGux5Y0XGCf18fqtBeMC8/E/Qlm1vJS4X9
	Sr5isExVOMF43SGIgYh/iG4HUS79MWLOOCByXdd/up9iomYp8hytD9svVH6iQdvr79CheYiA4JC
	Pu3BTgIGdbfanWn/SBAtZxHbMsSTlFaq6GhY2f56aQYcFxu8593djNwDEZt1rkDBRLsV65z0r/c
	gvOHaCmkUBSj2AM8ZhByuQEjoIAhayGEJZoOg6EujeGAVjMhK1h7UZ1P1yJV7jkknvkMo1oNlSh
	b60LfqN+2A/eZGnVyp5OXz9LIs96chnbRx2jAwRWVh+qMADWAC44VA==
X-Received: by 2002:a0c:f7d1:0:b0:70b:ab0e:6b79 with SMTP id 6a1803df08f44-70bab0f3e7bmr99081496d6.6.1755521460685;
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH59B7x0owy07zcuXrgr5JzJamOIuQA4OFL9/s6uhV0smmoMmgRhuJx6ZF4VakVhtzC0Vb2xA==
X-Received: by 2002:a0c:f7d1:0:b0:70b:ab0e:6b79 with SMTP id 6a1803df08f44-70bab0f3e7bmr99081276d6.6.1755521460250;
        Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:59 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 3/6] ASoC: qcom: audioreach: add support for static calibration
Date: Mon, 18 Aug 2025 13:50:52 +0100
Message-ID: <20250818125055.1226708-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818125055.1226708-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX/jYUQKpN9lzs
 fSGjRB0hRzWmh4ZvHM0sp8uM8V9Vp1FyYFGIIctsDy+VBCIXnvwWAZcXtMySjSNh5fN1NH/CqP/
 MQF8XFABBkJaNhWwUUAJuYiyu52g/dHNjH9iu228VxSu3JdilBmJCEKJ0Rw4+gO+b+wkmkKK15q
 1A2MDRhuwAtI+wqM/vODJhLnfkn/39nklrme8uS4YK4UHIJ1aDDa3iGbJ/JDExDrlMVLNnkqyJA
 qE2iGS9TMHcmUGV/zRIB171GF/mf11zWxExErd2rcf1c7eZSQSdxMkJFmIH0S3Dkb0qCGJCIL+W
 RNaR7CaFB1WuxGmD3oci/Gr/HNn6ysBOEKyO+nX18r8Zm7ynvHHW0L6pp8pTLuLz71VWgEPwHCl
 1Zgq6KLr
X-Authority-Analysis: v=2.4 cv=c4mrQQ9l c=1 sm=1 tr=0 ts=68a321b5 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=1HOtulTD9v-eNWfpl4qZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Ih-TO5XBPm6H4yj3JlluT8kW5eKgFXjx
X-Proofpoint-ORIG-GUID: Ih-TO5XBPm6H4yj3JlluT8kW5eKgFXjx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 bulkscore=0 phishscore=0 malwarescore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160033

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
 include/uapi/sound/snd_ar_tokens.h |  8 ++++++++
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 92cf72a6fdd4..3e18442d383a 100644
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


