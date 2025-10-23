Return-Path: <linux-arm-msm+bounces-78531-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9CC7C00753
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 12:26:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DFD2B3A4011
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Oct 2025 10:26:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C5D130BF73;
	Thu, 23 Oct 2025 10:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ofp7nl/H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8338030BB85
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761215164; cv=none; b=RnBOYBAZUMvFqOtb3ZpRxyDEGFuBXfTiU07cTv9x5PaQVVLH4fxi9UNneungDgoYqGa5KHVLyLfAVBClvWlr7T1L1kqqjTovRahBCaQdqzGHTpugUsoCBA9lClNG7nMqGWNMTz7GNvk8pNToVaJZsnov+yiCPzNpVkY9lL0uVKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761215164; c=relaxed/simple;
	bh=n/QDHw1ITWRby7vrBcC4hapXZgt2KFZCOKf4tNRyaaA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBgXe5v+XlTje+FMpBTnjZo9I/mwsFe8zC5sqrEEkJOP7MvDAgBxpFh/XlPJlXcC1Bz+/uiuP/ugjx3/QxvituExlLnK1LB2Ad8VpesRqr0koXxS6QSYkjtHk0TqRgCFUZhR4InujsKFxUPXGFoHxMB9w6rQQlnMVQ5iTNQ2PrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ofp7nl/H; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N760LM005697
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jdyJtjan7SM
	H7wF51lvA8fxlxpPM+Q5el4ttALOfDg8=; b=ofp7nl/HBaXVLLvPU82S4U87eL6
	Gy9EvPxlr17buAKxBAYQcnWxylx1Kg++K7y8RtBRTKCk3MLstr16HdN1ARN6pVcd
	6RVXfXm0xPTCQGj/nALSmHn8Vhp9cjATvCuE6O0M0LXy+3TANJXVZWyvk18fC5yu
	DhnYPYKaIAXV4/YnAwL8b6PB0V4AKOQ8yxiNIrZbx1H4i4d1x4bL6mJYAmwgQa1A
	AfRV9HT8L7HoB1n3vE8Xr9iyfd+zhOYMtpboYGP+zNQ5WbHanUx0Qz8MYHuqnRCS
	+PnTudC3dlP+T7wAtvywk02KPHYcSn0Nvbasoqgqc+MFqSidEGwvkV9z9jA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j7y2k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 10:26:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4e8b15de40fso31049211cf.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 23 Oct 2025 03:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761215161; x=1761819961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jdyJtjan7SMH7wF51lvA8fxlxpPM+Q5el4ttALOfDg8=;
        b=FKfUO/ic+liuy8ROx72cXgz5CNJazoQ9lrh91qiKz1907vJMVYhm6br9D66naEQxwR
         u1lZilywEv6yxx/hDRrmjcdS/F+Ws7JCX0csZnITjY3y6qG22S1Esv4xsKJRwudPnawg
         0m7efDQlgkh38VDK3zDqqjhs47YEJDwnHBfseRkkQ6rY+vZAwGoJOEd6kgbl8jgNe/r+
         kjn0MLiUzX10RHHjOx9cblxBYdW7YoPFDR3Bsxykqqx68EFcYIUpCluwFYzFUZo1T6mI
         +SAiU8JICDMUDz6uXRRXYFaYkIJgNSEMtBd5em5eGLjHxw1pUkncggnIe/oQunt5QfLQ
         V8ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhbsdkIU3i4WUSBbIjzKtD+kpCu3uKQ9YBZ7xsc5bWoSnRuLa/JrY3t5aVJNt1vde5WTgCm95F8eteeTy8@vger.kernel.org
X-Gm-Message-State: AOJu0YzHz45GtWffF4Bb2n/cAPJX9iHg3MJHSCH9PDSv6gOWHGeFB1sv
	OAJp280zY8iqrUTPa5NHGpV1Kw95lMc10iFYrMMk4dnESgcjBg4SdzT5taTACfb17nJ6B9WMmVP
	cx6+r5+jMBGJDkOGvs3P5b/aXvDLmkPjg8yDrns19v6GoIfwxVIZxMTOLy/hYCAXaw5wt
X-Gm-Gg: ASbGncsZdYwife25LCeu4oOvCUdZc4712BaI3S7YvOZOsQ8ic6++YvKjy1G7J3EDdQ5
	nv+mj3nUjkYKhthNeK64ecfDzgPf5SdRWEn9pKhvryvZprMrqcp8Jfe+ejXJ/ZVmbH+6RUiKYNB
	HzwfZP/e6njgjEydBUPEatvPNJhE2hzOf8KYQidS2mRPLQptxKKrTKmxn+uyvrGH7lhPS9Lcu+S
	pbCfuA5gBS5MhCjNE90mZLo2DJ9vSs4cfkcxpW2q1FV++6RN79s0jKWzYtPPFlJzlsSAjp2V72P
	HCcOq0qE9AOirpA3yulfJdfRVvl5KB6PWG3F7sYV2kJcAr+LwolA9lrRIdfnsvU/i0zaO35ioUh
	5kGT/Bm5auzac
