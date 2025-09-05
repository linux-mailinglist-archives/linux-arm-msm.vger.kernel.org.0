Return-Path: <linux-arm-msm+bounces-72253-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 973EDB454E6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 12:41:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3CD251CC2106
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 10:41:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7434F2D7DD5;
	Fri,  5 Sep 2025 10:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fu50+kd7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D462F2E2DFC
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 10:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757068853; cv=none; b=mAauAiC7388tW65MbNIoAsX66+lu2A5xop8NkHaldxMVhdirrWlSf1s8LO8dQaN0uZNsp61A7R1v3kWzUvoejGwKqn1tNtGKxVri5SJh2dW16e2GpbRk83WDs6lxatxrtMk3BktjObkTxF8Pou8Jj7J0C165Z4AYvoZyC9VC2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757068853; c=relaxed/simple;
	bh=o3+9zWqzop6Qirh/jUD98VgvGr+s/4CoqP1QajjE/Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PwbVjiZ032m27F02F1FVAdtMEQcTrb9KC14FAd1eHNgU+O4E6Fis4/JanqU5fd/zaPWwjW83ddG6e6Dcq+ig/0B2h5T8BnaZKy/IjSVL2snFirF1umtJf+oWC9NpfkTLV+1lKH7k1EQfOxsTz5e2CQkHD2FPtpataS4gzp2Ce9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fu50+kd7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857ZEQc022154
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 10:40:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LXDDf7M2VYT
	jvwwkHPq5BIaZwMjwTKn+8VWmbHt4iis=; b=fu50+kd72QmHR755kColGCGekPa
	w7tGLcod3efoyTJDXPGoT5lhNYhf1cRXphx0Tai6MWYl+unmYxBRBB1pJNnG5WNl
	vW3pPrsvqHRn4TgdV0rfy8WDSXuZsBsnU6+IDhjf/ix0f2FTyw/KfOI+KIxrIA/P
	pYDBrcLQF8PXPihc9dnT3coKATyYlkBLEYtRAM4l4rpB6qEVG6vUUHJaFwd45xMw
	7/EkHQWwHJVAR+LDzMPwTwYCInRIAVeWcGKNTorYa/NLkB4XosILnLkP08viCUFk
	IObPfP5/olssLVqDBalXlCPI4SkjRx7SOgEGpcRiAxeVMCRcDA4mC/bLr9w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48utk9apab-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 10:40:51 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-77260707951so3079800b3a.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 03:40:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757068850; x=1757673650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LXDDf7M2VYTjvwwkHPq5BIaZwMjwTKn+8VWmbHt4iis=;
        b=w1+zqXs0TWTdN/uEkuERSVtsVbQHE4E583nPKaLPrc1I2FjEHFE5sqcWJO739mW4ti
         O8eHEUEl0Ns3glMPEs9Mt571HlbZvkmfaIgFsFuQ/y/qq9SPp8sd0R9JQ26x/nTS8oul
         zGYfjgb657gHlMuX990aMcv4p3yYIp7Tv7pPRhOlteRbr6yaEfjR4ONgjTSDoQR3dDK9
         QAcD5sdlDBYqwcUK2RjO4yTENAHcOr/mQdjTw0Va/t0tOeThVCnO2hVvzPNaByvZ8mBy
         cBikaYCyfjgWeCoe1lvuO/D0xmH7YrMdiONtyOr1SpFnbgIittkLXCQfsSYQqtaqqgzf
         CnQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZPelGpFK4Lg1pmwP/jj6KSv5SaFDDyto7AMhCP6oUnDSo4NutjPYWJgzImOxHT5NquflXUKKBf5dTWPvW@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0yRCU6gkbOJ1a9oelMt65l4xP6Icg4GdeGGJJNks+aqvoRHkS
	9sgXx2HHOHT7DNHsS4f0nVPOF9MsnI/ezsc8AhKomvM5QRWuaYbzQVPwTJYQXnH6eQMfbqNjZet
	3J3JxNavEu+WS12siCc949JYUH+5JzGLK4YmvMryWK7QzQas6w9UHYKrJ34ScG1PjVzDv
