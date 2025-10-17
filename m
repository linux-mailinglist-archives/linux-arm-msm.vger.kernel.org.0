Return-Path: <linux-arm-msm+bounces-77717-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B51BE74F1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:57:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8CBDC6236F5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF5E2D4806;
	Fri, 17 Oct 2025 08:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k0Y4scH8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7172D24AC
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691390; cv=none; b=sjTPxalOjTGkMuExL7u+GNEan3ymQN7uMJVyIgTbJKwMM5vc0GvsHjfB3+LvlFOcFeu4L/9LNcJDUdp9J8kZCHa7viLjYgnq+Fj2h/DrJMk9QJ52vHhaYdn+XWhoKElUGHn3qUfprQv1k6cIF/+zPfMv9WjbW15f4XnSvbZ50Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691390; c=relaxed/simple;
	bh=Y1Z8wEb1AZlP4M/ebmxuhc8PuNLXf1ySuHShXdAA55E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bQ1Oa35j7cBGmp8o31eePb6Heqi+PtCvlhlG2627vCKISBaAD8DQ5UhPB+wov1oEUpWKtBWAiwVeEePqvW4m1sM6bNXPZ5K/e6xbUl+rKH0CVD4hOvLPp1ELd/OTuVcVxrHgIsEQhxSQu1fNvndnIqlm7u/D6LEr/CIjVwiT3Ig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k0Y4scH8; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8CqOq009575
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0a0EWmnz2X5
	JotpNKB4xwtxX9uknHBM8D8vzHC2h9JM=; b=k0Y4scH8pgg+mup1Uo0P6+0EuEE
	+zEVBcf5FhNp0ean8zk+WZ9EmLaXGFkKjza7hTd+O10sP/jrEc/IilWe5Ao9cE3j
	o+QLGY+IvNV1mbLUavrpZvN0glNNjveSGFogUGzvQQ9Id4mNH+w/zUBL8fjC8zig
	bMRjGEP+v55GYmVVxHaR+h7kCSO84J0zG/VFakXtjhE37AVU6Msg5MqNr60ZxPpD
	gjbE8GbM5hqL+oGnY6VLYjxDuRBgvO9SqCar9AFTcUui0Xwfy3M6qMiCgrpio/TH
	i0LD4EHpE+h77DfCUPNy5gzLMeJs0vw3FXTwkv6hySG11UK7j8Xd62hCyug==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbee4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:26 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8544316ef6aso934956785a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691385; x=1761296185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0a0EWmnz2X5JotpNKB4xwtxX9uknHBM8D8vzHC2h9JM=;
        b=ojCyarm4F9DXlXvzrXvTO6xMuFmJ/pynoVftzmkX6ZUxLGOjGqcUVWJQ3gy27i3cI8
         yOe52NpwDfd9Hg3tb9o8LwKNtsfRoVMpq6TBSgHnB+GvP1VvWLza6oRrggSjOW0ZeJ95
         aio1USFqno1ts7gcTfogm1Ua81+qDrrdqRknz0H3Nv/ZDMYBnt/2cmURNvD6XkbC0ITJ
         gQJouep6P9p7gJ4t78yodJiwAEiDyHa8QDca5WErXVF+huCTB99qoA7sJQOYOIJB+3aa
         x1zu2hOH0qTywdGDYtOVj7SVw0e0l+XIQ1zLzGvsfoovkeRvz2+ASmRXZVHzmjHAMtyI
         xCXg==
X-Forwarded-Encrypted: i=1; AJvYcCVLVFqIMqrFeidSiQrOUW40WgYNB0Bj2j9jmuTGyBqgiWr0op8tdSM7PR/TZ9/CSRssSJbbnbL6kO4KjYlw@vger.kernel.org
X-Gm-Message-State: AOJu0YxGVtQeMW/NVRw+nZx+mKqx2F3gDyOs5tygyJeAn6Elhlg0mHL2
	foY3Hai+wZvv1W11qxj0xvFffxDMqwapmUR7VkciqaYy2pf+CNsbF6QJeP0QVcRYyQGrT2sqh4n
	Hr8GScsf2NuBBOLjcX/HffKBliE/xahJoICvgB1wJ2TThHe8wVqKYY3UnUjJhbZXha7pQ
