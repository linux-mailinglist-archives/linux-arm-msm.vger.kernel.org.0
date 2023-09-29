Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9583D7B39D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 Sep 2023 20:16:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233788AbjI2SQk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 Sep 2023 14:16:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233779AbjI2SQh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 Sep 2023 14:16:37 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 134EE1A8;
        Fri, 29 Sep 2023 11:16:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: alarumbe)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 8BCBC6607348;
        Fri, 29 Sep 2023 19:16:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1696011390;
        bh=QnD8hEwDCIlVD3Jh+7OKdjKl/ZNfyX9lMUu35e8TZGo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=mXBblnl/ZPg+Aa84VaCwgFhvbHnud2N2mDMaQ4NqGDrcPd0XPNG6mxoiT25KvrZnR
         HSVlH0CrBur9t4DcUqcNel5FW8uNqHa/GRnO97Yq5rC03R+FYlzFYFYC+XodVo40lz
         G574aAlrMM4fdwmQFHYSwoOAcUrKA+kTdtkyc5zwiA42QxhUeYKOxmrOWzpZVzeiok
         WQY0xiEtnNJZXQ6UJ9jth+9eVgexkahhi0isVnQmJW4DZkZ9OlS6KigqshpB7FF29u
         ZP9pxeE3vHnuVthrV10Kt8pSyYStMrpPkH3EzNd/Lq2LKOpNeWrfffhCXrDxxjGygY
         fOPyvetd8H+ew==
From:   =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To:     maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        tzimmermann@suse.de, airlied@gmail.com, daniel@ffwll.ch,
        robdclark@gmail.com, quic_abhinavk@quicinc.com,
        dmitry.baryshkov@linaro.org, sean@poorly.run,
        marijn.suijten@somainline.org, robh@kernel.org,
        steven.price@arm.com
Cc:     adrian.larumbe@collabora.com, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, healych@amazon.com,
        kernel@collabora.com, tvrtko.ursulin@linux.intel.com,
        boris.brezillon@collabora.com,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v8 4/5] drm/drm_file: Add DRM obj's RSS reporting function for fdinfo
Date:   Fri, 29 Sep 2023 19:14:30 +0100
Message-ID: <20230929181616.2769345-5-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230929181616.2769345-1-adrian.larumbe@collabora.com>
References: <20230929181616.2769345-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some BO's might be mapped onto physical memory chunkwise and on demand,
like Panfrost's tiler heap. In this case, even though the
drm_gem_shmem_object page array might already be allocated, only a very
small fraction of the BO is currently backed by system memory, but
drm_show_memory_stats will then proceed to add its entire virtual size to
the file's total resident size regardless.

This led to very unrealistic RSS sizes being reckoned for Panfrost, where
said tiler heap buffer is initially allocated with a virtual size of 128
MiB, but only a small part of it will eventually be backed by system memory
after successive GPU page faults.

Provide a new DRM object generic function that would allow drivers to
return a more accurate RSS and purgeable sizes for their BOs.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/drm_file.c | 8 +++++---
 include/drm/drm_gem.h      | 9 +++++++++
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index 883d83bc0e3d..9a1bd8d0d785 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -930,6 +930,8 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 	spin_lock(&file->table_lock);
 	idr_for_each_entry (&file->object_idr, obj, id) {
 		enum drm_gem_object_status s = 0;
+		size_t add_size = (obj->funcs && obj->funcs->rss) ?
+			obj->funcs->rss(obj) : obj->size;
 
 		if (obj->funcs && obj->funcs->status) {
 			s = obj->funcs->status(obj);
@@ -944,7 +946,7 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 		}
 
 		if (s & DRM_GEM_OBJECT_RESIDENT) {
-			status.resident += obj->size;
+			status.resident += add_size;
 		} else {
 			/* If already purged or not yet backed by pages, don't
 			 * count it as purgeable:
@@ -953,14 +955,14 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 		}
 
 		if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true))) {
-			status.active += obj->size;
+			status.active += add_size;
 
 			/* If still active, don't count as purgeable: */
 			s &= ~DRM_GEM_OBJECT_PURGEABLE;
 		}
 
 		if (s & DRM_GEM_OBJECT_PURGEABLE)
-			status.purgeable += obj->size;
+			status.purgeable += add_size;
 	}
 	spin_unlock(&file->table_lock);
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index bc9f6aa2f3fe..16364487fde9 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
 	 */
 	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
 
+	/**
+	 * @rss:
+	 *
+	 * Return resident size of the object in physical memory.
+	 *
+	 * Called by drm_show_memory_stats().
+	 */
+	size_t (*rss)(struct drm_gem_object *obj);
+
 	/**
 	 * @vm_ops:
 	 *
-- 
2.42.0

