Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 90B96434199
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Oct 2021 00:49:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbhJSWvQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 18:51:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:27097 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229686AbhJSWvQ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 18:51:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1634683742; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=q8yCmNIi0AOak6VCYasqD6uGihOnoDUC6JvGgY8amEY=; b=LXOwn8fiF+nc6+OUUgS5e4Co6kOIkA8AWl+Chy9ZFseivHR9yTqyPuy303T3i/9i+6+1C05g
 urzWA7666UWuaE3lOTdKaQhG4HJj0BmLnqQKckzyZhdW7snTDLJJS1FANeTVVXLX6nD0sV6b
 pE2w4K/uyPfe5o/cw6JOLvnrZm4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 616f4b4714914866fa8e6e23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 19 Oct 2021 22:48:39
 GMT
Sender: jesszhan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A658C43618; Tue, 19 Oct 2021 22:48:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jesszhan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BFE51C43460;
        Tue, 19 Oct 2021 22:48:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 smtp.codeaurora.org BFE51C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=codeaurora.org
From:   Jessica Zhang <jesszhan@codeaurora.org>
To:     freedreno@lists.freedesktop.org
Cc:     Jessica Zhang <jesszhan@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, dmitry.baryshkov@linaro.org,
        abhinavk@codeaurora.org, markyacoub@google.com,
        kernel test robot <lkp@intel.com>
Subject: [PATCH v2] drm/msm/dpu: Add CRC support for DPU
Date:   Tue, 19 Oct 2021 15:48:22 -0700
Message-Id: <20211019224822.25940-1-jesszhan@codeaurora.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add CRC support to DPU, which is currently not supported by
this driver. Only supports CRC for CRTC for now, but will extend support
to other blocks later on.

Changes in v2:
- Added kfree() calls for return paths in dpu_crtc_get_crc()
- Propogated error code for dpu_crtc_get_crc()
- Renamed skip_count
- Removed dpu_crtc_is_valid_crc_source()
- Removed wait for commit in dpu_crtc_set_crc_source()
- Moved crc_source from struct dpu_crtc to struct dpu_crtc_state
- Moved CRC register constants from dpu_hw_util.h to dpu_hw_lm.c

Validated with IGT kms_pipe_crc_basic, and kms_cursor_crc

Test: kms_pipe_crc_basic
Subtests Passed:
- bad-source
- read-crc-pipe-A
- read-crc-pipe-A-frame-sequence
- nonblocking-crc-pipe-A
- nonblocking-crc-pipe-A-frame-sequence
- disable-crc-after-crtc-pipe-A[1]
- compare-crc-sanitycheck-pipe-A[1]
Rest skipped

Test: kms_cursor_crc
Subtests Passed:
- pipe-A-cursor-size-change
- pipe-A-cursor-alpha-opaque
- pipe-A-cursor-alpha-transparent
Subtests Failed:
- pipe-A-cursor-dpms
- pipe-A-cursor-*-onscreen
- pipe-A-cursor-*-offscreen
Rest skipped

Tested on Qualcomm RB3 (debian, sdm845), Qualcomm RB5 (debian, qrb5165)

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Jessica Zhang <jesszhan@codeaurora.org>

[1] Skipped on RB5 due to issue related to DPMS. Planning to upload a
fix for this in the future.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 153 +++++++++++++++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  19 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   |  56 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h   |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |   3 +-
 5 files changed, 239 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index eecfa88517e0..e91568d4f09a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -70,6 +70,102 @@ static struct drm_encoder *get_encoder_from_crtc(struct drm_crtc *crtc)
 	return NULL;
 }
 
