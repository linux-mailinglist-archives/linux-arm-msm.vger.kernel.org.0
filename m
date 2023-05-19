Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4CACF708DE4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 19 May 2023 04:39:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229543AbjESCjD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 18 May 2023 22:39:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229485AbjESCjB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 18 May 2023 22:39:01 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF2DCE61
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:38:59 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-2af1e290921so10269141fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 May 2023 19:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684463938; x=1687055938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8Ukh0c6LNHLYnK7M7ho3pXqeu/s80ZcOihdNRIse9Xs=;
        b=ZZOp4DsNFggfE5JAUDIOEl5S5PZtJu69kGxY7vuRJvCPuISqMAcuhKzI0x1FBQpVrz
         18b8Xi6x44q8VQiQS7ZmO85tOxyMFD63TjIPjYaekmG2sLofkt1EU+q260d+ERi43Kp5
         b1MbWth85gBVuvk8XRGyeehXwkVJEIG3uEZFXuR034boe5597UTk2A87jfaIkbxfpvEk
         U0bF6SnORoyuYuq0C2LedFjfxoRgvn5xPPnNLSq8/4JfS45P6hdRNuloRMxqSXonpNpE
         +ODHm0wdaGmJmqH1/sruCiqlhOT3gL39DDfXzI5nM/KRfyeNXmD817WDn+Zm2ijgqQGZ
         YU0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684463938; x=1687055938;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Ukh0c6LNHLYnK7M7ho3pXqeu/s80ZcOihdNRIse9Xs=;
        b=IUZMgvWiY/mVR0dcnsC171YXQDYGEyP4u5P0fEAPtvXURfxAPAGd1HCbY4PjGlrHd7
         Vg9Nyn/GNs0O8E0DkJ7Xegi2gF3E39zl1IHVMMx4JmOp+2ZjyjiGeZcSoLyCP9qhLvvL
         i3FxJ20cavG4VSmYP+XcPuNoK7ZwaH+htwYTEL05hnv/X2MHfJI1zjdR+nXeDyEAcfVc
         QAihgH5rQpWvk3PIHUO5vCIoy5sq6SujP35bUp1nFXiXVwUYnBt39b07t+DDrqEA+CtN
         9bewjpKjmm5ivnN85N4Oe/GDzYJjosiXHDZHo7gwVza7C4th4RcD1iZPTR1tKRPRw+1v
         EXRg==
X-Gm-Message-State: AC+VfDxIzLcSOwu1/NF4eF9X/e0sPwQ9A2KiUlGtWLrmQCZYG59U8sld
        LoWr8K5HNh9NiG7K4YCgaGSDLA==
X-Google-Smtp-Source: ACHHUZ5d2T2xiD4whqHKpgHxBXe37fdyHvv0lUYAKO58owL7JARo0kY5gCJQM+bFabR0AFZBxnrvqQ==
X-Received: by 2002:a2e:9211:0:b0:2ad:95ba:a5d with SMTP id k17-20020a2e9211000000b002ad95ba0a5dmr113377ljg.43.1684463938157;
        Thu, 18 May 2023 19:38:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 19:38:57 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/msm/dpu: separate common function to init physical encoder
Date:   Fri, 19 May 2023 05:38:50 +0300
Message-Id: <20230519023855.3840907-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move common DPU physical encoder initialization code to the new function
dpu_encoder_phys_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 29 +++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 17 ++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 17 ++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 17 ++---------
 5 files changed, 37 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 32785cb1b079..06b34bac4171 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2310,8 +2310,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-		atomic_set(&phys->vsync_cnt, 0);
-		atomic_set(&phys->underrun_cnt, 0);
 
 		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
 			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
@@ -2513,3 +2511,30 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 
 	return dpu_enc->dsc_mask;
 }
+
+void dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
+			  struct dpu_enc_phys_init_params *p)
+{
+	int i;
+
+	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
+	phys_enc->intf_idx = p->intf_idx;
+	phys_enc->wb_idx = p->wb_idx;
+	phys_enc->parent = p->parent;
+	phys_enc->dpu_kms = p->dpu_kms;
+	phys_enc->split_role = p->split_role;
+	phys_enc->enc_spinlock = p->enc_spinlock;
+	phys_enc->enable_state = DPU_ENC_DISABLED;
+
+	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
+		phys_enc->irq[i] = -EINVAL;
+
+	atomic_set(&phys_enc->vblank_refcount, 0);
+	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
+	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
+
+	atomic_set(&phys_enc->vsync_cnt, 0);
+	atomic_set(&phys_enc->underrun_cnt, 0);
+
+	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..69c3ba5fab26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -405,4 +405,7 @@ void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event);
 
+void dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
+			   struct dpu_enc_phys_init_params *p);
+
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..6898664e1381 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -759,7 +759,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int i, ret = 0;
+	int ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
 
@@ -770,25 +770,14 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 		return ERR_PTR(ret);
 	}
 	phys_enc = &cmd_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+
+	dpu_encoder_phys_init(phys_enc, p);
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 	cmd_enc->stream_sel = 0;
-	phys_enc->enable_state = DPU_ENC_DISABLED;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
 
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->pending_ctlstart_cnt, 0);
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
 	DPU_DEBUG_CMDENC(cmd_enc, "created\n");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index 3a374292f311..dc951fdf473b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -699,7 +699,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	int i;
 
 	if (!p) {
 		DPU_ERROR("failed to create encoder due to invalid parameter\n");
@@ -712,24 +711,12 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-ENOMEM);
 	}
 
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
-
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
+	dpu_encoder_phys_init(phys_enc, p);
+
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->enc_spinlock = p->enc_spinlock;
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->vblank_refcount, 0);
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->intf_idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 023a9c4ad1db..008d1d09b9ba 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -685,7 +685,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
 	int ret = 0;
-	int i;
 
 	DPU_DEBUG("\n");
 
@@ -703,28 +702,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	}
 
 	phys_enc = &wb_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->wb_idx = p->wb_idx;
+
+	dpu_encoder_phys_init(phys_enc, p);
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
-	phys_enc->parent = p->parent;
-	phys_enc->dpu_kms = p->dpu_kms;
-	phys_enc->split_role = p->split_role;
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->wb_idx = p->wb_idx;
-	phys_enc->enc_spinlock = p->enc_spinlock;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 
-	for (i = 0; i < ARRAY_SIZE(phys_enc->irq); i++)
-		phys_enc->irq[i] = -EINVAL;
-
-	atomic_set(&phys_enc->pending_kickoff_cnt, 0);
-	atomic_set(&phys_enc->vblank_refcount, 0);
 	wb_enc->wb_done_timeout_cnt = 0;
 
-	init_waitqueue_head(&phys_enc->pending_kickoff_wq);
-	phys_enc->enable_state = DPU_ENC_DISABLED;
 
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n",
 			phys_enc->wb_idx);
-- 
2.39.2

