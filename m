Return-Path: <linux-arm-msm+bounces-72468-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DE467B483A4
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 07:37:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 87240163B12
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Sep 2025 05:37:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39304224AEB;
	Mon,  8 Sep 2025 05:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gpqscwuE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B77FA2253EE
	for <linux-arm-msm@vger.kernel.org>; Mon,  8 Sep 2025 05:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757309840; cv=none; b=nK6xTSRMAL6KVJ1L9bAuT646wtDimEXeWSUtbI9/verXGq1ucwZv/dYwP1f76S/cmrNh14UcgH5BTYIefu9zDOfhqzppr7xtwSN+lHf+/6j/wJmmlYFJquNHZ3P7ppxANIkzfkB78eXRZTVPH8Tt8xDjdkC+qHKHwR/yOCVZrpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757309840; c=relaxed/simple;
	bh=CaB1TNSUbDHyyFdrQnQBPgQfdsRu1OOu0HhAAigiGDA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=iDtjzQPazy7KAWiXFwo6VbAXi5dD+Ap/jwOrjQvkzDLM70TlPRLmHiW3hUASwZRNbqlNGjuiIKA9O5h9y23ymAKhG8HX1Qv9lUAQcjr7WFP1f+fIph5uEU9fUuOAD+Nti+tARzBXFhYi80jQX8ohUZL005M7RKec2cfvj4e5MR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gpqscwuE; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 587Lj3WQ012802
	for <linux-arm-msm@vger.kernel.org>; Mon, 8 Sep 2025 05:37:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lD8cwxf7MZ8m4wMdcW4NqOMxZLJgf7K+8dM
	uzZNQ9+E=; b=gpqscwuErW1BX2hi2kz8Nlw+r8zmPO2a2Hq/Ek4uAW9HqgnSiz7
	tzY39FjHxH2D2hL2m9mxYieGHRF4BjoWp6fF6OUvFskRWo5s/E3uJGelWSvdY9CB
	YI/U792TtBcHXRzOu6B/qXs61vRYRDKsnQuYCFWDQZaP0BQtuhT1ln+gd42WLFI0
	5FbiRPGjo4GmntP2ARDYvSE0vQ4XPAULVKfQAsYcnO/JI6ljKns8KTWOf4SkyZT8
	owJ4i2eVr5Rk3xdzttX30PQBALTcZ19efp/XJtWm/Z2n5zKqdncMOlva3iH0/ifb
	mRii0nxTCZR+8ymh6UsOPO3w4H1rZ85XvxQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490bws3dsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 08 Sep 2025 05:37:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7724877cd7cso4594615b3a.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 07 Sep 2025 22:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757309837; x=1757914637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lD8cwxf7MZ8m4wMdcW4NqOMxZLJgf7K+8dMuzZNQ9+E=;
        b=tKdfm1n25Zy/cKTPC77cGa6aZKDIwprqpXQjycIDovcxr9JdEoTfLdQQH/isYn91LM
         nKmDhhblGeYrJW5LZ4aoeSUlycCzQ/ladit7SvJy445RUhXJlygwNsfaL68mRhaYu4BG
         91mo7JgCehdPjFYMeWXQrAtldPfix9ycX/Y9VLtMyDFCy1HNUErBGZOICFkZ3TSvVJSo
         lw237cnFESrdS0y8uklVG0aX/Tqc4N9YGIZhEXFtf6VVrHFy0kXf7aOad9t3Cr/+khpq
         HU9wEnpoXZ0lO3GiktGQoOLRON31s9Zv+7VtkFxopLOJxzksi85rm8w94IBcuF7m9B6P
         FKHA==
X-Forwarded-Encrypted: i=1; AJvYcCUIhTAuIz92tg+N/5ZcxX9PwYPUA0/dZh0JjVHRFm/faZQDF6d7YyH66l/zHspnpUjD5fJ9LSigMdO7WGTr@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4uJHvET1W1MqB9hEORYV4mUjBUs1CKnO5Cwzw/gRQmN2/qp9L
	bVho+Brnpppswz3T+UsdtD3mNULgy5+LP6O8QGSVAMcOIPr/cSExlyoDwLOYr38XxnwMJzJr40V
	3y4dlAsX02DCwa3St2Ld3f3kYUPGdhMfBpfiEj3xA2pJ5l05COtDn1Y1K3gJ917j8S12j1CgBsK
	og
X-Gm-Gg: ASbGncsu6/6etqsctUzVhSWN4RXx6UOG5FFK+L2NEahUhFnULBqtw2be7a/+ZRkHLOs
	hVI5gdw8oHs9lZIciJAcj1frhqT7W97xwcdP+44dHPXu5e0j2fLm1FBb5e8mMXC9NP99ayPJhht
	I46XPiDmbcZJHgJlyvkgVUaJTrit8gKW3SiK2okSjUJVkVTAypFMKl8ZkP89tffYER827lbJy1e
	rhQkMSX5A5uvTVcH63u4bldwbtpHb+bhEJulXJafyTvnCbG9U1YxgGDycVtdz8j5ptXuXOh3YQJ
	eeCk27vzGZkfRLJFOxUJu5piVFv49+95GceLXu5kpey3r2NU2ZnmFYGiDqbM4SXKX8Ar8Tqu+ID
	u
