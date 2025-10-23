Return-Path: <linux-arm-msm+bounces-78536-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A52CC00774
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:27:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1D3F03ACBC6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:27:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3F4CB30C612;
	Thu, 23 Oct 2025 10:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iomc0Os7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 792AF30CDBF
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215172; cv=none; b=kkwP7ucMQ/1474v6kQ1GXABKvV5zpxP1h3jjz1QcXOKHJ0KKSYryT857jRHu7ARHqUPOD9WY74Er/Q2lA3GTFj4CV61dG1aEBOoXG6mZzaczF+aK0JEG83LdFD+Zunu8IIwapg8dHcPGpjpjcjugWU2uEVmkwtKCsHlXdYYGLg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215172; c=relaxed/simple;
	bh=Ho+pHLNPuBGTxEcdOpWIcJ1rAWSMMJmSaq1j+jlK1u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J3bRxhhhjpXmL2l/VufpRxCbIpySrpeeyWVMSsAkvJdTkWiqP0lIqK2MvcNTt3BGSDdjt6vJMKdHTX+G6YqANi14nyycGc/BuIYSW9KOIoHucXZ/D9W5rHP6F4jMG2KIpPNgZ/v6JttI9MeadeeRfktzCXUOG92FnsHffkX/5/U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iomc0Os7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6rJEC028777
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=yorz58q4zez
	HFzpZuHNhxtsCwlML/Ho348mBn54m9pA=; b=Iomc0Os75q3z84ngyHy02jYDMWY
	J+etAGqAlzSByhiyUGtskPKC7LSpUAgf8jUppx1xARPj9QzjP9Y64XgF4rqpZMc0
	8Ha8OyePQrTX9xKK2Ynq3tHXP3UiRgz1LuTEa2tEV89XpehX1Ap3TZsLcmoH+fbG
	KWOWQihmH8moMr811ecq3R8bPOaitCjTZvF1pUFSwxc88SpOAKNk+9CpYU5AFIpr
	JdrGrGukEv8IiYEmBTF2LMcqDMkS2lStcT2zP33AeumjSHzlAJl5MRsXws3zGXuK
	6biDobV3xlaxcdskvV01qpk6YnRAg/TnL6cR1q0cJxJNB+Nfyk3V+Mxj7RA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdp1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:08 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e89ed6e110so17803071cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215167; x=1761819967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yorz58q4zezHFzpZuHNhxtsCwlML/Ho348mBn54m9pA=;
        b=hhBf+93OlCuk8sWMrDAN8hvwaLvV3MY39YV5UOT58Gt+GTsCifj8YJes9LYo+EwfFZ
         SAcvJVV/EO75NiaM+VOHjVDc2Wq/1WJlhLy8cpoV8pLDd9pT74LHqqtL5KDEvCnDWs2/
         46kNW+5+PoWKPTLoG+eTc3KzEq/RzP7phOs+86Lwu/L0msSclsbyg1qvF1GzeGXkn/HD
         Q7XAS1xMJG+Cb6ZTudw5my+tIbMsnC07IK0vXaUUTjFI2ZD73vTCCKv/1CQwPeJq8dL6
         CdORttxknyQeXYFeITtP4RASlNHHISPhgMMNeJZdSTsuanSt5XvIfhcxNp5+cIZ3kZL8
         kl4w==
X-Forwarded-Encrypted: i=1; AJvYcCU9gP0bUqeu6yg5qaowToqf/H3utQdrVEKuQHSmTTIx4Iol25yjIEaSDnMaJxfUgGEG+ZI6NAAYCK2/clp8@vger.kernel.org
X-Gm-Message-State: AOJu0YxvYZ0V9midx9AJUb3dJ2uiDM5YM1uwbIRszc7fsDcQogmlGSzY
	qoH704Ir1IYEgERA7Ec2JZm6COXqya/viNMfHMGio8Cymr79pIfw1tlGcZwM7TQjNe+miD1C7+B
	8/ieGqJyCw/XGu5187N90R/YVfWVDDcybQxi0nvU4sa3c/yd+b/Hx/pfGVSxKMJx5pokC
X-Gm-Gg: ASbGnctrfCfmKK1aFl0adyn+qqsV988xtDonkc10CGDdx6JqfcT/ssmtkuCLoZMh6Db
	FQf/5iiDOo2hnan/YMJsTVVtS/oov5dPdksBLdg4PGZJ0MqcUS8kS16gmjtKaMHGkHDNCxjXqsm
	x/VvuhI55ryrgIrSMexSpa8D7maDnGL/KIABQnUAMkBZf1uUN/coFmmUwXIrjq+SvfNyMFVTxjf
	4AUZje1eScexLz34a9R2tdxe2LLUvYaHg8xvaG2iYy9EweNpdM8I+dO3gzD+/hBUzTeLVHlbsGx
	I7KpKkn82DBm4luvF3nd/KtzHPj8q2ZjHGECoVwf9+cuTENZz032vpzhgVaUqu8e6Be7Hi46TU5
	NAiQ/rrWuMCbs
X-Received: by 2002:ac8:7f0b:0:b0:4e8:9126:31d0 with SMTP id d75a77b69052e-4e89d29843emr321791761cf.20.1761215167245;
        Thu, 23 Oct 2025 03:26:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEv+JYE9Zd15gWAcYaYZ3ohREdQKKaD4jHY5oAkXcks5K8suMhMO92c4U7oNzROY7XUhKFiBw==
X-Received: by 2002:ac8:7f0b:0:b0:4e8:9126:31d0 with SMTP id d75a77b69052e-4e89d29843emr321791521cf.20.1761215166796;
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:26:06 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 09/20] ASoC: qcom: q6asm: set runtime correctly for each stream
Date: Thu, 23 Oct 2025 11:24:33 +0100
Message-ID: <20251023102444.88158-10-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: sGTz6gPQFlT0i1ch7l3J13BejZ6HOelu
X-Proofpoint-GUID: sGTz6gPQFlT0i1ch7l3J13BejZ6HOelu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX6nyCnP/UQ9G1
 //m2T/Z8hNRa9eVJ6fBuRTjPPBtzUdBn2EI6Oa0tag4AIt2K2Z2qJbwdftTPd71COsbggQ7fXX3
 D5VU1lqlxyF1MkR0ZFYCzeG+pyoH7OUL0wNTX8Z38dO6GgtS/K+eVTVZHlSseXOff3W5U52yY2z
 M4DFbLYkVlvfb3U56iwsXRTyUsOufhuSDOj14JvrprIiw7W2cHVe4x2YbxjMVTJtXAenSVlAtEk
 HDBThpvH5rmQw+DaDBxLk0/ox25HiEvVZf64falJeAbatIFLL9xQbJPs0f35M0bWeOqDYo34HtU
 NnKhtJDA5DhmVeaSRMXzVZScjIA6fw8u8zUp5u5nlEEqZnyKb+Qg0LmDQZGrWzJ4bfwbCFwmeqe
 4wvpaegfOhW/eTcexAVi+vsHoNJZuQ==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa02c0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=KIUBPGGZ3vVIRF5Z0fMA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Both capture and playback can have different runtimes, so set them
accordingly.

Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
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


