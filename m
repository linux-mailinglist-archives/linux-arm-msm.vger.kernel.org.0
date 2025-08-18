Return-Path: <linux-arm-msm+bounces-69551-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 18159B2A1A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:33:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0D740188F8B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:24:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56D03321430;
	Mon, 18 Aug 2025 12:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NQqU+qG5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1365C31B13D
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519778; cv=none; b=HY91xbntrfBLenypV41l6De5B2xWULG7t2cgTE7530fCWDYBg4XifjtO1vVF/UsYfrPyFyYNbSXJJ9F+UhEwtA6F6Pb7A4ywD/helaJPClyYGuk+CfzvjINDF7HK42ks7e0afcTMTFXsvnPKz1/YMzkqd1ZKR4bAEs55fbLZk4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519778; c=relaxed/simple;
	bh=0r9Hyf0nVDtZIhGlg9pnxUosjJ8q4m1DneRXJydATCQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y93UL2pWAq9jdDwvvVToFuHZBFcWjqhxzGQvcUtcXYgol39PF77BU1Pyih9YlD1Dbwcsymwa/V3cyEwVxpNaHKUpE8y4ybg3C6VCtrQZcDKzY8fj7Be6btqdFRHM5hVhK3eLrQuDzdYpsxR3ppEvI5Mcp9qe+L3ZnGI4Hlw6ZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NQqU+qG5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8OD1w023911
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=cxCH5jc9rps
	/mrQJQ1gQYWQ3StnbOOQ8G8DFqXSrAMI=; b=NQqU+qG5FXHYClKSYO4okcgO1L+
	y41z3kZdy2irxE/veyMuqNixo2xoaKMG/u3UWlzINpOIJcePQ+DA7IQtPbqkS6Yw
	M/1yMnY/9ggBKmp9wLBdJrEmcQ/RXzEFcS/7DNt+vOtKBvJkxrE5bZwxybtCBEqz
	k+f2l4wjnHQ8ndeOMtP2IE4xS7QC3N9GHFlZwDGYgHB6pMTSH0okImCH/MDk34lZ
	k3zff6RBqSBuu7VR/fRRXpBWGq17TAQZ+sg8XzksNhfq7RacPTWGCHJELbJcoB7Y
	7ZYOq07DsZ8nsL1y0c7Zq8fvZAlifehu+ToAQKJv6Ivbd903dru999+5eEg==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jh074pha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:22:53 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dd0193so97085726d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:22:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519773; x=1756124573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cxCH5jc9rps/mrQJQ1gQYWQ3StnbOOQ8G8DFqXSrAMI=;
        b=dlMhel9KBtBemsGk+/hu/RQJH0DitwljtoFh1MXbdt3VxLQrYcd6mLsJaq40EcYxWZ
         hmGTaAsws7BRcrz4ywlEHXAWE5HYtOV+pnlZIJESgnxa53RFrqFkcdyMQ4hzEv3ddAH1
         z03RPT5bbpFTg4uOwztnrXkMOf8bVy8ldeZNGw9ubnh/BHjiE5Z/A+fEN8MlqzSdbGmP
         lPvnVGZR7I1/xKOpz1qMY4sQxTBS2heVmTSnby1CFbmrjz7id5WclNRdT4dtOtPzXJV0
         uqnI3hazfL3Cef0KYjF+CpX+F3uX6AkzcGqRaHbxhFVkl24DBEO0NneeBQQDiAF8TDt4
         qLGw==
X-Forwarded-Encrypted: i=1; AJvYcCXQMGrzDIbxT+Jw9TcxOlRmnULZl9JcOC09dPONVluf8mf90B+dWLMiuJEv/Kmdj3VXD9/ulI/6s+iy2tee@vger.kernel.org
X-Gm-Message-State: AOJu0YyB0b4Dq60QXUQC/EzCqQEDYfLB3BJEchg9xErtC1r2TYOm0AK2
	x0wHJHGCN1Ifay/N9CxjHka2XWYLIc0cXoi8ocVf+f7z5ohKUFbyq8X3MmRYNEH/lbfHhuidl4J
	C7AeeBUYZoZ/ypx1o6km/X8g2tCrWD1wEyz6jYIQKGm9KwxEaAh9IEAt9q0L4rvR0Dh4i
