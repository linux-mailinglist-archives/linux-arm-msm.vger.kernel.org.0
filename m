Return-Path: <linux-arm-msm+bounces-77722-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2247EBE751A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:58:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2AFC8623FD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:58:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 59DB82D29CF;
	Fri, 17 Oct 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LJAu11vz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22F82D6E70
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691398; cv=none; b=qlikFBM+zg/Qh/s84iNim5QkMKl7Q6MlkfK6/20I+0zP8ICyrLM1vcPWFwqwEl76zv2XjkvydkvmVRwoxCqpStwV3WI+bJkzU8NK6h2g1VDJdQ5guEUkfsnPdSDRBvmtqkHEy38c39W+uhrggnSWBv07mCwGaDhKrMT8Mt/3H3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691398; c=relaxed/simple;
	bh=q/PMmiVC8flD2msphuOxMjtp0nJ5hITJsUZZz4yu0HQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JxXcLWw7Qmpy64sxw+55ILHT3zXf71u2dHjmMd1YXN+4smgw08/e/yS+mJ+LqcPvAz2Jkq6GM5OwSyPaIeSGnaNZWNnw0ZxSbvcy69Cnx7+Z/CcafYc7JPa4pCjWgoC1vynr6xBMHa4Yi5NPNlpe3dJ/uQARAEKPcw8IaJRUGf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LJAu11vz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H83cR6016169
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=F+z8rOJy0kp
	gsPU139d4TxeICpAZrzgqvaXcpET0pPQ=; b=LJAu11vz8LCePWJp4HVdHVzeNlm
	SqyNTSMddSApLrPEucpKL5Gskse3KLFmZYAzDUuifbn0bZXTP3Qdc7nRkclW/oN4
	rG4Ajv/G18fBFVmhVTPCVFjRX99OP36yxLsPudorDG3ZQUqOm69YALBxaCfS2b0O
	vNV43sGxx7HG+kR0M/mFZw3A/AfdGKwrSdjwhhxT31Rshxa222ptcZlizQNCh+Ie
	iLOJ/aKMa/v4LjTpOvg3HCwBXcgO+Z23fnDmJ3ap7op4NQPYFpBSFjLR3bAh8DUK
	/DoLIlZaEBnt5iflHz+DF6TWdIosUqorMnz9r+2OocxRlVOXpVswOKb6/Ow==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5uqhb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:34 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-87c0e0d12ddso61063706d6.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691394; x=1761296194;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F+z8rOJy0kpgsPU139d4TxeICpAZrzgqvaXcpET0pPQ=;
        b=NoF4E2KUV+t4h31jCL+4+O4D6gsPZL2261j3fmR/SCoo2n0+KUy1t+UgNSHV48VT38
         kk8KV068WeGZseuoZZV7gSCdlTwQxfE54WMfb0VbCx5Cxpdp17iH/2vX2i9qfvJ/M4q5
         AV3Tq/gekhkjlPYOc6CRB0edHJ7ap0YdywaqBf0uVQU6nhKT7RtbYUdGQz7xa+27dtlA
         J4JT34jlIq+it+8X7tLdunl/ZBSbnnLJj8QcmztCSzQUTaERWjE8v5IQSbv7EVHVjSqg
         NgAf8wYCir/OR/YJFalwt19w5awqR5mYdGsTemvufzsbRWovE9iaJaB9xT91AWUCrPQL
         mPaQ==
X-Forwarded-Encrypted: i=1; AJvYcCW3Bu2JUiQw7eQRxP/eWCukokXeCrZwZKiugvYVY25jKM1uekArcxJ9IDEoK+qfK9ASG1ftmIP4+6OkR+a9@vger.kernel.org
X-Gm-Message-State: AOJu0YwLh6ZGxXQs0kIraOtCRtVXrLkeVDqmN/hjSYqVyvJecHrSxOCD
	R9VzSdpLSRmcMtxP4dew/3+345bL2WIu6yIVL9/DXqM9I5e3m5a6zCU60D6b9N8Yri+fXC/ZJmW
	623tvOhPWx6ocV7BeynG8/Trs4laVqP/G3InA/Gymhti8c+3H82yczlev2nDVHA21FxY4
