Return-Path: <linux-arm-msm+bounces-73069-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EF4B52922
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:42:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A7FEC7BAD2E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:38:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1CDAA2741C9;
	Thu, 11 Sep 2025 06:36:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jcfhArRd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768AE283CBE
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572610; cv=none; b=Zx6Z4DIv5wEbR2hs3IR8xqp6YBTNtaBmHFruEGsBi5WN4WsOoAzr9YiDM5urTxuHv10WYGWdmfxZqfRlse0tsYQHtM+OEdyZtB/EJxb/ysoT9zHYwJFSLrXufGVgIjVyiKpAywAFb6hoDElQqkTNjqB9Rs2RpaG1+QzjPocY2oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572610; c=relaxed/simple;
	bh=z+gGsuW1nP7yJtlnfXfDq453MF7xeDeN/7Bqp1rigus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oYGxVdFHUs1d4mPC8A9f2tfbhcQvjyXG6DqDKKyvMkr38+k01/R1CHdyfN5/iwdavTYKq54nwHeOjDr4uUUNuREiA3n+BN56or4pralzM6rGgnEuoxiHEMPfYE08hQ3bONu/XqHsaXfAh+1clro1SRPu88izWAObLdb7gHsZ7hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jcfhArRd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J19k026440
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q4ORjV3h/Ug
	G8t1QXMHoEv//ijDc+HhKRFWyrdBcOJg=; b=jcfhArRd2NIdgBoVrwL3sdrqqwd
	kzJxqYYVERFKeWu67qfx5kMo3mSt9WrDYvk+vVF6xRInAHRg4/K4QRBqls4Nvqlz
	Hw6bRTCCcNdJsboF7CD0w6IjciyWs/Fu+pw0M9bl/ZkcPRC93sIRBAjirSWxEO4V
	JGHuqkbl6hHosgictnvkCVc7qbL6cRDeoZTeEsymUT0XM4vRX+x6YCkmXwBvI54M
	sJcuSUnmMg/mf0+on5+PBBcc3HgcDCLDCnXxMVySNtNXP9AY6TDRciTPQFVBFSrj
	eb5f3zs/+/olwwwQ2mTHyRpYSjXmkq6aVCwdbSwllEcWc1YAkokEE56beDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490cj0xfna-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-24ced7cfa07so4792575ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:36:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572606; x=1758177406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4ORjV3h/UgG8t1QXMHoEv//ijDc+HhKRFWyrdBcOJg=;
        b=FFDxhEaUtxnKGzFGiRWJSV+P8bTD7v8PQGPOxLUuF/mTC+A1r+A5L7L2KO+/INgJD4
         2ZHi0eBfkDO5jwDYckIYswKxLr1ie9ecuZ/E9HdU//EQNVXNpZ98wdtw2p8rMdNqiNsV
         6iMy3ACrxLS1O+W4OeU6dXPp3jbB/6wezUCiZZQewVakxadqi6Hft/si97nnx/Fxus0a
         j4pTcMuhcAt6zpTmRVniESgzHksTLG/LiGN5npMd0UtQhI+5147VBsQi4a1xLnG3Q7KH
         ESXxC/dRieZcn4VCGvDytLtn5qFn+ALYz/NFlPTlMJnxuwG6ERQOOIYYhOT3RpGSPom9
         s9TQ==
X-Forwarded-Encrypted: i=1; AJvYcCXj4Hcd+VQDtb9e7iaWlx2d7pGYL8UK4fxu45YRjIO24eX0mr18V7k8+lrGBoWKWx8bZGFaKxGQjTcwwwJR@vger.kernel.org
X-Gm-Message-State: AOJu0YxjUEkI3VituoRpq4iH+bEUUPQWYKvysrueXibFau05JhsiEMIC
	yBuoEhk+EFd8kJ65wPfcBOZtDebzoCW4fin8BB3KxbfzUk+ClAF+MOy7BjYyt5+o0g1/6j5peUk
	N8KaJjG3o5DFp5C09cUE2fnV9LwBGRYYeOkUhSDthE46oFsMym3tgJ9tbFw9PkqZ09b+r
