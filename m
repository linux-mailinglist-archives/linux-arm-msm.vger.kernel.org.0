Return-Path: <linux-arm-msm+bounces-78535-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EC9BC0076B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:27:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 3B2E2356F55
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DF6430CDBA;
	Thu, 23 Oct 2025 10:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lk7MBXq7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7654B30C63E
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215170; cv=none; b=nOSbHxNDxyPJ++BiGph+ZAScOsPld4zDmC4re+XZZQzp+WsKgSvYo5NggfmPW8kmMUlTL4rL+cVBGqsB3F3V/U+IvmyGBM5HWKyNzusiXJMN0KLickoBSbOd/v6QklFNWzdPIatJORWo1pDbidbpNammwWKtD3qC7NwcPdY2KL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215170; c=relaxed/simple;
	bh=tFt+bVXUcHDK5C0sY2xTPU6k+atp8RIvt14CRRC4kxw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Zka1t7xP97EDW0l138KNHDXzkhJ/bVl+QoXT1MnbDzf51K92f5LM8Ws6roKsJu84MU4/E/6hfwvgnIx7P1mv6K1R1wwaV6yEKIY1dFg15ymK+BTmXnOsxiEv3G6c463kXg6VAYlF4TTq80kysOXrI6HjISu5CazLqAA1pdUMjeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lk7MBXq7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N8OExj019075
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=icrZGM2TvKV
	a7LlZmhEJzlmHF8JdB/JFgQoOJEUzghM=; b=lk7MBXq73GZvUNxRKLjjurfPmGn
	yM0TOiSaEzGJmhX/N9ajr70dmXLhmWCNhe+1O7VQWLtx0l9gwAf8YyWUX+ONbMLK
	veudsgdCUl9OVzNoKc0SjejlZDxBvF9QC/NdsqCC1JGA5HCNtttSbRJArJNmYpLD
	x2SX2MA64K5TIjC94Xf1t6ai5LIfPZZPLXyzvyeFW/I5fEIT8v++Knr6WDEoEsOB
	aDASu6+OCdvfc0sayrIe8mPI+cl5RQqhOLkogIBzDJ3KIkhgOHr/OweHK6kr6ifp
	Z/berLnbEipWxGj9PwC/HO1VOEdQV5+4WRiSYS9hbjKHPOfsvgTJaoiH3yQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y67qhyx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:07 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e892f776d0so33567711cf.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215166; x=1761819966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icrZGM2TvKVa7LlZmhEJzlmHF8JdB/JFgQoOJEUzghM=;
        b=icAtNoxU2HABx7SUBZnsofrw6vSHE50osUghyKre9tdQ44NavxSQ8RTcoybSt2AB5z
         dvhqoHJHEVFMnUIXtCcCAyioyynaTEEgC3urUEZs6K06r+lQwY8mxm+UyuqNEe9EjAUc
         1VNsPXeiqm0uLH1XfnZ++5fgyySCiqklDA4RPdeavBkmAlBE4Pgz18EBhaaW76CgWKIV
         YGAeF06E6vrcNt1P2ZmgV8oCLKcq3iAfin6v4GsdFNQRUGUEyA1WTjA5J7UBESOJq9u9
         asFWDW/wfIEOAvhbYsuFiAru3NynPMOtHqbtJPqNsn4eWII62iinHKXN4bCFcrgLpGbF
         BF4Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtN21A+9xG76VYbtgkCYJOwJgNrN+6mKl1bfOy2yM9eoV3kwQRpBSZIC+v97q93/E53p/bzRipOVEQ2Qaq@vger.kernel.org
X-Gm-Message-State: AOJu0YwvvLHbth7O6nhItDRQ3sF/9teEFBuDrzdjafVyjGII5yZtrHJd
	ozGklJk5EgHCV0Z2TBKVjA/GeIDVzSzrSxcJic/abg88fe2YvQgLVT73KwUPnVJGUBqwNlw2gq7
	DOIbR31j5y9xOKgzIRRwGJDD3aDPBCf4ANcNLp6RDQC0Z6RHScYfsEwi21zinWpmwoY1U
X-Gm-Gg: ASbGncsg/Pc/g2MUH08ZJ0L2bkB7fCxdndJqVu9efmaKMkAZEZ1T8C7rNA/uVCBwq2b
	KLJ5lZ1spDytvmU+kcMVHi9IJm98aiilji5MmMhFQzWuA3Ov0+6tf8UBbiI9uNox58s3k3YLT4F
	qZfEnUR6vSwk27qLrC+tAXu6A5+68K4ZRER/dHuSkiD+vQqWoekkMsA8lEfKphVD+krSuagu2QX
	SZFdU7HKA3cZd3wV+jCMgRsFMkBZhchW1HP9t/xKrX5rwhEkxwdOsm1OtLA/KcaXg6+rkOaUk+L
	Z+u2/BvxfSFqg+PVhjbJBqDZ79K73zJ3dTW2zfShQCAtke1bZbxJkjGu5Y+bb3/b1Hc9ZyMMjcc
	I4zHGzdipMQW3
