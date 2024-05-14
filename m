Return-Path: <linux-arm-msm+bounces-19817-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 020E08C4D63
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 09:56:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6BE161F22598
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 May 2024 07:56:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53F5117999;
	Tue, 14 May 2024 07:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aUxqIK1N"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5F517577
	for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 07:56:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715673401; cv=none; b=rQlz79qeNoN7EQvqCfub4DCZNuK6ivmRgn96ds8U4kJ+jPYUZE1gq1OAfQn/zP//wgau5pzS2wjNR+uwU43it5imhTkx4B7z5y2IO1Obz9QPO05CoKXvo8N286WiiA78grqapx2y1pENNARL4GHadoBOX/ZO7Ia3wWbzbk0JCGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715673401; c=relaxed/simple;
	bh=wGSRt3if0X9kZ/HrVq/Ne0TEuyWI+bHUBEXOAVzB/s0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=f4VTJQROGTrpaIDX6580Q5GI2zpEZuxNsisWmdI5MV7Er40SXeWtaDrXPSGWY5kKeK2dj//NgYQfcKIRUQoA39MXpA3jzvcL1So9i3zVNMXrYpbBV7NhhZg0VDPMUKT3nSTwABOGmU3IgFiOdUaioH4qVmQsbNkbAW2ydgObPDg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aUxqIK1N; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52327368e59so2342926e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 May 2024 00:56:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1715673397; x=1716278197; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uza+DRQEYzKLrkq1gsfl6buXfasHa8vc5/WNhhyABXo=;
        b=aUxqIK1NA2YxaSiRs2zfhua8VDrnlB8a98MKHXsLQ8yVTW0Xi1FWwvTfvtqqjwO4jk
         ubXGqwx1CMoo48E/z+9ppzVulO988KrxA4+qT1fXs8PvdReqjuw7QqoK4YegjG1IqE3m
         czDf5IbflZBA5lFoV2mscBuFFR4Yb9hT0WUpzL8U0mVvgXH382lhQ51SCD7JZnn1H3hG
         aPdwIrlRqYqevd6idppXB98u5/bZqkHSlGEglRI4LHqPvSJCT0b8XsysPYwmDF9W4NCa
         lL4vMQugNUE0aHUxI4OczPnRadsGb1/Zf8Vsb7qKLr5x4uvLBIZJvPuSuswo2q0QKwWD
         2RZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715673397; x=1716278197;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uza+DRQEYzKLrkq1gsfl6buXfasHa8vc5/WNhhyABXo=;
        b=j93OkdTk1p4FLq/935YV63sSTz+NSIf5ORn2hMYHhYidEWbMAYgetUqYB3XYF+NdXh
         McSFzgEjAat0PbUxPy4FFVE1RAvW5EzNPt7WjZsy7XArcEtE4m+xZugkwt61ASlkbjxK
         XPwzm1NefEluXkiQN9LhYDjCRGy+5h1si04lrYLjXhpGhePkWPmIenzeCGEYysgVZ9ag
         m9KPbJZ5d6MjUPHEVWe5qQ1ZV91fSSTv9LiEk6L8pbEW33XurpIYinVdpWT/n5He5riW
         pN85JegvVnn+CbArQxm2g84dL/WUGpkHXZnEcGsihjM707fQSmYOcPoyvsSNFXOaIIsw
         nShA==
X-Gm-Message-State: AOJu0YxBbRRTXJs0xZCvZZbPm+NDpIWGpa+w6He+c1cVsXMCnuFJ2ZtP
	YeMcuWu6mNUSS7VEMQiBhd1dZ6bj6sC78BGLzoJvOC30Wdwp/dKC87tLVFVugF38ldffMmGmYy+
	Ku5c=
X-Google-Smtp-Source: AGHT+IHesTPiCLOrFGmj/XeJY8txNyCoHRBfg4rInYPaTIZWhF0vQM5h4nqBOehbNTcISungq1+O7w==
X-Received: by 2002:a05:6512:ba7:b0:51a:e21c:109c with SMTP id 2adb3069b0e04-5220fb7741dmr10969488e87.14.1715673397323;
        Tue, 14 May 2024 00:56:37 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f38d8da1sm2039100e87.233.2024.05.14.00.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 May 2024 00:56:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 14 May 2024 10:56:36 +0300
