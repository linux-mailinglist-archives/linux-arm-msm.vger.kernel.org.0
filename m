Return-Path: <linux-arm-msm+bounces-78546-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A9AEC007BC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:29:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 079DF19C6385
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7B7BE30F95A;
	Thu, 23 Oct 2025 10:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TMEaPiGL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19E2130F7F7
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215183; cv=none; b=cruVlfpxG4H7dP0kuqwWiyb2qxXW45dYGEDqJBhRMGzLT3JFzB0bQ+qNxVNpEsXGwIPHzVHB8JzF/xXGWA0UEcSosiqyJBAwi7pWkU0hF2KdpS4VC3sQbobqgs/JW2Y4aDYgqru8BwQliSgelOKIBCBgHjG8vmMB1RQhFSo/Mjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215183; c=relaxed/simple;
	bh=KVruKtFGqlNB0x+gho9GBnMGXgQxhRdueAWKRhYaARc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AgC3jU26svuVYsULtOpf3TFbhCB9DNLQUjLyOLHovgirL2JtmaZ8shZeoxHPsBF8ID7NQ+LeYQHszSjHGp/u4ceP3Nzr/+x7N5kMAZ3QK37WakunA61H4CZR4+93OpZZ7aDrjQRhDEJWfzrwocfOZF5EPH9UGxbVwj3Fs5qjYY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TMEaPiGL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7DMWS018119
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=igt0AhPQeVE
	ZDk+mX17La+46irE4J07UVD9f/TtHRVM=; b=TMEaPiGLqoM58qpKZqnF3e3Oufv
	HcKgS0Z7NlHmFuW2qcIiqdi/4MCo1BD9jFyQUrbj0MuYEW7xNf7DDROleSMhEunJ
	seWo+caTntZAtvE0zsg+zhmwrZgEQC3uC87f4INp90/dAROyX3gLBst0kOLGPw0d
	mzd3+cUP31CMrVZBVce4y6eHcR1R2RHU7nOyqdKyPVcHn3vgO9GaUuKNCZSIKScG
	HICdvydpK3PUU2AwjsXzsk98izjv3pcGE8wX2Rj9QOHAkW5A6kgWrLBTesA/2KhX
	PbVLUFxIMeeaTKCXhTs28lXOtOeR0fIBqXqlgwvOyXtfmkzVSxZaZo24WoQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49xhe0nxmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:19 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b33c1d8eso16412281cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215179; x=1761819979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=igt0AhPQeVEZDk+mX17La+46irE4J07UVD9f/TtHRVM=;
        b=poJXEGyXeyT7RL1ojMkDSZUmdoPAVcFdHI5kO/+vLaD36yZ79nKNt2Wcs+jqC61lFL
         xZU9IIp1XiXaMo7lNBeX61qr7miEk6Nxf1F7KkkWSoZvDv9hYBSdaZnc+L+jFYJ+bT2I
         FlWYcGIHC9wMLjFstDBaelc4opzycPLt5h2EVPZTqgV1+85OM0JsHLJCDz0vaJ5fqzp9
         hxYzOamVvigx+NL+ek9NCj86if0HqgP3Nnm8y0iPHVUxtubvEqX86gU8Ygp/aPMDRa6b
         +E9FB4+FRZgKm26PyzHV6o0GbAONn08Wjr/k6JM+ry6Ow61Z7KL3R++4RDZkS6JLulAg
         63dg==
X-Forwarded-Encrypted: i=1; AJvYcCUpzukRnCTSk5RPYLpA7nFTv3BR0vOxgaBQuVY0ibFUiJSedmh2nfaqCjHuYAzqo+rUI6WjKMPP/E/iXSbD@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDs7uCinsMkY6Ne2swVIj1y4E0UPEdcMTDva3p1UYOz4WSLgn
	y9cPlU4NLxQmeAaH85Z/9E6hp6rmBe44j7PframlfPNOgEzFFZ/mi376ttT3XpU3kL0A1k+ABBI
	yzOuHqj/MAA8X2VvG0OIV1z74voxXtfeqh7AWSMtQFSGxykPbY2/xZPzP/kV0yNuqIY9QULB76/
	rt