X-Gm-Gg: ASbGncuBg4sdMxqOybSMhtrVvJOQJo9o6OMcJjZkKJWh6mxO0Ulybqk42QzJivssXCw
	X13nCkKX6FaEgBs3nUenlgxp7F5MN5600xjVZkDV5d6YYgkHMk2U+da4I5epTmF/nMuc5AUKsfB
	/cXurwapevvpCzsAeWD6Ne8JXQkfZUAPv1rb7NDrvWfwVmpvhmwBKiYehSZQ+3aDHgzjBPm3quB
	Qw8sjZAwpDugEEbc7B+R9PvuA5aQtauhVUDGIBEf/MtZAzfHDCZscfQLyfDaTmtonj49dPShGrV
	xUGvaN/1gg8ng7sAVYYAk4cZFUgiBRVOQw3IC0LkfGqAcMBUYhtziJtQci1T6eEOoBicGJl0p/+
	jLNKcJjlY9O0w
X-Received: by 2002:a05:622a:1452:b0:4e8:94c7:a60a with SMTP id d75a77b69052e-4e89d21c2e5mr37888751cf.13.1760691393866;
        Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKytRRtMMI32c2JW1OGRhxHnTVyHXZTvnHTnRFGDd0RnBqK5ZD64ayhr4jB89/lKGz/3auoA==
X-Received: by 2002:a05:622a:1452:b0:4e8:94c7:a60a with SMTP id d75a77b69052e-4e89d21c2e5mr37888531cf.13.1760691393331;
        Fri, 17 Oct 2025 01:56:33 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:32 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 08/12] ASoc: qcom: q6asm: Use automatic cleanup of kfree()
Date: Fri, 17 Oct 2025 09:53:03 +0100
Message-ID: <20251017085307.4325-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: NzOPDG0GGrhc9lDV0nDy-aTLPYv13xkZ
X-Proofpoint-ORIG-GUID: NzOPDG0GGrhc9lDV0nDy-aTLPYv13xkZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfX3Af9b6lRm5pj
 /N7p9C6R/XR9+9QTbQmvfdcJbOJ/lfgWf8iZugf4VmACVkbzPGHEt4Zd2xdfjH+c4R1+Q9MJXLq
 R3KLINSuk1mY930MY9uzsp95Xi03TcjBIHfYBTfUKk7yPOAr7+6dzyS/BlFgHBhBMlw9747f/z/
 OYEwc99XBO3ny87pXgSY1hlMW6ihimfUzd3AnaoyXP4d1DtEvjjhPmK1PpGXCqhiNa3eEXHVKd4
 3paiVsmHp7g0T/+6Yudr3lApOrncWsb7NGtveANvO2cHlbb5QQSnBP5HLDzV1fq1mwqJwsm+2qF
 Gu0QpcfyjIZxwYiuOfeWMOs41arigVr08qldlIvMATZJ91iLrEbYPyCTTVGw1hxn2QE1Jdse1na
 qVrO98+JuGjMnAwaDz6RamCzot1fKw==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f204c2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=GTJLAGQgu5kf8ZLGHUQA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Its common pattern in q6dsp code to allocate temporary buffer
to send gpr/apr packets and free at the function exit.
Now this can be simplified via __free(kfree) mechanism.

