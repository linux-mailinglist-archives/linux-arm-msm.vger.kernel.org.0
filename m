Return-Path: <linux-arm-msm+bounces-77404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F737BDEBA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 15:21:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 8C43E5056F7
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Oct 2025 13:19:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4410E24BBEC;
	Wed, 15 Oct 2025 13:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YzZAZ7p9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA891EFF80
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760534300; cv=none; b=ZCSNYvD/FypWZ5XgrBAO/wNs/ULFObmv/K8OdS30tcSdd9YM6aN78qgSONAt4ieEhLZT3aLTKOZvTPTglSBzlLPNc0xw/nqQlKMdh2m6mAGUDyl7U3t5GjH9UCvBpxtMylz6Z5upXFA6nY0Mm0cACxBhVEM8mKfYXMnxM6JGUX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760534300; c=relaxed/simple;
	bh=mHHpksYNvrqCcT9vbu6eHsvNp/9SL9pX3pbcMgnpkWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrSqlN1F4K/oF8dhNQz4eOBawLEv94rTO2TTM+DXh1TDB808ea6rScpPpU7ZzqbKHs0vjLF91vtx1ZkSPb8RmyZpbDkv7DbvsatMNAQEvzd/llOPZcfqoZH+MyeJbgyilvZ9CUGIJM3AY4POXidfuT3DXS3Wiv1jXmBCPILV7Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YzZAZ7p9; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FARts0026136
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZT+0rRtvs50
	XRBp1BW4ZCSU4gfhMJjkd8JcHG8nO/pw=; b=YzZAZ7p9QgHqm37k8KIqAqn99ws
	ySimm3XR00UldujnpgUieFIeadi8MbVcERYqYbiERmT1EXkjUn+deWrNFLyQKHND
	nG6ilvXE2r7v0JN/vtPunzzS30Cp1PI8QsbI5D66n0REfwR9RF31gQIArYbVlLl8
	+1oUiPPMZYv7AbJ/jNC8JZRHMuUhn1jS983oE6ImW7zIqFeUU0tBauD+NC4Mpj2p
	1HJrHuQICf94amjB3/7Mie/8m1YfQfJOTMO5euyNEjQ6dtNaA1c5x8+8jShSk1tf
	pSOAcgH6Vwm0CIx5+WEp8FxW/eiilXWWMz78oBV2lzLtwcA0xSag01yCwKA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qff0vg02-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 13:18:17 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-78f2b1bacfcso284880266d6.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Oct 2025 06:18:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760534296; x=1761139096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZT+0rRtvs50XRBp1BW4ZCSU4gfhMJjkd8JcHG8nO/pw=;
        b=i9mMfECJFIuvU+tg4hiaFvumrTt1HZM+9qFMusQ57h8T67+aTNNtrPQMNIHhAwPuYu
         j1hsizxn6k1kpuFyH1oXvkSEiUYEWsjH1AX/B1a5xbs/tY+RclPIjKCa8nyuTxMdrrmd
         8gMhbLOzgGbzpX15PyT94HGBOdLLCsHbwC/DP58DXpcGuDKt1cRdjghvhnxJLYqhCxX8
         3V/3DrvpAG1G/VuoI3vjwp7UjoH7QcehfSdbwVSWgKYmaa8IvIve1xCHDTZplw9VP9ZP
         nx0oaPuWJrecaTWkDcbIEbghLBGGp/EWcc04KNkcOxpAwOQrz4eketP0yY1Um+IfbyS+
         2hWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXp66drEpUmiS9OytzkXYL6P+efccdPggC227Gx+eCPAvKueKkCHbwB70y8KneBa3Ur/UjPBZ+h5r8pDQ5+@vger.kernel.org
X-Gm-Message-State: AOJu0YwwBa2kN2TKF3UNTO4C2qx/RVPZMX8thj2lsoG6e7LNAZiiu+Tn
	Kxc4FzLoSqPqbFXjIya8zkvaJrfLWTwL8hoATB6Kfx3wZGpjRhJxy5h1sp8XCJgUj48rW01QfxJ
	IzCkVHRjFsyPrW1Kjv14QdwWmjizC+8e+IsRCLPod5iCajtYafPRYw6eoJM0RmUfvWxiz
