Return-Path: <linux-arm-msm+bounces-78528-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F353C0073E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:26:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id D82CA356223
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:26:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99E5C309F1D;
	Thu, 23 Oct 2025 10:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b4Ujkerf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86CB30215B
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215159; cv=none; b=o4qCfgBJe1C6/1dAVonIfydSrICn40Cx4elfIFWua2AyIy8uRhfiGVvyjrnj4aVRj4+eUJFtWYzrAUno4Mefz757e76e+Nh59wLEBHQoIg75RBPiryfir6AXZwv21oGZ9H4CaRFB45IOqvtG0xXOsNwzUUgEZlzKw+d/iltJdiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215159; c=relaxed/simple;
	bh=fKU+7psoGKhGov9+abzdK9VeiEyjPMI2pGqzhT736sc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qx7ILr1YZV+3y9zRV9wAvB2At5l/UrdhpB2RDdUfnUkTcjZ0uqMWSwDsz3j7F0NewRbKWIH7vghwchpPApnU0w1IQX3gyXKzNxwV7CwqlCkFco9wlkC2tfJXFRAq00URWV+ofbyBKo15S622x2kuQRggi9OhNnrbnaS/1hwpxvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b4Ujkerf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6ZH0t028831
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HoHmVwgfwgY
	ctL/x1k53Df3AjUPsgAlOxk1+AKZybp0=; b=b4Ujkerf3On4nYtoUk7dWUASpse
	yPsTwgbNGnrJnQ02X9yZicsJahmXpEmnZ92+btcP+7Q1xU0MnviixhFsttF1M9wU
	TS8O2UMWtZLOPdD0qXAfTOL8URC+oijTNvwUU132PDIXHH7VRxuauYNJF2/ezJ2N
	FBoSta3SRwhqaM8PuDT2nM3ND1QNnys/Q9J416yu5TITF7bONhsl6P1RFjAFtkqr
	CMwLOMWf5kLdhnG2IByI77GmffT3aY4v1Z9rdfRfp5bjpKWDLc0AR7M1SIvz0p5n
	Q1kFRoA1B6V3We8OMuNAP4PL6SUtxV2BOVm9rSd5tomTmMFv34usgQbciGQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wdp0v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:25:57 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4e899262975so20121171cf.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:25:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215156; x=1761819956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HoHmVwgfwgYctL/x1k53Df3AjUPsgAlOxk1+AKZybp0=;
        b=lHHiUVhV+pWSqGhofFj92gmDgCl95Jx1TTVsVPaMTM1s/F06YkCAlcVsdI40ir2VCZ
         n89X0M1i8qosTIPxjN9b1rO7u3Z8fwqEwUHs2Sh0fx2jlkKtrKzwyvNLjly0+xC7AtNV
         P5V7QY0OBxBwYOrCsyamCn7SsNnrM9Se76j54yy7z2FiRC14p6iS3A6PRxl4gq30vyIL
         LtDZ7Hed7XqFpfJ5tSEOZYkvucS1FZBmpYFe+4apZXq28VYE7yKrW209LFtEd7xnpAp1
         R0VozOqqCtNp8LN0YzzcvDnRoCXjUQ7uWMPOdWBpHgWNk5whOCxE7jJu60lys7L8U6fq
         Eubw==
X-Forwarded-Encrypted: i=1; AJvYcCXC/mKJ78sSvIC3BSzjGKuk2k/Am3hyL60f2EVjQt4+ZpBlU32f25WhSdZdjxzAj8eCKJqLEfmmanIcDrk5@vger.kernel.org
X-Gm-Message-State: AOJu0YxS2sH6blq78ratllVZ5ydRcYQByZUY8IaByyZWC0Yc8Ku3KhlB
	EYN8PIV39W3pVduvXiPp9A03zTtkwJxsl+1TJD8K4O0JJDX0ns3cG/mtloT+Fv2c8mOjUZ873hL
	eUO4v/M3bdf8AS9FByQL06r1Nm4kgQColhGI96ImrxUpTdfY8gJTE/T6BbrtOtmPV0H5d
