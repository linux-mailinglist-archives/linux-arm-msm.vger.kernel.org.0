Return-Path: <linux-arm-msm+bounces-69696-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A72DEB2BD5B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 11:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D1EF83AC6E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 09:27:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9441331A068;
	Tue, 19 Aug 2025 09:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQren/OC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE5CC311958
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755595620; cv=none; b=mm7z6ZiK9jogTVCRWY8ggYN/NxAqjakcBJxPsLRBPoZpjFuSlL5lc9Zi731LC/LYIa3IBGhNc+dloGrYfJFzfLXidT5dfnLSAyWVK0kG7jlLZjyS50deNZBjc+Tx53/WE9swzh9MAmC4HJ+wtRcAo22O9CcYX4WxI3JvBsc9Vhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755595620; c=relaxed/simple;
	bh=hpGzTc0IFp4kxDa7L0DoR4eGGYq0Ed7d5aUx9Md288w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dde5SAVr1IAjsbWzR81DB8/D5QeLIb4oZU/6Pgj/wCvWoyGZVH6EmaWCTZHmvkIynsOjxK9O6ykEJoc96LZEm6tqVPP1WV/hLBh4ZEFQqS/Xp/ZUhpnQVyvLwE7EaG26duOPTh5u+iyVYkrJXOFCDatdYfnRJTO2VFYnW3pPK+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZQren/OC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90aw7008336
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wM721AZ4mzS
	KZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=; b=ZQren/OCPoXWEW3XoIRoD0JJKE6
	xTCXK6cpHoeOQkqcUEWySwmVHS1UenWZ/LaxAa4f0pcW4aCy+mIG0Zrw6jg/fk8x
	Wr5U1FU67N9iy0w4Lkrk0U4qaq0ULkU2aqsH5kfupw2ECDtbWnKavZlu1lblsqkF
	sj9DS5OJktita3NSgWtsRIsR7ke7OzSsRHKuqv62hXieyaL89xfOmD5FjXZy17cv
	RS8WbLtdPrd5mK051RrnhkBj2AO2YBKC7rLkZ7BzfjQT1Nyst1X0UqVquoLLqXgz
	DkqHj+54fXzWsr3T0yy27uBEGxrks595wx3K/NQxhyEF7fBoPo8U5jrwzDw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99qx2p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 09:26:58 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-70a88dae248so108104076d6.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 02:26:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755595617; x=1756200417;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM721AZ4mzSKZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=;
        b=vODW2xAsbFnkSAJl/RPHRQvMcrOSSwjf1YlBfZJI2oI3VHIF5na1fE3a41KNKXLYbl
         Zj0dHrTLoHrbmRFf2YME7FVUVB8B+QTWqZc3mgVwq3wd17K5xHXHksWImrlG2gdUjf0l
         /ejU0BtHhL6epMd0EXbOYFEI2oDuupfUKqZXU1pf93cY7iaCY3LaAhZbs5q5MX/MoghL
         WdkJ6AHxoZwU4lwRKSFYt+lTzM4xHMw0a+0yPDur2h7GRB9XNl1qQTMCBdCihfxjuILM
         4fX6S0E7KoK89+QfYaufMvlyAWxIvOQ94ZsDLVR06SMDH/qgnrNEXB/PI3O1a5EIZ/u4
         PlZA==
X-Forwarded-Encrypted: i=1; AJvYcCUtPUckYzc2etntKoxenq/RNf+XSd8NBNi8UgLTJMJElW46qLeGB5pGQPvNt7LXLj+jBelBBc449EAwu7X8@vger.kernel.org
X-Gm-Message-State: AOJu0YwcumSVxRHZLnS6maKoFo++b69Qb+q6YWNVDH8RGFQDqm/zZ0Du
	qoAeoLgeT0lonKjcfcnjXrArzqoS2DFC2YRhHwmJ1UdnlI3fgR8JJPEwfjrJ0L3MD6ZwUNleBBV
	2bZujMbamkTekJQQnMEEDIQ4zEBhL8fML8WTZaK+6GV1lRsOefm7YjUg5UG5x7x9jEckF
X-Gm-Gg: ASbGnct7zv9MfMO8+NtljgUfjgpRD73DFKlw/Z6c6TYDAYNDBHVs7WhOzoDPS5R9hHQ
	Qke5KSY/+IBfLZ8LQPHcUZ/GXak0knwPbhLzKYg00oVJPG4mLrDomK4tukZw1h9V6lLy3QIyAun
	P03wKG48GH3WhHPWf0rnptGCluWAhj2wiKfQR2i+Wqz86+kkw/prkVJD9erfTRykCwXgM/gClgb
	GATShdtpeBFTMoLDqaoXrjz88nDWTbACW4wLo0h4QBG53SIZn/EFazUxhKH4336EZY5l9/7CIao
	kOJXPusCRK5aKUMHUEhVDp8zSWZUXDWlW678d7llInz34x2WNzbhYQ==
X-Received: by 2002:a05:6214:1242:b0:709:e01d:95e7 with SMTP id 6a1803df08f44-70c67848befmr19306446d6.16.1755595616678;
        Tue, 19 Aug 2025 02:26:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9GqDmEUOZr1/l47uzimaFTEtTx/+XaK+m2zAjBVg0cMA8rGGZ5FkfoP2eu0JKiyv62TuSMA==
X-Received: by 2002:a05:6214:1242:b0:709:e01d:95e7 with SMTP id 6a1803df08f44-70c67848befmr19306306d6.16.1755595616236;
        Tue, 19 Aug 2025 02:26:56 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3c077788df7sm2942284f8f.48.2025.08.19.02.26.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 02:26:55 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 1/6] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
