Return-Path: <linux-arm-msm+bounces-25603-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D652592B5A9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 12:46:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5BFC01F23EE0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  9 Jul 2024 10:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E351581E5;
	Tue,  9 Jul 2024 10:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBCQ+FJr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CC71156F27
	for <linux-arm-msm@vger.kernel.org>; Tue,  9 Jul 2024 10:45:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720521939; cv=none; b=cp8OcPUlko+6Hy2t3AHl4IHkkN5l5bj4dfGO7etTnBC2RX82oG+9GX3SzeP/mrSk30iFFdBrFbxEJqhb+zGMYYaD/Izdmkbsia3D5E53S+i6wYdeIjdN54TeGCGV0xCu8/URteXuTYOFYWSmB2rcj4LpLpisT+LEBnlKPGAUJiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720521939; c=relaxed/simple;
	bh=EZnPsbf895Nk5+GhF8GX16MJZewwBwjtmiFmsqKVj/E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kM9G2Yv1K0b9EGqmI9gPlyAXz8NEx+j6STbYbWO2lnogfMtWhFhKFhJlNAPeugpm/1dCcJ0I/G/zqrG9CNExNrffvla5k7XCzti+q83XIUegKwBUJFE9xmT3SEZqu3CXn02wjHmg3fUT8upt6/+zO/jKmFyP2V2e81uJ/Tn52uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cBCQ+FJr; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a77c7d3e8bcso492623466b.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 09 Jul 2024 03:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720521934; x=1721126734; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IGu0LuUjGKiWzipHAvenbBISpRzy/JWKn/Q0VCWcD/s=;
        b=cBCQ+FJroi7uwFFrEt1ZHftg+FWQMxfhMlsgBHlNqcMYO6An9UF7Y0ly8aaq8/BJuH
         7fOQgd1Lx1oR09Vh0+1+v2TyJcfBHxYcOceoUzcPoEQ2KUWm9XixFZos3dFa3zus9CVo
         PaDXlhGx0KSE2QBmhH4AqADsdNycNbpwpDwLs1YIg5fezutwhvZCSU1gzeXnbakp0Rw6
         ++t3uJln3XC7SvYASRUzlnUV+wDlY3u8fG4lmqcqfP2cznrzSnzvmpWtkoU6LhIHs6jF
         qvCA6hIxE/lVLEZZ7xEp/5kWZiC2PsEsBFmHgNrirrC2Rc6JqElLuWxdpTh0RBMDDUsV
         5nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720521934; x=1721126734;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGu0LuUjGKiWzipHAvenbBISpRzy/JWKn/Q0VCWcD/s=;
        b=rhJV96Eaa5vzyofkT5uTFrs/uVfslLNwq8qIVEOQrbBNmGc1z1NYRWPzP7wIYqe8cZ
         pqC3DtruB5GIGvAsIfZmtFMnIVKjxBlqAy6386nTxvzMvL6DorV4yykoJ707y8Q5BkHI
         dKaOIuCbU+4GPdOG5YxLQIedEaYqF7tAgQlg0yLbsr5s5bFNaNhMhR3G5i/mTmQVwMD0
         xaBE8DT/orTzFhPRHg5HTESnCN2bFRkcRSGwCu046V7nh3xIPNFVHVdaeQ/U0FnXilW7
         LzybIwqIbvv0MW5rEqsTwrK1lb20GJ1pzJvsJ1CocX1TacRfh6865OfzxCtzuGh8RR5R
         ronw==
X-Forwarded-Encrypted: i=1; AJvYcCUswTS6gJ0MBxUsZ+OPsDine2BRE3xmRm2tMn/TmBpxnhheY0iusBByuSsbQ/SW0I8IWxqAuMI9GheycK51rHwzAQ3PUzdfLB94+MMq5w==
X-Gm-Message-State: AOJu0Ywo6O+HVkZU+/iA25Fsw8ULPpjkrPaS54B1QJWw97DcA/f3SOV9
	iAfpNqV6dsspGPHGuOHDltntNuXOFgxJuGrW/suUkO9b3b0sietk2D67R9STfNE=
X-Google-Smtp-Source: AGHT+IFojiSJMtNFkbwjsZN8NaRCsi8T66KA4mNJvMJYW4MrWNwyi3ZVaOA3AheA7mNLL9bhT2f25w==
X-Received: by 2002:a17:907:720c:b0:a77:c5a5:f662 with SMTP id a640c23a62f3a-a780b68a9camr184732266b.12.1720521934301;
        Tue, 09 Jul 2024 03:45:34 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a780a7ff038sm66295466b.115.2024.07.09.03.45.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 03:45:33 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 09 Jul 2024 12:45:29 +0200
Subject: [PATCH v5 1/5] drm/msm/adreno: Implement SMEM-based speed bin
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-smem_speedbin-v5-1-e2146be0c96f@linaro.org>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
In-Reply-To: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720521930; l=6084;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=EZnPsbf895Nk5+GhF8GX16MJZewwBwjtmiFmsqKVj/E=;
 b=ofzGt665lRV73DHN1FYY/bCFj4utkgtRqb78xzJO4AhiNNAaX88SPIUrJ7rZTp+qwl8D+dgx/
 Qjtzuwfx42BCGsI3SBnFhMjoYrnCMLAynqXFghKGFuzriKzoFSYGeJk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=

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
index bcaec86ac67a..0d8682c28ba4 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2117,18 +2117,20 @@ static u32 fuse_to_supp_hw(const struct adreno_info *info, u32 fuse)
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
@@ -2283,7 +2285,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu, is_a7xx);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, config->info);
+	ret = a6xx_set_supported_hw(adreno_gpu, &pdev->dev, config->info);
 	if (ret) {
 		a6xx_llc_slices_destroy(a6xx_gpu);
 		kfree(a6xx_gpu);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index cfc74a9e2646..0842ea76e616 100644
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
index 1c6626747b98..cf6652c4439d 100644
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
@@ -1061,9 +1064,40 @@ void adreno_gpu_ocmem_cleanup(struct adreno_ocmem *adreno_ocmem)
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
@@ -1102,9 +1136,9 @@ int adreno_gpu_init(struct drm_device *drm, struct platform_device *pdev,
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
index 1ab523a163a0..0d629343ebb4 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -79,6 +79,10 @@ struct adreno_reglist {
 
 struct adreno_speedbin {
 	uint16_t fuse;
+/* As of SM8650, PCODE on production SoCs is meaningless wrt the GPU bin */
+#define ADRENO_SKU_ID_FCODE		GENMASK(15, 0)
+#define ADRENO_SKU_ID(fcode)	(fcode)
+
 	uint16_t speedbin;
 };
 
@@ -555,7 +559,8 @@ int adreno_fault_handler(struct msm_gpu *gpu, unsigned long iova, int flags,
 			 struct adreno_smmu_fault_info *info, const char *block,
 			 u32 scratch[4]);
 
-int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+int adreno_read_speedbin(struct adreno_gpu *adreno_gpu,
+			 struct device *dev, u32 *speedbin);
 
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU

-- 
2.45.2


