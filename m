Return-Path: <linux-arm-msm+bounces-18929-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CD5F28B704B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:45:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D6328B21AF5
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C98812DD9D;
	Tue, 30 Apr 2024 10:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zoc5pWHJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 032D612D1F6;
	Tue, 30 Apr 2024 10:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714473860; cv=none; b=KHcnogfTygXRaUeytCOwLz7Pj/nABYFbEZnzDNx0mo1/MEY0uiQsNx8o9gYVD5MkBt/k9fPJ8VRf1CxpWEeIg23C3y06101P7y3gpbxQ4OI3tPXbOgfMljeLlNgRu/BMURHpSLcg55CFkTB/RqJ65PiLUXTL/nNdKEB2CJdSUqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714473860; c=relaxed/simple;
	bh=xF43mVMcs8MO8ap+Pvdie9rN2riFcwBreI/fz5B9u2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rXyvGT/qU9Kq966O6GL8R2/yTcOpVHC6SShNCVKaiye8ForQ0aAco8tblvJo0vGPAO2/zsOd9w3Ap+y8t2tht0r6LrCIswDYWbGgFfiinRGSh8ehfszOiERsmse7DoCjWqSDuL9Tz2vEtX3Qcj80Ki9XxdUQsxvTDr6TXL46jFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zoc5pWHJ; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-41b4ff362a8so50762625e9.0;
        Tue, 30 Apr 2024 03:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714473856; x=1715078656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=swuWmjFhwBOQQWEST6sVjksYDm7049vHTM6meYi4ink=;
        b=Zoc5pWHJTmTDu6wGvwkgO81wJJUFa+Ucoz6PXu9nfSihpLGvwONP6/nVlSbXMNjj7v
         uc0b1OYmy0WLSkgcmMVyuYsTs73rpxxx9ctofYNI9lwf8jZ6AilA7fkv/FHHXNjl4tid
         ZdmRI1VupUrKI6zpicinqx6GDq+YF6StTPss4u7dB2zdOfXewHCBLAtIEZ0XFifzbiCw
         RVVf4TIsptOclyUNsdHxi85vIUPwaK06lNg7n3w3jIGZrMx8wQ/PJsgbr0Iyp8EHw2Up
         P1nlmnKacKe6Toheam/2fppDaqpGf8kZYrHQNFO/OwjUpV4kg7+85+PqwfRRWV14e8lN
         6SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714473856; x=1715078656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=swuWmjFhwBOQQWEST6sVjksYDm7049vHTM6meYi4ink=;
        b=R4oEDcOkST9XorTvqr4aEpNwpISPTyXjbL4VU0d+QV1wHH/gQErOI/NkAMGMYUEcl8
         1Fbdtdk1usMXpONN4zwkipzeILpsNbG5+S4H4xmZuD2O+xAUolppFugAvrqyeozx9ItN
         Qh6jclmZcqVAZQHtvtCD9U+lCbooZHULDS80/x6HFJyCMWHDpqVOgyn9/JB0YYZ1RluL
         sOMp/oJ7DCVw/IjswV/YIdkW+lATQ10SFWa95VDFHvFl53X98V4E/QW42+QdaMvzRk0/
         wq73q0/Vfs8kddad9ldYrDIbWETHCwJPV6EMYtBnHE3yQcUwgGMaUgbW7tnqQLQvpuHW
         7tWg==
X-Forwarded-Encrypted: i=1; AJvYcCXgnJR0x7QL12Gu4NRaXgNRGuwqodsWJ2vFglpiYt7VoEKrH/n4ZJ+ghIKdkrSyFGYfoLEPc+Dds0BE+9OYhD9k5VeD88GmsBJXiQ==
X-Gm-Message-State: AOJu0Yx21eVBPcUmJSQH61wcGhAeMa93boHSKlCSqGi2FJsy4sGFm6Ha
	FRsikSDKZWSaLXcVffTRTjbbgVms227OHpyle4Hn5V5tQu8TqeZl
X-Google-Smtp-Source: AGHT+IFi6+edvCSxnzf227DMOGNourKZAJBz19Un/ND/aUahCcDGagndZMi5CpKzrvoQAAm0Jy+d0w==
X-Received: by 2002:a05:600c:1910:b0:41a:e5f5:99f8 with SMTP id j16-20020a05600c191000b0041ae5f599f8mr14083300wmq.18.1714473856345;
        Tue, 30 Apr 2024 03:44:16 -0700 (PDT)
