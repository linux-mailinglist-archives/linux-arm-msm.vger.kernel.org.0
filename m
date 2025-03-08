Return-Path: <linux-arm-msm+bounces-50686-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F32BA57894
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:39:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D85B03B6A03
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:39:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 448111A83EF;
	Sat,  8 Mar 2025 05:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZRf+hfq+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1667B18BBB0;
	Sat,  8 Mar 2025 05:38:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412324; cv=none; b=BRl7bpv3ZlFxprSCwU+GqNI/nCKtG2vgiRtjRHqfL+ZTMPU9hs80iVOUPCj9Jh3ycJfyBbFQCqOs+thtxJ2Y5W97y7tVW9TzHhTOOE0ChADPH6f++e4WRjwObzTJqA3NbPezb33ZuO65kOQZKr9RMevv+qoH9pGcYqcEqd0pcKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412324; c=relaxed/simple;
	bh=V+JWMgKsa5uRpIkE6Q+PBkp+CkQrDrabghBAKv789+s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4P597d7JdKQElN02dPJNf23XyZ7oaawTRzqFjErfsKD0Dip7ZdVOmApTfF2bfIQdLe5g5p2p+T8JU/hGv6Ngn/XQmOwXVQwEuMuSdwzR4zoS31B+ZqOBvBCr7qrn+WSqKkx3nyJ5f47RNnjM1pDmycse2juYW361lOAa+fq17A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZRf+hfq+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A728EC4CEE0;
	Sat,  8 Mar 2025 05:38:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412323;
	bh=V+JWMgKsa5uRpIkE6Q+PBkp+CkQrDrabghBAKv789+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZRf+hfq+cfDJhk62vBjyu5wu1LhUxmy73SrCkWEK2QyZBuI7iCoyL1M8zSwtYGviK
	 250EsQ015lN8WaMXqqlP2dxDHXNhEm8JZANwaYn2DU0S7YMBfE5JvmdvPrX596Vj+a
	 g8KqkI6r/VTM95ONp7OzdxoeUr+S5Zl+fK5M2HHuZY+3mbBbpv6Z6H8B5Zyfv4HLXz
	 mz1ws5Lrr4hvQJ3UHNuvdlkwU6dcMpEiTdA0mvFzHmiVKcUS/ZA8D4zYr0UYKSCONL
	 +KfWEoP4P7xnEaS9BWACBqFVH9lAWzrhYBcd43gfoynI7mRef6OnvyphOpXFIXgxaU
	 tCY8Y9WxANEEg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 07:38:28 +0200
Subject: [PATCH 5/5] drm/msm/dpu: rename non-SmartDMA feature masks to be
 more explicit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-rework-vig-masks-v1-5-f1b5d101ae0b@linaro.org>