X-Gm-Gg: ASbGnctjHHdMnytqTe1x5uxR9dRwi9uwiy+ydmwNtugggQpJoemQZJevfh9n7Wu7WTx
	ZKM8KO0Z1BgqyoeK3rfb5x+ejklErZ2A4oJVvV9GBDi9PVY1YSXbkQxEh8ItbtUQzuhnqVwAL6w
	pNWIvXw1LouoI1mRe7xteWfV/MLz7q/5nd98bYysGf7hjiRtEE62hxk7T58uJT3jDWEbmOrQBuj
	CuqZSa+Jbyg2+bxPT7BLRFLneXUVBqEAN1kaiXaQALNYw+gZ8JMdledtHag/1rWQzIhgftTfSfL
	DREVeK5jvcHJ3JiGqlOEaS5u0CqswfqiyXhZdrlgH31QIuYwfqH2qcuBln+UtydMIMRPrCvqbIa
	BznsaaXnQE6Zw
X-Received: by 2002:a05:622a:13d3:b0:4e8:a2aa:77c9 with SMTP id d75a77b69052e-4eb81020e0bmr20467331cf.1.1761215155852;
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF4pmDb7EjDueb6982IesIBCCpfc2JJhwDrIZYFugXpp3Mkd6MdhDM2CIiRAZN+L5enEZqEDw==
X-Received: by 2002:a05:622a:13d3:b0:4e8:a2aa:77c9 with SMTP id d75a77b69052e-4eb81020e0bmr20467131cf.1.1761215155423;
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:55 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 01/20] ASoC: qcom: q6apm-dai: set flags to reflect correct operation of appl_ptr
Date: Thu, 23 Oct 2025 11:24:25 +0100
Message-ID: <20251023102444.88158-2-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: RNoSHykOPwQxjeTDZ_Ylf3Zhj2KUPpnP
X-Proofpoint-GUID: RNoSHykOPwQxjeTDZ_Ylf3Zhj2KUPpnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfXxwo9uYsxTS+t
 4FdnnnXzzAJkwIwsCeTfkN8G17RiQ6Qutqmr8nJXyQ6E/jmLxiNr9LOnHAjZFhqP4oxYB9LmvkH
 DoMDfKEK/Hnswys4h1Qe9mP0WJqyVrLZJ1oMQgsQ1vrqqloMh+TS2ya75AQLWaR8QfvUUGliO4Q
 NZaGrC2rV3VdEbOEs4emT4uBsJr1ejCOtNyl+MuNUxv7MoNK8zPOdpXXskErO7j6mguzR7M5N4Q
 BQjmqbW6plIKFZH5XsmzCMQDoX3Giznq4sPQk6NxCEV+A+sBYKUbbMDZ7iuIw+85SlUSRF2H7Ai
 VzQsLY+QTuPK0fv1gdl/Ec04bTNXk5HPKWqDjsRgVu9wwuhfnM0uSyQKIsqtVb1jRhoGcBLVm2s
 eFnZQ+7pY3Hx3jLb2H69Vnvm58k4sw==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68fa02b5 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=-7q2M0jigxX2LbQM1jMA:9 a=dawVfQjAaf238kedN5IG:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090

Driver does not expect the appl_ptr to move backward and requires
explict sync. Make sure that the userspace does not do appl_ptr rewinds
by specifying the correct flags in pcm_info.

Without this patch, the result could be a forever loop as current logic assumes
that appl_ptr can only move forward.

Fixes: 3d4a4411aa8b ("ASoC: q6apm-dai: schedule all available frames to avoid dsp under-runs")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6apm-dai.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-dai.c b/sound/soc/qcom/qdsp6/q6apm-dai.c
index 4ecaff45c518..786ab3222515 100644
--- a/sound/soc/qcom/qdsp6/q6apm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6apm-dai.c
@@ -86,6 +86,7 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_capture = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_48000,
@@ -105,6 +106,7 @@ static const struct snd_pcm_hardware q6apm_dai_hardware_playback = {
 	.info =                 (SNDRV_PCM_INFO_MMAP | SNDRV_PCM_INFO_BLOCK_TRANSFER |
 				 SNDRV_PCM_INFO_MMAP_VALID | SNDRV_PCM_INFO_INTERLEAVED |
 				 SNDRV_PCM_INFO_PAUSE | SNDRV_PCM_INFO_RESUME |
+				 SNDRV_PCM_INFO_NO_REWINDS | SNDRV_PCM_INFO_SYNC_APPLPTR |
 				 SNDRV_PCM_INFO_BATCH),
 	.formats =              (SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE),
 	.rates =                SNDRV_PCM_RATE_8000_192000,
-- 
2.51.0