Received: from [192.168.0.20] (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d48c8000000b0034af40b2efdsm23595951wrs.108.2024.04.30.03.44.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:44:15 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 30 Apr 2024 11:43:18 +0100
Subject: [PATCH v3 4/6] drm/msm/a7xx: Initialize a750 "software fuse"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240430-a750-raytracing-v3-4-7f57c5ac082d@gmail.com>
References: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
In-Reply-To: <20240430-a750-raytracing-v3-0-7f57c5ac082d@gmail.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Jun Nie <jun.nie@linaro.org>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714473850; l=5711;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=xF43mVMcs8MO8ap+Pvdie9rN2riFcwBreI/fz5B9u2E=;
 b=ml+XbxWc/FevhKhPUQSK8jdB1mGNA2fFpD01wXiUnSIYZHZ6sq7FvLSvSG36tiMBS7cdJCShB
 YemrvM2Rp7ICLQjBrk5Y1QiuSBFR7nkmwrRoukFJUbucVTkkbyCNgUu
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=

On all Qualcomm platforms with a7xx GPUs, qcom_scm provides a method to
initialize cx_mem. Copy this from downstream (minus BCL which we
currently don't support). On a750, this includes a new "fuse" register
which can be used by qcom_scm to fuse off certain features like
raytracing in software. The fuse is default off, and is initialized by
calling the method. Afterwards we have to read it to find out which
features were enabled.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 91 ++++++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  2 +
 2 files changed, 92 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..52b080206090 100644
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
@@ -2356,6 +2358,27 @@ static void a6xx_fault_detect_irq(struct msm_gpu *gpu)
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
+	/*
+	 * Ignore FASTBLEND violations, because the HW will silently fall back
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
@@ -2384,6 +2407,9 @@ static irqreturn_t a6xx_irq(struct msm_gpu *gpu)
 	if (status & A6XX_RBBM_INT_0_MASK_UCHE_OOB_ACCESS)
 		dev_err_ratelimited(&gpu->pdev->dev, "UCHE | Out of bounds access\n");
 
+	if (status & A6XX_RBBM_INT_0_MASK_SWFUSEVIOLATION)
+		a7xx_sw_fuse_violation_irq(gpu);
+
 	if (status & A6XX_RBBM_INT_0_MASK_CP_CACHE_FLUSH_TS)
 		msm_gpu_retire(gpu);
 
@@ -2525,6 +2551,61 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+{
+	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
+	struct msm_gpu *gpu = &adreno_gpu->base;
+	u32 fuse_val;
+	int ret;
+
+	if (adreno_is_a750(adreno_gpu)) {
+		/*
+		 * Assume that if qcom scm isn't available, that whatever
+		 * replacement allows writing the fuse register ourselves.
+		 * Users of alternative firmware need to make sure this
+		 * register is writeable or indicate that it's not somehow.
+		 * Print a warning because if you mess this up you're about to
+		 * crash horribly.
+		 */
+		if (!qcom_scm_is_available()) {
+			dev_warn_once(gpu->dev->dev,
+				"SCM is not available, poking fuse register\n");
+			a6xx_llc_write(a6xx_gpu, REG_A7XX_CX_MISC_SW_FUSE_VALUE,
+				A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING |
+				A7XX_CX_MISC_SW_FUSE_VALUE_FASTBLEND |
+				A7XX_CX_MISC_SW_FUSE_VALUE_LPAC);
+			adreno_gpu->has_ray_tracing = true;
+			return 0;
+		}
+
+		ret = qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ |
+					     QCOM_SCM_GPU_TSENSE_EN_REQ);
+		if (ret)
+			return ret;
+
+		/*
+		 * On a750 raytracing may be disabled by the firmware, find out
+		 * whether that's the case. The scm call above sets the fuse
+		 * register.
+		 */
+		fuse_val = a6xx_llc_read(a6xx_gpu,
+					 REG_A7XX_CX_MISC_SW_FUSE_VALUE);
+		adreno_gpu->has_ray_tracing =
+			!!(fuse_val & A7XX_CX_MISC_SW_FUSE_VALUE_RAYTRACING);
+	} else {
+		if (adreno_is_a740(adreno_gpu)) {
+			/* Raytracing is always enabled on a740 */
+			adreno_gpu->has_ray_tracing = true;
+		}
+
+		if (qcom_scm_is_available())
+			return qcom_scm_gpu_init_regs(QCOM_SCM_GPU_ALWAYS_EN_REQ);
+	}
+
+	return 0;
+}
+
+
 #define GBIF_CLIENT_HALT_MASK		BIT(0)
 #define GBIF_ARB_HALT_MASK		BIT(1)
 #define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
@@ -3094,6 +3175,14 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
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


