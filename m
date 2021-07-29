Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2B5763DAC26
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 21:52:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232169AbhG2TwR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Jul 2021 15:52:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:12538 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229606AbhG2TwQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Jul 2021 15:52:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627588333; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=26S1z0YiPCzAXOVdlNBmKby+y7WMrRGTA3MarF++KxA=; b=ljYdTJjAOZ54swvPbBHb7QXQHm033HfQ2N2qJmi9swvTxvejpXMGQZaV5Wk3E+HFq9jDpkbP
 /PYoi3y3IG2uausCAZjXA1DLSM2SbV+miesk8I3Z3o+HBWjQpe9wkPBYf4d6rbBGbhIAobR+
 95E0+Z1wwQ7jGHwF+mtjJ801Pb4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 610306d6e81205dd0ae770e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 29 Jul 2021 19:51:50
 GMT
Sender: akhilpo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 917BDC433F1; Thu, 29 Jul 2021 19:51:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from hyd-lnxbld559.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: akhilpo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72612C433F1;
        Thu, 29 Jul 2021 19:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72612C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=akhilpo@codeaurora.org
From:   Akhil P Oommen <akhilpo@codeaurora.org>
To:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@gmail.com>
Cc:     Douglas Anderson <dianders@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Jonathan Marek <jonathan@marek.ca>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] drm/msm/a6xx: Use rev to identify SKU
Date:   Fri, 30 Jul 2021 01:21:24 +0530
Message-Id: <20210730011945.v4.2.I286ef007fcadd9e6ee3b2c0ad948f990735f9610@changeid>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627588286-30520-1-git-send-email-akhilpo@codeaurora.org>
References: <1627588286-30520-1-git-send-email-akhilpo@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Use rev instead of revn to identify the SKU. This is in
preparation to the introduction of 7c3 gpu which won't have a
revn.

Signed-off-by: Akhil P Oommen <akhilpo@codeaurora.org>
---

Changes in v4:
- Move adreno_cmp_rev() here to fix compilation

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 11 +++++------
 drivers/gpu/drm/msm/adreno/adreno_device.c | 16 ++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  4 ++++
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 183b9f9..0da1a66 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1675,11 +1675,11 @@ static u32 a618_get_speed_bin(u32 fuse)
 	return UINT_MAX;
 }
 
-static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
+static u32 fuse_to_supp_hw(struct device *dev, struct adreno_rev rev, u32 fuse)
 {
 	u32 val = UINT_MAX;
 
-	if (revn == 618)
+	if (adreno_cmp_rev(ADRENO_REV(6, 1, 8, ANY_ID), rev))
 		val = a618_get_speed_bin(fuse);
 
 	if (val == UINT_MAX) {
@@ -1692,8 +1692,7 @@ static u32 fuse_to_supp_hw(struct device *dev, u32 revn, u32 fuse)
 	return (1 << val);
 }
 
-static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
-		u32 revn)
+static int a6xx_set_supported_hw(struct device *dev, struct adreno_rev rev)
 {
 	u32 supp_hw = UINT_MAX;
 	u16 speedbin;
@@ -1714,7 +1713,7 @@ static int a6xx_set_supported_hw(struct device *dev, struct a6xx_gpu *a6xx_gpu,
 	}
 	speedbin = le16_to_cpu(speedbin);
 
-	supp_hw = fuse_to_supp_hw(dev, revn, speedbin);
+	supp_hw = fuse_to_supp_hw(dev, rev, speedbin);
 
 done:
 	ret = devm_pm_opp_set_supported_hw(dev, &supp_hw, 1);
@@ -1785,7 +1784,7 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 
 	a6xx_llc_slices_init(pdev, a6xx_gpu);
 
-	ret = a6xx_set_supported_hw(&pdev->dev, a6xx_gpu, info->revn);
+	ret = a6xx_set_supported_hw(&pdev->dev, config->rev);
 	if (ret) {
 		a6xx_destroy(&(a6xx_gpu->base.base));
 		return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 6dad801..7e6fafe 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -8,8 +8,6 @@
 
 #include "adreno_gpu.h"
 
-#define ANY_ID 0xff
-
 bool hang_debug = false;
 MODULE_PARM_DESC(hang_debug, "Dump registers when hang is detected (can be slow!)");
 module_param_named(hang_debug, hang_debug, bool, 0600);
@@ -325,6 +323,15 @@ static inline bool _rev_match(uint8_t entry, uint8_t id)
 	return (entry == ANY_ID) || (entry == id);
 }
 
+bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2)
+{
+
+	return _rev_match(rev1.core, rev2.core) &&
+		_rev_match(rev1.major, rev2.major) &&
+		_rev_match(rev1.minor, rev2.minor) &&
+		_rev_match(rev1.patchid, rev2.patchid);
+}
+
 const struct adreno_info *adreno_info(struct adreno_rev rev)
 {
 	int i;
@@ -332,10 +339,7 @@ const struct adreno_info *adreno_info(struct adreno_rev rev)
 	/* identify gpu: */
 	for (i = 0; i < ARRAY_SIZE(gpulist); i++) {
 		const struct adreno_info *info = &gpulist[i];
-		if (_rev_match(info->rev.core, rev.core) &&
-				_rev_match(info->rev.major, rev.major) &&
-				_rev_match(info->rev.minor, rev.minor) &&
-				_rev_match(info->rev.patchid, rev.patchid))
+		if (adreno_cmp_rev(info->rev, rev))
 			return info;
 	}
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 8dbe0d1..a368a16 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -42,6 +42,8 @@ struct adreno_rev {
 	uint8_t  patchid;
 };
 
+#define ANY_ID 0xff
+
 #define ADRENO_REV(core, major, minor, patchid) \
 	((struct adreno_rev){ core, major, minor, patchid })
 
@@ -141,6 +143,8 @@ struct adreno_platform_config {
 	__ret;                                             \
 })
 
+bool adreno_cmp_rev(struct adreno_rev rev1, struct adreno_rev rev2);
+
 static inline bool adreno_is_a2xx(struct adreno_gpu *gpu)
 {
 	return (gpu->revn < 300);
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