X-Received: by 2002:a05:6a20:3d88:b0:246:9192:2779 with SMTP id adf61e73a8af0-2533d60850dmr10791546637.7.1757309836696;
        Sun, 07 Sep 2025 22:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH57rjgychLB7Qf8P+tE8Tlb0ThhlaBMZviRf1StqzDT6yykvqMOcWbNKfvbcwKGmoSP5L4Zg==
X-Received: by 2002:a05:6a20:3d88:b0:246:9192:2779 with SMTP id adf61e73a8af0-2533d60850dmr10791504637.7.1757309836229;
        Sun, 07 Sep 2025 22:37:16 -0700 (PDT)
Received: from hu-mohs-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a4e1d4fsm28013488b3a.73.2025.09.07.22.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Sep 2025 22:37:15 -0700 (PDT)
From: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        kernel@oss.qualcomm.com, prasad.kumpatla@oss.qualcomm.com,
        ajay.nandam@oss.qualcomm.com
Subject: [PATCH v4 0/3] Fix lpaif_type and DAI configuration for I2S interface
Date: Mon,  8 Sep 2025 11:06:28 +0530
Message-Id: <20250908053631.70978-1-mohammad.rafi.shaik@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: C_w_L54qeQHW240iF9oiiQzgCyyyjd-7
X-Proofpoint-GUID: C_w_L54qeQHW240iF9oiiQzgCyyyjd-7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAxOCBTYWx0ZWRfX/KMiDPSdOOqv
 yLzEgR+gNmaDZXofGLLWMQ0MeMKZIzDs8oHzoez4PtPM/a8hfg3gOUahERhDcrV/t06ssOBtS2S
 VBiH9lDLXCBjB4TaqT/Xexp8YJkmOOBggxAtQ1WSyYvIEVAbnS99Ll07WPWhx+uAbgqBneDY2zw
 whqY/iee45dNHACAMySJHxJitGHw+BsGDQcleii17TNI/yf6BoWJOMX2WAhLP4UdAjELrS9xBv5
 jX9S3WwR0PlnFc4Q/eHex1Fl6IKYKwvOedHaV14WfVyCGVlsNgcj0Gi0Zs5oTipPv+l/CD6h4RR
 2vTHGfi1W1EnXEY6iCwZqiUKOMLx57ZnAczYz0czMR6G7du1bhPYfGJE9rhK910UV9I6lQSJFG7
 bI0nIy+/
X-Authority-Analysis: v=2.4 cv=G4kcE8k5 c=1 sm=1 tr=0 ts=68be6b8d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5HF5tzHaENt2U_M8s7UA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 adultscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060018

Fix the lpaif_type configuration for the I2S interface.
The proper lpaif interface type required to allow DSP to vote
appropriate clock setting for I2S interface and also Add support
for configuring the DAI format on MI2S interfaces to allow setting
the appropriate bit clock and frame clock polarity, ensuring correct
audio data transmissionover MI2S.

changes in [v4]:
	- Updated commit message in patch v4-0003, suggested by Srinivas Kandagatla.
	- Link to V3: https://lore.kernel.org/linux-sound/20250905150445.2596140-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v3]:
	- Added Cc: <stable@vger.kernel.org>, suggested by Srinivas Kandagatla.
	- Added QUINARY MI2S case in patch 3, suggested by Konrad.
	- Link to V2: https://lore.kernel.org/lkml/20250905104020.2463473-1-mohammad.rafi.shaik@oss.qualcomm.com/

changes in [v2]:
	- Used snd_soc_dai_set_fmt() API to set the current clock settings,
	  instead of the default WS source setting, as suggested by Srinivas Kandagatla.
	- Link to V1: https://lore.kernel.org/lkml/20250822171440.2040324-1-mohammad.rafi.shaik@oss.qualcomm.com/

Mohammad Rafi Shaik (3):
  ASoC: qcom: audioreach: Fix lpaif_type configuration for the I2S
    interface
  ASoC: qcom: q6apm-lpass-dais: Fix missing set_fmt DAI op for I2S
  ASoC: qcom: sc8280xp: Enable DAI format configuration for MI2S
    interfaces

 sound/soc/qcom/qdsp6/audioreach.c       | 1 +
 sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 1 +
 sound/soc/qcom/sc8280xp.c               | 4 ++++
 3 files changed, 6 insertions(+)


base-commit: be5d4872e528796df9d7425f2bd9b3893eb3a42c
-- 
2.34.1


