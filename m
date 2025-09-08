Return-Path: <linux-arm-msm+bounces-72471-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 574D2B483AE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:38:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C1DAE1787ED
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:38:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43764239E7D;
	Mon,  8 Sep 2025 05:37:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kJgTUo3G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B98AD23909F
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309852; cv=none; b=PdoxKYG0Ppnanr110b4o8QwxcpS6L5lW6i7GGtppcZ4gamgZ/+2t3ElPvJkBAtkHJHIFNgRkqX7V0s+/IOTIf6N4c2hTj4WPc0S4xdfNMvxojZpbLQX0OSuxMGOdE4Q1n3rNS+7hT6suZK41e0oQ2ET7q6sFA9gy3wvTvn2E3qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309852; c=relaxed/simple;
	bh=z+gGsuW1nP7yJtlnfXfDq453MF7xeDeN/7Bqp1rigus=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=C7RfU8kXvi1qfNIi6P7RtUgb3vfIQ4apoDuEBsRIzmGDEoC3wAXe2oFKVBeo2oHVBP3ra+xEDxPwX+uSyfjbpckCVrCozfb/SuxbbDFFq7fO1CvyxkLZX7c0b9via75vE2DIxlX8x+6ivJ/37KJBFByYrn9rBoHh6xcgw64R3ZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kJgTUo3G; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587NGXI3021182
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:37:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q4ORjV3h/Ug
	G8t1QXMHoEv//ijDc+HhKRFWyrdBcOJg=; b=kJgTUo3GtKfTXy3jwEQpjWCBS+V
	RG3m1bVfT8HIcEfzzGhPjML2UL8WuWhcbtmNtCnsnPcIDtN5pl8NkkCvtooPUD4m
	CNnpzlKWn4gOccAyr7Qpot2nru//y1hwWw2BAhsriDKqnDLYql+NHPpcRfynXAEj
	yqzbewruE/3KszbIqSTCuUxn5EIZzb6mm4J6awhOR1dDHiOguCXDGgFQTUMsm87w
	q5CbolB0KbzHNjx/UWs7CpP1om6zYzbTeZ8TPhCjNYbueXtsgTXyjklSOAByB9LX
	7LYyFHVtjryYgibdyhehuhh4uX2Ux4n1nqo6BXNshXf2BXlyFeLTl9SsaTw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490d63baek-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:37:30 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b52358ededbso446092a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:37:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309849; x=1757914649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q4ORjV3h/UgG8t1QXMHoEv//ijDc+HhKRFWyrdBcOJg=;
        b=v9dnTfluaL68yUA/eQUk6Rzoul+jKn4/N6JbhnJwtPmLg544ISXsf9mH/Kj2rWC9TY
         u/o1AeTuMjW3DK3OcNdEi8xOJD8ROdmCHkDFqxK8Zm56vm80V6s+oBors1/hB9jtEqdF
         NvIph1xhUkg9brm73h7V58K0rY/7WM7uvmDzxgzOmdvbb0baqW4yBFymhshwLMvnJLE5
         O2simzx45sf62hWyMZ7XcgWr40fd/DBCLib9IGp8KswjGLowzLSkZbl8u3rCdvp5oL+J
         oDJqRHvDaR6XQeHbDAH4PqKxta9SM0VmaZU0OV0f/NVEIRwaXu/VHaCvAZytApoWm6Nh
         pHrA==
X-Forwarded-Encrypted: i=1; AJvYcCVByHMLlwrvYQ2ONSLWmeSPSrFvevEpUIrvDldzcu+y3ZW0WdoDyMxMRtTruLAXkWfBNWF7kIkOjcuJZE1C@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcOIi8C9A1Hr+kJrSz0wDiyLPbjTF4qe3NyuU5VXu/ymNYibt
	8ZuD3KYUxAsCo6UadThWmMvo5u1KiU+2JvwxUCVbz4Pz91AuKKyZY9kqXKmoGIrBQllc0eucv+p
	eclz4Fnldem7qxBInRAPg2GSBUOlF9FzYI5AMc7FMsFnRURkoKgeNzzRjwr5Byvrfnj3M
X-Gm-Gg: ASbGnctju5Z/37orLGx2hdEm36ibBoJhSdAfDSNIfPKpqzQw5q/e/3VxT5uswl9l92o
	qjLpSsXkdmErJLAcW+7fEGaln4AgbXJCV9BIDkveFAyF6QDQbJa61lg5ywLnYZtewZPcA2T500o
	bGsbBqSS66gDnTJ+P9XWXWGEyamXHCBJOzoCgoHgCIbDUdx6a3Lj1BQ9GRngv+XasTqyXfn5PzK
	hNXRqcfr+FlX36GQsm5SPltraDa0QPQG0b9eSOZ/Da3kbJdN4L6AEJ+GrINP8vGea493M1rq/xN
	C0xltkJYmItziIm8LIqkNiR+uAct8PPLInPbMig8Wt8WQSI9h/eh3qK/tqyRoj3URpr6BsFKSa4
	N
X-Received: by 2002:a05:6a20:7d9e:b0:24e:2cb:673b with SMTP id adf61e73a8af0-2537e066fcemr7667953637.26.1757309849243;
        Sun, 07 Sep 2025 22:37:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEUB3fffQc0dYIvBmhNho3Grz0OULGZkqOb9HQi9BruK+kfs7gs6X1rClEeQVcaz0XcgWbw6g==
X-Received: by 2002:a05:6a20:7d9e:b0:24e:2cb:673b with SMTP id adf61e73a8af0-2537e066fcemr7667929637.26.1757309848724;
        Sun, 07 Sep 2025 22:37:28 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:28 -0700 (PDT)
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
Subject: [PATCH v4 3/3] ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S interfaces
Date: Mon,  8 Sep 2025 11:06:31 +0530
Message-Id: <20250908053631.70978-4-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAyOSBTYWx0ZWRfX3iJ3fD1IctyZ
 gPrnti+nI/ILyemVaI8LrGnUE1Nb16i9xjpD3aaQ+pqDcxeR5JZ/lv89BlmUc/a3otrMeYCNeyo
 pFcbzN2fG3KyH9EI+CHr9vtS8O3HFSXhYQCH/GKmUB49+gd4ECBZ24MItLFNIq0CXzNxyzZ6lSj
 RpWzT6cAqP8LsTj7bhS1CfIp4c1XSchjjUlvg2ziS3m6EDJwdxyZVlVDYQOZjSSGoibMR7+tj72
 LHm7Q/cvzWTQYkp0EniW/t2qTAZnR+bW6Ef085hUIYJ764oyBmUWItZGiUymYEg50CHmSmnG3BF
 sDEJY4qUrEy64tqsZdpLFzIaNql+DcL6fZpeNv+Yuxk8UYi2oX/JDAFt8cRAj22nMDgEmugFe7E
 XE5klp6s
X-Proofpoint-GUID: n3IdP6JTyO_rvcQNwFST1MK0e-w9Tc0C
X-Proofpoint-ORIG-GUID: n3IdP6JTyO_rvcQNwFST1MK0e-w9Tc0C
X-Authority-Analysis: v=2.4 cv=DYgXqutW c=1 sm=1 tr=0 ts=68be6b9a cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=wtrncf1qwap5WzB382UA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060029

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