+static enum dpu_crtc_crc_source dpu_crtc_parse_crc_source(const char *src_name)
+{
+	if (!src_name ||
+	    !strcmp(src_name, "none"))
+		return DPU_CRTC_CRC_SOURCE_NONE;
+	if (!strcmp(src_name, "auto") ||
+	    !strcmp(src_name, "lm"))
+		return DPU_CRTC_CRC_SOURCE_LAYER_MIXER;
+
+	return DPU_CRTC_CRC_SOURCE_INVALID;
+}
+
+static int dpu_crtc_verify_crc_source(struct drm_crtc *crtc,
+		const char *src_name, size_t *values_cnt)
+{
+	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
+	struct dpu_crtc_state *crtc_state = to_dpu_crtc_state(crtc->state);
+
+	if (source < 0) {
+		DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", src_name, crtc->index);
+		return -EINVAL;
+	}
+
+	if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
+		*values_cnt = crtc_state->num_mixers;
+
+	return 0;
+}
+
+static int dpu_crtc_set_crc_source(struct drm_crtc *crtc, const char *src_name)
+{
+	enum dpu_crtc_crc_source source = dpu_crtc_parse_crc_source(src_name);
+	enum dpu_crtc_crc_source current_source;
+	struct drm_crtc_commit *commit;
+	struct dpu_crtc_state *crtc_state;
+	struct drm_device *drm_dev = crtc->dev;
+	struct dpu_crtc_mixer *m;
+
+	bool was_enabled;
+	bool enable = false;
+	int i, ret = 0;
+
+	if (source < 0) {
+		DRM_DEBUG_DRIVER("Invalid CRC source %s for CRTC%d\n", src_name, crtc->index);
+		return -EINVAL;
+	}
+
+	ret = drm_modeset_lock(&crtc->mutex, NULL);
+
+	if (ret)
+		return ret;
+
+	enable = (source != DPU_CRTC_CRC_SOURCE_NONE);
+	crtc_state = to_dpu_crtc_state(crtc->state);
+
+	spin_lock_irq(&drm_dev->event_lock);
+	current_source = crtc_state->crc_source;
+	spin_unlock_irq(&drm_dev->event_lock);
+
+	was_enabled = (current_source != DPU_CRTC_CRC_SOURCE_NONE);
+
+	if (!was_enabled && enable) {
+		ret = drm_crtc_vblank_get(crtc);
+
+		if (ret)
+			goto cleanup;
+
+	} else if (was_enabled && !enable) {
+		drm_crtc_vblank_put(crtc);
+	}
+
+	spin_lock_irq(&drm_dev->event_lock);
+	crtc_state->crc_source = source;
+	spin_unlock_irq(&drm_dev->event_lock);
+
+	crtc_state->crc_frame_skip_count = 0;
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.setup_misr)
+			continue;
+
+		/* Calculate MISR over 1 frame */
+		m->hw_lm->ops.setup_misr(m->hw_lm, true, 1);
+	}
+
+
+cleanup:
+	if (commit)
+		drm_crtc_commit_put(commit);
+	drm_modeset_unlock(&crtc->mutex);
+
+	return ret;
+}
+
 static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 {
 	struct drm_encoder *encoder = get_encoder_from_crtc(crtc);
@@ -81,6 +177,56 @@ static u32 dpu_crtc_get_vblank_counter(struct drm_crtc *crtc)
 	return dpu_encoder_get_vsync_count(encoder);
 }
 
