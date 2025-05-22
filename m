Return-Path: <linux-arm-msm+bounces-59126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEF1AC146A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:12:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E9BB21734CC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E7C22C17B4;
	Thu, 22 May 2025 19:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ELqIjsQO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4402C17A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940684; cv=none; b=avrKj6T6CHXKru+wHpQ4MDOLI2uiGORg81zTS4jYjJYfvb9jpg08R3MYJ4KIB4bHjtwnX3Dbq/NS6Wcvdo5B0lqoIhzqL5QIB4hL9pNeZJMC3cn4H6pWaoljF39dbpU7v+qr87e29JiscRkODA01VEwCalWb74CHWlBF6qInqtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940684; c=relaxed/simple;
	bh=JtnwSzCWHzwna/uyn/h/bOlbUw6XPXd/lQWqYDReZGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBYNz9XSORmWZHOe3ibFtRW9mZSEJ9MonxAwKV+1L5/HSZ+ptx/M+j483G0t5ELkdu2tSFsBduKOh66uD0yqlhCk9e5mHoUu9FNUc8K4GnonvUWjcVdhTXEVFLlCfBDMg6tisG5+T0dcFKAZDHd/4js+q7gQj3JHAMSaQUio8Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ELqIjsQO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MForOC000808
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bpN/CnUlP7ExEMFJ6Lj0n+5sEZlYXBRWKrZN9ll5aNo=; b=ELqIjsQOOeXzd/d5
	9zO+E71GAEOLoYz1waVrrz/xjI0EZUK8IQ3kRR0A17d7I/jPK9IDd+pkIWPhhlh3
	/zak7vQjGChhQ+hV4YuDPVSYOUzTgWoCYaR5y1xmEK3QIk1phSY0AycizMcBiVDe
	NEkK1AJ9MB7x4DXMNlr8dGXgksUPBJVSXBidP9hyUy/PJeBbH2seOAG0pHw84CHI
	EZW9oSr6kb8PRRT4KJMNvK86U8nudxCzDcWeLW2UsMmnSVhFsWxQ8UtwVw/FdiaH
	NaAi/xMFpk3CTOnBQdAbEHxUHC3rQNK8Gqe/C5eN1Mo4M0UMxDdXaQaCR/QnIgSp
	7tkV1w==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s95tntjv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40635bde998so179097b6e.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940680; x=1748545480;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bpN/CnUlP7ExEMFJ6Lj0n+5sEZlYXBRWKrZN9ll5aNo=;
        b=XQslYQO/WZ5QBGJvUec54HcdYhRIZmeGFkgwwQBlHMHX9p5uvM1MJRLSoio9KDPOso
         aTyG0jM2M4a9xFuRWb4XUFvAEgZRUVbeC9eewnKshamvfoZpduBCred5Num6cGz0IUro
         FGnkV+ADsA2aBIRC/nHzbQjxoN5JDDhT2XDxAcV0z/PygbbeAtHUMSSiliYWEVjnXl7Q
         6Q1ZP3SO1NTHI+/9LqGZvNrove25aDbu5IPBIH1YLGxd1UemcCZXDNSda3+WBE6VpQ4+
         D2/RDWaj6E0JeZQGPOQfFibRYfTk2JjwfrYXdW48CjxzbJAdHeomvL/+j6CWnLcm9HFq
         pmyg==
X-Forwarded-Encrypted: i=1; AJvYcCXzF2aGnDeOUxV9UJxpI4AaPGFLu4o8JumI0lhMP84QHmCeXr+CvK0YLCLdlAx3JFwMa6qpHRpmCxEjYMk3@vger.kernel.org
X-Gm-Message-State: AOJu0YxACphdGIVwbQaNn0yEXn2Y8Koab4jTTYts3t9EHTl0mycqF3xb
	8Tu2VGCWKPDEgwnnN/TVh1qoFYI62J86ymYv90vjJ0fZ6t2ogC4MBerxanXRbcJwqi5Mf00Cf5+
	83Sgr8hZIUlhgayz5clVlFqjeaI600OP1G6vPodP9vh/RuyxlPT9k7w6Urw2n09MnO2Bn2ykpW1
	rd
