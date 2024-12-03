Return-Path: <linux-arm-msm+bounces-40133-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id E31BC9E2984
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 18:40:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AC7151689D2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 17:40:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427191FBC9E;
	Tue,  3 Dec 2024 17:40:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZZQ3d5Nr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468441F8AD2
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 17:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733247619; cv=none; b=p/LW94fPkBQUUz/IEHO7+1do8glpV1IARINbkCFif+NAm3Ijy2tqwTuuZxs1VPoW5tn6fTzGy8PlLWMOk0gngLOceJvg/XtIHMrJ9FkbSkBWzA3uDuFW0ENizHtD+ij/T0dnmMSYlXjB6HCPHVviBwPiI18uSWxaJWHo7ybdjPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733247619; c=relaxed/simple;
	bh=gfAH76xNDLdFi1Oj0zPlEjOqmRGJT4ZyhZrUhPLLvY0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uAHem2KdrKEPv/Z+gUBqcMQfj/SE9OtJdS8S9I2MSwdr1yFEPaTPPxSFjdRiHuoTnEtOpR8zqlYp4d+1yj2sg1oHAJsnvgWS6KVi6MIP2gKvgaTvA01ao8GHyuqDeruXmccp7x6/1DqwKoHXGIrW+UrWvfcq2gEatCV6WySkRsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZZQ3d5Nr; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-53ddd4705f8so34571e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 09:40:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733247614; x=1733852414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HZLoDQcpgOLaU1lTyglYhkfpr6ByPhvEjXW697nSqBw=;
        b=ZZQ3d5Nr50lvH4qiUSd79TcxfPcGZksbjPSwNNKcWJZdIseumeWKYukPMayScMr3Ln
         DQtdsYNs+hGGB1KNjMyy9FDyWF4ax9/q/+JzJUNtTHXaT9knvhI4Tg21zXC8K5sn+vx2
         5gvyKXjOHs+V+uCvxgyRK5Qq7bYKOIXjR4+tX85SvkswrBUpIzkfbdlGWmoZrqkbc/T+
         LwgemXAHGDDyLoRoaC0JpgaeY0u4f/M1LOhi1gQ4rks2vSMdmxproRfEGjxKvT/D8JTX
         JcIH1+VFryhZBLZEghfhsSqsVtlrftrXblcFKXAfQtkOSy1ZxpkotvKtxV0ifWITFk18
         ny6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733247614; x=1733852414;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HZLoDQcpgOLaU1lTyglYhkfpr6ByPhvEjXW697nSqBw=;
        b=eB123PC5QgDgwTuehdLYoGG6k4tVmNJoyT/W2t0jlc5fsXRD38dGvAwp87k+LYHZdK
         fyNWXe6ctEgSCywq3bsh2NohQIHGe3CFs3jW7cmhfFqsFs1V8ciBhOPouPzai76Q4HAx
         ipbQh29LIr3qjAQ4db8SXtbCdV0XdyFfSDK+TvKsnrgpTsrzbrJdk9+/dFg3n2/ZUKjl
         8oe5C73eArBtQwd5niV2474PMKgK40SIauNriPV48DYuCbMOZq4nozAeQT/G8oMCvmcX
         xLZ3JLuOzELGEAXKbfB5NcYVt+dHK952nYioKhtPybDDs8MXC3rA6+WtF6jz4xwlYNoO
         jUDA==
X-Gm-Message-State: AOJu0YyFAsVsnUYRYWHqiNq/gbQl85hU3TQqCEGzFIZb033kzWff9inh
	kMMg9VpPcglSYjC88KdZMagyzdI41qg8+LST8gmc2VmZ6Pn05r78
X-Gm-Gg: ASbGnctOwqnFBwBGhUIeZQ5qERbH6226SE40Gfi2RUke0iijZ//PLJQtWmQNSOzRluE
	dNlK/J5DyC+G2jlauPvuDd1EEtGZ4g+W9F7u0xJgGKIYR/AIn0eDMuvMZnPuLDBO220NZ4ku60A
	qoqze9ecNWda9ECjNkCGpG5J2RwnsfwI5SBbkXRD+fd/BEL1FLi70qPl66KJ7rWY+c2oXL1AOGK
	RrpUFou2y9tBaj2gubPJ86pB7pKKjY1KsfFkFWDXI5k+P/oda9hSasijVTAl0/AxfhbQw==
X-Google-Smtp-Source: AGHT+IFBeguOEs/5r8tFomlRKvXO/Ie/OibumYMOZDeYaNma/fUtVKdR67ULZbcLJfWAkVYlemVSVg==
X-Received: by 2002:a05:6512:3f0b:b0:53d:f63a:e428 with SMTP id 2adb3069b0e04-53df63ae481mr8296012e87.27.1733247613984;
        Tue, 03 Dec 2024 09:40:13 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df644aab7sm1912115e87.106.2024.12.03.09.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 09:40:13 -0800 (PST)
From: Danylo Piliaiev <danylo.piliaiev@gmail.com>
X-Google-Original-From: Danylo Piliaiev <dpiliaiev@igalia.com>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org,
	danylo.piliaiev@gmail.com
