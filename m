Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9627B11599F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 00:15:20 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726388AbfLFXPL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 18:15:11 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:38943 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726553AbfLFXPB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 18:15:01 -0500
Received: by mail-il1-f196.google.com with SMTP id a7so7696198ild.6
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 15:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XW/MrhXAVDyeCMiJcKC4crfk3pG/2/JBLuHke3ueDF0=;
        b=XoRfNjirtDbrYP3OT2Z5rNxteEyUfaMub2288xDttHO0RhBmtJvscXN/AzINgN+xmb
         u45yo7vI2ekiHAaX5BOnJS6L2IotUS/QzsXKYZzg0qW/rneuXQBbQJ3dib0UNOWOUxDN
         j9kxsuaq5GhKyK2Zfp9o08W2IjveK0F60fzFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XW/MrhXAVDyeCMiJcKC4crfk3pG/2/JBLuHke3ueDF0=;
        b=Gx85ZBlG4fGI1qXuiD9OfnWuevX2bMJlrejy5OicGfuok8COOQ094QrfMYlEsmHycc
         pLRu4k34YcyyWzDa5bBRCYZsIIl1adVnSVoO/5qbMCnpF3Yw+/iOaWqKGpos1XpTBSml
         mpqyba4lUNkykX47Gy9dsHh4UVMp+TR+YNcU+o7BMdfR2joJrhlwIQdUVdTIWUlktuUs
         xv7TqGU0JIWKRTW0kCyJLPJjP8G9uYeC7XfLUwspsNlwnT/WPdvNp/JGoy3xQc2HNIyY
         n3MkVvBR8CvKYSpxEYbvGSIM7gNCrR+1icZegv0MN+esdCqTl1EkeeNj4vH9M8T5T7Rb
         da2A==
X-Gm-Message-State: APjAAAXhjd9d7zKFrHNUk2hY2Lrwu+O/kNfJ4hY7UqWByzpjAH2SAS3r
        FJrIxOfZOvlEeNUhVF9zOCxqTw==
X-Google-Smtp-Source: APXvYqxeyKh9xU1zUa8Wogw4dKJjWO9bUFq+RdVvi8CMl73qOfllHRjokhKv+ARs4bfVv5DKNEddVQ==
X-Received: by 2002:a92:cc4e:: with SMTP id t14mr17535353ilq.13.1575674099951;
        Fri, 06 Dec 2019 15:14:59 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Dec 2019 15:14:59 -0800 (PST)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Dec 2019 16:13:48 -0700
Message-Id: <20191206161137.6.I505289c0ad2bbcbbb8831c2f209f2f4ebee59f28@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The dpu_encoder_phys * argument passed to these functions will never be
NULL so don't check.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 69 ++++---------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 44 +-----------
 2 files changed, 17 insertions(+), 96 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index cc2ecf327582..39e1e280ba44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -45,8 +45,7 @@ static bool dpu_encoder_phys_cmd_mode_fixup(
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	if (phys_enc)
-		DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
+	DPU_DEBUG_CMDENC(to_dpu_encoder_phys_cmd(phys_enc), "\n");
 	return true;
 }
 
@@ -58,9 +57,6 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
-	if (!phys_enc)
-		return;
-
 	ctl = phys_enc->hw_ctl;
 	if (!ctl->ops.setup_intf_cfg)
 		return;
@@ -79,7 +75,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 	int new_cnt;
 	u32 event = DPU_ENCODER_FRAME_EVENT_DONE;
 
-	if (!phys_enc || !phys_enc->hw_pp)
+	if (!phys_enc->hw_pp)
 		return;
 
 	DPU_ATRACE_BEGIN("pp_done_irq");
@@ -106,7 +102,7 @@ static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (!phys_enc || !phys_enc->hw_pp)
+	if (!phys_enc->hw_pp)
 		return;
 
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
@@ -125,9 +121,6 @@ static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (!phys_enc)
-		return;
-
 	DPU_ATRACE_BEGIN("ctl_start_irq");
 
 	atomic_add_unless(&phys_enc->pending_ctlstart_cnt, -1, 0);
@@ -141,9 +134,6 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (!phys_enc)
-		return;
-
 	if (phys_enc->parent_ops->handle_underrun_virt)
 		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
 			phys_enc);
