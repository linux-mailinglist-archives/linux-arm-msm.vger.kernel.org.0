Return-Path: <linux-arm-msm+bounces-78547-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id E61E7C007C2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:30:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 5D43B358F6F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:30:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6AE730FF2F;
	Thu, 23 Oct 2025 10:26:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BpDD0I/c"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561330F93E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215184; cv=none; b=lJOPhWyQm105KbTSGR4r8mL+tHWdIw1Vey5UeyXwFZFWbr5FXli9xIKpx+zGjQYGG0JSblX1aik4Dwvp1Vf0HCLKf7w46oOU4Q8KAAYmSWsU4ud/mo3xgjBHPKII23gbDiA/QdlUf+MqSgl3pXZehkqeX3CV0QVS2G1x2TDSLQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215184; c=relaxed/simple;
	bh=GHK0Bqp+aTp5qa54qoIO0zDF/pnvyDKyrzUXWBxCkX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y6XoOY2shVXKhi1eRysvd/QgMcEl/8zKdSZSUTDXzO/REo1mQf4EMDI4Vh84+zgH04JBkw67G/yXw9lVT8EcSgig8sxB9vSThDJ8uoe5SNXoDJgCD+Sf5E4QGNjzBCEEjpg/IobqpxIgGvT00piRALLEhevtKToCzcWW0yQikSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BpDD0I/c; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6aMp6028864
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=p73jpS1MlOw
	p0RMwgOu6rekzfzyJhQno1fUo+yocZrI=; b=BpDD0I/crsGM338CVtCzuLSppkw
	zHBj7MZmLlOhDwm5xuk29i0aw61khuSDX347KL2i7tgMv2Aq/lZjN4ZGuKnWfVMO
	ndnNoVjhu4MgojrsoahLFhBC/siPqL+q5QDGl+aTht+UtdQUfrmhJ9gIYyyHVSUa
	7AHXMFsC/Sul5J+hGNuG9He6RI6iLXxtn3dLlGn3uk15Ml0fzx/ApzPRbL1D/j0f
	/xWFq7Mv6ZNhxPhlK9q0hrbM+FRur3N7bi1PFnfwzyLlmCBePn7sQw4kMuIEfp0u
	6Q0syuQ02jF05/fm41VoQ2oMGl0ldPN62D6PJ6EuG65X93F4kOvQPRkOHkg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdp29-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:21 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e894937010so18242481cf.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215180; x=1761819980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p73jpS1MlOwp0RMwgOu6rekzfzyJhQno1fUo+yocZrI=;
        b=bX8zC02Nqke/xEUT7yA0gmGkLmC9c+ridc8E+lrTZDqhvCZvPHsCaydvcDn6kcibZZ
         Lyv+Vohxh2NXv8pjGsNMC9OugS7S5n5FGhgR4dP9mTfA/rhz3FgJMhO1HnMH4fU+cccu
         JZKab0aIv4ZT5/hbWiRXwy8AeTdOSmg0fAjZDAedmxRH/NLEqxwyJ6PKkpzLvjwEWJnr
         sEsVbys+2FZAuSj+Iq2lecCaPPcts4J1gCa1damsNX73xa48jHwakRoY6uKBYPB26iJ7
         Lf+BiFkwqjMo01G63WKNR9qeyfYsEwA9e5ZuXqIDJwmFn/26JDydYulJaWMVUYAbSg3c
         OXuw==
X-Forwarded-Encrypted: i=1; AJvYcCVmVTNDGkk1VwyP2YMdIxS/4hc0kxLQ+GnY8EHtvXlqZ9wJgzM6Zn9lepYH+9WGekWVfAT6dHspbSkkwr+S@vger.kernel.org
X-Gm-Message-State: AOJu0YzndUnpbchBGZp7L0OaFzYilXQ143Eze5S/THVmEXd6A5gsU4bZ
	8YAaZ/vKUucTh8A7eAPvP1C7QuTjYjkF3gnaOdrP/t4G/r37uSg8Bx6DMR9isgdnN5JKR7yhG37
	UpsR1DhBLGJX/mJULalj7ZGh0Nko1YrAQ+OR47Sw6ibbGZRUKp7jl96qjC7ha6kv4+I10
X-Gm-Gg: ASbGnctOSyBgMPXFxm5haEyVqkDpRw3o2X1BG1Sn1FJq7+ejmmi7yrRk6YtFxZeDSEL
	uRzVUyI8K9/Z+fZl7VOrX8Z+rDzTJvKE9Nyc6+p9D2k/eS/KUd7N2sM3MeRh3/aNpsH7VryWkp6
	fNWUdeLJ1G90aZOMqiMvHKhRfbTGOGlyEUhs8og8pgC2Inncx1r01TNST5h/eQ2MRC6Fw4Z5YGw
	az1STNUqThEw+KDoCLFOnYxz87+VLedDIq2JUalVX063u6PCKrcHOzGRgiaDRMUgusItlkutd81
	bVO74cO7Gs6BeWxH76MSD00gDqPNYi7SaVRFbJhg1QQxQS3khRnpcKOPFFT3UTlcQX2LwFuvl0v
	y06HA+5y84rZC
X-Received: by 2002:ac8:5e12:0:b0:4e8:a8dd:9f1d with SMTP id d75a77b69052e-4e8a8dda67dmr231425231cf.59.1761215180547;
        Thu, 23 Oct 2025 03:26:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFla5PtPNq5rn1k275rdtDmgbOjAIyKKrz4PKBO1yGkb8lsA6j+rK15MhKTPeqe4vSpMLSntw==