X-Gm-Gg: ASbGncs2Lw0DOoPWQ5Blh1PGmJdEWRjDQvw5HnUf7iforMYIDZx2kV6SlytStB3ic4r
	wsWrCUuRo8pryTFPpJ/AgDinvCxcBV+kobcbN+WyTL5EnOYGDkarP4xQZrFoQuXcC/sGOLY9+h7
	K8IppjBVDkUPsIm2Bv/jEqOlz/PCRqQszBXSWLqdqQ2zgpVCLX52pUGoPFoP+K/go7+1Fm48zQc
	wwgJOX7C1sqGa5d0TRrQzehRMs7DwjS40Hv4qLGU+0m2z5IenNAm1YMGFQ+9LeofIB3Mo0od4Bv
	ypuF6l5QHq8Ugri0xk7Y5rUb3tsyk40MOtKoDbEmflBtQd3qb7+bYa1lqSu0I21VxP+v2l8wKc7
	k
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr225873605ad.29.1757572606000;
        Wed, 10 Sep 2025 23:36:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9eV4g/Bz1IC9gIK4+YyyAJHqfkhbwcypak7raP2+NFnageWgjl1k5GmykpU3x8QunX0CgBA==
X-Received: by 2002:a17:902:e5d0:b0:24b:2b07:5fa5 with SMTP id d9443c01a7336-25172291ab5mr225873325ad.29.1757572605304;
        Wed, 10 Sep 2025 23:36:45 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:45 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 3/3] ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S interfaces
Date: Thu, 11 Sep 2025 12:06:12 +0530
Message-Id: <20250911063612.2242184-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250911063612.2242184-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: T3_qFWzlWGwIi2wTzGSZML45G69fu5yp
X-Proofpoint-GUID: T3_qFWzlWGwIi2wTzGSZML45G69fu5yp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyNCBTYWx0ZWRfX7/7701M1ubvV
 ESvZQt8MnuEU5xEXJedM7vncMRZiMUBTrJd6QfpWqCX7dgclDWY5+UhuPmLDWArMzboVu8uEhcW
 JZ9D58bcy1zqrVe19cUavViwraOZpUg/sDNJnRaF5PaDzpGdUBtHqrkAAu4RMUviPtHwT83Bbyo
 LiP0nhimaBcx35WE1tKIQkPbHmgG/1XqXJTwA2kez0LahsdnzzX1ypt3L/C9HqWv1CTSILun9aE
 J/2n7FWKd5/QdSfHUMAKZMyNLWLaU5eG7+P/cXVjA57eq+a0IiK4MFrOCsjOFn7Fab1fDSLLRhc
 lPqquDAsbIzeaAdA41JdKCbt4COZOdeK+U+kyg/FUIxayjmqG2qN8vrk15wG8B64b3hPyyvdD+w
 /oimRO44
X-Authority-Analysis: v=2.4 cv=QeFmvtbv c=1 sm=1 tr=0 ts=68c26dff cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wtrncf1qwap5WzB382UA:9
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 spamscore=0 impostorscore=0
 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060024

Add support for configuring the DAI format on MI2S interfaces,
this enhancement allows setting the appropriate bit clock and
frame clock polarity, ensuring correct audio data transmission
over MI2S.

Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/sc8280xp.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/qcom/sc8280xp.c b/sound/soc/qcom/sc8280xp.c
index 73f9f82c4e25..3067b95bcdbb 100644
--- a/sound/soc/qcom/sc8280xp.c
+++ b/sound/soc/qcom/sc8280xp.c
@@ -32,6 +32,10 @@ static int sc8280xp_snd_init(struct snd_soc_pcm_runtime *rtd)
 	int dp_pcm_id = 0;
 
 	switch (cpu_dai->id) {
+	case PRIMARY_MI2S_RX...QUATERNARY_MI2S_TX:
+	case QUINARY_MI2S_RX...QUINARY_MI2S_TX:
+		snd_soc_dai_set_fmt(cpu_dai, SND_SOC_DAIFMT_BP_FP);
+		break;
 	case WSA_CODEC_DMA_RX_0:
 	case WSA_CODEC_DMA_RX_1:
 		/*
-- 
2.34.1


