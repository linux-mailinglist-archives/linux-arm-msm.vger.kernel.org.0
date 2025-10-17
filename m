Return-Path: <linux-arm-msm+bounces-77724-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C96CEBE77A1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 11:12:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 24A625829BD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 09:09:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16C7E2D8788;
	Fri, 17 Oct 2025 08:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vvs8WIIa"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1E302D7DD8
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760691400; cv=none; b=Xn0rUlJl3YE0SRXUOfCdEBMCLH4Z1zHijzdxdHxI2l8IrXzhgujH7hi1IcFgZGaIgPRbz3UihMKBaWkuaROLuOMhbggmQ7LpJKdZ6+gLGDms3qAgmUNvwk6+Aw/Us4VRlfYNrMXjO2us34ajdREueWOW61WiV6y+fkpbgA5V5Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760691400; c=relaxed/simple;
	bh=LESmruKeD2k8Y/UOmXpKXEPzU2PTrrL35FLqSlgIXnY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DW28edjAOrkGcCAyABPct8ublYPvoel2xwdnQ7jFyEeqhhB8xZJ7q+JFrsahDwMg+fjui4lZdADnFP4rlO/JqWEcS3GhEEyDTAl6gLafzKiWJ1s/8QZlUdJCCV0yGOXZ5i/2WYOtfhzE9nnJKpVFX36l//wtmc7SbgYEG1QBPsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vvs8WIIa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59H7o6Rp009689
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Jds3ynaWk7m
	aZGNZjrrK77wITeMIM7azLHelkM5HaYE=; b=Vvs8WIIaA+MClM56+aqCOe6SuSr
	1AbISnzMQpH3rhNAPS8FpKvEITIBIiq2LxEhryRNoCVUcWDlaqqhUSiZPBIbDIDZ
	Pr/bUyWeBK+56UtEViuutFvXskd/ajkFGF8o+l1jJrNge9CistZlldZr3HCYxtsv
	Go6iiXuIU2BngdgpnwRHXVLHK0r1qZIjopbgF+9/4H/kHzZr+SIt44h02hvI50Dh
	BkXDN/YJOstnq78wPy14n3FPd2Mv3vSAFDH8BmYggU5cxJ86Uz98wnFqFvMsG3mj
	wh03OIgvSnKAQTFV0L8t+O3+fnS4Ya/hrTgk4hr/gyt8GsSGVr2grBDybwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qg0cbeex-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 08:56:37 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-88f8f54a828so547622685a.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Oct 2025 01:56:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760691396; x=1761296196;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Jds3ynaWk7maZGNZjrrK77wITeMIM7azLHelkM5HaYE=;
        b=u9eBVn98zALDoFnN29tuV23ONcS4q487tPiO+TW4PYoe/1wllfM4+vCS0HK3sFFyr6
         kRcPdqw9p0nOQ5oIvQ6VZy1cmUIhDxJu6D59R5sPUlVUVaRVZzxlpQlB/wNWlkGUqmKN
         JZgifme/7TADW3Ps1no3yzp0hu9FJKdLXQhx3TBJJg+kHeaMKsEVkXE+HpgCet93Jx+n
         +qBapEiwxl6DcPSjG4/5230itYY8g1pVeVt8cCkQ/Ix2a9Xa9vWhVKo59+DZ++ELMYJi
         K71WHCIATM2WmQy/9J7sVCi5fX/tReRmflZvr4KC9rgHuW+5Y9RSk9PVFFDhYkhaMeAe
         iRhA==
X-Forwarded-Encrypted: i=1; AJvYcCUqlyR0SjCRNc3TKzNpQDTwbXKoBCrjesZXLmNVo34vy7HWspUhj0AvJ0XcDPOSz1xWrVHsS+l06eWiABnV@vger.kernel.org
X-Gm-Message-State: AOJu0YwQrMoOI4DcITXpOb5kQ8jBMS+Cj6BR25T4auevUfwMGHgNRuYn
	prGc/IeAYRiY4ImgJjR3Z9MI0iQmSNRR4nm0q//WDiJMNmUeER8o2v5BpXNgdBhtV9HWsEXmTSF
	gZpyDN2FSQB5xU6geNXhL45QSLbUxkACyKjEdgZdA8h2S9Jy9WvUCPAzORk/DxS3SURxS
X-Gm-Gg: ASbGnctQ9MzzuiVgsC++9uzZhamfrJ2Ov+3Gt+Whb134loyBqHBjwRxF7g1dLNdiSQy
	6FY1eYay13LnWhHn58HUucFQdXOJ030WzLM3Qgvd+feABkXdRd5BTevb4BfaivkckIU+7ZBzcF5
	z0Rr1QrilSGr0nFU2yo+vfQYDcC4RjdMH67ZC8/A5Oeolf9sIqaHpp8h/Z3d/r9Hh3aOugIRz9v
	FFXb5peK7KHHGp1PqymY2HOLmNqt+k4+XFg0E+BkFjjnglCOB4U0yQZi1+D969sM046bDTtNaOa
	bwML2E6eywtyYvh9rve3OSHdU4fxk8Q3a1s50ejh9njH0wDQU/+r4VvbLX8zYpwS0Z+pFQBedWu
	0IFhDmXHbr4I3
