Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E3FF925CBC9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Sep 2020 23:04:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726323AbgICVEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 17:04:08 -0400
Received: from foss.arm.com ([217.140.110.172]:41358 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726088AbgICVEI (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 17:04:08 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB1381045;
        Thu,  3 Sep 2020 14:04:07 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.37])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1D4DE3F68F;
        Thu,  3 Sep 2020 14:04:07 -0700 (PDT)
From:   Robin Murphy <robin.murphy@arm.com>
To:     robdclark@gmail.com, sean@poorly.run
Cc:     dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH] drm/msm: Drop local dma_parms
Date:   Thu,  3 Sep 2020 22:04:03 +0100
Message-Id: <7914512e76103ca81d5e6edf8971508b5e8e17a6.1599166862.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since commit 9495b7e92f71 ("driver core: platform: Initialize dma_parms
for platform devices"), struct platform_device already provides a
dma_parms structure, so we can save allocating another one.

Also the DMA segment size is simply a size, not a bitmask.

Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7d641c7e3514..2b73d29642b7 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -453,15 +453,7 @@ static int msm_drm_init(struct device *dev, struct drm_driver *drv)
 	if (ret)
 		goto err_msm_uninit;
 
-	if (!dev->dma_parms) {
-		dev->dma_parms = devm_kzalloc(dev, sizeof(*dev->dma_parms),
-					      GFP_KERNEL);
-		if (!dev->dma_parms) {
-			ret = -ENOMEM;
-			goto err_msm_uninit;
-		}
-	}
-	dma_set_max_seg_size(dev, DMA_BIT_MASK(32));
+	dma_set_max_seg_size(dev, UINT_MAX);
 
 	msm_gem_shrinker_init(ddev);
 
-- 
2.28.0.dirty

