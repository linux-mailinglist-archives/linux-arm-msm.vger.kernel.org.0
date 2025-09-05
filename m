Return-Path: <linux-arm-msm+bounces-72318-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 07C60B45BF6
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 17:13:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D74E3189B415
	for <lists+linux-arm-msm@lfdr.de>; Fri,  5 Sep 2025 15:09:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 78E2830217E;
	Fri,  5 Sep 2025 15:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8bMpnTz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1679309F16
	for <linux-arm-msm@vger.kernel.org>; Fri,  5 Sep 2025 15:05:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757084744; cv=none; b=UiPAGdi9namM5Xil2ISTgefFzfysPjUx44Un/3eYvGOcN1Hpjl4ds5KOrhY7R20rGPAf69BiBLtP6g/5QN2XNh73VlJAnQv71ScmxSyrhdplBa/SQbtzfKzVlazn+sUqcbqKKFh2lXNnHuvAjx/zZtBtfGyB9rKVsp7/gOjiPS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757084744; c=relaxed/simple;
	bh=wW7dIF9hg5FlDqjmM6YX0iZNQQw1lXp/0P0KvOe/ibA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WCGt4YFQTVijNCHYabLUmlguqqmg0LQ/J2t0DEnLrvCQGlvY4tLn83d3MNzwtrdMYJ2RvMlp0kU4kbIqXZxGX1q+hgH/ASclpcsSCQYOHKiNDB9l4xRkFFPd2R41+XaMBHNq6ZY9eKyHL6D49HHJ9TsB0hlkhEtktZRhaMeKcCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8bMpnTz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5857JK2e032238
	for <linux-arm-msm@vger.kernel.org>; Fri, 5 Sep 2025 15:05:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=rams1MK76xG
	xbvTN1cUvij9c/QYVcgdlDejUrDnGUzQ=; b=M8bMpnTzdQb6zjIt7wcxk5/qLLj
	k0VtqjhsZGPc/Odh6vsdX7lViuVGNxVMun3TZdW/mgr2Fj2Dukp9TjCrtCMzLgkz
	eOaP1A5F973wcLwBoa8J6ukLxHn5+RvdbkV1k37xWBQAqDWHfopMnVfbDzCCLNpX
	jjbnZKL9kGN3Bl4O3Ed6YMEV+0TcOXCr52Q7vBKAxZViJ6U7g4xjIMkU+PXNSKkJ
	xHCXFxe6Zxkk0i7zFhIj8Yx2nC4qazzv8bMnFYYY+3EGF/aZ/oOVOkfRXuxU0i+J
	4raDyAP41fa/7JtHxJXdqNuXXv3xWKO6E93QN9gcDHRMt0S1yLSgGidYs3Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48upnpkn25-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 15:05:42 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-24c99f6521dso29153955ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 05 Sep 2025 08:05:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757084741; x=1757689541;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rams1MK76xGxbvTN1cUvij9c/QYVcgdlDejUrDnGUzQ=;
        b=LkffOG85svx/spEbp9U2JHSa/53C1ZFAniYUrRmEf7TYnVlzR4715uRdj0w89YyeVo
         2Q3M4+4TJvAn204bv6Tu98Qv4eUz8V3peh7s5FPabFB0WSPFnU3eE8ZtRNVXP4YkDppW
         7F/6bn6TPl3Vl003/MhcYN9e4IEtTkZIGDyuFJ2jVdsX3SjwgvJSbTuDRuW/0aETch/t
         mJbOtVUWk9IBY4K583K5/O7J7aObReS0+h1xo2dnDp39yyxsJ/jFFI1vI0L1U28yjkmI
         BOCQmmNS0KPyw4P8PTe6uyu/JOvd/OtBPjLDXPtYbdE73fz6wB7RVhvr21IpGS5vC4co
         K1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUYZsgqkznCLub07lt5Y9VBjyE+2kw62nxnHZC+/RK9aEYxL06UX6/4LoY8zGyLNuGc/vTPbyxAltMSWPti@vger.kernel.org
