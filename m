Return-Path: <linux-arm-msm+bounces-17759-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D13C58A8CA8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 22:05:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5C7D81F22025
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Apr 2024 20:05:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4843517555C;
	Wed, 17 Apr 2024 20:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cjoclzfb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37598173340
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 20:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713384199; cv=none; b=JREvhlxkTGsJHuwq0hVmTxSYiFCnTQRgbVqe2Q2qPn9ByN8xp1e+//caxsNF8VIvIQkU5fKbfudMliUUM8wNrLCidS52OhnBt9VV2H9LfRdzRqbaUmW9wb8WNRlM4H/oXVMUSAUi7anvjFRpNTMpllfWEL7bvZByurqQ/j6lwms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713384199; c=relaxed/simple;
	bh=S10PCpTFN0un9HwZFsMBIWkYBn7+o9GzGun7ODMa7oo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tx6e+HJfUxRloeNKiaRijiQ4q/0JW4HyvyLQgvgH4hSMr7qFkcySe4DguzFw+RTuoXWn2NPgkknnPQDJYB9X+pfueF9XLq0B469Fc4daXrvQ8oAFHhGeD06cuI1x8oxn9pF02rT08m89YgU9bx4UHRAA7M0LAzi0+IQTxjc0LQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cjoclzfb; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5709cb80b03so95677a12.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Apr 2024 13:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713384195; x=1713988995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=REVFkACRaO0HAJlK+j4piakARn+ysc5bNh9PDGof5bs=;
        b=cjoclzfb8CFUWT6DOe94PzeeW9V03WeTW+b2ItBQVHbcgJP1D/SagEbjvy8WSthxPz
         RMKXr4puV7rvLE07HLuOoolGPEEiakYRWNieCptVez4WJ8A4ctusTVQAkliIYU1MvgYg
         lm+f/eHoIrhOa8ygr5LcoLfuZJYHyZMBnLFZNtJJ9c/Kx5/u2VryVBgIrNkQh3jwCJ1y
         TEM41wejNIlFipCT1JWNbc0M0CkXJ+DLw/+RAwV5CSZJ7jFwyl5HxNTiI953fW8S4dyp
         eyG8gtXEm6L53ruF86tWcKOJa3ID1vtf1QMInCVTxaBpVHucVdK8/RrpzCHwKYl4pyni
         /kMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713384195; x=1713988995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=REVFkACRaO0HAJlK+j4piakARn+ysc5bNh9PDGof5bs=;
        b=c93xwqY0CvF1/L0gSfZppVcm/ipY4R4w6D/yQA8GWcEgcEtq1ANC9yBsb6+wn0H+8V
         mT0UnLtDKeMLMq6i2GNgX3oPjCgT3YUcjlfOLZGiYujgDHIHa3U4Volox2Dwh9iZ8L1k
         fhOblnrCt1T+wZ+KZ/+7MON6Vyg5Tvqj4B28BpduEMF+YRXbDNXuCGG205YsaYZhuLwV
         5XzkvbIFuuekvsjtfuDdeWRw7XgLBc/czOvlAh+JkxSRN1FTn4f6XtgIJ5y8bmntyGNz
         3ozgc3Mlu5zEbBQsrIbtlSF9btKdIoIZcVvlOkb8BNgisjlj9xCZnoSDXATjB4aTVY1/
         uf8g==
X-Gm-Message-State: AOJu0YwoaSpJZqV9fwToHPTJzDnU5TQ12A5oUR7C5qIj24jNB9Q0rW7A
	f90iQ5cVoQHeZXPacRzdPUpPqI7kqDFEFimHvJALsO76CnI93ftqyWCd4IIwMUU=
X-Google-Smtp-Source: AGHT+IF6G2a7dhSncavEulxEx5yl7AkFOijA1bjMry8TWgW4REHvjLsQBDmImobxDNRAz733I3zRhw==
X-Received: by 2002:a17:906:36d2:b0:a52:6832:1ae0 with SMTP id b18-20020a17090636d200b00a5268321ae0mr312668ejc.59.1713384195619;
        Wed, 17 Apr 2024 13:03:15 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl. [78.88.45.141])
        by smtp.gmail.com with ESMTPSA id xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 13:03:15 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:58 +0200
