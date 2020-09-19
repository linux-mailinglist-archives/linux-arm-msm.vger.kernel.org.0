Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1B475271051
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 21:36:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726668AbgISTgr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 15:36:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726684AbgISTgn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 15:36:43 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 407D5C0613CE;
        Sat, 19 Sep 2020 12:36:43 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id k133so781037pgc.7;
        Sat, 19 Sep 2020 12:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cz3MnrW/mJzyctlymUyWoTIJkRv3ezzf3mEZP0SmMCc=;
        b=bWddSScf1bWFPRhW6WecOQmNRxQaBf06VKxgQbFRmOH2Gcxc3JH8SijbEnA/bg6AtR
         yN65G1n4Aa2Kq1xbXOMae8JrslAkaTloea8e1WNE06FnlVCQOny/MfVTJecquEEhUR5l
         35xy82QxVRXD8KDrVGX1yu43ioP/U4PnoEQqkHcy5XdAGDJ/vLOf5bssCZsSI33KgWAd
         Q5orqzjeDiFHHiNbN1cgS5AhUqlfFLc1Bi2OTfwK6HoxKvnudJ6BZcfqCvRA641o/h/E
         NvSclidqFfGSlHzzTtOK0QnmoDJXR2LOPkti7B6R631rdW1SzJqAz0Hig3A2zWnh3AfX
         vxbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cz3MnrW/mJzyctlymUyWoTIJkRv3ezzf3mEZP0SmMCc=;
        b=uMVbgnuGzlPirrNq54fnUoMxi99wCk5pH9oWlHRLXMGIxLt0Xee4U8lZ/BELXp8k/h
         lEi6ttiWDILwkHrh08n8RgopH+9utWEevyq2xon+O1UAzyHUdEhVyBeFS5iBH48AzXaT
         tBGOSTzURRXt2rA43OuxX7eG12P+bw+xE6mq2KyUcJOO+SYXRYm9WNxJb+207DxsLoAc
         yuqdhkT+tkXWRvYMLF8a8aYbA3aQbK3JskqKuD49G+hfahiSnKnwJpjNVax88auHH7FH
         Et74kRe154/S55YtPjcaqmkFAoaCzr0y9dRur6Qey3vrVtMUlCqwA8SnhzC+5PShRr6f
         YFDA==
X-Gm-Message-State: AOAM5324NrJR85ojVPSajqb0i9tOxf2bJZElhESliI8DkNlN8IBwjOgC
        1ixJzCeaAko5gfovfVWJlfs=
X-Google-Smtp-Source: ABdhPJw+vtacEen6pTi/AqQnzZ6gWSrh4XqeDmeglhq9agdea9OvtcIoe+1yvJ4aeIw0n1414ksGOg==
X-Received: by 2002:a65:4c08:: with SMTP id u8mr32482992pgq.340.1600544202772;
        Sat, 19 Sep 2020 12:36:42 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id i8sm6312553pjv.43.2020.09.19.12.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:36:41 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/3] drm: Add a client-cap to set scheduling mode
Date:   Sat, 19 Sep 2020 12:37:26 -0700
Message-Id: <20200919193727.2093945-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200919193727.2093945-1-robdclark@gmail.com>
References: <20200919193727.2093945-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Add DRM_CLIENT_CAP_SCHED_MODE so that userspace can control the
scheduling mode for nonblocking atomic commits.  Userspace such as
android, which treats the display pipeline as realtime (SCHED_FIFO)
should set DRM_CLIENT_CAP_SCHED_FIFO to prevent userspace components
of the display pipeline (like surfaceflinger) from preempting atomic
commit_work.

This cap may only be set by the drm master, after setting the
DRM_CLIENT_CAP_ATOMIC cap.  The scheduling mode is returned to default
(SCHED_NORMAL) after master is dropped.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_auth.c  |  4 ++++
 drivers/gpu/drm/drm_crtc.c  | 26 ++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c | 13 +++++++++++++
 include/drm/drm_crtc.h      |  2 ++
 include/uapi/drm/drm.h      | 13 +++++++++++++
 5 files changed, 58 insertions(+)

diff --git a/drivers/gpu/drm/drm_auth.c b/drivers/gpu/drm/drm_auth.c
index f2d46b7ac6f9..217f422389f9 100644
--- a/drivers/gpu/drm/drm_auth.c
+++ b/drivers/gpu/drm/drm_auth.c
@@ -31,6 +31,7 @@
 #include <linux/slab.h>
 
 #include <drm/drm_auth.h>
