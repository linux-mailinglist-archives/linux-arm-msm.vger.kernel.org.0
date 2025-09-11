Return-Path: <linux-arm-msm+bounces-73067-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B276EB5290D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:39:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 62FEC580271
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:39:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 31625272801;
	Thu, 11 Sep 2025 06:36:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ntDBUzej"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AA9270552
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572602; cv=none; b=R2xknSDpnkSDPAVpKnlyuwlr24RcMVS3E9QuPPJiRoiY29veH4P9YSt1abwRYrS5sPq70OFQl3kNZ9kUCqtoTK+2xK49zohfY6W6X3H3DqVv5wdSGDCJ7nWKXAkSFOT48fChMeQw5kjUgmkmOdTF5YVcyS6dhhy6cWb3E41BRX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572602; c=relaxed/simple;
	bh=3CtwootO+el+RrOJXyCia5V9rqAmA+AuWVwZzlzSH4Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=tgxQ98z30T44P9bQNkBGjEEocQ+Ghwf4Dl5PhagOGEjXczY1E7cz9meK1gLcnE+wFRTun4bZI/j1sAEnE/VrY4LmhqiNeLmJKUKq8+Zi0XM2Ifp+97FIPD+J4O1zDH+cCdnT+DouFrKHdx7EQYZy427ZP8FZ1/g6Lt6tgpeRZcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ntDBUzej; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2J3LA000689
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=LDwAG0QNYm3
	TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=; b=ntDBUzejHlJ2XmULBN49Yg0/iAV
	tDqw8/f+eFEHDpEjp8OX033z1fsrIOeyduQS6CGswkWkuBJNQ1dqXcx4alhEHSOX
	85TMDmy9BnH0pe5y5f5kB8z5pSzgvKynSOtotsz/+NDKi3v+uYal05NSPwn6ORUx
	vpdnjsbVses99qJXb/ww9K4TKSWroF0+1exBHRMGuLw2RvRKUi/aom8xHBcPdNSQ
	l6/ntFgg7snVpVxwnl3x/gGFr39Jn+Lj9iNrp6adlUTLnXUYNennQn7P+d+dzHWd
	yXYYwbUsG35YLQSGgT5cruhcNdUCJ5pG5q4HJEhDTJbwoe7uUwzbQOvHwdA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493cpb230y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:37 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b4d7b23ad44so301262a12.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:36:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572596; x=1758177396;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LDwAG0QNYm3TJZCTHSe3Hq/KAWIgtpSzOrrjr5E3qM4=;
        b=UsvOgdT1vYDESh7o/AqyvfYwPt6483BR8AgMQiyExiggIq5i2hRmjs5zMe9ddF1Bt5
         pDkIWB7s/qcoWaUmRDsndQ3AcCIqPol00O/q4rSj4SVQlagHpKaU8rLEcfmDGPK1IRqn
         leI35EJ5nyx3jU/odnFpA8qOClIjW7h6JS7/hcjLgwpAPrbN1Q9Awd/O0R+uRq6w+S49
         vHUz4/cb8ryqTcvUuNona37zqwfFMNmhAWk+xgNWPUpicZbT9WHan8yNMgnZXjkK3oAc
         k+rNtEPY0FiPVwTQrMynKRv7eQq5nvFTvygLyc9KrLo66YoRFh01wGLf7XmEv1hw8XyM
         95Ww==
X-Forwarded-Encrypted: i=1; AJvYcCUlzrKFXSOjgH9RS9bvD8/09LE7SUDRQ8G3GEfRWrZqxk6+FhJ0/3qvX0/bc7f190tZhuwRnO5GrKbDcT3A@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9yNCtg3dV35CwuPB0Rj284+3ogfLNIcJ5R4n+jOBpfs5JPUUj
	N1RpHWTkdwqz+ejMiwqE9ZeovQRS5mpbqYHJ5tvo+qqRuC+0l3Oi9Ubtei17pPURSRwe7QI2aXG
	/t2w3WJL/DfWU3YsCU/t32JE541+70hNmlt/qJSOcl6Lt8Bqb3Hp+/VtkDiJ2hqu3r2LY
