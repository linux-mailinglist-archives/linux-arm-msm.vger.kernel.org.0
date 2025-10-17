Return-Path: <linux-arm-msm+bounces-77725-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E9420BE751E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 10:58:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id DF9E7350C9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 08:58:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D3142D9499;
	Fri, 17 Oct 2025 08:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y+5pZSdK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 367032C1589
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691401; cv=none; b=BvYp7ASctfUXwxYy785vGNtLLjDGzON7efkhdf57H4WlE2ihcpHn1wOYHVyK2KsC5J9f02CrIvMJJ+g+TadEfHcjHk/UO7obeCYYZhM/elinWqn1HASoFDJPHI1uS2s6E3cXVe6DdyN271a/7+hjtlgBDhRL0zKsYyUEBmvXlhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691401; c=relaxed/simple;
	bh=xJ9ewBKmUOcp7y1OOXagWe0RLhZPnHfQRgccA5gcwCw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dph3Nz5d4xN53dh0aQLVRCCScu8kD5d8cfVTWxjo3GzVbOlOMJEFb6Adf9Ki5mY16Vi4ILWHScyfAEDpak+jGiGwcoU7x7WCXfzUrJVP6qMEk81OYvioJzPAwp6QdFMzG4faeX6vI42OT8EHkgms7PgpOwBXeDATa7bFY/G9fFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y+5pZSdK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H8BG4k016194
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HLTr0qwAyjy
	py8cQSzVdRdWFvvEMv8L8lE7ajdfrlhc=; b=Y+5pZSdKuMh+SRNrogEKtF6KYjd
	TozBO2qtdkfBE7Ztr9MWJ+4AwjifZWT1w2hmBY92nBjEaukcGdWWgiZQiC+PaSum
	pqYIjsMZePaPWRdUf8PMghtFxrw2Rq1mSiVCRktkXKFn7w15EZwnhnpOVKvyQ3RP
	/O4gHwPlSl7iwnZ0RTJFrCO2of/5ASDyP92Tp3NSkcMlkqjPGFyqY8uK+fcvl4XM
	2SPIee9X6fu4ewNDouDsm3BZWExg6nlAtyWVdmVpGKUCFMQq3Lm2ybiefeDxP7qy
	Yh0ytmOc/QaNXSSuUTChmI1Om0PjwElxQmTp/53+CndtQ6LtAz5XXSp4mrA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5uqhm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-890f1090e44so145598685a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691397; x=1761296197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HLTr0qwAyjypy8cQSzVdRdWFvvEMv8L8lE7ajdfrlhc=;
        b=gzctaoMFoANJ4uoWUFPQlsIOpn8XcAk4LxYRxeWby+E8Zpxp4hCzE8eN4CvcuzfsSG
         dMqoL5xyW3aCNut1VSJ/lMQCobR1fzqlXqktOGIy0pZPewyWiYVrO41K92/74y4b9ioZ
         mNaBabdtl2RLPgQ7I8/uKHS459oNcIydzKFFsx8rKXiIsKpFwkFkIGn51LzAxx+woGrn
         dRx9zv19+OciL6uXD5ZnfcPQ4VlQs2+2est7GrZRVVnyk51j32T5Ag9LNntSQPHOdUVf
         7VwqXpdR56BpIP9wnDcQUB5dnDItIDW2AWtWCXBJ/sZJaAy/uAO1QXYuWk8cx6U5h7wc
         gTMA==
X-Forwarded-Encrypted: i=1; AJvYcCXwSdyg6It2ySroMLZw7x0UToZ/7bR6rNR2bZTDUIZuszVv7HHvQaV8PGJlhHRfrzbEV17uunr5cyBo/YKl@vger.kernel.org
X-Gm-Message-State: AOJu0YwDsj9TkpxwL4jRo+AkV3gWu1nEH3JIKqHUbQJJFl9MICxEtvld
	766CyKqybM+srNlg06drrNvz6wGCsEFAkGcE8gCWQsOfFf3fRp5PV/75lgAgOf2F+a1iLZthf0F
	kM4jAinDCLgHPrva6dI26Tq6qNLROqZScXxfzCkcpylYTWRtlu0/Br0z0wA00mKGAsZuC
