Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 581E62481CF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Aug 2020 11:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgHRJUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Aug 2020 05:20:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53802 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726480AbgHRJUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Aug 2020 05:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1597742431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:in-reply-to:in-reply-to:references:references;
        bh=xSCOP8wykTX8rw1Lrf0j5AZQYJ2Q0tirGIG9eXW9mxE=;
        b=DtYCaISQ224Xmc1oQERrzxuXCWgq+x/CgRHEdn2ro1C53iimTqpmjybmYRLFqWnV8PoUJf
        jt8nHNmV+DuU1DVdvuzXLDVMYlnlM84zbq74RAEMrV2MLKXI4Mrqihw7uwKYHKTxJUHu35
        UGxWGgSA1eI1badIKZdCmGzbbfyCMXw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-485-vJEi5jTHNoivX51nQ0FcGw-1; Tue, 18 Aug 2020 05:20:27 -0400
X-MC-Unique: vJEi5jTHNoivX51nQ0FcGw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D969E81F012;
        Tue, 18 Aug 2020 09:20:22 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-195.ams2.redhat.com [10.36.112.195])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 17A7D5D9D2;
        Tue, 18 Aug 2020 09:20:19 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
        id 32D199CBD; Tue, 18 Aug 2020 11:20:18 +0200 (CEST)
From:   Gerd Hoffmann <kraxel@redhat.com>
To:     dri-devel@lists.freedesktop.org
Cc:     christian.koenig@amd.com, Gerd Hoffmann <kraxel@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Ben Skeggs <bskeggs@redhat.com>,
        Sandy Huang <hjc@rock-chips.com>,
        =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
        amd-gfx@lists.freedesktop.org (open list:RADEON and AMDGPU DRM DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        etnaviv@lists.freedesktop.org (moderated list:DRM DRIVERS FOR VIVANTE
        GPU IP),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA
        GEFORCE/QUADRO GPUS),
        linux-arm-kernel@lists.infradead.org (moderated list:ARM/Rockchip SoC
        support),
        linux-rockchip@lists.infradead.org (open list:ARM/Rockchip SoC support),
        linux-tegra@vger.kernel.org (open list:DRM DRIVERS FOR NVIDIA TEGRA),
        xen-devel@lists.xenproject.org (moderated list:DRM DRIVERS FOR XEN)
Subject: [PATCH v2 1/2] drm: allow limiting the scatter list size.
Date:   Tue, 18 Aug 2020 11:20:16 +0200
Message-Id: <20200818092017.26290-2-kraxel@redhat.com>
In-Reply-To: <20200818092017.26290-1-kraxel@redhat.com>
References: <20200818092017.26290-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add max_segment argument to drm_prime_pages_to_sg().  When set pass it
through to the __sg_alloc_table_from_pages() call, otherwise use
SCATTERLIST_MAX_SEGMENT.

Also add max_segment field to drm driver and pass it to
drm_prime_pages_to_sg() calls in drivers and helpers.

v2: place max_segment in drm driver not gem object.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/drm/drm_device.h                    |  8 ++++++++
 include/drm/drm_prime.h                     |  3 ++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c |  3 ++-
 drivers/gpu/drm/drm_gem_shmem_helper.c      |  3 ++-
 drivers/gpu/drm/drm_prime.c                 | 10 +++++++---
 drivers/gpu/drm/etnaviv/etnaviv_gem.c       |  3 ++-
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  3 ++-
 drivers/gpu/drm/msm/msm_gem.c               |  3 ++-
 drivers/gpu/drm/msm/msm_gem_prime.c         |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  3 ++-
 drivers/gpu/drm/radeon/radeon_prime.c       |  3 ++-
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c |  6 ++++--
 drivers/gpu/drm/tegra/gem.c                 |  3 ++-
 drivers/gpu/drm/vgem/vgem_drv.c             |  3 ++-
 drivers/gpu/drm/xen/xen_drm_front_gem.c     |  3 ++-
 15 files changed, 43 insertions(+), 17 deletions(-)

