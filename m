Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F93825CDE9
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:43:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgICWn7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:43:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:32425 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728134AbgICWn5 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:43:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1599173036; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=WoXv9Zsgk789NJBAdSJTnmFqXiO78spfaeGDz8fBVmo=; b=JY+9oAywOUvkAde7l4YqWaD0XWZLDGMQk0t0PGLWPbBEXZCm6jZpEz+MKIUNrddWLzqDfC80
 pDgzn8fWImK0zZ6bsHV/3/pSmMUb7dSJi1agDTG+pMvGu7T991bppNcKvEq9kZVKVl48/LbE
 SfedPdmMXVO8WzOeGFGCa9EqxL4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5f5171a29f3347551f8d3e0d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Sep 2020 22:43:46
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA73DC43391; Thu,  3 Sep 2020 22:43:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0553EC433C8;
        Thu,  3 Sep 2020 22:43:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0553EC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org, nganji@codeaurora.org,
        aravindh@codeaurora.org, tanmay@codeaurora.org,
        khsieh@codeaurora.org
Subject: [PATCH 1/4] drm/msm/dp: add debugfs support to DP driver
Date:   Thu,  3 Sep 2020 15:43:25 -0700
Message-Id: <20200903224328.26452-2-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200903224328.26452-1-abhinavk@codeaurora.org>
References: <20200903224328.26452-1-abhinavk@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

To prepare the MSM DP driver for running video pattern
compliance tests introduce debugfs module for it.

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/Makefile        |   3 +-
 drivers/gpu/drm/msm/dp/dp_debug.c   | 310 ++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/dp/dp_debug.h   |  71 +++++++
 drivers/gpu/drm/msm/dp/dp_display.c |  13 ++
 4 files changed, 396 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_debug.h

diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
index db1bdd35bbf5..c9dda1413c33 100644
--- a/drivers/gpu/drm/msm/Makefile
+++ b/drivers/gpu/drm/msm/Makefile
@@ -96,7 +96,8 @@ msm-y := \
 	msm_gpu_tracepoints.o \
 	msm_gpummu.o
 
-msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o
+msm-$(CONFIG_DEBUG_FS) += adreno/a5xx_debugfs.o \
+	dp/dp_debug.o
 
 msm-$(CONFIG_DRM_MSM_GPU_STATE)	+= adreno/a6xx_gpu_state.o
 
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.c b/drivers/gpu/drm/msm/dp/dp_debug.c
new file mode 100644
index 000000000000..92019f3e1a1f
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_debug.c
@@ -0,0 +1,310 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#define pr_fmt(fmt)"[drm-dp] %s: " fmt, __func__
+
+#include <linux/debugfs.h>
+#include <drm/drm_connector.h>
+
+#include "dp_parser.h"
+#include "dp_catalog.h"
+#include "dp_aux.h"
+#include "dp_ctrl.h"
+#include "dp_debug.h"
+#include "dp_display.h"
+
+#define DEBUG_NAME "drm_dp"
+
+struct dp_debug_private {
+	struct dentry *root;
+
+	struct dp_usbpd *usbpd;
+	struct dp_link *link;
+	struct dp_panel *panel;
+	struct drm_connector **connector;
+	struct device *dev;
+
+	struct dp_debug dp_debug;
+};
+
+static int dp_debug_check_buffer_overflow(int rc, int *max_size, int *len)
+{
+	if (rc >= *max_size) {
+		DRM_ERROR("buffer overflow\n");
+		return -EINVAL;
+	}
+	*len += rc;
+	*max_size = SZ_4K - *len;
+
+	return 0;
+}
+
+static ssize_t dp_debug_read_info(struct file *file, char __user *user_buff,
+		size_t count, loff_t *ppos)
+{
+	struct dp_debug_private *debug = file->private_data;
+	char *buf;
+	u32 len = 0, rc = 0;
+	u64 lclk = 0;
+	u32 max_size = SZ_4K;
+	u32 link_params_rate;
+	struct drm_display_mode *drm_mode;
+
+	if (!debug)
+		return -ENODEV;
+
+	if (*ppos)
+		return 0;
+
+	buf = kzalloc(SZ_4K, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	drm_mode = &debug->panel->dp_mode.drm_mode;
+
+	rc = snprintf(buf + len, max_size, "\tname = %s\n", DEBUG_NAME);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\tdp_panel\n\t\tmax_pclk_khz = %d\n",
+			debug->panel->max_pclk_khz);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\tdrm_dp_link\n\t\trate = %u\n",
+			debug->panel->link_info.rate);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			 "\t\tnum_lanes = %u\n",
+			debug->panel->link_info.num_lanes);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tcapabilities = %lu\n",
+			debug->panel->link_info.capabilities);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\tdp_panel_info:\n\t\tactive = %dx%d\n",
+			drm_mode->hdisplay,
+			drm_mode->vdisplay);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tback_porch = %dx%d\n",
+			drm_mode->htotal - drm_mode->hsync_end,
+			drm_mode->vtotal - drm_mode->vsync_end);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tfront_porch = %dx%d\n",
+			drm_mode->hsync_start - drm_mode->hdisplay,
+			drm_mode->vsync_start - drm_mode->vdisplay);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tsync_width = %dx%d\n",
+			drm_mode->hsync_end - drm_mode->hsync_start,
+			drm_mode->vsync_end - drm_mode->vsync_start);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tactive_low = %dx%d\n",
+			debug->panel->dp_mode.h_active_low,
+			debug->panel->dp_mode.v_active_low);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\th_skew = %d\n",
+			drm_mode->hskew);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\trefresh rate = %d\n",
+			drm_mode->vrefresh);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tpixel clock khz = %d\n",
+			drm_mode->clock);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tbpp = %d\n",
+			debug->panel->dp_mode.bpp);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	/* Link Information */
+	rc = snprintf(buf + len, max_size,
+			"\tdp_link:\n\t\ttest_requested = %d\n",
+			debug->link->sink_request);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tnum_lanes = %d\n",
+			debug->link->link_params.num_lanes);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	link_params_rate = debug->link->link_params.rate;
+	rc = snprintf(buf + len, max_size,
+			"\t\tbw_code = %d\n",
+			drm_dp_link_rate_to_bw_code(link_params_rate));
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	lclk = debug->link->link_params.rate * 1000;
+	rc = snprintf(buf + len, max_size,
+			"\t\tlclk = %lld\n", lclk);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tv_level = %d\n",
+			debug->link->phy_params.v_level);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	rc = snprintf(buf + len, max_size,
+			"\t\tp_level = %d\n",
+			debug->link->phy_params.p_level);
+	if (dp_debug_check_buffer_overflow(rc, &max_size, &len))
+		goto error;
+
+	if (copy_to_user(user_buff, buf, len))
+		goto error;
+
+	*ppos += len;
+
+	kfree(buf);
+	return len;
+ error:
+	kfree(buf);
+	return -EINVAL;
+}
+
+static const struct file_operations dp_debug_fops = {
+	.open = simple_open,
+	.read = dp_debug_read_info,
+};
+
+static int dp_debug_init(struct dp_debug *dp_debug)
+{
+	int rc = 0;
+	struct dp_debug_private *debug = container_of(dp_debug,
+			struct dp_debug_private, dp_debug);
+	struct dentry *dir, *file;
+
+	dir = debugfs_create_dir(DEBUG_NAME, NULL);
+	if (IS_ERR_OR_NULL(dir)) {
+		rc = PTR_ERR(dir);
+		DRM_ERROR("[%s] debugfs create dir failed, rc = %d\n",
+				  DEBUG_NAME, rc);
+		goto error;
+	}
+
+	file = debugfs_create_file("dp_debug", 0444, dir,
+			debug, &dp_debug_fops);
+	if (IS_ERR_OR_NULL(file)) {
+		rc = PTR_ERR(file);
+		DRM_ERROR("[%s] debugfs create file failed, rc=%d\n",
+				  DEBUG_NAME, rc);
+		goto error_remove_dir;
+	}
+
+	debug->root = dir;
+	return rc;
+ error_remove_dir:
+	debugfs_remove(dir);
+ error:
+	return rc;
+}
+
+struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
+		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct drm_connector **connector)
+{
+	int rc = 0;
+	struct dp_debug_private *debug;
+	struct dp_debug *dp_debug;
+
+	if (!dev || !panel || !usbpd || !link) {
+		DRM_ERROR("invalid input\n");
+		rc = -EINVAL;
+		goto error;
+	}
+
+	debug = devm_kzalloc(dev, sizeof(*debug), GFP_KERNEL);
+	if (!debug) {
+		rc = -ENOMEM;
+		goto error;
+	}
+
+	debug->dp_debug.debug_en = false;
+	debug->usbpd = usbpd;
+	debug->link = link;
+	debug->panel = panel;
+	debug->dev = dev;
+	debug->connector = connector;
+
+	dp_debug = &debug->dp_debug;
+	dp_debug->vdisplay = 0;
+	dp_debug->hdisplay = 0;
+	dp_debug->vrefresh = 0;
+
+	rc = dp_debug_init(dp_debug);
+	if (rc) {
+		devm_kfree(dev, debug);
+		goto error;
+	}
+
+	return dp_debug;
+ error:
+	return ERR_PTR(rc);
+}
+
+static int dp_debug_deinit(struct dp_debug *dp_debug)
+{
+	struct dp_debug_private *debug;
+
+	if (!dp_debug)
+		return -EINVAL;
+
+	debug = container_of(dp_debug, struct dp_debug_private, dp_debug);
+
+	debugfs_remove_recursive(debug->root);
+
+	return 0;
+}
+
+void dp_debug_put(struct dp_debug *dp_debug)
+{
+	struct dp_debug_private *debug;
+
+	if (!dp_debug)
+		return;
+
+	debug = container_of(dp_debug, struct dp_debug_private, dp_debug);
+
+	dp_debug_deinit(dp_debug);
+
+	devm_kfree(debug->dev, debug);
+}
diff --git a/drivers/gpu/drm/msm/dp/dp_debug.h b/drivers/gpu/drm/msm/dp/dp_debug.h
new file mode 100644
index 000000000000..fddf827ac089
--- /dev/null
+++ b/drivers/gpu/drm/msm/dp/dp_debug.h
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DP_DEBUG_H_
+#define _DP_DEBUG_H_
+
+#include "dp_panel.h"
+#include "dp_link.h"
+
+/**
+ * struct dp_debug
+ * @debug_en: specifies whether debug mode enabled
+ * @vdisplay: used to filter out vdisplay value
+ * @hdisplay: used to filter out hdisplay value
+ * @vrefresh: used to filter out vrefresh value
+ * @tpg_state: specifies whether tpg feature is enabled
+ */
+struct dp_debug {
+	bool debug_en;
+	int aspect_ratio;
+	int vdisplay;
+	int hdisplay;
+	int vrefresh;
+};
+
+#if defined(CONFIG_DEBUG_FS)
+
+/**
+ * dp_debug_get() - configure and get the DisplayPlot debug module data
+ *
+ * @dev: device instance of the caller
+ * @panel: instance of panel module
+ * @usbpd: instance of usbpd module
+ * @link: instance of link module
+ * @connector: double pointer to display connector
+ * return: pointer to allocated debug module data
+ *
+ * This function sets up the debug module and provides a way
+ * for debugfs input to be communicated with existing modules
+ */
+struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
+		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct drm_connector **connector);
+/**
+ * dp_debug_put()
+ *
+ * Cleans up dp_debug instance
+ *
+ * @dp_debug: instance of dp_debug
+ */
+void dp_debug_put(struct dp_debug *dp_debug);
+
+#else
+
+static inline
+struct dp_debug *dp_debug_get(struct device *dev, struct dp_panel *panel,
+		struct dp_usbpd *usbpd, struct dp_link *link,
+		struct drm_connector **connector)
+{
+	return ERR_PTR(-EINVAL);
+}
+
+static inline void dp_debug_put(struct dp_debug *dp_debug)
+{
+}
+
+#endif /* defined(CONFIG_DEBUG_FS) */
+
+#endif /* _DP_DEBUG_H_ */
diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index f0e7abc223f4..3495ca367dc1 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -26,6 +26,7 @@
 #include "dp_drm.h"
 #include "dp_pll.h"
 #include "dp_audio.h"
+#include "dp_debug.h"
 
 static struct msm_dp *g_dp_display;
 #define HPD_STRING_SIZE 30
@@ -648,6 +649,7 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
 
 static void dp_display_deinit_sub_modules(struct dp_display_private *dp)
 {
+	dp_debug_put(dp->debug);
 	dp_ctrl_put(dp->ctrl);
 	dp_panel_put(dp->panel);
 	dp_aux_put(dp->aux);
@@ -760,8 +762,19 @@ static int dp_init_sub_modules(struct dp_display_private *dp)
 		goto error_audio;
 	}
 
+	dp->debug = dp_debug_get(dev, dp->panel, dp->usbpd,
+			dp->link, &dp->dp_display.connector);
+	if (IS_ERR(dp->debug)) {
+		rc = PTR_ERR(dp->debug);
+		DRM_ERROR("failed to initialize debug, rc = %d\n", rc);
+		dp->debug = NULL;
+		goto error_debug;
+	}
+
 	return rc;
 
+error_debug:
+	dp_audio_put(dp->audio);
 error_audio:
 	dp_ctrl_put(dp->ctrl);
 error_ctrl:
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

