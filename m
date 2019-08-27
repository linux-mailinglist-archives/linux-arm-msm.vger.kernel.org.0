Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6D59F58A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:50:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725976AbfH0Vuo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:50:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:44261 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfH0Vuo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:50:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id t14so177962plr.11;
        Tue, 27 Aug 2019 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4aREPVUJAE3wJMTq0SKsAn5ZXXhvSa4MM06jPfKs0zg=;
        b=BE9fQgG0SPdpbj1CmdPkgTysBwpST6VV/oPjvbzf+J6ngdyqpsnvWhCBjxb2cjPgRa
         EmbwVqxEVl9utIDgXW/pB/OZXZ/Ijq6igFsDKOJCv/fk9S2D+i74UBpOL446NI4MT108
         SZyPgDFW6E8exva9ogjC/SFMmyv5g8dvWOnzmKhEbzcEd3UMd4MWC9+CCU+vIvqS5xSE
         lyGvm+bLHF5mLQPgli8sueMven2oLKyyORKW919bAjRwVCHxHxC2qiQy0ezAceCJ6hcU
         ZcEjg6xnoLFozhkmy/30LZkVDx4Xi7UZxlp8ewi5c2laYqmmX4C9TtlQKAkra9FoAVZL
         qdUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4aREPVUJAE3wJMTq0SKsAn5ZXXhvSa4MM06jPfKs0zg=;
        b=jFzs569oG4J5yObq5MdAkVJ6bevO+k/n3Y0YjEaH/DUQOiwTCEXiepjKgujp8YCApy
         O1oPxGGIkBLN1wimtTPiF3L1XGBBkgQMGCI0v854Bc0QijACRINbDNLOMnC6MWeGgMAa
         LJrkoUadyQUsg3Lg5Y5dlkwvhghO7/H3lm/7Al3FDboemMJjLX1czXQ66DdZjESHH/W7
         cgWiCkcvYPm/22x85ysRKM4SD3uzrD/8milEoTQgaI2xoEDZVjDEWMpSWgz/QaLU5/0O
         nDad3rkEQEmCOEgiecoI2VvWbNKCGIPl8rLlpx39P9/9v6/RCzQSAXaBDPuF0AMK6WXj
         jDwA==
X-Gm-Message-State: APjAAAXMSDjOBSDw31o4ssCaHaULoDd7/Sr1cKNKa2X1mmUYvzwhBqjZ
        WoQ4rDP3i+V+BjgrnhNsl7k=
X-Google-Smtp-Source: APXvYqyZdAKl5zA4VN2QFCbDCL1mGWtSvdqVd6uaU80oAaOo819B7xX7AiPNynAkkYh+P6478UvRug==
X-Received: by 2002:a17:902:ff16:: with SMTP id f22mr1058262plj.178.1566942213188;
        Tue, 27 Aug 2019 14:43:33 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id l3sm171989pjq.18.2019.08.27.14.43.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:43:32 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/9] drm/msm/dpu: handle_frame_done() from vblank irq
Date:   Tue, 27 Aug 2019 14:33:33 -0700
Message-Id: <20190827213421.21917-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190827213421.21917-1-robdclark@gmail.com>
References: <20190827213421.21917-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Previously the callback was called from whoever called wait_for_vblank(),
but that isn't a great plan when wait_for_vblank() stops getting called,
and results in frame_done_timer expiring.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  7 +-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 25 ++++++-------------
 2 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c3f7154017c4..e7354aef9805 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -311,12 +311,7 @@ static void dpu_crtc_frame_event_work(struct kthread_work *work)
 				| DPU_ENCODER_FRAME_EVENT_PANEL_DEAD)) {
 
 		if (atomic_read(&dpu_crtc->frame_pending) < 1) {
-			/* this should not happen */
-			DRM_ERROR("crtc%d ev:%u ts:%lld frame_pending:%d\n",
-					crtc->base.id,
-					fevent->event,
-					ktime_to_ns(fevent->ts),
-					atomic_read(&dpu_crtc->frame_pending));
+			/* ignore vblank when not pending */
 		} else if (atomic_dec_return(&dpu_crtc->frame_pending) == 0) {
 			/* release bandwidth and other resources */
 			trace_dpu_crtc_frame_event_done(DRMID(crtc),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 7c73b09894f0..b9c84fb4d4a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -324,6 +324,10 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 
 	/* Signal any waiting atomic commit thread */
 	wake_up_all(&phys_enc->pending_kickoff_wq);
+
+	phys_enc->parent_ops->handle_frame_done(phys_enc->parent, phys_enc,
+			DPU_ENCODER_FRAME_EVENT_DONE);
+
 	DPU_ATRACE_END("vblank_irq");
 }
 
@@ -483,8 +487,8 @@ static void dpu_encoder_phys_vid_get_hw_resources(
 	hw_res->intfs[phys_enc->intf_idx - INTF_0] = INTF_MODE_VIDEO;
 }
 
-static int _dpu_encoder_phys_vid_wait_for_vblank(
-		struct dpu_encoder_phys *phys_enc, bool notify)
+static int dpu_encoder_phys_vid_wait_for_vblank(
+		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_wait_info wait_info;
 	int ret;
@@ -499,10 +503,6 @@ static int _dpu_encoder_phys_vid_wait_for_vblank(
 	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
 
 	if (!dpu_encoder_phys_vid_is_master(phys_enc)) {
-		if (notify && phys_enc->parent_ops->handle_frame_done)
-			phys_enc->parent_ops->handle_frame_done(
-					phys_enc->parent, phys_enc,
-					DPU_ENCODER_FRAME_EVENT_DONE);
 		return 0;
 	}
 
@@ -512,20 +512,11 @@ static int _dpu_encoder_phys_vid_wait_for_vblank(
 
 	if (ret == -ETIMEDOUT) {
 		dpu_encoder_helper_report_irq_timeout(phys_enc, INTR_IDX_VSYNC);
-	} else if (!ret && notify && phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(
-				phys_enc->parent, phys_enc,
-				DPU_ENCODER_FRAME_EVENT_DONE);
+	}
 
 	return ret;
 }
 
-static int dpu_encoder_phys_vid_wait_for_vblank(
-		struct dpu_encoder_phys *phys_enc)
-{
-	return _dpu_encoder_phys_vid_wait_for_vblank(phys_enc, true);
-}
-
 static int dpu_encoder_phys_vid_wait_for_commit_done(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -615,7 +606,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	 * scanout buffer) don't latch properly..
 	 */
 	if (dpu_encoder_phys_vid_is_master(phys_enc)) {
-		ret = _dpu_encoder_phys_vid_wait_for_vblank(phys_enc, false);
+		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
 		if (ret) {
 			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
-- 
2.21.0