diff --git a/include/drm/drm_device.h b/include/drm/drm_device.h
index 0988351d743c..47cb547a8115 100644
--- a/include/drm/drm_device.h
+++ b/include/drm/drm_device.h
@@ -329,6 +329,14 @@ struct drm_device {
 	 */
 	struct drm_fb_helper *fb_helper;
 
+	/**
+	 * @max_segment:
+	 *
+	 * Max size for scatter list segments.  When unset the default
+	 * (SCATTERLIST_MAX_SEGMENT) is used.
+	 */
+	size_t max_segment;
+
 	/* Everything below here is for legacy driver, never use! */
 	/* private: */
 #if IS_ENABLED(CONFIG_DRM_LEGACY)
diff --git a/include/drm/drm_prime.h b/include/drm/drm_prime.h
index 9af7422b44cf..2c3689435cb4 100644
--- a/include/drm/drm_prime.h
+++ b/include/drm/drm_prime.h
@@ -88,7 +88,8 @@ void drm_gem_dmabuf_vunmap(struct dma_buf *dma_buf, void *vaddr);
 int drm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 int drm_gem_dmabuf_mmap(struct dma_buf *dma_buf, struct vm_area_struct *vma);
 
-struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages);
+struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
+				       size_t max_segment);
 struct dma_buf *drm_gem_prime_export(struct drm_gem_object *obj,
 				     int flags);
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index 519ce4427fce..8f6a647757e7 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -303,7 +303,8 @@ static struct sg_table *amdgpu_dma_buf_map(struct dma_buf_attachment *attach,
 	switch (bo->tbo.mem.mem_type) {
 	case TTM_PL_TT:
 		sgt = drm_prime_pages_to_sg(bo->tbo.ttm->pages,
-					    bo->tbo.num_pages);
+					    bo->tbo.num_pages,
+					    obj->dev->max_segment);
 		if (IS_ERR(sgt))
 			return sgt;
 
diff --git a/drivers/gpu/drm/drm_gem_shmem_helper.c b/drivers/gpu/drm/drm_gem_shmem_helper.c
index 4b7cfbac4daa..8f47b41b0b2f 100644
--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -656,7 +656,8 @@ struct sg_table *drm_gem_shmem_get_sg_table(struct drm_gem_object *obj)
 
 	WARN_ON(shmem->base.import_attach);
 
-	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT);
+	return drm_prime_pages_to_sg(shmem->pages, obj->size >> PAGE_SHIFT,
+				     obj->dev->max_segment);
 }
 EXPORT_SYMBOL_GPL(drm_gem_shmem_get_sg_table);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 1693aa7c14b5..27c783fd6633 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -802,7 +802,8 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
  *
  * This is useful for implementing &drm_gem_object_funcs.get_sg_table.
  */
-struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages)
+struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_pages,
+				       size_t max_segment)
 {
 	struct sg_table *sg = NULL;
 	int ret;
@@ -813,8 +814,11 @@ struct sg_table *drm_prime_pages_to_sg(struct page **pages, unsigned int nr_page
 		goto out;
 	}
 
-	ret = sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
-				nr_pages << PAGE_SHIFT, GFP_KERNEL);
+	if (max_segment == 0 || max_segment > SCATTERLIST_MAX_SEGMENT)
+		max_segment = SCATTERLIST_MAX_SEGMENT;
+	ret = __sg_alloc_table_from_pages(sg, pages, nr_pages, 0,
+					  nr_pages << PAGE_SHIFT,
+					  max_segment, GFP_KERNEL);
 	if (ret)
 		goto out;
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem.c b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
index f06e19e7be04..90654246b335 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem.c
@@ -103,7 +103,8 @@ struct page **etnaviv_gem_get_pages(struct etnaviv_gem_object *etnaviv_obj)
 		int npages = etnaviv_obj->base.size >> PAGE_SHIFT;
 		struct sg_table *sgt;
 
-		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
+		sgt = drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
+					    etnaviv_obj->base.dev->max_segment);
 		if (IS_ERR(sgt)) {
 			dev_err(dev->dev, "failed to allocate sgt: %ld\n",
 				PTR_ERR(sgt));
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 6d9e5c3c4dd5..f65be0fffb3d 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -19,7 +19,8 @@ struct sg_table *etnaviv_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (WARN_ON(!etnaviv_obj->pages))  /* should have already pinned! */
 		return ERR_PTR(-EINVAL);
 
-	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages);
+	return drm_prime_pages_to_sg(etnaviv_obj->pages, npages,
+				     obj->dev->max_segment);
 }
 
 void *etnaviv_gem_prime_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index b2f49152b4d4..dbf1437c3dac 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -126,7 +126,8 @@ static struct page **get_pages(struct drm_gem_object *obj)
 
 		msm_obj->pages = p;
 