Subject: [PATCH v2 1/1] drm/msm: Expose uche trap base via uapi
Date: Tue,  3 Dec 2024 18:40:11 +0100
Message-ID: <20241203174011.731980-2-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203174011.731980-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
 <20241203174011.731980-1-dpiliaiev@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On at least a6xx+, shader could read 64b ALWAYSON counter
from UCHE_TRAP_BASE+0 address. In Mesa it will be used
to implement VK_KHR_shader_clock and GL_ARB_shader_clock.
These extensions provide shader functions to query a real-time or
monotonically incrementing counter at the subgroup level or
across the device level.

On a4xx and a5xx it was not tested what is at UCHE_TRAP_BASE
address, there uche trap base is exposed just for completeness.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
---
Changes in v2:
- Rebased on top of https://patchwork.freedesktop.org/series/141667/
  in order to return error via UERR when there is no uche trap base.
- Updated commit message to explain why we need to expose the value.

---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  5 +++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 25 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
index 50c490b492f0..f1b18a6663f7 100644
--- a/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a4xx_gpu.c
@@ -251,8 +251,8 @@ static int a4xx_hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A4XX_UCHE_CACHE_WAYS_VFD, 0x07);
 
 	/* Disable L2 bypass to avoid UCHE out of bounds errors */
-	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, 0xffff0000);
-	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, 0xffff0000);
+	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A4XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
 
 	gpu_write(gpu, REG_A4XX_CP_DEBUG, (1 << 25) |
 			(adreno_is_a420(adreno_gpu) ? (1 << 29) : 0));
@@ -693,6 +693,8 @@ struct msm_gpu *a4xx_gpu_init(struct drm_device *dev)
 	if (ret)
 		goto fail;
 
+	adreno_gpu->uche_trap_base = 0xffff0000ffff0000ull;
+
 	if (!gpu->aspace) {
 		/* TODO we think it is possible to configure the GPU to
 		 * restrict access to VRAM carveout.  But the required
diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index ee89db72e36e..caf2c0a7a29f 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -750,10 +750,10 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	gpu_write(gpu, REG_A5XX_UCHE_CACHE_WAYS, 0x02);
 
 	/* Disable L2 bypass in the UCHE */
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, 0xFFFF0000);
-	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, 0x0001FFFF);
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, 0xFFFF0000);
-	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, 0x0001FFFF);
+	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_TRAP_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_LO, lower_32_bits(adreno_gpu->uche_trap_base));
+	gpu_write(gpu, REG_A5XX_UCHE_WRITE_THRU_BASE_HI, upper_32_bits(adreno_gpu->uche_trap_base));
 
 	/* Set the GMEM VA range (0 to gpu->gmem) */
 	gpu_write(gpu, REG_A5XX_UCHE_GMEM_RANGE_MIN_LO, 0x00100000);
@@ -1805,5 +1805,7 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 	adreno_gpu->ubwc_config.macrotile_mode = 0;
 	adreno_gpu->ubwc_config.ubwc_swizzle = 0x7;
 
+	adreno_gpu->uche_trap_base = 0x0001ffffffff0000ull;
+
 	return gpu;
 }
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 019610341df1..0ae29a7c8a4d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1123,12 +1123,12 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Disable L2 bypass in the UCHE */
 	if (adreno_is_a7xx(adreno_gpu)) {
-		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
+		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
 	} else {
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, 0x0001ffffffffffc0llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, 0x0001fffffffff000llu);
-		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, 0x0001fffffffff000llu);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_RANGE_MAX, adreno_gpu->uche_trap_base + 0xfc0);
+		gpu_write64(gpu, REG_A6XX_UCHE_TRAP_BASE, adreno_gpu->uche_trap_base);
+		gpu_write64(gpu, REG_A6XX_UCHE_WRITE_THRU_BASE, adreno_gpu->uche_trap_base);
 	}
 
 	if (!(adreno_is_a650_family(adreno_gpu) ||
@@ -2533,6 +2533,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		}
 	}
 
+	adreno_gpu->uche_trap_base = 0x1fffffffff000ull;
+
 	if (gpu->aspace)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 9649c0bd0a38..422b5b8b1197 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -386,6 +386,11 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = adreno_gpu->ubwc_config.macrotile_mode;
 		return 0;
+	case MSM_PARAM_UCHE_TRAP_BASE:
+		if (adreno_gpu->uche_trap_base == 0)
+			return UERR(EINVAL, drm, "no uche trap base");
+		*value = adreno_gpu->uche_trap_base;
+		return 0;
 	default:
 		return UERR(EINVAL, drm, "%s: invalid param: %u", gpu->name, param);
 	}
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index e71f420f8b3a..9bd38dda4308 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -253,6 +253,8 @@ struct adreno_gpu {
 	bool gmu_is_wrapper;
 
 	bool has_ray_tracing;
+
+	u64 uche_trap_base;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index b916aab80dde..2342cb90857e 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -90,6 +90,7 @@ struct drm_msm_timespec {
 #define MSM_PARAM_RAYTRACING 0x11 /* RO */
 #define MSM_PARAM_UBWC_SWIZZLE 0x12 /* RO */
 #define MSM_PARAM_MACROTILE_MODE 0x13 /* RO */
+#define MSM_PARAM_UCHE_TRAP_BASE 0x14 /* RO */
 
 /* For backwards compat.  The original support for preemption was based on
  * a single ring per priority level so # of priority levels equals the #
-- 
2.46.2


