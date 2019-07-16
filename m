Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7649A6ADDA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Jul 2019 19:48:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728573AbfGPRsO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Jul 2019 13:48:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43486 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728190AbfGPRsO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Jul 2019 13:48:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id f25so9789675pgv.10;
        Tue, 16 Jul 2019 10:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9g4Md16DCAxWYz0fYzP1PJhZRgUGpb8Cny7KRqZ/Ew0=;
        b=Z6WB3pngMQtPLpQxxvQac9oM2e37ImNX+vxNX5iUn6gjv6OFmkKv94mojBUEDA5+Ai
         l6f2AD+8Wz9XIlT4OsAWTS62vaRdSv9vRbJqkFrYei8D7SN9s56O2xzFU4hQRfskxete
         ZPyiv6JyI6+ILOrGa+FDay5VrMQOjghQhLiIadAewHe+CuemnJprp2LRfOdXyf5W6Qah
         bhqIp5agYmDSR0CHaF3W7m+9zK50TGWwbsN1NoW4S3aKZeexyyWRxaR6zlct5d45+7u3
         Nq/9ZG8nX1IJkWgeIv02RL2hUB2Qma6O4FKm1Z4nBckGfBJGkowW0x/CamlTguOrywpN
         bVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9g4Md16DCAxWYz0fYzP1PJhZRgUGpb8Cny7KRqZ/Ew0=;
        b=ZVE4qbbRYaVG9IhF+2co2G8bgaAjijscuDt/4mbfx+cpGxwSt4s5hvaRKMAbtye8Ir
         sG5SZAUI0Z8cAOT31DhSysuNG7ILsMbLWUy2iL7IVcuILW8eEEnVowebKOwmIAoH4mYl
         O1AyEMv20k//FtP2Rr27eezWt063b5TDYOGwHj2BWO/21qtIk+1b7WwGXrnf3eqdOJ96
         42SFE5EceTKprmt2plyyHacAonPx99guDDyR1M2vI4fmq/iH+k+2pgYSfeJv8vQLzuDb
         SfiqOmBr220sFzcqZ4p0PVXAMjYSEaO/kDsiU8/1b1T4akT7DsO3Tfz1QX35MlV86rlc
         YL+A==
X-Gm-Message-State: APjAAAXryZqlJuYM6yfsFIVFRRX/sqsLi+Zgm1+7aq0+jD+cJqoQlYK9
        YmpqtEqlXBt+udmHz+VB0Tc=
X-Google-Smtp-Source: APXvYqx8QX41rDX34LIUzD8Oec4VxbCKn35kpEbgw14+HdY+DpTKpNjb9u2WDeygpdvc6XYdJUsJGA==
X-Received: by 2002:a65:654f:: with SMTP id a15mr34676339pgw.73.1563299292765;
        Tue, 16 Jul 2019 10:48:12 -0700 (PDT)
Received: from localhost ([100.118.89.203])
        by smtp.gmail.com with ESMTPSA id 65sm21825749pff.148.2019.07.16.10.48.11
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 16 Jul 2019 10:48:12 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Chris Wilson <chris@chris-wilson.co.uk>,
        Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Lucas Stach <l.stach@pengutronix.de>,
        Russell King <linux+etnaviv@armlinux.org.uk>,
        Christian Gmeiner <christian.gmeiner@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Dave Airlie <airlied@redhat.com>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        "David (ChunMing) Zhou" <David1.Zhou@amd.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Emil Velikov <emil.velikov@collabora.com>,
        Laura Abbott <labbott@redhat.com>,
        Imre Deak <imre.deak@intel.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Eric Biggers <ebiggers@google.com>,
        Deepak Sharma <deepak.sharma@amd.com>,
        linux-kernel@vger.kernel.org, etnaviv@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        nouveau@lists.freedesktop.org,
        virtualization@lists.linux-foundation.org,
        spice-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/3] drm: plumb attaching dev thru to prime_pin/unpin