X-Gm-Gg: ASbGncuxsEfK4N3dLsTbzuj/lhLmetEGPYWF9zqd/l//2Y2JFjCvpwR66OJooQGCDXX
	YBGsBX9jQXA4tGaxu49u1Ws72qhZVNplqsXMDqF/WzewPatc0S8zhXq8ucqETKt73IYZNAWfKqz
	R/l8rjMGYDUbcpKePJFoKVR04yfgj2kN526EN+RyZnHS3QPrCO66GFYE6it6KYcjdPnMeW8dTLU
	PFc+/DNyH2ZWMQ1nF0nko3vBQR4tQvzyKN/hI8gg33WLBJX0FPW2XLiXfzxHZnX5Y+85GC/l5vC
	24k/b4ZuYJUNbhaLuNNu2JfhguFOgoCjcKmBD01YMYlhrEDf4TiI+EznYGqCO9FYgKFXV49xzus
	s
X-Received: by 2002:a05:6a00:2d86:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7723e36b457mr27393620b3a.15.1757068850152;
        Fri, 05 Sep 2025 03:40:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHnK9/HS3NMRByU9Ib95AJxuy1rcwlfJDqcn6yMRx61rMf0Ranxs9dLAw+zWBYAe4AELefC2w==
X-Received: by 2002:a05:6a00:2d86:b0:771:fdd9:efa0 with SMTP id d2e1a72fcca58-7723e36b457mr27393565b3a.15.1757068849386;
        Fri, 05 Sep 2025 03:40:49 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a269e9csm21993859b3a.17.2025.09.05.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 03:40:49 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com
Subject: [PATCH v2 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Fri,  5 Sep 2025 16:10:19 +0530
Message-Id: <20250905104020.2463473-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CdZdIE2C0qao4A4E3ZCm4jEOP7YQtoED
X-Proofpoint-ORIG-GUID: CdZdIE2C0qao4A4E3ZCm4jEOP7YQtoED
X-Authority-Analysis: v=2.4 cv=ccnSrmDM c=1 sm=1 tr=0 ts=68babe33 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=sT7cmTyyBTHRPr1aEM0A:9
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDA0MiBTYWx0ZWRfX/xyIDfL4Gow7
 us+2CVs8G5TTuXLsEaxCVjsWeD+qVd//dRK1acHfOhjpgyy1P2qrJWRbn2mtqNlW5IxywJ7AZ50
 Ql7Nby5LlwRVJOz3pu4Pa3ZGlpzBKLRPzCHlK9HDuR35bxUlZZzFZV3jW8+tlgk3YhF8OOpwQpD
 NjD+xMN1URzGnE5rCAvnXOzk5SCfJUy80DJ+2i+SBCb1PKH2FbsOs3MH5RTWinhdcJZ7rgRlu7n
 Z0jpSDmZNVK0efFCfBtVe+NScnzDOOOO4rlEDdhl7bbGUfxxjRFAqxR1gA/Y2N4E89+20hw5/eD
 UDResrl/vTavTOFHP+B/ZQmQ/mIkWXo8Cf/1OEIHx7dSYrOYxEqgXyUvrrS0mfdAbddhoZ+gp+b
 h2v+4bTN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_03,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 clxscore=1015 suspectscore=0 spamscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300042

The q6i2s_set_fmt() function was defined but never linked into the
I2S DAI operations, resulting DAI format settings is being ignored
during stream setup. This change fixes the issue by properly linking
the .set_fmt handler within the DAI ops.

Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
index 20974f10406b..528756f1332b 100644
--- a/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
+++ b/sound/soc/qcom/qdsp6/q6apm-lpass-dais.c
@@ -262,6 +262,7 @@ static const struct snd_soc_dai_ops q6i2s_ops = {
 	.shutdown	= q6apm_lpass_dai_shutdown,
 	.set_channel_map  = q6dma_set_channel_map,
 	.hw_params        = q6dma_hw_params,
+	.set_fmt	= q6i2s_set_fmt,
 };
 
 static const struct snd_soc_dai_ops q6hdmi_ops = {
-- 
2.34.1


