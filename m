Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 333EA65B467
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jan 2023 16:47:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236008AbjABPrz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Jan 2023 10:47:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbjABPrw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Jan 2023 10:47:52 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10B8665A6
        for <linux-arm-msm@vger.kernel.org>; Mon,  2 Jan 2023 07:47:51 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id x11so4981442ljh.12
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Jan 2023 07:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3X4rS6IqtlOWNA27c1QwOJm/MJFS9Uk/57wqKVZrpek=;
        b=N+vnpILuMrT0941oMT9dsnWm26ZvY0h2Ue2PZa4+OkRbPGzxg+lTGa4nI/QBvIq7XE
         tCBjfLCBSagUHy6ofRTiBBPSUiRuzY8xcozAIEiKaEDhg/xjihrcfEupn7fBMpX6vafd
         eflB+MjIPWIAR6SiKAczsjL5rWA5LGqaxAdWtsn4fAMpBfTEgoQUpDmAveUFiwCup0wB
         AnOJdUy73yz07sCh7hs40LlmZNc9+WUmADN0uTL/o1+ViJjpjkoFTf72xKKPoeXqSwb+
         1+Z0vWrCRWg03haw1vxJag5Q6tCphNyjADt6T7eNGOEMIvUoAZVBk/9qNu/JG/3bt//3
         s2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3X4rS6IqtlOWNA27c1QwOJm/MJFS9Uk/57wqKVZrpek=;
        b=fnVm3tzzg36LB0kDq/rjBrLQeg7IS2E0OI4Vk3ogB0OObQLgyDYKnKzPAqup7C55vR
         JoFCtH66lMe48YukxSl/a7EsbvFOGFxEAgKvyNkPeWOaGK2CNeQwENi6t0q7dZrtBnId
         OUkZt4dI5mzPXFFb0DyV3r/7uUvN8kjeFkmuh98MnYHjdMvmEoCHXXLbLEnbgaV2/GI7
         gVSyLEmYfM3jNgiHZ8VNVoYpFiKUt9qKVF8D50TDyEIYXM5t9gdeahItOJhruTpkwd9X
         aEHBlaP0NRyRAhHLhOeYdPu7c5hGEyQkAGQWKqoMBF3Pthb01+CioCfcZLkpLrmfc2Xf
         ITlg==
X-Gm-Message-State: AFqh2kqVRaYO/pwpnSm1xy7XQImWxe2qgrtfoC1eVbsfteVrbezty2Vi
        EwtmvuHRqBp4Pr4KLsEnPWagAA==
X-Google-Smtp-Source: AMrXdXs3K7FUqD1uVevHvgnPfDqHLT7siin2aHJwBI/y4nWkIxWRXtrwGfuSe38tGQZtF3WPM7nJvA==
X-Received: by 2002:a05:651c:149:b0:27f:f268:d737 with SMTP id c9-20020a05651c014900b0027ff268d737mr919095ljd.40.1672674469263;
        Mon, 02 Jan 2023 07:47:49 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id s24-20020a2eb638000000b00279cbcfd7dbsm3290054ljn.30.2023.01.02.07.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jan 2023 07:47:48 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH 1/2] drm/msm/dpu: remove dpu_encoder_virt_ops
Date:   Mon,  2 Jan 2023 17:47:47 +0200
Message-Id: <20230102154748.951328-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Struct dpu_encoder_virt_ops is used to provide several callbacks to the
phys_enc backends. However these ops are static and are not supposed to
change in the foreseeble future. Drop the indirection and call
corresponding functions directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 17 ++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 47 ++++++++++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 17 ++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 11 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 13 ++---
 5 files changed, 40 insertions(+), 65 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9c6817b5a194..84f8c8a1b049 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -340,9 +340,7 @@ void dpu_encoder_helper_report_irq_timeout(struct dpu_encoder_phys *phys_enc,
 			phys_enc->intf_idx - INTF_0, phys_enc->wb_idx - WB_0,
 			phys_enc->hw_pp->idx - PINGPONG_0, intr_idx);
 
-	if (phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(
-				phys_enc->parent, phys_enc,
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
 				DPU_ENCODER_FRAME_EVENT_ERROR);
 }
 
@@ -1284,7 +1282,7 @@ static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
 	return WB_MAX;
 }
 
-static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
+void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = NULL;
@@ -1306,7 +1304,7 @@ static void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 	DPU_ATRACE_END("encoder_vblank_callback");
 }
 
-static void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
+void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
 	if (!phy_enc)