Date:   Tue, 16 Jul 2019 10:43:22 -0700
Message-Id: <20190716174331.7371-2-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190716174331.7371-1-robdclark@gmail.com>
References: <20190716174331.7371-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Needed in the following patch for cache operations.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_gem.c                   | 10 ++++++----
 drivers/gpu/drm/drm_gem_vram_helper.c       |  6 ++++--
 drivers/gpu/drm/drm_prime.c                 |  4 ++--
 drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c |  4 ++--
 drivers/gpu/drm/msm/msm_drv.h               |  4 ++--
 drivers/gpu/drm/msm/msm_gem_prime.c         |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_gem.h       |  4 ++--
 drivers/gpu/drm/nouveau/nouveau_prime.c     |  4 ++--
 drivers/gpu/drm/qxl/qxl_prime.c             |  4 ++--
 drivers/gpu/drm/radeon/radeon_prime.c       |  4 ++--
 drivers/gpu/drm/vboxvideo/vbox_prime.c      |  4 ++--
 drivers/gpu/drm/vgem/vgem_drv.c             |  4 ++--
 include/drm/drm_drv.h                       |  4 ++--
 include/drm/drm_gem.h                       |  4 ++--
 include/drm/drm_gem_vram_helper.h           |  4 ++--
 15 files changed, 36 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 7d6242cc69f2..0a2645769624 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1219,18 +1219,19 @@ void drm_gem_print_info(struct drm_printer *p, unsigned int indent,
 /**
  * drm_gem_pin - Pin backing buffer in memory
  * @obj: GEM object
+ * @dev: the device the buffer is being pinned for
  *
  * Make sure the backing buffer is pinned in memory.
  *
  * Returns:
  * 0 on success or a negative error code on failure.
  */
-int drm_gem_pin(struct drm_gem_object *obj)
+int drm_gem_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (obj->funcs && obj->funcs->pin)
 		return obj->funcs->pin(obj);
 	else if (obj->dev->driver->gem_prime_pin)
-		return obj->dev->driver->gem_prime_pin(obj);
+		return obj->dev->driver->gem_prime_pin(obj, dev);
 	else
 		return 0;
 }
@@ -1239,15 +1240,16 @@ EXPORT_SYMBOL(drm_gem_pin);
 /**
  * drm_gem_unpin - Unpin backing buffer from memory
  * @obj: GEM object
+ * @dev: the device the buffer is being pinned for
  *
  * Relax the requirement that the backing buffer is pinned in memory.
  */
-void drm_gem_unpin(struct drm_gem_object *obj)
+void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (obj->funcs && obj->funcs->unpin)
 		obj->funcs->unpin(obj);
 	else if (obj->dev->driver->gem_prime_unpin)
-		obj->dev->driver->gem_prime_unpin(obj);
+		obj->dev->driver->gem_prime_unpin(obj, dev);
 }
 EXPORT_SYMBOL(drm_gem_unpin);
 
diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 4de782ca26b2..62fafec93948 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -548,7 +548,8 @@ EXPORT_SYMBOL(drm_gem_vram_driver_dumb_mmap_offset);
  * 0 on success, or
  * a negative errno code otherwise.
  */
-int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *gem)
+int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *gem,
+				      struct device *dev)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
@@ -569,7 +570,8 @@ EXPORT_SYMBOL(drm_gem_vram_driver_gem_prime_pin);
 	Implements &struct drm_driver.gem_prime_unpin
  * @gem:	The GEM object to unpin
  */
-void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *gem)
+void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *gem,
+					 struct device *dev)
 {
 	struct drm_gem_vram_object *gbo = drm_gem_vram_of_gem(gem);
 
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d0c01318076b..505893cfac8e 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -196,7 +196,7 @@ int drm_gem_map_attach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	return drm_gem_pin(obj);
+	return drm_gem_pin(obj, attach->dev);
 }
 EXPORT_SYMBOL(drm_gem_map_attach);
 
@@ -213,7 +213,7 @@ void drm_gem_map_detach(struct dma_buf *dma_buf,
 {
 	struct drm_gem_object *obj = dma_buf->priv;
 
-	drm_gem_unpin(obj);
+	drm_gem_unpin(obj, attach->dev);
 }
 EXPORT_SYMBOL(drm_gem_map_detach);
 
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
index 00e8b6a817e3..44385d590aa7 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_gem_prime.c
@@ -43,7 +43,7 @@ int etnaviv_gem_prime_mmap(struct drm_gem_object *obj,
 	return etnaviv_obj->ops->mmap(etnaviv_obj, vma);
 }
 
-int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
+int etnaviv_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
@@ -55,7 +55,7 @@ int etnaviv_gem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void etnaviv_gem_prime_unpin(struct drm_gem_object *obj)
+void etnaviv_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach) {
 		struct etnaviv_gem_object *etnaviv_obj = to_etnaviv_bo(obj);
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 9ada948f6b01..6f8f6df9c289 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -298,8 +298,8 @@ void msm_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 int msm_gem_prime_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
 struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 		struct dma_buf_attachment *attach, struct sg_table *sg);