X-Gm-Gg: ASbGncvIKxUunXCun1Xq+DEtkweSSolq4YdQ2Uehk3jV55/TWv5ywU2MbOe1fcpTlUh
	sDuRfu8Vp+vb9l8bzEUiQz7QJgp5DDacNDIOH48jmzwv5MMMHDc6DnrQ79oAkDCmU+Jd5GCmydv
	avatT8WUeoJ3eD5DkbWUMI24mbRsjMcsFoS+g2JJJGlILn50k5jkyPQZ/TBs+JhauKxBiJ7B3ej
	i862N3XK9zXgCps0l0KMtQsmrAflqkDntQTPeZo9uCoy1lFbpNIrrWTaYLdDjRV/KJHOThTy2j/
	wOfGCl7ZuE3GfOUu73g/bc4K1ODm2XM3OFRIbwyIhbkql0b+axMS4XDW6NliD8wcYHtuN65Xq4e
	yApeCsWXnZ+WH
X-Received: by 2002:a05:622a:1a87:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e89d1ffbacmr265809971cf.8.1761215178917;
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG+9HWC1ogOsnS1B0060yHcN3sg/K3kOHcnAa5/VLs+/IMUhU9gcRDPG6dpfW3Wo0sxZlXl6Q==
X-Received: by 2002:a05:622a:1a87:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e89d1ffbacmr265809711cf.8.1761215178479;
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 19/20] ASoC: qcom: q6asm-dai: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:43 +0100
Message-ID: <20251023102444.88158-20-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIxMDE2NyBTYWx0ZWRfX+rjo2QSWXuJ7
 x3FYvj/vKNJCumplH99AsyplDivzLYOKhojEydiHCprMoy8vu6aT9OmqgfGBg7XAknPkxssG3pB
 QaLn+45cb0jQNQomyaESgYUjL+/3EGJzXI9ich1YhC619FNY2P53c5/OQXHukLCOSLGOCma2+rW
 5sdPMT4X0h15HYwak1oZC9y6KTp9KvwcIjnTp7rG0RqoipxKkySHekEwY+0i+JHTkFCEvwCb78r
 QuA9aIoqEqKo9phyRWIgxOgf1x4Q9kkPESw8sA0APAz+82uUnH30Ph+IpkpBvjL9HZK9PkEvWFY
 Y9Xlds5mbjDJIln6wOhHu8Qc6kbDloZMPqGGLyQHR2KAuFObJaznpGJZx/DQlY4Cf1CNp2ZIH1F
 LQMB8kivFVeJ4kdKM6N6FABJMiNR6g==
X-Proofpoint-ORIG-GUID: BClnIMou6FpU0Re1syWRXcU03pwq0Isa
X-Authority-Analysis: v=2.4 cv=WYUBqkhX c=1 sm=1 tr=0 ts=68fa02cc cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=jAKm68vC9n-ZoyGP1lgA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: BClnIMou6FpU0Re1syWRXcU03pwq0Isa
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 bulkscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510210167

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index 97256313c01a..709b4f3318ff 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -514,15 +514,15 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 {
 	struct q6asm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail;
 	uint32_t bytes_written, bytes_to_write;
 	bool is_last_buffer = false;
 
+	guard(spinlock_irqsave)(&prtd->lock);
+
 	switch (opcode) {
 	case ASM_CLIENT_EVENT_CMD_RUN_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (!prtd->bytes_sent) {
 			q6asm_stream_remove_initial_silence(prtd->audio_client,
 						    prtd->stream_id,
@@ -533,11 +533,9 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			if (substream->partial_drain) {
 				/*
@@ -560,20 +558,16 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 		} else {
 			prtd->state = Q6ASM_STREAM_STOPPED;
 		}
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 
 		bytes_written = token >> ASM_WRITE_TOKEN_LEN_SHIFT;
 		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
-		if (prtd->state != Q6ASM_STREAM_RUNNING) {
-			spin_unlock_irqrestore(&prtd->lock, flags);
+		if (prtd->state != Q6ASM_STREAM_RUNNING)
 			break;
-		}
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
 		if (avail > prtd->pcm_count) {
@@ -602,7 +596,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			q6asm_cmd_nowait(prtd->audio_client,
 					 prtd->stream_id, CMD_EOS);
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	default:
@@ -1052,17 +1045,14 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	uint64_t temp_copied_total;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return 0;
 }
 
@@ -1072,7 +1062,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail, bytes_in_flight = 0;
 	void *dstn;
@@ -1108,7 +1097,7 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
@@ -1134,8 +1123,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0


