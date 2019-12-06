Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 332C411598E
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 00:15:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726551AbfLFXO7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 18:14:59 -0500
Received: from mail-il1-f196.google.com ([209.85.166.196]:38601 "EHLO
        mail-il1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726506AbfLFXO7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 18:14:59 -0500
Received: by mail-il1-f196.google.com with SMTP id u17so7715131ilq.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 15:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1nbRHvdkP0hLRgTfexh8/WK4VLoG7LzO+ZWO18GgBGY=;
        b=JIy+azGNeXNIeGZcbTheNvvLUgrGldNjpNaGaM3ALED7rlJRkUN2qhFOvmNdMlsQTL
         lpvjcHM4QxiM6FHMBfEm5CyLXT1NK/GEAYuxqLv3Z9uuQOjzdTGwRc6Y/BVFuIjYXOvX
         vQpbQPLtmbLp9bNGtDTuz77/akfCiEUHyZlSY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1nbRHvdkP0hLRgTfexh8/WK4VLoG7LzO+ZWO18GgBGY=;
        b=rgQCL+qXRTkJKC/dgPjWz5KrZtCGhahs6uYLY9VZ71slTVWUfo/DB0zu8SXX8QDY49
         18zI+M7YLIRktOn7qdjIHt2F4c9FLFW31nu97qg0Y9WdXbbp77S8gtRT5BzV7953t3Vs
         Nrc7BAJ3wk6fDJO8wknwbdD8MPDc/6f7w41A4xIKahNiT/UdPDI9v5j37/4XvVeStWfK
         pYT8XMnbLyKJapSjm51W3XNfuVOo84JpvxEZMcpF7nBtJus2W+sFHtLlqk84iFll3xV7
         n5RJ70BIOPO31xlfwbZ9pX2gejTnuR2zWhF3D4jLldiSegFQBrm8NapZsWHXKZRE1xQ7
         4RDw==
X-Gm-Message-State: APjAAAXDVjn3Ao22rqGjpB/KixYpB0Ug4PiIg4/OW82ClFzIf96E6hGi
        Q5cxBF/AK/6kf/93E4FbnnL2kg==
X-Google-Smtp-Source: APXvYqyDf/uqUpunrIdThbIZ4cH4pyFIFN3uzZeKRVVjjgeaa0B/Fvs16WgmKVIpv6TQIIpIckuNjw==
X-Received: by 2002:a92:c851:: with SMTP id b17mr15412044ilq.160.1575674097972;
        Fri, 06 Dec 2019 15:14:57 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.57
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Dec 2019 15:14:57 -0800 (PST)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 4/6] drm/msm/dpu: Remove unnecessary NULL check
Date:   Fri,  6 Dec 2019 16:13:46 -0700
Message-Id: <20191206161137.4.Ia99f646171bd2099e8710c4dc2f3825850d38737@changeid>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
References: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_encoder_virt.phys_encs[0:num_phys_encs-1] will not be NULL so don't
check.

Also fix multiline strings that caused checkpatch warning.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 162 ++++++++------------
 1 file changed, 61 insertions(+), 101 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 45a87757e766..e9f8fe66af7b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -233,7 +233,7 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
 	u32 irq_status;
 	int ret;
 