Subject: [PATCH] Revert "drm/msm/dpu: drop
 dpu_encoder_phys_ops.atomic_mode_set"
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240514-dpu-revert-ams-v1-1-b13623d6cd5f@linaro.org>
X-B4-Tracking: v=1; b=H4sIADMZQ2YC/x2MQQqAIBAAvyJ7bkHFoPpKdDDdag+ZaEUg/T3pO
 DAzBTIlpgyDKJDo5sxHqKAaAW6zYSVkXxm01Ea2yqCPF1aR0ol2z9gbJe3sFJHpoEYx0cLPPxy
 n9/0Ay+O6hGAAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9165;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=wGSRt3if0X9kZ/HrVq/Ne0TEuyWI+bHUBEXOAVzB/s0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmQxk0a2SxIbI7dBbA9fHx50oakngD5BMVk4a0R
 wL8deRB19SJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZkMZNAAKCRCLPIo+Aiko
 1TkDCACaT3qZx+22q1Gtb9GUurVjUlraTv3WBRiAzomJ9LA7qxEpNv8wVPtMauouhCRQmWnrfP8
 qJJxpR6NxW4pi4mmGif1rq/Hza6uz2Mw6FEc8iYoFVoKd2oMw8USG36rh4utp2eX120v1RL/1vy
 rYmhb+FnfOvY22HEB76t2h0XvmrRKlXC98HcBEz3uhQBFf2jbMXktjJa53uEPj0UN470zFk1QFc
 xH1In87JRr5W34bw1YG2AITaLxlh7NHBImw8hsEnN7RTkXtnVxBkkq+0BliIwox1V2g/ZEvy6xq
 mgE/qFjJxYo4gfE/VbriaEaSTUJ3mvFaLNChjswsgLwXTtFr
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

In the DPU driver blank IRQ handling is called from a vblank worker and
can happen outside of the irq_enable / irq_disable pair. Revert commit
d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
to fix vblank IRQ assignment for CMD DSI panels.

Fixes: d13f638c9b88 ("drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  2 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  5 ++++
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 32 ++++++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 13 +++++++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 11 +++++++-
 5 files changed, 46 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 119f3ea50a7c..a7d8ecf3f5be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1200,6 +1200,8 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		phys->hw_ctl = to_dpu_hw_ctl(hw_ctl[i]);
 
 		phys->cached_mode = crtc_state->adjusted_mode;
+		if (phys->ops.atomic_mode_set)
+			phys->ops.atomic_mode_set(phys, crtc_state, conn_state);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 002e89cc1705..30470cd15a48 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -69,6 +69,8 @@ struct dpu_encoder_phys;
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
  *				on split_role and current mode (CMD/VID).
+ * @atomic_mode_set:		DRM Call. Set a DRM mode.
+ *				This likely caches the mode, for use at enable.
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
@@ -93,6 +95,9 @@ struct dpu_encoder_phys;
 struct dpu_encoder_phys_ops {
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
+	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
+			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 489be1c0c704..95cd39b49668 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -142,6 +142,23 @@ static void dpu_encoder_phys_cmd_underrun_irq(void *arg)
 	dpu_encoder_underrun_callback(phys_enc->parent, phys_enc);
 }
 
+static void dpu_encoder_phys_cmd_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
+
+	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
+
+	if (phys_enc->has_intf_te)
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
+	else
+		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int _dpu_encoder_phys_cmd_handle_ppdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -280,14 +297,6 @@ static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 					  phys_enc->hw_pp->idx - PINGPONG_0,
 					  phys_enc->vblank_refcount);
 
