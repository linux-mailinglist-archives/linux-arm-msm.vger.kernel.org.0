Return-Path: <linux-arm-msm+bounces-62597-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E4521AE9987
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 11:04:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6C8D44A2150
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 09:04:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 16279296161;
	Thu, 26 Jun 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hm/btOqp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E24F028FA89;
	Thu, 26 Jun 2025 09:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750928590; cv=none; b=alOlv6wxH7DvZZjnb2OVavWQdKovQ5oi8moW+rjX0INqnK4fJnZKRNL2w8tQiCws8krR4RJpcsGxIiXjJr4xOUHYLcjVoW/3sdOPxWSdIGmTnmTXj5iZMXcEyg8BRxp3y8YQ+TN8fU58zlIUSQvLs8gR9qXk+wnNcz5ose3Lg9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750928590; c=relaxed/simple;
	bh=3LEQ356tMFYHOFgS0SBmeaGH7W54eTYJS2pkOp0ZCzA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LLR9GV4flHyF0YbKBT0ET0UW7wQg7iIz9Wv6TkYNO4G4ooT3PEbrwRNb6CYTRc8E3Mj5PzpxmdlBB+vw9HAk/BUAyF8KoTTi7hoUaiR1Zxi7qWwmhEmLtAjGH4Mp9LoYuaqBk7WQOcDDLzu7wcKLnuMyFPpAyENVtwSUJdv9StA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hm/btOqp; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87AAAC4CEEE;
	Thu, 26 Jun 2025 09:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750928589;
	bh=3LEQ356tMFYHOFgS0SBmeaGH7W54eTYJS2pkOp0ZCzA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Hm/btOqpwc5p/l2KL+Wu9rfGN7WiRHcDdErUxvCNkxTg7QoM2ofLqrrLXL89/UcZb
	 7fGcOV4xmoqBWxNcA9XinK6ukx6I7GLcaS/HojSLY59ufm+TZByzolXJdG2MwVw+X0
	 L7+vSBTBqwFvdZaItgsNFafEQjWTM11hlPsm/ccu36hUFojQ3XoYO2adzN/uZNuq9u
	 U87p+3ViO5weh4a0soUwEuD2Un8/b0/3ofTOB9tp6TTLVcWLYl7NsvVnkpRG7Xo2P1
	 Vkp3bwKaXWwztwlJ1ntKUxXdJdIRu3q1VKjiEqV+jw2iqTajhiU3WUkhuFOUocblfQ
	 /lBB1UOomVMDQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 26 Jun 2025 11:02:33 +0200
Subject: [PATCH v6 06/14] drm/msm/a6xx: Simplify uavflagprd_inv detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250626-topic-ubwc_central-v6-6-c94fa9d12040@oss.qualcomm.com>
References: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
In-Reply-To: <20250626-topic-ubwc_central-v6-0-c94fa9d12040@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750928557; l=3256;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=OhUr7NYHE/PzMXX00APT+Awea/mVV15VY28VSm+g4dg=;
 b=BxahdZGDjT8eL08i3f/C8v+lS82g/0WB5eJupu7VTr8UEqjSwXsod9PBK1ukDzNn4FuPmJHG6
 MNrfAVQwHWPC4Uhyrpoq6Th4NHV7SuSrTr0bt85RS6c11wJ+hu8A8Cb
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Instead of setting it on a gpu-per-gpu basis, converge it to the
intended "is A650 family or A7xx".

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d14c84a0a4b14bf7f77375e619ac6892374bb3c1..3d9c98e56d92ed43cf6e702fbd2b5cbd3293ac5a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -611,7 +611,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
 	gpu->ubwc_config.rgb565_predicator = 0;
-	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
@@ -633,15 +632,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a619_holi(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
 
-	if (adreno_is_a621(gpu)) {
+	if (adreno_is_a621(gpu))
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.uavflagprd_inv = 2;
-	}
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
 		gpu->ubwc_config.rgb565_predicator = 1;
-		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
@@ -656,21 +652,18 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
 		gpu->ubwc_config.rgb565_predicator = 1;
-		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.rgb565_predicator = 1;
-		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
 
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
@@ -694,11 +687,15 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
 	u32 level2_swizzling_dis = !(adreno_gpu->ubwc_config.ubwc_swizzle & 2);
 
+	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
+		uavflagprd_inv = 2;
+
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
@@ -713,7 +710,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 | hbb_hi << 10 |
-		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
+		  uavflagprd_inv << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.50.0


