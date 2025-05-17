Return-Path: <linux-arm-msm+bounces-58280-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id BA8B0ABABA4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 19:34:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id AE2EE189F607
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 May 2025 17:35:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DBF6214227;
	Sat, 17 May 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5+vWc+o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0504420E033;
	Sat, 17 May 2025 17:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747503214; cv=none; b=snOa4FtL9UsaLXwnHxOGYLvWD34RXsbQN42LTi7u3osyJByBMLjlVExan0wdZfXNgFdbO/Z0Ie1l1msqk79UDMVSIrBuC9Cv+PGgx414S1tnx0dsRzUxiTPzBjb1W3vnlm7zR3W2kzruTgGzh235osy0X3xO5WvbiRholbOCNOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747503214; c=relaxed/simple;
	bh=REZvyTQksqAyTnAaD2WTLfY0lR07LpEd+/lUzSlXcJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LeP8Fs6mbZJ0S6tsBWF5YKz+d/ja9vxSXfa+gIjJmvfG/CYz+Fk/RzFdsdu2UIbowetrNBa5rJWePXPAPAH56vbu/XBD5YEtnFv/JbEdFInj8h/qLLlwx/j+0kRfHBS2DwP4DfTNkQ4Nyl4W8x7/GpPnq1tssJpdZxUerZA8gR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5+vWc+o; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7924C4CEE3;
	Sat, 17 May 2025 17:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747503213;
	bh=REZvyTQksqAyTnAaD2WTLfY0lR07LpEd+/lUzSlXcJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f5+vWc+ob63eGwecVmLkje7AJxIbs4YN+fcT7xSKvpGwtJx6136nJ9V+EMPXtEQzf
	 88PMnY8kg2nn2FmF5uku4grgpB8DVhQ6iU5o9dflRfggrI3i/K6TXxq+txT1BlgVPB
	 Hfg2U3KQuahSD/scbqnUyBPUpmcEkpcuHDNGW36Cv7ZLG9xHv4mpAuW7OCRZ3V6QOD
	 6BnhZ0HGPCNIIxPGyPoemTY+EBNTJ1PZcFGXv76BBrVRx9xSCvDaoT8vA3H5ms+xfH
	 ZD4yLIB4SIOqEXEJnuO9WnwIZDfb1/V2BzWTuc5+TDKwEAg/BzjrJPoneB+ieO8N5y
	 PbJpAMwssDQEw==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Sat, 17 May 2025 19:32:44 +0200
Subject: [PATCH RFT v3 10/14] drm/msm/a6xx: Simplify min_acc_len
 calculation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250517-topic-ubwc_central-v3-10-3c8465565f86@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747503160; l=3142;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=05oild+tIGZi3UsD07uGnXngsp8ADNVH0JMex+ElB4o=;
 b=WU7wpKV9yAvccngZF5UDwLOB3J6MHTAnSsryGP6VMLgHe9LjKVZDdYRBjQbS2DeqqcB3Rpd5h
 ZSC88oFt7lDC2IsUFwEg9y8aTxxItwzFOIGX+I0rPw8osyqvr1X3YW7
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

It's only necessary for some lower end parts.
Also rename it to min_acc_len_64b to denote that if set, the minimum
access length is 64 bits, 32b otherwise.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 32017e2730a9059a16ef551363660b72d7f991c8..6dd5281678a5f31be9c59e3b247cfd5a34341ec1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -592,14 +592,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (IS_ERR(gpu->common_ubwc_cfg))
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
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
@@ -668,6 +664,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	u32 level2_swizzling_dis = !(cfg->ubwc_swizzle & BIT(1));
 	bool ubwc_mode = qcom_ubwc_get_ubwc_mode(cfg);
 	bool amsbc = cfg->ubwc_enc_version >= UBWC_3_0;
+	bool min_acc_len_64b = false;
 	u8 uavflagprd_inv = 0;
 	u32 hbb_hi = hbb >> 2;
 	u32 hbb_lo = hbb & 3;
@@ -675,22 +672,25 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu))
 		uavflagprd_inv = 2;
 
+	if (adreno_is_a610(adreno_gpu) || adreno_is_a702(adreno_gpu))
+		min_acc_len_64b = true;
+
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
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
@@ -698,7 +698,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 			  FIELD_PREP(GENMASK(8, 5), hbb_lo));
 
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
-		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
+		  min_acc_len_64b << 23 | hbb_lo << 21);
 
 	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
 		  adreno_gpu->ubwc_config.macrotile_mode);

-- 
2.49.0


