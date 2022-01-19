Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97B29493CF9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Jan 2022 16:22:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355715AbiASPVw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 19 Jan 2022 10:21:52 -0500
Received: from so254-9.mailgun.net ([198.61.254.9]:19463 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1355679AbiASPVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 19 Jan 2022 10:21:41 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1642605701; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=nDQ1Iy4S4g8WjOjL3PAXt1koaRqeDxEXd8ZQbmvqGI4=; b=k7Bm6vIgmuXr1qS1xq2BQJoNNApQUSfJUWUOsEj7w9Xi9p8zaA/L3i97Klw0GIYI21ByNShT
 WXnHYpAXtj7ctJ+8SkDAWnQ1Tvl6sFxOhkEj6InbFLmwqAfQPDs1ME/TAEI22BMotTD1c3+2
 NT7O+H9qXGFs3Frm7WqpM7+Lmv4=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 61e82c811b960c38b715bcd7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 Jan 2022 15:21:37
 GMT
Sender: quic_akhilpo=quicinc.com@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B44A7C4338F; Wed, 19 Jan 2022 15:21:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 74C74C4360D;
        Wed, 19 Jan 2022 15:21:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org 74C74C4360D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=fail (p=none dis=none) header.from=quicinc.com
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=quicinc.com
From:   Akhil P Oommen <quic_akhilpo@quicinc.com>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>,
        OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS 
        <devicetree@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/4] drm/msm/adreno: Add support for Adreno 8c Gen 3
Date:   Wed, 19 Jan 2022 20:51:18 +0530
Message-Id: <20220119205012.v2.1.Ibac66e1e0e565313bc28f192e6c94cb508f205eb@changeid>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for "Adreno 8c Gen 3" gpu along with the necessary speedbin
support.

Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
---

Changes in v2:
- Fix a bug in adreno_cmp_rev()

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 21 ++++++++++++++----
 drivers/gpu/drm/msm/adreno/adreno_device.c | 34 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    | 10 +++++++--
 3 files changed, 56 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 51b8377..9268ce3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -10,7 +10,6 @@
 
 #include <linux/bitfield.h>
 #include <linux/devfreq.h>
-#include <linux/nvmem-consumer.h>
 #include <linux/soc/qcom/llcc-qcom.h>
 
 #define GPU_PAS_ID 13
@@ -1734,6 +1733,18 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
+static u32 adreno_7c3_get_speed_bin(u32 fuse)
+{
+	if (fuse == 0)
+		return 0;
+	else if (fuse == 117)
+		return 0;
+	else if (fuse == 190)
+		return 1;
+
+	return UINT_MAX;
+}
+
 static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
@@ -1741,6 +1752,9 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
+	if (adreno_cmp_rev(ADRENO_REV(6, 3, 5, ANY_ID), rev))
+		val = adreno_7c3_get_speed_bin(fuse);
+
 	if (val == UINT_MAX) {
 		DRM_DEV_ERROR(dev,
 			"missing support for speed-bin: %u. Some OPPs may not be supported by hardware",
@@ -1753,11 +1767,10 @@ static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 
 static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 {
-	u32 supp_hw = UINT_MAX;
-	u32 speedbin;
+	u32 speedbin, supp_hw = UINT_MAX;
 	int ret;
 
-	ret = nvmem_cell_read_variable_le_u32(dev, "speed_bin", &speedbin);
+	ret = adreno_read_speedbin(dev, &speedbin);
 	/*
 	 * -ENOENT means that the platform doesn't support speedbin which is
 	 * fine
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 9300583..946f505 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -6,6 +6,7 @@
  * Copyright (c) 2014,2017 The Linux Foundation. All rights reserved.
  */
 
+#include <linux/nvmem-consumer.h>
 #include "adreno_gpu.h"
 
 bool hang_debug = false;
@@ -317,6 +318,17 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a660_zap.mdt",
 		.hwcg = a660_hwcg,
 	}, {
+		.rev = ADRENO_REV_SKU(6, 3, 5, ANY_ID, 190),
+		.name = "Adreno 8c Gen 3",
+		.fw = {
+			[ADRENO_FW_SQE] = "a660_sqe.fw",
+			[ADRENO_FW_GMU] = "a660_gmu.bin",
+		},
+		.gmem = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init = a6xx_gpu_init,
+		.hwcg = a660_hwcg,
+	}, {
 		.rev = ADRENO_REV(6, 3, 5, ANY_ID),
 		.name = "Adreno 7c Gen 3",
 		.fw = {
@@ -365,13 +377,19 @@ static inline bool _rev_match(uint8_t entry, uint8_t id)
 	return (entry == ANY_ID) || (entry == id);
 }
 
+static inline bool _rev_match_sku(uint16_t entry, uint16_t id)
+{
+	return (entry == ANY_SKU) || (entry == id);
+}
+
 bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
 {
 
 	return _rev_match(rev1.core, rev2.core) &&
 		_rev_match(rev1.major, rev2.major) &&
 		_rev_match(rev1.minor, rev2.minor) &&
-		_rev_match(rev1.patchid, rev2.patchid);
+		_rev_match(rev1.patchid, rev2.patchid) &&
+		_rev_match_sku(rev1.sku, rev2.sku);
 }
 
 const struct adreno_info *adreno_info(struct adreno_rev rev)
@@ -445,12 +463,17 @@ struct msm_gpu *adreno_load_gpu(struct drm_device *dev)
 	return gpu;
 }
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin)
+{
+	return nvmem_cell_read_variable_le_u32(dev, "speed_bin", speedbin);
+}
+
 static int find_chipid(struct device *dev, struct adreno_rev *rev)
 {
 	struct device_node *node = dev->of_node;
 	const char *compat;
 	int ret;
-	u32 chipid;
+	u32 chipid, speedbin;
 
 	/* first search the compat strings for qcom,adreno-XYZ.W: */
 	ret = of_property_read_string_index(node, "compatible", 0, &compat);
@@ -466,7 +489,7 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
 			rev->minor = r;
 			rev->patchid = patch;
 
-			return 0;
+			goto done;
 		}
 	}
 
@@ -486,6 +509,11 @@ static int find_chipid(struct device *dev, struct adreno_rev *rev)
 	dev_warn(dev, "Use compatible qcom,adreno-%u%u%u.%u instead.\n",
 		rev->core, rev->major, rev->minor, rev->patchid);
 
+done:
+	if (adreno_read_speedbin(dev, &speedbin))
+		speedbin = ANY_SKU;
+
+	rev->sku = (uint16_t) (0xffff & speedbin);
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index cffabe7..52bd93a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -40,12 +40,16 @@ struct adreno_rev {
 	uint8_t  major;
 	uint8_t  minor;
 	uint8_t  patchid;
+	uint16_t sku;
 };
 
-#define ANY_ID 0xff
+#define ANY_ID	0xff
+#define ANY_SKU 0xffff
 
 #define ADRENO_REV(core, major, minor, patchid) \
-	((struct adreno_rev){ core, major, minor, patchid })
+	((struct adreno_rev){ core, major, minor, patchid, ANY_SKU })
+#define ADRENO_REV_SKU(core, major, minor, patchid, sku) \
+	((struct adreno_rev){ core, major, minor, patchid, sku })
 
 struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
@@ -324,6 +328,8 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 
 void adreno_set_llc_attributes(struct iommu_domain *iommu);
 
+int adreno_read_speedbin(struct device *dev, u32 *speedbin);
+
 /*
  * For a5xx and a6xx targets load the zap shader that is used to pull the GPU
  * out of secure mode
-- 
2.7.4