+#include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
 #include <drm/drm_lease.h>
@@ -335,6 +336,9 @@ void drm_master_release(struct drm_file *file_priv)
 		drm_lease_revoke(master);
 	}
 
+	if (drm_core_check_feature(dev, DRIVER_ATOMIC) && file_priv->is_master)
+		drm_crtc_set_sched_mode(dev, DRM_CLIENT_CAP_SCHED_NORMAL);
+
 	/* drop the master reference held by the file priv */
 	if (file_priv->master)
 		drm_master_put(&file_priv->master);
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 4f7c0bfce0a3..02f2be0b1700 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -93,6 +93,32 @@ struct drm_crtc *drm_crtc_from_index(struct drm_device *dev, int idx)
 }
 EXPORT_SYMBOL(drm_crtc_from_index);
 
+/**
+ * drm_crtc_set_sched_mode:
+ * @dev: DRM device
+ * @mode: one of DRM_CLIENT_CAP_SCHED_x
+ *
+ * Set the scheduling mode for per-CRTC kthread workers.  This controls
+ * whether nonblocking atomic commits will run with SCHED_NORMAL or
+ * SCHED_FIFO (rt) priority.
+ */
+void drm_crtc_set_sched_mode(struct drm_device *dev, int mode)
+{
+	struct drm_crtc *crtc;
+
+	drm_for_each_crtc(crtc, dev) {
+		switch (mode) {
+		case DRM_CLIENT_CAP_SCHED_NORMAL:
+			/* zero is default nice value for kthreads: */
+			sched_set_normal(crtc->worker->task, 0);
+			break;
+		case DRM_CLIENT_CAP_SCHED_FIFO:
+			sched_set_fifo(crtc->worker->task);
+			break;
+		}
+	}
+}
+
 int drm_crtc_force_disable(struct drm_crtc *crtc)
 {
 	struct drm_mode_set set = {
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 789ee65ac1f5..44920621571c 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -362,6 +362,19 @@ drm_setclientcap(struct drm_device *dev, void *data, struct drm_file *file_priv)
 			return -EINVAL;
 		file_priv->writeback_connectors = req->value;
 		break;
+	case DRM_CLIENT_CAP_SCHED_MODE:
+		if (!file_priv->is_master)
+			return -EPERM;
+		if (!file_priv->atomic)
+			return -EOPNOTSUPP;
+		switch (req->value) {
+		case DRM_CLIENT_CAP_SCHED_NORMAL:
+		case DRM_CLIENT_CAP_SCHED_FIFO:
+			drm_crtc_set_sched_mode(dev, req->value);
+			return 0;
+		default:
+			return -EINVAL;
+		}
 	default:
 		return -EINVAL;
 	}
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 8964a3732bca..6dd4d01b7191 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -1245,6 +1245,8 @@ static inline uint32_t drm_crtc_mask(const struct drm_crtc *crtc)
 int drm_mode_set_config_internal(struct drm_mode_set *set);
 struct drm_crtc *drm_crtc_from_index(struct drm_device *dev, int idx);
 
+void drm_crtc_set_sched_mode(struct drm_device *dev, int mode);
+
 /**
  * drm_crtc_find - look up a CRTC object from its ID
  * @dev: DRM device
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 808b48a93330..989e007ef608 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -698,6 +698,19 @@ struct drm_get_cap {
  */
 #define DRM_CLIENT_CAP_WRITEBACK_CONNECTORS	5
 
+/**
+ * DRM_CLIENT_CAP_SCHED_MODE
+ *
+ * Allow userspace to control the scheduling parameters for nonblocking
+ * commit.  The default is SCHED_NORMAL/CFS.  Userspace using SCHED_FIFO
+ * in the rendering/display pipeline should use DRM_CLIENT_CAP_SCHED_FIFO
+ * to prevent userspace portions of the display pipeline from preempting
+ * nonblocking commit_work.
+ */
+#define DRM_CLIENT_CAP_SCHED_MODE     6
+#  define DRM_CLIENT_CAP_SCHED_NORMAL 0
+#  define DRM_CLIENT_CAP_SCHED_FIFO   1
+
 /** DRM_IOCTL_SET_CLIENT_CAP ioctl argument type */
 struct drm_set_client_cap {
 	__u64 capability;
-- 
2.26.2

