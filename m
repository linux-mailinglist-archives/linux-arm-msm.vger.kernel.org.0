Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5B39115987
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Dec 2019 00:14:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726377AbfLFXOu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Dec 2019 18:14:50 -0500
Received: from mail-io1-f68.google.com ([209.85.166.68]:41220 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbfLFXOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Dec 2019 18:14:50 -0500
Received: by mail-io1-f68.google.com with SMTP id z26so9016706iot.8
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Dec 2019 15:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tV+LQltIxtrwT9i6U9Zs1LuxslYBuD7ZjJ2pCIUfQo=;
        b=fkLpPdL6h40+44pP3LdTIKjR5KGwjlMFtmRar8gh1SfkE1OqhIxuNrlm3PXr894UmN
         49SBwmZ9Jme9kuleURRwZ6bYCMueNQ2cpoKSpzm2T/YhfqJvEnU/eu1tjmjj4WHbNgjw
         pJBEC+lzwiSaxrQAjrdEk6z6NkVEyRskgp0KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2tV+LQltIxtrwT9i6U9Zs1LuxslYBuD7ZjJ2pCIUfQo=;
        b=Wr3c/ySYNZzYpZQ5PtnY7w+a38Ua78SjpzZytpjrcwpJNyv7MtZX4ZLciislg9+TkS
         +Vy5yhJG843nL1AnMPzOJcYhcpEXMC0DQxzcfKZxrsS5UlYQpkq34Z0YxLeUgGE63EJb
         qfv5yhUjNoEVKyEYBkfh9EIM4BUBdUFddtQ2uU5rUqInX5/CndWGcXBIfF4gcrHTJaEp
         Imr6b4MClBGUkZvwz5omhbJkawtRolN0aIr/Z+pCP2P8pbLm9VY+i8FS59YwQ0k/vtN9
         /9UnBOqE5H8OXvk4jnrjG3NIysiWVsoxuAxcJkRbrourrte+Je5EfbVh21ELjvlBJUPk
         IbPQ==
X-Gm-Message-State: APjAAAWoD/n6AeBfuFILA/KZvvgit+DxZ4KRIxBeVJu3I9M1LC/uQ1zf
        y9R9ajJUszf3uVDVmuxMzJ6xqA==
X-Google-Smtp-Source: APXvYqxBN4bGzXyzVPfRdGmlPO8puYZX1U7xJR3GIbWwdz3Q1onKIW9w5WnD5t+2ZdImhlkciCGF2Q==
X-Received: by 2002:a6b:9204:: with SMTP id u4mr11566798iod.99.1575674089530;
        Fri, 06 Dec 2019 15:14:49 -0800 (PST)
Received: from ddavenport4.bld.corp.google.com ([2620:15c:183:0:92f:a80a:519d:f777])
        by smtp.gmail.com with ESMTPSA id b15sm4317946ilo.37.2019.12.06.15.14.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 06 Dec 2019 15:14:49 -0800 (PST)
From:   Drew Davenport <ddavenport@chromium.org>
To:     dri-devel@lists.freedesktop.org
Cc:     Drew Davenport <ddavenport@chromium.org>,
        David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>,
        zhengbin <zhengbin13@huawei.com>,
        Bruce Wang <bzwang@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Alexios Zavras <alexios.zavras@intel.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Fritz Koenig <frkoenig@google.com>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 1/6] drm/msm/dpu: Remove unnecessary NULL checks
Date:   Fri,  6 Dec 2019 16:13:43 -0700
Message-Id: <20191206161137.1.Ibb7612c1ebcebe3f560b3269150c0e0363f01e44@changeid>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

dpu_hw_ctl* is checked for NULL when passed as an argument
to several functions. It will never be NULL, so remove the
checks.

Signed-off-by: Drew Davenport <ddavenport@chromium.org>
---

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c          | 10 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 12 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c |  8 +++-----
 3 files changed, 13 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f96e142c4361..45a87757e766 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1419,7 +1419,7 @@ static void _dpu_encoder_trigger_flush(struct drm_encoder *drm_enc,
 	}
 
 	ctl = phys->hw_ctl;
-	if (!ctl || !ctl->ops.trigger_flush) {
+	if (!ctl->ops.trigger_flush) {
 		DPU_ERROR("missing trigger cb\n");
 		return;
 	}
@@ -1469,7 +1469,7 @@ void dpu_encoder_helper_trigger_start(struct dpu_encoder_phys *phys_enc)
 	}
 
 	ctl = phys_enc->hw_ctl;