X-Received: by 2002:a05:622a:1827:b0:4e8:b8f7:299d with SMTP id d75a77b69052e-4e8b8f72eaamr207458421cf.68.1761215160611;
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFD7wLSA44400aNfpBlMqCLaACZqamHhHypYbkYfQM4rxcD3dsHflxyufF1YmFN6YdHQzG4bA==
X-Received: by 2002:a05:622a:1827:b0:4e8:b8f7:299d with SMTP id d75a77b69052e-4e8b8f72eaamr207458091cf.68.1761215160076;
        Thu, 23 Oct 2025 03:26:00 -0700 (PDT)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475c427f77bsm92220685e9.3.2025.10.23.03.25.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 03:25:59 -0700 (PDT)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: broonie@kernel.org
Cc: perex@perex.cz, tiwai@suse.com, srini@kernel.org,
        linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        Stable@vger.kernel.org, Alexey Klimov <alexey.klimov@linaro.org>
Subject: [PATCH v2 04/20] ASoC: qcom: q6asm-dai: perform correct state check before closing
Date: Thu, 23 Oct 2025 11:24:28 +0100
Message-ID: <20251023102444.88158-5-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfXxJIJKAs4imsh
 OpXNyClM0A26IjZQppa0C8zhjCFH/GXUkLaGK6Z2Q5XOdHSCIThkL3lb24VBNSR8JXH0zANxi5D
 Q132qHfI8GmX/lszWB+krIzvaRuCFJ34Wj0FoKMpftCjFBVeH/SJSQnkDEjfFnl7vhQgSP6gfmZ
 Onq8RdsHTbjK4GsvDCd3OCCgSSC1QE0Pe8PAgEGqsVnOE3Q/LE5wi1TSBdORob5NMFQIkyZ2pUK
 QOYSoF6jIK+T+W9Qh56Fk0bX111NxjfZjK6kPrVnLkZrm7ThVXI79F96mkArkHwlGhrARZAWF04
 2vZUbLSsa8PsrYgsBV7Kc0fQXLZwbQU53ZC2gdLGgvbRu/fG+P1Nj2s1DBdMfGRjSo3ZvPibeP2
 CvHxVygUzx2c7RA+iIuRd9FWC5MezQ==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68fa02b9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=MOmvoJmQv4oe-d1MVI8A:9 a=kacYvNCVWA4VmyqE58fU:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: X-Eht2te0odkIm_qWh_LDPwI-cUXe_p1
X-Proofpoint-ORIG-GUID: X-Eht2te0odkIm_qWh_LDPwI-cUXe_p1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018

Do not stop a q6asm stream if its not started, this can result in
unnecessary dsp command which will timeout anyway something like below:

q6asm-dai ab00000.remoteproc:glink-edge:apr:service@7:dais: CMD 10bcd timeout

Fix this by correctly checking the state.

Fixes: 2a9e92d371db ("ASoC: qdsp6: q6asm: Add q6asm dai driver")
Cc: <Stable@vger.kernel.org>
Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Tested-by: Alexey Klimov <alexey.klimov@linaro.org> # RB5, RB3
---
 sound/soc/qcom/qdsp6/q6asm-dai.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6asm-dai.c b/sound/soc/qcom/qdsp6/q6asm-dai.c
index e8129510a734..0eae8c6e42b8 100644
--- a/sound/soc/qcom/qdsp6/q6asm-dai.c
+++ b/sound/soc/qcom/qdsp6/q6asm-dai.c
@@ -233,13 +233,14 @@ static int q6asm_dai_prepare(struct snd_soc_component *component,
 	prtd->pcm_count = snd_pcm_lib_period_bytes(substream);
 	prtd->pcm_irq_pos = 0;
 	/* rate and channels are sent to audio driver */
-	if (prtd->state) {
+	if (prtd->state == Q6ASM_STREAM_RUNNING) {
 		/* clear the previous setup if any  */
 		q6asm_cmd(prtd->audio_client, prtd->stream_id, CMD_CLOSE);
 		q6asm_unmap_memory_regions(substream->stream,
 					   prtd->audio_client);
 		q6routing_stream_close(soc_prtd->dai_link->id,
 					 substream->stream);
+		prtd->state = Q6ASM_STREAM_STOPPED;
 	}
 
 	ret = q6asm_map_memory_regions(substream->stream, prtd->audio_client,
-- 
2.51.0