X-Gm-Gg: ASbGncsKCvPHcsdHgtw5VXbEqJq57ChouTqjakQ2FFebaaoS8J++3Ib46PuZgAdbo1O
	SqXffyjSpwx6X8yBFS778vBUjKA9AUoaToMW0RujLzdXXTH1+deBGOmsRsnpVBBANgzNQKVEyF1
	iSVaxnydVZoRopagh/BtSTFMptxD3TiiJ01TfDKIh0+5NHpbeVauJRuOE1I73SIDvru/IVXQGhp
	OY1A4mmJd7fF3OdXRn76aMDjIXw2Q2TNUGkox7p/0zH69ZbZLCuLip+4n+YbOCArHz9aqPP4+qN
	OIbp3Abv4klWtPpI4w6JDKI6e6y5haTU6H/fEJ2mcCO1upkkFKYSPw==
X-Received: by 2002:a05:622a:1a9e:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4e71f73b42emr156480071cf.1.1760534296122;
        Wed, 15 Oct 2025 06:18:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEtim+HkRY58yGLvCgiO1qtGySVPyoWgNetwZg54hH/ZzI/xMzFzmKFFqAAZCU5tJGw/TQxUA==
X-Received: by 2002:a05:622a:1a9e:b0:4e7:1f73:b40a with SMTP id d75a77b69052e-4e71f73b42emr156479521cf.1.1760534295614;
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46fc155143fsm262081245e9.11.2025.10.15.06.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 06:18:15 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org, alexey.klimov@linaro.org,
        linux-sound@vger.kernel.org, m.facchin@arduino.cc,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 9/9] ASoC: qcom: q6asm: set runtime correctly for each stream
Date: Wed, 15 Oct 2025 14:17:39 +0100
Message-ID: <20251015131740.340258-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAxOCBTYWx0ZWRfXym3bYZdBRtra
 BFBxVSBuN/bGd7IoHOIDaIwoCewLCzcoyr1tnbwKOk5prkxYqxrnmv9E34nbLSRSXTz89q1BKYp
 dqND72SybGSDZ+oZqULNzbUNMQyfuRf6eoeVK4d5+BkNGajsk+agQ9jPPdpAfVpdk2IFZJrthdU
 eBEZF+s/PBdMMD1RF8P+fneaLs+icAcGi+wQSIhYwBcWox0Y5MuvAfXcKEmbPM0di9FI6qc5CEf
 1uYUZBG7iF0WWBikTXJVxkgvuzoBeoPUzBBO/BR2sAUvIEUHlrZxfguoymt6mYdcfgGQnFWIp8h
 0C/A2xDriE7XcgPTYVhOeL411r7AkrmmvjaL5MlaQ==
X-Proofpoint-GUID: VMqpfBSxLOiafdE824XkvFDr-qeAnfwS
X-Authority-Analysis: v=2.4 cv=PriergM3 c=1 sm=1 tr=0 ts=68ef9f19 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KIUBPGGZ3vVIRF5Z0fMA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: VMqpfBSxLOiafdE824XkvFDr-qeAnfwS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 spamscore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110018

Both capture and playback can have different runtimes, so set them
accordingly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index c2a33d6a0827..97256313c01a 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -433,10 +433,13 @@ static int q6asm_dai_open(struct snd_soc_component *component,
 
 	runtime->private_data = prtd;
 
-	snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_playback);
-
-	runtime->dma_bytes = q6asm_dai_hardware_playback.buffer_bytes_max;
-
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_playback);
+		runtime->dma_bytes = q6asm_dai_hardware_playback.buffer_bytes_max;
+	} else {
+		snd_soc_set_runtime_hwparams(substream, &q6asm_dai_hardware_capture);
+		runtime->dma_bytes = q6asm_dai_hardware_capture.buffer_bytes_max;
+	}
 
 	if (pdata->sid < 0)
 		prtd->phys = substream->dma_buffer.addr;
-- 
2.51.0


