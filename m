Return-Path: <linux-arm-msm+bounces-58497-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E256DABC3E1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 18:09:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 289B61770D2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 May 2025 16:09:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E5B5D28A73B;
	Mon, 19 May 2025 16:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IMUY1qn3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2139728A71D
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747670703; cv=none; b=WDH7XRDlAFFbK+BtO8wX/UZJ2UaFQqmSs9yCEXUz5ouCJjx1ViYIqYRPquaSoXnQoypBmdfNh6DvEcT6mo5T1YPVIaf2qC50I1EFx4F/lUbWWqQbitey8ixcN9w/G0OaSasiXo6+Eq7wkSv8qOuAkXJH3d1cEhwq2GQxlcVm7pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747670703; c=relaxed/simple;
	bh=14v85dIThTPtbuPmwrXTTaE8w99iVl3YRryi1ZqbAgc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ee4HSwJMwBuiN2u0Zo6FMg1LEMcYekivdWdk2TKnqCQ/fnKxsYrufnz6Ee6eTSnyq5nx7NsqNAUm74Nh2abJkJCxkFMWBj7CcVhJAClDhd5cGX1rYyg2mLraCurU4+94mvNRnO2dIZ7BY92qO6zgi5y7hJrCja24v2rOG0/UDZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IMUY1qn3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54JF0226021397
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=; b=IMUY1qn3awswp/IF
	OmB0H/BYTlsH7TBnYhohJCpnDa0QfMgpdUmNcYkpFCzUJ5j6CKb4eBioBEMpoXfu
	YjiOcF4Xjw0DiuWPu098C86szSruaQd5sSsitj8q2TnIEBCpm+RHjZUCcnXVOk1X
	cUg6GGyccLv2GXRAcjrS5wJFsNZQHoxji7Si2jaCbuAXEBr01glCI58YN4ytWRpl
	N+/IFNdVcEY0g1uERZWPmJ62hPZX5z+5IEN48OVEzk3jFy0N8nDdOUkcpyht45Tx
	z3QeGlDuSbYXyv2+Ig6R6fdElIBcmR70aJvnVSLDAfqqUW2LxudRCYU/4NfAHEi9
	sUv0mA==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46r6vyr5s0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 16:05:01 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3fa52ae463aso4440606b6e.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 May 2025 09:05:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747670700; x=1748275500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EcC/gYHWoR+iu7KJJ2uXlU81DDxyQoGxWssx2fzUbdw=;
        b=C+TH9R04AOI3Da0of5l0Pz/S1pXG6JkOzfCBvrJn0T7dDZQ4oDOwsiRIb9jNuwFJUU
         cNBMdVhZBntvoe5b5N4miJdwgxaTldzQUak2XJNYxKAkGOBdRI3KekH7yeXWBoFNt+zm
         juB9Pq449YWvj3sunIJXn2I5OVasSrgQy7Q39auP6TddFzamTi9h/fkLdmZwJaDGTvPh
         l3xMA7DPHawi55xT/sY8npAHCVIATwRQ3p42ydvipS62TYP01t/IzaGYvMbVlrHQVx57
         s7xBn3AP1bccDQSz6vKw2zPehcDf0OTd4XjLut04EsO3XBLxcbNypYxAD8Ja7CkhU8KJ
         PCcQ==
X-Gm-Message-State: AOJu0Yx/+jYmV0yv1Bq0/1cx+u1iuvJ8tgqtj+I7Olzy+gpzDrXWfd+a
	+jGyZnjBC+E+Z2D6xkFlTh8uRB6umw9VF7VhaRuzZVLh6/cP26EYni7nJ7JjHjQdwVfRdrs9yEo
	xTkrQlCxyGBzWEJprAFA/3OSgNs99gEwd4SUez/DE9qM4SXBejXDASbObn0SUuk9P43zY
