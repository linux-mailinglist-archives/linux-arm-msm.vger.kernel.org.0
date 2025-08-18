Return-Path: <linux-arm-msm+bounces-69529-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D97EBB2A07A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:34:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CA32B1B2196B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:29:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5A42031B121;
	Mon, 18 Aug 2025 11:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oNjJqf5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63D031B107
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516506; cv=none; b=e9mKAN/ZoePn+nrv0ViN0aXUj1cKwW/hh2XIfc/pMLXhnHM+7Pp9MpZMXKyfCBKLrN+UdvNg0/WzWO0EPIaYkkAMuNHt2Uh4fuVm5uI9PDTZC1Zi2ZiJV0hPhQWug64EJ+XaUYeFFuwINGaiuimTo2y6+9Si0a0+9g0pW/XeLSE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516506; c=relaxed/simple;
	bh=KMT7oD+MoswQz8IrV4cUVSwAcWIxbnjZOY4Tj1WvRLs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qvUYW1FLyzDhmPaXY9+0QkGoshdpbFv3IkI/TJ3Nqb3IYa+98sYhCNtn8g7HCPbk9i6iN9tD03fZzYB7COArX/mGp0+67RYMfQod8xVPmTjqvBq6IvdHml5fMw21hgsa3eHKa5iWeAxFM2xsWTglvXy2zFIsIjAgI3WQqpiwMDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oNjJqf5+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8ElOx021032
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=1cV6Kfe6d/U
	7DDn7ImGO6RHZVmCQTPM4qtn5LZNykxI=; b=oNjJqf5+FMazG5W04/0YJi80d0J
	2Gb/d19XhDabmDPAvXuOrFgvCVTyoL5OoEA8yy3LewYQLqEI7nVRU3a/CSZ7ijZP
	5cz4jIMwQLJ+GVwRbOfFPNdhn1iGcFZgCR/Y5VSPTrHk3GcYNd3GiNvAGXEEDFLq
	SWUI7hWB+Lain7nSTj5JcCae8n+jTdpHSiKvS0/95WZteC3trlIx39MdG+RAYEIo
	F2uJ87NV7CV/jpWAxMBauw0vodJ3IH18U/OGhSEbAWVmquAtdvfTA2gaylv9JvTX
	h7z9s3nl13QnJ23rLam1/QdI1lva02r7bhyGbuuZvwwDsopLDcvLxaq1S2w==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jk99mbfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:24 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-70a928dc378so101086286d6.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516503; x=1756121303;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1cV6Kfe6d/U7DDn7ImGO6RHZVmCQTPM4qtn5LZNykxI=;
        b=iTHJZn/CSKbJYmoi0ATCaoL6QD9GJn5URK9ykVBWT5E6PPONkXMQG53WIAlaJsHYfb
         jNyd9KaYMFhX85drRuIWGzXcxZhh6pukaUAUlMMbgfk7SN/6L7qWD3KAgsR5J+DfYF6j
         GS8dR+VPykS4Bu9TdgSz7iO+hM6JJAySVcSBmqWMHbNeRXftdnJKfTV7C0Q3e4Dee56D
         /kOSgeV/09RyhcazYISl7RtiwhiUuLDwq5XrbPrJhMP5oEdrSnFMWiAQkS73q+TXlMer
         Mfb2fSe5tz1OyWTDcORYVUchFlFXMSAaHpfKEFlJLj7lql7IskT3+NtuSJ00htykqI9a
         +TYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdvut2UPZoWxaNReObUoA2lXX6rPgZWBqRKsv9CtG4B7ZggCmR2AR+CcFgHFTDhUm8WLLrLRULbUkBbTRa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb8St0ovTg3RNzpgIfKO3j16H3+qnKLmgeDH+o3yBXilvt8//i
	UV/aAbVQb0fEI6xqva0rCm8G89U4HR+46LYywSUEe7SA900/1S3MSL+As1mx6Zm6PeXqmHYrrID
	P/zAIKcUilLylK2Xuz05//CJvXOVs47Rur9nN4VPcTz2kdiZn+BiDuS1TjFzVAUCe/6/g
X-Gm-Gg: ASbGncvhC+2WnFF5eamggDQ5D86dw9soDPLX2UFPYLZvnKuOcvc+UQNQx461RFAG1vs
	b49b2wq6GrJPXOWkN4iFnjFz5yCLp85TZLUkSboBmyh+xWyRHjLoHSLkp6nNIIEV1Su6YSPYI0T
	ouWhGsp3dyidJ8dqpNS7+0fe04NWrwtQGUUrlUCONsq13Zy2752EO4+oT8NP3zHupOll69InIG6
	Be/brTBsHKHHiA3JKpq8FvpnOhfq99SkdMdcW8avU5GnOCTpD3vZd8ug0MRIRMRt/QUu3EqCeJP
	1XdpsjlJO5VJi2G8z9MXQyHRntiRhJjZUeDxWorGVaz8FwrIFtOG1g==
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr128265376d6.26.1755516502638;
        Mon, 18 Aug 2025 04:28:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGttpcAfJ4e4Fpxw0oG31IaOQsFDxj7On6vaiGyHNmsQ/Oj6iY3BmZo7wsb3Wq3H0FS9p0/3A==
X-Received: by 2002:ad4:5cc2:0:b0:707:56e1:4806 with SMTP id 6a1803df08f44-70ba7c0c266mr128264896d6.26.1755516501939;
        Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:21 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 1/4] ASoC: qcom: audioreach: deprecate AR_TKN_U32_MODULE_[IN/OUT]_PORTS
Date: Mon, 18 Aug 2025 12:28:07 +0100
Message-ID: <20250818112810.1207033-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2eSIWULFgamid6kT9PIQJ7GFYheKYl1r
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDA0NSBTYWx0ZWRfX7bZ2Mbkba2nQ
 Hdke6QkmREA0PukHVi2CuS4NgQjXch6gw/Q/hOAphZZC3IyfPDG3nZHu3wUD/lZlAG/t044gmgI
 /fP9VptZRhY+8/cIb/1nVJ8PHhcFDnQg47henu+EsUGRM8c8L+IhjlCNp5h9eVCqAhsomIoOwki
 yv9WbWRcku1+ZqU5TFpewlKRbRjQ4Yqjntx8rs0Z27M24naT8HVnp2BJfj6+hWhwT+PiNrhdlle
 XzuVKrEo68VBrOqz3bVSnEBPK1ygBIDZxm8R/IX0b9D7jNdweDb/EcPcALmb1RsfNjfxvv8Mpsk
 zI9EPgu/owIUKMx7K+wVTChwGgJzMMXdbUYditfG5SPQALXzbC3oUPZMux+IgVXES+shI05e3sT
 SvyhgUUE
X-Authority-Analysis: v=2.4 cv=IIMCChvG c=1 sm=1 tr=0 ts=68a30e58 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=zhxk0K_MHdi4n0KV9BwA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: 2eSIWULFgamid6kT9PIQJ7GFYheKYl1r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
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