X-Gm-Gg: ASbGncuJUJo4Tq3lxS4ZSrHPExaL5JAQj4cEwnjKw5zaGVpejQTcndNekSqhHvCBHj9
	BzUIN0FdqqYQy3uosOC0DPi3Y/q3SpDyqY/zKflGn8WisQujIJOen75UHn5e8OGTPR6fomXvBIJ
	DmUCzwQY5zCiIUhm8m95JzDrRpT69CxhGjkF43Rqp5yBi2VuIHb7fPpt0TPLVnNewhm8/AOg6cm
	/twFue5YVy3Ij3CVWxer5aE33VLVYzmaVNXifMQ3ESyNUIPYvz87iQulS0GV1oJt+oLUNVUYHeL
	W4OAKWQFhLw4nUdERdJQXo+34aX/gaXN1Cfq0qyd+DPovbnHOOoVKwxNBBWkUU2Thwpl1JfoXUe
	M8LhyQRGZAVxO
X-Received: by 2002:ac8:7c54:0:b0:4da:3218:e8da with SMTP id d75a77b69052e-4e89d263059mr42429391cf.17.1760691396907;
        Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGiJl3aHFmjmNgCLDQr4OtAu7l19M62+p30JfjEUZEfWKYdayPHQpd/eRhXsqwlIUUFFwADg==
X-Received: by 2002:ac8:7c54:0:b0:4da:3218:e8da with SMTP id d75a77b69052e-4e89d263059mr42429211cf.17.1760691396380;
        Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 11/12] ASoC: qcom: q6asm-dai: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:06 +0100
Message-ID: <20251017085307.4325-12-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: yrxAcYd7CHzbnkI2YhbOYI7N17LBFvbP
X-Proofpoint-ORIG-GUID: yrxAcYd7CHzbnkI2YhbOYI7N17LBFvbP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXxOUdbtTgwIHb
 rLomiwroh3WcHDnuuVE26pQ9BnLcfvKZMbfUNxPZRV4cxwXaA6r/7PO0eEbxg2OKyYoS8BjZZe3
 O+NmjWyh4GkUzghiX4KLvSC3zNGHwVfHk1KJNAg7kOfM+icTUaFTOCtr3cNFLfcNjZmAnZ70bg5
 1u5S/0yiOXsjEO7qmuvC1etoPnHI2of8yXLjina5o+pyeoobEECkfC5W+nwYUPNDgD9cgIGMUfj
 Ed2lLlmP79k8owWNtgqSTkro1GUUyET3awg8dgYK1R6MMBXi7UoX7w6D90BItlBw4AKk24k7k/u
 2HK4DKkjWyXsgpKV8Qj3ptguXqvJBFmE2leOEKUTySoKVhvXiKFtdMENO5Teama4Z6SBCRJclNp
 O+6ui/qpF9gHo438uGNk8BRbVOKp+A==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68f204c5 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=xYGVKCReuHkqpmdgNokA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index b616ce316d2f..665a5d1ec4cf 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -493,15 +493,15 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
@@ -512,11 +512,9 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			prtd->bytes_sent += prtd->pcm_count;
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	case ASM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			if (substream->partial_drain) {
 				/*
@@ -539,20 +537,16 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
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
@@ -581,7 +575,6 @@ static void compress_event_handler(uint32_t opcode, uint32_t token,
 			q6asm_cmd_nowait(prtd->audio_client,
 					 prtd->stream_id, CMD_EOS);
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 
 	default:
@@ -1031,17 +1024,14 @@ static int q6asm_dai_compr_pointer(struct snd_soc_component *component,
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
 
@@ -1051,7 +1041,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	u32 wflags = 0;
 	uint64_t avail, bytes_in_flight = 0;
 	void *dstn;
@@ -1087,7 +1076,7 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
@@ -1113,8 +1102,6 @@ static int q6asm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0