Subject: [PATCH v2 6/7] drm/msm/adreno: Redo the speedbin assignment
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-6-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=9223;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=S10PCpTFN0un9HwZFsMBIWkYBn7+o9GzGun7ODMa7oo=;
 b=tj5HzdetFHLQob37GHyLa73WGELw+zD8uDp+yvyhYW6oopylMs5KEwQb931kFbOLTzixsaONp
 L5sHsCrDE3JDTkstVV6Hrs8vWqePQaIYtNzepwpItzgy07a0mSf0sTb
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

There is no need to reinvent the wheel for simple read-match-set logic.

Make speedbin discovery and assignment generation independent.

This implicitly removes the bogus 0x80 / BIT(7) speed bin on A5xx,
which has no representation in hardware whatshowever.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 34 ----------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 56 --------------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 70 +++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  3 --
 drivers/gpu/drm/msm/msm_gpu.c           |  3 --
 5 files changed, 57 insertions(+), 109 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index c003f970189b..eed6a2eb1731 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -1704,38 +1704,6 @@ static const struct adreno_gpu_funcs funcs = {
 	.get_timestamp = a5xx_get_timestamp,
 };
 
-static void check_speed_bin(struct device *dev)
-{
-	struct nvmem_cell *cell;
-	u32 val;
-
-	/*
-	 * If the OPP table specifies a opp-supported-hw property then we have
-	 * to set something with dev_pm_opp_set_supported_hw() or the table
-	 * doesn't get populated so pick an arbitrary value that should
-	 * ensure the default frequencies are selected but not conflict with any
-	 * actual bins
-	 */
-	val = 0x80;
-
-	cell = nvmem_cell_get(dev, "speed_bin");
-
-	if (!IS_ERR(cell)) {
-		void *buf = nvmem_cell_read(cell, NULL);
-
-		if (!IS_ERR(buf)) {
-			u8 bin = *((u8 *) buf);
-
-			val = (1 << bin);
-			kfree(buf);
-		}
-
-		nvmem_cell_put(cell);
-	}
-
-	devm_pm_opp_set_supported_hw(dev, &val, 1);
-}
-
 struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
@@ -1763,8 +1731,6 @@ struct msm_gpu *a5xx_gpu_init(struct drm_device *dev)
 
 	a5xx_gpu->lm_leakage = 0x4E001A;
 
-	check_speed_bin(&pdev->dev);
-
 	nr_rings = 4;
 
 	if (config->info->revn == 510)
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 60708c23ae4c..1242697d64a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2878,55 +2878,6 @@ static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return progress;
 }
 
-static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
-{
-	if (!info->speedbins)
-		return UINT_MAX;
-
-	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++)
-		if (info->speedbins[i].fuse == fuse)
-			return BIT(info->speedbins[i].speedbin);
-
-	return UINT_MAX;
-}
-
-static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
-				 struct device *dev,
-				 const struct adreno_info *info)
-{
-	u32 supp_hw;
-	u32 speedbin;
-	int ret;
-
-	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
-	/*
-	 * -ENOENT means that the platform doesn't support speedbin which is
-	 * fine
-	 */
-	if (ret == -ENOENT) {
-		return 0;
-	} else if (ret) {
-		dev_err_probe(dev, ret,
-			      "failed to read speed-bin. Some OPPs may not be supported by hardware\n");
-		return ret;
-	}
-
-	supp_hw = fuse_to_supp_hw(info, speedbin);
-
-	if (supp_hw == UINT_MAX) {
-		DRM_DEV_ERROR(dev,
-			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware\n",
-			speedbin);
-		supp_hw = BIT(0); /* Default */
-	}
-
-	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -3058,13 +3009,6 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
-	if (ret) {
-		a6xx_llc_slices_destroy(a6xx_gpu);
-		kfree(a6xx_gpu);
-		return ERR_PTR(ret);
-	}
-
 	if (is_a7xx)
 		ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs_a7xx, 1);
 	else if (adreno_has_gmu_wrapper(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 58fd70140685..08b2f08e2a14 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -1060,8 +1060,8 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
-int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
-			 struct device *dev, u32 *fuse)
+static int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+				struct device *dev, u32 *fuse)
 {
 	u32 fcode;
 	int ret;
@@ -1095,6 +1095,46 @@ int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
 	return 0;
 }
 