Date: Tue, 19 Aug 2025 10:26:47 +0100
Message-ID: <20250819092652.1291164-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: tAUIbplv9NUttU4QsL8SEiImvyKSzK-4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX2OU+P+Z3eKPp
 1ScOr/LLAFOTlxGoHjsnq2TdLP0rXi8h3mHOz3f1HboTyZo0VhZAOUtr1G/ZYA0kndmxSkDDOr/
 Rw5QdqUqhoARNUnkyO0Wr7SfTopXhU8sye8HlwAZVPmY1qltkAz0HmGbNHG6cywifrVMjq7QwEE
 oj/KhSf8GoRLNoY/8v4XAWIbR6hh4MUVYcO0Caxd8T2KytQfkLcb7cZhQky/6Y8g8ZTad7j08Mf
 HnyawuDjtjUSXR6951JC7evkMuc1fMoXh9W29UNcMbxFBh6O8H2VuNh4KyMzoQaujAmO45GMbIC
 E3CmmFA4VKbwmx6ysngo5yQZv8G3WK1vHNUXPth/FQuW+CeIqgJ0kWsQIBRbtk916+TWOok0WVt
 vhsfKVLn
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a44362 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zhxk0K_MHdi4n0KV9BwA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tAUIbplv9NUttU4QsL8SEiImvyKSzK-4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 phishscore=0
 adultscore=0 malwarescore=0 bulkscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160045

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Deprecate usage of AR_TKN_U32_MODULE_IN_PORTS and
AR_TKN_U32_MODULE_OUT_PORTS as the connectivity of modules is taken care
by AR_TKN_U32_MODULE_SRC_OP_PORT_ID* and AR_TKN_U32_MODULE_DST_IN_PORT_ID*

Also this property is never used in the drivers.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 include/uapi/sound/snd_ar_tokens.h |  4 ++--
 sound/soc/qcom/qdsp6/audioreach.h  |  3 ---
 sound/soc/qcom/qdsp6/topology.c    | 10 +---------
 3 files changed, 3 insertions(+), 14 deletions(-)

diff --git a/include/uapi/sound/snd_ar_tokens.h b/include/uapi/sound/snd_ar_tokens.h
index b9b9093b4396..bc0b1bede00c 100644
--- a/include/uapi/sound/snd_ar_tokens.h
+++ b/include/uapi/sound/snd_ar_tokens.h
@@ -184,8 +184,8 @@ enum ar_event_types {
 #define AR_TKN_U32_MODULE_INSTANCE_ID		201
 #define AR_TKN_U32_MODULE_MAX_IP_PORTS		202
 #define AR_TKN_U32_MODULE_MAX_OP_PORTS		203
-#define AR_TKN_U32_MODULE_IN_PORTS		204
-#define AR_TKN_U32_MODULE_OUT_PORTS		205
+#define AR_TKN_U32_MODULE_IN_PORTS		204 /* deprecated */
+#define AR_TKN_U32_MODULE_OUT_PORTS		205 /* deprecated */
 #define AR_TKN_U32_MODULE_SRC_OP_PORT_ID	206
 #define AR_TKN_U32_MODULE_DST_IN_PORT_ID	207
 #define AR_TKN_U32_MODULE_SRC_INSTANCE_ID	208
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 61a69df4f50f..9b30177463e6 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -707,9 +707,6 @@ struct audioreach_module {
 	uint32_t max_ip_port;
 	uint32_t max_op_port;
 
-	uint32_t in_port;
-	uint32_t out_port;
-
 	uint32_t num_connections;
 	/* Connections */
 	uint32_t src_mod_inst_id;
diff --git a/sound/soc/qcom/qdsp6/topology.c b/sound/soc/qcom/qdsp6/topology.c
index 83319a928f29..a3b0f558260c 100644
--- a/sound/soc/qcom/qdsp6/topology.c
+++ b/sound/soc/qcom/qdsp6/topology.c
@@ -412,7 +412,7 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 							struct snd_soc_tplg_private *private,
 							struct snd_soc_dapm_widget *w)
 {
-	uint32_t max_ip_port = 0, max_op_port = 0, in_port = 0, out_port = 0;
+	uint32_t max_ip_port = 0, max_op_port = 0;
 	uint32_t src_mod_op_port_id[AR_MAX_MOD_LINKS] = { 0, };
 	uint32_t dst_mod_inst_id[AR_MAX_MOD_LINKS] = { 0, };
 	uint32_t dst_mod_ip_port_id[AR_MAX_MOD_LINKS] = { 0, };
@@ -455,12 +455,6 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 		case AR_TKN_U32_MODULE_MAX_OP_PORTS:
 			max_op_port = le32_to_cpu(mod_elem->value);
 			break;
-		case AR_TKN_U32_MODULE_IN_PORTS:
-			in_port = le32_to_cpu(mod_elem->value);
-			break;
-		case AR_TKN_U32_MODULE_OUT_PORTS:
-			out_port = le32_to_cpu(mod_elem->value);
-			break;
 		case AR_TKN_U32_MODULE_SRC_INSTANCE_ID:
 			src_mod_inst_id = le32_to_cpu(mod_elem->value);
 			break;
@@ -550,8 +544,6 @@ static struct audioreach_module *audioreach_parse_common_tokens(struct q6apm *ap
 		mod->module_id = module_id;
 		mod->max_ip_port = max_ip_port;
 		mod->max_op_port = max_op_port;
-		mod->in_port = in_port;
-		mod->out_port = out_port;
 		mod->src_mod_inst_id = src_mod_inst_id;
 		for (pn = 0; pn < mod->max_op_port; pn++) {
 			if (src_mod_op_port_id[pn] && dst_mod_inst_id[pn] &&
-- 
2.50.0