X-Received: by 2002:ac8:5e12:0:b0:4e8:a8dd:9f1d with SMTP id d75a77b69052e-4e8a8dda67dmr231425031cf.59.1761215179964;
        Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:19 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 20/20] ASoC: qcom: q6asm: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:44 +0100
Message-ID: <20251023102444.88158-21-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 1fQtZmVMK_rakYddUUtGuoFmhmhJ68fM
X-Proofpoint-GUID: 1fQtZmVMK_rakYddUUtGuoFmhmhJ68fM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX/5KiDuyYKdD4
 EZIC5dnQBvA1+/pfnuCNXsiOH6Vxddfzbo6uhRjjH+GdDqnpXNAqs7Wlf1KUBkvB9KqqS6UQzKb
 3uls0m1zZLIok7TQLcpusrAXTtTvXBUyqdZtUgXSCeLGzuSGoAOarIKLH6hCUb94EvEeq/FjPqn
 zmq2AFr4uVe4ostS1glk0N1u6ddWWdiXqVNDREhzj3FywzvD2pXV7jSd+2ChiQxMfZuIBRGTDKv
 rcxmQuf7HLhJUCbuT6i5gjOXJBunN5ORRRAFIp3Oci6kZSs1Lc+U5IA748houQHgWVNqw142S2r
 IeKZH5WdNkV4tpyDKG7hCxIdQwOXQPDQD3zH1QHsxpxMbJtEaxBvfKlpKv757OW67CoYmPJ/Hzq
 bQ9OiCbFc1oKzr87baCopoXP7bB2Mw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa02cd cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=C-aEvXguSqPNF6A64mIA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Clean up the code using guard() for spin locks.

No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm.c | 20 ++++----------------
 1 file changed, 4 insertions(+), 16 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm.c b/sound/soc/qcom/qdsp6/q6asm.c
index 431a99776dcc..e7295b7b2461 100644
--- a/sound/soc/qcom/qdsp6/q6asm.c
+++ b/sound/soc/qcom/qdsp6/q6asm.c
@@ -571,9 +571,8 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 						   int session_id)
 {
 	struct audio_client *ac = NULL;
-	unsigned long flags;
 
-	spin_lock_irqsave(&a->slock, flags);
+	guard(spinlock_irqsave)(&a->slock);
 	if ((session_id <= 0) || (session_id > MAX_SESSIONS)) {
 		dev_err(a->dev, "invalid session: %d\n", session_id);
 		goto err;
@@ -588,7 +587,6 @@ static struct audio_client *q6asm_get_audio_client(struct q6asm *a,
 	ac = a->session[session_id];
 	kref_get(&ac->refcount);
 err:
-	spin_unlock_irqrestore(&a->slock, flags);
 	return ac;
 }
 
@@ -681,15 +679,13 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		client_event = ASM_CLIENT_EVENT_DATA_WRITE_DONE;
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			phys_addr_t phys;
-			unsigned long flags;
 			int token = hdr->token & ASM_WRITE_TOKEN_MASK;
 
-			spin_lock_irqsave(&ac->lock, flags);
+			guard(spinlock_irqsave)(&ac->lock);
 
 			port =  &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
 
 			if (!port->buf) {
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = 0;
 				goto done;
 			}
@@ -700,11 +696,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 			    upper_32_bits(phys) != result->status) {
 				dev_err(ac->dev, "Expected addr %pa\n",
 					&port->buf[token].phys);
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
 			}
-			spin_unlock_irqrestore(&ac->lock, flags);
 			atomic_set(&port->hw_ptr, token + 1);
 		}
 		break;
@@ -712,13 +706,11 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 		client_event = ASM_CLIENT_EVENT_DATA_READ_DONE;
 		if (ac->io_mode & ASM_SYNC_IO_MODE) {
 			struct asm_data_cmd_read_v2_done *done = data->payload;
-			unsigned long flags;
 			phys_addr_t phys;
 
-			spin_lock_irqsave(&ac->lock, flags);
+			guard(spinlock_irqsave)(&ac->lock);
 			port =  &ac->port[SNDRV_PCM_STREAM_CAPTURE];
 			if (!port->buf) {
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = 0;
 				goto done;
 			}
@@ -732,11 +724,9 @@ static int32_t q6asm_stream_callback(struct apr_device *adev,
 					&port->buf[hdr->token].phys,
 					done->buf_addr_lsw,
 					done->buf_addr_msw);
-				spin_unlock_irqrestore(&ac->lock, flags);
 				ret = -EINVAL;
 				goto done;
 			}
-			spin_unlock_irqrestore(&ac->lock, flags);
 		}
 
 		break;
@@ -1561,14 +1551,12 @@ EXPORT_SYMBOL_GPL(q6asm_write_async);
 static void q6asm_reset_buf_state(struct audio_client *ac)
 {
 	struct audio_port_data *port;
-	unsigned long flags;
 
-	spin_lock_irqsave(&ac->lock, flags);
+	guard(spinlock_irqsave)(&ac->lock);
 	port = &ac->port[SNDRV_PCM_STREAM_PLAYBACK];
 	port->dsp_buf = 0;
 	port = &ac->port[SNDRV_PCM_STREAM_CAPTURE];
 	port->dsp_buf = 0;
-	spin_unlock_irqrestore(&ac->lock, flags);
 }
 
 static int __q6asm_cmd(struct audio_client *ac, uint32_t stream_id, int cmd,
-- 
2.51.0


