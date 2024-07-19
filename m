Return-Path: <linux-arm-msm+bounces-26619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 88621937668
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 12:04:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC27AB25ED9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 Jul 2024 10:04:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6772786131;
	Fri, 19 Jul 2024 10:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AWlt/1fv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B4E983A17
	for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 10:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721383435; cv=none; b=FYZuiWHxst5nMv1muXJvI4E4wvM5QdeDWKifFRuGa0Zd0Z+JNpqpFz2bfuSgmnLUrLoA6NskYzzYKvpCExcPHEYSMz3HL0KNgVYRgh/cMaMccYZQ2++UxNVrDdAgKr3rePM5uwzQfRBpt/xp87p1IplBeVcfPnr4iqYC9izhzU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721383435; c=relaxed/simple;
	bh=O84FzyjB2Eyhi66LD4wz7IxJGuAWHj3uy6YrALAP+Mg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f2BLIPG8m1RwJbAqf+fSxFWrl65n1ELQq3+eyjjBQ8ThRtdG3c8LI8blB7MNbUSTcO0qlX33C14zHV7/vk4WMSi/PBxjNWGxY61gKWh12ayIU2e92qm6qFy3Zne1/gWNpo45/IeMwMXrY5n3lCTyxQNaXuMef9SbqMtCtAtleG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AWlt/1fv; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so24165531fa.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 19 Jul 2024 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721383432; x=1721988232; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sJ7jGok25wqCohKFmjM2Uxuf4408Pvnq3D5lzo9Msgk=;
        b=AWlt/1fvOJO2rYApR9RiAzDeXGYj1nOhZjZ+zcRb+w7Aaixww+U6oGUJuitobZ/4L4
         bRwyCWC+OyHBj/zNAc1ZLj/NkQwtbcsZDVD8v/NvhnZNhwLArzb2ly8AkS+TWtsDhr4S
         DsNMVsyrAIV8WUCSgsLeGeJrqPS3cqHm5UBIK/rK21RkIgX3cF6vor5qUK37pyTQVUuB
         rItr3gsYpWFAi4pfUOVNWslBC68rAAgmVdO2mP7NXqPOT+ugOGPGs+Yqt+yZovckaJV2
         dtDipIeKc6Bt0f8ae0vkLxs0ndy27utA403tIZ2Sfvjx/8qPGq407hF8gfWmpqqjTC6N
         oSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721383432; x=1721988232;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sJ7jGok25wqCohKFmjM2Uxuf4408Pvnq3D5lzo9Msgk=;
        b=OtbYiYYhLQTI2VS7/1R6VRXHucDf2IhD+N+gmgLMKfBdh0/p73xoSNVLidP6AKrepe
         4kv6GNksLB1BK1v7bqDPeUn+7JSuuYzuB3/Sbt7RBI2/P+xywvbdK2ntTXkema7nMPoP
         nXPb/TrG1ht1jm9BhNTQy59ZZX/8PyAcDZ8JfNXNnqjNnEChVbtqOoKKXqcKzKWjNe1t
         2D2Jtu9UQkw09+6nLlUbVqEgPXmKidRFeJ53nvpDv7vuh82LFIzumtqvcIUdOXhhlTnx
         itSSRQzNe0yi+kN14jdKXsQahrvzVuh03cg9YU3dnh8C8EGT17gEeSf7WtCCHNMENYFD
         7N7g==
X-Forwarded-Encrypted: i=1; AJvYcCXKp6/odQAMgIYkgQ//EX7qHYnc4aJn9M+i1lQyoUHxHZc9dhgyjaTez9lMM/FDoyty+jo2vRV4x78m0i99/rHVnz47E9Uk7AnT/g7+Vw==
X-Gm-Message-State: AOJu0Yyh4bl8mObxEWfheiiKOdikOhPzz5LI6V6z3TkOecTLrGdCUTHb
	7txoJpm42aY188ORURPGkNwiGgxRgasYW+Jz6Thlfc+kablMNDDirnmf0EXzXyU=
X-Google-Smtp-Source: AGHT+IH8l/ppqpwuc0EDxTBACl80JK0PwE7h+5Db4+LmrW0cD8ffIzSXVpqM8mNVlc5/xi2veXyoUg==
X-Received: by 2002:a2e:998c:0:b0:2ec:1dfc:45bf with SMTP id 38308e7fff4ca-2ef05d4d44emr31816751fa.42.1721383431508;
        Fri, 19 Jul 2024 03:03:51 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 03:03:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:29 +0200
Subject: [PATCH 4/5] drm/msm/a6xx: Set GMU CGC properties on a6xx too
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-4-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=2625;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=O84FzyjB2Eyhi66LD4wz7IxJGuAWHj3uy6YrALAP+Mg=;
 b=1ZwfQLvOrlfwRBd+kJWRxJFSJphLbrCDE9sDQrNr9Pk9pBIzAo4MOlf4BGjKxEgYSadu2S5x+
 iofpPsoNnDKDt7pGAdtbcK9zW/BCkGXokeSNHg9Vz7b2NjnoJqlClAz
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

This was apparently never done before.. Program the expected values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 ++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  8 +++++++-
 2 files changed, 17 insertions(+), 9 deletions(-)

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
2.45.2