+
+static int dpu_crtc_get_crc(struct drm_crtc *crtc)
+{
+	struct dpu_crtc_state *crtc_state;
+	struct dpu_crtc_mixer *m;
+	u32 *crcs;
+
+	int i = 0;
+	int rc = 0;
+
+	if (!crtc) {
+		DPU_ERROR("Invalid crtc\n");
+		return -EINVAL;
+	}
+
+	crtc_state = to_dpu_crtc_state(crtc->state);
+	crcs = kcalloc(crtc_state->num_mixers, sizeof(*crcs), GFP_KERNEL);
+
+	if (!crcs)
+		return -ENOMEM;
+
+	/* Skip first 2 frames in case of "uncooked" CRCs */
+	if (crtc_state->crc_frame_skip_count < 2) {
+		crtc_state->crc_frame_skip_count++;
+		goto cleanup;
+	}
+
+	for (i = 0; i < crtc_state->num_mixers; ++i) {
+
+		m = &crtc_state->mixers[i];
+
+		if (!m->hw_lm || !m->hw_lm->ops.collect_misr)
+			continue;
+
+		rc = m->hw_lm->ops.collect_misr(m->hw_lm, &crcs[i]);
+
+		if (rc) {
+			DRM_DEBUG_DRIVER("MISR read failed\n");
+			goto cleanup;
+		}
+	}
+
+	rc = drm_crtc_add_crc_entry(crtc, true,
+			drm_crtc_accurate_vblank_count(crtc), crcs);
+
+cleanup:
+	kfree(crcs);
+	return rc;
+}
+
 static bool dpu_crtc_get_scanout_position(struct drm_crtc *crtc,
 					   bool in_vblank_irq,
 					   int *vpos, int *hpos,
@@ -387,6 +533,9 @@ void dpu_crtc_vblank_callback(struct drm_crtc *crtc)
 		dpu_crtc->vblank_cb_time = ktime_get();
 	else
 		dpu_crtc->vblank_cb_count++;
+
+	dpu_crtc_get_crc(crtc);
+
 	drm_crtc_handle_vblank(crtc);
 	trace_dpu_crtc_vblank_cb(DRMID(crtc));
 }
