Return-Path: <linux-arm-msm+bounces-55322-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E076BA9A826
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 11:34:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1392B1713D2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Apr 2025 09:34:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9EC722367B0;
	Thu, 24 Apr 2025 09:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mkwe1y5Z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC53221279
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487066; cv=none; b=ntOeWZJlQF62X99lneQ2hgtARsh22ntATehjd0Tv/326BxrLZNUr3qXR0SzPuGz6+aZqqCwg8ksiRmAixwq2D8xPr5hstF0wLoQhCqn2fDhwL8LMZzGzkhjALxbweWbvI3qFWs4WErr1M3cL6myAsCQyaZ0YaCYwnC9W80ENuG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487066; c=relaxed/simple;
	bh=n5O4ww1n3+SMbT/TIK3jOGKdBMWSn6Zb2wDw1RidMsc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RBtYHri/h7DGk4zYQraONZm/vc0loSe9nIy2XhZplvzURlizbJI/j+7og+ZwoljWLVNZ41XPzhf90vgJR+Zt6063w2tEKOZKha8wnVujbQJawpc/646pnodqxX2jkB06nyS5wQA2WudNyMugpt9T2Y5TTTsD0WllC6vw3KYE2pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Mkwe1y5Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F9Rk031013
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=; b=Mkwe1y5ZnkG72rgn
	vZrFr5z2BbnLubYG2vjQEXph6IeivFM6tghKq+wMVNvpWWREHErpKQclfMjYSaQd
	XGwZUGN3ip0ji5h92n8JTxxDTGwMwC+jPsS39xkW3vS9NhXAZNGjESj+7e9WV3sG
	ENq8QxfWedg/V1MV9799z1M5cFh5JNZuWxPXuJs+HgnPKcjqusH+z942ZNlgFip6
	vHtz+9614aD7cv79Lx3STWs47Q+5XBCGCiwMxI8jxFm0HoXmca3G2ECGeFFy7Crk
	Hxky5dnohQ8CCJBwWyyYmzloCcAeGHkEsr+m4VNDy3CWlZymfMy9MBvbRMFUj2On
	U+Hu3A==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh5d01j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 09:31:03 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6eb2480028cso13598886d6.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 24 Apr 2025 02:31:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745487062; x=1746091862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R2Plo6/QBFF1HAXNaurzwl09t9WnclC1kSkO0ycKczA=;
        b=MC8l0bOjUh75ESYl6uOYoHEdUNEbyksFEzQgkYHIs55xBIrwT7n62kSYl8eKjF/1F6
         dtRtv8alE7+uL18m9RoxErkGjWZqotc+qByDKo/5C3uljzd5ETpynNLU2V6uiQG1mvSR
         HsGUWeiCfpy0lcb0dFL1fmBaoB3En2QKLtCjn2uWyDUQV4M4wCjq/Yf9YA4OR1cnCG6y
         F5IaKPW2wV2FPS6g17bCTvwsKmD9PaO+pfHCbwkaqzksSxEO15c6M9038s2FUlpJvbVR
         ipEEXRURxNS1IlLlrBK+3DMXfzGerJwIRT4I7Uk5tx2n4gnZGE3ICyDHG4r0WJ2RVezP
         loWQ==
X-Gm-Message-State: AOJu0Yx6m9TRJ/N6l8LDHcKoLdY7mQo2DrFE6yUXS7QxnnBGegSDxuUW
	d7E1cz4E4bRV2hSqNJMrsKbfGnPhd0vQQOx50FtAZlGNtDCpiFx35hQLu9gpbtdZvEo2xhycr27
	xJ3yXBDDsURBCAu4rf1ZjwVDX2RGB1cHTBbSAswZhMh5nGaX2Upb6ROjirBdlNcxD