@@ -1382,7 +1380,7 @@ void dpu_encoder_register_frame_event_callback(struct drm_encoder *drm_enc,
 	spin_unlock_irqrestore(&dpu_enc->enc_spinlock, lock_flags);
 }
 
-static void dpu_encoder_frame_done_callback(
+void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event)
 {
@@ -2233,12 +2231,6 @@ static int dpu_encoder_virt_add_phys_encs(
 	return 0;
 }
 
-static const struct dpu_encoder_virt_ops dpu_encoder_parent_ops = {
-	.handle_vblank_virt = dpu_encoder_vblank_callback,
-	.handle_underrun_virt = dpu_encoder_underrun_callback,
-	.handle_frame_done = dpu_encoder_frame_done_callback,
-};
-
 static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 				 struct dpu_kms *dpu_kms,
 				 struct msm_display_info *disp_info)
@@ -2258,7 +2250,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 	memset(&phys_params, 0, sizeof(phys_params));
 	phys_params.dpu_kms = dpu_kms;
 	phys_params.parent = &dpu_enc->base;
-	phys_params.parent_ops = &dpu_encoder_parent_ops;
 	phys_params.enc_spinlock = &dpu_enc->enc_spinlock;
 
 	switch (disp_info->intf_type) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index f2af07d87f56..1d434b22180d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -60,25 +60,6 @@ enum dpu_enc_enable_state {
 
 struct dpu_encoder_phys;
 
-/**
- * struct dpu_encoder_virt_ops - Interface the containing virtual encoder
- *	provides for the physical encoders to use to callback.
- * @handle_vblank_virt:	Notify virtual encoder of vblank IRQ reception
- *			Note: This is called from IRQ handler context.
- * @handle_underrun_virt: Notify virtual encoder of underrun IRQ reception
- *			Note: This is called from IRQ handler context.
- * @handle_frame_done:	Notify virtual encoder that this phys encoder
- *			completes last request frame.
- */
-struct dpu_encoder_virt_ops {
-	void (*handle_vblank_virt)(struct drm_encoder *,
-			struct dpu_encoder_phys *phys);
-	void (*handle_underrun_virt)(struct drm_encoder *,
-			struct dpu_encoder_phys *phys);
-	void (*handle_frame_done)(struct drm_encoder *,
-			struct dpu_encoder_phys *phys, u32 event);
-};
-
 /**
  * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
  *	the containing virtual encoder.
@@ -199,7 +180,6 @@ enum dpu_intr_idx {
 struct dpu_encoder_phys {
 	struct drm_encoder *parent;
 	struct dpu_encoder_phys_ops ops;
-	const struct dpu_encoder_virt_ops *parent_ops;
 	struct dpu_hw_mdp *hw_mdptop;
 	struct dpu_hw_ctl *hw_ctl;
 	struct dpu_hw_pingpong *hw_pp;
@@ -283,7 +263,6 @@ struct dpu_encoder_phys_cmd {
 struct dpu_enc_phys_init_params {
 	struct dpu_kms *dpu_kms;
 	struct drm_encoder *parent;
-	const struct dpu_encoder_virt_ops *parent_ops;
 	enum dpu_enc_split_role split_role;
 	enum dpu_intf intf_idx;
 	enum dpu_wb wb_idx;
@@ -400,4 +379,30 @@ int dpu_encoder_helper_wait_for_irq(struct dpu_encoder_phys *phys_enc,
  */
 void dpu_encoder_helper_phys_cleanup(struct dpu_encoder_phys *phys_enc);
 
+/**
+ * dpu_encoder_vblank_callback - Notify virtual encoder of vblank IRQ reception
+ * @drm_enc:    Pointer to drm encoder structure
+ * @phys_enc:	Pointer to physical encoder
+ * Note: This is called from IRQ handler context.
+ */
+void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
+				 struct dpu_encoder_phys *phy_enc);
+
+/** dpu_encoder_underrun_callback - Notify virtual encoder of underrun IRQ reception
+ * @drm_enc:    Pointer to drm encoder structure
+ * @phys_enc:	Pointer to physical encoder
+ * Note: This is called from IRQ handler context.
+ */
+void dpu_encoder_underrun_callback(struct drm_encoder *drm_enc,
+				   struct dpu_encoder_phys *phy_enc);
+
+/** dpu_encoder_frame_done_callback -- Notify virtual encoder that this phys encoder completes last request frame
+ * @drm_enc:    Pointer to drm encoder structure
+ * @phys_enc:	Pointer to physical encoder
+ * @event:	Event to process
+ */
+void dpu_encoder_frame_done_callback(
+		struct drm_encoder *drm_enc,
+		struct dpu_encoder_phys *ready_phys, u32 event);
+
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index ae28b2b93e69..41bd7dd2b482 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -83,9 +83,7 @@ static void dpu_encoder_phys_cmd_pp_tx_done_irq(void *arg, int irq_idx)
 
 	DPU_ATRACE_BEGIN("pp_done_irq");
 	/* notify all synchronous clients first, then asynchronous clients */
