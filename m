Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3B97B6F2BC8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 May 2023 02:02:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232268AbjD3X7l (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 30 Apr 2023 19:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232225AbjD3X5j (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 30 Apr 2023 19:57:39 -0400
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE85191
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
Received: by mail-lj1-x229.google.com with SMTP id 38308e7fff4ca-2a7b02615f1so19487351fa.0
        for <linux-arm-msm@vger.kernel.org>; Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682899055; x=1685491055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9IQnN4Gte1igrHX4jdkN4n+w/u3KCrXki40ba3qKxFY=;
        b=ttXB4JeHr738lEhQHfwj7K6qRQELrwRcrU12ia4+wPF/6YuRZHktnE1ai0X9Jggzk4
         RIF9BunBI6MBnjr4Fme62wT8D3+0qBv+fEUH26Vwqj3G/uRsVg8T9HDhCEy5iQ5ZYX+c
         CjiqchX7z6IzcAFlf3mK+9TMa0SwQO7jZQK5hqCsPuNRBUBO/rmsNp/yevbPZL/i+4cb
         BCjEnrhSbB6UtNdP5eNgo8zn6raH4U+m1JTcqAWo8CvbYAkGSr5YxtiO3mbYMfm7DkOt
         HFVsNngbjz5pYBXWE2rMy5s6mjs6Sd0kEBqBrBDeByGOg+lI8sqb/ZQrLLSuphLdxxl6
         pzHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682899055; x=1685491055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9IQnN4Gte1igrHX4jdkN4n+w/u3KCrXki40ba3qKxFY=;
        b=YzDcaPl/nBGrDad7RLYIqB/C/58DOTTaIGFUGtz5Ih8KXvlu74wwW9uatF6/P/MMX7
         u/6HTBuBzc7x+Do1KeRtGxq0zHawinjTk8Ah9uz64Jz+mdnA0jQTaVCEV9xkj9EToU/+
         Auv5A1LFYjAE3q2AK1X7O3S/rLt3bdns7BEfgLqI7QDpbZCtumolDdxURP3DAAa8Lft1
         Zb05tZ+tf5QlQ1khJW9/iREp4TGLGu5GfEkqwPwWvvBqfepYc8E2HD4g9AHWnKyzpW04
         7cWNW9zCOWGJQCncNJtzi83axfgTjwh86ozAv5WoUYBg4kfr2ThNvXhQtMfrb2GJyxJS
         Degg==
X-Gm-Message-State: AC+VfDxhZT15ML6XI+N6Nw2XNV0CjI2sDADoHYsBNZwK59dg9NPcL1l/
        RrnnB3jaseKKu0jPWuidbT6loA==
X-Google-Smtp-Source: ACHHUZ4Ho7zTW0be7srcNzcVM94C5KhJtP5WGIk+tCaW+K9sigvOBoxKwlkaCU5uQcoe25R0JlKNlg==
X-Received: by 2002:a2e:8017:0:b0:2a8:c82f:2996 with SMTP id j23-20020a2e8017000000b002a8c82f2996mr3322131ljg.43.1682899055557;
        Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Apr 2023 16:57:35 -0700 (PDT)
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
Subject: [PATCH 3/7] drm/msm/dpu: separate common function to init physical encoder
Date:   Mon,  1 May 2023 02:57:28 +0300
Message-Id: <20230430235732.3341119-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move common DPU physical encoder initialization code to the new function
dpu_encoder_phys_init().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 31 +++++++++++++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  3 ++
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 19 +++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 20 +++---------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 19 +++---------
 5 files changed, 46 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 8c45c949ec39..c60dce5861e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2303,8 +2303,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-		atomic_set(&phys->vsync_cnt, 0);
-		atomic_set(&phys->underrun_cnt, 0);
 
 		if (phys->intf_idx >= INTF_0 && phys->intf_idx < INTF_MAX)
 			phys->hw_intf = dpu_rm_get_intf(&dpu_kms->rm, phys->intf_idx);
@@ -2505,3 +2503,32 @@ unsigned int dpu_encoder_helper_get_dsc(struct dpu_encoder_phys *phys_enc)
 
 	return dpu_enc->dsc_mask;
 }
+
+int dpu_encoder_phys_init(struct dpu_encoder_phys *phys_enc,
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
+
+	return 0;
+}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..7019870215c0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -405,4 +405,7 @@ void dpu_encoder_frame_done_callback(
 		struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *ready_phys, u32 event);
 
+int dpu_encoder_phys_init(struct dpu_encoder_phys *phys,
+			  struct dpu_enc_phys_init_params *p);
+
 #endif /* __dpu_encoder_phys_H__ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 74470d068622..ce86b9ef6bf1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -759,7 +759,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_cmd *cmd_enc = NULL;
-	int i, ret = 0;
+	int ret = 0;
 
 	DPU_DEBUG("intf %d\n", p->intf_idx - INTF_0);
 
@@ -770,25 +770,16 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 		return ERR_PTR(ret);
 	}
 	phys_enc = &cmd_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
+
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
 
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
index 3a374292f311..aca3849621e2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -699,7 +699,7 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		struct dpu_enc_phys_init_params *p)
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
-	int i;
+	int ret;
 
 	if (!p) {
 		DPU_ERROR("failed to create encoder due to invalid parameter\n");
@@ -712,24 +712,14 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(
 		return ERR_PTR(-ENOMEM);
 	}
 
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->intf_idx = p->intf_idx;
-
 	DPU_DEBUG_VIDENC(phys_enc, "\n");
 
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
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
index f879d006de21..c252127552c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -683,7 +683,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
 	int ret = 0;
-	int i;
 
 	DPU_DEBUG("\n");
 
@@ -701,28 +700,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	}
 
 	phys_enc = &wb_enc->base;
-	phys_enc->hw_mdptop = p->dpu_kms->hw_mdp;
-	phys_enc->wb_idx = p->wb_idx;
+
+	ret = dpu_encoder_phys_init(phys_enc, p);
+	if (ret)
+		return ERR_PTR(ret);
 
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