@@ -179,7 +169,7 @@ static void dpu_encoder_phys_cmd_mode_set(
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc || !mode || !adj_mode) {
+	if (!mode || !adj_mode) {
 		DPU_ERROR("invalid args\n");
 		return;
 	}
@@ -198,7 +188,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 	u32 frame_event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	bool do_log = false;
 
-	if (!phys_enc || !phys_enc->hw_pp)
+	if (!phys_enc->hw_pp)
 		return -EINVAL;
 
 	cmd_enc->pp_timeout_report_cnt++;
@@ -247,11 +237,6 @@ static int _dpu_encoder_phys_cmd_wait_for_idle(
 	struct dpu_encoder_wait_info wait_info;
 	int ret;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return -EINVAL;
-	}
-
 	wait_info.wq = &phys_enc->pending_kickoff_wq;
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
@@ -273,7 +258,7 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	int ret = 0;
 	int refcount;
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid encoder\n");
 		return -EINVAL;
 	}
@@ -314,9 +299,6 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
 		bool enable)
 {
-	if (!phys_enc)
-		return;
-
 	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
 			phys_enc->hw_pp->idx - PINGPONG_0,
 			enable, atomic_read(&phys_enc->vblank_refcount));
@@ -351,7 +333,7 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	u32 vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid encoder\n");
 		return;
 	}
@@ -428,8 +410,7 @@ static void _dpu_encoder_phys_cmd_pingpong_config(
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc || !phys_enc->hw_pp
-			|| !phys_enc->hw_ctl->ops.setup_intf_cfg) {
+	if (!phys_enc->hw_pp || !phys_enc->hw_ctl->ops.setup_intf_cfg) {
 		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != 0);
 		return;
 	}
@@ -458,7 +439,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 	struct dpu_hw_ctl *ctl;
 	u32 flush_mask = 0;
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
 		return;
 	}
@@ -480,7 +461,7 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid phys encoder\n");
 		return;
 	}
