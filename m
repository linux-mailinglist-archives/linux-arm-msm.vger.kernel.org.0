Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3079B7B76D6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Oct 2023 05:19:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230045AbjJDDTL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Oct 2023 23:19:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229530AbjJDDTK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Oct 2023 23:19:10 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0C00AF
        for <linux-arm-msm@vger.kernel.org>; Tue,  3 Oct 2023 20:19:06 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2c17de836fbso19119391fa.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Oct 2023 20:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1696389545; x=1696994345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KSjHWoNUjbUR/rr+07ACORIedYYwRMMYATHihCLCO58=;
        b=tSczmbbqo1RA17C/NrMZI7R+j6NLtBcYDEvOMTh7ceWrBm0zzMdmX8i7XA+hOnrqXf
         FkzaTRiHGsGr9KQjFKBQfY9dLB/smC6rVgAYfQwa6CCbFYgvezZe0Cu5AtcdNsEDe3DN
         K77ECz9BcGaoUx9aCBBdXcpt5CM9b5zgWuviEwgBma/Fagz6/i0yiBJ+sMDwSrtFvqP2
         h58eLL8ewxoXxg7sI5RHiJG/5QIuGDCRa5tBz074P26goAMLvpwO6Q1X+KGPfNo0O2wN
         hbV4xGwJXYl/7doiSBoNWictqlpmlUgUs5ir07Zo/GsoStG0kwMxr/TQ5jqbYtlaANdL
         6/lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696389545; x=1696994345;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KSjHWoNUjbUR/rr+07ACORIedYYwRMMYATHihCLCO58=;
        b=swAomPP56/bwXKqoDk/lPD7o7jqffl15ZVchF1LvatmBDjkjNg+4LWXFcnfTGqf3VG
         7V5amY5QLHmqIWQGjsqimxna4RoQ+qZUe9g0dzbztxFaTcHKHT+2R5n3VYcmVJ1x3zrk
         cleSoZQYcEihKfCWQwtnfYO+dNrTHgmm7e0idCvJeXY4FzwIWQ0kTRTlFcOk7ftL7QhM
         qnsDKQqMm3pliQ4sUNycrCt+kTvW6m5xf63Sb41gBbqdDiAz+Lccqfk9wh9VBj7Kq3Gm
         O08s/4LFMw5l9MANmXXkZPZ5zrXSiHzD35gr5uWQBWhX2E2usJ5CCij6LdjL6d7OYUt9
         xfww==
X-Gm-Message-State: AOJu0YzkFr4wBImf1b7qIJFJc2LFxQdRaU3M0DLykfkxCH2Q05ulXv7V
        8E7z8o89k1r84+/BZmCrcwMI1+EY4r1IwzWWGSk=
X-Google-Smtp-Source: AGHT+IH/Sdf+B1sajD57r6zMUeuPKXAWSRNbLwR7DAfh6Nlk3TZKfhlJ6SqduGFUzTUkAWzyFH+uBg==
X-Received: by 2002:a2e:7d15:0:b0:2bb:b01a:9226 with SMTP id y21-20020a2e7d15000000b002bbb01a9226mr903948ljc.7.1696389544953;
        Tue, 03 Oct 2023 20:19:04 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id l5-20020a2e8685000000b002bffa125afesm486056lji.48.2023.10.03.20.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Oct 2023 20:19:04 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm/dpu: drop MSM_ENC_VBLANK support