-		msm_obj->sgt = drm_prime_pages_to_sg(p, npages);
+		msm_obj->sgt = drm_prime_pages_to_sg(p, npages,
+						     obj->dev->max_segment);
 		if (IS_ERR(msm_obj->sgt)) {
 			void *ptr = ERR_CAST(msm_obj->sgt);
 
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index d7c8948427fe..6337cd1f9428 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -19,7 +19,8 @@ struct sg_table *msm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	if (WARN_ON(!msm_obj->pages))  /* should have already pinned! */
 		return NULL;
 
-	return drm_prime_pages_to_sg(msm_obj->pages, npages);
+	return drm_prime_pages_to_sg(msm_obj->pages, npages,
+				     obj->dev->max_segment);
 }
 
 void *msm_gem_prime_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index bae6a3eccee0..dd0ff032ae16 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -32,7 +32,8 @@ struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 	int npages = nvbo->bo.num_pages;
 
-	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages);
+	return drm_prime_pages_to_sg(nvbo->bo.ttm->pages, npages,
+				     obj->dev->max_segment);
 }
 
 void *nouveau_gem_prime_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index b906e8fbd5f3..61a3fe147489 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -36,7 +36,8 @@ struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int npages = bo->tbo.num_pages;
 
-	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages);
+	return drm_prime_pages_to_sg(bo->tbo.ttm->pages, npages,
+				     obj->dev->max_segment);
 }
 
 void *radeon_gem_prime_vmap(struct drm_gem_object *obj)
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index b9275ba7c5a5..5ddb2d31a607 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -85,7 +85,8 @@ static int rockchip_gem_get_pages(struct rockchip_gem_object *rk_obj)
 
 	rk_obj->num_pages = rk_obj->base.size >> PAGE_SHIFT;
 
-	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
+	rk_obj->sgt = drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
+					    rk_obj->base.dev->max_segment);
 	if (IS_ERR(rk_obj->sgt)) {
 		ret = PTR_ERR(rk_obj->sgt);
 		goto err_put_pages;
@@ -442,7 +443,8 @@ struct sg_table *rockchip_gem_prime_get_sg_table(struct drm_gem_object *obj)
 	int ret;
 
 	if (rk_obj->pages)
-		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages);
+		return drm_prime_pages_to_sg(rk_obj->pages, rk_obj->num_pages,
+					     obj->dev->max_segment);
 
 	sgt = kzalloc(sizeof(*sgt), GFP_KERNEL);
 	if (!sgt)
diff --git a/drivers/gpu/drm/tegra/gem.c b/drivers/gpu/drm/tegra/gem.c
index 723df142a981..a0abde747e95 100644
--- a/drivers/gpu/drm/tegra/gem.c
+++ b/drivers/gpu/drm/tegra/gem.c
@@ -284,7 +284,8 @@ static int tegra_bo_get_pages(struct drm_device *drm, struct tegra_bo *bo)
 
 	bo->num_pages = bo->gem.size >> PAGE_SHIFT;
 
-	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages);
+	bo->sgt = drm_prime_pages_to_sg(bo->pages, bo->num_pages,
+					bo->gem.dev->max_segment);
 	if (IS_ERR(bo->sgt)) {
 		err = PTR_ERR(bo->sgt);
 		goto put_pages;
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 313339bbff90..045461dc6319 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -321,7 +321,8 @@ static struct sg_table *vgem_prime_get_sg_table(struct drm_gem_object *obj)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 
-	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT);
+	return drm_prime_pages_to_sg(bo->pages, bo->base.size >> PAGE_SHIFT,
+				     obj->dev->max_segment);
 }
 
 static struct drm_gem_object* vgem_prime_import(struct drm_device *dev,
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index f0b85e094111..61a8c1a9fb04 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -179,7 +179,8 @@ struct sg_table *xen_drm_front_gem_get_sg_table(struct drm_gem_object *gem_obj)
 	if (!xen_obj->pages)
 		return ERR_PTR(-ENOMEM);
 
-	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages);
+	return drm_prime_pages_to_sg(xen_obj->pages, xen_obj->num_pages,
+				     gem_obj->dev->max_segment);
 }
 
 struct drm_gem_object *
-- 
2.18.4

