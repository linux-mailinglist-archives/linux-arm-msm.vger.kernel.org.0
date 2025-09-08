Return-Path: <linux-arm-msm+bounces-72470-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ACE0B483AC
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:38:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078FD189BB6F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:38:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E609B2253EE;
	Mon,  8 Sep 2025 05:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pT+UtsMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E456238C16
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:37:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309849; cv=none; b=s0vIboyjBT88IMjRMnEu8qhatpWmqtbXj+pR49nMMEesLT/A4ypNAut14IqGzvphocLfdj+y6dwbXSRIHD+bZw++LYr6sQ/RFW2/TeJBEYZ13aKoBlDhpWgw6sx5jSmeRd9gidIkZdJdPQ3izh2cs0nP3TyTWbeKauSF7IeeB0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309849; c=relaxed/simple;
	bh=RhOFMO390kD6vVPQk+wsaIHxpEh7Rl6s/uQ6K6nB+Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=S8qBL4e+vL31DKj/OjLpVFaxPV+/bPByLZzOTH1kz6USWQQPetE4HzUoSCu9Z9PGIUYu0THmUVfguT+Dr5DTOW0Csk29yX3mCHYUwq7ITFSCUrg6vOq6ayW6mNQZvJ+KWnMqjuUgwEdP1fiRZaXi8dE3c4y+fdYAyAY6To9D/fA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pT+UtsMG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587MMfNN013584
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:37:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWX0jsMcz+X
	znw8DUFwCpjh9opKGeTSObz3aq0hQzb4=; b=pT+UtsMGperxMiWj/SHOY9fBAa0
	RPiePWRqn9AtH3Yg1EdsgYIKWfxAjyiUNfNhfX+H5K50spInLYiRZxdN0U7iCypf
	ltcs5u4bGQo/OB8R2rVGgKuikfA4g7sAl5NapYvuwEZTl0mCSpOPIFb9LFZvhMLU
	w21oZgBPIKet6dZAAkP8Xxdsj/lnCADpl0NnLsYTjlF/N4zewxzhmVwKUxjzjBIy
	J32/S5mv+ByR/4BVyvfMDaphxNBo9GQ+i5BukH7Pm4cU3sAG/sRG5dRGEh+1KWXx
	yb20xRQ7jw/xR0z9xfXS97LPfkemrpL23Ug7h8zPHWbBp3AZAxBCT6ffEcQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3dsp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:37:26 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4fc06ba4c1so3102720a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:37:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309846; x=1757914646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWX0jsMcz+Xznw8DUFwCpjh9opKGeTSObz3aq0hQzb4=;
        b=Wna5F6qKD+VaQzVr6SyYmvxdKjhkcSYCw7WzgXiZuH8P1RAsUvi9IpOX1zZGcEIkOj
         P1+xmbTDl64CkoKURZ1YYSzCp1HstyfH9OMNvhOg23Mn9yqfOjHO0Bqn3ABXn1QBzluf
         rWIpKoW7E0Zegy8FtTjbRpbPg4rIg/Z0WTKgWGTrKUZqvblRZiGMF2t5+U7PkPev71b+
         aviFzyL00wKQI/0prYmFlk58C/FEh8IH2auCme2DCYrnyXJq8BOpNvy03nJwWWxHdtQQ
         S15R0OOl/TOLZ7+OnXOw+8/I6Lg26zdN0lCQL1fyNtHh2XblcyMplloNSCT+1MGmm+mE
         xbJA==
X-Forwarded-Encrypted: i=1; AJvYcCX/GHKHM565QsMFhFVZd2UTiw2cnELpZZfICvj8seW1dJKyiRLJv8BbKE8K5mh/b4BmuXfytXUPzKaz/DRQ@vger.kernel.org
X-Gm-Message-State: AOJu0YwFhUzGwY87zl33W5/3oaidzxEJNTXaCJaxKV47GLsPPemgDBC0
	PJp8hUJYxAeLBqyGedPpy3UMOBtU/q72VSltMDLRqVK67xQwu4SFpZFeDiuTPX6PUilg3AhDap+
	TbwGkEkWEFvF2Yd+AmglJSMmfxMwTnN+TdglkbXjHnl9PtNQAVYwNHEAls7iwa7jglz+9+pBlIu
	xh
X-Gm-Gg: ASbGncvQNMsoZxI9wVlldVpvqGHEuxQgXDXaWM7rKQpG2cT3xobaM8SlNWmwUekGVJu
	5a7xMhODj1emq8IpQwj4JvsZsA9A9xJJIV5Hvj2qtZ7T2yeQgsWKwoBkwPJuAVvN2XwT7ludSH7
	n0DqlQN86BL7Q1+c2I6MqT2cchMsTSftqAfyWFGqZ9jIzVG3WApUfRa7b64LjuEKL2DA8bNwtlD
	r/U/CTRBLvmt9uYtk5YhoYWLo1G4tYf4sf7K2CI5HUTKNj+WARnBwjYMe7PMPEkriMTIg1tTgrQ
	4CsSVnROanQTFIA2hobDQ2Wt50g/Y6waTsc001BA+NbhuBfbyAn+UAnUGNbBC70I80QqL7qZkxT
	H
X-Received: by 2002:a05:6a20:4322:b0:240:489:be9a with SMTP id adf61e73a8af0-2533fab5821mr9907445637.23.1757309845660;
        Sun, 07 Sep 2025 22:37:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGiiCDYxE12pB+bzy1cltbrdX0bzzKGs/EE30YA0O6ftyQUyRTV93nZj0ULHEaojirXrT3w0A==
X-Received: by 2002:a05:6a20:4322:b0:240:489:be9a with SMTP id adf61e73a8af0-2533fab5821mr9907391637.23.1757309844546;
        Sun, 07 Sep 2025 22:37:24 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:24 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v4 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Mon,  8 Sep 2025 11:06:30 +0530
Message-Id: <20250908053631.70978-3-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rm7iXXR7usbXLis5VqNxkvnJbJ2BNlan
X-Proofpoint-GUID: rm7iXXR7usbXLis5VqNxkvnJbJ2BNlan
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfXxnF+rfrd7UkR
 ZSgNBK7ETxTzyufDl6ZQ86r+tY/YSKukYYUG8dK7MErS3yRzqIkobQjYP+5uxTr+OYZwiYYbd62
 asrpohHDB+EW0gKC69pXN/5PrzV971sqnX4E4Czl1qnqT4vrHDPvApdTFUdWm18+lzCqxzmfRvB
 sqCSZBjpqqspm2qJ0T6fwOWqMboOPju7axjpKP/jhPj/AixSR0InzaS9w9vwgcDs5rw4Lfhsw42
 DJD40M8+FJWYZ7vc97WbXqEGUVqRYlx1QZBaWy1Glcu27ZcVLWVeub0T4yegrkc8nZKDTi0d9op
 TCxKTETlyrzPcnnWWsVbPL4lxSqojGJTLY0NehU0zORePQDf7otIy49ubSNGSC8Z90OfJ5ZakKe
 SnIV0ZUp
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be6b96 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VUbThP3hI7wIHPtXhhgA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

The q6i2s_set_fmt() function was defined but never linked into the
I2S DAI operations, resulting DAI format settings is being ignored
during stream setup. This change fixes the issue by properly linking
the .set_fmt handler within the DAI ops.

Fixes: 30ad723b93ade ("ASoC: qdsp6: audioreach: add q6apm lpass dai support")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
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