-	phys_enc->irq[INTR_IDX_CTL_START] = phys_enc->hw_ctl->caps->intr_start;
-	phys_enc->irq[INTR_IDX_PINGPONG] = phys_enc->hw_pp->caps->intr_done;
-
-	if (phys_enc->has_intf_te)
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_intf->cap->intr_tear_rd_ptr;
-	else
-		phys_enc->irq[INTR_IDX_RDPTR] = phys_enc->hw_pp->caps->intr_rdptr;
-
 	dpu_core_irq_register_callback(phys_enc->dpu_kms,
 				       phys_enc->irq[INTR_IDX_PINGPONG],
 				       dpu_encoder_phys_cmd_pp_tx_done_irq,
@@ -318,10 +327,6 @@ static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
 	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
 	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
-
-	phys_enc->irq[INTR_IDX_CTL_START] = 0;
-	phys_enc->irq[INTR_IDX_PINGPONG] = 0;
-	phys_enc->irq[INTR_IDX_RDPTR] = 0;
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -698,6 +703,7 @@ static void dpu_encoder_phys_cmd_init_ops(
 		struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_cmd_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_cmd_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_cmd_enable;
 	ops->disable = dpu_encoder_phys_cmd_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_cmd_control_vblank_irq;
@@ -736,8 +742,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(struct drm_device *dev,
 
 	dpu_encoder_phys_cmd_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_CMD;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
-
 	cmd_enc->stream_sel = 0;
 
 	if (!phys_enc->hw_intf) {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index ef69c2f408c3..636a97432d51 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -356,6 +356,16 @@ static bool dpu_encoder_phys_vid_needs_single_flush(
 	return phys_enc->split_role != ENC_ROLE_SOLO;
 }
 
+static void dpu_encoder_phys_vid_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
+
+	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
+}
+
 static int dpu_encoder_phys_vid_control_vblank_irq(
 		struct dpu_encoder_phys *phys_enc,
 		bool enable)
@@ -699,6 +709,7 @@ static int dpu_encoder_phys_vid_get_frame_count(
 static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_vid_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_vid_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_vid_enable;
 	ops->disable = dpu_encoder_phys_vid_disable;
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
@@ -737,8 +748,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_vid_init(struct drm_device *dev,
 
 	dpu_encoder_phys_vid_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_VIDEO;
-	phys_enc->irq[INTR_IDX_VSYNC] = phys_enc->hw_intf->cap->intr_vsync;
-	phys_enc->irq[INTR_IDX_UNDERRUN] = phys_enc->hw_intf->cap->intr_underrun;
 
 	DPU_DEBUG_VIDENC(phys_enc, "created intf idx:%d\n", p->hw_intf->idx);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index d3ea91c1d7d2..356dca5e5ea9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -404,6 +404,15 @@ static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
+static void dpu_encoder_phys_wb_atomic_mode_set(
+		struct dpu_encoder_phys *phys_enc,
+		struct drm_crtc_state *crtc_state,
+		struct drm_connector_state *conn_state)
+{
+
+	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
+}
+
 static void _dpu_encoder_phys_wb_handle_wbdone_timeout(
 		struct dpu_encoder_phys *phys_enc)
 {
@@ -640,6 +649,7 @@ static bool dpu_encoder_phys_wb_is_valid_for_commit(struct dpu_encoder_phys *phy
 static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 {
 	ops->is_master = dpu_encoder_phys_wb_is_master;
+	ops->atomic_mode_set = dpu_encoder_phys_wb_atomic_mode_set;
 	ops->enable = dpu_encoder_phys_wb_enable;
 	ops->disable = dpu_encoder_phys_wb_disable;
 	ops->wait_for_commit_done = dpu_encoder_phys_wb_wait_for_commit_done;
@@ -685,7 +695,6 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(struct drm_device *dev,
 
 	dpu_encoder_phys_wb_init_ops(&phys_enc->ops);
 	phys_enc->intf_mode = INTF_MODE_WB_LINE;
-	phys_enc->irq[INTR_IDX_WB_DONE] = phys_enc->hw_wb->caps->intr_wb_done;
 
 	atomic_set(&wb_enc->wbirq_refcount, 0);
 

---
base-commit: 75fa778d74b786a1608d55d655d42b480a6fa8bd
change-id: 20240514-dpu-revert-ams-9410abc1ee48

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


