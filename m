Return-Path: <linux-arm-msm+bounces-69532-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 644E3B2A082
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 13:36:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 099EE1887487
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Aug 2025 11:30:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75A6931AF0D;
	Mon, 18 Aug 2025 11:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dF6Ojwep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95D031A052
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755516509; cv=none; b=jRUe3N7LLbTxByZvf+p+HxhqsNcICahZeiYbanoyB3yn8tbNC/4mdx7QAnK7ruCpWGu2arBlb4bvuQH5X8/EHDdn8aMSxBjJZxv08UcEAE7jwj0CwtBnjr/42/sMSXyAb0Y1yGCEkhb4FCZv95ORskf4qAJNNIG2e2qpSG3W6Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755516509; c=relaxed/simple;
	bh=7YHepwuhOJY63DTXiXG877/iFdeDIgw0g0diALJOzrw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gCtdvuqqEEVI4hl7D91xpWWT/0pskhl1PlBocXR1A5sPzW6MnfeWuoJUI186EdKnehaSFiKOOPLeLvNnGDXqZzjV0PBq0NcLjqVBbO/rNcPHqyaFnORtGi+er2MeeElfLU5TatB2qndjUpc9VSfSovcdY6IglhKlaVBsP2JTZJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dF6Ojwep; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57I8JnC8022517
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=4+wFXC1bMsd
	mzWY8JLHSnVTpvfhHOd2YnF+XgmDrNUE=; b=dF6OjwepdyGx1dXEVufFycOnKb/
	ItyIxgcs1w7GpEbg7vF5ezZdLy19lZbOwoZoYaWaWcie3h4P4Zy/YTsC6nh8xmjv
	H8YqoUa7CPUWm7ljtjFVU2qFCnAXgVWh7vsGn8kK0YV45FRAGBriknmIhap1k7V2
	odFIu0W6YMaEfphTLlKI5kvCzOMdL/oozLKIE29Ic3LJJpXyDH9uObOVvgZVStcS
	bOISN+m+9wzZBqa29Nn9cqeYOwRgJyqNl9RvXtocptUex7TGavfAFA4+so3FTQIk
	hNeATWqXiftr8LFV3BgE4sDMACaE8TmtgdzKX8Y4mkMGg2wFuDzUcMGP1Hg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jj744ekx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 11:28:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-709e7485b3eso99456666d6.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 04:28:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755516506; x=1756121306;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4+wFXC1bMsdmzWY8JLHSnVTpvfhHOd2YnF+XgmDrNUE=;
        b=jMxwVlPU61w/ICNPwMZT5ip/kOueeR5sGNuyjqmHdC8yPldGlufkGQEn3/qRfeW0a+
         P61VZb6xf5uJg9j0cxoaPnu85uDbp/bK59zOwa2Ji31R/ZFw4KrxxVBAiOWA9Ke0Dg4g
         AO9Nh3NMkIHMP1pu0/Jp4pjTe5Kpn/RGzNET47+QW4UcCu2h+f/RavVM5HEWqZIg7oJP
         gfUGeJrkf7t6H5xlPnUrBuHJTrnh2nv5iM71sjcxbM6LFZEcvZL0JgOHLTHbuBbU0J/7
         pOK+u+S+yEyhyMsvHgLgQW82pRmBC6ib632n82khIdPv8rWBOEZsS/AMpxubo8Xw8ibq
         F29Q==
X-Forwarded-Encrypted: i=1; AJvYcCWp7YIcJQt5/Vyhe75PrxfPuog2pxO+iUVJQLvSvgsqd4iv9JOFvtF9Xy7P8bB1d47SXeil95JRg0rDkt5R@vger.kernel.org
X-Gm-Message-State: AOJu0YxA3lPNlYWzASW4I5n8NTy6SiFFdrnR8MuHbwsFb5YD4zoAQWeL
	pTS2coypHPeNkxKm2VpYtlenAxZ18p2GP8sAEWYFOz0+i2pe/1EqpQzg32xA8AcTK5V5hgVAhio
	U5c1uEidXVw/NVupnDSiuN9ruoJSdsMSLJggUU7mOUT0GW/Qr4CDMuPSywlAiE3PJxUZg
X-Gm-Gg: ASbGncsaQH1GLZayiLr/hMSDrN8ugBwcvQNGuiLurMQZyF2J7BqYNdP0QFb8FCssg99
	fRkuTYrxp7AD2boZLGHyFLW9e2iGDuVQUT21Z2D4xYGlqjVSSKx72s5H16nMjCQo0kTnCaKgKS/
	TzWY43/+93kem5jod3EWschsYUP/J87Y6xW+pmmfx42b3zLeAzI03oE5022U3aQuorIbKGRn9zI
	Xy13P4o5z/sWvNDmx2EkhtkA0jbC1iNzKtV3f+qCV+RtjiJy8FsTMJVrzQzLdg2oiKKAljwJllT
	I4fLeYzHIjK21NaiRC9yRcctSz4zcYXh8tG/MS5xndyEzrS7zXAKww==
