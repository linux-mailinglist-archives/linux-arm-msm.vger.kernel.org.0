Return-Path: <linux-arm-msm+bounces-57856-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A9FEAB6F5F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 17:15:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 175823B5181
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 May 2025 15:11:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEEE32798FB;
	Wed, 14 May 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f5hEhB4R"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 921201DED6F;
	Wed, 14 May 2025 15:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747235477; cv=none; b=Edt5AJJd6wcFLxk7lRX+nlLj6IdzXHFKi4R6/Pxc1HedVyyMDa26efqxf/pQIP+MPpsJm7UalRcX5P0muOZQWfIbuQbFQ/xfLOf9Dtc4/47jkuUxF4+s5Smzj+FX3JOMBb4koLuSrjNjAMSdZx4OM3f4tMUtewPVIxLVJeHfGM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747235477; c=relaxed/simple;
	bh=Y4p7/PaFEBX9zDUg8EH+mXeYmjL+p0kOW7bFbkRHTLY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AE79eYyXOhmHaOJlh81Pvu/Ste4P77Y1omo8ClO5dcjkwurK6Wyv7A5kHN2b58Vfg8HX2VylnPS9A1tsb91BUCg6dcTbezaX+ORloP0b4ZFRMrAdfjP/84/e8hn4csGKsmCBlz6JyL7mdH17y4juL3JwYzYqjGBovFqUdo1llno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f5hEhB4R; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9635FC4CEE9;
	Wed, 14 May 2025 15:11:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235477;
	bh=Y4p7/PaFEBX9zDUg8EH+mXeYmjL+p0kOW7bFbkRHTLY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=f5hEhB4RKm2YJuJxkzp+KkdK/BOB2unlv2Q91sTHFHZBqhqz4xjy1dQjaQ0T4+9+4
	 xt0kCaiYjsWDVzcD/o91HQAvyjfcbQWRJlazw4mjd0BNPx91kLnDo3jMvrhPDwr1iH
	 CgYJq0ZzVGdkI5v/gMwY3c2aI0JBYTF7dAH+yFu3bJIwTCVtUzE2Nf0DqXwj/PCBmk
	 x1VvBdzX7jSoUqC+KfbxCLl8nJMVy4uPH6y5EdLyQF4Vjf4bZ2FKvLfo1mIdWHLwI4
	 vgrGPP0uHwliAEZF9jIQjMp81eOTfDwOWwcR/RNc5iAi0VDDm/pfQXogkpcAnxzLf8
	 0zkOzpi0IbrUQ==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 14 May 2025 17:10:26 +0200
Subject: [PATCH RFT v2 06/15] drm/msm/a6xx: Simplify uavflagprd_inv
 detection
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-topic-ubwc_central-v2-6-09ecbc0a05ce@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747235442; l=2906;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=bZL0LcpVkYWUnd6I9/bCeMAuvtV6mePaijpXU+EQq5s=;
 b=4zo9703XVJLnUr32dmFlkU9Yv/Q9PpqQobjqJlHhqh+zJf+BTFD4GkELiXk/4uUhWufG1Ttwm
 27FvRyfiBn8Cj2rtEcjuWEkDhJZ4wt0LN9GWhsAx9f3mtuippwRQc5i
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Instead of setting it on a gpu-per-gpu basis, converge it to the
intended "is A650 family or A7xx".

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 334a4c4627ffb562a83f51e6e2c95e31af950c08..e7c89f9c7d89798699848743843eed6a58b94bd3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -593,7 +593,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 		return -EINVAL;
 
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
 
@@ -667,6 +660,7 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	u8 uavflagprd_inv = adreno_is_a650_family(adreno_gpu) || adreno_is_a7xx(adreno_gpu) ? 2 : 0;
 	const struct qcom_ubwc_cfg_data *cfg = adreno_gpu->common_ubwc_cfg;
 	/*
 	 * We subtract 13 from the highest bank bit (13 is the minimum value
@@ -695,7 +689,7 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
 		  level2_swizzling_dis << 12 | hbb_hi << 10 |
-		  adreno_gpu->ubwc_config.uavflagprd_inv << 4 |
+		  uavflagprd_inv << 4 |
 		  adreno_gpu->ubwc_config.min_acc_len << 3 |
 		  hbb_lo << 1 | ubwc_mode);
 

-- 
2.49.0


