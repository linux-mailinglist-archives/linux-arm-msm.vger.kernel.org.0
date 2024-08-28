Return-Path: <linux-arm-msm+bounces-29790-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A5469962B40
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:08:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4FC981F25B4D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:08:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A0541A3BA4;
	Wed, 28 Aug 2024 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAc+OJFA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 620971DFCF;
	Wed, 28 Aug 2024 15:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857646; cv=none; b=aTxqZpxTOhphqdqpC10ELXZqTflI9/SUh/1aNg9oRiuIvF03qygo0lEFBIgrcgFOb+zV3RnQLdP3yaNs8K+wYxWJIlRWzEDEsCxppeiNKbvwOUM+bPzlr53G2BfdnLyCGqAOwJebfgxs4m6sqr4VLXf7JBIPJbqyrdC6lM2YRC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857646; c=relaxed/simple;
	bh=75YJG54NaclIkP/HiZ99a9JobmwoaDuf1d5QwoMt53w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gHAn6PXRAUHi0EUMl5a928Z4+OpD8xpvvt1EkXQG5PGSLxSH0GsO5l9su2uLa/QrXSY1koPp6C/M/cq5+4Q3gHghKJNrkW0s28hAcipek5e5FIV6+Yuxnuxi1JhHPLicZShZz7BljHAB5NhmluFeGRh5rDGucR1/is0EEG5+SjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAc+OJFA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B30CC4CECC;
	Wed, 28 Aug 2024 15:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857645;
	bh=75YJG54NaclIkP/HiZ99a9JobmwoaDuf1d5QwoMt53w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GAc+OJFA5/mIvOr+4Wmn8xukV4NTAwuRDJmwvVZCzv9nVm24qQooGeiVuAvJPCreG
	 I73XSEVjRe1PYncXEUGmUFiSDl5b3dG9Opztu1ZXuS61ylCaukawdSoTUtumb/dri8
	 I65W4//Z6eNsjnvCPhe6zjrjz6Az2kazEhnQdPeVvysT6nw1h/+Kg4WfWIUGl/CQ5m
	 rxsoPD4Stq3ivBDWb+d8gR4aJTKdY0PfDSzREWfpdpYm2L1PMueCaMRiEN4GzXOdjj
	 qq3smxoySDObsssmjJZm3/0dfY53mIFVijg98v/kPPTfbyh4vyqizorKfsgfN4yC2j
	 hYnrWcmn09UjA==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:57 +0200
Subject: [PATCH v2 4/6] drm/msm/a6xx: Use the per-GPU value for
 gmu_cgc_mode
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-4-1882c6b57432@kernel.org>
References: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
In-Reply-To: <20240828-topic-a621-v2-0-1882c6b57432@kernel.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=1423;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=LbkEt0S6HAs2YviK5Jyne+bqCjj0ZWx/mScp3Zx726s=;
 b=2OMzlNdLg2AJnyBVii4+OF7SJcErl1NWffJ8XEnd9g6V5IKgZSo//bmYVByuIW7OQaOZj+x4O
 ImSppC5kvuGBP/hAKy3wf3ev6KuyaJD7pvHOr4Uh5RvdA/Hbgs6ljFj
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

This register's magic value differs wildly between different GPUs, use
the hardcoded data instead of trying to make some logic out of it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index aaeb1161f90d..871452daa189 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,7 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
-	u32 val, clock_cntl_on, cgc_mode;
+	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
 		return;
@@ -417,10 +417,8 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		clock_cntl_on = 0x8aa8aa82;
 
 	if (adreno_is_a7xx(adreno_gpu)) {
-		cgc_mode = adreno_is_a740_family(adreno_gpu) ? 0x20222 : 0x20000;
-
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? cgc_mode : 0);
+			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
 			  state ? 0x10111 : 0);
 		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,

-- 
2.46.0