-	if (ctl && ctl->ops.trigger_start) {
+	if (ctl->ops.trigger_start) {
 		ctl->ops.trigger_start(ctl);
 		trace_dpu_enc_trigger_start(DRMID(phys_enc->parent), ctl->idx);
 	}
@@ -1513,7 +1513,7 @@ static void dpu_encoder_helper_hw_reset(struct dpu_encoder_phys *phys_enc)
 	dpu_enc = to_dpu_encoder_virt(phys_enc->parent);
 	ctl = phys_enc->hw_ctl;
 
-	if (!ctl || !ctl->ops.reset)
+	if (!ctl->ops.reset)
 		return;
 
 	DRM_DEBUG_KMS("id:%u ctl %d reset\n", DRMID(phys_enc->parent),
@@ -1554,8 +1554,6 @@ static void _dpu_encoder_kickoff_phys(struct dpu_encoder_virt *dpu_enc)
 			continue;
 
 		ctl = phys->hw_ctl;
-		if (!ctl)
-			continue;
 
 		/*
 		 * This is cleared in frame_done worker, which isn't invoked
@@ -1603,7 +1601,7 @@ void dpu_encoder_trigger_kickoff_pending(struct drm_encoder *drm_enc)
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		phys = dpu_enc->phys_encs[i];
 
-		if (phys && phys->hw_ctl) {
+		if (phys) {
 			ctl = phys->hw_ctl;
 			if (ctl->ops.clear_pending_flush)
 				ctl->ops.clear_pending_flush(ctl);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 047960949fbb..cfd01b0ac7f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -62,7 +62,7 @@ static void _dpu_encoder_phys_cmd_update_intf_cfg(
 		return;
 
 	ctl = phys_enc->hw_ctl;
-	if (!ctl || !ctl->ops.setup_intf_cfg)
+	if (!ctl->ops.setup_intf_cfg)
 		return;
 
 	intf_cfg.intf = phys_enc->intf_idx;
@@ -125,7 +125,7 @@ static void dpu_encoder_phys_cmd_ctl_start_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (!phys_enc || !phys_enc->hw_ctl)
+	if (!phys_enc)
 		return;
 
 	DPU_ATRACE_BEGIN("ctl_start_irq");
@@ -198,7 +198,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 	u32 frame_event = DPU_ENCODER_FRAME_EVENT_ERROR;
 	bool do_log = false;
 
-	if (!phys_enc || !phys_enc->hw_pp || !phys_enc->hw_ctl)
+	if (!phys_enc || !phys_enc->hw_pp)
 		return -EINVAL;
 
 	cmd_enc->pp_timeout_report_cnt++;
@@ -428,7 +428,7 @@ static void _dpu_encoder_phys_cmd_pingpong_config(
 	struct dpu_encoder_phys_cmd *cmd_enc =
 		to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (!phys_enc || !phys_enc->hw_ctl || !phys_enc->hw_pp
+	if (!phys_enc || !phys_enc->hw_pp
 			|| !phys_enc->hw_ctl->ops.setup_intf_cfg) {
 		DPU_ERROR("invalid arg(s), enc %d\n", phys_enc != 0);
 		return;
@@ -458,7 +458,7 @@ static void dpu_encoder_phys_cmd_enable_helper(
 	struct dpu_hw_ctl *ctl;
 	u32 flush_mask = 0;
 
-	if (!phys_enc || !phys_enc->hw_ctl || !phys_enc->hw_pp) {
+	if (!phys_enc || !phys_enc->hw_pp) {
 		DPU_ERROR("invalid arg(s), encoder %d\n", phys_enc != 0);
 		return;
 	}
@@ -614,7 +614,7 @@ static int _dpu_encoder_phys_cmd_wait_for_ctl_start(
 	struct dpu_encoder_wait_info wait_info;
 	int ret;
 
-	if (!phys_enc || !phys_enc->hw_ctl) {
+	if (!phys_enc) {
 		DPU_ERROR("invalid argument(s)\n");
 		return -EINVAL;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3123ef873cdf..2252475dd8dc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -297,8 +297,6 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 		return;
 
 	hw_ctl = phys_enc->hw_ctl;
-	if (!hw_ctl)
-		return;
 
 	DPU_ATRACE_BEGIN("vblank_irq");
 
@@ -314,7 +312,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	 * so we need to double-check with hw that it accepted the flush bits
 	 */
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
-	if (hw_ctl && hw_ctl->ops.get_flush_register)
+	if (hw_ctl->ops.get_flush_register)
 		flush_register = hw_ctl->ops.get_flush_register(hw_ctl);
 
 	if (!(flush_register & hw_ctl->ops.get_pending_flush(hw_ctl)))
@@ -549,7 +547,7 @@ static void dpu_encoder_phys_vid_prepare_for_kickoff(
 	}
 
 	ctl = phys_enc->hw_ctl;
-	if (!ctl || !ctl->ops.wait_reset_status)
+	if (!ctl->ops.wait_reset_status)
 		return;
 
 	/*
@@ -574,7 +572,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		return;
 	}
 
-	if (!phys_enc->hw_intf || !phys_enc->hw_ctl) {
+	if (!phys_enc->hw_intf) {
 		DPU_ERROR("invalid hw_intf %d hw_ctl %d\n",
 				phys_enc->hw_intf != 0, phys_enc->hw_ctl != 0);
 		return;
-- 
2.21.0

