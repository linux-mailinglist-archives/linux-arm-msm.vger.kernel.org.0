Return-Path: <linux-arm-msm+bounces-57312-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B3B4BAB0268
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 20:15:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 81A39504416
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 May 2025 18:15:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4DBC22874E0;
	Thu,  8 May 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c81xgx+f"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E92E28937E;
	Thu,  8 May 2025 18:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746728051; cv=none; b=XElq6o3K7T4AJkO1g2tDxCCcpXtJYjU+UbOYWpyKCmccHQ2bDF0/RlFGj/4cveslP/cjkSony+a3n07GWjftKIoakmSY/85z54kG1SZKWTVepty733vkAyUhE99dsrgUMbhzAGR70Tg2FfhyNYrNsSoH9ckSyVgdT2WycFjRmNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746728051; c=relaxed/simple;
	bh=P3CAccmQOpyaTriYllajUgj/8OsbOl7gbCPh5wyAPJM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DEB3CZbqk8Q4YJH8JXh21jBIbELCZPDgQQN/9qxSLwDG+HrdWAhOJzt9pYsps1XLVDgxZfjkhVwgKpeBcZ+Ih3mNYA4dIGcEoNqul7lkz3N5+keEQ6UQY13GvKOtpCq6eRmv+VDmatWN9rVP4bU8niXbEO05lZGLQAGx20SmWd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c81xgx+f; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6BC7C4CEE7;
	Thu,  8 May 2025 18:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746728051;
	bh=P3CAccmQOpyaTriYllajUgj/8OsbOl7gbCPh5wyAPJM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c81xgx+fiy6dgffAG6iBHvXCl4/CSxdEv/zztbSE+KxruEjqGk+v7YI2jBP/fMfYh
	 EfLLpqyExuFypIznD0X3w89IlcSfa1YYGFJCGBrNH8pZiDI6QXpuXVs4UC0wdYkW3a
	 4QeSf2pVBgTY87SXhAFKIv/mCnjyHVZVLcvJ+8b78I4CnJn6Odqx95v7nWlGUEX/Sy
	 ArOgTtQimusvb2ij9BLu5ZErhVagw5hiVrQP5V4tgJjjkIDpiSvUQc/HoD1VlzFeSV
	 cldQ6CtExlRNhVivLkDcJaKABtjGSwtZvv95qroyU11EgrbY3k9rMu8hINFqd3ae17
	 KcQyXASdvZ+8A==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Thu, 08 May 2025 20:12:42 +0200
Subject: [PATCH RFT 10/14] drm/msm/a6xx: Stop tracking macrotile_mode
 (again)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250508-topic-ubwc_central-v1-10-035c4c5cbe50@oss.qualcomm.com>
References: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
In-Reply-To: <20250508-topic-ubwc_central-v1-0-035c4c5cbe50@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746728002; l=2664;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=fEi+/pRUWH3fcysAlmiv3GwevfiZcPYFy+z1RfmmQ+M=;
 b=7O9OisKq54zQDkxOW769oCsZ4KdFIAJ6o+e5RqglfIl8U7x05Dq/O6hs5KOCWJ728lr7YIASf
 MVTFttllawjAdBgfK6I4KGu0OaN8LkiUBvCdY6Ynzpiuh1GUMEu1b7P
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

SC8180X (A680) and SA8775P (A663) require a write to that register,
while other SKUs are fine with the default value. Don't overwrite it
needlessly, requiring the developer to read the value back from
hardware just to put it in the driver again, introducing much more room
for error.

Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 60f89a2d851a5c383fc14cce4c483f630132a9a6..bee7e9685aa3ea282fb20ef479e4d243d28418f7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -594,7 +594,6 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 
 	gpu->ubwc_config.min_acc_len = 0;
 	gpu->ubwc_config.ubwc_swizzle = 0x6;
-	gpu->ubwc_config.macrotile_mode = 0;
 	gpu->ubwc_config.highest_bank_bit = 2;
 
 	if (adreno_is_a610(gpu)) {
@@ -616,13 +615,8 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	if (adreno_is_a621(gpu))
 		gpu->ubwc_config.highest_bank_bit = 0;
 
-	if (adreno_is_a623(gpu)) {
+	if (adreno_is_a623(gpu))
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
-
-	if (adreno_is_a680(gpu))
-		gpu->ubwc_config.macrotile_mode = 1;
 
 	if (adreno_is_a650(gpu) ||
 	    adreno_is_a660(gpu) ||
@@ -631,19 +625,15 @@ static int a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	    adreno_is_a740_family(gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
 		gpu->ubwc_config.highest_bank_bit = 3;
-		gpu->ubwc_config.macrotile_mode = 1;
 	}
 
 	if (adreno_is_a663(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 0;
-		gpu->ubwc_config.macrotile_mode = 1;
 		gpu->ubwc_config.ubwc_swizzle = 0x4;
 	}
 
-	if (adreno_is_7c3(gpu)) {
+	if (adreno_is_7c3(gpu))
 		gpu->ubwc_config.highest_bank_bit = 1;
-		gpu->ubwc_config.macrotile_mode = 1;
-	}
 
 	if (adreno_is_a702(gpu)) {
 		gpu->ubwc_config.highest_bank_bit = 1;
@@ -691,8 +681,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL,
 		  adreno_gpu->ubwc_config.min_acc_len << 23 | hbb_lo << 21);
 
-	gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL,
-		  adreno_gpu->ubwc_config.macrotile_mode);
+	/* The reset value only needs altering in some cases */
+	if (adreno_is_a680(adreno_gpu) || adreno_is_a663(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_NC_MODE_CNTL, BIT(0));
 }
 
 static void a7xx_patch_pwrup_reglist(struct msm_gpu *gpu)

-- 
2.49.0


