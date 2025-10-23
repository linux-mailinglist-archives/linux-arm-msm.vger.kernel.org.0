Return-Path: <linux-arm-msm+bounces-78545-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 25534C007A7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:29:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D40943A4068
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1665530B52A;
	Thu, 23 Oct 2025 10:26:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D7Y5dDo5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A236C30F532
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215181; cv=none; b=CkPHngatYRRh991o9LHEj75TvhzhixG5ERH7k49aRRrmtQW6ap+ITYPvgGr8Uw7rDJwSWBmZH1d9IiUZ1raWvEBjr8l6gTuETG1HDyrd3/cki6tcKUbA/EkR4ZRbL6vZf1TCUPEBYcTkTmy7xWjS07IOfkqfV79VBZ3SAccEZHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215181; c=relaxed/simple;
	bh=t04XyOJAlW4a/cW3iIAeR5OckKuonqZ/J6zYap6C1zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eerWthzUeYW5lefgaM5hl6YQHHTrZxEDhXHSYG+nTovSo2JajX4g57Ei1sPUhWdX906/ZeGjkDA4qKbQWSWb0++cLlS3WJ8oJq4fNjj9JNkg0lSM/2rdSxQ0ZwO6K4ofVeSSjuqwgiJqClMdG1UW4bOFxQQSxZLAyppQpQI5VDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D7Y5dDo5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N7CXcg011737
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=iDeZtnWh/qc
	Fvkr98+XBzVWqMHOVajWl1qfIqPp106w=; b=D7Y5dDo59fWFyB2WckwUeLAJIFI
	mxonuGuCSZS3RuXJNn+85mvVbCE6hyrHfvxcEK+ife1dQ9TpvaxJK3HTc70EVfgR
	bhq1pKBiorO0I6r5VDdzRwUY4ZMlo6fEBw9+T/v67mJICWAqQfpSeocv3Sz85so2
	7Cq7WZb1DtvuRgxuQi8OpPXywFYm0d1GTd9wKkaIYJNRelqlODtPPlrUABo7mxue
	u7TB1O3Td1TtkjqcDOj5tT8Se5nR2YNi9puIaZ35J4VWUckWnYZmAkERXxvnpEVg
	IvFU9m4nl0wQh0y2dGbFHhZlV5okZYjn0zSaMSEl0JDB21gid4kIUlfjdDw==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y524a762-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4e8bb76ee59so21327961cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215177; x=1761819977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iDeZtnWh/qcFvkr98+XBzVWqMHOVajWl1qfIqPp106w=;
        b=TJwfRPmODr1Uf4Nf2hbQqRo//TKx74fm5yG5KfiuU7AKHZAafMhDbs7nR2ekDejfBi
         JeNl+6UCbvm2NaJEBiesaeYAz9bkOTSkBSDJ6onQpbBpsbgVSFzzvotYIGmZRyAhRmFX
         BVcsDyOuN7Cid83eakl+Gne2SUETTJPsdVwlVrTvGl3vo1mWll58pOTiKXipCANhi/O3
         ricM+abUYVFJ+SBanYjPaVcxSYRhRKZMRZkV7Rh3DhK+jh2oRw1SffLpJIRmZPUTN/7G
         VfJir+o51Wj8LIHoWO3D0duZxgaeJ/pykAjFH2tey6dW6KBUydMn0/1WH/cQPmVVxxmX
         MBpA==
X-Forwarded-Encrypted: i=1; AJvYcCU7W1enTPw2qUDFbgBwaivgLE+S7EYTpXPsVYvpgMBwR7hRkSqQBJGbwhpqI1IMmJ8oaOJuhGIF6eleYvRq@vger.kernel.org
X-Gm-Message-State: AOJu0Yw70RPYxw67/2d6ogdUCJbwtDLZjZF0mJg2A7VONt8hYKfeMpp9
	7xeejlOcIvpLqMsyxbgaIaiGJuSc/3sYRuzeFaK4/QLTeZ/US650y76/bpUF0aKgBhoQi9dX9+s
	guxGAJftE6wmExVmenAaFbtj2Jqs0BMgezXUZSHcg1MjGK2pEqustWngYXpC3klAFbKcZ
