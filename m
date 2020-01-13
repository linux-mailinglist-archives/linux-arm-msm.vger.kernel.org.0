Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 632271394F4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 16:37:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727331AbgAMPhu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 10:37:50 -0500
Received: from mail-yw1-f99.google.com ([209.85.161.99]:46391 "EHLO
        mail-yw1-f99.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgAMPht (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 10:37:49 -0500
Received: by mail-yw1-f99.google.com with SMTP id u139so6316681ywf.13
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Jan 2020 07:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brkho-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=loDIHBoPYn2n1QOh85N5e2eDCf5hlfrUH2iJe1lXbAU=;
        b=JzTeFNQlIcxcKxsUt4WBb8hrFA5YPZaFijIKGvuDSFMwdwDHmqP+1UYQ5if0ikCuvU
         4KRRfiPXa766MYXZHZoy/FtEVZPfN6Zv/8AKhQ1CW8T7a6GXHxBU9P7XQy6tEJ4hv7mU
         crp2IwkesyxUt7jPDuVUbQvk4Hvh+Fzy0I4b/h3zaVlsfKwmdvZu2Lrdgo1FYocJanIa
         I/r1ukjZxsfTOxX6t6c5FfANAfYcw/ww5qn0rvkLa+SK+RFms70oogsnmTiLnbjdwX4x
         LkQbRq5Em1icHZ6PeY5Yzqzj4Kac72h9zRIafr2DqPBXnQDcJ/T1WVd+xaQVZ4PqWcjd
         BQNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=loDIHBoPYn2n1QOh85N5e2eDCf5hlfrUH2iJe1lXbAU=;
        b=iSTfiCTlFXfRyKwS5/TpJgBwuBqDajF5yK+trPGaS3+ZQp5ycPd+EXsPIeIEh3zJLS
         IGuehRgulCOmZ49XMjCFNrzW4TLBBCBCCuYwK5izNaqGWLV9WJg3ii7ai8wYRaykt9kM
         RhaxYHPuH5itm9sCd6yiuXJSio8jtijc0Jx7Y3W5EQ2Hp8Z/vMxCoLk3pkSF+po7wNdL
         faalKyNiOeKInH+vqDRU5WIKnBu9rjmU1sJ8O28hHd7L773SrKINawsz1GfqtyVJxOVQ
         vxSOgcNwxglMwnJ2UNWaCtCTWDDLSrO7ubjX2oxvibjyUbYO+mGJKFUdPHf6bTJcpl6d
         N9iw==
X-Gm-Message-State: APjAAAXQ4IwgoyAGJYfET8KFuq0WfIgS11zrmjIZ+x4nnx8MyXukNQSO
        n9lPZKi4T+KqVagQmU7nSak1/cuZdpCZoXzmO7FftyZ+82uvwA==
X-Google-Smtp-Source: APXvYqzMjmiQB7wQayg8gcOf8UiLu0z7+b2h25Mhv2JtXmHzedOaKlIp6R+p2rKcfYiuvs/alD7Snejg9ij7
X-Received: by 2002:a25:3883:: with SMTP id f125mr14312395yba.271.1578929868538;
        Mon, 13 Jan 2020 07:37:48 -0800 (PST)
Received: from hob1.nyc.corp.google.com ([100.118.32.120])
        by smtp-relay.gmail.com with ESMTPS id m193sm1672393ywd.0.2020.01.13.07.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jan 2020 07:37:48 -0800 (PST)
X-Relaying-Domain: brkho.com
From:   Brian Ho <brian@brkho.com>
To:     freedreno@lists.freedesktop.org
Cc:     hoegsberg@chromium.org, robdclark@chromium.org,
        Brian Ho <brian@brkho.com>, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 2/2] drm/msm: Add MSM_WAIT_IOVA ioctl
Date:   Mon, 13 Jan 2020 10:36:05 -0500
Message-Id: <20200113153605.52350-3-brian@brkho.com>
X-Mailer: git-send-email 2.25.0.rc1.283.g88dfdc4193-goog
In-Reply-To: <20200113153605.52350-1-brian@brkho.com>
References: <20200113153605.52350-1-brian@brkho.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Implements an ioctl to wait until a value at a given iova is greater
than or equal to a supplied value.

This will initially be used by turnip (open-source Vulkan driver for
QC in mesa) for occlusion queries where the userspace driver can
block on a query becoming available before continuing via
vkGetQueryPoolResults.

Signed-off-by: Brian Ho <brian@brkho.com>
---
 drivers/gpu/drm/msm/msm_drv.c | 63 +++++++++++++++++++++++++++++++++--
 include/uapi/drm/msm_drm.h    | 13 ++++++++
 2 files changed, 74 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index c84f0a8b3f2c..dcc46874a5a2 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -36,10 +36,11 @@
  *           MSM_GEM_INFO ioctl.
  * - 1.4.0 - softpin, MSM_RELOC_BO_DUMP, and GEM_INFO support to set/get
  *           GEM object's debug name
- * - 1.5.0 - Add SUBMITQUERY_QUERY ioctl
+ * - 1.5.0 - Add SUBMITQUEUE_QUERY ioctl
+ * - 1.6.0 - Add WAIT_IOVA ioctl
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	5
+#define MSM_VERSION_MINOR	6
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
@@ -952,6 +953,63 @@ static int msm_ioctl_submitqueue_close(struct drm_device *dev, void *data,
 	return msm_submitqueue_remove(file->driver_priv, id);
 }
 
+static int msm_ioctl_wait_iova(struct drm_device *dev, void *data,
+		struct drm_file *file)
+{
+	struct msm_drm_private *priv = dev->dev_private;
+	struct drm_gem_object *obj;
+	struct drm_msm_wait_iova *args = data;
+	ktime_t timeout = to_ktime(args->timeout);
+	unsigned long remaining_jiffies = timeout_to_jiffies(&timeout);
+	struct msm_gpu *gpu = priv->gpu;
+	void *base_vaddr;
+	uint64_t *vaddr;
+	int ret;
+
+	if (args->pad)
+		return -EINVAL;
+
+	if (!gpu)
+		return 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	base_vaddr = msm_gem_get_vaddr(obj);
+	if (IS_ERR(base_vaddr)) {
+		ret = PTR_ERR(base_vaddr);
+		goto err_put_gem_object;
+	}
+	if (args->offset + sizeof(*vaddr) > obj->size) {
+		ret = -EINVAL;
+		goto err_put_vaddr;
+	}
+
+	vaddr = base_vaddr + args->offset;
+
+	/* Assumes WC mapping */
+	ret = wait_event_interruptible_timeout(
+			gpu->event, *vaddr >= args->value, remaining_jiffies);
+
+	if (ret == 0) {
+		ret = -ETIMEDOUT;
+		goto err_put_vaddr;
+	} else if (ret == -ERESTARTSYS) {
+		goto err_put_vaddr;
+	}
+
+	msm_gem_put_vaddr(obj);
+	drm_gem_object_put_unlocked(obj);
+	return 0;
+
+err_put_vaddr:
+	msm_gem_put_vaddr(obj);
+err_put_gem_object:
+	drm_gem_object_put_unlocked(obj);
+	return ret;
+}
+
 static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_GET_PARAM,    msm_ioctl_get_param,    DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_GEM_NEW,      msm_ioctl_gem_new,      DRM_RENDER_ALLOW),