-	if (!phys_enc || !wait_info || intr_idx >= INTR_IDX_MAX) {
+	if (!wait_info || intr_idx >= INTR_IDX_MAX) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -308,7 +308,7 @@ int dpu_encoder_helper_register_irq(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_irq *irq;
 	int ret = 0;
 
-	if (!phys_enc || intr_idx >= INTR_IDX_MAX) {
+	if (intr_idx >= INTR_IDX_MAX) {
 		DPU_ERROR("invalid params\n");
 		return -EINVAL;
 	}
@@ -363,10 +363,6 @@ int dpu_encoder_helper_unregister_irq(struct dpu_encoder_phys *phys_enc,
 	struct dpu_encoder_irq *irq;
 	int ret;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return -EINVAL;
-	}
 	irq = &phys_enc->irq[intr_idx];
 
 	/* silently skip irqs that weren't registered */
@@ -415,7 +411,7 @@ void dpu_encoder_get_hw_resources(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.get_hw_resources)
+		if (phys->ops.get_hw_resources)
 			phys->ops.get_hw_resources(phys, hw_res);
 	}
 }
@@ -438,7 +434,7 @@ static void dpu_encoder_destroy(struct drm_encoder *drm_enc)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.destroy) {
+		if (phys->ops.destroy) {
 			phys->ops.destroy(phys);
 			--dpu_enc->num_phys_encs;
 			dpu_enc->phys_encs[i] = NULL;
@@ -464,7 +460,7 @@ void dpu_encoder_helper_split_config(
 	struct dpu_hw_mdp *hw_mdptop;
 	struct msm_display_info *disp_info;
 
-	if (!phys_enc || !phys_enc->hw_mdptop || !phys_enc->parent) {
+	if (!phys_enc->hw_mdptop || !phys_enc->parent) {
 		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
 		return;
 	}
@@ -528,16 +524,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct drm_display_mode *mode)
 {
 	struct msm_display_topology topology;
-	int i, intf_count = 0;
-
-	for (i = 0; i < MAX_PHYS_ENCODERS_PER_VIRTUAL; i++)
-		if (dpu_enc->phys_encs[i])
-			intf_count++;
 
 	/* User split topology for width > 1080 */
 	topology.num_lm = (mode->vdisplay > MAX_VDISPLAY_SPLIT) ? 2 : 1;
 	topology.num_enc = 0;
-	topology.num_intf = intf_count;
+	topology.num_intf = dpu_enc->num_phys_encs;
 
 	return topology;
 }
@@ -583,10 +574,10 @@ static int dpu_encoder_virt_atomic_check(
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.atomic_check)
+		if (phys->ops.atomic_check)
 			ret = phys->ops.atomic_check(phys, crtc_state,
 					conn_state);
-		else if (phys && phys->ops.mode_fixup)
+		else if (phys->ops.mode_fixup)
 			if (!phys->ops.mode_fixup(phys, mode, adj_mode))
 				ret = -EINVAL;
 
@@ -682,7 +673,7 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.irq_control)
+		if (phys->ops.irq_control)
 			phys->ops.irq_control(phys, enable);
 	}
 
@@ -1032,46 +1023,43 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys) {
-			if (!dpu_enc->hw_pp[i]) {
-				DPU_ERROR_ENC(dpu_enc, "no pp block assigned"
-					     "at idx: %d\n", i);
-				goto error;
-			}
+		if (!dpu_enc->hw_pp[i]) {
+			DPU_ERROR_ENC(dpu_enc,
+				"no pp block assigned at idx: %d\n", i);
+			goto error;
+		}
 
-			if (!hw_ctl[i]) {
-				DPU_ERROR_ENC(dpu_enc, "no ctl block assigned"
-					     "at idx: %d\n", i);
-				goto error;
-			}
+		if (!hw_ctl[i]) {
+			DPU_ERROR_ENC(dpu_enc,
+				"no ctl block assigned at idx: %d\n", i);
+			goto error;
+		}
 
-			phys->hw_pp = dpu_enc->hw_pp[i];
-			phys->hw_ctl = hw_ctl[i];
+		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_ctl = hw_ctl[i];
 
-			dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
-					    DPU_HW_BLK_INTF);
-			for (j = 0; j < MAX_CHANNELS_PER_ENC; j++) {
-				struct dpu_hw_intf *hw_intf;
+		dpu_rm_init_hw_iter(&hw_iter, drm_enc->base.id,
+				    DPU_HW_BLK_INTF);
+		for (j = 0; j < MAX_CHANNELS_PER_ENC; j++) {
+			struct dpu_hw_intf *hw_intf;
 
-				if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
-					break;
+			if (!dpu_rm_get_hw(&dpu_kms->rm, &hw_iter))
+				break;
 
-				hw_intf = (struct dpu_hw_intf *)hw_iter.hw;
-				if (hw_intf->idx == phys->intf_idx)
-					phys->hw_intf = hw_intf;
-			}
+			hw_intf = (struct dpu_hw_intf *)hw_iter.hw;
+			if (hw_intf->idx == phys->intf_idx)
+				phys->hw_intf = hw_intf;
+		}
 
-			if (!phys->hw_intf) {
-				DPU_ERROR_ENC(dpu_enc,
-					      "no intf block assigned at idx: %d\n",
-					      i);
+		if (!phys->hw_intf) {
+			DPU_ERROR_ENC(dpu_enc,
+				      "no intf block assigned at idx: %d\n", i);
 				goto error;
-			}
-
-			phys->connector = conn->state->connector;
-			if (phys->ops.mode_set)
-				phys->ops.mode_set(phys, mode, adj_mode);
 		}
+
+		phys->connector = conn->state->connector;
+		if (phys->ops.mode_set)
+			phys->ops.mode_set(phys, mode, adj_mode);
 	}
 
 	dpu_enc->mode_set_complete = true;
@@ -1203,7 +1191,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.disable)
+		if (phys->ops.disable)
 			phys->ops.disable(phys);
 	}
 
@@ -1216,8 +1204,7 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	dpu_encoder_resource_control(drm_enc, DPU_ENC_RC_EVENT_STOP);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		if (dpu_enc->phys_encs[i])
-			dpu_enc->phys_encs[i]->connector = NULL;
+		dpu_enc->phys_encs[i]->connector = NULL;
 	}
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
@@ -1307,7 +1294,7 @@ void dpu_encoder_toggle_vblank_for_crtc(struct drm_encoder *drm_enc,
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->ops.control_vblank_irq)
+		if (phys->ops.control_vblank_irq)
 			phys->ops.control_vblank_irq(phys, enable);
 	}
 }