X-Gm-Gg: ASbGnct9vSjDfFX6b3gVkrEv8dXb7TtOMZSnwxUz3FCoveRxpg+ChlVgNF4Wh0gJS5H
	vhMs3tr7Oo3iq/AL+LtkxYb2W25LDuZ1Y9OTj4VFxowJjnPTWbjA0YOwMXYpCJFrbaQxQU7SF8H
	atAqskck7WBnYZmBTIv7R5xopkiw84+d6gym4N3KxxeI+umOldTisQxH8AGk9Q5zb1/MhhD/h+r
	5UbRUFRBh+J1no+c3aoLvSZEyJjAtncaI3Y8U23mUNWevlKrS1fIOan3Jnu6hbkiAzhxf6A5Lm5
	DPYoux2V4DrZh77GBdv4qOiGfTCCW2gAX6kIt59J4mQ9lwjWlGyzEipDidGc4+tBecZCxfO5u2O
	lcnguxWMxhoBpxEjFJnU6XlFk
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f4bfc6d804mr33930546d6.31.1745487062452;
        Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFt8rlPlDH/a8MvnQzJpkVdpgygatDbG6zTeLQgE1Sk5DPz/AogmqatCixLLoM+SsnZM5MFUQ==
X-Received: by 2002:ad4:576d:0:b0:6e8:f4e2:26ef with SMTP id 6a1803df08f44-6f4bfc6d804mr33930256d6.31.1745487062122;
        Thu, 24 Apr 2025 02:31:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 02:30:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:24 +0300
Subject: [PATCH v3 20/33] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-20-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5292;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0gPy4u9+yg/VW6I+AUS7zPeR83r1ug1HSB+hIPYj1+Y=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSu5bNMbuDpHhEpy7HNgZaFCwQ5ZDMxP6sT7
 JZrYDTsT3WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoErgAKCRCLPIo+Aiko
 1UfIB/9WDqSHx1nPN5xr+kKBFRcZRtKeYEFF85X/Fdg3fWJhEJiTk3D/zEEyTn0Q8lq5bCIkIDw
 W0qWuOb+GsoG0sipVZnjLVKXZbrWvDxaMcaA5lJMc4tPpMdKr6LM6DmUdMytpU+mWNNo4wxvR1N
 bU9kQVPaOPZCmGPsrY+G5mTFwnRQ/spL1z6a5VsrX2L93MqsaITAXoajkktSeQJHe9/smXXsPm7
 cSF3/SCpoHDHbcNIbXmIPqfTlf0wkULocARbfKGuyF2Vr2CIrPaBq25x/pfMcMuYs5UDhKtKs3n
 OXVX3b7vY+ndpGdQrYN1WeaMj1uh6Dvafk3wGu+3loRgN66n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX45bgN5uE1aIK XXyGQpkH2ksLjwoOAqeH8UEgeE6M8O3mE9CKnYcuBstc4rRVUEp85asFcxHD/7U5wvxkXG8GVVp wAENyMmvR0JoBQsijBi9XN6iJy7EpJ1aD/XllwCeQe0rBwZ0xnoNGYr350LKYXEfT9JiRFI465S
 yuB1UuX9wpD41F7SM3/z2qtqRv5dIRgzv6W5cxAswGtVGOvVGtl0Ee/6QIJ7wpsNOnGTcubr28E Q8TPt3Zyd9+O9pF3FJz5Jm0S/4l7Aiw9P9GSPMaVMYlWBAm6Fxfbiue0kLVogUOT/RbfLvDEeaW tCpzxcgGERI5b8BK7d3bCBpOQhu6VPLdeDoz1ckkbdu84TRqc+cRRl4VSyHZa/9I5l+YxgiyYiG
 A3pMWe+JZTUqCMAUg02nLi3gNtaWW8wCs95MVQh7BgWxcZ6QsqHNWGU/84ramM9hJkUvJ4m8
X-Proofpoint-GUID: 1hmOem58YHlhjOu6TU5NnYOBH0P1xWN9
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=680a04d7 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=H1s5W502GRu5WLOynKcA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1hmOem58YHlhjOu6TU5NnYOBH0P1xWN9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 8 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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
index 9f04c7cd5539c012a9490556a5736d09aa0a10c1..21264184566493ab4e356a4e0c032ee7780cabff 100644
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
index c93213682a5781bbd8ad137152c9be8bb1e6efbe..634b7dc452839f994c948601fe9a09581cb42a42 100644
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
index 5da17c288f66f4b7b5fef1550fcc9793f524115e..59e280edcd508c14ee297857a19e9974970566de 100644
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
index e388900623f0de4a1af10d22a6b9bdf4842e1f40..af0d789c47917e9b712282a542c3d0886313c049 100644
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
index 0f8c24ad346568464206eaaeeb199955788ed505..a493dfffa9e4981f4c3f6e05dbbf14e1416f07e5 100644
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