X-Gm-Gg: ASbGncsteFtBRc1rYh94wwKQVLhDqcJQ3CMT/KULPqB36RfWsFUKRqc2fbdRy0VlSL6
	0/Q8tJt+ng8G/FmjAaG1B752AQrWQGe5wwpl1HEVULIo8QCaprduKG5JEcw/yxAA47Dd5VtfuTT
	KKIxHCTxVOJxuH12ut76jciB6mMBkp9BOGf7XVG8SPL9BgWJ4CODf0YZIEyiQqBRkbA3Gd1gBSg
	r9zIvIS+fkqF8JB8K9dVjNhQkF2EebGTfirrM1HMR0yEAB8qlIZh9C+V5Y4KBnkdS+2tekZ7dek
	7xuMOgowQ2x9PK2Q0cXeP5qr6BTa8B23wHYUKdDJ8zayrnaf0ehL5HyM3mt7/nFwN+iE/g2R8s3
	r8TDPAp1iXDD+
X-Received: by 2002:a05:622a:3cc:b0:4e8:9cd2:4992 with SMTP id d75a77b69052e-4e89d1d9f0fmr43307771cf.16.1760691385387;
        Fri, 17 Oct 2025 01:56:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6KK/lJLE0JTE8tv/Vqhkdj/AJoC8dtkae2EGNJgK85ToGXUn3f8d33CrIsbiyNMb1hdcMGA==
X-Received: by 2002:a05:622a:3cc:b0:4e8:9cd2:4992 with SMTP id d75a77b69052e-4e89d1d9f0fmr43307531cf.16.1760691384869;
        Fri, 17 Oct 2025 01:56:24 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:24 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 03/12] ASoc: qcom: audioreach: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:52:58 +0100
Message-ID: <20251017085307.4325-4-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251017085307.4325-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: zVIGdoQ3cyaggziPupGQJp24Q-cbX1pY
X-Proofpoint-ORIG-GUID: zVIGdoQ3cyaggziPupGQJp24Q-cbX1pY
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f204ba cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eMYRZwCK-RnsMZ2OX8QA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX1YsYhQkVcc0l
 EwyqwZbAly0PzdXJ+vsN1C6Y8r7Jroe6UOV6uoB5I50jZv6NwTYeDLlvhZC3tPsXzsWfA8oivRO
 3y9R/qg+6Afci1QeuoscbwsV8q86r1EyDxAsP4oK+EcbSC6EY/vPlAkFC1TlHT+3k65Hb7gPEoa
 QfQacNBbUmGcsMhCIv0NJji833nAYf4wh37xyk+ZlIOQP/6g+et8dkT29GEqD+pmxViPL3R6ydM
 R6ojcjqi681qiPNNN83XIUeNiBaMF3qfKdN57h5wU35rFjkXA9u5m08Zp0i0Myyf3gYbw1zio40
 z8NoZLoundrw5YrLCASBv1mdXppPUG7TPbVtme/NjZZfWqiuHWkLch6qrN2aClp1Oz58c6CBWfJ
 IJFiBmLCPvsF1vPL/8VYxp5DzJlXQg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 232 +++++++++---------------------
 1 file changed, 66 insertions(+), 166 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 0456d4689034..7f2c607fb27a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -612,18 +612,12 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_frame_size_factor_cfg *fs_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int ic_sz = APM_DP_INTF_CFG_PSIZE;
