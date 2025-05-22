Return-Path: <linux-arm-msm+bounces-59124-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A273AC1469
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 21:12:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3B6A13B30A8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 22 May 2025 19:11:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C33D29AAFD;
	Thu, 22 May 2025 19:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVgc0Cbl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AD3A2C0331
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940678; cv=none; b=FBap4Ow9Krq8fliZmAb9i3XA1bXgBCOvd7ha7q9ZIttTWb4MaJbtZWPilG03qc6hzHVwVVLbOhhN/7VTIOdSz1WF5oaPvfyd6+0jx17R5PtMkeVmikKzpUVVRPjkL0f9kGKAWQP3Ju+WnaeKnjKQgAUE8R198DWe73l6iFlbqOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940678; c=relaxed/simple;
	bh=f7BnpaabmkZzYXks1nYI6/Xm+ABOPZXmoThfWynb2jE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JGsDuUHtY7tkMbmIETC37CyJ/dP+G7EwpIfKWpcSbsnVjmBAo/JJoXuvYg+U2zPvsQnjLmTTLV60vrV1UnLoXhSkPODviZ+AazG8Wu35/1sQlK9AxsVZObexuZqAlWw+kRqZx4kw4RKRVBd0OenhlkLEITwjY7pqymXgf5fl4Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fVgc0Cbl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFhLNg031739
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7HsiO9nvlxXdFJJDBzSKNq1D7dmn27MSBINb3D3hdKI=; b=fVgc0CbluQwyKtgN
	RYN1D6CdZ+5qOyJDwLFHfyO0gSnodZAbQxuBqnUGjhhdlurt9290Z+AbdH9TeLLW
	fiqnArIR85NI+z7D2wKx8MYqYfvUiyIcqd7UPxWfeRfYtDtl9HFCpph5AOYISFG9
	W0U00KIanxja2ef2Z4clloY9SwlilxjAznS9c9LPfL2eZdAh/1VtIN7li+grMxHp
	27nGkCdcyb1fk/fRUe04gHU9sXpLxOpwhoQBMlOmr4aPyNTKVsL3n82WOt2ntiVZ
	3eJTaXMzaB0/CNshXNHjAxW6qcjCTLfcolzIGmXCgAa8CUM3V5g0phWjvh35SvSM
	+bg0Wg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46s8c264fr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 19:04:35 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so1469732085a.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 May 2025 12:04:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940674; x=1748545474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7HsiO9nvlxXdFJJDBzSKNq1D7dmn27MSBINb3D3hdKI=;
        b=mjC8iO2v0ShgJSVVrGSqStTs5CGFtlWCYqn5mz/nVf7F5GrxEp2nciy4pgKA68Lmce
         MtSDnDp2S1jPvC5La21sjj3a6/tsZAnciGNkuvTInf2y5nVE2/Rd5qVkowwhkCmiVtbX
         X0t2Cwk9zKCx+p/EEQPK6vGZuOFecLZVVKymbxa3leKq88Vsvb4ptpm3sfZ0bn3nw1cQ
         Z99bLYF7vU7OMZ7zJQio4tjMW7WRA6hhMw+9djAIyQkviLWS1KU2+qm9vTkbFykJbUsX
         OfXQJupstfis0KVhFnpf8dhwzPdNoVLpWUpZWZukijVd2AT/eEF0Qnq9inrTr2/YHQn7
         4QlA==
X-Forwarded-Encrypted: i=1; AJvYcCW+CKWF9ENeYPfdaAIFMOYGAoDr6KX+nMP2obo3phPLZhj+oOPOIA5vCW3bJ5tML1L71b3XgRSDmJEbvyEg@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0LZHGq9oQA2e/dTAnq+UcwlkXtBNKxyKlchnPdEzlrg7WmphL
	EseHO4u0URK0R2OhzNsdVXnsE65Z1Qyap/jT6Lnoc4HoFVHVJdZpS9siVYnDVouOpzprRKkjsGL
	VVi2nyeJh9+Y2oxjpZtHj199S6fTwV3lgJPGi+TzFfbEbQ48Ff62Zlpr5pe3UULN9Be5A