-int msm_gem_prime_pin(struct drm_gem_object *obj);
-void msm_gem_prime_unpin(struct drm_gem_object *obj);
+int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev);
+void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev);
 void *msm_gem_get_vaddr(struct drm_gem_object *obj);
 void *msm_gem_get_vaddr_active(struct drm_gem_object *obj);
 void msm_gem_put_vaddr(struct drm_gem_object *obj);
diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 60bb290700ce..8e0ddf5c9460 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -58,14 +58,14 @@ struct drm_gem_object *msm_gem_prime_import_sg_table(struct drm_device *dev,
 	return msm_gem_import(dev, attach->dmabuf, sg);
 }
 
-int msm_gem_prime_pin(struct drm_gem_object *obj)
+int msm_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach)
 		msm_gem_get_pages(obj);
 	return 0;
 }
 
-void msm_gem_prime_unpin(struct drm_gem_object *obj)
+void msm_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	if (!obj->import_attach)
 		msm_gem_put_pages(obj);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.h b/drivers/gpu/drm/nouveau/nouveau_gem.h
index fe39998f65cc..91dcf89138f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.h
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.h
@@ -32,9 +32,9 @@ extern int nouveau_gem_ioctl_cpu_fini(struct drm_device *, void *,
 extern int nouveau_gem_ioctl_info(struct drm_device *, void *,
 				  struct drm_file *);
 
-extern int nouveau_gem_prime_pin(struct drm_gem_object *);
+extern int nouveau_gem_prime_pin(struct drm_gem_object *, struct device *);
 struct reservation_object *nouveau_gem_prime_res_obj(struct drm_gem_object *);
-extern void nouveau_gem_prime_unpin(struct drm_gem_object *);
+extern void nouveau_gem_prime_unpin(struct drm_gem_object *, struct device *);
 extern struct sg_table *nouveau_gem_prime_get_sg_table(struct drm_gem_object *);
 extern struct drm_gem_object *nouveau_gem_prime_import_sg_table(
 	struct drm_device *, struct dma_buf_attachment *, struct sg_table *);
diff --git a/drivers/gpu/drm/nouveau/nouveau_prime.c b/drivers/gpu/drm/nouveau/nouveau_prime.c
index 1fefc93af1d7..dec2d5e37b34 100644
--- a/drivers/gpu/drm/nouveau/nouveau_prime.c
+++ b/drivers/gpu/drm/nouveau/nouveau_prime.c
@@ -88,7 +88,7 @@ struct drm_gem_object *nouveau_gem_prime_import_sg_table(struct drm_device *dev,
 	return &nvbo->gem;
 }
 
-int nouveau_gem_prime_pin(struct drm_gem_object *obj)
+int nouveau_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 	int ret;
@@ -101,7 +101,7 @@ int nouveau_gem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-void nouveau_gem_prime_unpin(struct drm_gem_object *obj)
+void nouveau_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct nouveau_bo *nvbo = nouveau_gem_object(obj);
 
diff --git a/drivers/gpu/drm/qxl/qxl_prime.c b/drivers/gpu/drm/qxl/qxl_prime.c
index 7d3816fca5a8..21e9b44eb2e4 100644
--- a/drivers/gpu/drm/qxl/qxl_prime.c
+++ b/drivers/gpu/drm/qxl/qxl_prime.c
@@ -28,14 +28,14 @@
 /* Empty Implementations as there should not be any other driver for a virtual
  * device that might share buffers with qxl */
 
-int qxl_gem_prime_pin(struct drm_gem_object *obj)
+int qxl_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
 	return qxl_bo_pin(bo);
 }
 
-void qxl_gem_prime_unpin(struct drm_gem_object *obj)
+void qxl_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct qxl_bo *bo = gem_to_qxl_bo(obj);
 