X-Received: by 2002:a05:6214:1c0c:b0:6fd:3963:7a7b with SMTP id 6a1803df08f44-70b97d16604mr204923806d6.1.1755516505634;
        Mon, 18 Aug 2025 04:28:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHP+KiptgfDG6xcoSSl5xxCTWMuHxndUXFTpZBE9EQe2O3f18HVCgRA/uELxALMM5far3YWvA==
X-Received: by 2002:a05:6214:1c0c:b0:6fd:3963:7a7b with SMTP id 6a1803df08f44-70b97d16604mr204923406d6.1.1755516505120;
        Mon, 18 Aug 2025 04:28:25 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45a22321985sm127555275e9.17.2025.08.18.04.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 04:28:24 -0700 (PDT)
From: srinivas.kandagatla@oss.qualcomm.com
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, lgirdwood@gmail.com,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, krzysztof.kozlowski@linaro.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 4/4] ASoC: qcom: audioreach: add support for SMECNS module
Date: Mon, 18 Aug 2025 12:28:10 +0100
Message-ID: <20250818112810.1207033-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: xT5pcEFQk-g3Js__mQIL33p8jBcZJdhf
X-Proofpoint-ORIG-GUID: xT5pcEFQk-g3Js__mQIL33p8jBcZJdhf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAzMyBTYWx0ZWRfX4nC588SPMbzb
 vtXzIQT93iFfpPExd922ndLvGNLrnsWNhnnzENToQVZK+99dycOjSXmVvQpJlfICcc223q+nP07
 nrIiJp8CEeE5WtGFLz3nKSICiKn7MlPmRdp3Tnu6YCUsaHUpwh5/z8qqIDQx+nSc57Ufg4jERk3
 0RG2M/EYO5XVsTRLpCjXbilIoszoTCTxd0EOd9wyr07VxdfPKcPFsXMpS798p6cBlJku5lvjH1A
 WHWBjbhtnkrvtGgNCe6eWrdrRld6zuRpvitryy7LlrEIdshceiX4yCf33LN3xfAxqxfzRXSXnRJ
 ZgmvNrTT61ZSyu7AcZ4wC5RD7FqX/4p+r+q9ebrlNYwM7+joi3j3oeRhlRzRu14oKcPwE+bn7Jc
 CZ/13pv+
X-Authority-Analysis: v=2.4 cv=MJtgmNZl c=1 sm=1 tr=0 ts=68a30e5b cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=oi9uD5rjtjE88QS_ecgA:9
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-18_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160033

From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

This patch adds support for Single Mic ECNS module, used for echo
cancellation. It also makes use of audioreach_set_module_config to load
the calibration data for this module from ASoC tplg file.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 27 +++++++++++++++++++++++++++
 sound/soc/qcom/qdsp6/audioreach.h |  1 +
 2 files changed, 28 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 4ebaaf736fb9..f4c53e84b4dc 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -811,6 +811,30 @@ static int audioreach_gapless_set_media_format(struct q6apm_graph *graph,
 					 EARLY_EOS_DELAY_MS);
 }
 
+static int audioreach_set_module_config(struct q6apm_graph *graph,
+					struct audioreach_module *module,
+					struct audioreach_module_config *cfg)
+{
+	int payload_size = module->data->size;
+	struct gpr_pkt *pkt;
+	int rc;
+	void *p;
+
+	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	if (IS_ERR(pkt))
+		return PTR_ERR(pkt);
+
+	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
+
+	memcpy(p, module->data->data, payload_size);
+
+	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+
+	kfree(pkt);
+
+	return rc;
+}
+
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 					   struct audioreach_module *module,
 					   struct audioreach_module_config *cfg)
@@ -1247,6 +1271,9 @@ int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_mod
 	case MODULE_ID_DISPLAY_PORT_SINK:
 		rc = audioreach_display_port_set_media_format(graph, module, cfg);
 		break;
+	case  MODULE_ID_SMECNS_V2:
+		rc = audioreach_set_module_config(graph, module, cfg);
+		break;
 	case MODULE_ID_I2S_SOURCE:
 	case MODULE_ID_I2S_SINK:
 		rc = audioreach_i2s_set_media_format(graph, module, cfg);
diff --git a/sound/soc/qcom/qdsp6/audioreach.h b/sound/soc/qcom/qdsp6/audioreach.h
index 617bda051cf8..2ae6420f4b6a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.h
+++ b/sound/soc/qcom/qdsp6/audioreach.h
@@ -30,6 +30,7 @@ struct q6apm_graph;
 #define MODULE_ID_MP3_DECODE		0x0700103B
 #define MODULE_ID_GAPLESS		0x0700104D
 #define MODULE_ID_DISPLAY_PORT_SINK	0x07001069
+#define MODULE_ID_SMECNS_V2		0x07001031
 
 #define APM_CMD_GET_SPF_STATE		0x01001021
 #define APM_CMD_RSP_GET_SPF_STATE	0x02001007
-- 
2.50.0


