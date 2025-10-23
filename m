Return-Path: <linux-arm-msm+bounces-78538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 41518C00795
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:29:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 5FB8E503AFC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:28:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 729E830E0E9;
	Thu, 23 Oct 2025 10:26:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aSY9SEca"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2600F30DD2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215175; cv=none; b=jpTiAoi39LRBAmscCuRdDu1Uomiv08Hfecv/HjZZsNVN0UHcGV1X77rW5E8eSJttAD/REM4FHCKJgl7s/omS/mMv98CZlQaR4kIdeg1THOlSpPEBgQgDE4wrxJM3XCoRcrzt4uzcgbjZu4COaZ/BsxlAy1aU7+128HOYlWz7yi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215175; c=relaxed/simple;
	bh=efgASbqYZBC7oC8H4oyO3InmxDlFSye4eEvOlegSpd0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BAhvpBT1qFInmShkCXVNPWgj1MPd/Db9tMrz09A5vLLrMyWydHKDOy3JBqmeMCRpqddhI7Pma5c0ErSYepnpuH1dSQYTlmskwcyk2zGP+BTtDeRjFIBUd3RtuIhiYWAYyklqomkE2OI+WSYJs0uhTI0aR9pBfAjKglB5C0XiTpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aSY9SEca; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7ahoS026566
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=5mIm3I5zPap
	dYI6nLcnHbldFinCOWD4sq8Qf2hihJDg=; b=aSY9SEcaX4mPJed2TL5Z6pZ9xuP
	uz/+3oLVpFMbTm5z4APdCQJwNJMBcTwHnC8h85C3yPv/o0lWlFxd6E6kIw7bmQeY
	ykgbyPz9j9cmH6m6u9Bqi0ql22p5LeSV2ZSLVOx0s3tFOKS9DfXB9UejbCLTt0tt
	uPnkgaWNHazOJoJf0IF2zLmridOl6dfi5kitVMwOLoq7VeyQVBeD0dz1yfitoaZQ
	F1woEA4bri8L8HDBEX2DqmtGrgjvqUKI7jAPABe0FuT/9Vj93Hv6qzb3SScCmrJp
	k62k8jJM4fbe5oGIpAJrLP7Cp/Rz2M8FooTJKPApYbIXCtd89gRDm+WUiuQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8j43t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4e8b8db4a35so19130921cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215170; x=1761819970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5mIm3I5zPapdYI6nLcnHbldFinCOWD4sq8Qf2hihJDg=;
        b=Mz9ikbFlGlaqtk0bj784h1gXxkrH1Cu7azQMAxxe3EPqKBpjFQ3fk/sWm2cR7nbSng
         wc9D3bFWz9EZ7gfPpKlEeQjDh8n5rnGO5tjszfZtoAyUFeh/zHPqOrcu3gNTFi3y6jcV
         WRy55NdBGEIouIKKwRq+wsqC7Ikdze73+32HMAPYQiG+fNDp03IzeSWH2vAxOEyJlgQy
         lvvCVCUdQY088HyOHPzI0lLzqR+sJQrI7RxFEIZBdvD+f2tqRVLdE4V715P5BL3I+AQ0
         Bo2OU1Vcy4OcJrKHTeVytMlixC1dBtSMcNgbxXoIcHraxTJzJy5u+PITrQBrZ7pD+q2Z
         KJLg==
X-Forwarded-Encrypted: i=1; AJvYcCX6B1SgCiQANWA/m6P2S6sjyiq5d9Rcc3rFmdgk9bqvkcHLz3j+4d7rMTzGfvGe5C1ReE/7Xtw9OkvjphMQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwDv6iHM9Py1npy1KLpS29sxMP2U1dwWzJGwDUTgi3UF4vHatlG
	2Xn89DgOmevHvdkUX8nwJIGkZaUEs595WLNabl2anaHXWluo3c+u1aMn8lQu96AcYBfjyB8kdws
	Bj59Yu4s1YW2DO8yX23zu0F2Us1Po48medvoLJnjB8Nyd9+TuTB5jqHhzJNLJrl1JCWfB
X-Gm-Gg: ASbGncsyMtid/rxGzSupXpBU6rIZwZli83KAIYonlislIofOUP77UtI9+NMXy4afk2z
	qqIC33MQ3HLzoZDjtY30BlfYv/K18gW+o8HD7qa+pjJoKVg5m1HErovYG0sMY1E1j+9TNeVWYMO
	qkNnmoCgfyrPETrtvus9xQYwYjLMvkDBDtkqLz/B+vm8xhcd40h4MZq6FRNkWLNBOY4L5zsXrRQ
	KbwjA03KvUHNYzBbDcgy/r4BGwNOS5luuc5Drwtp8a1tjm/qrtL9XSrJaKAa5revAgwwExEWWj8
	A0QVxARO6q0g4sOit8BfZWDF0TIfxedZxJKio5m54YnbjfPAFy3jAdFxT0RMiE7Ju9hsNrEKgR7
	Yzx6zJ7lk2+Io
X-Received: by 2002:a05:622a:1ba9:b0:4b2:cf75:bf10 with SMTP id d75a77b69052e-4eb810200bbmr17683511cf.17.1761215169561;
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFCxbXwAwH8/piF9N5ArRwBBXQc1WxpFAuGEHAuJeED3UURZNc6QrdvOKru0sgTFO8mGeU9g==
X-Received: by 2002:a05:622a:1ba9:b0:4b2:cf75:bf10 with SMTP id d75a77b69052e-4eb810200bbmr17683291cf.17.1761215169024;
        Thu, 23 Oct 2025 03:26:09 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 11/20] ASoc: qcom: audioreach: Use automatic cleanup of kfree()
Date: Thu, 23 Oct 2025 11:24:35 +0100
Message-ID: <20251023102444.88158-12-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251023102444.88158-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: y7tqIiwASCNije63W86rkAGxHA9v5-EJ
X-Proofpoint-GUID: y7tqIiwASCNije63W86rkAGxHA9v5-EJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX9ST8XvKCW7ZC
 CBfpPCCW4t6opbg1JggKLnv+ThKHnubfaFj5GXBduXlC4Sza1jINQbyDdZTeqpO8rvpydXGytaC
 H1je0kAC2l8t2/M1MSl1jlJ3lYOwE6k5Cm90fsm41E5EIeWi4kjOfGGzG58sMxkErNIaHf3YHD+
 wKDf1gEprXqdjDd53haQ9julQUw6rGRJs0UK50RCIkIrlHiItwg6rTV1Mc/GHv4qN0ghVbvWozS
 WCgm1TGK2JoiOzZDcXYV7h/S30KOiIFG/K9xNkqwAgl9vKoQ21skmHY4SUYVuh9iRXMJLKAOUso
 6vNKvit5RA2lqTlKTru2cscY9eiOmNQDECW/usES5lnFN4JBCP/GCXgYrTH2X8yshjQlkcIZziL
 0y2fu9+00IWkeia8y3DcmfQH35L8vA==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fa02c2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=eMYRZwCK-RnsMZ2OX8QA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 232 +++++++++---------------------
 1 file changed, 66 insertions(+), 166 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index 0456d4689034..ded49124581b 100644
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
+				APM_MODULE_PARAM_DATA_SIZE;
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
+					DATA_CMD_WR_SH_MEM_EP_MEDIA_FORMAT,
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
+					DATA_CMD_WR_SH_MEM_EP_EOS, 0, graph->port->id, iid);
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