X-Received: by 2002:ac8:5749:0:b0:4dd:9798:38d9 with SMTP id d75a77b69052e-4e89d397004mr38905851cf.67.1760691395740;
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJT3vbnCxYuVgQ4mEr8+d9Mj708NZgxZGZG8reI6nw6g7Yp3T00H1A9aIFVKRbqUf7+MnIqw==
X-Received: by 2002:ac8:5749:0:b0:4dd:9798:38d9 with SMTP id d75a77b69052e-4e89d397004mr38905791cf.67.1760691395327;
        Fri, 17 Oct 2025 01:56:35 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4711444d919sm70764985e9.14.2025.10.17.01.56.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Oct 2025 01:56:34 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 10/12] ASoC: qcom: q6apm-dai: Use guard() for spin locks
Date: Fri, 17 Oct 2025 09:53:05 +0100
Message-ID: <20251017085307.4325-11-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-GUID: pRv65SdoIBiov5bf5kTctsdKLJtc5Jt3
X-Proofpoint-ORIG-GUID: pRv65SdoIBiov5bf5kTctsdKLJtc5Jt3
X-Authority-Analysis: v=2.4 cv=eaIwvrEH c=1 sm=1 tr=0 ts=68f204c5 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ctYtm_-0jrJ_p8CCq-gA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMiBTYWx0ZWRfX5bX5u1+7zge/
 xi9bYgHNdrOk+HzVrh9R2S4htD2KMG6+V/p7cklH7pMXgQqW0ik/JLZvlrzJAtybtqKztWo4CPC
 LxcuB4bSVhl3cjEVWtfkUCaQfN5WXm2EkQTxrA7aGcmrMuDzsDEolOhuqUrJzB1/ZuhIChtDnCd
 00ScTfl2vY3e/BLTaR1Mk15kUBNZB4cyLdW0xu2Yf4XJqktcUohW0Tcq2yyD5OwIhgien2ZZOxf
 IufRf97F8wcjwz9pQuPqQsKkAO+1xM36SgnTXNHRuGzuIZSEqKLzax1k7rXyNVdZJGnQmLRCb95
 3eZgj6lIym+77dpqj1y0Kw8N0GXxJ9RCExhVOxtPstsi3QrPi1kQZ99cMrBK+Wt6m4Zs3ZiZcYF
 ywQfgfQejA4DIB3EeVXOzZmkScQDAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-17_03,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 spamscore=0 impostorscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510110022

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 4ecaff45c518..865fb0b3bc06 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -149,33 +149,28 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
 {
 	struct q6apm_dai_rtd *prtd = priv;
 	struct snd_compr_stream *substream = prtd->cstream;
-	unsigned long flags;
 	uint32_t wflags = 0;
 	uint64_t avail;
 	uint32_t bytes_written, bytes_to_write;
 	bool is_last_buffer = false;
 
+	guard(spinlock_irqsave)(&prtd->lock);
 	switch (opcode) {
 	case APM_CLIENT_EVENT_CMD_EOS_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		if (prtd->notify_on_drain) {
 			snd_compr_drain_notify(prtd->cstream);
 			prtd->notify_on_drain = false;
 		} else {
 			prtd->state = Q6APM_STREAM_STOPPED;
 		}
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 	case APM_CLIENT_EVENT_DATA_WRITE_DONE:
-		spin_lock_irqsave(&prtd->lock, flags);
 		bytes_written = token >> APM_WRITE_TOKEN_LEN_SHIFT;
 		prtd->copied_total += bytes_written;
 		snd_compr_fragment_elapsed(substream);
 
-		if (prtd->state != Q6APM_STREAM_RUNNING) {
-			spin_unlock_irqrestore(&prtd->lock, flags);
+		if (prtd->state != Q6APM_STREAM_RUNNING)
 			break;
-		}
 
 		avail = prtd->bytes_received - prtd->bytes_sent;
 
@@ -200,7 +195,6 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
 				audioreach_shared_memory_send_eos(prtd->graph);
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 	default:
 		break;
@@ -581,14 +575,12 @@ static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 	uint64_t temp_copied_total;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	tstamp->copied_total = prtd->copied_total;
 	temp_copied_total = tstamp->copied_total;
 	tstamp->byte_offset = do_div(temp_copied_total, prtd->pcm_size);
-	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return 0;
 }
@@ -631,11 +623,9 @@ static int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_c
 {
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
-	unsigned long flags;
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	prtd->bytes_received += count;
-	spin_unlock_irqrestore(&prtd->lock, flags);
 
 	return count;
 }
@@ -760,7 +750,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	void *dstn;
-	unsigned long flags;
 	size_t copy;
 	u32 wflags = 0;
 	u32 app_pointer;
@@ -795,7 +784,7 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
 	if (prtd->next_track) {
@@ -818,8 +807,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0