X-Gm-Gg: ASbGnctBsxd76exRHRHvoe3tPajZpr/1mtotEAHqh7WXuprEU1sZ0cAJT8AoROEt9+1
	8Zv738bJugZBoBLnCm5hXV2OE2vSwS65puTYtc0A2r5eef0hZ7LKhUN4czrO7owTG6cvynfJR1f
	x5/L2tBT0+cPOMkE1EexbkQH5d4YWoZZd6q21s+U02rmYKt/CjlEaAAJuR4BRwkJunMdAMnFAnz
	4YLfAlHYL3ZgT84PxvZNsjb/GJZC+6dViCOlcJILSS2rxiW5FFk8w7fAvbZY7NhnVJrzG+4hCKg
	GoCvYNhUrKRNNDWQTai7Fqq6y9r84mMVkkgHJTR9pfC6IuOIOzMxQSMy8eLm94sRMfPA05nBf9R
	KTEPN24BTv00FGZyAboE7n/Xf
X-Received: by 2002:a05:6808:251a:b0:401:bb42:700c with SMTP id 5614622812f47-4063d081bb6mr515418b6e.19.1747940680289;
        Thu, 22 May 2025 12:04:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENtqBQt+1WYZNwKjioV78TnS+WxdyA8WhQwdOWtpOws+o5tY8072/kvApkSjMAxq5ma6aYew==
X-Received: by 2002:a05:620a:6290:b0:7c0:a1c8:1db3 with SMTP id af79cd13be357-7cee2264493mr125658885a.11.1747940669485;
        Thu, 22 May 2025 12:04:29 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:38 +0300