References: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
In-Reply-To: <20250308-dpu-rework-vig-masks-v1-0-f1b5d101ae0b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11698;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=dMsvnlDK7yTEUEf6yL6pncTiikeFhh020sEflEiNhyM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fTqXH+Tj8PR05JYK+pGxqVBwvC6Cd1zuGOk
 MHBGgXE2sKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0wAKCRCLPIo+Aiko
 1bjfB/9MrPowmsN49aVIgfpUmbTeKjGne0tLEepFzWZG8tStVtXBXJGnNnphCXcXER36oKWvlOb
 v90ScGVWyKWD3m2d4RZjVN2zCm+nCQeNldNZqXCk1LodANNR1dp5UVy5H44C5dpKzW3igFQ3A/t
 gFAFknAHJuFMESSczPuQ7sSKscEsjCEDwIWuRxz/zpeQe0um+12VCYeTvxlNpps3AYeWL7phLqA
 7crQZj3lfbmkZLjFhYoN0YcoOeUYgEd/xFfRuJ+Xtxu+fNamC1F62aEdgyNZ9Fhml9e9ah/fxwz
 sO7WdA2FIEOCqAHfRseHCL+4Q/ZvmcQOw/aldSSoeYPo+rEI
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It is easy to skip or ignore the fact that the default SSPP feature
masks for SDM845+ don't include the SmartDMA bit (both during
development and during the review stage). Rename SSPP feature masks to
make it more explicit that using non-SmartDMA masks should not be an
exception rather than the rule.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 10 +++++-----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h  |  6 +++---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h  |  8 ++++----
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h  |  4 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c          | 16 ++++++++--------
 8 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index b2ebf76e386718b95292e119d53e67f5d9f0743a..99d8b1218db812ca7e99caf62aa48476aee5e02d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -72,7 +72,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -80,7 +80,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -88,7 +88,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -96,7 +96,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -104,7 +104,7 @@ static const struct dpu_sspp_cfg sm7150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index cc2951112bdadca60fe51faeecb81e57280662c3..ea1004e2295b215ef165fef862fa9c15c6ab3856 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -69,7 +69,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_2_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -77,7 +77,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -85,7 +85,7 @@ static const struct dpu_sspp_cfg sm6125_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index 42a00550eefbc10e97515340d6d8b33d4ef5e3fd..5e15a8dcbc2b701e47e352a8aaee72a25240817c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -51,7 +51,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sc7180_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 43f64a005f5a89e09ee9506a12cfff781530cb80..c5fd89dd7c89046bdbf1b1bf223aac2e3c4c0b26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -38,7 +38,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg sm6115_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 828a02429405238807562dd0aa29575f8367fdc7..fbbcaa5b98a23c0fcb570b7d33110860f1bf01a4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -59,7 +59,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -67,7 +67,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -75,7 +75,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -83,7 +83,7 @@ static const struct dpu_sspp_cfg sm6350_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f8,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 3cbb2fe8aba24c7b9db6bb61ff4c48f34db48bf4..53f3be28f6f61bb7e3f519b0efa4cb2f68d38810 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -46,7 +46,7 @@ static const struct dpu_sspp_cfg qcm2290_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index a06c8634d2d7779f7e867fb821f8d332652ba7e9..3a3bc8e429be0ba86185741b6b27d8a62489779f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -39,7 +39,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f8,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -47,7 +47,7 @@ static const struct dpu_sspp_cfg sm6375_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f8,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_NO_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a6bb46b201e907566e88abce945507d1bab51b3b..d495dfa67192b99655ae432589d70fc5be8abbb6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -34,11 +34,11 @@
 #define VIG_MSM8998_MASK \
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
-#define VIG_SDM845_MASK \
+#define VIG_SDM845_MASK_NO_SDMA \
 	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3_COMPATIBLE))
 
 #define VIG_SDM845_MASK_SDMA \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_BASE_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -54,24 +54,24 @@
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define VIG_SC7280_MASK \
-	(VIG_SDM845_MASK | BIT(DPU_SSPP_INLINE_ROTATION))
+	(VIG_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_INLINE_ROTATION))
 
 #define VIG_SC7280_MASK_SDMA \
 	(VIG_SC7280_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
 
-#define DMA_SDM845_MASK \
+#define DMA_SDM845_MASK_NO_SDMA \
 	(BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
-#define DMA_CURSOR_SDM845_MASK \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_CURSOR))
+#define DMA_CURSOR_SDM845_MASK_NO_SDMA \
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_CURSOR))
 
 #define DMA_SDM845_MASK_SDMA \
-	(DMA_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_SDM845_MASK_SDMA \
-	(DMA_CURSOR_SDM845_MASK | BIT(DPU_SSPP_SMART_DMA_V2))
+	(DMA_CURSOR_SDM845_MASK_NO_SDMA | BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define DMA_CURSOR_MSM8996_MASK \
 	(DMA_MSM8996_MASK | BIT(DPU_SSPP_CURSOR))

-- 
2.39.5