Date:   Wed,  4 Oct 2023 06:19:03 +0300
Message-Id: <20231004031903.518223-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There are no in-kernel users of MSM_ENC_VBLANK wait type. Drop it
together with the corresponding wait_for_vblank callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  3 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  1 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 28 -------------------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  9 +++---
 drivers/gpu/drm/msm/msm_drv.h                 |  2 --
 5 files changed, 4 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index d34e684a4178..83045aa8ba01 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2429,9 +2429,6 @@ int dpu_encoder_wait_for_event(struct drm_encoder *drm_enc,
 		case MSM_ENC_TX_COMPLETE:
 			fn_wait = phys->ops.wait_for_tx_complete;
 			break;
-		case MSM_ENC_VBLANK:
-			fn_wait = phys->ops.wait_for_vblank;
-			break;
 		default:
 			DPU_ERROR_ENC(dpu_enc, "unknown wait event %d\n",
 					event);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index d48558ede488..c6cccab3bb6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -106,7 +106,6 @@ struct dpu_encoder_phys_ops {
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-	int (*wait_for_vblank)(struct dpu_encoder_phys *phys_enc);
 	void (*prepare_for_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index df88358e7037..285246837b73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -690,33 +690,6 @@ static int dpu_encoder_phys_cmd_wait_for_commit_done(
 	return _dpu_encoder_phys_cmd_wait_for_ctl_start(phys_enc);
 }
 
-static int dpu_encoder_phys_cmd_wait_for_vblank(
-		struct dpu_encoder_phys *phys_enc)
-{
-	int rc = 0;
-	struct dpu_encoder_phys_cmd *cmd_enc;
-	struct dpu_encoder_wait_info wait_info;
-
-	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
-
-	/* only required for master controller */
-	if (!dpu_encoder_phys_cmd_is_master(phys_enc))
-		return rc;
-
-	wait_info.wq = &cmd_enc->pending_vblank_wq;
-	wait_info.atomic_cnt = &cmd_enc->pending_vblank_cnt;
-	wait_info.timeout_ms = KICKOFF_TIMEOUT_MS;
-
-	atomic_inc(&cmd_enc->pending_vblank_cnt);
-
-	rc = dpu_encoder_helper_wait_for_irq(phys_enc,
-			phys_enc->irq[INTR_IDX_RDPTR],
-			dpu_encoder_phys_cmd_te_rd_ptr_irq,
-			&wait_info);
-
-	return rc;
-}
-
 static void dpu_encoder_phys_cmd_handle_post_kickoff(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -745,7 +718,6 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_commit_done = dpu_encoder_phys_cmd_wait_for_commit_done;
 	ops->prepare_for_kickoff = dpu_encoder_phys_cmd_prepare_for_kickoff;
 	ops->wait_for_tx_complete = dpu_encoder_phys_cmd_wait_for_tx_complete;
-	ops->wait_for_vblank = dpu_encoder_phys_cmd_wait_for_vblank;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
 	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index c2189e58de6a..94521f6d7f70 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -444,7 +444,7 @@ static void dpu_encoder_phys_vid_destroy(struct dpu_encoder_phys *phys_enc)
 	kfree(phys_enc);
 }
 
-static int dpu_encoder_phys_vid_wait_for_vblank(
+static int dpu_encoder_phys_vid_wait_for_tx_complete(
 		struct dpu_encoder_phys *phys_enc)
 {
 	struct dpu_encoder_wait_info wait_info;
@@ -558,7 +558,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 	 * scanout buffer) don't latch properly..
 	 */
 	if (dpu_encoder_phys_vid_is_master(phys_enc)) {
-		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
+		ret = dpu_encoder_phys_vid_wait_for_tx_complete(phys_enc);
 		if (ret) {
 			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
@@ -578,7 +578,7 @@ static void dpu_encoder_phys_vid_disable(struct dpu_encoder_phys *phys_enc)
 		spin_lock_irqsave(phys_enc->enc_spinlock, lock_flags);
 		dpu_encoder_phys_inc_pending(phys_enc);
 		spin_unlock_irqrestore(phys_enc->enc_spinlock, lock_flags);
-		ret = dpu_encoder_phys_vid_wait_for_vblank(phys_enc);
+		ret = dpu_encoder_phys_vid_wait_for_tx_complete(phys_enc);
 		if (ret) {
 			atomic_set(&phys_enc->pending_kickoff_cnt, 0);
 			DRM_ERROR("wait disable failed: id:%u intf:%d ret:%d\n",
@@ -684,8 +684,7 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->destroy = dpu_encoder_phys_vid_destroy;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
-	ops->wait_for_vblank = dpu_encoder_phys_vid_wait_for_vblank;
-	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_vblank;
+	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_tx_complete;
 	ops->irq_control = dpu_encoder_phys_vid_irq_control;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index 02fd6c7d0bb7..182543c92770 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -78,12 +78,10 @@ enum msm_dsi_controller {
  * enum msm_event_wait - type of HW events to wait for
  * @MSM_ENC_COMMIT_DONE - wait for the driver to flush the registers to HW
  * @MSM_ENC_TX_COMPLETE - wait for the HW to transfer the frame to panel
- * @MSM_ENC_VBLANK - wait for the HW VBLANK event (for driver-internal waiters)
  */
 enum msm_event_wait {
 	MSM_ENC_COMMIT_DONE = 0,
 	MSM_ENC_TX_COMPLETE,
-	MSM_ENC_VBLANK,
 };
 
 /**
-- 
2.40.1

