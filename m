Return-Path: <linux-arm-msm+bounces-103897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qI8WAps552no5QEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-103897-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:47:23 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 57AB043859C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 10:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id EAC243011586
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2026 08:47:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DB012DC783;
	Tue, 21 Apr 2026 08:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="oRVUc6Ag"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9F7386C08;
	Tue, 21 Apr 2026 08:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776761239; cv=none; b=ExrswfNrT8Y4D85xtwbYIU96qOX9cS4kTIzoeNtxzoeJFFmPCxXXomToxfVE2xeAQo0i7RkxopcgJxodOKY1OX5VHdmErged72r4TISKzwKYTDH64l43Hw+AjJ5Tmbprqd6Z2lefrI9zAMKvOuBcrKv4mO1fdLjUH93wdOIJ0fI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776761239; c=relaxed/simple;
	bh=34lHlm6042teYF9Tjdkaw0RBPEb0m8BWxtxXJb5KbFI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hrmn0EFX4dpPr5QGKrPYipeYMqr2Tc2NEmUhd8sCqZq2+SvcUhupIfANHFR8Q9EETeFZPKo19nS5gWDFi5IxGKmmQqkWn6VfJdM0P7z2RPjtOMk8XjbTNKsx4+EwKLCtTp4uJwVU2UaZgO0lMcHmLLt1XYLGQQ4O2MDmnSgs4nw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=oRVUc6Ag; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776761229;
	bh=34lHlm6042teYF9Tjdkaw0RBPEb0m8BWxtxXJb5KbFI=;
	h=From:To:Cc:Subject:Date:From;
	b=oRVUc6AgYeYqD6tGULwJ4z4eqrztHJF++HoYRCKiSCe233lHMLucO9I45TmUvTYOC
	 JEBtp6nBBJG3XTxn+YCVUzB/Dl6UiFViss7JOvPwOM8Q/6Ka5z2hXDAxTKH12S6SDq
	 Fxdz5o62xJl8gyyQia/Jk/aWv47wHUOIiSAL8VqTnQwkI+Cjp3v+uu2wRMIjQQbzy4
	 PdNQoNKdDJ4almA5x7ztLhjHadqz1ONLeqgIKNSDzVgKEH+miKpLtiNsL+nF/D4A1n
	 4VkDWo/RdLm1KStAqmSUIlWPsfb2A7PNT810KKQq0WWtgC0/F29nUX0N6LLDB4A85m
	 vGirGu97UdBCw==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B13FD17E13DE;
	Tue, 21 Apr 2026 10:47:08 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: dakr@kernel.org,
	boris.brezillon@collabora.com,
	steven.price@arm.com,
	liviu.dudau@arm.com,
	matthew.brost@intel.com,
	thomas.hellstrom@linux.intel.com,
	rodrigo.vivi@intel.com
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org,
	nouveau@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH] drm: Remove DRIVER_GEM_GPUVA feature flag