-	if (phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(phys_enc->parent,
-				phys_enc, event);
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, event);
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	new_cnt = atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -111,9 +109,7 @@ static void dpu_encoder_phys_cmd_pp_rd_ptr_irq(void *arg, int irq_idx)
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-	if (phys_enc->parent_ops->handle_vblank_virt)
-		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
-			phys_enc);
+	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
 
 	atomic_add_unless(&cmd_enc->pending_vblank_cnt, -1, 0);
 	wake_up_all(&cmd_enc->pending_vblank_wq);
@@ -137,9 +133,7 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (phys_enc->parent_ops->handle_underrun_virt)
-		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
-			phys_enc);
+	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
 static void dpu_encoder_phys_cmd_atomic_mode_set(
@@ -202,9 +196,7 @@ static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 	/* request a ctl reset before the next kickoff */
 	phys_enc->enable_state = DPU_ENC_ERR_NEEDS_HW_RESET;
 
-	if (phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(
-				drm_enc, phys_enc, frame_event);
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
 
 	return -ETIMEDOUT;
 }
@@ -780,7 +772,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->parent = p->parent;
-	phys_enc->parent_ops = p->parent_ops;
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_CMD;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 0f71e8fe7be7..39ca1b305114 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -308,9 +308,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 
 	DPU_ATRACE_BEGIN("vblank_irq");
 
-	if (phys_enc->parent_ops->handle_vblank_virt)
-		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
-				phys_enc);
+	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
 
 	atomic_read(&phys_enc->pending_kickoff_cnt);
 
@@ -330,7 +328,7 @@ static void dpu_encoder_phys_vid_vblank_irq(void *arg, int irq_idx)
 	/* Signal any waiting atomic commit thread */
 	wake_up_all(&phys_enc->pending_kickoff_wq);
 
-	phys_enc->parent_ops->handle_frame_done(phys_enc->parent, phys_enc,
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc,
 			DPU_ENCODER_FRAME_EVENT_DONE);
 
 	DPU_ATRACE_END("vblank_irq");
@@ -340,9 +338,7 @@ static void dpu_encoder_phys_vid_underrun_irq(void *arg, int irq_idx)
 {
 	struct dpu_encoder_phys *phys_enc = arg;
 
-	if (phys_enc->parent_ops->handle_underrun_virt)
-		phys_enc->parent_ops->handle_underrun_virt(phys_enc->parent,
-			phys_enc);
+	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
 static bool dpu_encoder_phys_vid_needs_single_flush(
@@ -700,7 +696,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->parent = p->parent;
-	phys_enc->parent_ops = p->parent_ops;
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 7cbcef6efe17..c5146b6477d6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -365,13 +365,9 @@ static void _dpu_encoder_phys_wb_frame_done_helper(void *arg)
 
 	DPU_DEBUG("[wb:%d]\n", hw_wb->idx - WB_0);
 
-	if (phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(phys_enc->parent,
-				phys_enc, event);
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, event);
 
-	if (phys_enc->parent_ops->handle_vblank_virt)
-		phys_enc->parent_ops->handle_vblank_virt(phys_enc->parent,
-				phys_enc);
+	dpu_encoder_vblank_callback(phys_enc->parent, phys_enc);
 
 	spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 	atomic_add_unless(&phys_enc->pending_kickoff_cnt, -1, 0);
@@ -441,9 +437,7 @@ static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 	if (wb_enc->wb_conn)
 		drm_writeback_signal_completion(wb_enc->wb_conn, 0);
 
-	if (phys_enc->parent_ops->handle_frame_done)
-		phys_enc->parent_ops->handle_frame_done(
-				phys_enc->parent, phys_enc, frame_event);
+	dpu_encoder_frame_done_callback(phys_enc->parent, phys_enc, frame_event);
 }
 
 /**
@@ -723,7 +717,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->parent = p->parent;
-	phys_enc->parent_ops = p->parent_ops;
 	phys_enc->dpu_kms = p->dpu_kms;
 	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-- 
2.39.0

