Return-Path: <linux-arm-msm+bounces-56247-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 343EDAA4A1D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 13:35:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8F7EF9C448C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Apr 2025 11:34:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D1DCA25333E;
	Wed, 30 Apr 2025 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KEHBdKra"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A316E1DF25A;
	Wed, 30 Apr 2025 11:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746012891; cv=none; b=pvnWXCUtp7y+FO8lZttsAqSQT8Fhzb7Y1xGX2UurFJPYPFV5O2RXZty20tUQ4Wiu95fW+F/nfG+dx2r9x1BZUfbOV7g7XQCWgN3pw80f057IGl74KvYLKSzVKPyR/S6znMiQqIfoQJ5L3McfLDA4l2lpI1A33fDqK+t0x3GuUCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746012891; c=relaxed/simple;
	bh=O8M7WlTxn8semPE2JzxaHompKC+iZ1DAro1Zycg0m6Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vhb/Ph0Iy+QencJH2px1Nc3uyW3b81hKiSJ5fQ1j26grNvO37NkPSyUi5GfELWjN26iaazn0FZQfmXEorWdbUOlhy06ff0HdW41F/Y8c8aZ/b/4UP46IJ+NPqT2hYQRGHcEKFe153+Mi2vFv48J1eONW4arA7Izj6iBpY1mf/0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KEHBdKra; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08411C4CEEA;
	Wed, 30 Apr 2025 11:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746012891;
	bh=O8M7WlTxn8semPE2JzxaHompKC+iZ1DAro1Zycg0m6Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KEHBdKra2mXdkiVsTHlLO7tdShMTACqejTsHXrwqcP5ys+6FB9aWLs8Ns+VeiPNjV
	 ZHPs4mKqI8wvJQZY7xhgE/ujmIdOBs04XGTxJv7mkCvgsiKeWLwERtKsChGhXSInUj
	 TUFgNR2gUZ1alNWRC9f9RqmBJUHee3rdsgM5KEET6h+UdotVIQx8MssgPfDa6LV3cX
	 gPU2orswpX6qGZqPV6qPk7xIVoqKFeb1Tf+PBUwMQzWGkkD29i9Uk+7789cHDH4Qos
	 uEDTvah1XEL8kGppLKshZ3D72/3SqR0cebpudd5iwBeU1m4rCX05pY+F62OSbA7AuP
	 CWBl/QjhWgzjg==
From: Konrad Dybcio <konradybcio@kernel.org>
Date: Wed, 30 Apr 2025 13:34:35 +0200
Subject: [PATCH RFT v6 1/5] drm/msm/adreno: Implement SMEM-based speed bin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-topic-smem_speedbin_respin-v6-1-954ff66061cf@oss.qualcomm.com>
References: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
In-Reply-To: <20250430-topic-smem_speedbin_respin-v6-0-954ff66061cf@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746012880; l=6308;
 i=konrad.dybcio@oss.qualcomm.com; s=20230215; h=from:subject:message-id;
 bh=GTpsvdnL6p2ILmZWjIPbAA6NC+j9tLy6m3UjKescP3A=;
 b=ha8FpMoq9T4mmX3m9HNKeBMSSrWb2DbWZKxgNjfPFD2AdchprDESj6sTh8GT1F3XWPNmyxAxM
 JUM1GosfsezA1X2HZX1p+3kx3ceU5WAy9Z3e+VJAMkF1e0rdmCNBuBk
X-Developer-Key: i=konrad.dybcio@oss.qualcomm.com; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

From: Konrad Dybcio <konrad.dybcio@linaro.org>

On recent (SM8550+) Snapdragon platforms, the GPU speed bin data is
abstracted through SMEM, instead of being directly available in a fuse.

Add support for SMEM-based speed binning, which includes getting
"feature code" and "product code" from said source and parsing them
to form something that lets us match OPPs against.

Due to the product code being ignored in the context of Adreno on
production parts (as of SM8650), hardcode it to SOCINFO_PC_UNKNOWN.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 14 +++++-----
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 42 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  7 ++++-
 4 files changed, 54 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 242d02d48c0cd0972bb96a960872b73384fe043b..0db57e4b7596b01c091ed82510cf14cf2a8e0d03 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2328,18 +2328,20 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
 	return UINT_MAX;
 }
 
