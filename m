Return-Path: <linux-arm-msm+bounces-50682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A4C72A5788C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:39:00 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2716B188DD4B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:38:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D87481922D4;
	Sat,  8 Mar 2025 05:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OJ8hhID6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE0EA191F7F;
	Sat,  8 Mar 2025 05:38:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412313; cv=none; b=NrPjL8D+6siwlAzeThYqSEZ9XOyXaMdGxOO54CuiWylCrU4Vz4SZB0HQOU/BvmZ2y1bdQ3wrosebT9+BzpWvFeNFZ6E1Pc4ic3518CHeJAlBWtj/GDOBTd9p0YYyx7Un1ymiA+OaHGBLFvEATv5ewG8cCQh7Sl02tZiCqB+cD1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412313; c=relaxed/simple;
	bh=Cq2PuQqJsYKbIOl6H927DW1lZC94Z/gRaWorQY/5hQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M2+QOpjfmde7zXx//J2uCIhyFSuWlAHdGcZ3NN+1SQFfqS+FjvtcchTlVlSlIe58xSR/cOvFY02lKDG4HAUNst5QY4FDEEAy3UHIo90RO59mvB9hBLycqyQ3jnl8jDhkwkjKNgAMvzQGWzG+yWyCTIIumhWYeoQwcadt0Y+hCkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OJ8hhID6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5153C4CEE4;
	Sat,  8 Mar 2025 05:38:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412313;
	bh=Cq2PuQqJsYKbIOl6H927DW1lZC94Z/gRaWorQY/5hQQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OJ8hhID6waDofSg1AyZyKA8qz7bTGBaPCMKycKOky2+D7Wb55OVeyiHWCSxp1tI/6
	 wTJc2GEQ+fASZbOrfpt91u+wFsSZUo8h6dZrQVd+RO+3s7dZpejyGOmUUE2mzBAGOK
	 x6p/kDF2qKJ84hffz9hNMOSabxy3+GlvJwqL2I49mQzTJigQvwwbUUryAH7Ey+6J1e
	 9tZVgf4UwX9PLhcoml8ezsq35LXr1xPNcAkKihQi4P8cDsypDKIMOK7lW+By9KcJpk
	 al2cI7mw1SAG0XLVF0CNZ6Sqt2U4EYL9eGpt/UCuzfBTc/RITQ9ADxhNcQW23s2W20
	 MQRpNcvW3XWFg==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 07:38:24 +0200
Subject: [PATCH 1/5] drm/msm/dpu: enable SmartDMA on SM8150
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-rework-vig-masks-v1-1-f1b5d101ae0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3187;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=avODYYzxssGD0vZCXyWJ+xOwfpklpV8aP63ILBYOVhM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fTlfUxZnsKdQOL/3xpC6/SO5xR4HwznMdrJ
 eDhjkb0Jk2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0wAKCRCLPIo+Aiko
 1ScNB/4gIbTeGgknInAKmpJrRqu+e0RjSEc8zK0wOs2UnpH7C4zfF1aJ5t8P2+ZKEtUrWgAvsuH
 uBRRG+ObxxvSd+reOk7kTo4GPRfP5/n++qUGu5yfRfIut4QFR3L5qaMnO58ppzSPPWpbA9Ljvhs
 eDZl6WMRW5EjTBtFVif6ipvFuh3BLNJk/YCf5Jie4HS81Hf7D7k7+E1ltKMOUTBtTvTwbaveFQL
 hljBI6o+pcMSkx58RVxL8cWJ2twuOQrzRKwF0chy4bIMjwqhpBpvvqyHnsO+ZMK8e2xjj4cWaEo
 HKcBOoPkGAFbFNlm6L6laex2XWhw/cvICPY10skGSI4LhA/C
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reworking of the catalog dropped the SmartDMA feature bit on the SM8150
platform. Renable SmartDMA support on this SoC.

Fixes: 460c410f02e4 ("drm/msm/dpu: duplicate sdm845 catalog entries")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 23188290001ffb45563a9953a9f710bacb4dac89..fe4de5b31644de33b77a882fa21a18f48ecd1790 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -76,7 +76,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -84,7 +84,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -92,7 +92,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -100,7 +100,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x1f0,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_1_4,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -108,7 +108,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -116,7 +116,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x1f0,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -124,7 +124,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -132,7 +132,7 @@ static const struct dpu_sspp_cfg sm8150_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x1f0,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5


