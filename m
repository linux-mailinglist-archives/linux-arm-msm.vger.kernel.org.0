Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D71A26B32A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 01:01:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbgIOXBM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 15 Sep 2020 19:01:12 -0400
Received: from mx2.suse.de ([195.135.220.15]:36396 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726986AbgIOPCL (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 15 Sep 2020 11:02:11 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id D48E2B14C;
        Tue, 15 Sep 2020 15:00:30 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     alexander.deucher@amd.com, christian.koenig@amd.com,
        airlied@linux.ie, daniel@ffwll.ch, linux@armlinux.org.uk,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        l.stach@pengutronix.de, christian.gmeiner@gmail.com,
        inki.dae@samsung.com, jy0922.shim@samsung.com,
        sw0312.kim@samsung.com, kyungmin.park@samsung.com,
        kgene@kernel.org, krzk@kernel.org, patrik.r.jakobsson@gmail.com,
        jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
        rodrigo.vivi@intel.com, chunkuang.hu@kernel.org,
        p.zabel@pengutronix.de, matthias.bgg@gmail.com,
        robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
        tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
        heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
        rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
        oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
        laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
        sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
        tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
        andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com,
        xinhui.pan@amd.com, aaron.liu@amd.com, nirmoy.das@amd.com,
        chris@chris-wilson.co.uk, matthew.auld@intel.com,
        tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com,
        sam@ravnborg.org, miaoqinglang@huawei.com,
        emil.velikov@collabora.com
Cc:     amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        etnaviv@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org,
        xen-devel@lists.xenproject.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 16/21] drm/vgem: Introduce GEM object functions
Date:   Tue, 15 Sep 2020 16:59:53 +0200
Message-Id: <20200915145958.19993-17-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in vgem. The only exception is gem_prime_mmap,
which is non-trivial to convert.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/vgem/vgem_drv.c | 21 ++++++++++++++-------
 1 file changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vgem/vgem_drv.c b/drivers/gpu/drm/vgem/vgem_drv.c
index cb884c890065..fa54a6d1403d 100644
--- a/drivers/gpu/drm/vgem/vgem_drv.c
+++ b/drivers/gpu/drm/vgem/vgem_drv.c
@@ -50,6 +50,8 @@
 #define DRIVER_MAJOR	1
 #define DRIVER_MINOR	0
 
+static const struct drm_gem_object_funcs vgem_gem_object_funcs;
+
 static struct vgem_device {
 	struct drm_device drm;
 	struct platform_device *platform;
@@ -167,6 +169,8 @@ static struct drm_vgem_gem_object *__vgem_gem_create(struct drm_device *dev,
 	if (!obj)
 		return ERR_PTR(-ENOMEM);
 
+	obj->base.funcs = &vgem_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &obj->base, roundup(size, PAGE_SIZE));
 	if (ret) {
 		kfree(obj);
@@ -401,12 +405,20 @@ static int vgem_prime_mmap(struct drm_gem_object *obj,
 	return 0;
 }
 
+static const struct drm_gem_object_funcs vgem_gem_object_funcs = {
+	.free = vgem_gem_free_object,
+	.pin = vgem_prime_pin,
+	.unpin = vgem_prime_unpin,
+	.get_sg_table = vgem_prime_get_sg_table,
+	.vmap = vgem_prime_vmap,
+	.vunmap = vgem_prime_vunmap,
+	.vm_ops = &vgem_gem_vm_ops,
+};
+
 static struct drm_driver vgem_driver = {
 	.driver_features		= DRIVER_GEM | DRIVER_RENDER,
 	.open				= vgem_open,
 	.postclose			= vgem_postclose,
-	.gem_free_object_unlocked	= vgem_gem_free_object,
-	.gem_vm_ops			= &vgem_gem_vm_ops,
 	.ioctls				= vgem_ioctls,
 	.num_ioctls 			= ARRAY_SIZE(vgem_ioctls),
 	.fops				= &vgem_driver_fops,
@@ -415,13 +427,8 @@ static struct drm_driver vgem_driver = {
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_pin = vgem_prime_pin,
-	.gem_prime_unpin = vgem_prime_unpin,
 	.gem_prime_import = vgem_prime_import,
 	.gem_prime_import_sg_table = vgem_prime_import_sg_table,
-	.gem_prime_get_sg_table = vgem_prime_get_sg_table,
-	.gem_prime_vmap = vgem_prime_vmap,
-	.gem_prime_vunmap = vgem_prime_vunmap,
 	.gem_prime_mmap = vgem_prime_mmap,
 
 	.name	= DRIVER_NAME,
-- 
2.28.0