diff --git a/drivers/gpu/drm/radeon/radeon_prime.c b/drivers/gpu/drm/radeon/radeon_prime.c
index d3a5bea9a2c5..2d3eadcf0f2d 100644
--- a/drivers/gpu/drm/radeon/radeon_prime.c
+++ b/drivers/gpu/drm/radeon/radeon_prime.c
@@ -83,7 +83,7 @@ struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 	return &bo->gem_base;
 }
 
-int radeon_gem_prime_pin(struct drm_gem_object *obj)
+int radeon_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret = 0;
@@ -101,7 +101,7 @@ int radeon_gem_prime_pin(struct drm_gem_object *obj)
 	return ret;
 }
 
-void radeon_gem_prime_unpin(struct drm_gem_object *obj)
+void radeon_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct radeon_bo *bo = gem_to_radeon_bo(obj);
 	int ret = 0;
diff --git a/drivers/gpu/drm/vboxvideo/vbox_prime.c b/drivers/gpu/drm/vboxvideo/vbox_prime.c
index 702b1aa53494..ad6de9a41950 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_prime.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_prime.c
@@ -13,13 +13,13 @@
  * device that might share buffers with vboxvideo
  */
 
-int vbox_gem_prime_pin(struct drm_gem_object *obj)
+int vbox_gem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	WARN_ONCE(1, "not implemented");
 	return -ENODEV;
 }
 
-void vbox_gem_prime_unpin(struct drm_gem_object *obj)
+void vbox_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	WARN_ONCE(1, "not implemented");
 }
diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index 11a8f99ba18c..a179e962b79e 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -307,7 +307,7 @@ static void vgem_unpin_pages(struct drm_vgem_gem_object *bo)
 	mutex_unlock(&bo->pages_lock);
 }
 
-static int vgem_prime_pin(struct drm_gem_object *obj)
+static int vgem_prime_pin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 	long n_pages = obj->size >> PAGE_SHIFT;
@@ -325,7 +325,7 @@ static int vgem_prime_pin(struct drm_gem_object *obj)
 	return 0;
 }
 
-static void vgem_prime_unpin(struct drm_gem_object *obj)
+static void vgem_prime_unpin(struct drm_gem_object *obj, struct device *dev)
 {
 	struct drm_vgem_gem_object *bo = to_vgem_bo(obj);
 
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 68ca736c548d..6a9489b9532f 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -584,8 +584,8 @@ struct drm_driver {
 	 */
 	struct drm_gem_object * (*gem_prime_import)(struct drm_device *dev,
 				struct dma_buf *dma_buf);
-	int (*gem_prime_pin)(struct drm_gem_object *obj);
-	void (*gem_prime_unpin)(struct drm_gem_object *obj);
+	int (*gem_prime_pin)(struct drm_gem_object *obj, struct device *dev);
+	void (*gem_prime_unpin)(struct drm_gem_object *obj, struct device *dev);
 	struct reservation_object * (*gem_prime_res_obj)(
 				struct drm_gem_object *obj);
 	struct sg_table *(*gem_prime_get_sg_table)(struct drm_gem_object *obj);
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 5047c7ee25f5..ebd12be354d2 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -401,8 +401,8 @@ int drm_gem_dumb_destroy(struct drm_file *file,
 			 struct drm_device *dev,
 			 uint32_t handle);
 
-int drm_gem_pin(struct drm_gem_object *obj);
-void drm_gem_unpin(struct drm_gem_object *obj);
+int drm_gem_pin(struct drm_gem_object *obj, struct device *dev);
+void drm_gem_unpin(struct drm_gem_object *obj, struct device *dev);
 void *drm_gem_vmap(struct drm_gem_object *obj);
 void drm_gem_vunmap(struct drm_gem_object *obj, void *vaddr);
 
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 9581ea0a4f7e..33556e157202 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -133,8 +133,8 @@ int drm_gem_vram_driver_dumb_mmap_offset(struct drm_file *file,
  * PRIME helpers for struct drm_driver
  */
 
-int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *obj);
-void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *obj);
+int drm_gem_vram_driver_gem_prime_pin(struct drm_gem_object *obj, struct device *dev);
+void drm_gem_vram_driver_gem_prime_unpin(struct drm_gem_object *obj, struct device *dev);
 void *drm_gem_vram_driver_gem_prime_vmap(struct drm_gem_object *obj);
 void drm_gem_vram_driver_gem_prime_vunmap(struct drm_gem_object *obj,
 					  void *vaddr);
-- 
2.21.0

