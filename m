Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B9D572EF72F
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Jan 2021 19:17:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727429AbhAHSQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 13:16:49 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:57723 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728466AbhAHSQs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 13:16:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610129784; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=FenJNrq6oARj7QIk122RbRfflhXOjoSYWRYsI0s5h5A=; b=ZyKPDAUQXMQa7hzOCSMB9XwXNYQrjWF4yRuehaD6XQ6ihAnSu4BZ01aduDP9fEyYhYkKAgRW
 0dyTSXaMPwmLz8q2Ylp+oX0A6IrDqHXHUp3ovGEmHMIHQWO32WOAr0pm8rLbtaHONEXSN/aK
 W3tqx2tAsT5xopoqFq96nndHFvc=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5ff8a1540699456d21005449 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 08 Jan 2021 18:15:48
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A76B5C43461; Fri,  8 Jan 2021 18:15:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from akhilpo-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A4F4AC433CA;
        Fri,  8 Jan 2021 18:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A4F4AC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     dri-devel@freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        jcrouse@codeaurora.org, robdclark@gmail.com, mka@chromium.org
Subject: [PATCH v4 1/2] drm/msm: Add speed-bin support to a618 gpu
Date:   Fri,  8 Jan 2021 23:45:30 +0530
Message-Id: <1610129731-4875-1-git-send-email-akhilpo@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some GPUs support different max frequencies depending on the platform.
To identify the correct variant, we should check the gpu speedbin
fuse value. Add support for this speedbin detection to a6xx family
along with the required fuse details for a618 gpu.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---
Changes from v2:
	1. Made the changes a6xx specific to save space.
Changes from v1:
	1. Added the changes to support a618 sku to the series.
	2. Avoid failing probe in case of an unsupported sku. (Rob)
Changes from v3:
	1. Replace a618_speedbins[] with a function. (Jordan)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 83 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 +
 2 files changed, 85 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1306618..499d134 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,6 +10,7 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
+#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1208,6 +1209,10 @@ static void a6xx_destroy(struct msm_gpu *gpu)
 	a6xx_gmu_remove(a6xx_gpu);
 
 	adreno_gpu_cleanup(adreno_gpu);
+
+	if (a6xx_gpu->opp_table)
+		dev_pm_opp_put_supported_hw(a6xx_gpu->opp_table);
+
 	kfree(a6xx_gpu);
 }
 
@@ -1264,6 +1269,78 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 	return ring->memptrs->rptr = gpu_read(gpu, REG_A6XX_CP_RB_RPTR);
 }
 
+static u32 a618_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 169)
+		return 1;
+	else if (fuse == 174)
+		return 2;
+
+	return UINT_MAX;
+}
+
+static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
+{
+	u32 val = UINT_MAX;
+
+	if (revn == 618)
+		val = a618_get_speed_bin(fuse);
+
+	if (val == UINT_MAX) {
+		DRM_DEV_ERROR(dev,
+			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
+			fuse);
+		return UINT_MAX;
+	}
+
+	return (1 << val);
+}
+
+static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
+		u32 revn)
+{
+	struct opp_table *opp_table;
+	struct nvmem_cell *cell;
+	u32 supp_hw = UINT_MAX;
+	void *buf;
+
+	cell = nvmem_cell_get(dev, "speed_bin");
+	/*
+	 * -ENOENT means that the platform doesn't support speedbin which is
+	 * fine
+	 */
+	if (PTR_ERR(cell) == -ENOENT)
+		return 0;
+	else if (IS_ERR(cell)) {
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	buf = nvmem_cell_read(cell, NULL);
+	if (IS_ERR(buf)) {
+		nvmem_cell_put(cell);
+		DRM_DEV_ERROR(dev,
+				"failed to read speed-bin. Some OPPs may not be supported by hardware");
+		goto done;
+	}
+
+	supp_hw = fuse_to_supp_hw(dev, revn, *((u32 *) buf));
+
+	kfree(buf);
+	nvmem_cell_put(cell);
+
+done:
+	opp_table = dev_pm_opp_set_supported_hw(dev, &supp_hw, 1);
+	if (IS_ERR(opp_table))
+		return PTR_ERR(opp_table);
+
+	a6xx_gpu->opp_table = opp_table;
+	return 0;
+}
+
 static const struct adreno_gpu_funcs funcs = {
 	.base = {
 		.get_param = adreno_get_param,
@@ -1325,6 +1402,12 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
+	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
+	if (ret) {
+		a6xx_destroy(&(a6xx_gpu->base.base));
+		return ERR_PTR(ret);
+	}
+
 	ret = adreno_gpu_init(dev, pdev, adreno_gpu, &funcs, 1);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index e793d32..ce0610c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -33,6 +33,8 @@ struct a6xx_gpu {
 	void *llc_slice;
 	void *htw_llc_slice;
 	bool have_mmu500;
+
+	struct opp_table *opp_table;
 };
 
 #define to_a6xx_gpu(x) container_of(x, struct a6xx_gpu, base)
-- 
2.7.4

