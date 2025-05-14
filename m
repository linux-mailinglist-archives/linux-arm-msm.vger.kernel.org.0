Return-Path: <linux-arm-msm+bounces-57860-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 66E18AB6F4F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:14:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 302A61BA3BD3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:13:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0031127F728;
	Wed, 14 May 2025 15:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LoUHGmDj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2FE81552FD;
	Wed, 14 May 2025 15:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235496; cv=none; b=qHtyA5QwNDgt/1+NuxHTGoJ8dfvDAaGXxZg2YcCFE8eg97P5JUlYltwUVF7G+49rNXBp4jz9J4g8cTqOrtSJ/vtoNQhRW6BJP6i8YKIm8Zsbakar6m31JgfmGyIXzFPVsun/7cDmEiDEDAkGhnZTj9PzmE4fwhZx5S/Cu8s4jKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235496; c=relaxed/simple;
	bh=BScU0o75rdjqo7v+0vtZDV4yX5PMZ7a9GXPYTLvpD9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l7NJFAkNhEz2KamMq9hrHruFbSg7Cip05BNQKpwSMLcJbZBQrEbqTM0/RFML95mnRIL8ikugMuh42FyCAjZR2fDJsbBbaEuD3h2bHoFhEC1FqHCOp8thyR/d0P0Ujla+J7xTGTcwH46JHAWFWu9kmoOe/Ck77EA4sMFW5OWC9Sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LoUHGmDj; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 551F0C4CEF6;
	Wed, 14 May 2025 15:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235496;
	bh=BScU0o75rdjqo7v+0vtZDV4yX5PMZ7a9GXPYTLvpD9w=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LoUHGmDj1tg5Aw4YyBi8GoFHrYsWOUHRm72wwDDKouq1K8VnG6DZRoNxDgpBUx/LE
	 huMuGjWOJ8zVB7KZ6xytRqEO6idUewKTZ276c2M6sZg2CL6b3qNHspj/wCovT4xc8D
	 /db7+0NIJnWRHTsIxE5rXtYow4mWzidGIM/DAKxp7FHqsyW9bMlyBYgTHON9hXeno+
	 F8ERLeqIPltOtwhAxq6LR8H3+4aRS970TqVbU3Z7fT2Bmmy0N1MYTDyYT5qPFyYPJS
	 xvooC3FN0OVCTSrj4VTZfYtBxmOBtsGmMq8NwslJaUuQhjKODi0PWTH5AZCjXlb60c
	 l2aEo2OHRfmlw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:30 +0200
Subject: [PATCH RFT v2 10/15] drm/msm/a6xx: Simplify min_acc_len
 calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-10-09ecbc0a05ce@oss.qualcomm.com>
References: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
In-Reply-To: <20250514-topic-ubwc_central-v2-0-09ecbc0a05ce@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=2994;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=uhzxCTkLiBWghA8reLOOCpmixDKdE/ADomLDXGc8h5U=;
 b=U7siDj/37mEwCSQ2F+kLgyeY1VmNLata928UU2xISDKTHxpZERVjWqSvFYC/sUdBFIHZ/AzOA
 xPWWtJEyvG/BZPX1hz3YY6sM17Lf6ZVTTeKF32lkxgU2TR3rY86/EK7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's only necessary for some lower end parts.
Also rename it to min_acc_len_64b to denote that if set, the minimum
access length is 64 bits, 32b otherwise.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 5ee5f8dc90fe0d1647ce07b7dbcadc6ca2ecd416..fdc843c47c075a92ec8305217c355e4ccee876dc 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return -EINVAL;
 
-	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x7;
 	}
 
@@ -645,10 +643,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
-	if (adreno_is_a702(gpu)) {
+	if (adreno_is_a702(gpu))
 		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.min_acc_len = 1;
-	}
 
 	return 0;
 }
@@ -657,6 +653,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
 	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
+	bool min_acc_len_64b = adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu);
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
@@ -676,18 +673,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 		  level2_swizzling_dis << 12 |
 		  rgb565_predicator << 11 |
 		  hbb_hi << 10 | amsbc << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL,
 		  level2_swizzling_dis << 6 | hbb_hi << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 | hbb_hi << 10 |
 		  uavflagprd_inv << 4 |
-		  adreno_gpu->ubwc_config.min_acc_len << 3 |
+		  min_acc_len_64b << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 
 	if (adreno_is_a7xx(adreno_gpu))
@@ -695,7 +692,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
-		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
 		  adreno_gpu->ubwc_config.macrotile_mode);

-- 
2.49.0