+	int ep_sz = APM_HW_EP_CFG_PSIZE;
+	int fs_sz = APM_FS_CFG_PSIZE;
+	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
-
-	ic_sz = APM_DP_INTF_CFG_PSIZE;
-	ep_sz = APM_HW_EP_CFG_PSIZE;
-	fs_sz = APM_FS_CFG_PSIZE;
-
-	payload_size = ic_sz + ep_sz + fs_sz;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -662,11 +656,7 @@ static int audioreach_display_port_set_media_format(struct q6apm_graph *graph,
 	intf_cfg->cfg.mst_idx = 0;
 	intf_cfg->cfg.dptx_idx = cfg->dp_idx;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 /* LPASS Codec DMA port Module Media Format Setup */
@@ -679,19 +669,13 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_hw_ep_power_mode_cfg *pm_cfg;
 	struct apm_module_param_data *param_data;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz, pm_sz;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int ic_sz = APM_CDMA_INTF_CFG_PSIZE;
+	int ep_sz = APM_HW_EP_CFG_PSIZE;
+	int fs_sz = APM_FS_CFG_PSIZE;
+	int pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
+	int size = ic_sz + ep_sz + fs_sz + pm_sz;
 	void *p;
-
-	ic_sz = APM_CDMA_INTF_CFG_PSIZE;
-	ep_sz = APM_HW_EP_CFG_PSIZE;
-	fs_sz = APM_FS_CFG_PSIZE;
-	pm_sz = APM_HW_EP_PMODE_CFG_PSIZE;
-
-	payload_size = ic_sz + ep_sz + fs_sz + pm_sz;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -739,24 +723,17 @@ static int audioreach_codec_dma_set_media_format(struct q6apm_graph *graph,
 	param_data->param_size = pm_sz - APM_MODULE_PARAM_DATA_SIZE;
 	pm_cfg->power_mode.power_mode = 0;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_module *module,
 			      uint32_t param_id, uint32_t param_val)
 {
 	struct apm_module_param_data *param_data;
-	struct gpr_pkt *pkt;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 	uint32_t *param;
-	int rc, payload_size;
-	void *p;
-
-	payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
-	p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	int payload_size = sizeof(uint32_t) + APM_MODULE_PARAM_DATA_SIZE;
+	void *p = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(p))
 		return -ENOMEM;
 
@@ -773,11 +750,7 @@ int audioreach_send_u32_param(struct q6apm_graph *graph, struct audioreach_modul
 	param = p;
 	*param = param_val;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 EXPORT_SYMBOL_GPL(audioreach_send_u32_param);
 
@@ -813,24 +786,17 @@ static int audioreach_set_module_config(struct q6apm_graph *graph,
 					struct audioreach_module *module,
 					struct audioreach_module_config *cfg)
 {
-	int payload_size = le32_to_cpu(module->data->size);
-	struct gpr_pkt *pkt;
-	int rc;
+	int size = le32_to_cpu(module->data->size);
 	void *p;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
 	p = (void *)pkt + GPR_HDR_SIZE + APM_CMD_HDR_SIZE;
 
-	memcpy(p, module->data->data, payload_size);
-
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
+	memcpy(p, module->data->data, size);
 
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
@@ -840,15 +806,11 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_param_data *param_data;
 	struct param_id_mfc_media_format *media_format;
 	uint32_t num_channels = cfg->num_channels;
-	int payload_size;
-	struct gpr_pkt *pkt;
-	int rc, i;
+	int payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
+	       			APM_MODULE_PARAM_DATA_SIZE;
+	int i;
 	void *p;
-
-	payload_size = APM_MFC_CFG_PSIZE(media_format, num_channels) +
-		APM_MODULE_PARAM_DATA_SIZE;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -868,11 +830,7 @@ static int audioreach_mfc_set_media_format(struct q6apm_graph *graph,
 	for (i = 0; i < num_channels; i++)
 		media_format->channel_mapping[i] = cfg->channel_map[i];
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
@@ -960,31 +918,24 @@ static int audioreach_set_compr_media_format(struct media_format *media_fmt_hdr,
 int audioreach_compr_set_param(struct q6apm_graph *graph, struct audioreach_module_config *mcfg)
 {
 	struct media_format *header;
-	struct gpr_pkt *pkt;
-	int iid, payload_size, rc;
+	int rc;
 	void *p;
-
-	payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
-
-	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_cmd_pkt(payload_size, DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
-			0, graph->port->id, iid);
-
+	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	int payload_size = sizeof(struct apm_sh_module_media_fmt_cmd);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(payload_size,
+		       			DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
+					0, graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return -ENOMEM;
 
+
 	p = (void *)pkt + GPR_HDR_SIZE;
 	header = p;
 	rc = audioreach_set_compr_media_format(header, p, mcfg);
-	if (rc) {
-		kfree(pkt);
+	if (rc)
 		return rc;
-	}
-
-	rc = gpr_send_port_pkt(graph->port, pkt);
-	kfree(pkt);
 
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_compr_set_param);
 
@@ -996,18 +947,12 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	struct apm_module_param_data *param_data;
 	struct apm_i2s_module_intf_cfg *intf_cfg;
 	struct apm_module_hw_ep_mf_cfg *hw_cfg;
-	int ic_sz, ep_sz, fs_sz;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int ic_sz = APM_I2S_INTF_CFG_PSIZE;
+	int ep_sz = APM_HW_EP_CFG_PSIZE;
+	int fs_sz = APM_FS_CFG_PSIZE;
+	int size = ic_sz + ep_sz + fs_sz;
 	void *p;
-
-	ic_sz = APM_I2S_INTF_CFG_PSIZE;
-	ep_sz = APM_HW_EP_CFG_PSIZE;
-	fs_sz = APM_FS_CFG_PSIZE;
-
-	payload_size = ic_sz + ep_sz + fs_sz;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1058,11 +1003,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_size = fs_sz - APM_MODULE_PARAM_DATA_SIZE;
 	fs_cfg->frame_size_factor = 1;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
@@ -1070,12 +1011,9 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 {
 	struct apm_module_param_data *param_data;
 	struct data_logging_config *cfg;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
-
-	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1085,7 +1023,7 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 	param_data->module_instance_id = module->instance_id;
 	param_data->error_code = 0;
 	param_data->param_id = PARAM_ID_DATA_LOGGING_CONFIG;
-	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+	param_data->param_size = size - APM_MODULE_PARAM_DATA_SIZE;
 
 	p = p + APM_MODULE_PARAM_DATA_SIZE;
 	cfg = p;
@@ -1093,11 +1031,7 @@ static int audioreach_logging_set_media_format(struct q6apm_graph *graph,
 	cfg->log_tap_point_id = module->log_tap_point_id;
 	cfg->mode = module->log_mode;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
@@ -1108,8 +1042,8 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	uint32_t num_channels = mcfg->num_channels;
 	struct apm_pcm_module_media_fmt_cmd *cfg;
 	struct apm_module_param_data *param_data;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int payload_size;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 
 	if (num_channels > 4) {
 		dev_err(graph->dev, "Error: Invalid channels (%d)!\n", num_channels);
@@ -1144,11 +1078,7 @@ static int audioreach_pcm_set_media_format(struct q6apm_graph *graph,
 	media_cfg->bits_per_sample = mcfg->bit_width;
 	memcpy(media_cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
@@ -1160,7 +1090,7 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 	struct payload_media_fmt_pcm *cfg;
 	struct media_format *header;
 	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 	void *p;
 
 	if (num_channels > 4) {
@@ -1202,29 +1132,20 @@ static int audioreach_shmem_set_media_format(struct q6apm_graph *graph,
 		memcpy(cfg->channel_mapping, mcfg->channel_map, mcfg->num_channels);
 	} else {
 		rc = audioreach_set_compr_media_format(header, p, mcfg);
-		if (rc) {
-			kfree(pkt);
+		if (rc)
 			return rc;
-		}
 	}
 
-	rc = audioreach_graph_send_cmd_sync(graph, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return audioreach_graph_send_cmd_sync(graph, pkt, 0);
 }
 
 int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *module, int vol)
 {
 	struct param_id_vol_ctrl_master_gain *cfg;
 	struct apm_module_param_data *param_data;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
+	int size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
 	void *p;
-
-	payload_size = sizeof(*cfg) + APM_MODULE_PARAM_DATA_SIZE;
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1234,16 +1155,12 @@ int audioreach_gain_set_vol_ctrl(struct q6apm *apm, struct audioreach_module *mo
 	param_data->module_instance_id = module->instance_id;
 	param_data->error_code = 0;
 	param_data->param_id = PARAM_ID_VOL_CTRL_MASTER_GAIN;
-	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+	param_data->param_size = size - APM_MODULE_PARAM_DATA_SIZE;
 
 	p = p + APM_MODULE_PARAM_DATA_SIZE;
 	cfg = p;
 	cfg->master_gain =  vol;
-	rc = q6apm_send_cmd_sync(apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(apm, pkt, 0);
 }
 EXPORT_SYMBOL_GPL(audioreach_gain_set_vol_ctrl);
 
@@ -1251,11 +1168,8 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 {
 	struct apm_module_param_data *param_data;
 	struct apm_gain_module_cfg *cfg;
-	int rc, payload_size;
-	struct gpr_pkt *pkt;
-
-	payload_size = APM_GAIN_CFG_PSIZE;
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, APM_CMD_SET_CFG, 0);
+	int size = APM_GAIN_CFG_PSIZE;
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(size, APM_CMD_SET_CFG, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1265,15 +1179,11 @@ static int audioreach_gain_set(struct q6apm_graph *graph, struct audioreach_modu
 	param_data->module_instance_id = module->instance_id;
 	param_data->error_code = 0;
 	param_data->param_id = APM_PARAM_ID_GAIN;
-	param_data->param_size = payload_size - APM_MODULE_PARAM_DATA_SIZE;
+	param_data->param_size = size - APM_MODULE_PARAM_DATA_SIZE;
 
 	cfg->gain_cfg.gain = module->gain;
 
-	rc = q6apm_send_cmd_sync(graph->apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(graph->apm, pkt, 0);
 }
 
 int audioreach_set_media_format(struct q6apm_graph *graph, struct audioreach_module *module,
@@ -1358,9 +1268,9 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, s
 	struct apm_cmd_shared_mem_map_regions *cmd;
 	uint32_t num_regions, buf_sz, payload_size;
 	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 	void *p;
-	int rc, i;
+	int i;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
 		data = &graph->rx_data;
@@ -1407,23 +1317,16 @@ int audioreach_map_memory_regions(struct q6apm_graph *graph, unsigned int dir, s
 	}
 	mutex_unlock(&graph->lock);
 
-	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
-
-	kfree(pkt);
-
-	return rc;
+	return audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_RSP_SHARED_MEM_MAP_REGIONS);
 }
 EXPORT_SYMBOL_GPL(audioreach_map_memory_regions);
 
 int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 {
 	struct data_cmd_wr_sh_mem_ep_eos *eos;
-	struct gpr_pkt *pkt;
-	int rc = 0, iid;
-
-	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_cmd_pkt(sizeof(*eos), DATA_CMD_WR_SH_MEM_EP_EOS, 0,
-				       graph->port->id, iid);
+	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_cmd_pkt(sizeof(*eos),
+		       			DATA_CMD_WR_SH_MEM_EP_EOS, 0, graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -1431,9 +1334,6 @@ int audioreach_shared_memory_send_eos(struct q6apm_graph *graph)
 
 	eos->policy = WR_SH_MEM_EP_EOS_POLICY_LAST;
 
-	rc = gpr_send_port_pkt(graph->port, pkt);
-	kfree(pkt);
-
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(audioreach_shared_memory_send_eos);
-- 
2.51.0