Date: Tue, 21 Apr 2026 10:47:01 +0200
Message-Id: <20260421084701.24227-1-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-0.66 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=mail];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-103897-lists,linux-arm-msm=lfdr.de];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[laura.nao@collabora.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[collabora.com:email,collabora.com:dkim,collabora.com:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 57AB043859C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The DRIVER_GEM_GPUVA feature flag is currently only used to control two
behaviors within the DRM core:
- calling  drm_gem_gpuva_init() during
  GEM object initialization
- creating the "gpuvas" debugfs entry

drm_gem_gpuva_init() is a plain INIT_LIST_HEAD() and therefore is cheap
to run for every GEM object. The DRM_DEBUGFS_GPUVA_INFO macro is only
referenced by GPU-VA capable drivers, so clearing the feature bit does
not cause any unrelated drivers to get the "gpuvas" debugfs node. The
flag doesn't have any relevant purpose (e.g. gating ioctl handlers or MM
logic) and doesn't provide any practical benefit.

Remove the flag definition and drop it from all drivers that use it,
call drm_gem_gpuva_init() unconditionally and clear the driver features
bit in DRM_DEBUGFS_GPUVA_INFO.

Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/gpu/drm/drm_gem.c             | 3 +--
 drivers/gpu/drm/imagination/pvr_drv.c | 2 +-
 drivers/gpu/drm/msm/msm_drv.c         | 2 --
 drivers/gpu/drm/nouveau/nouveau_drm.c | 1 -
 drivers/gpu/drm/panthor/panthor_drv.c | 2 +-
 drivers/gpu/drm/xe/xe_device.c        | 2 +-
 include/drm/drm_debugfs.h             | 2 +-
 include/drm/drm_drv.h                 | 6 ------
 include/drm/drm_gem.h                 | 3 ---
 9 files changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 0377a5fd402d..cb703d0072aa 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -232,8 +232,7 @@ void drm_gem_private_object_init(struct drm_device *dev,
 	if (!obj->resv)
 		obj->resv = &obj->_resv;
 
-	if (drm_core_check_feature(dev, DRIVER_GEM_GPUVA))
-		drm_gem_gpuva_init(obj);
+	drm_gem_gpuva_init(obj);
 
 	drm_vma_node_reset(&obj->vma_node);
 	INIT_LIST_HEAD(&obj->lru_node);
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index 268900464ab6..80033d4cb66a 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1375,7 +1375,7 @@ pvr_drm_driver_postclose(__always_unused struct drm_device *drm_dev,
 DEFINE_DRM_GEM_FOPS(pvr_drm_driver_fops);
 
 static struct drm_driver pvr_drm_driver = {
-	.driver_features = DRIVER_GEM | DRIVER_GEM_GPUVA | DRIVER_RENDER |
+	.driver_features = DRIVER_GEM | DRIVER_RENDER |
 			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE,
 	.open = pvr_drm_driver_open,
 	.postclose = pvr_drm_driver_postclose,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 195f40e331e5..ee38c18715f0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -825,7 +825,6 @@ static const struct file_operations fops = {
 
 #define DRIVER_FEATURES_GPU ( \
 		DRIVER_GEM | \
-		DRIVER_GEM_GPUVA | \
 		DRIVER_RENDER | \
 		DRIVER_SYNCOBJ | \
 		DRIVER_SYNCOBJ_TIMELINE | \
@@ -833,7 +832,6 @@ static const struct file_operations fops = {
 
 #define DRIVER_FEATURES_KMS ( \
 		DRIVER_GEM | \
-		DRIVER_GEM_GPUVA | \
 		DRIVER_ATOMIC | \
 		DRIVER_MODESET | \
 		0 )
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 5d8475e4895e..0f5f662e5429 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1364,7 +1364,6 @@ static struct drm_driver
 driver_stub = {
 	.driver_features = DRIVER_GEM |
 			   DRIVER_SYNCOBJ | DRIVER_SYNCOBJ_TIMELINE |
-			   DRIVER_GEM_GPUVA |
 			   DRIVER_MODESET |
 			   DRIVER_RENDER,
 	.open = nouveau_drm_open,
diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 87d27c3c1456..1a1d40a744db 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1805,7 +1805,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
-			   DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
+			   DRIVER_SYNCOBJ_TIMELINE,
 	.open = panthor_open,
 	.postclose = panthor_postclose,
 	.show_fdinfo = panthor_show_fdinfo,
diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
index ffea4a453c01..b3acc202df76 100644
--- a/drivers/gpu/drm/xe/xe_device.c
+++ b/drivers/gpu/drm/xe/xe_device.c
@@ -393,7 +393,7 @@ static struct drm_driver driver = {
 	.driver_features =
 	    DRIVER_GEM |
 	    DRIVER_RENDER | DRIVER_SYNCOBJ |
-	    DRIVER_SYNCOBJ_TIMELINE | DRIVER_GEM_GPUVA,
+	    DRIVER_SYNCOBJ_TIMELINE,
 	.open = xe_file_open,
 	.postclose = xe_file_close,
 
diff --git a/include/drm/drm_debugfs.h b/include/drm/drm_debugfs.h
index ea8cba94208a..eb93512b0f23 100644
--- a/include/drm/drm_debugfs.h
+++ b/include/drm/drm_debugfs.h
@@ -48,7 +48,7 @@
  * For each DRM GPU VA space drivers should call drm_debugfs_gpuva_info() from
  * their @show callback.
  */
-#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, DRIVER_GEM_GPUVA, data}
+#define DRM_DEBUGFS_GPUVA_INFO(show, data) {"gpuvas", show, 0, data}
 
 /**
  * struct drm_info_list - debugfs info list entry
diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
index 42fc085f986d..e09559495c5b 100644
--- a/include/drm/drm_drv.h
+++ b/include/drm/drm_drv.h
@@ -107,12 +107,6 @@ enum drm_driver_feature {
 	 * acceleration should be handled by two drivers that are connected using auxiliary bus.
 	 */
 	DRIVER_COMPUTE_ACCEL            = BIT(7),
-	/**
-	 * @DRIVER_GEM_GPUVA:
-	 *
-	 * Driver supports user defined GPU VA bindings for GEM objects.
-	 */
-	DRIVER_GEM_GPUVA		= BIT(8),
 	/**
 	 * @DRIVER_CURSOR_HOTSPOT:
 	 *
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 86f5846154f7..996aa418dce9 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -663,9 +663,6 @@ static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
  *
  * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
  *
- * Calling this function is only necessary for drivers intending to support the
- * &drm_driver_feature DRIVER_GEM_GPUVA.
- *
  * See also drm_gem_gpuva_set_lock().
  */
 static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
-- 
2.39.5


