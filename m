Return-Path: <linux-arm-msm+bounces-77720-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C47ADBE750B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:57:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E0F23623A53
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:57:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B503F2D6E4F;
	Fri, 17 Oct 2025 08:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="L73rQIqO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBB0E2D5C83
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691394; cv=none; b=AoSoRRDVtEVxZ9kR4tTnMx/n4+ds5BRd63QjmtWHKJk+NEqZndqcJNwvuabs++4fx+LvpK4LK5M/pWIcKqZ6x07RIYbSglJnLS6nwKOytrhXRdVsagq1eq+SqL4zOgwmEgpKsijCaTQC4SDtjtTcdUAo52aPzryzr7PTCktZq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691394; c=relaxed/simple;
	bh=oa+cWYTt9UzB1FyHIVERceVFvqBCWaXqS0POIoM+lKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mShStNs1tgAslQRjYcwdBMSqWFMTIUWQpCccWQV1MC7H/EO55CYyM8mERnYbvs6KpbRAVDWmTiVfJXHo2YEA0L4CyCdfQJ/vThUxYs4Dh5LlxqvI9bTZcJ+aTr5Q3+LD3SLS/fHLD4jipZI6Ezhw1zid+AMukFJwq/LnVTbT7Vc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=L73rQIqO; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8BAo7010061
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=6pGATZVupHw
	4Czz1AViHliAMs8GpLruqkYCkicjIlBU=; b=L73rQIqOW6h0c8WpnpJiVMpF1+d
	bccnP4643vLZK63OtZxeqKxghqvVgQI/ybwVx9ww7lxQDSNwugootSLK71DcPzr7
	/H7/6RXSnWfZWUOBxHH5iPayukkX3DiHlJF6bTUVUdcZp0SgySzYCnM+iSDHy7dU
	GZyPZic61u/COLh+RZAbak08akMurMp0pnaLjK9kyVUSrs7HgIx8/GgKu+Du+l7g
	Wq5MnByNVhaB7pnaqCVydYHMeu2mG1mObVjZf1Ww5nwExDvJkuEYyBtWTQFZnkIq
	EvYXDZGHfSRf1VYUXpZWCxZHDwttUPFusNJiIazooV82L7BXfWhCPBUC5KA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbeej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:32 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-88e7bfe5ba7so587939585a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691391; x=1761296191;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6pGATZVupHw4Czz1AViHliAMs8GpLruqkYCkicjIlBU=;
        b=TEkkg9PyMGiQZyKhPRWMNZbDuBLnIfL/Spvs0FjGWv23eXKn4PgO/brfetleEj2DVL
         2vvvv8M1YJPRP5GhwiOW9a0mvp8HhaNs/gbdx3ZTsN3IBYrVzkT7b5WSvSNvmtzUVKBt
         4rK6hK3g4Qn9SKiI/Hg0gixz8n/JUEoW9sGicEKuQhJN5TRDK4lvg80gCw20Hn7gySUA
         Aipxy/E56w3WorxBkdAXJvf91cT05FyHLTJjHcfSQtRhfqWyQ2wG7dX+2Fc3xHc2QRY+
         3ZiNYJE/MAWdlxlGR0ld3dPrNc9eWiixKFDxtVZG+5YGV4+3V+e/yo+BRqMYSjzQhYFp
         bUsg==
X-Forwarded-Encrypted: i=1; AJvYcCWVGwhnZZfN6ouS6Nsz4dSugnHfrtrS6Om21TBPQ8CpOqQzJyCrqEdZ6i39qlXTzDfmUgtGYPE6Gz9TeGu8@vger.kernel.org
X-Gm-Message-State: AOJu0YyUr91mvbbAMSTSwuztXR/f5LakMlota+rvuLPMDBPAcfqh5tYk
	18YNl8e3JeOlvIimLsCL+0pKJ+y2OwW+iaiEZg6rMmQ5H0v4rhkh9ge/thdwizoYRCikx/xRQJt
	e09HjZIlMD5tt1U01V4vo/bY3FjdZqN2kjMmXbTpCAiakfo72cS6jl2IU4tPSZtfBhsCE
