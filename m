Return-Path: <linux-arm-msm+bounces-40062-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E85E9E1ACE
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 12:24:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8C940B382BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Dec 2024 09:59:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 660A91DDC25;
	Tue,  3 Dec 2024 09:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ie0Cxm+Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FAB51E0488
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Dec 2024 09:59:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733219967; cv=none; b=YWeflzdiKg3gfNNErd94xT7Av0lzpgVcn4E/9ixoAvjtZlWVbmRzVVsNN1njKSw14g35UwMxbmCixJ3wU83lw0XIiDkRaStKIZAG45el+K/2WszjC/SqIyxwpUMRCEbOZDPMmuw0FSwqqyhjytA/epasc27NRvvJLXpqlgycSbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733219967; c=relaxed/simple;
	bh=gmqMnRDZERHRwRbrL3Cxbp/S4U0KNibXieuqv/Lz/+M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LiANC/6aN1dpbJOOt97UIN6pn2JAscPuJbUHEowrVExSiMWREwNcmhKpKwda1C+YYS69wVKJogD3OeRK4z7k2exoNZZH3Gtdx6nFGp9GNt0m7Vsba8dAR7oGHvGiGhT52i+kkr2LfA020zzyKnYgas4HPfxc2zs25clFPBlXRrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ie0Cxm+Q; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso1743229a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Dec 2024 01:59:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733219964; x=1733824764; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QAdT/AkYZrS/JPMTUkdta47w083O08CKaY0xULIptt0=;
        b=ie0Cxm+Q4jKM4T90E75jwE5ojCpV7BayvCqedvO7pG8Pp5EZWHxsfg1w0zJ6qx3o2v
         19cJwHs7vpkujdZKTUKek0AlAtwJdNvpI6AcWfVyyMpy791QT+DlKQvGvI0rcFuo+1M7
         k1MmqvAtL2Erx/WRZICx1GXEntp/PZ3kFc3jE8wZr2Pt0PKUTDeNVBfUmyDNs4JxFJv8
         HQoO8lmqS4c9m8G7K1NUJFebj2d/tGp98LM1lc8IHHjnV/CRwdZC046x9nn+73vaFL68
         SxJjwtryTmLlY5XLPQLmBCydJZkK39Ny6MVrU9JX4zzmPTCgzGFOyw/IO362v10GR1P1
         cLhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733219964; x=1733824764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QAdT/AkYZrS/JPMTUkdta47w083O08CKaY0xULIptt0=;
        b=khIA3V3WhlAkZz+QNJbzln5F2WJau3OohyDIGr57WkC2z9FG8nZ8WpZTq0OqDRp5pn
         T1/6AbeaiouD2Y0f6w0VfcwzrwgFCwa+1oAYoT3CvYaQzOJYqv0WAv8fb5O752FHFxv2
         QKl0Z2kNLcQ7ty0vKM18lo3/ln8rYN6fJY/zn7yauLdm7K9L8UElagYnPz2J3PtDklyu
         jWqsbi6vn6QvsibYQrRFcctF+yGhDDgGaR6UU+d+IEksQtlLUnijFb+vWhP34pWAiRna
         JE9gROEVVgxedxHVSrT0YkOXGP4jyEK/BbJoXkqkRJ5voZH3wS6ScjlEODIe12IFjIUx
         gmSQ==
X-Gm-Message-State: AOJu0YzCcTwrGS/G9tJvzbzp1ZuMEuqeu+pO2dCIjJsLnftJq4kNsTWL
	yUZHMkeOIAu7WuVeGnqQgkbOFju7FlM6jdiCi4fBWARJPZoJipBP
X-Gm-Gg: ASbGncuOMjheAL807JJdzSxpjg6oAlwsmv2D9D2CM645FTwOFKGN62RACj6TYUMffV3
	Ggt3PzJ+918rMriYKNOWW8n6M33CiVaZx3WDJzWzzO0W+NtgXBx6CE4GXIVnfaRog0hErcs9E74
	bqQFC1Yxg3MVXwRn6pxilzrwZEaT1JPQsxJ0jU+V+bxXDsrzc+pzLDVpN6yArT4Z/ahT3YDpi2d
	Y3N1RpEd4RMIZ05fksrKjekv544l+NwX1pFtj8an05+8bv2fCyDCJMcYXzDA0I72bZECg==
X-Google-Smtp-Source: AGHT+IE+nKQiODkBKKztGbX5w++24oO3vwTU2xi/fRQzXUC8Vxl/wFOnwoz/+JerkyLYsF28728AGg==
X-Received: by 2002:a05:6402:35d1:b0:5d0:d786:b894 with SMTP id 4fb4d7f45d1cf-5d10cb80107mr1823931a12.26.1733219963450;
        Tue, 03 Dec 2024 01:59:23 -0800 (PST)
Received: from archlinux.tail7f7b1.ts.net ([195.136.68.87])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d097d9f6b6sm5867365a12.2.2024.12.03.01.59.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 01:59:22 -0800 (PST)
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
Subject: [PATCH 1/1] drm/msm: Expose uche trap base via uapi
Date: Tue,  3 Dec 2024 10:59:20 +0100
Message-ID: <20241203095920.505018-2-dpiliaiev@igalia.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241203095920.505018-1-dpiliaiev@igalia.com>
References: <20241203095920.505018-1-dpiliaiev@igalia.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This adds MSM_PARAM_UCHE_TRAP_BASE that will be used by Mesa
implementation for VK_KHR_shader_clock and GL_ARB_shader_clock.

Signed-off-by: Danylo Piliaiev <dpiliaiev@igalia.com>
---
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c   |  6 ++++--
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 10 ++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 12 +++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  3 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 ++
 include/uapi/drm/msm_drm.h              |  1 +
 6 files changed, 23 insertions(+), 11 deletions(-)

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
index 076be0473eb5..774ff6eacb9f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -385,6 +385,9 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 	case MSM_PARAM_MACROTILE_MODE:
 		*value = adreno_gpu->ubwc_config.macrotile_mode;
 		return 0;
+	case MSM_PARAM_UCHE_TRAP_BASE:
+		*value = adreno_gpu->uche_trap_base;
+		return 0;
 	default:
 		DBG("%s: invalid param: %u", gpu->name, param);
 		return -EINVAL;
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


