Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0C5D8203D33
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 18:55:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729945AbgFVQzu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 12:55:50 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:49082 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729808AbgFVQzu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 12:55:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1592844949; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=E1xy9Gx0hTkrEu6KUPmiiRl49qJNoU7hD/Q9T7ORmy0=; b=sWrhWVtJMARvGzK0SJiMzEiLBwRi6bRZcrli88OPtvPDiOWW99gyHoD1DqACQe8cvbQUUetH
 Q+WB5Q/dxK3Q5oEgA7QYvIQoVya/Ah7Og9B/LSNneuwFVJ38JDV7ncMLh6t+AgqFNsZbQP5p
 7YTCqP5b9EYSr6fdY7xr9YJQAsg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-east-1.postgun.com with SMTP id
 5ef0e294c4bb4f886dba47fd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 22 Jun 2020 16:55:48
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF774C433B6; Mon, 22 Jun 2020 16:55:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jordan-laptop.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E005AC433CB;
        Mon, 22 Jun 2020 16:55:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E005AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     linux-arm-msm@vger.kernel.org
Cc:     AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Drew Davenport <ddavenport@chromium.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>, Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, tongtiangen <tongtiangen@huawei.com>
Subject: [PATCH] drm/msm: Fix up the rest of the messed up address sizes
Date:   Mon, 22 Jun 2020 10:55:38 -0600
Message-Id: <20200622165539.9247-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_gem_address_space_create() changed to take a start/length instead
of a start/end for the iova space but all of the callers were just
cut and pasted from the old usage. Most of the mistakes have been fixed
up so just catch up the rest.

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
---

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c    | 2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
index 60f6472a3e58..6021f8d9efd1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_gpu.c
@@ -408,7 +408,7 @@ a2xx_create_address_space(struct msm_gpu *gpu, struct platform_device *pdev)
 	struct msm_gem_address_space *aspace;
 
 	aspace = msm_gem_address_space_create(mmu, "gpu", SZ_16M,
-		SZ_16M + 0xfff * SZ_64K);
+		0xfff * SZ_64K);
 
 	if (IS_ERR(aspace) && !IS_ERR(mmu))
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 096be97ce9f9..21e77d67151f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1121,7 +1121,7 @@ static int a6xx_gmu_memory_probe(struct a6xx_gmu *gmu)
 		return -ENODEV;
 
 	mmu = msm_iommu_new(gmu->dev, domain);
-	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x7fffffff);
+	gmu->aspace = msm_gem_address_space_create(mmu, "gmu", 0x0, 0x80000000);
 	if (IS_ERR(gmu->aspace)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(gmu->aspace);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b8615d4fe8a3..680527e28d09 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -780,7 +780,7 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 
 	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
 	aspace = msm_gem_address_space_create(mmu, "dpu1",
-		0x1000, 0xfffffff);
+		0x1000, 0x100000000 - 0x1000);
 
 	if (IS_ERR(aspace)) {
 		mmu->funcs->destroy(mmu);
diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 08897184b1d9..fc6a3f8134c7 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -514,7 +514,7 @@ struct msm_kms *mdp4_kms_init(struct drm_device *dev)
 			config->iommu);
 
 		aspace  = msm_gem_address_space_create(mmu,
-			"mdp4", 0x1000, 0xffffffff);
+			"mdp4", 0x1000, 0x100000000 - 0x1000);
 
 		if (IS_ERR(aspace)) {
 			if (!IS_ERR(mmu))
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 54631fbd9389..8586d2cf1d94 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -641,7 +641,7 @@ struct msm_kms *mdp5_kms_init(struct drm_device *dev)
 		mmu = msm_iommu_new(iommu_dev, config->platform.iommu);
 
 		aspace = msm_gem_address_space_create(mmu, "mdp5",
-			0x1000, 0xffffffff);
+			0x1000, 0x100000000 - 0x1000);
 
 		if (IS_ERR(aspace)) {
 			if (!IS_ERR(mmu))
-- 
2.17.1