X-Gm-Gg: ASbGncsCkmLSFrS9M2Zl19PReFeXZj6IzWtx02tLQfEObNjUoWNm5D31EFzrzfyl5bl
	877krmzAPTdl7zppqcSsg4OGU5JU43fmWevRvoBqjs0NoyV/EPmOfioLjoq0q8r7hCGB9iCwmb5
	DpGbIEtSuqUpe2V/8ut0mOkPFn0s3qqm8vYVaXgKFstL1ybZv6Fi1CZUPvi0vupFc+A4J1WkGCv
	GYqiqO7T2RGgGyhP+LBBHVmK5HDfthlOYw0wZNwypx1u1YEJT8KDSr1588h4jfVbRuZbsC6Gknl
	1yn14RaIIKy++jB+wNKcLqaUZU/SPSzTeLpfMER0Xu89VqUBTDF5BrqetdkYxQcMFeP5IjEtHB7
	/mY9ooDtL5w9H
X-Received: by 2002:a05:620a:1921:b0:88e:9874:8257 with SMTP id af79cd13be357-8906e3c5df2mr376984385a.9.1760691390920;
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF63Px5DUNh0yn/CzHTzSEIo2j7JYidNDTp4SUTpCfSz2vNCoH3277zcAVyU6QLytHJjF8tfw==
X-Received: by 2002:a05:620a:1921:b0:88e:9874:8257 with SMTP id af79cd13be357-8906e3c5df2mr376982085a.9.1760691390423;
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:30 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 06/12] ASoc: qcom: q6apm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:01 +0100
Message-ID: <20251017085307.4325-7-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: YLQzK2RJ_xON0IAa-Pp3HwXxdPHEL4EW
X-Proofpoint-ORIG-GUID: YLQzK2RJ_xON0IAa-Pp3HwXxdPHEL4EW
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f204c0 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ORCg8BdZNXsK9r0PxOcA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX9GGm9RUaJ61f
 SeZTDB6ulu0xSO5PF4uS86YYf8zwxGkXBkeBxGHRwAlo6LqnKtpUr5NqxbplVSCBjCZMHMic1Of
 ALudpd4ptMuo+1XQFbxX328buNLtmF3Tqm4iY3Rhbp2cXAMg/GgXCuJCkf7eRqSc4glrq+7S3F7
 0MIzbGiXwtjyHJ2qXA7zgk37bId6l3tK2IKtwyCt8/kh+YJxoL0C8WdLpSYNKJEZe75n3DHJgyd
 bl4dTJ54EmkiBUkjrQIui5A6yd/mvbeZrkPBNkFz1drjP/i0sobzZ+IUlorPUn4NKSeYH1bEu/5
 c+/pYqp9J8zK+LQt+fn8m6mnyBzaFlktKoWTk0M4HlEOYdnCqTDtt9zJKefn96egCi/C20XzALJ
 Gl6PFGTr/cO35FO2U2NrvyXWE+bzEQ==
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
 sound/soc/qcom/qdsp6/q6apm.c | 57 +++++++++++-------------------------
 1 file changed, 17 insertions(+), 40 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm.c b/sound/soc/qcom/qdsp6/q6apm.c
index 0e667a7eb546..7a7d7195d990 100644
--- a/sound/soc/qcom/qdsp6/q6apm.c
+++ b/sound/soc/qcom/qdsp6/q6apm.c
@@ -99,12 +99,8 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	struct apm_graph_mgmt_cmd *mgmt_cmd;
 	struct audioreach_sub_graph *sg;
 	struct q6apm *apm = graph->apm;