-static int a6xx_set_supported_hw(struct device *dev, const struct adreno_info *info)
+static int a6xx_set_supported_hw(struct adreno_gpu *adreno_gpu,
+				 struct device *dev,
+				 const struct adreno_info *info)
 {
 	u32 supp_hw;
 	u32 speedbin;
 	int ret;
 
-	ret = adreno_read_speedbin(dev, &speedbin);
+	ret = adreno_read_speedbin(adreno_gpu, dev, &speedbin);
 	/*
-	 * -ENOENT means that the platform doesn't support speedbin which is
-	 * fine
+	 * -ENOENT/EOPNOTSUPP means that the platform doesn't support speedbin
+	 * which is fine
 	 */
-	if (ret == -ENOENT) {
+	if (ret == -ENOENT || ret == -EOPNOTSUPP) {
 		return 0;
 	} else if (ret) {
 		dev_err_probe(dev, ret,
@@ -2495,7 +2497,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
+	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
 	if (ret) {
 		a6xx_llc_slices_destroy(a6xx_gpu);
 		kfree(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 236b25c094cd5d462f4b6653de7b7910985cccb6..a8376574381abff90d4a56e86f3f05735027ca9f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,8 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/soc/qcom/socinfo.h>
+
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 26db1f4b5fb90930bdbd2f17682bf47e35870936..b0ec64e9a35591507f26e16b4ef60ec874dafe12 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -21,6 +21,9 @@
 #include "msm_gem.h"
 #include "msm_mmu.h"
 
+#include <linux/soc/qcom/smem.h>
+#include <linux/soc/qcom/socinfo.h>
+
 static u64 address_space_size = 0;
 MODULE_PARM_DESC(address_space_size, "Override for size of processes private GPU address space");
 module_param(address_space_size, ullong, 0600);
@@ -1090,9 +1093,40 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
 			   adreno_ocmem->hdl);
 }
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *fuse)
 {
-	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+	int ret;
+
+	/*
+	 * Try reading the speedbin via a nvmem cell first
+	 * -ENOENT means "no nvmem-cells" and essentially means "old DT" or
+	 * "nvmem fuse is irrelevant", simply assume it's fine.
+	 */
+	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", fuse);
+	if (!ret)
+		return 0;
+	else if (ret != -ENOENT)
+		return dev_err_probe(dev, ret, "Couldn't read the speed bin fuse value\n");
+
+#ifdef CONFIG_QCOM_SMEM
+	u32 fcode;
+
+	/*
+	 * Only check the feature code - the product code only matters for
+	 * proto SoCs unavailable outside Qualcomm labs, as far as GPU bin
+	 * matching is concerned.
+	 *
+	 * Ignore EOPNOTSUPP, as not all SoCs expose this info through SMEM.
+	 */
+	ret = qcom_smem_get_feature_code(&fcode);
+	if (!ret)
+		*fuse = ADRENO_SKU_ID(fcode);
+	else if (ret != -EOPNOTSUPP)
+		return dev_err_probe(dev, ret, "Couldn't get feature code from SMEM\n");
+#endif
+
+	return ret;
 }
 
 int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
@@ -1132,9 +1166,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
 			devm_pm_opp_set_clkname(dev, "core");
 	}
 
-	if (adreno_read_speedbin(dev, &speedbin) || !speedbin)
+	if (adreno_read_speedbin(adreno_gpu, dev, &speedbin) || !speedbin)
 		speedbin = 0xffff;
-	adreno_gpu->speedbin = (uint16_t) (0xffff & speedbin);
+	adreno_gpu->speedbin = speedbin;
 
 	gpu_name = devm_kasprintf(dev, GFP_KERNEL, "%"ADRENO_CHIPID_FMT,
 			ADRENO_CHIPID_ARGS(config->chip_id));
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 92caba3584da0400b44a903e465814af165d40a3..3946b9e992b9a8e2fd81f3e03354f9f83717b270 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -80,6 +80,10 @@ struct adreno_reglist {
 
 struct adreno_speedbin {
 	uint16_t fuse;
+/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
+#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
+#define ADRENO_SKU_ID(fcode)	(fcode)
+
 	uint16_t speedbin;
 };
 
@@ -634,7 +638,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *speedbin);
 
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU

-- 
2.49.0


