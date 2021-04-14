Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C6FBB35FE3E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Apr 2021 01:11:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhDNXMQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 14 Apr 2021 19:12:16 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:50599 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232900AbhDNXMP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 14 Apr 2021 19:12:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1618441913; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=VVZbEeRWCVXMAy/UVoEl5r6YnkJ8Ka0iU7j4t+bHbZo=; b=ujnsLJaPvxz1oTfTOzBmSESsl4N3Rn9TNSajB6PEg+5buE3ieV3vb4T/LFMKpw0En1uM31Lj
 AUNPIpd34POY0OMWCAZn/R8krZSAZoo83wjafNFVVrlbdglRhNvd+Xn8Z8AnBDvmyPC8tjb/
 PPKf4NEfalJdURYbIQnEZvEr1D4=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 607776b92cc44d3aea707ce7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Apr 2021 23:11:53
 GMT
Sender: abhinavk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 10569C433C6; Wed, 14 Apr 2021 23:11:53 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from abhinavk-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: abhinavk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 912F6C43461;
        Wed, 14 Apr 2021 23:11:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 912F6C43461
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=abhinavk@codeaurora.org
From:   Abhinav Kumar <abhinavk@codeaurora.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Abhinav Kumar <abhinavk@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        nganji@codeaurora.org, aravindh@codeaurora.org,
        khsieh@codeaurora.org, daniel@ffwll.ch
Subject: [PATCH v4 3/3] drm/msm: add disp snapshot points across dpu driver
Date:   Wed, 14 Apr 2021 16:11:37 -0700
Message-Id: <1618441897-17123-4-git-send-email-abhinavk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1618441897-17123-1-git-send-email-abhinavk@codeaurora.org>
References: <1618441897-17123-1-git-send-email-abhinavk@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add snapshot points across dpu driver to trigger dumps when critical
errors are hit.

changes in v4:
 - change the callers to use the new snapshot macro

Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 18 +++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 14 +++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  8 +++++++-
 3 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8d94205..39b2df9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2014-2018, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2014-2018, 2020-2021 The Linux Foundation. All rights reserved.
  * Copyright (C) 2013 Red Hat
  * Author: Rob Clark <robdclark@gmail.com>
  */
@@ -26,6 +26,7 @@
 #include "dpu_crtc.h"
 #include "dpu_trace.h"
 #include "dpu_core_irq.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define DPU_DEBUG_ENC(e, fmt, ...) DPU_DEBUG("enc%d " fmt,\
 		(e) ? (e)->base.base.id : -1, ##__VA_ARGS__)
@@ -1336,6 +1337,13 @@ static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 
 	DPU_ATRACE_BEGIN("encoder_underrun_callback");
 	atomic_inc(&phy_enc->underrun_cnt);
+
+	/* trigger dump only on the first underrun */
+	if (atomic_read(&phy_enc->underrun_cnt) == 1) {
+		pr_err("triggering dump\n");
+		MSM_DISP_SNAPSHOT(drm_enc->dev);
+	}
+
 	trace_dpu_enc_underrun_cb(DRMID(drm_enc),
 				  atomic_read(&phy_enc->underrun_cnt));
 	DPU_ATRACE_END("encoder_underrun_callback");
@@ -1565,19 +1573,23 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 	struct dpu_encoder_virt *dpu_enc;
 	struct dpu_hw_ctl *ctl;
 	int rc;
+	struct drm_encoder *drm_enc;
 
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 	ctl = phys_enc->hw_ctl;
+	drm_enc = phys_enc->parent;
 
 	if (!ctl->ops.reset)
 		return;
 
-	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(phys_enc->parent),
+	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(drm_enc),
 		      ctl->idx);
 
 	rc = ctl->ops.reset(ctl);
-	if (rc)
+	if (rc) {
 		DPU_ERROR_ENC(dpu_enc, "ctl %d reset failure\n",  ctl->idx);
+		MSM_DISP_SNAPSHOT(drm_enc->dev);
+	}
 
 	phys_enc->enable_state = DPU_ENC_ENABLED;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index b2be39b..f587985 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2015-2018 The Linux Foundation. All rights reserved.
+ * Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -11,6 +11,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define DPU_DEBUG_CMDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->base.parent ? \
@@ -191,10 +192,13 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 			to_dpu_encoder_phys_cmd(phys_enc);
 	u32 frame_event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	bool do_log = false;
+	struct drm_encoder *drm_enc;
 
 	if (!phys_enc->hw_pp)
 		return -EINVAL;
 
+	drm_enc = phys_enc->parent;
+
 	cmd_enc->pp_timeout_report_cnt++;
 	if (cmd_enc->pp_timeout_report_cnt == PP_TIMEOUT_MAX_TRIALS) {
 		frame_event |= DPU_ENCODER_FRAME_EVENT_PANEL_DEAD;
@@ -203,7 +207,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		do_log = true;
 	}
 
-	trace_dpu_enc_phys_cmd_pdone_timeout(DRMID(phys_enc->parent),
+	trace_dpu_enc_phys_cmd_pdone_timeout(DRMID(drm_enc),
 		     phys_enc->hw_pp->idx - PINGPONG_0,
 		     cmd_enc->pp_timeout_report_cnt,
 		     atomic_read(&phys_enc->pending_kickoff_cnt),
@@ -212,12 +216,12 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 	/* to avoid flooding, only log first time, and "dead" time */
 	if (do_log) {
 		DRM_ERROR("id:%d pp:%d kickoff timeout %d cnt %d koff_cnt %d\n",
-			  DRMID(phys_enc->parent),
+			  DRMID(drm_enc),
 			  phys_enc->hw_pp->idx - PINGPONG_0,
 			  phys_enc->hw_ctl->idx - CTL_0,
 			  cmd_enc->pp_timeout_report_cnt,
 			  atomic_read(&phys_enc->pending_kickoff_cnt));
-
+		MSM_DISP_SNAPSHOT(drm_enc->dev);
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_RDPTR);
 	}
 
@@ -228,7 +232,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 
 	if (phys_enc->parent_ops->handle_frame_done)
 		phys_enc->parent_ops->handle_frame_done(
-				phys_enc->parent, phys_enc, frame_event);
+				drm_enc, phys_enc, frame_event);
 
 	return -ETIMEDOUT;
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0e06b7e..9fdf888 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -1,5 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0-only
-/* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
+/* Copyright (c) 2015-2018, 2020-2021 The Linux Foundation. All rights reserved.
  */
 
 #define pr_fmt(fmt)	"[drm:%s:%d] " fmt, __func__, __LINE__
@@ -9,6 +9,7 @@
 #include "dpu_core_irq.h"
 #include "dpu_formats.h"
 #include "dpu_trace.h"
+#include "disp/msm_disp_snapshot.h"
 
 #define DPU_DEBUG_VIDENC(e, fmt, ...) DPU_DEBUG("enc%d intf%d " fmt, \
 		(e) && (e)->parent ? \
@@ -468,6 +469,7 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 		"update pending flush ctl %d intf %d\n",
 		ctl->idx - CTL_0, phys_enc->hw_intf->idx);
 
+	atomic_set(&phys_enc->underrun_cnt, 0);
 
 	/* ctl_flush & timing engine enable will be triggered by framework */
 	if (phys_enc->enable_state == DPU_ENC_DISABLED)
@@ -537,6 +539,9 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 {
 	struct dpu_hw_ctl *ctl;
 	int rc;
+	struct drm_encoder *drm_enc;
+
+	drm_enc = phys_enc->parent;
 
 	ctl = phys_enc->hw_ctl;
 	if (!ctl->ops.wait_reset_status)
@@ -550,6 +555,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	if (rc) {
 		DPU_ERROR_VIDENC(phys_enc, "ctl %d reset failure: %d\n",
 				ctl->idx, rc);
+		MSM_DISP_SNAPSHOT(drm_enc->dev);
 		dpu_encoder_helper_unregister_irq(phys_enc, INTR_IDX_VSYNC);
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