@@ -1330,6 +1479,8 @@ static const struct drm_crtc_funcs dpu_crtc_funcs = {
 	.atomic_destroy_state = dpu_crtc_destroy_state,
 	.late_register = dpu_crtc_late_register,
 	.early_unregister = dpu_crtc_early_unregister,
+	.verify_crc_source = dpu_crtc_verify_crc_source,
+	.set_crc_source = dpu_crtc_set_crc_source,
 	.enable_vblank  = msm_crtc_enable_vblank,
 	.disable_vblank = msm_crtc_disable_vblank,
 	.get_vblank_timestamp = drm_crtc_vblank_helper_get_vblank_timestamp,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index cec3474340e8..ae9546ca1359 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
 /*
- * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -69,6 +69,19 @@ struct dpu_crtc_smmu_state_data {
 	uint32_t transition_error;
 };
 
+/**
+ * enum dpu_crtc_crc_source: CRC source
+ * @DPU_CRTC_CRC_SOURCE_NONE: no source set
+ * @DPU_CRTC_CRC_SOURCE_LAYER_MIXER: CRC in layer mixer
+ * @DPU_CRTC_CRC_SOURCE_INVALID: Invalid source
+ */
+enum dpu_crtc_crc_source {
+	DPU_CRTC_CRC_SOURCE_NONE = 0,
+	DPU_CRTC_CRC_SOURCE_LAYER_MIXER,
+	DPU_CRTC_CRC_SOURCE_MAX,
+	DPU_CRTC_CRC_SOURCE_INVALID = -1
+};
+
 /**
  * struct dpu_crtc_mixer: stores the map for each virtual pipeline in the CRTC
  * @hw_lm:	LM HW Driver context
@@ -139,6 +152,7 @@ struct dpu_crtc_frame_event {
  * @event_lock    : Spinlock around event handling code
  * @phandle: Pointer to power handler
  * @cur_perf      : current performance committed to clock/bandwidth driver
+ * @crc_source    : CRC source
  */
 struct dpu_crtc {
 	struct drm_crtc base;
@@ -210,6 +224,9 @@ struct dpu_crtc_state {
 
 	u32 num_ctls;
 	struct dpu_hw_ctl *hw_ctls[CRTC_DUAL_MIXERS];
+
+	enum dpu_crtc_crc_source crc_source;
+	int crc_frame_skip_count;
 };
 
 #define to_dpu_crtc_state(x) \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index cb6bb7a22c15..86363c0ec834 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #include "dpu_kms.h"
@@ -24,6 +25,15 @@
 #define LM_BLEND0_FG_ALPHA               0x04
 #define LM_BLEND0_BG_ALPHA               0x08
 
+#define LM_MISR_CTRL                     0x310
+#define LM_MISR_SIGNATURE                0x314
+#define LM_MISR_FRAME_COUNT_MASK         0xFF
+#define LM_MISR_CTRL_ENABLE              BIT(8)
+#define LM_MISR_CTRL_STATUS              BIT(9)
+#define LM_MISR_CTRL_STATUS_CLEAR        BIT(10)
+#define LM_MISR_CTRL_FREE_RUN_MASK     BIT(31)
+
+
 static const struct dpu_lm_cfg *_lm_offset(enum dpu_lm mixer,
 		const struct dpu_mdss_cfg *m,
 		void __iomem *addr,
@@ -96,6 +106,48 @@ static void dpu_hw_lm_setup_border_color(struct dpu_hw_mixer *ctx,
 	}
 }
 
+static void dpu_hw_lm_setup_misr(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 config = 0;
+
+	DPU_REG_WRITE(c, LM_MISR_CTRL, LM_MISR_CTRL_STATUS_CLEAR);
+
+	/* Clear old MISR value (in case it's read before a new value is calculated)*/
+	wmb();
+
+	if (enable) {
+		config = (frame_count & LM_MISR_FRAME_COUNT_MASK) |
+			LM_MISR_CTRL_ENABLE | LM_MISR_CTRL_FREE_RUN_MASK;
+
+		DPU_REG_WRITE(c, LM_MISR_CTRL, config);
+	} else {
+		DPU_REG_WRITE(c, LM_MISR_CTRL, 0);
+	}
+
+}
+
+static int dpu_hw_lm_collect_misr(struct dpu_hw_mixer *ctx, u32 *misr_value)
+{
+	struct dpu_hw_blk_reg_map *c = &ctx->hw;
+	u32 ctrl = 0;
+
+	if (!misr_value)
+		return -EINVAL;
+
+	ctrl = DPU_REG_READ(c, LM_MISR_CTRL);
+
+	if (!(ctrl & LM_MISR_CTRL_ENABLE))
+		return -EINVAL;
+
+	if (!(ctrl & LM_MISR_CTRL_STATUS))
+		return -EINVAL;
+
+	*misr_value = DPU_REG_READ(c, LM_MISR_SIGNATURE);
+
+	return 0;
+}
+
 static void dpu_hw_lm_setup_blend_config_sdm845(struct dpu_hw_mixer *ctx,
 	u32 stage, u32 fg_alpha, u32 bg_alpha, u32 blend_op)
 {
@@ -158,6 +210,8 @@ static void _setup_mixer_ops(const struct dpu_mdss_cfg *m,
 		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
 	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
 	ops->setup_border_color = dpu_hw_lm_setup_border_color;
+	ops->setup_misr = dpu_hw_lm_setup_misr;
+	ops->collect_misr = dpu_hw_lm_collect_misr;
 }
 
 struct dpu_hw_mixer *dpu_hw_lm_init(enum dpu_lm idx,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
index 4a6b2de19ef6..d8052fb2d5da 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_LM_H
@@ -53,6 +54,16 @@ struct dpu_hw_lm_ops {
 	void (*setup_border_color)(struct dpu_hw_mixer *ctx,
 		struct dpu_mdss_color *color,
 		u8 border_en);
+
+	/**
+	 * setup_misr: Enable/disable MISR
+	 */
+	void (*setup_misr)(struct dpu_hw_mixer *ctx, bool enable, u32 frame_count);
+
+	/**
+	 * collect_misr: Read MISR signature
+	 */
+	int (*collect_misr)(struct dpu_hw_mixer *ctx, u32 *misr_value);
 };
 
 struct dpu_hw_mixer {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index ff3cffde84cd..6d4911957e33 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -1,5 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-only */
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/*
+ * Copyright (c) 2015-2021, The Linux Foundation. All rights reserved.
  */
 
 #ifndef _DPU_HW_UTIL_H
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

