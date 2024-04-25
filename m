Return-Path: <linux-arm-msm+bounces-18567-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BED8B2318
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 15:45:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id E366DB24C43
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Apr 2024 13:44:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 43A6C149C7B;
	Thu, 25 Apr 2024 13:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LZKGKJ3p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77B29149C4D
	for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 13:44:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714052692; cv=none; b=edAXGIwpYLWCpNcTdztSl0lB0sgS4+RLZ3LzDWs/xNz3L3KoLOi9lvTddnIfpOZL5eo+ib3vlbHT/JUXjLsE7xfltBIqY+OSk5RMKSpXrb3Y1CRRT+XUSQDhGSx/IpuOSQhKFkUleozDUoEMVxPy0tf6oxLnR06Jt7s5mMDyodA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714052692; c=relaxed/simple;
	bh=q+8vvV85Xt2kiI6v4uLqD484bTYDKTHjzQ5nlUt5WmI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NbwD8mTMjZTgo23GkdQdvoBbbMZBy90sUovnc0ltDjABfNH7pTKGv7aLnh5pv7/Q2g5/haJ3IybJXfEDx8yso2xc24n5WZ0sBS2fp3hPggcTTBXbqkn/VzGLXpmaJ2veVAxUEqMef0RLfPVMSjBgwVlWz95y2DC1+zesoAF1LFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LZKGKJ3p; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-41b5dd5aefaso2606995e9.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Apr 2024 06:44:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714052689; x=1714657489; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rTihIX8sLmoVIkXH5QcNahk5MX8P8s9owUap3i41n88=;
        b=LZKGKJ3p4FCHpUnz4rUkl/KMp06Mz8Xgy3v1FK73pw/fxskgeY6P4D86260peifLP0
         AWJlhGXh6jKaOzUYyv0RgsQGzXoCKFuL+JB6U4Z6SdfzqRU10ByJFsyqaTjebnJPnpli
         Br1Ukp+eAxurvNJkBOGyGls0WTyDLSMzdFEVMFIZVrUr1WeJPOsDjN40cSrIoddqBKuA
         zQbihr3nDrI32CXkdZ6UCzv4JWijZmcnrfHiKxBsVIKtIo7nAnyhS3NeuVXgt33YYDXk
         C6qgWolf+Fe1LG0Sbj4KqOnpARn+oXWwv6ljiTN0N/HcjA0dUDYVN7JwzwJGtsDHLLba
         /Mdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714052689; x=1714657489;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rTihIX8sLmoVIkXH5QcNahk5MX8P8s9owUap3i41n88=;
        b=fSr5dPaUYtDxYNuRWMjUw8NsdVAlcI6Xs5h9xh+Yh+p1tixEKGCWX4GTibbdNknAhQ
         loTQPY0RxXOYrJweB3748APJNYC0lRLwbthQOiG4kHRk9b55GJHnjwQQ6k4Ltiv1f22s
         B40AZiAh4qb6QLLEFlfqouUHtUJIwWeNVryT5dmhrugO2l2FznC3A/vbDE4nPhq3WqmH
         3kQjEr+fpeH4jHhq3NhqZ9BgLhqbar3aNwfHAOAcXfwcHTNeGTSWCShlHY117Fup1AG2
         4cdKyeLUijDRK4zIxxlb3DN41zxLgagh3HQOxEibOoTCPYgy/YRNkJLZABcMoqYhfO7W
         FuJA==
X-Forwarded-Encrypted: i=1; AJvYcCWHzuIGHiWwOXW2WRUvmUdEnESkPNnVswXRynFRTQd5RiEKjB8NgFsDL4rdOCgROc63dggVvqAkQN/QsIjkFGj4t9qhHYeAl8atG1QXVg==
X-Gm-Message-State: AOJu0YxYys9Dauor+s4s6vpp/lGAfXG1HzwQVPTxab2lQ1TDOy8/gdAS
	FJNwdEgdePSfkaNGDSz0/sSNwKnEKTzonoNry4B1B9ndxSK7g7oE
X-Google-Smtp-Source: AGHT+IFZ92tOkIQrO4aXjKukSWhhCUnA1Xin4NMwCj3oY3AYnvdhKhxqz09eLcO+ejeKoynapqIDTg==
X-Received: by 2002:a05:600c:4691:b0:415:6daf:c626 with SMTP id p17-20020a05600c469100b004156dafc626mr5654356wmo.21.1714052688603;
        Thu, 25 Apr 2024 06:44:48 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 06:44:47 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