X-Gm-Gg: ASbGncsYx3CWMACTDvmeh8E9qoZh5wiVL9tMUrKrkM1ngdbFANHjhjaBKqfQT2gEbGT
	ZwB9ah+YAfs/AU7NcewszQUEueKwherPMf/ZjV2J1BqEfYpPVpNQ8c0qcxKC0jP5c70WUUCYXqy
	cVnm2pAXc9AkOAlmWIsOHQykm2D7zOrA5hQkjJ4+lxquk/no84tD4xnfd1hcMOF3/TPG5wny6Uz
	nH1gUFxLiqpNT+2oOzv4dFaTRv8DcaIss+Z3SD74SISm9cl1lYuZK25ewz+T8htphsiy5rSnuBP
	bPfHENFS7h2CDTKPpQchXaZ0NpuuPE9KxegSUyi0sgaN5YHtMB/KSxSWgi1wQDSt3/ZFAybRbzg
	aIrdnzVvbYG03
X-Received: by 2002:a05:622a:1196:b0:4e8:a307:a428 with SMTP id d75a77b69052e-4eb8107e17amr21075821cf.28.1761215177561;
        Thu, 23 Oct 2025 03:26:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3rxCOTom7ofYplfN08by1bi87SvFeGoFIn0488gg2BDmU7tq8Qp6ELKT3VSIa5YBBU73qWQ==
X-Received: by 2002:a05:622a:1196:b0:4e8:a307:a428 with SMTP id d75a77b69052e-4eb8107e17amr21075581cf.28.1761215177083;
        Thu, 23 Oct 2025 03:26:17 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:16 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 18/20] ASoC: qcom: q6apm-dai: Use guard() for spin locks
Date: Thu, 23 Oct 2025 11:24:42 +0100
Message-ID: <20251023102444.88158-19-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE1NSBTYWx0ZWRfX0B1KppZh6k0Y
 wE0KF1cqU9OXckrk2R1qHaXBy7lQt2bbveHaGT84Hsv4rni3OXhZfO+4mR7ObTuGPnzLcz2BUkw
 ypR+5yAhQVgQLW1Wvd5rBW2RSGswn2R7zFZjsloj7IqsZPmdDc/AN8YCJFFVG6RklHgxwuIEAF1
 m/7KdnG5eSC7jNepQGeFYEwBRhKCW8YUjo3ijienyU5sDLbsgqdDlQG4R17re3LcHkd6HvMTtW0
 xELJ9omRjBDfTIF5+MRqRhLhL5nAoS6mUbdT3ATeSqYKdYvOwzvRLZ7enJojRylBP4sNS/L329H
 65NSsUQ2D39NmgI5cbs5PPlA8rYWTc1RTzBgl9gAw0S5G1ahDjKH9EN8WlfQFsHwzcf5HAXK9YX
 8GF1rC8S6ulqOfeumkZ345OrVP9rfg==
X-Authority-Analysis: v=2.4 cv=Uotu9uwB c=1 sm=1 tr=0 ts=68fa02ca cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=_oaKiOAelN1AsWPOrNEA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: uhv5Y9yIMX3HAejXr-zBfEYGWeJDqLsh
X-Proofpoint-ORIG-GUID: uhv5Y9yIMX3HAejXr-zBfEYGWeJDqLsh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220155

Clean up the code using guard() for spin locks.
No functional changes, just cleanup.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 23 +++++------------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 786ab3222515..aaeeadded7aa 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -151,33 +151,28 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
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
 
@@ -202,7 +197,6 @@ static void event_handler_compr(uint32_t opcode, uint32_t token,
 				audioreach_shared_memory_send_eos(prtd->graph);
 		}
 
-		spin_unlock_irqrestore(&prtd->lock, flags);
 		break;
 	default:
 		break;
@@ -583,14 +577,12 @@ static int q6apm_dai_compr_pointer(struct snd_soc_component *component,
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
@@ -633,11 +625,9 @@ static int q6apm_dai_compr_ack(struct snd_soc_component *component, struct snd_c
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
@@ -762,7 +752,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 	struct snd_compr_runtime *runtime = stream->runtime;
 	struct q6apm_dai_rtd *prtd = runtime->private_data;
 	void *dstn;
-	unsigned long flags;
 	size_t copy;
 	u32 wflags = 0;
 	u32 app_pointer;
@@ -797,7 +786,7 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 			return -EFAULT;
 	}
 
-	spin_lock_irqsave(&prtd->lock, flags);
+	guard(spinlock_irqsave)(&prtd->lock);
 	bytes_in_flight = prtd->bytes_received - prtd->copied_total;
 
 	if (prtd->next_track) {
@@ -820,8 +809,6 @@ static int q6apm_compr_copy(struct snd_soc_component *component,
 		prtd->bytes_sent += bytes_to_write;
 	}
 
-	spin_unlock_irqrestore(&prtd->lock, flags);
-
 	return count;
 }
 
-- 
2.51.0