X-Received: by 2002:ac8:584d:0:b0:4e8:a7d6:bbfd with SMTP id d75a77b69052e-4e8a7d6c13cmr270609031cf.81.1761215166266;
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGE1nUb2mvyUJPcGAqiOlIO452HBSW46UgTgNvJ8RYJBBPoflO3K2RftR1udb7Nc7r+XaEXrw==
X-Received: by 2002:ac8:584d:0:b0:4e8:a7d6:bbfd with SMTP id d75a77b69052e-4e8a7d6c13cmr270608781cf.81.1761215165718;
        Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:05 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 08/20] ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
Date: Thu, 23 Oct 2025 11:24:32 +0100
Message-ID: <20251023102444.88158-9-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2OCBTYWx0ZWRfXzzKcW0oi/FoN
 zln5AcoeJvGuSNZXI1mMBvfxn8pAYd0SSgIFXOw/SP2MaXRBoIBYYQI0+ojWeonsthbVhYKPRr3
 c/8jdP6eee2Gt7RKQhxdhEuHA9OL0bEAwkhYk7MY/s3xlfcq/xOmrIyIPBfkckP9SOEOxPRCcDm
 xC7/WxA5r9kEpY6OnQoATc9N/Vp1GZSUkSUlnDoAzuYoCFn1Ci1KQW9X251HibtpIdpaR7MiV9J
 LyfOEp49qHYqwTXKL2lZZuPRDEiRQd2IaKCOiCiANj8TM6IIb8BPznhmYEwDCjnz+tnwTt1iJPZ
 lsTMeIhdjDcu+9pc5vHIeLsl+6HoZBTOXWxqfZLslG7GKQFLnSINZm2HgNmf1/GWuIFSvCFdUEo
 ndDCQn7K+ez8K5C9aNqBF9pVALPL6g==
X-Authority-Analysis: v=2.4 cv=LMRrgZW9 c=1 sm=1 tr=0 ts=68fa02bf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=ngjuI6RAwNlUvKc_ZX4A:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ay0pg2BetKZR2hwKvn9isuve24ZlvS_h
X-Proofpoint-ORIG-GUID: ay0pg2BetKZR2hwKvn9isuve24ZlvS_h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220168

make use of q6asm_get_hw_pointer to get the current hardware read/write
pointer and remove any additional code that does calculate this manually.
As this is redundant and prone to errors.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index db2ea8973ac9..c2a33d6a0827 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -58,7 +58,6 @@ struct q6asm_dai_rtd {
 	phys_addr_t phys;
 	unsigned int pcm_size;
 	unsigned int pcm_count;
-	unsigned int pcm_irq_pos;       /* IRQ position */
 	unsigned int periods;
 	uint64_t bytes_sent;
 	uint64_t bytes_received;
@@ -190,12 +189,10 @@ static void event_handler(uint32_t opcode, uint32_t token,
 		prtd->state = Q6ASM_STREAM_STOPPED;
 		break;
 	case ASM_CLIENT_EVENT_DATA_WRITE_DONE: {
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		break;
 		}
 	case ASM_CLIENT_EVENT_DATA_READ_DONE:
-		prtd->pcm_irq_pos += prtd->pcm_count;
 		snd_pcm_period_elapsed(substream);
 		if (prtd->state == Q6ASM_STREAM_RUNNING)
 			q6asm_read(prtd->audio_client, prtd->stream_id);
@@ -227,7 +224,6 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	}
 
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
-	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
 	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
@@ -479,11 +475,13 @@ static snd_pcm_uframes_t q6asm_dai_pointer(struct snd_soc_component *component,
 
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct q6asm_dai_rtd *prtd = runtime->private_data;
+	snd_pcm_uframes_t ptr;
 
-	if (prtd->pcm_irq_pos >= prtd->pcm_size)
-		prtd->pcm_irq_pos = 0;
+	ptr = q6asm_get_hw_pointer(prtd->audio_client, substream->stream) * runtime->period_size;
+	if (ptr)
+		return ptr - 1;
 
-	return bytes_to_frames(runtime, (prtd->pcm_irq_pos));
+	return 0;
 }
 
 static int q6asm_dai_hw_params(struct snd_soc_component *component,
-- 
2.51.0