X-Gm-Gg: ASbGncsILihAC1Re5yLG67SShs2QlnJseDA4Eq/SwCfX3MAigfCrBAPY/mCpEAlM0qp
	MY1dlLkHDXvXGxUqqC8XeXuGxx6RQqSfYFS9vgXauQlAR+vOUqMPgYWZIB9m00uxiN8fHqjILGm
	U6bdqmQbntCkfdifxAH74E7Rn58iHqcWm3xKiBSWBX0Tg3WXiZkzQ5GqICD9Y9E2c69Daxe7jc6
	UKL/JOGO1ml8yAnTwIeYv64L9lxQ61veDTlRnJdJfP+FR4qN6Gu4+27DPeQbb9JbvnFxj/ee+Nl
	AK0w2qVo/WTDdNWcdDiypRlJPxp7udNhyfx/McoaT6++9ZeOfjnCDqnrAe1c4A4VDyLBF6AOmWn
	fUCKzabjbj7GiWUNSIddmC1g+
X-Received: by 2002:a05:620a:4411:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7cee3230016mr7530085a.30.1747940673705;
        Thu, 22 May 2025 12:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJcXEgTURECrguAMGCJITwpfPIaiuRByyUvFM42DipuZogyzdEEtK6OQENBI8j1ynmBL8qgg==
X-Received: by 2002:a05:620a:4411:b0:7c5:61b2:b95 with SMTP id af79cd13be357-7cee3230016mr7526085a.30.1747940673287;
        Thu, 22 May 2025 12:04:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:39 +0300
Subject: [PATCH v5 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-20-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=az28wfky32U5SgMhpoF+tYvjM19a/MptsxvGvB1wCoU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+kgJRh0VJUkdpLWj7JpjFCqi/7X4kuLv9k
 r/eo2ZnnG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1WWjB/4rL52zxUufz7e12/e0wnxgWgUeafsbWvO7tRUXuNgJ72N3GPODg+viUKOLpSrhYK/nPR0
 7/i211xrp36st9uOaoYZspT8qWY2SwuWkD+SA1beG3gELAbOCtjMcfdrmNLC8Iv++q8cCIQfhqM
 FZEjPHeOUQ/2Kzxq39BpW3GlzfFqc6dfBlbypKA6Ta5UwMWO0/ETLg4ybJdLsTvsgDG6/FJxCDB
 igMRCIHxhcCjwNuYN8DTm7EGEnu8vC+T3bQOAUCKA8NmcvUxj/nVbL65RSBX0KzqQYBKNDntIpi
 v4sgwJbkDbkIokLx2JuPLCq6S9nysueBD8GUVVSRJZr3p67Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX0lmdx8rjolyl
 iJXAteOfidqJx2TMCo1W3ejkKRUPlYMWsW+NmWMwhAP2oc5UnCyhxpIFoIVd7vfJeDsEH0aWLK8
 5GBnG0WiZa60XjVQWVhIYvIoCeXFCtFbtmui7Uvw73gbzqKV0h8yrnoVY2nIWseJhKAf+A43TMm
 17ePX3Pm/IuyyznYgm/x8/q7CP3qko3BU1rk5H/xX+rccCNBzDEGZsb82vfI33sNQBZC3aO37aF
 gMROckb+B/GEDgZEVEHWwh0yOlL/Eu/9k/J7rNoGBrhS+q9n0bUmq1Kh2o42XeAorbc3BOvpuCp
 JbTS3KEGYpSd6dxJFY7+80AJb4PLamtHkLjUnDdZoeXyemijfdAZTdEYsxOw0vPDTEAaHSiQaYt
 NJYA6q1dM+JQwJhCbVm7LbfpZuSvQjEtS4CN8G2rwS0gzf924rIN+AuJRokSLAQYiLqd9BSJ
X-Authority-Analysis: v=2.4 cv=RIuzH5i+ c=1 sm=1 tr=0 ts=682f7543 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 3a7X-spqKQpSgytSNweIbilqy5FOHkTA
X-Proofpoint-GUID: 3a7X-spqKQpSgytSNweIbilqy5FOHkTA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 suspectscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 spamscore=0 lowpriorityscore=0 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 4 ||
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


