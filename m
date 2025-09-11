Return-Path: <linux-arm-msm+bounces-73068-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B20B52911
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 08:39:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C05903A3D40
	for <lists+linux-arm-msm@lfdr.de>; Thu, 11 Sep 2025 06:39:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1B61281520;
	Thu, 11 Sep 2025 06:36:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nd27h2G/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33154280A2F
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757572605; cv=none; b=imRcCjBEXMuS3H4HWOapq9jhuBz8ZlzzdKcfkRBw/GgrutT2nrxHRHi6pzv2H/xZ4FCFwsxzjhDHMh7inXknNKuwTn4g4xw9g7WyFNlSm49Pk8ssxBXFIwI4shm+sil8ekGph5itUEZc0te3SmJYcUJpcF+9BCRJiAFU/9WHn4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757572605; c=relaxed/simple;
	bh=RhOFMO390kD6vVPQk+wsaIHxpEh7Rl6s/uQ6K6nB+Bo=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FggFKH5KV5zMXAyXq+UZyReIZ0nwLNvgXRPzpErAz9hcP58uBssXmpvKjfuqXz7jVuFD38dQsA3xMCNQLwR/Y3aU9zZ+UZfM7ECWcl/wkSNm70BkUnxveq+nNvac7Y+MSFQlG9rhllzjPdijYS9DJFq6jpTCi3RynzqiF9N6czw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nd27h2G/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58B2IU9O008175
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=HWX0jsMcz+X
	znw8DUFwCpjh9opKGeTSObz3aq0hQzb4=; b=nd27h2G/WdRY0aTMKSaIH9KhQbN
	QOrIe8F7m+di12OOyT7nEXM8i5lZ2STbxnPSLDsR9iXaF3tnvCNk8eX6z+fMxHrb
	3x5bSPVRgNMwAvjxgFdNWwszOplU/P7C1hwlpQ2ygNb5Bt87Zvon3Llu/Q+yzYsq
	8Fgq6IJ+lpbjtzGL66m/wbme7IJrYZ5CyQrFQvN/fEm7b1wtAZC9Bk8ywi+9Shpr
	8vjcL2rK07zNAlgddRYr70hWh8yA1Ur7JqAa09iRd2bDuDUMv2n3gq56WIE53LCq
	SLoE24Hm37w3vfjOo4D1CctroAjK2+DTc+7sUBk/3xQR/EllA0sL4KAaL1g==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aappt3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 11 Sep 2025 06:36:43 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b4fb25c2e56so327915a12.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 23:36:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757572602; x=1758177402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HWX0jsMcz+Xznw8DUFwCpjh9opKGeTSObz3aq0hQzb4=;
        b=I81BU1XAr7QjRNG8yw7UgK5exbfbJkkB4VduTjEu+fFCkhFNCDDfhMAPpAxkJnLqPw
         duFTrF9L6A64Do4Pvz/dEmzLAkC0550xZTtY9NvhXklj7wAbsjPD/A+NvUGpbinCzPOF
         /fMXA6WmZBWYM/qx7ZtvWLRxMNvGMpvDSrGpBl6vrHXT0mk98mBNkSLHl9Q2/geAbC/C
         IHpxXRMrnm+88fG5cA9vM0t6nd+FLI+fFlRpalh2MfknNSfiEUzCPNpw5kLxr9PHo0c/
         f3galqyJ1uMpADSVI28k90ALt+Rmn1Vbu+1z/wznJuvVpl0kiHSo5vVGIRK6PxmxUbAu
         sVlw==
X-Forwarded-Encrypted: i=1; AJvYcCVzzHt06vXGLUYTYzQrvExPxMQMlFbB+yarIJaPo0nZms7hpahG5TGJMa3TvACP7SMcRswNN5T6EKsguF8V@vger.kernel.org
X-Gm-Message-State: AOJu0YzUvApIQU3bOrMsNdyPr77QgnrQrR2PrGfYoDIh5zQnsHEenioc
	plF1IsnEnuKmeOzsrOsYclARRz8fNM3mLd1r8LXyp5kZ8NxeQy+6PNvJn8dq9K6HVt9Nhg0OvO3
	cY4L9CsSBwV0Zxg0LFucsSt1yrpXFk8YpKtDDcGSPD02ijgURHDQzxQy9FU46oDpE/GrG
X-Gm-Gg: ASbGncuzDQ/A2av5FrDvlbTot5yqFY/1EJXy2N/b6LDt1nYHHnb/2q0np4FnxaB7iXR
	G5Hz5ARJggko85lnoHnyzsAHnBgWH/RyKRJ7XRN7PHoEkoXRQ+R4ADA3D48dmIaFL36FMReJFUE
	XDR7S9uY83DwmXXYpLwySA3WlvJzDPGEl61cF8RYguAYuykbH4+ZZK7atwI5xpW8xrO8kFXhet1
	M1pLhWCkyYxK/g6N1IhkqfAaFuDx6Kj5pPBX9VDRngmFloJurCr+1EH3DfCBFoT0wNklNu5jSP8
	HPXjb4ioKfvn4+h6uVGnIBvIjLx/yRkQMKdKw7PHlQkr0M45UofPj6w+IQKPibpMkBqawxYhQkv
	o
X-Received: by 2002:a05:6a21:6d8a:b0:251:5160:f6c5 with SMTP id adf61e73a8af0-2534347f671mr26157973637.37.1757572601473;
        Wed, 10 Sep 2025 23:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGQ+PJd2BseHqXuEekWx1mlj2LglhTy48gVjDdZnPnheJmB4iWw19sNj3aiXoyLJBORiykMfw==
X-Received: by 2002:a05:6a21:6d8a:b0:251:5160:f6c5 with SMTP id adf61e73a8af0-2534347f671mr26157951637.37.1757572601004;
        Wed, 10 Sep 2025 23:36:41 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-25c3a84f72fsm7739125ad.72.2025.09.10.23.36.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 23:36:40 -0700 (PDT)
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
Subject: [RESEND PATCH v4 2/3] ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
Date: Thu, 11 Sep 2025 12:06:11 +0530
Message-Id: <20250911063612.2242184-3-mohammad.rafi.shaik@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c26dfb cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VUbThP3hI7wIHPtXhhgA:9
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: Of21kxHDCFFUm767Bl2-1TZ2uqvREzpu
X-Proofpoint-ORIG-GUID: Of21kxHDCFFUm767Bl2-1TZ2uqvREzpu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXxw3x/R5UkXOO
 z1ZfWWiCjz1ed5NqwDNDJYUf3CoK34Gmprwy+14TwrQ4flQgHTA//kt/lxBg6IkhDbCGoAcdJlc
 MHVqOm6aWtTLQ4uapoKR7veRTeBH+00gIZAsoQjp5fn7o6Y8KeLpjmlwK4/S+aEp9YWSNlt1KNK
 ysNW9HHP+XEbTKNUUPO9C2ZcrbN4+4D7Ze2OeazlsJOrYu4a8jxSFlgrQjlEN9ZHyJ2AUyzssdS
 eLZ/hq9VS2x3EquIYwOctA2FgX9avnWK2yPpWPb8SbCjOtAj9uotGgvgzdBqhEZGAJXjzJAnZ7V
 gjm46aozwxfWSjAWfOfkw2rHo4FxVpP16vZkqvix1jAsGV1Ecj8ZK4LyeLsoC+xUF9aL2BnT/QB
 YLz9jAII
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000

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


