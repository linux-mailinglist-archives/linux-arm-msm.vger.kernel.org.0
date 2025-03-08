Return-Path: <linux-arm-msm+bounces-50684-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 15334A57890
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 06:39:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8217A3B62A1
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 Mar 2025 05:38:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 416091A08B1;
	Sat,  8 Mar 2025 05:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="esDfbYFr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18ED7187876;
	Sat,  8 Mar 2025 05:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741412319; cv=none; b=QIVP11LLs4zSeV2Lysy+IMwoNHmX1pWMd9CIvn6E20uVn8+NnvizMOLzfZYId8O45c0eq8dtx+5chrcv1G26ubllq2n3mt14g252dGVqCfFi5KnaUvq1d3y0CpnrqWJfRUc71SWFl3BGKJm6+st/4EBNbTUwKLHafsWOVwhFc4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741412319; c=relaxed/simple;
	bh=zqPN7MsrTMU/8hYOiHjo1d3t4P549jr67n+7N4DS/xM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VrbsraVOPYptiAcZImqPHwT4LpOUsWnfFcnyFNvsCx0HMGEchMS+duSQCMBATGSjyQ6OQuUySeAQmvr/TEn3YMYyIVxcM0DW7TTUtmevopYen2D2ug/zZM4TtExt2Dd6utJri3EerXr6+jJktgWdyIRXgb0EvgHH2OELoBGs0LU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=esDfbYFr; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4998EC4CEE0;
	Sat,  8 Mar 2025 05:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741412318;
	bh=zqPN7MsrTMU/8hYOiHjo1d3t4P549jr67n+7N4DS/xM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=esDfbYFr/tBVeNiaypH2iCjbA9wLgnaycudumxaF3IIlrjcCm57ho/96Ix/4XTx7L
	 RGLb3vlETidZ36ls3VeVX2dVQQED/RfDPHPgpRXy6U1VS9BTmtVLTLHmYuXjCXG+9T
	 YfIBSVtUkgcuvOFr/b4vhOhwsNROl0D6pqDS/3Tdj0EDU5cyAMzNE8QhVWpvvs3PQW
	 qAJaQbXhlJrAFZPhdPYUC7i0YZ17ZlrewJdZ8Ix/C99w6hO0gIgYPkc+EC4kGEweTc
	 WoEcobTlUbJLN7yKAiu+WXwT5G0DlF9+49MTJqGwIagNzpo1piPmDbYi2iVlbTRE+b
	 7/OOdPbfbtLaw==
From: Dmitry Baryshkov <lumag@kernel.org>
Date: Sat, 08 Mar 2025 07:38:26 +0200
Subject: [PATCH 3/5] drm/msm/dpu: enable SmartDMA on SC8280XP
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250308-dpu-rework-vig-masks-v1-3-f1b5d101ae0b@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3138;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=3UyKCdf0YuPzoh9+A0LlbQ5Kgm2pqJNL8CZBmc249dc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBny9fTFObNkhsuO2itydST/jURIWb+5Mb1JfN4p
 lWLq8REl/SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8vX0wAKCRCLPIo+Aiko
 1etDB/9aRVLZyblX0Ht5qZK9Awx+EujMFIvqLCUZxi6F4SkxgvPz1zoniRTOWO76u+BgxQ88jHX
 KgEET+pvXhIo4Vhh/24bOm0eBhoDKkwF3pGmVV0rPH3hlEIIhdK8xtHJPvH77jjZSGSlhE0Mbse
 BIiHkWuEF2gr+od8SDouPDzMtTvlnZmEWeuEHLzZFEVnXX7wXb1R/bnXVCsoF+KJMOWig7bZbl/
 XhV/DEPJOJJbaenag6AQAas10grmnV06A8NubhKHF5KQ9bhmEqeaPsvpUsjFpaSefsXaIFjnwWu
 cXM8kenTVZjyFVIrH11BcfdCL9Imq3cDm0SPy/v8FM77K7Ho
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

In order to support more versatile configuration of the display pipes on
SC8280XP, enable SmartDMA for this platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index fcee1c3665f88a9defca4fec38dd76d56c97297e..923afc202f5195fa15bcfc1e141fc44134c965e4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -74,7 +74,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	{
 		.name = "sspp_0", .id = SSPP_VIG0,
 		.base = 0x4000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 0,
 		.type = SSPP_TYPE_VIG,
@@ -82,7 +82,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_1", .id = SSPP_VIG1,
 		.base = 0x6000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 4,
 		.type = SSPP_TYPE_VIG,
@@ -90,7 +90,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_2", .id = SSPP_VIG2,
 		.base = 0x8000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 8,
 		.type = SSPP_TYPE_VIG,
@@ -98,7 +98,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_3", .id = SSPP_VIG3,
 		.base = 0xa000, .len = 0x2ac,
-		.features = VIG_SDM845_MASK,
+		.features = VIG_SDM845_MASK_SDMA,
 		.sblk = &dpu_vig_sblk_qseed3_3_0,
 		.xin_id = 12,
 		.type = SSPP_TYPE_VIG,
@@ -106,7 +106,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_8", .id = SSPP_DMA0,
 		.base = 0x24000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 1,
 		.type = SSPP_TYPE_DMA,
@@ -114,7 +114,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_9", .id = SSPP_DMA1,
 		.base = 0x26000, .len = 0x2ac,
-		.features = DMA_SDM845_MASK,
+		.features = DMA_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 5,
 		.type = SSPP_TYPE_DMA,
@@ -122,7 +122,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_10", .id = SSPP_DMA2,
 		.base = 0x28000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 9,
 		.type = SSPP_TYPE_DMA,
@@ -130,7 +130,7 @@ static const struct dpu_sspp_cfg sc8280xp_sspp[] = {
 	}, {
 		.name = "sspp_11", .id = SSPP_DMA3,
 		.base = 0x2a000, .len = 0x2ac,
-		.features = DMA_CURSOR_SDM845_MASK,
+		.features = DMA_CURSOR_SDM845_MASK_SDMA,
 		.sblk = &dpu_dma_sblk,
 		.xin_id = 13,
 		.type = SSPP_TYPE_DMA,

-- 
2.39.5