Subject: [PATCH v5 19/30] drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-19-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8072;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Qi0NNNo/ojFGNk6vS+7/bJMwBSgR2imtHjPMD1duIkM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+wySmWg7YfVngh+Td4RycmAZl5rljsGgEs
 WySFuwl+AWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1U9eB/40od/EbrZgTV/Hf/dOGbu59uGgoLNGpP4xxBPkpiO9O+8bmNGuL2Fmc4TiqhlFuE+/vyO
 UhsB8MbbmVa+m+QQK9QLJpUIMfQ/HmD8sSy3PrzAiriXHEDc0+6Sd4xvFKxV2XtB8GF0Ae340iw
 6r+z0y6ICPKDxEtRVKhhtdQOOcyiVdVNQWNzlsxktgS8BwE/aAy76d0sKvrLnMoBmoyyAuIk1s5
 m2W1IM8eHy/gB9ITjbAZnTG4/ryojO1VOCwCDD9bf99V8BUxBeYf3l9TBz45zQbx6mj3aAUl0RV
 pp0hgJYzX10FaJtk4GRx0rU4wS9U9y+2Q922L89I3gzNjm/f
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QKBoRhLL c=1 sm=1 tr=0 ts=682f7549 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mpK4J0can4W2gMZkP7IA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: dU_DRQPriEfT_nbxlkpQpdUOmu2DUwL2
X-Proofpoint-GUID: dU_DRQPriEfT_nbxlkpQpdUOmu2DUwL2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfXy7mMKsVHmn2v
 GMUIfbxu4UIO2M/C1uoYezreMU2OVYNQvdBy2QFZwT46A9gOyIFuAKkRS2vk5XQI0mIpL+A0mUo
 0VRIN6sqC8jaGuICxUAtTc+0LdgymqD8L9ATZ38aqQkhiI15/uvQDEEkO1z0xx6BoZ+A0eZRgQS
 xvqHRBHEGdxeXdDcsy2pmVHiMwcsT7Hi9LLbE2FAbIUoGctjQp80wBnNSmvZnHoOPVmZqvlcMJe
 7wMnXKYTj2Jrxvg9SpoybEZ9vhQuGtWjS6lYyLSkK7mBko9ZvKsXhIauD2uiWpVempIYwnnm9N2
 iFB9JgQoa/gC6XvZaWMxcVt1ZTnPDrQsNLDaKKBY4j2xc2iINK80PvgEzMxDtDWjIKoGd2rLkc6
 anH5HRPZgknDbB28WNCBizRhek09rXc2dhTGdTDQn9Bybc7w4ec9F8qSBRS2FCNHuD3GshcZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_PERIPH_0_REMOVED feature bit with the core_major_ver >= 8 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c               | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c                  | 2 +-
 10 files changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 37c88b393c12d8a04395b6e5dffb67211d2db9cd..ae66c338250664f9306a7d431cfa18ca07a916a5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8650_dpu_caps = {
 static const struct dpu_mdp_cfg sm8650_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 785ca2b2e60f073b0a2db0c0c4ed3b2722de033c..85778071bc1347008dbe4522aeb9ca4fd21aa097 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sc8280xp_dpu_caps = {
 static const struct dpu_mdp_cfg sc8280xp_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index 1401a84e0da5754fd2a3661d1421bb9b998271ca..f9676f804f9132296467bc751e11036696afa942 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8450_dpu_caps = {
 static const struct dpu_mdp_cfg sm8450_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index fbbdce36f0ad99d0b1d32d90627ff5b7f3fc2fc9..7462cfc4cf8de4a10326c83d3341dbee76e437e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -20,7 +20,6 @@ static const struct dpu_caps sa8775p_dpu_caps = {
 static const struct dpu_mdp_cfg sa8775p_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index cc4413432cfdc636e38a56011d39f18d7e94c23a..695ae7581a88b36fa1f28aa3cd0c9166090e940c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sm8550_dpu_caps = {
 static const struct dpu_mdp_cfg sm8550_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 32f88533154584dc98a515b1ddef27ab2005fecd..9a25113df5aec527baa514aaa61f2b47c2443d27 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -21,7 +21,6 @@ static const struct dpu_caps sar2130p_dpu_caps = {
 static const struct dpu_mdp_cfg sar2130p_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index e053324d76a2e5020e6a7477ddadc9f7d94fe57e..54815c613f087454aa7b4befc84462265d8dfc23 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -20,7 +20,6 @@ static const struct dpu_caps x1e80100_dpu_caps = {
 static const struct dpu_mdp_cfg x1e80100_mdp = {
 	.name = "top_0",
 	.base = 0, .len = 0x494,
-	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_REG_DMA] = { .reg_off = 0x2bc, .bit_off = 20 },
 	},
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 92dfbb5e7f916bf32afeffdb6b843f1da3f3fd44..d3a7f46488a21e81a24a9af5071a9a7f5f48cdac 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -32,8 +32,6 @@
  * MDP TOP BLOCK features
  * @DPU_MDP_PANIC_PER_PIPE Panic configuration needs to be done per pipe
  * @DPU_MDP_10BIT_SUPPORT, Chipset supports 10 bit pixel formats
- * @DPU_MDP_PERIPH_0_REMOVED Indicates that access to periph top0 block results
- *			   in a failure
  * @DPU_MDP_MAX            Maximum value
 
  */
@@ -41,7 +39,6 @@ enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
 	DPU_MDP_AUDIO_SELECT,
-	DPU_MDP_PERIPH_0_REMOVED,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index cebe7ce7b258fc178a687770906f7c4c20aa0d4c..c49a67da86b0d46d12c32466981be7f00519974c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -272,7 +272,7 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 
 	if (mdss_rev->core_major_ver < 5)
 		ops->setup_vsync_source = dpu_hw_setup_vsync_sel;
-	else if (!(cap & BIT(DPU_MDP_PERIPH_0_REMOVED)))
+	else if (mdss_rev->core_major_ver < 8)
 		ops->setup_vsync_source = dpu_hw_setup_wd_timer;
 
 	ops->get_safe_status = dpu_hw_get_safe_status;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 1fd82b6747e9058ce11dc2620729921492d5ebdd..80ffd46cbfe69fc90afcdc1a144fc5de7bb6af42 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1022,7 +1022,7 @@ static void dpu_kms_mdp_snapshot(struct msm_disp_state *disp_state, struct msm_k
 				dpu_kms->mmio + cat->wb[i].base, "%s",
 				cat->wb[i].name);
 
-	if (cat->mdp[0].features & BIT(DPU_MDP_PERIPH_0_REMOVED)) {
+	if (dpu_kms->catalog->mdss_ver->core_major_ver >= 8) {
 		msm_disp_snapshot_add_block(disp_state, MDP_PERIPH_TOP0,
 				dpu_kms->mmio + cat->mdp[0].base, "top");
 		msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - MDP_PERIPH_TOP0_END,

-- 
2.39.5