+#define ADRENO_SPEEDBIN_FUSE_NODATA	0xFFFF /* Made-up large value, expected by mesa */
+static int adreno_set_speedbin(struct adreno_gpu *adreno_gpu, struct device *dev)
+{
+	const struct adreno_info *info = adreno_gpu->info;
+	u32 fuse = ADRENO_SPEEDBIN_FUSE_NODATA;
+	u32 supp_hw = UINT_MAX;
+	int ret;
+
+	/* No speedbins defined for this GPU SKU => allow all defined OPPs */
+	if (!info->speedbins) {
+		adreno_gpu->speedbin = ADRENO_SPEEDBIN_FUSE_NODATA;
+		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	}
+
+	/*
+	 * If a real error (not counting older devicetrees having no nvmem references)
+	 * occurs when trying to get the fuse value, bail out.
+	 */
+	ret = adreno_read_speedbin(adreno_gpu, dev, &fuse);
+	if (ret) {
+		return ret;
+	} else if (fuse == ADRENO_SPEEDBIN_FUSE_NODATA) {
+		/* The info struct has speedbin data, but the DT is too old => allow all OPPs */
+		DRM_DEV_INFO(dev, "No GPU speed bin fuse, please update your device tree\n");
+		return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	}
+
+	adreno_gpu->speedbin = fuse;
+
+	/* Traverse the known speedbins */
+	for (int i = 0; info->speedbins[i].fuse != SHRT_MAX; i++) {
+		if (info->speedbins[i].fuse == fuse) {
+			supp_hw = BIT(info->speedbins[i].speedbin);
+			return devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+		}
+	}
+
+	return dev_err_probe(dev, -EINVAL, "Unknown speed bin fuse value: 0x%x\n", fuse);
+}
+
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 		struct adreno_gpu *adreno_gpu,
 		const struct adreno_gpu_funcs *funcs, int nr_rings)
@@ -1104,7 +1144,6 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	struct msm_gpu_config adreno_gpu_config  = { 0 };
 	struct msm_gpu *gpu = &adreno_gpu->base;
 	const char *gpu_name;
-	u32 speedbin;
 	int ret;
 
 	adreno_gpu->funcs = funcs;
@@ -1131,29 +1170,34 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
-		speedbin = 0xffff;
-	adreno_gpu->speedbin = speedbin;
-
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
 	if (!gpu_name)
 		return -ENOMEM;
 
 	adreno_gpu_config.ioname = "kgsl_3d0_reg_memory";
-
 	adreno_gpu_config.nr_rings = nr_rings;
 
+	pm_runtime_set_autosuspend_delay(dev, adreno_gpu->info->inactive_period);
+	pm_runtime_use_autosuspend(dev);
+
+	ret = msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
+			   gpu_name, &adreno_gpu_config);
+	if (ret)
+		return ret;
+
+	ret = adreno_set_speedbin(adreno_gpu, dev);
+	if (ret)
+		return ret;
+
 	ret = adreno_get_pwrlevels(dev, gpu);
 	if (ret)
 		return ret;
 
-	pm_runtime_set_autosuspend_delay(dev,
-		adreno_gpu->info->inactive_period);
-	pm_runtime_use_autosuspend(dev);
+	/* Devfreq can only be initialized after OPP */
+	msm_devfreq_init(gpu);
 
-	return msm_gpu_init(drm, pdev, &adreno_gpu->base, &funcs->base,
-			gpu_name, &adreno_gpu_config);
+	return 0;
 }
 
 void adreno_gpu_cleanup(struct adreno_gpu *adreno_gpu)
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 8f2b70eaf6ad..30e8b9919adb 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -524,9 +524,6 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
-			 struct device *dev, u32 *speedbin);
-
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
index 655002b21b0d..8504eaab8ef6 100644
--- a/drivers/gpu/drm/msm/msm_gpu.c
+++ b/drivers/gpu/drm/msm/msm_gpu.c
@@ -932,9 +932,6 @@ int msm_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 	gpu->pdev = pdev;
 	platform_set_drvdata(pdev, &gpu->adreno_smmu);
 
-	msm_devfreq_init(gpu);
-
-
 	gpu->aspace = gpu->funcs->create_address_space(gpu, pdev);
 
 	if (gpu->aspace == NULL)

-- 
2.44.0