X-Gm-Gg: ASbGncv2G8/tmrojwtidiUu7gUnwLZcWibsoIx7iUrprC+32NFnxGefSfeBfHjKbAWb
	n/2QIetE2iKWsBAOlceOS3zKjir6B4aLJZrNdNSpbZ9FCAJmYx2Xq1bciFOg9wII9iniAiUaNRv
	SEdGwwJ+vJskgoGi9pfFPhLvzkjrbGoQCs9+PgADRoA5wKYlaFXYVv36RDWV981x0IIlq8dFtbG
	i44Frg/wPRIkPyJy7y8KmRuK2BfUd+aBssaZjZIhh6nQF/HWNwmRy4l0DowOXP4GUuLYvhcKl+x
	ICHhsh1k4haKnunAv0wlBYl6jEUBk6TDfRqJ0c/gXVMKsxfijrWjQ51Kw++4rZHiMbgbrahSTmP
	f
X-Received: by 2002:a17:902:ea0a:b0:246:80ef:87fc with SMTP id d9443c01a7336-25174c1a958mr256279855ad.45.1757572596442;
        Wed, 10 Sep 2025 23:36:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEcacMkV67nbieIIaWIuOTTD3vj8ct2khst5MgT+t512ruIpzEk5hxAb/P/xJMf3FaHrDwZdg==
X-Received: by 2002:a17:902:ea0a:b0:246:80ef:87fc with SMTP id d9443c01a7336-25174c1a958mr256279695ad.45.1757572595996;
        Wed, 10 Sep 2025 23:36:35 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:35 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@oss.qualcomm.com,
        prasad.kumpatla@oss.qualcomm.com, ajay.nandam@oss.qualcomm.com,
        stable@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [RESEND PATCH v4 1/3] ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S interface
Date: Thu, 11 Sep 2025 12:06:10 +0530
Message-Id: <20250911063612.2242184-2-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE1MCBTYWx0ZWRfXzB1411UtI1W8
 GfSurI0ndrKbmgjfrSENiFvwULQc/wUgCrDGSaOkkG4UD82k20FT/GWE+feGSjhc7HyDRF4p2Q6
 A/xYSQlLmgz6eTVwaOOog44kuj4u50wO3Oggq3LZeb9GgxEyG8yfMiGlumE1BVk74uE32B5VmTB
 ZEB0+yifafPK4I7WPyzBRbexRh3CfTLc6cXzaACe2ahLT8Tb4jdh/4i4rOjfsNkbypBMJa8x9e8
 azfi/Q9k3hWMaa5vIPZnn/SHWoNxYDUodwFsPhVogvSTBQZ8UU4R/KNznNnNk5TNipdFPIQfjjT
 6fUisZkG907s2mTYLldkIW55yC/PdMlM6AlISjpEFdP9Clz8OgBugY+8kL9u99GU//vMsQt8o7s
 nXaWp3P3
X-Proofpoint-ORIG-GUID: 3rAxWP_gUVA_q0uNxjeQT4CxNDG_YnU4
X-Proofpoint-GUID: 3rAxWP_gUVA_q0uNxjeQT4CxNDG_YnU4
X-Authority-Analysis: v=2.4 cv=P4k6hjAu c=1 sm=1 tr=0 ts=68c26df6 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 clxscore=1015 impostorscore=0 suspectscore=0
 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100150

Fix missing lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface.

Fixes: 25ab80db6b133 ("ASoC: qdsp6: audioreach: add module configuration command helpers")
Cc: stable@vger.kernel.org
Reviewed-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
---
 sound/soc/qcom/qdsp6/audioreach.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/qcom/qdsp6/audioreach.c b/sound/soc/qcom/qdsp6/audioreach.c
index bbfd51db8797..be21d5f6af8a 100644
--- a/sound/soc/qcom/qdsp6/audioreach.c
+++ b/sound/soc/qcom/qdsp6/audioreach.c
@@ -995,6 +995,7 @@ static int audioreach_i2s_set_media_format(struct q6apm_graph *graph,
 	param_data->param_id = PARAM_ID_I2S_INTF_CFG;
 	param_data->param_size = ic_sz - APM_MODULE_PARAM_DATA_SIZE;
 
+	intf_cfg->cfg.lpaif_type = module->hw_interface_type;
 	intf_cfg->cfg.intf_idx = module->hw_interface_idx;
 	intf_cfg->cfg.sd_line_idx = module->sd_line_idx;
 
-- 
2.34.1


