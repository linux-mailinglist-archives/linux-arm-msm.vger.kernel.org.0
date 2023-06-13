Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9382172E69F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 17:05:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235653AbjFMPEz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jun 2023 11:04:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36902 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242964AbjFMPEw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jun 2023 11:04:52 -0400
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B366C1734
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Jun 2023 08:04:49 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id 688121FDC3;
        Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1686668688; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KChJ6obsWLebACPZOrdUaB93nOGxMLas+1dqu9fpv2s=;
        b=rFmds+GPaH28ao0DPklSU3dUhj18zJmcCBJwbYzMt8deOSGuEwqutIQyBjZi8ug5qNjSq+
        hpkOQL4CwfGQ9GIcgzrSb0AkUq0DzhNzGIyYEWISxSTOc5ZY/MlMAd2fQISdby5QTAvnf9
        6gbYlyIoyhe5KCJx4SzpYow3JxjurNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1686668688;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KChJ6obsWLebACPZOrdUaB93nOGxMLas+1dqu9fpv2s=;
        b=sV9QHr3gLCpoV4rNzM5MSEqI7XoZf8DuCbfYkSr3/4xEWtRvlfjlxebR9yc4RPQpc6TesP
        RaqkXaTlZRvtAkBQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 3832213A47;
        Tue, 13 Jun 2023 15:04:48 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id OLTKDJCFiGSGFQAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Tue, 13 Jun 2023 15:04:48 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@gmail.com, robdclark@gmail.com,
        quic_abhinavk@quicinc.com, sean@poorly.run
Cc:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] drm: Remove struct drm_driver.gem_prime_mmap
Date:   Tue, 13 Jun 2023 16:51:33 +0200
Message-ID: <20230613150441.17720-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230613150441.17720-1-tzimmermann@suse.de>
References: <20230613150441.17720-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

All drivers initialize this field with drm_gem_prime_mmap(). Call
the function directly and remove the field. Simplifies the code and
resolves a long-standing TODO item.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 Documentation/gpu/todo.rst                      |  9 ---------
 drivers/accel/ivpu/ivpu_drv.c                   |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c         |  1 -
 drivers/gpu/drm/drm_fbdev_dma.c                 |  6 +-----
 drivers/gpu/drm/drm_prime.c                     | 14 ++------------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c           |  1 -
 drivers/gpu/drm/exynos/exynos_drm_drv.c         |  1 -
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c |  1 -
 drivers/gpu/drm/lima/lima_drv.c                 |  1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c          |  1 -
 drivers/gpu/drm/msm/msm_drv.c                   |  1 -
 drivers/gpu/drm/msm/msm_drv.h                   |  1 -
 drivers/gpu/drm/msm/msm_gem_prime.c             |  5 -----
 drivers/gpu/drm/nouveau/nouveau_drm.c           |  1 -
 drivers/gpu/drm/panfrost/panfrost_drv.c         |  1 -
 drivers/gpu/drm/pl111/pl111_drv.c               |  1 -
 drivers/gpu/drm/radeon/radeon_drv.c             |  1 -
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   |  1 -
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c     |  1 -
 drivers/gpu/drm/v3d/v3d_drv.c                   |  1 -
 drivers/gpu/drm/virtio/virtgpu_drv.c            |  1 -
 drivers/gpu/drm/xen/xen_drm_front.c             |  1 -
 include/drm/drm_drv.h                           | 14 --------------
 include/drm/drm_gem_dma_helper.h                |  6 ++----
 include/drm/drm_gem_shmem_helper.h              |  1 -
 include/drm/drm_gem_vram_helper.h               |  1 -
 26 files changed, 5 insertions(+), 69 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 68bdafa0284f5..ca1efad8c89c3 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -319,15 +319,6 @@ Contact: Daniel Vetter, Noralf Tronnes
 
 Level: Advanced
 
-struct drm_gem_object_funcs
----------------------------
-
-GEM objects can now have a function table instead of having the callbacks on the
-DRM driver struct. This is now the preferred way. Callbacks in drivers have been
-converted, except for struct drm_driver.gem_prime_mmap.
-
-Level: Intermediate
-
 connector register/unregister fixes
 -----------------------------------
 
diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 2df7643b843d5..9f2b9fdcc5498 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -376,7 +376,6 @@ static const struct drm_driver driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = ivpu_gem_prime_import,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.ioctls = ivpu_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(ivpu_drm_ioctls),
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index c9a41c997c6c7..7681f79f462eb 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2809,7 +2809,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/drm_fbdev_dma.c b/drivers/gpu/drm/drm_fbdev_dma.c
index d86773fa8ab00..8217f1ddc0075 100644
--- a/drivers/gpu/drm/drm_fbdev_dma.c
+++ b/drivers/gpu/drm/drm_fbdev_dma.c
@@ -54,12 +54,8 @@ static void drm_fbdev_dma_fb_destroy(struct fb_info *info)
 static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
 {
 	struct drm_fb_helper *fb_helper = info->par;
-	struct drm_device *dev = fb_helper->dev;
-
-	if (drm_WARN_ON_ONCE(dev, !fb_helper->dev->driver->gem_prime_mmap))
-		return -ENODEV;
 
-	return fb_helper->dev->driver->gem_prime_mmap(fb_helper->buffer->gem, vma);
+	return drm_gem_prime_mmap(fb_helper->buffer->gem, vma);
 }
 
 static const struct fb_ops drm_fbdev_dma_fb_ops = {
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d29dafce9bb0a..6bcf324ef81c9 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -715,8 +715,6 @@ EXPORT_SYMBOL(drm_gem_dmabuf_vunmap);
  * the same codepath that is used for regular GEM buffer mapping on the DRM fd.
  * The fake GEM offset is added to vma->vm_pgoff and &drm_driver->fops->mmap is
  * called to set up the mapping.
- *
- * Drivers can use this as their &drm_driver.gem_prime_mmap callback.
  */
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 {
@@ -772,25 +770,17 @@ EXPORT_SYMBOL(drm_gem_prime_mmap);
  * @vma: virtual address range
  *
  * Provides memory mapping for the buffer. This can be used as the
- * &dma_buf_ops.mmap callback. It just forwards to &drm_driver.gem_prime_mmap,
- * which should be set to drm_gem_prime_mmap().
- *
- * FIXME: There's really no point to this wrapper, drivers which need anything
- * else but drm_gem_prime_mmap can roll their own &dma_buf_ops.mmap callback.
+ * &dma_buf_ops.mmap callback. It just forwards to drm_gem_prime_mmap().
  *
  * Returns 0 on success or a negative error code on failure.
  */
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma)
 {
 	struct drm_gem_object *obj = dma_buf->priv;
-	struct drm_device *dev = obj->dev;
 
 	dma_resv_assert_held(dma_buf->resv);
 
-	if (!dev->driver->gem_prime_mmap)
-		return -ENOSYS;
-
-	return dev->driver->gem_prime_mmap(obj, vma);
+	return drm_gem_prime_mmap(obj, vma);
 }
 EXPORT_SYMBOL(drm_gem_dmabuf_mmap);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 31a7f59ccb49e..00223a8749092 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -484,7 +484,6 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
-	.gem_prime_mmap     = drm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index 6b73fb7a83c3c..c9e3c88fb329c 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -113,7 +113,6 @@ static const struct drm_driver exynos_drm_driver = {
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
-	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.ioctls			= exynos_ioctls,
 	.num_ioctls		= ARRAY_SIZE(exynos_ioctls),
 	.fops			= &exynos_drm_driver_fops,
diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
index 0c4aa4d9b0a77..8a98fa276e8a9 100644
--- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c
@@ -63,7 +63,6 @@ static const struct drm_driver hibmc_driver = {
 	.debugfs_init		= drm_vram_mm_debugfs_init,
 	.dumb_create            = hibmc_dumb_create,
 	.dumb_map_offset        = drm_gem_ttm_dumb_map_offset,
-	.gem_prime_mmap		= drm_gem_prime_mmap,
 };
 
 static int __maybe_unused hibmc_pm_suspend(struct device *dev)
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index e8566211e9fa1..65c31dc38049a 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -279,7 +279,6 @@ static const struct drm_driver lima_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 };
 
 struct lima_block_reader {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 6dcb4ba2466c0..5693bb8d29ce4 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -560,7 +560,6 @@ static const struct drm_driver mtk_drm_driver = {
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = mtk_drm_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 891eff8433a9c..47efa3c4492c4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1089,7 +1089,6 @@ static const struct drm_driver msm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
-	.gem_prime_mmap     = msm_gem_prime_mmap,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
 #endif
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c95..44c9e06f2dffa 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -282,7 +282,6 @@ unsigned long msm_gem_shrinker_shrink(struct drm_device *dev, unsigned long nr_t
 void msm_gem_shrinker_init(struct drm_device *dev);
 void msm_gem_shrinker_cleanup(struct drm_device *dev);
 
-int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj);
 int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map);
 void msm_gem_prime_vunmap(struct drm_gem_object *obj, struct iosys_map *map);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 2c846afe049e4..5f68e31a3e4e1 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -11,11 +11,6 @@
 #include "msm_drv.h"
 #include "msm_gem.h"
 
-int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
-{
-	return drm_gem_prime_mmap(obj, vma);
-}
-
 struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index cc7c5b4a05fd8..4199b8294e6e8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1237,7 +1237,6 @@ driver_stub = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.dumb_create = nouveau_display_dumb_create,
 	.dumb_map_offset = drm_gem_ttm_dumb_map_offset,
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 19f8cff52e533..d2916bf435473 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -542,7 +542,6 @@ static const struct drm_driver panfrost_drm_driver = {
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
-	.gem_prime_mmap		= drm_gem_prime_mmap,
 };
 
 static int panfrost_probe(struct platform_device *pdev)
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 43049c8028b21..c4b8357ea9996 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -227,7 +227,6 @@ static const struct drm_driver pl111_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = pl111_debugfs_init,
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index e4374814f0ef6..cf1b960c4200c 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -607,7 +607,6 @@ static const struct drm_driver kms_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index ed3ee3d15baec..4280ff5fa91f2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -608,7 +608,6 @@ static const struct drm_driver rcar_du_driver = {
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
-	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.fops			= &rcar_du_fops,
 	.name			= "rcar-du",
 	.desc			= "Renesas R-Car Display Unit",
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index c0ebfdf56a711..b8cf89f0cc566 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -227,7 +227,6 @@ static const struct drm_driver rockchip_drm_driver = {
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
-	.gem_prime_mmap		= drm_gem_prime_mmap,
 	.fops			= &rockchip_drm_driver_fops,
 	.name	= DRIVER_NAME,
 	.desc	= DRIVER_DESC,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 71f9fdde24b41..845a36e36450d 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -174,7 +174,6 @@ static const struct drm_driver v3d_drm_driver = {
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = v3d_prime_import_sg_table,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 
 	.ioctls = v3d_drm_ioctls,
 	.num_ioctls = ARRAY_SIZE(v3d_drm_ioctls),
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index add075681e18f..91ace7a44f2a6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -188,7 +188,6 @@ static const struct drm_driver driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_mmap = drm_gem_prime_mmap,
 	.gem_prime_import = virtgpu_gem_prime_import,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 90996c108146d..62c3c13b3a175 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -477,7 +477,6 @@ static const struct drm_driver xen_drm_driver = {
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_mmap            = drm_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
 	.name                      = "xendrm-du",
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 89e2706cac561..870278ecd8ba9 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -343,20 +343,6 @@ struct drm_driver {
 				struct drm_device *dev,
 				struct dma_buf_attachment *attach,
 				struct sg_table *sgt);
-	/**
-	 * @gem_prime_mmap:
-	 *
-	 * mmap hook for GEM drivers, used to implement dma-buf mmap in the
-	 * PRIME helpers.
-	 *
-	 * This hook only exists for historical reasons. Drivers must use
-	 * drm_gem_prime_mmap() to implement it.
-	 *
-	 * FIXME: Convert all drivers to implement mmap in struct
-	 * &drm_gem_object_funcs and inline drm_gem_prime_mmap() into
-	 * its callers. This hook should be removed afterwards.
-	 */
-	int (*gem_prime_mmap)(struct drm_gem_object *obj, struct vm_area_struct *vma);
 
 	/**
 	 * @dumb_create:
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 8a043235dad81..61da596780b64 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -169,8 +169,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
 	.dumb_create		= (dumb_create_func), \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table, \
-	.gem_prime_mmap		= drm_gem_prime_mmap
+	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table
 
 /**
  * DRM_GEM_DMA_DRIVER_OPS - DMA GEM driver operations
@@ -207,8 +206,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
 	.dumb_create		= dumb_create_func, \
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
-	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table_vmap, \
-	.gem_prime_mmap		= drm_gem_prime_mmap
+	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table_vmap
 
 /**
  * DRM_GEM_DMA_DRIVER_OPS_VMAP - DMA GEM driver operations ensuring a virtual
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 5994fed5e3278..46eb46e690630 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -293,7 +293,6 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
-	.gem_prime_mmap		= drm_gem_prime_mmap, \
 	.dumb_create		= drm_gem_shmem_dumb_create
 
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index f4aab64411d82..6b265cb9f45a4 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -160,7 +160,6 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 	.debugfs_init             = drm_vram_mm_debugfs_init, \
 	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
 	.dumb_map_offset	  = drm_gem_ttm_dumb_map_offset, \
-	.gem_prime_mmap		  = drm_gem_prime_mmap, \
 	.prime_handle_to_fd	  = drm_gem_prime_handle_to_fd, \
 	.prime_fd_to_handle	  = drm_gem_prime_fd_to_handle
 
-- 
2.41.0

