Return-Path: <linux-arm-msm+bounces-69569-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 141CDB2A232
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 14:53:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 993463A17B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 12:52:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B72C131E0FB;
	Mon, 18 Aug 2025 12:51:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eySm4jvd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987DF31A044
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755521468; cv=none; b=t7ux1YLgBILIDK1Pyq8K0XiO1T58cYttubGFBcx2GT91Xgvl8ava6pFVQ9hOrbV4dWurF8hn7HvQ4AHKcdUP/20U0PA8EAsHn2jeSQlM5IhFyNAMkULCqXEIxxfGKtmHdEu4cXszlhWf3DZeTXwTnbP3FN1LkBwY+BMKHbZ10mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755521468; c=relaxed/simple;
	bh=hpGzTc0IFp4kxDa7L0DoR4eGGYq0Ed7d5aUx9Md288w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qbnuf9jslbSbNVHbm+OBCaZpCsB3ZKtS9L1LyBCgoQMXuDf0BEJQJbZ5Jx5DvW1L8nDQsjMDfi71iFH4X8y+TL2ONLXPmorSxm+soviFzr/r/AYLW7lLchbHk7TOAXxZ29/sqsYPf9gDrr6FwNpkeO/meJ/TvXU7HK4Wr4APC90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eySm4jvd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8Q74k027691
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wM721AZ4mzS
	KZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=; b=eySm4jvdMvCNiwdvWVrd4dof1wN
	qBADJaaN7nwfOl5MPIMlb/w3m0nsUHlj6IHxuIouvJBoFo0Q/bEfjmWVvz0rNuSK
	VyxhdoFLrbMr9dWZkL0mhRLLBbFCUhAR5MUA62Ncln+Lw+qvxGhbl5lXxsRje+o6
	2XpAzOyiQJiiSbhJFYBlJx87AQTtTxpzqSHXqkvQ7VU/TRP2DKVu9AGy522TTmnL
	UirdXHtp5qG3l6MB3xQQ78x6WGt/dV+MoSgUl20qH09N9lQNRpDYxc44DzwCH2LZ
	vqrJz+H8FTFU/vHSsz0hzHnwZrlmIDsaX94f7KUYhdHoIHFs4KwRNUw7knw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk5mckmw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 12:51:00 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-70a88ddec70so41541316d6.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 05:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755521459; x=1756126259;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wM721AZ4mzSKZrE5a5VcC0lVzer8Uu47S0uTwNMIfYE=;
        b=gLm5WxdXQjBZqGtIDyk0k4fDbdSlKeWOXpKtDu9IHxRty3BhAsz4k4Vdlk70DIPvfP
         W7OhWcW5RGKw89vN9IlUVbj2NXz92e7zJttGFJ3zOyUFvr3ykuLM0/VhnMYKHx0mnqo5
         uhw8VUuICidxTDlTuJuT2TDzqaoz/hX3DCW8AtcnIsPhdulLvVkcK03/mHoowYXwQ4RE
         Tc/B7Vai6CCxc6eJH9403B7d9bU1O1D4yjbXl2gSf6FiEHBYqHCoQ6taUvlEZHs974lv
         BlqSDDcJzmluUvMAQn5TlGiuPSFmkUaOVXU7lpGTdsid8uYmdlPOVj/YEOUPYgEXV4RV
         lTfg==
X-Forwarded-Encrypted: i=1; AJvYcCVB4oAvhTdnPbnkUF9p05Nz1hp3kd2xcRPsyupYHD8TC2N1JO8bvr5NZiGz52ES545N07a0WmvLmsMRxmuH@vger.kernel.org
X-Gm-Message-State: AOJu0YzVhOuh8G0mu/8zqX8qAIdKzGVsg8yb++0YmhC9lGc+I/eyOZ/B
	wb1gfwjdYvOTFvpVe1cVJofaCTzd48wpcev2rz5WR8vYRRZeT5iVZVIhASRg4413BnogyGGsc6M
	E2xPqYw1tjUVDXIRXN8w6J3R1EgHzkQbmNV/LKDJ++r96N27TRIZ/2+xaNrOPd2hwIiw4
X-Gm-Gg: ASbGncvDOqu8zLoiBP2TgCIFFeKXVmbDcRJ46+hWJzBouTVbVMuAIJCjcmXfpk6Vp5k
	CSEN/PVMxgVtroR8beaA/IzABjRmMN0F7BuXNSt2AVCTTHRL4D03hiP2VVSjssdYswO2Fi3ZwOX
	chs4aAiTP8SzSfU1QcGqb7fz0IeLh36orm5PYqP9Wo65WOe3ihgu0VTZMvCyN/vxbeRUI1imFyR
	R9r8HKi2Xod6W5+e+eJGDWfXFquQ6ygOpHOuVfnEYhaxcJILNycABe8tMzfMc7PTOyb3k7U1zf7
	akIpf1ig9n2XuT580eekgZqKP0AQ/BqGcmCUkfFxILmjH5eplo9UuA==
X-Received: by 2002:ad4:5ecc:0:b0:709:65ec:834d with SMTP id 6a1803df08f44-70ba7c074c3mr137812866d6.30.1755521458803;
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeBiZiWiyk62FtVrWZh4y+IKlDpVh+YIf7vQWzRL0BaK1P6yLQnxcA/7BsloB89i068HuBDw==
X-Received: by 2002:ad4:5ecc:0:b0:709:65ec:834d with SMTP id 6a1803df08f44-70ba7c074c3mr137812446d6.30.1755521458103;
        Mon, 18 Aug 2025 05:50:58 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3bb676c9b27sm12537347f8f.44.2025.08.18.05.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 05:50:57 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v3 1/6] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
Date: Mon, 18 Aug 2025 13:50:50 +0100
Message-ID: <20250818125055.1226708-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=Sdn3duRu c=1 sm=1 tr=0 ts=68a321b4 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=zhxk0K_MHdi4n0KV9BwA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: CYOyDZOJQ1O-r7t1VRGLvymu0rd80nPq
X-Proofpoint-GUID: CYOyDZOJQ1O-r7t1VRGLvymu0rd80nPq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0MiBTYWx0ZWRfX2QpZHT9mT+WB
 GTuGSEr7lAPlVu6UMwepjJpyMU6Fyvr7smlzaJxCd63RjwSs0NrT/ajtBmMxuz+An7DH3UoxhYF
 LLpCHPWRuSJjvCSe+jqBmpXCBL6CTrWsqiAUBXR3ZbMLlB2JryR7wyDNsJZCog8mcvVuoOtSM1P
 XZLzRPCF6zH5ONZcbrkjMuRUNzm07WezHXf6FQIvqfkMNgnB/fcYg5MPCY4a9R6X4j42ZhYaCE2
 qpAS9a9akKwZcH0F6NiOcXO3nHJ1V4W0+UANBhh+9dqvESLqkmJRcLqvsVM8uiatpg9ithHyvb1
 UpEOTrqriVX4XR6q4AyQG3VZP4EiDu6FMigbYWroB8k1ZW0VEQw/MkqjeuwRuoS50/J1puhDxYY
 z1CWd75V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_05,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 adultscore=0 malwarescore=0 bulkscore=0 phishscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508160042

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