@@ -499,8 +480,7 @@ static void dpu_encoder_phys_cmd_enable(struct dpu_encoder_phys *phys_enc)
 static void _dpu_encoder_phys_cmd_connect_te(
 		struct dpu_encoder_phys *phys_enc, bool enable)
 {
-	if (!phys_enc || !phys_enc->hw_pp ||
-			!phys_enc->hw_pp->ops.connect_external_te)
+	if (!phys_enc->hw_pp || !phys_enc->hw_pp->ops.connect_external_te)
 		return;
 
 	trace_dpu_enc_phys_cmd_connect_te(DRMID(phys_enc->parent), enable);
@@ -518,7 +498,7 @@ static int dpu_encoder_phys_cmd_get_line_count(
 {
 	struct dpu_hw_pingpong *hw_pp;
 
-	if (!phys_enc || !phys_enc->hw_pp)
+	if (!phys_enc->hw_pp)
 		return -EINVAL;
 
 	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
@@ -536,7 +516,7 @@ static void dpu_encoder_phys_cmd_disable(struct dpu_encoder_phys *phys_enc)
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid encoder\n");
 		return;
 	}
@@ -559,10 +539,6 @@ static void dpu_encoder_phys_cmd_destroy(struct dpu_encoder_phys *phys_enc)
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	kfree(cmd_enc);
 }
 
@@ -580,7 +556,7 @@ static void dpu_encoder_phys_cmd_prepare_for_kickoff(
 			to_dpu_encoder_phys_cmd(phys_enc);
 	int ret;
 
-	if (!phys_enc || !phys_enc->hw_pp) {
+	if (!phys_enc->hw_pp) {
 		DPU_ERROR("invalid encoder\n");
 		return;
 	}
@@ -614,11 +590,6 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 	struct dpu_encoder_wait_info wait_info;
 	int ret;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid argument(s)\n");
-		return -EINVAL;
-	}
-
 	wait_info.wq = &phys_enc->pending_kickoff_wq;
 	wait_info.atomic_cnt = &phys_enc->pending_ctlstart_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
@@ -639,9 +610,6 @@ static int dpu_encoder_phys_cmd_wait_for_tx_complete(
 {
 	int rc;
 
-	if (!phys_enc)
-		return -EINVAL;
-
 	rc = _dpu_encoder_phys_cmd_wait_for_idle(phys_enc);
 	if (rc) {
 		DRM_ERROR("failed wait_for_idle: id:%u ret:%d intf:%d\n",
@@ -658,9 +626,6 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	int rc = 0;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (!phys_enc)
-		return -EINVAL;
-
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
 	/* only required for master controller */
@@ -681,9 +646,6 @@ static int dpu_encoder_phys_cmd_wait_for_vblank(
 	struct dpu_encoder_phys_cmd *cmd_enc;
 	struct dpu_encoder_wait_info wait_info;
 
-	if (!phys_enc)
-		return -EINVAL;
-
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
 	/* only required for master controller */
@@ -715,9 +677,6 @@ static void dpu_encoder_phys_cmd_handle_post_kickoff(
 static void dpu_encoder_phys_cmd_trigger_start(
 		struct dpu_encoder_phys *phys_enc)
 {
-	if (!phys_enc)
-		return;
-
 	dpu_encoder_helper_trigger_start(phys_enc);
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 2252475dd8dc..114a3e8f6b0c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -220,8 +220,7 @@ static bool dpu_encoder_phys_vid_mode_fixup(
 		const struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	if (phys_enc)
-		DPU_DEBUG_VIDENC(phys_enc, "\n");
+	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
 	/*
 	 * Modifying mode has consequences when the mode comes back to us
@@ -239,7 +238,7 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
 	unsigned long lock_flags;
 	struct dpu_hw_intf_cfg intf_cfg = { 0 };
 
-	if (!phys_enc || !phys_enc->hw_ctl->ops.setup_intf_cfg) {
+	if (!phys_enc->hw_ctl->ops.setup_intf_cfg) {
 		DPU_ERROR("invalid encoder %d\n", phys_enc != 0);
 		return;
 	}
@@ -293,9 +292,6 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	u32 flush_register = 0;
 	int new_cnt = -1, old_cnt = -1;
 
-	if (!phys_enc)
-		return;
-
 	hw_ctl = phys_enc->hw_ctl;
 
 	DPU_ATRACE_BEGIN("vblank_irq");
@@ -333,9 +329,6 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (!phys_enc)
-		return;
-
 	if (phys_enc->parent_ops->handle_underrun_virt)
 		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
 			phys_enc);
@@ -372,11 +365,6 @@ static void dpu_encoder_phys_vid_mode_set(
 		struct drm_display_mode *mode,
 		struct drm_display_mode *adj_mode)
 {
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder/kms\n");
-		return;
-	}
-
 	if (adj_mode) {
 		phys_enc->cached_mode = *adj_mode;
 		drm_mode_debug_printmodeline(adj_mode);
@@ -393,11 +381,6 @@ static int dpu_encoder_phys_vid_control_vblank_irq(
 	int ret = 0;
 	int refcount;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return -EINVAL;
-	}
-
 	refcount = atomic_read(&phys_enc->vblank_refcount);
 
 	/* Slave encoders don't report vblank */
@@ -469,11 +452,6 @@ static void dpu_encoder_phys_vid_enable(struct dpu_encoder_phys *phys_enc)
 
 static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 {
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 	kfree(phys_enc);
 }
@@ -491,11 +469,6 @@ static int dpu_encoder_phys_vid_wait_for_vblank(
 	struct dpu_encoder_wait_info wait_info;
 	int ret;
 
-	if (!phys_enc) {
-		pr_err("invalid encoder\n");
-		return -EINVAL;
-	}
-
 	wait_info.wq = &phys_enc->pending_kickoff_wq;
 	wait_info.atomic_cnt = &phys_enc->pending_kickoff_cnt;
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
@@ -541,11 +514,6 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	struct dpu_hw_ctl *ctl;
 	int rc;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder/parameters\n");
-		return;
-	}
-
 	ctl = phys_enc->hw_ctl;
 	if (!ctl->ops.wait_reset_status)
 		return;
@@ -567,7 +535,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	unsigned long lock_flags;
 	int ret;
 
-	if (!phys_enc || !phys_enc->parent || !phys_enc->parent->dev) {
+	if (!phys_enc->parent || !phys_enc->parent->dev) {
 		DPU_ERROR("invalid encoder/device\n");
 		return;
 	}
@@ -637,9 +605,6 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 {
 	int ret;
 
-	if (!phys_enc)
-		return;
-
 	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
 			    phys_enc->hw_intf->idx - INTF_0,
 			    enable,
@@ -660,9 +625,6 @@ static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
 static int dpu_encoder_phys_vid_get_line_count(
 		struct dpu_encoder_phys *phys_enc)
 {
-	if (!phys_enc)
-		return -EINVAL;
-
 	if (!dpu_encoder_phys_vid_is_master(phys_enc))
 		return -EINVAL;
 
-- 
2.21.0

