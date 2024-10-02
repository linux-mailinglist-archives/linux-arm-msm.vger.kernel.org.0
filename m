Return-Path: <linux-arm-msm+bounces-32979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D4398E75B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Oct 2024 01:48:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 224BA289071
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 23:48:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 858991A3035;
	Wed,  2 Oct 2024 23:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="hdhYLvL/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A37519F129;
	Wed,  2 Oct 2024 23:46:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727912786; cv=pass; b=HlERMXBZOTcsmvqRvY8BkB27/HU/EnlOcIEx4hjmcLMdkSf3J9cq88V+l1P0haPrkLzawvdLsxXwLa2MOYQOOv2ZyGs9iWR4YVrGzG15jxI4NJOYw/cZk9vyDeEfQOxbwlQr+sbWgFVzZHbzGIaF3yYx7nXEXL/BppWfNDMVHvM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727912786; c=relaxed/simple;
	bh=oQ73Gl0FblUbJqDDUpRonGIcmqbTMvqre67w4p3n9+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EY11lzi+RCB8SihrH8TMTTi+uBwYfjuXO6YEUTllOx94ZjoPFcdspdIuNJNlXpsPF/GPJbiQ8ZLFPCjFq26FoHITu9++4ai5efP847VRS3Pdg4QIpsLBiLJhOuc6N3UFaDtP3w+2R7PC/aRGlWUOLEMcWjrCrHE1+EEgUSRd6iU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b=hdhYLvL/; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
ARC-Seal: i=1; a=rsa-sha256; t=1727912750; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QW7uOEu2Ngozn+gCQP9lb3TdN4IG8xziOC8ewQskeaYCexSQE57wV+n94Bmd5Sito+pd793Pcx0OEPD87vub32afF2zO8CEdUgXoN+yMQk0FEHxC7d2phU8LR16TMvBfvgB5E/RMcCebIYQ3h0rA2a1cCoZrUqWvsVsbW4F0coo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1727912750; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rnCSdPA9noAf1MwrwrdWgiQdnLTBwt+Uz5uYZGwJsAk=; 
	b=muRZo0HqQKBRC8CZBFUTrPp2FD+wmrGQQh47/a+YHuZcUX3XVH8E6oO/pOtfJXlRMhxdcIthtuM5pW2uME0W8GJ6QkLFnpOiKwN1qOFBlBZcoaSTGAUZxvoX6rQAD7rTQf7IIw+Pvi/jw6toZutfXmOaDDO+dGe5ob6M5FxBJBk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
	dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1727912750;
	s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=rnCSdPA9noAf1MwrwrdWgiQdnLTBwt+Uz5uYZGwJsAk=;
	b=hdhYLvL/fNpth6Ry3lMqvrV3f0ZjMa3OHcLzRc+8qnA0sBk3VA4MwWu0iCdoQWpm
	NdGHSRPOi5ZC1MvonihDdrtNaDdY8mc1Ya757CmotW1BKXWalC4d1Ipo7BvGPlbqngo
	l383D63/aFT252b+UHtyGeaxTT0+uYduTRzmlKw8=
Received: by mx.zohomail.com with SMTPS id 1727912748523485.3723854659286;
	Wed, 2 Oct 2024 16:45:48 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Melissa Wen <mwen@igalia.com>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Cc: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
	Tvrtko Ursulin <tursulin@ursulin.net>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org
Subject: [RFC PATCH 1/2] drm/drm_file: Add display of driver's internal memory size
Date: Thu,  3 Oct 2024 00:45:10 +0100
Message-ID: <20241002234531.3113431-2-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
References: <20241002234531.3113431-1-adrian.larumbe@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some drivers must allocate a considerable amount of memory for bookkeeping
structures and GPU's MCU-kernel shared communication regions. These are
often created as a result of the invocation of the driver's ioctl()
interface functions, so it is sensible to consider them as being owned by
the render context associated with an open drm file.

However, at the moment drm_show_memory_stats only traverses the UM-exposed
drm objects for which a handle exists. Private driver objects and memory
regions, though connected to a render context, are unaccounted for in their
fdinfo numbers.