X-Gm-Gg: ASbGnctUlzjtYL3mNd80J6vh7jUWExkmAb6fbz9wQJGo1HlxjZ0TozUXAXUvnVHJerI
	84rOuzdLaCakvuOw4QEp2fxOVGAmMULCQM8VjKvTT4DmIvkUi1Q6hJKOn8bmfnkvLZBAC4mQh4i
	Zi0srZR5MIV7tVpw3aTutL9KJ8Ht7waIHlAznPcU7TR+4j/YaehsIyH/WwVgVEZdFnWKe5U+5ky
	uyUprEsDzeJayPzGm6dhbzRudNEJ8vce0fZ1qLoiUTv8TC57DtCUHd4BKTyuNcjRXyrP94fVIqB
	dpEMAYZ42xoRoO0RaY0TsIz4Z+RmORjmzpYnFl0ScKHnZnQ2YnrilPafSf26agdyVR6smNwz+m+
	w+mnyIfTKdPgJPcXasGTdI45J
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id 5614622812f47-404d88068fdmr8771213b6e.28.1747670700239;
        Mon, 19 May 2025 09:05:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyzcW01pX71dS1sAOYRiLBWX0d/KLCmHb1i4QId1HV/+zFOfyPK66kJTMlnD6NrzfYSkV6jw==
X-Received: by 2002:a05:6808:1649:b0:3fb:46cc:e08 with SMTP id 5614622812f47-404d88068fdmr8771140b6e.28.1747670699576;
        Mon, 19 May 2025 09:04:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 09:04:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:22 +0300
Subject: [PATCH v4 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-20-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=HAI8Ve+Cj2eUNr5mYSEgP72ltCdvLNDcdsj28COl2yk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z8BmXJXf2u8JXfW1972eXfGG/4AEqY8ZPT/
 5He7tJ+Xn6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWfAAKCRCLPIo+Aiko
 1XpxCACGoDLLweKclOAJ4QyMyeZPo/7qE7AVlXTgbgg9yI9wyXpIxzC6BwY1D88meLjpxlkkRVz
 NJ7dj0im+gGkFmLODBaYNCMgjPcAG1bFm351k5EjLGHnMBgzMpJEbo6H4YC6hGM6/Gm029g+yHm
 I7vLpMIR52D3egf8p4BO807z5K1PJb3w35WwbSMeFQ0LnZ2YEuldoSuzAW0FAZEkYtP78nODjEc
 3ucO5EH5CNMbrciHEkUTf0iZTwW8/Bscir+Jwg/3UHrhTOgEYo2xerrLgcSbwHYMWB3VPsKwsNQ
 LqV1Ga5nVNkqyqR1XbeF2Rx1V1lRsplCksa71Bw94/KRjv79
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=NfHm13D4 c=1 sm=1 tr=0 ts=682b56ad cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX1nqnUkrJt/fv
 rt4IrggaA1AQGZ3KQKBQydd7IyH/z/zs9LU/QhgMc+rt+qD6uxmp+9OnCAgzJ/hGpJG6wQ1+V0O
 IjntpH+Vv9w2tieMTbkOw86nojhqRJNRYiSu0sfZrYo+GovxnaQvYndGA3WaDKQ3Sya3PuxyZEG
 KRvoXs3G4eVsRC0KEXnAXhYFnsK9ld9HkSf1OO9gYKzah/mxaA1O7NdNRRU5HllAdk81AoGIF+i
 5lgPFf1TWuMTPAkenTAY2a0vfLAAIYH4RHGMEn49QixotPi/rhbia8j0hgMsVVjQFqSipdEKcCo
 AL0jRIHhQ0gIiBvQWW4JnVP7gMHEZzxVAa49IBcS1bQg//CH25PBln8VG9hZMk3eeiVYBuXFqiG
 qhf90BVt2Hp23SvS+x0LxKeceOxBMvNsfvagekJIsbg1F/4DTvMOyzg6U1yF4XuueEYBV3PP
X-Proofpoint-ORIG-GUID: MI7-MZ2Q5jLsTh1euq9JD4pBDZwzfuXJ
X-Proofpoint-GUID: MI7-MZ2Q5jLsTh1euq9JD4pBDZwzfuXJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 priorityscore=1501 spamscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 impostorscore=0 malwarescore=0 mlxscore=0
 suspectscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5