-	int i = 0, rc, payload_size;
-	struct gpr_pkt *pkt;
-
-	payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
-
-	pkt = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
+	int i = 0, payload_size = APM_GRAPH_MGMT_PSIZE(mgmt_cmd, num_sub_graphs);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(payload_size, opcode, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -120,11 +116,7 @@ static int audioreach_graph_mgmt_cmd(struct audioreach_graph *graph, uint32_t op
 	list_for_each_entry(sg, &info->sg_list, node)
 		mgmt_cmd->sub_graph_id_list[i++] = sg->sub_graph_id;
 
-	rc = q6apm_send_cmd_sync(apm, pkt, 0);
-
-	kfree(pkt);
-
-	return rc;
+	return q6apm_send_cmd_sync(apm, pkt, 0);
 }
 
 static void q6apm_put_audioreach_graph(struct kref *ref)
@@ -148,16 +140,13 @@ static void q6apm_put_audioreach_graph(struct kref *ref)
 
 static int q6apm_get_apm_state(struct q6apm *apm)
 {
-	struct gpr_pkt *pkt;
-
-	pkt = audioreach_alloc_apm_cmd_pkt(0, APM_CMD_GET_SPF_STATE, 0);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_apm_cmd_pkt(0,
+								APM_CMD_GET_SPF_STATE, 0);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
 	q6apm_send_cmd_sync(apm, pkt, APM_CMD_RSP_GET_SPF_STATE);
 
-	kfree(pkt);
-
 	return apm->state;
 }
 
@@ -270,7 +259,7 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 {
 	struct apm_cmd_shared_mem_unmap_regions *cmd;
 	struct audioreach_graph_data *data;
-	struct gpr_pkt *pkt;
+	struct gpr_pkt *pkt __free(kfree) = NULL;
 	int rc;
 
 	if (dir == SNDRV_PCM_STREAM_PLAYBACK)
@@ -290,7 +279,6 @@ int q6apm_unmap_memory_regions(struct q6apm_graph *graph, unsigned int dir)
 	cmd->mem_map_handle = data->mem_map_handle;
 
 	rc = audioreach_graph_send_cmd_sync(graph, pkt, APM_CMD_SHARED_MEM_UNMAP_REGIONS);
-	kfree(pkt);
 
 	audioreach_graph_free_buf(graph);
 
@@ -420,13 +408,11 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 {
 	struct apm_data_cmd_wr_sh_mem_ep_data_buffer_v2 *write_buffer;
 	struct audio_buffer *ab;
-	struct gpr_pkt *pkt;
-	int rc, iid;
-
-	iid = q6apm_graph_get_rx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_pkt(sizeof(*write_buffer), DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
-				   graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
-				   graph->port->id, iid);
+	int iid = q6apm_graph_get_rx_shmem_module_iid(graph);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*write_buffer),
+		       			DATA_CMD_WR_SH_MEM_EP_DATA_BUFFER_V2,
+     					graph->rx_data.dsp_buf | (len << APM_WRITE_TOKEN_LEN_SHIFT),
+     					graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -450,11 +436,7 @@ int q6apm_write_async(struct q6apm_graph *graph, uint32_t len, uint32_t msw_ts,
 
 	mutex_unlock(&graph->lock);
 
-	rc = gpr_send_port_pkt(graph->port, pkt);
-
-	kfree(pkt);
-
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_write_async);
 
@@ -463,12 +445,10 @@ int q6apm_read(struct q6apm_graph *graph)
 	struct data_cmd_rd_sh_mem_ep_data_buffer_v2 *read_buffer;
 	struct audioreach_graph_data *port;
 	struct audio_buffer *ab;
-	struct gpr_pkt *pkt;
-	int rc, iid;
-
-	iid = q6apm_graph_get_tx_shmem_module_iid(graph);
-	pkt = audioreach_alloc_pkt(sizeof(*read_buffer), DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
-				   graph->tx_data.dsp_buf, graph->port->id, iid);
+	int iid = q6apm_graph_get_tx_shmem_module_iid(graph);
+	struct gpr_pkt *pkt __free(kfree) = audioreach_alloc_pkt(sizeof(*read_buffer),
+		       			DATA_CMD_RD_SH_MEM_EP_DATA_BUFFER_V2,
+     					graph->tx_data.dsp_buf, graph->port->id, iid);
 	if (IS_ERR(pkt))
 		return PTR_ERR(pkt);
 
@@ -490,10 +470,7 @@ int q6apm_read(struct q6apm_graph *graph)
 
 	mutex_unlock(&graph->lock);
 
-	rc = gpr_send_port_pkt(graph->port, pkt);
-	kfree(pkt);
-
-	return rc;
+	return gpr_send_port_pkt(graph->port, pkt);
 }
 EXPORT_SYMBOL_GPL(q6apm_read);
 
-- 
2.51.0


