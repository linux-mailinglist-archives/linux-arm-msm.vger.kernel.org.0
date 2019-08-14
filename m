Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C10DC8E08F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 00:16:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729076AbfHNWQF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Aug 2019 18:16:05 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:38167 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727937AbfHNWQF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Aug 2019 18:16:05 -0400
Received: by mail-pl1-f196.google.com with SMTP id m12so232719plt.5;
        Wed, 14 Aug 2019 15:16:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aWZa5dI2NRu6gHtKDFpC6w867E//TeA8xW/o66+S8bg=;
        b=qBzDnv5WoEcN49Ehx8P57UUIl8oz7j6r5pJKgnDJkq/9i9JcNFNlrzIJlKHWe0bVRt
         4VBrMBdIbbnWB3gueEj7YeclzU2RJJXWdDrjarGuiAi3yGBXO6hOIc/73O+CR0EEZ18j
         9qYE5DRvKuLxLJS5XTXrqrVimdgbiJ5oL4pT1EgYOIBf4Uk/wyznzvDd2xw7B37Kc0oC
         s3TwkOyd7vs6FnLVXfUQjsu4evDIWT81CEpi2WiJ5eRKyJxqRsZkpbQ1qBC6iD8EQNBn
         lmB30rOH8gpS3p5romApm2kcDjm6u1DOklnmxABYn6kLbJj0nD5JyU9qyX3Yfs7sDosV
         x9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aWZa5dI2NRu6gHtKDFpC6w867E//TeA8xW/o66+S8bg=;
        b=fXxcvCBXrPlaKiTPqW0jGcv4iRB0Srt+0tDVeH6gr9iArIH1Ot3c31xzF9Z5S+a4DO
         EBkXilMuphb3kWGsphoMk8ZbiajeMC4OP736lJjBqfcKkX87qiVt6TYK3Hn3OHVjkUgS
         rhBoHQdjSikmAwXyrZxvbDDjaH2G1pS1p/g7WYWNSvF+PQwgrfFyVGM757WIIA7RU7Kj
         yWZ1AxmseAgUItYJ7aIOQv2l+Mt7o8PPt/PTo3NKTtcf18pJwFRTWCT/lXUpwuHeoN48
         Fz3GYAfYX+F2vARe/iwCNI+64JwDdtCv+aI+EVolkAJeQ/UWNhkSPtU2ywj5ADc3OeRH
         eSsQ==
X-Gm-Message-State: APjAAAXdHWWJsvDRpV4fsdctez8SAtqSSZ91ps4hSOLpkgfkc+XDivu4
        RohKS2XBe5fjZhGzz/zAtrY=
X-Google-Smtp-Source: APXvYqx4wiJg+kMGqoXbIWyLQISiWCqIYOJbh2AH50z72sXIlWDah+Rb8L65s8HhZIIA59tPKBJUVQ==
X-Received: by 2002:a17:902:7b98:: with SMTP id w24mr1427925pll.163.1565820964515;
        Wed, 14 Aug 2019 15:16:04 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id h195sm898264pfe.20.2019.08.14.15.16.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Aug 2019 15:16:03 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Christoph Hellwig <hch@lst.de>, Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/msm: stop abusing DMA API
Date:   Wed, 14 Aug 2019 15:00:00 -0700
Message-Id: <20190814220011.26934-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190814220011.26934-1-robdclark@gmail.com>
References: <20190814220011.26934-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Use arch_sync_dma_for_{device,cpu}() rather than abusing the DMA API to
indirectly get at the arch_sync_dma code.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem.c | 37 +++++++++++------------------------
 1 file changed, 11 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 8cf6362e64bf..a2611e62df19 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -7,6 +7,7 @@
 #include <linux/spinlock.h>
 #include <linux/shmem_fs.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-noncoherent.h>
 #include <linux/pfn_t.h>
 
 #include "msm_drv.h"
@@ -32,43 +33,27 @@ static bool use_pages(struct drm_gem_object *obj)
 	return !msm_obj->vram_node;
 }
 
-/*
- * Cache sync.. this is a bit over-complicated, to fit dma-mapping
- * API.  Really GPU cache is out of scope here (handled on cmdstream)
- * and all we need to do is invalidate newly allocated pages before
- * mapping to CPU as uncached/writecombine.
- *
- * On top of this, we have the added headache, that depending on
- * display generation, the display's iommu may be wired up to either
- * the toplevel drm device (mdss), or to the mdp sub-node, meaning
- * that here we either have dma-direct or iommu ops.
- *
- * Let this be a cautionary tail of abstraction gone wrong.
- */
-
 static void sync_for_device(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
+	struct scatterlist *sg;
+	int i;
 
-	if (get_dma_ops(dev)) {
-		dma_sync_sg_for_device(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_map_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	for_each_sg(msm_obj->sgt->sgl, sg, msm_obj->sgt->nents, i) {
+		arch_sync_dma_for_device(dev, sg_phys(sg), sg->length,
+				DMA_BIDIRECTIONAL);
 	}
 }
 
 static void sync_for_cpu(struct msm_gem_object *msm_obj)
 {
 	struct device *dev = msm_obj->base.dev->dev;
+	struct scatterlist *sg;
+	int i;
 
-	if (get_dma_ops(dev)) {
-		dma_sync_sg_for_cpu(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
-	} else {
-		dma_unmap_sg(dev, msm_obj->sgt->sgl,
-			msm_obj->sgt->nents, DMA_BIDIRECTIONAL);
+	for_each_sg(msm_obj->sgt->sgl, sg, msm_obj->sgt->nents, i) {
+		arch_sync_dma_for_cpu(dev, sg_phys(sg), sg->length,
+				DMA_BIDIRECTIONAL);
 	}
 }
 
-- 
2.21.0