Add a new drm_memory_stats 'internal' memory category.

Because deciding what constitutes an 'internal' object and where to find
these are driver-dependent, calculation of this size must be done through a
driver-provided function pointer, which becomes the third argument of
drm_show_memory_stats. Drivers which have no interest in exposing the size
of internal memory objects can keep passing NULL for unaltered behaviour.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/drm_file.c              | 6 +++++-
 drivers/gpu/drm/msm/msm_drv.c           | 2 +-
 drivers/gpu/drm/panfrost/panfrost_drv.c | 2 +-
 drivers/gpu/drm/v3d/v3d_drv.c           | 2 +-
 include/drm/drm_file.h                  | 7 ++++++-
 5 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
index ad1dc638c83b..937471339c9a 100644
--- a/drivers/gpu/drm/drm_file.c
+++ b/drivers/gpu/drm/drm_file.c
@@ -856,6 +856,7 @@ void drm_print_memory_stats(struct drm_printer *p,
 	print_size(p, "total", region, stats->private + stats->shared);
 	print_size(p, "shared", region, stats->shared);
 	print_size(p, "active", region, stats->active);
+	print_size(p, "internal", region, stats->internal);
 
 	if (supported_status & DRM_GEM_OBJECT_RESIDENT)
 		print_size(p, "resident", region, stats->resident);
@@ -873,7 +874,7 @@ EXPORT_SYMBOL(drm_print_memory_stats);
  * Helper to iterate over GEM objects with a handle allocated in the specified
  * file.
  */
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func)
 {
 	struct drm_gem_object *obj;
 	struct drm_memory_stats status = {};
@@ -919,6 +920,9 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
 	}
 	spin_unlock(&file->table_lock);
 
+	if (func)
+		func(&status, file);
+
 	drm_print_memory_stats(p, &status, supported_status, "memory");
 }
 EXPORT_SYMBOL(drm_show_memory_stats);
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index edbc1ab0fbc8..2b3feb79afc4 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -880,7 +880,7 @@ static void msm_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	msm_gpu_show_fdinfo(priv->gpu, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, NULL);
 }
 
 static const struct file_operations fops = {
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 04d615df5259..aaa8602bf00d 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -609,7 +609,7 @@ static void panfrost_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 
 	panfrost_gpu_show_fdinfo(pfdev, file->driver_priv, p);
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, NULL);
 }
 
 static const struct file_operations panfrost_drm_driver_fops = {
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index fb35c5c3f1a7..314e77c67972 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -195,7 +195,7 @@ static void v3d_show_fdinfo(struct drm_printer *p, struct drm_file *file)
 			   v3d_queue_to_string(queue), jobs_completed);
 	}
 
-	drm_show_memory_stats(p, file);
+	drm_show_memory_stats(p, file, NULL);
 }
 
 static const struct file_operations v3d_drm_fops = {
diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
index 8c0030c77308..661d00d5350e 100644
--- a/include/drm/drm_file.h
+++ b/include/drm/drm_file.h
@@ -469,6 +469,7 @@ void drm_send_event_timestamp_locked(struct drm_device *dev,
  * @resident: Total size of GEM objects backing pages
  * @purgeable: Total size of GEM objects that can be purged (resident and not active)
  * @active: Total size of GEM objects active on one or more engines
+ * @internal: Total size of GEM objects that aren't exposed to user space
  *
  * Used by drm_print_memory_stats()
  */
@@ -478,16 +479,20 @@ struct drm_memory_stats {
 	u64 resident;
 	u64 purgeable;
 	u64 active;
+	u64 internal;
 };
 
 enum drm_gem_object_status;
 
+typedef void (*internal_bos)(struct drm_memory_stats *status,
+			     struct drm_file *file);
+
 void drm_print_memory_stats(struct drm_printer *p,
 			    const struct drm_memory_stats *stats,
 			    enum drm_gem_object_status supported_status,
 			    const char *region);
 
-void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file);
+void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file, internal_bos func);
 void drm_show_fdinfo(struct seq_file *m, struct file *f);
 
 struct file *mock_drm_getfile(struct drm_minor *minor, unsigned int flags);
-- 
2.46.2


