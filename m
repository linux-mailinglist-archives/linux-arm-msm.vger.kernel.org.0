Return-Path: <linux-arm-msm+bounces-58702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92BE3ABD639
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:10:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD2BE16F682
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 11:09:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB79280026;
	Tue, 20 May 2025 11:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hLFt65tK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D774D27A47A;
	Tue, 20 May 2025 11:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747739266; cv=none; b=egsbaTMN2yG1wqGc/HbN95bPLiWIHLlUHXDfjfY8gythrrPl961lzUzZ6T740G9P98TssVo5qBSFwd27B69dnHVQQiJpDXUAF5xJM0vu2FkxZAB5TZTSesDycFNYD28aLjI0jIqPzrigqqv2SqrHvj41NLgUjSRkSsDYRTIrXjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747739266; c=relaxed/simple;
	bh=jxaLDwvhxhHhe2Dlk/JNwXqifIcjXM0y7MqVXFsgXW4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NwnhaORL2pNIjZb//vOZgL2Yh0rEBEgpKfll7ED2PIi0a9j5HYoJK5mFIx/K8Pvc/lkaP/kuQ/2KzmYFxt8KjJW126khcRQ0L60byO6J5jEfp2B0y/XgrcqbqSn/hmSmU4sMpEinN4x68H6jac250jodOdIPQfAjeBfpHsccJVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hLFt65tK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F6C7C4CEEB;
	Tue, 20 May 2025 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747739266;
	bh=jxaLDwvhxhHhe2Dlk/JNwXqifIcjXM0y7MqVXFsgXW4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hLFt65tK/K4AvjgS0bQhqqQzx5CpsglfBpr+1hduLg3ii+AjTlpHIyhwDpp+MBfX+
	 EfhwudBYGB4PDU8ILSZ6cajRWRFx3p5zv2fcmpvbbE41pGhpQyfmDmegTxv7DYQ8G8
	 gBNFAcjJbOHeQWNXdt0Y84zzRveJwga1N2lG390qXeE9xOirspX2Ygzj7BM8gn3u4i
	 egn4ZBTlHdhhriH8nwPMFUWaUBanQrk2JBypzMk7bRzYofG7B35SDR0E6GQvG8MTak
	 AeYyR5nkZKjbxP5HY/ltczzLPL93R8QMbtx1/LfmMgDV315BToEgMaEd5FljgMbHEe
	 s5m0wFNplH3HQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Tue, 20 May 2025 13:07:11 +0200
Subject: [PATCH RFT v4 06/14] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-topic-ubwc_central-v4-6-2a461d32234a@oss.qualcomm.com>
References: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
In-Reply-To: <20250520-topic-ubwc_central-v4-0-2a461d32234a@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747739235; l=3256;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=Md8EpFO+hlcidoswn8bZLiqpgux7zLaGkuRsqCEl+zg=;
 b=rTvb9tSpWnF7imERsv5uZc+uU7KyhONNyX+N8afXGal5r0bGDF88jg/vk+zVKWjxfnbq2Lv6M
 HM7cp1FYpwZCAonewSoskaYoOr3C636GgZhFiMuetJ0KbNz8E4iBqFC
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
index 7570ead904adfea13b22a63d57d55d7412abb4b8..00a928fee07290951b69263dd1d902ce85400fc0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -593,7 +593,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		return PTR_ERR(gpu->common_ubwc_cfg);
 
 	gpu->ubwc_config.rgb565_predicator = 0;
-	gpu->ubwc_config.uavflagprd_inv = 0;
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
 	gpu->ubwc_config.macrotile_mode = 0;
@@ -615,15 +614,12 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
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
 
@@ -638,21 +634,18 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
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
 
@@ -676,11 +669,15 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
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
@@ -695,7 +692,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 | hbb_hi << 10 |
-		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
+		  uavflagprd_inv << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0


