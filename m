Return-Path: <linux-arm-msm+bounces-77403-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id F04F6BDEB7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:19:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4397E19C49FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:19:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97F42245032;
	Wed, 15 Oct 2025 13:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="eaMNKWYk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6C31F1313
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534299; cv=none; b=uUKO97vr8/Jm9VJajE++ZEg9L0WdsclaZ8EfxlFjFamMZoqeffYqeSN4kR7hShX155G2DFTO46yXnnrXkHC1MqPMCKudBbG/9H+CmIUWJHN8/5WfhipRrY3AaPO7HGRG+nCs9cwmXY6dmWtVjMLq5MVqdqe8T7/uyI024YfXUhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534299; c=relaxed/simple;
	bh=PF8KzK7QUo1Pnp8R3uu5jVDc2qztm42DD2eaGLKLB8E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hLSvNjh7wpSo5aHXmM0uUWpzB2EFyXg3aUVmX3VLdUsgQJ7ljOkljw7UjCDR6ssKi6yUyL620Z8EKIhoSPpwbG9cpf2y6PuQ2yKmrp9HvDhsaSFecHhIgqwjxCj/sVfdVoF9JRDuvLdmeuvhoSLvDRfu+BT/BL2xNERRY6e+K5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=eaMNKWYk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FAPCTh003609
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=siHiEg0ChON
	De0CD1JcwzaBFof10K1E7cJD3IESL4/Q=; b=eaMNKWYkF6I6aWt8cgRya5gIy2K
	dFimXc2SE5MVoyTR2l8BY38gxHp9zfJc+UiWumO4VAWx4CTfWP4ZFuj1vfzJSMro
	HddfFiZTaXjeMtF45/Wm9krg1/V7IN3soUhUxHA2WF/WXz0pjoZQ8dlTeQ1nzK+s
	fCSgxTucz32XqVrm+gNpNHgEBHQS/fZMSfwlxoqhEXZdzYjanMWhiu1RxdMC2MNr
	EoRBvatUFFxVRx+Q6/YdvE+prw5ps7N3Ngxb73TM3UWIJQ0W3b9P7CiLs8rvTP+r
	kWGAK0xxJBt2DZGJuTIA/dX/6/Gv9xkQ3Jose3l8vaJgy2KQVrQlbi23iJA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49sua8k3v8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:16 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-88ef355f7a3so65448085a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534295; x=1761139095;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=siHiEg0ChONDe0CD1JcwzaBFof10K1E7cJD3IESL4/Q=;
        b=BtV2dyhpyrNeXLnePgSXvvwRoDqFSfJN0tfbKMYuYlzIBGA23Jf53woohGz+g5oulO
         vwTOnOZuZTg+x1ohshD3Q+7ZxJ5qYOyeffkiwMfY5vmEclAuokpcIaaDR8PbEgvGOi9m
         7jigDjEoXFnp7YdLJCpqIBUhoJJVUv90Q7tqJqMrye/kYKJhINjzX8RbYGx6NVX6N/mw
         Yx9DI9qc7BZ07VY9+WeaAsFWtYv4fzZ0a4ZoSE4aswRKqCT2wafp7SN91hpT5WNiszTq
         B0f+igwhUVtCA7ZQ67YFr3nRh9MOMc8+4ExdpBSQ7TD3oPM+tkDQwEYjTqPowd4sT5mQ
         P4og==
X-Forwarded-Encrypted: i=1; AJvYcCXvhjfq2EPWhKlmBq4f+aeW6dz2zE16WXIFWYXYNTtTMoWiiiMkaw15w4vQz6UEQYTHe1Ygl+a9sqPmJXUA@vger.kernel.org
X-Gm-Message-State: AOJu0YwlyOQ3Nb9Lf1x/l4mc9lcYz+rF3vAl9cZTPaft0YCgDC6hhRIJ
	0D7diw1cTXDoVhDF2xjEUxTPz1RO9W2c9Lt5pSs8spoE4/majvniDybUWE3zg/yv6ypH7qeqhe3
	MPpW61Pexenw9v6hBszbhCFzoSOvigJwa8jTdaIyNAmp7Xo105THrwDfHkioKBMo1F9fF
X-Gm-Gg: ASbGnctPz5CTx9eesPy+en413uMGY0R8AyIIrzlYcFktoO2SWdQVNqqbVX5q2og2ohq
	tLb/giaV6w8VkR3EcR0F++Y1jzdgnpT0FTQqxLGY0GuWK/UYLp4jLPS9r8sa4f97Xcn9zNfSprn
	ZxUtQuOUmsT4whwBaVPWutNIMx6dydwKvRlg6snnKx/OX2bimiUsL3hke5Nxa7sknpYDSYxj3Jj
	YIRuTK1uAAdzdflLXq7SCft+gLgoMAnTkwJfGY+wXhcJamKNiTu8SjcRvbYibfDRhSkd9q9ZwFB
	NK3BkV5U8CyAsUHDNqq6hpgBp3wmwtzYio6FG6h7JTDi2CC2rz38Sw==
X-Received: by 2002:a05:622a:30f:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e7222e7357mr143717901cf.8.1760534295293;
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0npG9+1zbTGtTaMbasPsz8fCXlWoscmPo0jpNvyvC4yD+pVmLW3dGwrcnf6T/u6dz3SeqvA==
X-Received: by 2002:a05:622a:30f:b0:4e7:222e:6725 with SMTP id d75a77b69052e-4e7222e7357mr143717161cf.8.1760534294610;
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:14 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 8/9] ASoC: qcom: q6asm-dai: use q6asm_get_hw_pointer
Date: Wed, 15 Oct 2025 14:17:38 +0100
Message-ID: <20251015131740.340258-9-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
References: <20251015131740.340258-1-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 77EaofvQdt59oLL-cycRoTkH3k0j8X1C
X-Authority-Analysis: v=2.4 cv=e5MLiKp/ c=1 sm=1 tr=0 ts=68ef9f18 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=ngjuI6RAwNlUvKc_ZX4A:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE0MDEzNCBTYWx0ZWRfX6GCsLUVngucP
 8yZBipHHjby2EEc6Ir8xYbum9W+GFps2DrF4bnNXJiA3CzzQ08C4jg56j2Z3UgVvA3jJAFm9UkN
 BzorzH4q0ebEGavUWJXvRu4dzGgm0SPuXfqBwCbivRa5E1fQTd1+7CLAshqrAcrGRRBV/A89Ith
 K+W+DMTuKmW0yxr/btWpgFFoCYZD2GYWUHrve3kY1744OxajTmK9hvKQKITS6Z2rCfgJM5UbkZQ
 pkY/xDLpOtFtgvcYov16OapZzT61H3rO4atQ6utki6IrCdKF2HmNJBubia/Nqu7lMn3qZ6Uv6Ke
 mXsIOCo2534f/nbuUtJ7sDHFOahmfEp+grr+ay9VXDsA2L1+w5Qar/3tvTVyvLt2msI+hVHDibP
 WirlLC0h06SyA2I5MLCqB0E0MagBrQ==
X-Proofpoint-ORIG-GUID: 77EaofvQdt59oLL-cycRoTkH3k0j8X1C
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510140134

make use of q6asm_get_hw_pointer to get the current hardware read/write
pointer and remove any additional code that does calculate this manually.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


