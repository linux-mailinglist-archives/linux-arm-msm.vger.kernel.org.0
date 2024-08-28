Return-Path: <linux-arm-msm+bounces-29791-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CBF3962B43
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 17:08:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BE842B24B14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 15:08:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E3B911A3BC3;
	Wed, 28 Aug 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eL4JVlZs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3831DFCF;
	Wed, 28 Aug 2024 15:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724857649; cv=none; b=ZimgqFe8poC2eepl/YuwiVqzpXXZivfkSlEjMssgo/+lguZBjcWX5I+FuLfo/Bv5GNLpPEa4FcM5ZHeE1y8uWKkpX2F2X6fyr4LEDjtI3Heeo8gLVbPYKaCVIwmIApdKg8J+aRKJmyydK86YOP7nBS7nDYpIERlqbinvKVAV23Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724857649; c=relaxed/simple;
	bh=KzCV689rRHj9LTg/b6rrYCx7sCt+nSxr+RJmwcuxtlw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fDTl/4Gu5DLEZTY+YCn2RuDbMZ6Qu0yMow9mn8HuZHKQ1Hv7V70Cs6g9RPzUQa13uCbc9FojcrPllcfCqTZRenSmsjz2jcPlV6ouBeTZQSJMfX4CfzTs5TL52NaKLRfclZvfbLW+eWY3dJ2RNwJ5c/32DqgjaBhAdQ4iTpUVTzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eL4JVlZs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B9CCC4CECB;
	Wed, 28 Aug 2024 15:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724857649;
	bh=KzCV689rRHj9LTg/b6rrYCx7sCt+nSxr+RJmwcuxtlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=eL4JVlZs+xnXJzFZJPl2ctO0iGzMSa1PtOBVrROwbuMBk8IRynYeovRNi4e8O3otE
	 t4RpcFOEDLep5RYn1oL3ppCKuGd96+K2kyLhnyqmVenAh8fykXBDWsT6gEP5uE14Mc
	 fR+dpPmaFMZhSyF9DJNJgrymolBqLtLvrTJ6rIQC5wFhfY6FOpno3Gp0cEH8qO295n
	 HnT9caG5T3VdBLIlCzRkVE62NvR1qH+nRbKDX1yGg7FJX7rBb/fLslxB4Q/Ir5/Ad8
	 diqHiAKtEXdffRSr2t/n0VDGtREgPwxVyiHPALkhME9+aj0z5Jjg3Jr2XgwzUx5+DP
	 3r5tVxfohmCdg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 28 Aug 2024 17:06:58 +0200
Subject: [PATCH v2 5/6] drm/msm/a6xx: Set GMU CGC properties on a6xx too
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240828-topic-a621-v2-5-1882c6b57432@kernel.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1724857626; l=3400;
 i=konradybcio@kernel.org; s=20230215; h=from:subject:message-id;
 bh=nN1jIdmgpJFQCKZJ2uyox0t9bNkXH+G8RpT+oJBTlJQ=;
 b=Zm/qGzoLNLIItno0Ae/hVTOEfKCnrnDl7lvXipzVsVPrU/nsK8wN8IZSoKMufOJCFNJgE5oQY
 8GzIVsU06quDxfmeGHbGhJO83y+C0rVNt7gmYFu4ptbSYcTNjiEUfIp
X-Developer-Key: i=konradybcio@kernel.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

This was apparently never done before.. Program the expected values.

This also gets rid of sneakily setting that register through the HWCG
reg list on A690.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  1 -
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 18 ++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h   |  8 +++++++-
 3 files changed, 17 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index 6cd73abd95d4..deee0b686962 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -448,7 +448,6 @@ static const struct adreno_reglist a690_hwcg[] = {
 	{REG_A6XX_RBBM_CLOCK_CNTL_GMU_GX, 0x00000222},
 	{REG_A6XX_RBBM_CLOCK_DELAY_GMU_GX, 0x00000111},
 	{REG_A6XX_RBBM_CLOCK_HYST_GMU_GX, 0x00000555},
-	{REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL, 0x20200},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL, 0x10111},
 	{REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL, 0x5555},
 	{}
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 871452daa189..33a319f7d200 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,6 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
+	u32 cgc_delay, cgc_hyst;
 	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
@@ -416,14 +417,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	if (adreno_is_a7xx(adreno_gpu)) {
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
-			  state ? 0x10111 : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
-			  state ? 0x5555 : 0);
-	}
+	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
+	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
+			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
+			state ? cgc_delay : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
+			state ? cgc_hyst : 0);
 
 	if (!adreno_gpu->info->a6xx->hwcg) {
 		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..26972b2cc896 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -433,7 +433,13 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
 }
 
-/* check for a615, a616, a618, a619 or any a630 derivatives */
+/* TODO: 615/616 */
+static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a618(gpu) ||
+	       adreno_is_a619(gpu);
+}
+
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))

-- 
2.46.0


