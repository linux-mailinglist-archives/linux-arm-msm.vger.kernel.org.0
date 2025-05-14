Return-Path: <linux-arm-msm+bounces-57855-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D5EAB6F5C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:15:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A28EB3B2457
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:11:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B811A1DE4E1;
	Wed, 14 May 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cc90RYmn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3E01C84A4;
	Wed, 14 May 2025 15:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235473; cv=none; b=Upobt8XN21pM/emJuyBJBpYKU2EkhHCcfePe0oJ+sj0varFyt83yRqs7hKdE89ApNlNKAxGRjjbS1A0xRYgKnPtqQAqfMDCdkQDtOTXTt58V42qasi2auazth/lPc9gsZ1kTy6Gda5jkuOCvyQBMVqkGnVfMiz/d3c/IANvZMvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235473; c=relaxed/simple;
	bh=hL3aN23RbdhK+nJBxfRLZ6FaNf71Aao4oJmKsCMkwUI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SCosisygRGwo9THMYbR6K4SPSI+OLrpWSaRbVW84/6uOM2Q+LXr6aZwk6/8VrR4lsLPh1VEA/P6ll1INPA2HLnjKFKNgIIJPxFjUxWjV7Yla8MQUyiDK9F95HH9e2ezZVUPB6ASRX1nnKJXEKCa4HWNnQpwmckm1wq6y3kwAFG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cc90RYmn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34F60C4CEED;
	Wed, 14 May 2025 15:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235472;
	bh=hL3aN23RbdhK+nJBxfRLZ6FaNf71Aao4oJmKsCMkwUI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cc90RYmnLhvW5Afh4sps6r24qrDQFjG1NjVO7Ja7bJtCHHByyfQn3+5aygAB3VGrA
	 IQtFaSXAV6li0txXd3w3Gan27vXsKCXx1vtGlwrL71cAMxKCkxd3F3YsFl45aIZMIH
	 KIHrIrfEyu5Xwaww9DBgjoGw/xl2ODkFaV23L1nlabJxAuAyYCoJ5pp2aGPW5WkXOQ
	 aHAqHvcMox4Uv4V5jlcSmBlELOWz/88z9SJyZluM8kW1tuO5F155N9iGaY4Gz4fyEG
	 qUm4Zb8Wq6/A/Ym6+MBKTP3BsZpq5ceTCXZFkKIUSfFKyAnrOSPyGMHOOHftoxokhJ
	 Xu4FkvC0jFEgg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:25 +0200
Subject: [PATCH RFT v2 05/15] drm/msm/a6xx: Resolve the meaning of AMSBC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-5-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=3323;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=p6lmRPBIIshocTtSmkKCM3pmT//8eDH1Lyx6WXabKCg=;
 b=9e2YN9fRz0m2UIoVxYq8vMxHcHx2tPW2TztLi8beq05Kp9qhKw43UUK+op2PugAbnGLsr66k5
 RLKKNquXb68BkPhMkHbXdVt42IG9EEg077ohlEb8Dqa2Up4N1DHDyGP
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

The bit must be set to 1 if the UBWC encoder version is >= 3.0, drop it
as a separate field.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ba20ff92780dbd565374f8113ea99f615b80d105..334a4c4627ffb562a83f51e6e2c95e31af950c08 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -617,21 +617,16 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a621(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 	}
 
 	if (adreno_is_a623(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
-	if (adreno_is_a640_family(gpu))
-		gpu->ubwc_config.amsbc = 1;
-
 	if (adreno_is_a680(gpu))
 		gpu->ubwc_config.macrotile_mode = 1;
 
@@ -642,7 +637,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 16;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -650,7 +644,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 13;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.rgb565_predicator = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
@@ -659,7 +652,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	if (adreno_is_7c3(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 14;
-		gpu->ubwc_config.amsbc = 1;
 		gpu->ubwc_config.uavflagprd_inv = 2;
 		gpu->ubwc_config.macrotile_mode = 1;
 	}
@@ -675,6 +667,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
 	 * allowed by hw) and write the lowest two bits of the remaining value
@@ -682,6 +675,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	 */
 	BUG_ON(adreno_gpu->ubwc_config.highest_bank_bit < 13);
 	u32 hbb = adreno_gpu->ubwc_config.highest_bank_bit - 13;
+	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
 	u32 ubwc_mode = adreno_gpu->ubwc_config.ubwc_swizzle & 1;
@@ -690,7 +684,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 |
 		  adreno_gpu->ubwc_config.rgb565_predicator << 11 |
-		  hbb_hi << 10 | adreno_gpu->ubwc_config.amsbc << 4 |
+		  hbb_hi << 10 | amsbc << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0