X-Gm-Gg: ASbGncuAEPOdlmwhUUUUBDw40toJO09FYywL1iriu9W0bWTo6QEnDFuFfZfH3NEyKJV
	FZCPnIgmyM05TjxbG60WgGCpzUOFmcpAo6WgvbsfdbLlohzf/7l//JpqDBOJpQkQiAu7/jTvmIt
	O3PRNW5nNxzwR7QP0mh9uTFJ1YH7Ghr1ii3GaEvE1x0uBOCgIQ+7LUUBzGhPvQnzQKordb9NtCU
	iiNlI6F+RZl/S0nAneGTdy4FoGPejetA7JUEBR/2cxE6+axmEz4c8lgagI73QfTigW9uEZl3IqX
	k6cx/KtJMIo10rwpQYDqX35z4AxgSSLY3O6TXu8EYGeGv/li7apk2w==
X-Received: by 2002:ad4:5c43:0:b0:707:5319:d3f1 with SMTP id 6a1803df08f44-70ba7bcd758mr132199226d6.32.1755519772842;
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhUYdasV96pnAGAVB482zMVwB+ztPSFkdJL7AZgDt1OaA3hCb8rRc++U4kwgJmxmJWnSwk2g==
X-Received: by 2002:ad4:5c43:0:b0:707:5319:d3f1 with SMTP id 6a1803df08f44-70ba7bcd758mr132198696d6.32.1755519772199;
        Mon, 18 Aug 2025 05:22:52 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb653f657fsm12601563f8f.29.2025.08.18.05.22.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:22:51 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 3/6] ASoC: qcom: audioreach: add support for static calibration
Date: Mon, 18 Aug 2025 13:22:37 +0100
Message-ID: <20250818122240.1223535-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20250818122240.1223535-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: glW9i69VpfPm31hVLOjw9e-aUnsPhU48
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyMCBTYWx0ZWRfX8tGcNDZyTXyP
 oXOP1m7VqpWAjQVFjF5W3xqNlDXhKtmxa5BCRTuhCIUliWHp6xWS/XKq+IRXaxyAcMfQ6meKSPi
 N98VSTDph0GCgbv9VKuPWd0+rdzV22zLF00S1pW2w80WWWKqSt5VYkIcnwF/6sDkhNfRJNLybtW
 P5WbIeMhw0FJzK+T2v9EA8WrwPR+qFupGjV6nUxNkFB3omhPfSuFLPmuY/dqU4BPqALuOkSXhnB
 s/glBkSdfM2yzahHdDgvrEFJsHG+Gb5YghA3pqUq9C3iAc7UMkpxVcmf4HlBewNS8uSfQYoHVtx
 pUtE7TVaTfqR7QsKBdW6QCCvDfCdpcl7vxOluhOtIoKDNkugfglXPBjaYw3xtBWQGSkM1GXW37+
 LRDq4b0x
X-Authority-Analysis: v=2.4 cv=a+Mw9VSF c=1 sm=1 tr=0 ts=68a31b1d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=FkCHEUkhfVKCBkrVOAQA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: glW9i69VpfPm31hVLOjw9e-aUnsPhU48
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160020

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
 include/uapi/sound/snd_ar_tokens.h | 12 ++++++++++--
 sound/soc/qcom/qdsp6/audioreach.h  |  2 ++
 sound/soc/qcom/qdsp6/topology.c    | 31 ++++++++++++++++++++++++++++++
 3 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index 3aa5f4928a2b..3e18442d383a 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -120,8 +120,8 @@ enum ar_event_types {
  *						LPAIF_AXI = 4
  * Possible values for MI2S
  *						I2S_INTF_TYPE_PRIMARY = 0,
- *						I2S_INTF_TYPE_SECOINDARY = 1,
- *						I2S_INTF_TYPE_TERTINARY = 2,
+ *						I2S_INTF_TYPE_SECONDARY = 1,
+ *						I2S_INTF_TYPE_TERTIARY = 2,
  *						I2S_INTF_TYPE_QUATERNARY = 3,
  *						I2S_INTF_TYPE_QUINARY = 4,
  *
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


