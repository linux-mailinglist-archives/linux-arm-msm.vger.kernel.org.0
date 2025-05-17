Return-Path: <linux-arm-msm+bounces-58275-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D2586ABAB9A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:33:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A04853BF438
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:33:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1887120E716;
	Sat, 17 May 2025 17:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CK9vRRJN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E093020C46F;
	Sat, 17 May 2025 17:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503192; cv=none; b=NUgqSRalLjyLt1i7JAqE4/CAQZ17emlgGZRYLRVEXva3wWy8ZuW/hsvJLLukULJfnVAAMX92PTqVfbgwRlKAA+LBfTkrsRwzq7ukzbxXpmVWxka7E4BIm6kq0dRRwtB7G6RF9QlWjWjK1Lvkuba/qAyPIMVqoJEzfS11pLtalYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503192; c=relaxed/simple;
	bh=Xmf3izPXtFZBDO2EQVsFlK8M75Yuvnk3Cf0Hs2KS2jM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DvZnpGVHoCc6aMbNybqnQcK1lWofyocE7BAXP40Drt++St0caeLQpG9FE1Kao2VfqBonfAYgTiTRRQ7EJ74Mqs6kdUL1wwwfiGs0o2lx3+3VfUvXZ70lmwBevlnboDXP90uNLMCZzg79KDn/ZtuUxhpVkimHTtVweIC5t4nXjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CK9vRRJN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27F9C4CEEF;
	Sat, 17 May 2025 17:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503190;
	bh=Xmf3izPXtFZBDO2EQVsFlK8M75Yuvnk3Cf0Hs2KS2jM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CK9vRRJNjWZr6+HU+DWQ67oAgmbRUK7cqbTnBnWbdYTKgOwL1UXJliR9TTH+Z3vvO
	 Q2W22qQmssV0NYfd7NYOuGJfgtNUmM6F0ojqJSi4Xut2nJPUocj+Oq1lyiMU/se6eG
	 7Co+WHsRnEN42G0WB81JN1LHjO6kqYPYhw2Y96ZwRpppRvsWin0xOooTpgSZSINpDX
	 GZcx9r4mY9sD7jUI70mYoa6XKXqnsAEXf24Sp/6OxoRaPGq0X5lyaGx6a79hXo7lB8
	 fLPgTO2qKaEq8o4vWU95OHc9JB2eFpc5PA1nDI3Gy8My01xHqv4WFwLGOdcVb8kmC2
	 c71nCCg0ZXy3g==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:39 +0200
Subject: [PATCH RFT v3 05/14] drm/msm/a6xx: Resolve the meaning of AMSBC
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-5-3c8465565f86@oss.qualcomm.com>
References: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
In-Reply-To: <20250517-topic-ubwc_central-v3-0-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=3323;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bUN2KQJG8thQHtgztpKDpU7Y9oy0bG689AC32qwvX9k=;
 b=tBPgCKDtdRwdPiP+X055zkofxwAUgOMxGpfW/9Qutdof71znpgpvckEb1fY9pNh8ca0BAhRO4
 F7wcQXrXKppCE4vafTkAx86Os9FzxOY2tRn0BX6jt9unA8COJO2DvUS
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
index 4399e69bd5156c9d8c6a17213ae02ae03ddae529..7570ead904adfea13b22a63d57d55d7412abb4b8 100644
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