No functional changes.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 166 +++++++++--------------------------
 1 file changed, 42 insertions(+), 124 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 67e9ca18883c..366fe8a8387f 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -333,7 +333,7 @@ static int __q6asm_memory_unmap(struct audio_client *ac,
 	struct q6asm *a = dev_get_drvdata(ac->dev->parent);
 	struct apr_pkt *pkt;
 	int rc, pkt_size;
-	void *p;
+	void *p __free(kfree) = NULL;
 
 	if (ac->port[dir].mem_map_handle == 0) {
 		dev_err(ac->dev, "invalid mem handle\n");
@@ -358,14 +358,11 @@ static int __q6asm_memory_unmap(struct audio_client *ac,
 	mem_unmap->mem_map_handle = ac->port[dir].mem_map_handle;
 
 	rc = q6asm_apr_send_session_pkt(a, ac, pkt, 0);
-	if (rc < 0) {
-		kfree(pkt);
+	if (rc < 0)
 		return rc;
-	}
 
 	ac->port[dir].mem_map_handle = 0;
 
-	kfree(pkt);
 	return 0;
 }
 
@@ -429,10 +426,10 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	struct audio_port_data *port = NULL;
 	struct audio_buffer *ab = NULL;
 	struct apr_pkt *pkt;
-	void *p;
+	void *p __free(kfree) = NULL;
 	unsigned long flags;
 	uint32_t num_regions, buf_sz;
-	int rc, i, pkt_size;
+	int i, pkt_size;
 
 	if (is_contiguous) {
 		num_regions = 1;
@@ -479,12 +476,7 @@ static int __q6asm_memory_map_regions(struct audio_client *ac, int dir,
 	}
 	spin_unlock_irqrestore(&ac->lock, flags);
 
-	rc = q6asm_apr_send_session_pkt(a, ac, pkt,
-					ASM_CMDRSP_SHARED_MEM_MAP_REGIONS);
-
-	kfree(pkt);
-
-	return rc;
+	return q6asm_apr_send_session_pkt(a, ac, pkt, ASM_CMDRSP_SHARED_MEM_MAP_REGIONS);
 }
 
 /**
@@ -930,12 +922,8 @@ int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 {
 	struct asm_stream_cmd_open_write_v3 *open;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*open);
-
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int rc, pkt_size = APR_HDR_SIZE + sizeof(*open);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1001,7 +989,6 @@ int q6asm_open_write(struct audio_client *ac, uint32_t stream_id,
 	ac->io_mode |= ASM_TUN_WRITE_IO_MODE;
 
 err:
-	kfree(pkt);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(q6asm_open_write);
@@ -1012,11 +999,8 @@ static int __q6asm_run(struct audio_client *ac, uint32_t stream_id,
 {
 	struct asm_session_cmd_run_v2 *run;
 	struct apr_pkt *pkt;
-	int pkt_size, rc;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*run);
-	p = kzalloc(pkt_size, GFP_ATOMIC);
+	int rc, pkt_size = APR_HDR_SIZE + sizeof(*run);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
 
@@ -1037,7 +1021,6 @@ static int __q6asm_run(struct audio_client *ac, uint32_t stream_id,
 			rc = 0;
 	}
 
-	kfree(pkt);
 	return rc;
 }
 
@@ -1098,11 +1081,8 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 	struct asm_multi_channel_pcm_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
 	u8 *channel_mapping;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1125,16 +1105,11 @@ int q6asm_media_format_block_multi_ch_pcm(struct audio_client *ac,
 	} else {
 		if (q6dsp_map_channels(channel_mapping, channels)) {
 			dev_err(ac->dev, " map channels failed %d\n", channels);
-			rc = -EINVAL;
-			goto err;
+			return -EINVAL;
 		}
 	}
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-
-err:
-	kfree(pkt);
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_media_format_block_multi_ch_pcm);
 
@@ -1144,11 +1119,8 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 {
 	struct asm_flac_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1168,10 +1140,7 @@ int q6asm_stream_media_format_block_flac(struct audio_client *ac,
 	fmt->max_frame_size = cfg->max_frame_size;
 	fmt->sample_size = cfg->sample_size;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-	kfree(pkt);
-
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_flac);
 
@@ -1181,11 +1150,8 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 {
 	struct asm_wmastdv9_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1206,10 +1172,7 @@ int q6asm_stream_media_format_block_wma_v9(struct audio_client *ac,
 	fmt->enc_options = cfg->enc_options;
 	fmt->reserved = 0;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-	kfree(pkt);
-
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v9);
 
@@ -1219,11 +1182,8 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 {
 	struct asm_wmaprov10_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1245,10 +1205,7 @@ int q6asm_stream_media_format_block_wma_v10(struct audio_client *ac,
 	fmt->advanced_enc_options1 = cfg->adv_enc_options;
 	fmt->advanced_enc_options2 = cfg->adv_enc_options2;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-	kfree(pkt);
-
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_wma_v10);
 
@@ -1258,11 +1215,8 @@ int q6asm_stream_media_format_block_alac(struct audio_client *ac,
 {
 	struct asm_alac_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1287,10 +1241,7 @@ int q6asm_stream_media_format_block_alac(struct audio_client *ac,
 	fmt->mb = cfg->mb;
 	fmt->kb = cfg->kb;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-	kfree(pkt);
-
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_alac);
 
@@ -1300,11 +1251,8 @@ int q6asm_stream_media_format_block_ape(struct audio_client *ac,
 {
 	struct asm_ape_fmt_blk_v2 *fmt;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*fmt);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*fmt);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1327,10 +1275,7 @@ int q6asm_stream_media_format_block_ape(struct audio_client *ac,
 	fmt->sample_rate = cfg->sample_rate;
 	fmt->seek_table_present = cfg->seek_table_present;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-	kfree(pkt);
-
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_stream_media_format_block_ape);
 
@@ -1340,11 +1285,8 @@ static int q6asm_stream_remove_silence(struct audio_client *ac, uint32_t stream_
 {
 	uint32_t *samples;
 	struct apr_pkt *pkt;
-	void *p;
-	int rc, pkt_size;
-
-	pkt_size = APR_HDR_SIZE + sizeof(uint32_t);
-	p = kzalloc(pkt_size, GFP_ATOMIC);
+	int rc, pkt_size = APR_HDR_SIZE + sizeof(uint32_t);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
 
@@ -1359,8 +1301,6 @@ static int q6asm_stream_remove_silence(struct audio_client *ac, uint32_t stream_
 	if (rc == pkt_size)
 		rc = 0;
 
-	kfree(pkt);
-
 	return rc;
 }
 
@@ -1403,11 +1343,8 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 	struct apr_pkt *pkt;
 	u8 *channel_mapping;
 	u32 frames_per_buf = 0;
-	int pkt_size, rc;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*enc_cfg);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*enc_cfg);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1428,15 +1365,10 @@ int q6asm_enc_cfg_blk_pcm_format_support(struct audio_client *ac,
 	enc_cfg->is_signed = 1;
 	channel_mapping = enc_cfg->channel_mapping;
 
-	if (q6dsp_map_channels(channel_mapping, channels)) {
-		rc = -EINVAL;
-		goto err;
-	}
+	if (q6dsp_map_channels(channel_mapping, channels))
+		return -EINVAL;
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-err:
-	kfree(pkt);
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 EXPORT_SYMBOL_GPL(q6asm_enc_cfg_blk_pcm_format_support);
 
@@ -1456,12 +1388,9 @@ int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 	struct audio_buffer *ab;
 	struct apr_pkt *pkt;
 	unsigned long flags;
-	int pkt_size;
+	int pkt_size = APR_HDR_SIZE + sizeof(*read);
 	int rc = 0;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*read);
-	p = kzalloc(pkt_size, GFP_ATOMIC);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
 
@@ -1493,7 +1422,6 @@ int q6asm_read(struct audio_client *ac, uint32_t stream_id)
 	else
 		pr_err("read op[0x%x]rc[%d]\n", pkt->hdr.opcode, rc);
 
-	kfree(pkt);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(q6asm_read);
@@ -1503,11 +1431,8 @@ static int __q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 {
 	struct asm_stream_cmd_open_read_v3 *open;
 	struct apr_pkt *pkt;
-	int pkt_size, rc;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*open);
-	p = kzalloc(pkt_size, GFP_KERNEL);
+	int pkt_size = APR_HDR_SIZE + sizeof(*open);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_KERNEL);
 	if (!p)
 		return -ENOMEM;
 
@@ -1535,10 +1460,7 @@ static int __q6asm_open_read(struct audio_client *ac, uint32_t stream_id,
 		pr_err("Invalid format[%d]\n", format);
 	}
 
-	rc = q6asm_ac_send_cmd_sync(ac, pkt);
-
-	kfree(pkt);
-	return rc;
+	return q6asm_ac_send_cmd_sync(ac, pkt);
 }
 
 /**
@@ -1578,12 +1500,9 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	struct audio_buffer *ab;
 	unsigned long flags;
 	struct apr_pkt *pkt;
-	int pkt_size;
+	int pkt_size = APR_HDR_SIZE + sizeof(*write);
 	int rc = 0;
-	void *p;
-
-	pkt_size = APR_HDR_SIZE + sizeof(*write);
-	p = kzalloc(pkt_size, GFP_ATOMIC);
+	void *p __free(kfree) = kzalloc(pkt_size, GFP_ATOMIC);
 	if (!p)
 		return -ENOMEM;
 
@@ -1618,7 +1537,6 @@ int q6asm_write_async(struct audio_client *ac, uint32_t stream_id, uint32_t len,
 	if (rc == pkt_size)
 		rc = 0;
 
-	kfree(pkt);
 	return rc;
 }
 EXPORT_SYMBOL_GPL(q6asm_write_async);
-- 
2.51.0


