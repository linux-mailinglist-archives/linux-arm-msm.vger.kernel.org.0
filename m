Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 36ABD7B0E0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Sep 2023 23:31:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229957AbjI0Vbr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Sep 2023 17:31:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229460AbjI0Vbp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Sep 2023 17:31:45 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5225E121;
        Wed, 27 Sep 2023 14:31:44 -0700 (PDT)
Received: from localhost.localdomain (unknown [IPv6:2a02:8010:65b5:0:1ac0:4dff:feee:236a])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: alarumbe)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id EAC84660730F;
        Wed, 27 Sep 2023 22:31:42 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1695850303;
        bh=mvhqb0CR6dg+aT5ABbf9mgbY6p04NC3vkFwd67Q25UM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=n/WJOOWYA0jMTcEte7L0DvoL4Bx+GIHlQlk9KBfyfwV3YByqyYaBaMdJtO9oIBwDZ
         PcUO77y+bkA7Sojp7KAB+GytNVAgeCuq/m5v6eoCDgAmqEtdd+Cp41XIVvLO2WPMe1
         3pBG8npwG2oq0yMitIYWSJ8uY9Uw0bNoIbb7zgFIX4LnsboxD+xIEFwc3TWfO/pbRM
         +RxQu46BYqHdUhQVu/DrFj+K5tkE+mWxc/KENCpxQQ9ln1uX75xGEWq/lma26pCTpE
         G50AmEUQ2Svu8JGrzKD7JB1LCGANS4wD9i8WOZq8Mr+T6k6ByDyNjlFW5VCLJI4arV
         pXlwoAtwKFfcg==
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
        boris.brezillon@collabora.com
Subject: [PATCH v7 3/5] drm/panfrost: Add fdinfo support for memory stats
Date:   Wed, 27 Sep 2023 22:29:57 +0100
Message-ID: <20230927213133.1651169-4-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
References: <20230927213133.1651169-1-adrian.larumbe@collabora.com>
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

A new DRM GEM object function is added so that drm_show_memory_stats can
provide more accurate memory usage numbers.

Ideally, in panfrost_gem_status, the BO's purgeable flag would be checked
after locking the driver's shrinker mutex, but drm_show_memory_stats takes
over the drm file's object handle database spinlock, so there's potential
for a race condition here.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Steven Price <steven.price@arm.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c |  2 ++
 drivers/gpu/drm/panfrost/panfrost_gem.c | 14 ++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 97e5bc4a82c8..b834777b409b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -568,6 +568,8 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 	struct panfrost_device *pfdev = dev->dev_private;
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
+
+	drm_show_memory_stats(p, file);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 3c812fbd126f..7d8f83d20539 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -195,6 +195,19 @@ static int panfrost_gem_pin(struct drm_gem_object *obj)
 	return drm_gem_shmem_pin(&bo->base);
 }
 
+static enum drm_gem_object_status panfrost_gem_status(struct drm_gem_object *obj)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	enum drm_gem_object_status res = 0;
+
+	res |= (bo->base.madv == PANFROST_MADV_DONTNEED) ?
+		DRM_GEM_OBJECT_PURGEABLE : 0;
+
+	res |= (bo->base.pages) ? DRM_GEM_OBJECT_RESIDENT : 0;
+
+	return res;
+}
+
 static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.free = panfrost_gem_free_object,
 	.open = panfrost_gem_open,
@@ -206,6 +219,7 @@ static const struct drm_gem_object_funcs panfrost_gem_funcs = {
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
 	.mmap = drm_gem_shmem_object_mmap,
+	.status = panfrost_gem_status,
 	.vm_ops = &drm_gem_shmem_vm_ops,
 };
 
-- 
2.42.0

