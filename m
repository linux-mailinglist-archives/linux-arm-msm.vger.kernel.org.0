Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F3DC9A2186
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:55:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727144AbfH2Qz4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:55:56 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:45462 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727022AbfH2Qz4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:55:56 -0400
Received: by mail-pf1-f193.google.com with SMTP id w26so2443576pfq.12;
        Thu, 29 Aug 2019 09:55:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=q6Cjkast+lBr9o2h0UHBUjks7fxSvQpeWE7yoX/EM5I=;
        b=EAWk5vWbDIcCy9Dh51/RnZJvWOb6KQ9hDNfJxBsN6bxUSz5iLGuzlD3RL1RDF+DNut
         OvLxd3MEHj5sXrnJVH4n5XuIuDGaX9ckbvX45Vdr16/Ig5uz0YhPdSdvYLZU6GDdVSk+
         P65KmeDZkCfclBQ3W2Wt3Fg79M9h9/EcJSdScwWcSCBRRy0kHqGy54wei3ODpkX3j5jm
         j1LTi9J4EPt8pEVVBwQEl/kznii+oIWjFt3rziyTdyr9XS6UFrL0kx2bzIiiDw4TMI0D
         cG892Gur87uHyglF+M2SRj/ns10rPZf6dEZwHFb2P+EsuIDFg275I8Op0IoUQXYzA/X6
         AEpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=q6Cjkast+lBr9o2h0UHBUjks7fxSvQpeWE7yoX/EM5I=;
        b=A6VG4L7tNxWeKKsxJqm/CaGToF3MxsUMjkG6fZ2zIqaK6F66FDVmy0O29L6Lagrcwf
         icmZy+dRhkqR8quOSQpnbfybaIaTeStve9cWb/IznAkzuejA0Kw/IAsRTgY030ZO3TqZ
         lHCym+4b911uHgHpNAM+gpeBk5nysjFjpN4f2UAKqFtQ7fj5dn0tIR8nvh5TBSMUc/Zc
         UPhby3r/UI/BwVNOyf3MztmHLQrRs5P29KCgBM5lKSnBWGDMeoutxGL2Mx80c7qeVfv+
         MhnAkgebQ8etO2Vu/XkWeK2S1ivwqMyS2z8de0EybicBSngaNoh3KlLZ+BixmGUJY0yc
         Ge6g==
X-Gm-Message-State: APjAAAVBS7zTAPAhNQBFoZKFp6+Dvp7PyYLZjEGoYwTLNXws8jOFJooa
        FsbqQqs8CCPvigTOwJavnVE=
X-Google-Smtp-Source: APXvYqwk04ddvz7woByhdXiTit+cjj7gy6bccXcDBs0+OJ7ANBNi8ZRnULxIqfykkTBNvtJU4w9kww==
X-Received: by 2002:a63:db47:: with SMTP id x7mr9201448pgi.375.1567097755313;
        Thu, 29 Aug 2019 09:55:55 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id h17sm3789249pfo.24.2019.08.29.09.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:55:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>, Sean Paul <sean@poorly.run>,
        Rob Clark <robdclark@gmail.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 03/10] drm/msm/dpu: handle_frame_done() from vblank irq
Date:   Thu, 29 Aug 2019 09:45:11 -0700
Message-Id: <20190829164601.11615-4-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190829164601.11615-1-robdclark@gmail.com>
References: <20190829164601.11615-1-robdclark@gmail.com>
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
Reviewed-by: Sean Paul <sean@poorly.run>
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