@@ -1463,11 +1450,6 @@ void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_hw_ctl *ctl;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
-
 	ctl = phys_enc->hw_ctl;
 	if (ctl->ops.trigger_start) {
 		ctl->ops.trigger_start(ctl);
@@ -1506,10 +1488,6 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 	struct dpu_hw_ctl *ctl;
 	int rc;
 
-	if (!phys_enc) {
-		DPU_ERROR("invalid encoder\n");
-		return;
-	}
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 	ctl = phys_enc->hw_ctl;
 
@@ -1550,7 +1528,7 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (!phys || phys->enable_state == DPU_ENC_DISABLED)
+		if (phys->enable_state == DPU_ENC_DISABLED)
 			continue;
 
 		ctl = phys->hw_ctl;
@@ -1601,17 +1579,15 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
 
-		if (phys) {
-			ctl = phys->hw_ctl;
-			if (ctl->ops.clear_pending_flush)
-				ctl->ops.clear_pending_flush(ctl);
+		ctl = phys->hw_ctl;
+		if (ctl->ops.clear_pending_flush)
+			ctl->ops.clear_pending_flush(ctl);
 
-			/* update only for command mode primary ctl */
-			if ((phys == dpu_enc->cur_master) &&
-			   (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE)
-			    && ctl->ops.trigger_pending)
-				ctl->ops.trigger_pending(ctl);
-		}
+		/* update only for command mode primary ctl */
+		if ((phys == dpu_enc->cur_master) &&
+		   (disp_info->capabilities & MSM_DISPLAY_CAP_CMD_MODE)
+		    && ctl->ops.trigger_pending)
+			ctl->ops.trigger_pending(ctl);
 	}
 }
 
@@ -1771,12 +1747,10 @@ void dpu_encoder_prepare_for_kickoff(struct drm_encoder *drm_enc)
 	DPU_ATRACE_BEGIN("enc_prepare_for_kickoff");
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
-		if (phys) {
-			if (phys->ops.prepare_for_kickoff)
-				phys->ops.prepare_for_kickoff(phys);
-			if (phys->enable_state == DPU_ENC_ERR_NEEDS_HW_RESET)
-				needs_hw_reset = true;
-		}
+		if (phys->ops.prepare_for_kickoff)
+			phys->ops.prepare_for_kickoff(phys);
+		if (phys->enable_state == DPU_ENC_ERR_NEEDS_HW_RESET)
+			needs_hw_reset = true;
 	}
 	DPU_ATRACE_END("enc_prepare_for_kickoff");
 
@@ -1817,7 +1791,7 @@ void dpu_encoder_kickoff(struct drm_encoder *drm_enc)
 	/* allow phys encs to handle any post-kickoff business */
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
-		if (phys && phys->ops.handle_post_kickoff)
+		if (phys->ops.handle_post_kickoff)
 			phys->ops.handle_post_kickoff(phys);
 	}
 
@@ -1846,7 +1820,7 @@ void dpu_encoder_prepare_commit(struct drm_encoder *drm_enc)
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
-		if (phys && phys->ops.prepare_commit)
+		if (phys->ops.prepare_commit)
 			phys->ops.prepare_commit(phys);
 	}
 }
@@ -1861,9 +1835,6 @@ static int _dpu_encoder_status_show(struct seq_file *s, void *data)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (!phys)
-			continue;
-
 		seq_printf(s, "intf:%d    vsync:%8d     underrun:%8d    ",
 				phys->intf_idx - INTF_0,
 				atomic_read(&phys->vsync_cnt),
@@ -1922,8 +1893,7 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 		dpu_enc->debugfs_root, dpu_enc, &debugfs_status_fops);
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++)
-		if (dpu_enc->phys_encs[i] &&
-				dpu_enc->phys_encs[i]->ops.late_register)
+		if (dpu_enc->phys_encs[i]->ops.late_register)
 			dpu_enc->phys_encs[i]->ops.late_register(
 					dpu_enc->phys_encs[i],
 					dpu_enc->debugfs_root);
@@ -2092,11 +2062,8 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys) {
-			atomic_set(&phys->vsync_cnt, 0);
-			atomic_set(&phys->underrun_cnt, 0);
-		}
+		atomic_set(&phys->vsync_cnt, 0);
+		atomic_set(&phys->underrun_cnt, 0);
 	}
 	mutex_unlock(&dpu_enc->enc_lock);
 
@@ -2238,8 +2205,6 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-		if (!phys)
-			continue;
 
 		switch (event) {
 		case MSM_ENC_COMMIT_DONE:
@@ -2272,7 +2237,6 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
 enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
-	int i;
 
 	if (!encoder) {
 		DPU_ERROR("invalid encoder\n");
@@ -2283,12 +2247,8 @@ enum dpu_intf_mode dpu_encoder_get_intf_mode(struct drm_encoder *encoder)
 	if (dpu_enc->cur_master)
 		return dpu_enc->cur_master->intf_mode;
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys)
-			return phys->intf_mode;
-	}
+	if (dpu_enc->num_phys_encs)
+		return dpu_enc->phys_encs[0]->intf_mode;
 
 	return INTF_MODE_NONE;
 }
-- 
2.21.0