X-Gm-Message-State: AOJu0YwjnDpoAI++0WR3T3Wc1ltDAM17c4+HAexuiPp8GjYDxYl0unbJ
	AcEfQiePV+5ojn1iiLhafk78VBlqboWM5JhtR7G8HXGYf7fRKdBzcv52dYIfncM/M/YYGWqsmqh
	WyfbKVLP5WZPx7zG5dsDuCoqKLVDoyPeclAHCzBGvSGWV1/3AaCkxLKG9Ndt8un+2gwjI
X-Gm-Gg: ASbGncvKhfy1qsceMpXfLnThD9C9MA2tatzUswAv0XvDDo26+XcZZJCch4XEBJtnCKq
	S8X0+y9Ks4O1OajBWCR67WoRxz+jzr/iD7F0c/Yuzf6ob9sAwzO3ESu9pRD9GIGZQhyw3B5OBDC
	ZTACx2cVE4109YKbXfflRW04cmuodPI9zuLCg4mfJ8+fcx3SFuVGkWBYBIL/FzWB52buxki//lS
	Pca+wVT1WWasSC+4vi6MtCAupr4QEkGh02VVQniRw7Y9qbJKrAOJN1b5XpTnEPLbwXby5jsRWvc
	atUDC0RyJCSizWt8uhLKoUdGEU1nIL1GnUcI605gZg30F5zCAlCq29FjmfwicLt7QaSEcVK3N52
	a
X-Received: by 2002:a17:90b:5310:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-32ba2b9b3b7mr6442922a91.13.1757084740461;
        Fri, 05 Sep 2025 08:05:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx5KPPwVlb9iZR8T9g1aFHZ/PhPD4GNA1cvU17UqhbW9am2w2sCrWdN4XEZM5Yy+9fYcUdSw==
X-Received: by 2002:a17:90b:5310:b0:32b:a2b9:b200 with SMTP id 98e67ed59e1d1-32ba2b9b3b7mr6442858a91.13.1757084739852;
        Fri, 05 Sep 2025 08:05:39 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcf04b8sm28882840a91.26.2025.09.05.08.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Sep 2025 08:05:39 -0700 (PDT)
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
Subject: [PATCH v3 3/3] ASoC: qcom: sc8280xp: Fix DAI format setting for MI2S interfaces
Date: Fri,  5 Sep 2025 20:34:45 +0530
Message-Id: <20250905150445.2596140-4-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
References: <20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: c7L1DqFhcVvXgVj2l-4l6RHzgtik3eGF
X-Authority-Analysis: v=2.4 cv=Jt/xrN4C c=1 sm=1 tr=0 ts=68bafc46 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tfJ7er6LdcoPz7dJv_wA:9
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: c7L1DqFhcVvXgVj2l-4l6RHzgtik3eGF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAwMSBTYWx0ZWRfX/xBg/6UZhqFG
 1uGE5zgJ+64bi8x0rkicWCYk/xLorTvGI0ikN7NzWvALaAeii7WocWJD9bUSv7HDVi5FuHXH4mk
 HfflkmWOy9bDGqKbE2FEO4aOIPqkeMFzle1zdQVuz1WajdBkOmt/TvWTPeVUQYTb1sPWl3OUUIb
 pFGVHQ9/bu5fcacDTYy+tb856rB0qDGUw0v7IEr72f+YXLksu6bH4fNkyKrh9lL5wNhYi+bzfXI
 yTkSY6aACHf46nCJZ/HFNh2RQ8SWpER6/lvS8VVn/yofQKvwIWERkPvL4ean9itF6+qOsR2jZZY
 /wjRstDT8vfUOsIky/4WADbIrVRQAhsibNg9UNY4Q0yLnPyyt/1isCWSkWUcFVz3aLHG2DFqBV5
 pT9AhB7x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_05,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300001

The current implementation does not configure the CPU DAI format for
MI2S interfaces, resulting in -EIO errors during audio playback and
capture. This prevents the correct clock from being enabled for the
MI2S interface. Configure the required DAI format to enable proper
clock settings. Tested on Lemans evk platform.

Fixes: 295aeea6646ad ("ASoC: qcom: add machine driver for sc8280xp")
Cc: <stable@vger.kernel.org>
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