@@ -964,6 +1022,7 @@ static const struct drm_ioctl_desc msm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_NEW,   msm_ioctl_submitqueue_new,   DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_CLOSE, msm_ioctl_submitqueue_close, DRM_RENDER_ALLOW),
 	DRM_IOCTL_DEF_DRV(MSM_SUBMITQUEUE_QUERY, msm_ioctl_submitqueue_query, DRM_RENDER_ALLOW),
+	DRM_IOCTL_DEF_DRV(MSM_WAIT_IOVA, msm_ioctl_wait_iova, DRM_RENDER_ALLOW),
 };
 
 static const struct vm_operations_struct vm_ops = {
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index 0b85ed6a3710..8477f28a4ee1 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -298,6 +298,17 @@ struct drm_msm_submitqueue_query {
 	__u32 pad;
 };
 
+/* This ioctl blocks until the u64 value at bo + offset is greater than or
+ * equal to the reference value.
+ */
+struct drm_msm_wait_iova {
+	__u32 handle;          /* in, GEM handle */
+	__u32 pad;
+	struct drm_msm_timespec timeout;   /* in */
+	__u64 offset;          /* offset into bo */
+	__u64 value;           /* reference value */
+};
+
 #define DRM_MSM_GET_PARAM              0x00
 /* placeholder:
 #define DRM_MSM_SET_PARAM              0x01
@@ -315,6 +326,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_MSM_SUBMITQUEUE_NEW        0x0A
 #define DRM_MSM_SUBMITQUEUE_CLOSE      0x0B
 #define DRM_MSM_SUBMITQUEUE_QUERY      0x0C
+#define DRM_MSM_WAIT_IOVA      0x0D
 
 #define DRM_IOCTL_MSM_GET_PARAM        DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GET_PARAM, struct drm_msm_param)
 #define DRM_IOCTL_MSM_GEM_NEW          DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_GEM_NEW, struct drm_msm_gem_new)
@@ -327,6 +339,7 @@ struct drm_msm_submitqueue_query {
 #define DRM_IOCTL_MSM_SUBMITQUEUE_NEW    DRM_IOWR(DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_NEW, struct drm_msm_submitqueue)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_CLOSE  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_CLOSE, __u32)
 #define DRM_IOCTL_MSM_SUBMITQUEUE_QUERY  DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_SUBMITQUEUE_QUERY, struct drm_msm_submitqueue_query)
+#define DRM_IOCTL_MSM_WAIT_IOVA        DRM_IOW (DRM_COMMAND_BASE + DRM_MSM_WAIT_IOVA, struct drm_msm_wait_iova)
 
 #if defined(__cplusplus)
 }
-- 
2.25.0.rc1.283.g88dfdc4193-goog