Date: Thu, 25 Apr 2024 14:43:52 +0100
Message-Id: <20240425134354.1233862-5-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
initialize cx_mem. Copy this from downstream (minus BCL which we
currently don't support). On a750, this includes a new "fuse" register
which can be used by qcom_scm to fuse off certain features like
raytracing in software. The fuse is default off, and is initialized by
calling the method. Afterwards we have to read it to find out which
features were enabled.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 89 ++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
 2 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..fb2722574ae5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/firmware/qcom/qcom_scm.h>
 #include <linux/pm_domain.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
@@ -1686,7 +1687,8 @@ static int a6xx_zap_shader_init(struct msm_gpu *gpu)
 		       A6XX_RBBM_INT_0_MASK_RBBM_HANG_DETECT | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS | \
 		       A6XX_RBBM_INT_0_MASK_UCHE_TRAP_INTR | \
-		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR)
+		       A6XX_RBBM_INT_0_MASK_TSBWRITEERROR | \
+		       A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
 
 #define A7XX_APRIV_MASK (A6XX_CP_APRIV_CNTL_ICACHE | \
 			 A6XX_CP_APRIV_CNTL_RBFETCH | \
@@ -2356,6 +2358,26 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
 	kthread_queue_work(gpu->worker, &gpu->recover_work);
 }
 
+static void a7xx_sw_fuse_violation_irq(struct msm_gpu *gpu)
+{
+	u32 status;
+
+	status = gpu_read(gpu, REG_A7XX_RBBM_SW_FUSE_INT_STATUS);
+	gpu_write(gpu, REG_A7XX_RBBM_SW_FUSE_INT_MASK, 0);
+
+	dev_err_ratelimited(&gpu->pdev->dev, "SW fuse violation status=%8.8x\n", status);
+
+	/* Ignore FASTBLEND violations, because the HW will silently fall back
+	 * to legacy blending.
+	 */
+	if (status & (A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+		      A7XX_CX_MISC_SW_FUSE_VALUE_LPAC)) {
+		del_timer(&gpu->hangcheck_timer);
+
+		kthread_queue_work(gpu->worker, &gpu->recover_work);
+	}
+}
+
 static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 {
 	struct msm_drm_private *priv = gpu->dev->dev_private;
@@ -2384,6 +2406,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
 		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
 
+	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+		a7xx_sw_fuse_violation_irq(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
 		msm_gpu_retire(gpu);
 
@@ -2525,6 +2550,60 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 gpu_req = QCOM_SCM_GPU_ALWAYS_EN_REQ;
+	u32 fuse_val;
+	int ret;
+
+	if (adreno_is_a740(adreno_gpu)) {
+		/* Raytracing is always enabled on a740 */
+		adreno_gpu->has_ray_tracing = true;
+	}
+
+	if (!qcom_scm_is_available()) {
+		/* Assume that if qcom scm isn't available, that whatever
+		 * replacement allows writing the fuse register ourselves.
+		 * Users of alternative firmware need to make sure this
+		 * register is writeable or indicate that it's not somehow.
+		 * Print a warning because if you mess this up you're about to
+		 * crash horribly.
+		 */
+		if (adreno_is_a750(adreno_gpu)) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM is not available, poking fuse register\n");
+			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+			adreno_gpu->has_ray_tracing = true;
+		}
+
+		return 0;
+	}
+
+	if (adreno_is_a750(adreno_gpu))
+		gpu_req |= QCOM_SCM_GPU_TSENSE_EN_REQ;
+
+	ret = qcom_scm_gpu_init_regs(gpu_req);
+	if (ret)
+		return ret;
+
+	/* On a750 raytracing may be disabled by the firmware, find out whether
+	 * that's the case. The scm call above sets the fuse register.
+	 */
+	if (adreno_is_a750(adreno_gpu)) {
+		fuse_val = a6xx_llc_read(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	}
+
+	return 0;
+}
+
+
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -3094,6 +3173,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
+	if (adreno_is_a7xx(adreno_gpu)) {
+		ret = a7xx_cx_mem_init(a6xx_gpu);
+		if (ret) {
+			a6xx_destroy(&(a6xx_gpu->base.base));
+			return ERR_PTR(ret);
+		}
+	}
+
 	if (gpu->aspace)
 		msm_mmu_set_fault_handler(gpu->aspace->mmu, gpu,
 				a6xx_fault_handler);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77526892eb8c..4180f3149dd8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -182,6 +182,8 @@ struct adreno_gpu {
 	 */
 	const unsigned int *reg_offsets;
 	bool gmu_is_wrapper;
+
+	bool has_ray_tracing;
 };
 #define to_adreno_gpu(x) container_of(x, struct adreno_gpu, base)
 
-- 
2.31.1


