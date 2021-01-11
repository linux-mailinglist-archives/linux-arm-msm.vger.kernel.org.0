Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 139CF2F1215
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Jan 2021 13:06:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbhAKMFU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 Jan 2021 07:05:20 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:15958 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726125AbhAKMFU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 Jan 2021 07:05:20 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610366696; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=K/9QPegi5k1JmfnvvHJxNLJQiw128Wqc+4ZBKDNjaMM=; b=AGmbb/yzSS6Nq3hDg+ljnh5vHac7VoYYIjQ68t8gVoIZGEkr27L07Aacd2dRS6pI7bWujh6K
 GlssaIcC35Gn4VDoYsCzlabYvd/v8jrkk8imzf+OJtfaA6plty1F4qLDOkb2+LXZPewlz4bf
 W9vAEeNdiZ9+/7UkEesJlSVtV6s=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ffc3ecc4dcca124755a0089 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 11 Jan 2021 12:04:28
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1517CC433CA; Mon, 11 Jan 2021 12:04:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C4155C433C6;
        Mon, 11 Jan 2021 12:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C4155C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Rob Clark <robdclark@gmail.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        angelogioacchino.delregno@somainline.org
Cc:     linux-arm-msm@vger.kernel.org,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-kernel@vger.kernel.org,
        Kristian H Kristensen <hoegsberg@google.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 1/2] drm/msm: Add proper checks for GPU LLCC support
Date:   Mon, 11 Jan 2021 17:34:08 +0530
Message-Id: <79ffb79853104f85d097e65596724411d084d13f.1610366113.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1610366113.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Domain attribute setting for LLCC is guarded by !IS_ERR
check which works fine only when CONFIG_QCOM_LLCC=y but
when it is disabled, the LLCC apis return NULL and that
is not handled by IS_ERR check. Due to this, domain attribute
for LLCC will be set even on GPUs which do not support it
and cause issues, so correct this by using IS_ERR_OR_NULL
checks appropriately. Meanwhile also cleanup comment block
and remove unwanted blank line.

Fixes: 00fd44a1a470 ("drm/msm: Only enable A6xx LLCC code on A6xx")
Fixes: 474dadb8b0d5 ("drm/msm/a6xx: Add support for using system cache(LLC)")
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 130661898546..3b798e883f82 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1117,7 +1117,7 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
 
-	if (IS_ERR(a6xx_gpu->llc_slice) && IS_ERR(a6xx_gpu->htw_llc_slice))
+	if (IS_ERR_OR_NULL(a6xx_gpu->llc_slice) && IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice))
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index f09175698827..b35914de1b27 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -200,15 +200,15 @@ adreno_iommu_create_address_space(struct msm_gpu *gpu,
 	if (!iommu)
 		return NULL;
 
-
 	if (adreno_is_a6xx(adreno_gpu)) {
 		struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 		struct io_pgtable_domain_attr pgtbl_cfg;
+
 		/*
-		* This allows GPU to set the bus attributes required to use system
-		* cache on behalf of the iommu page table walker.
-		*/
-		if (!IS_ERR(a6xx_gpu->htw_llc_slice)) {
+		 * This allows GPU to set the bus attributes required to use system
+		 * cache on behalf of the iommu page table walker.
+		 */
+		if (!IS_ERR_OR_NULL(a6xx_gpu->htw_llc_slice)) {
 			pgtbl_cfg.quirks = IO_PGTABLE_QUIRK_ARM_OUTER_WBWA;
 			iommu_domain_set_attr(iommu, DOMAIN_ATTR_IO_PGTABLE_CFG, &pgtbl_cfg);
 		}
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

