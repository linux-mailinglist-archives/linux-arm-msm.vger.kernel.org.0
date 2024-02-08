Return-Path: <linux-arm-msm+bounces-10196-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8AD84E3ED
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 16:20:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D48991F2654B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Feb 2024 15:20:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 21D1C7AE69;
	Thu,  8 Feb 2024 15:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xTvlTbxT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76276F082
	for <linux-arm-msm@vger.kernel.org>; Thu,  8 Feb 2024 15:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707405648; cv=none; b=hQ9OQSQmT2r8NyzFYmPsP/TBgNnIyk98NwiiPWUb1R7waqfrxrH6CyouQ8LDJ1PpnqWFocoDF0CwlzRIceXKIUznrgzUsWjKCrvBcrD1OsZt4fo+ZRNbuxuorQP3FQTma9yAecquoMHx/LVH3IUQiHLf5LG/CeFk8JG1kxIvjsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707405648; c=relaxed/simple;
	bh=hi4ozukHaJbEW9QTJeM5bhr1N9GU68ltmc8dMLtUFbY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PK5v6kWo3L/T2uQ9GFhvl1wHlT7SPlS6Inob9bHLpUvyQhAloYjVnmszucs6nJIfuGvLBgiGYxp5TAG9tlaLZCQMFP1lr7y2odOO2EuiFS9hTXFs0gLVnPFS2MGtMGBfDIu/ODNDbh+7QLrtXGteAlRubS4xh7rABGmzftWaAaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xTvlTbxT; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2cf206e4d56so25276641fa.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 08 Feb 2024 07:20:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707405644; x=1708010444; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pD8NFY3C23D5pY1eaim0ZItVfbwtuhOEOgYDjY7n37g=;
        b=xTvlTbxTJPsxQnHirtSIZQyodNYSEQUJm6+Z85HS1YQLRbDHruGG8GGjvvYJD62Hpz
         abODCd5sKU6sakAklOEeO0LRVaC3uKVZfdjux9K9jeRcENNCacrte5KHZv6WJQFr324Z
         5QLxPE5nOQyAaUnHfvofoSy7gTt7JpZ/KAfhJvLsCTtZA7OGKQuNopqpn2lq5difXvU9
         mxS8GTRKF005VXAd3PNWduwunDOiuxl2AvpzdhmLrJU71AJePXGiQIJ/pMejmYETrzxE
         cWQhNQxcousv4QKrKx75k3d/+XwIzRgD/3I3NbJ1MteI4wVlweKamHIoFP0UcKZbBYvK
         z6+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707405644; x=1708010444;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pD8NFY3C23D5pY1eaim0ZItVfbwtuhOEOgYDjY7n37g=;
        b=vlzL9u+/t4IOuDx4DPZ4yPzhaTnBGWyJqTIOL3DxZnb4LK5SPCD21hn8NX1bw75Vm+
         v2VPn5G00VPcYJ9rKTCUQnY7nQmLwtR3JCOc53zjrqmZTYfHdZ+yk0MEikUnt6XPhKrC
         RZ10CjjHKACeqGB2IlE2k9XSmIB4FDSgq4bU2Zg7YNKNEsFY7PmPCdHd3Vbd80oFV5Jg
         so2YpKzsVAcRkEEp3s5kwWyS82RR9Ih9oZCTBVFB1DDaZfmJ2dfjhLxLQvT9WA/8GwpP
         6Wm2XRjgj7lQlremaDEXHXgURm4UuDXB/oMsLXDUBpVVBeOmj7xYC19UTq2xMGqXNPqh
         4Ahg==
X-Gm-Message-State: AOJu0YwrdVCgm7uQauRNJIBnzn6csnMTCDTZm+AVmUBEpioMouAWfrJC
	rAQHuCnsuFbuQebiO6NqnKaeP6x80mIM92KaZFGfcbHtH6kyKhLMWR1lkNfZfnI=
X-Google-Smtp-Source: AGHT+IECo0e7zlDwzC+qK7mS1CdQiTutLGlMtdt69c5XhvkPtSH8qXrWRF27qWN18jBLKeqXylJkIg==
X-Received: by 2002:a05:651c:1411:b0:2d0:9fac:bdff with SMTP id u17-20020a05651c141100b002d09facbdffmr6166882lje.38.1707405643738;
        Thu, 08 Feb 2024 07:20:43 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWHLZhJGFr0xDaDG1/nvprbbZEhpAFc/VLX841oIrynZ5GlJ5l9jtcBR82j0/iv+pKe2XDJBvJYiFFXWbpzTc0xpZFUgQrZ4/PG4lncRRLXEQX0Ek2cPwOsKOIRLUwcgoMnb5/Oa6sDMHYSmMKwjyemjcryDQAf/dVL4i+LPOOpyF7sQeL25gdqlwGxKZY01mpWfKLLMtD6b7JjU73Wy7TgxYVcCaparQwCmnEKnDS3ubfc+viYxJW/k2jxag9NhhPe4H2H49tBNd3nczhIKbOZpqvK2SLFPNwrHKz3yf6Iyf2SUgSPEQa7Au1MUTzkU54ZRiSKgCvQz79d16M=
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y4-20020a2e9d44000000b002d0d1caf26bsm22116ljj.7.2024.02.08.07.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 07:20:43 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 08 Feb 2024 17:20:41 +0200
Subject: [PATCH v4 1/5] drm/msm/dpu: split irq_control into irq_enable and
 _disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-1-caf5dcd125c0@linaro.org>
References: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
In-Reply-To: <20240208-fd_remove_phys_ops_atomic_mode_set-v4-0-caf5dcd125c0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=17113;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=hi4ozukHaJbEW9QTJeM5bhr1N9GU68ltmc8dMLtUFbY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBlxPFJjZ9hAXLUDyFqGmQFudLSmvr4JIhzyeFcI
 RUZE/KuZ0CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZcTxSQAKCRCLPIo+Aiko
 1U+gB/9XvVpLJa5kYNCLUN9kkG350vbN5uyQ1MgWxfN7AE+MH+LwnOcmCrwDbet+ILqgf1zfbfg
 CJBMupD9MU/gvjP7ZuIocWdJbeYI/fIzRQ6NH5db5C77pR6SKpSEKRRzGkCM3sFJ4Exsjldcv07
 d8qe271JH/1t+iWE8S7OIHBHePHF8F5UFP/d6ylqz4xhdoRXn4mz5exhfrDlr9a1Sqt+Dk8+mz0
 cTb1/bKeEz/CvhTscbHEbAddlvYdJBThnxyj34WlMlVic2r1UpeGeOTLcSO/1olgAaijyBtMUFN
 9AvjyUpJqasIzhIzF7Wol+FwKjRJqoDaN5dk5h7CLfp0XLE1
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

The single helper for both enable and disable cases is too complicated,
especially if we start adding more code to these helpers. Split it into
irq_enable and irq_disable cases.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 36 +++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 65 +++++++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   | 46 ++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 29 +++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          | 62 ++++++++++++++++-----
 6 files changed, 158 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 6a4b489d44e5..e0ff7d8aa199 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -714,7 +714,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 }
 
-static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
+static void _dpu_encoder_irq_enable(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc;
 	int i;
@@ -726,14 +726,32 @@ static void _dpu_encoder_irq_control(struct drm_encoder *drm_enc, bool enable)
 
 	dpu_enc = to_dpu_encoder_virt(drm_enc);
 
-	DPU_DEBUG_ENC(dpu_enc, "enable:%d\n", enable);
+	DPU_DEBUG_ENC(dpu_enc, "\n");
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		if (phys->ops.irq_control)
-			phys->ops.irq_control(phys, enable);
+		phys->ops.irq_enable(phys);
+	}
+}
+
+static void _dpu_encoder_irq_disable(struct drm_encoder *drm_enc)
+{
+	struct dpu_encoder_virt *dpu_enc;
+	int i;
+
+	if (!drm_enc) {
+		DPU_ERROR("invalid encoder\n");
+		return;
 	}
 
+	dpu_enc = to_dpu_encoder_virt(drm_enc);
+
+	DPU_DEBUG_ENC(dpu_enc, "\n");
+	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
+		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
+
+		phys->ops.irq_disable(phys);
+	}
 }
 
 static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
@@ -759,11 +777,11 @@ static void _dpu_encoder_resource_control_helper(struct drm_encoder *drm_enc,
 		pm_runtime_get_sync(&dpu_kms->pdev->dev);
 
 		/* enable all the irq */
-		_dpu_encoder_irq_control(drm_enc, true);
+		_dpu_encoder_irq_enable(drm_enc);
 
 	} else {
 		/* disable all the irq */
-		_dpu_encoder_irq_control(drm_enc, false);
+		_dpu_encoder_irq_disable(drm_enc);
 
 		/* disable DPU core clks */
 		pm_runtime_put_sync(&dpu_kms->pdev->dev);
@@ -824,7 +842,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode && dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE)
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, true);
 
@@ -879,7 +897,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 
 		if (is_vid_mode &&
 			  dpu_enc->rc_state == DPU_ENC_RC_STATE_IDLE) {
-			_dpu_encoder_irq_control(drm_enc, true);
+			_dpu_encoder_irq_enable(drm_enc);
 		}
 		/* skip if is already OFF or IDLE, resources are off already */
 		else if (dpu_enc->rc_state == DPU_ENC_RC_STATE_OFF ||
@@ -954,7 +972,7 @@ static int dpu_encoder_resource_control(struct drm_encoder *drm_enc,
 		}
 
 		if (is_vid_mode)
-			_dpu_encoder_irq_control(drm_enc, false);
+			_dpu_encoder_irq_disable(drm_enc);
 		else
 			_dpu_encoder_resource_control_helper(drm_enc, false);
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 993f26343331..8c5b0c853572 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -85,7 +85,8 @@ struct dpu_encoder_phys;
  * @handle_post_kickoff:	Do any work necessary post-kickoff work
  * @trigger_start:		Process start event on physical encoder
  * @needs_single_flush:		Whether encoder slaves need to be flushed
- * @irq_control:		Handler to enable/disable all the encoder IRQs
+ * @irq_enable:			Handler to enable all the encoder IRQs
+ * @irq_disable:		Handler to disable all the encoder IRQs
  * @prepare_idle_pc:		phys encoder can update the vsync_enable status
  *                              on idle power collapse prepare
  * @restore:			Restore all the encoder configs.
@@ -110,7 +111,8 @@ struct dpu_encoder_phys_ops {
 	void (*handle_post_kickoff)(struct dpu_encoder_phys *phys_enc);
 	void (*trigger_start)(struct dpu_encoder_phys *phys_enc);
 	bool (*needs_single_flush)(struct dpu_encoder_phys *phys_enc);
-	void (*irq_control)(struct dpu_encoder_phys *phys, bool enable);
+	void (*irq_enable)(struct dpu_encoder_phys *phys);
+	void (*irq_disable)(struct dpu_encoder_phys *phys);
 	void (*prepare_idle_pc)(struct dpu_encoder_phys *phys_enc);
 	void (*restore)(struct dpu_encoder_phys *phys);
 	int (*get_line_count)(struct dpu_encoder_phys *phys);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index a301e2833177..de826f9745e5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -291,40 +291,42 @@ static int dpu_encoder_phys_cmd_control_vblank_irq(
 	return ret;
 }
 
-static void dpu_encoder_phys_cmd_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_cmd_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
-	trace_dpu_enc_phys_cmd_irq_ctrl(DRMID(phys_enc->parent),
-			phys_enc->hw_pp->idx - PINGPONG_0,
-			enable, phys_enc->vblank_refcount);
-
-	if (enable) {
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG],
-				dpu_encoder_phys_cmd_pp_tx_done_irq,
-				phys_enc);
+	trace_dpu_enc_phys_cmd_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_pp->idx - PINGPONG_0,
+					  phys_enc->vblank_refcount);
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_PINGPONG],
+				       dpu_encoder_phys_cmd_pp_tx_done_irq,
+				       phys_enc);
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_cmd_underrun_irq,
+				       phys_enc);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_cmd_underrun_irq,
-				phys_enc);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, true);
-
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_register_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START],
-					dpu_encoder_phys_cmd_ctl_start_irq,
-					phys_enc);
-	} else {
-		if (dpu_encoder_phys_cmd_is_master(phys_enc))
-			dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-					phys_enc->irq[INTR_IDX_CTL_START]);
+					       phys_enc->irq[INTR_IDX_CTL_START],
+					       dpu_encoder_phys_cmd_ctl_start_irq,
+					       phys_enc);
+}
 
+static void dpu_encoder_phys_cmd_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_cmd_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_pp->idx - PINGPONG_0,
+					   phys_enc->vblank_refcount);
+
+	if (dpu_encoder_phys_cmd_is_master(phys_enc))
 		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-		dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_PINGPONG]);
-	}
+						 phys_enc->irq[INTR_IDX_CTL_START]);
+
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_UNDERRUN]);
+	dpu_encoder_phys_cmd_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms, phys_enc->irq[INTR_IDX_PINGPONG]);
 }
 
 static void dpu_encoder_phys_cmd_tearcheck_config(
@@ -713,7 +715,8 @@ static void dpu_encoder_phys_cmd_init_ops(
 	ops->wait_for_tx_complete = dpu_encoder_phys_cmd_wait_for_tx_complete;
 	ops->trigger_start = dpu_encoder_phys_cmd_trigger_start;
 	ops->needs_single_flush = dpu_encoder_phys_cmd_needs_single_flush;
-	ops->irq_control = dpu_encoder_phys_cmd_irq_control;
+	ops->irq_enable = dpu_encoder_phys_cmd_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_cmd_irq_disable;
 	ops->restore = dpu_encoder_phys_cmd_enable_helper;
 	ops->prepare_idle_pc = dpu_encoder_phys_cmd_prepare_idle_pc;
 	ops->handle_post_kickoff = dpu_encoder_phys_cmd_handle_post_kickoff;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
index d0f56c5c4cce..9743ec43d862 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
@@ -615,30 +615,33 @@ static void dpu_encoder_phys_vid_handle_post_kickoff(
 	}
 }
 
-static void dpu_encoder_phys_vid_irq_control(struct dpu_encoder_phys *phys_enc,
-		bool enable)
+static void dpu_encoder_phys_vid_irq_enable(struct dpu_encoder_phys *phys_enc)
 {
 	int ret;
 
-	trace_dpu_enc_phys_vid_irq_ctrl(DRMID(phys_enc->parent),
-			    phys_enc->hw_intf->idx - INTF_0,
-			    enable,
-			   phys_enc->vblank_refcount);
+	trace_dpu_enc_phys_vid_irq_enable(DRMID(phys_enc->parent),
+					  phys_enc->hw_intf->idx - INTF_0,
+					  phys_enc->vblank_refcount);
 
-	if (enable) {
-		ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
-		if (WARN_ON(ret))
-			return;
-
-		dpu_core_irq_register_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN],
-				dpu_encoder_phys_vid_underrun_irq,
-				phys_enc);
-	} else {
-		dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
-		dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
-				phys_enc->irq[INTR_IDX_UNDERRUN]);
-	}
+	ret = dpu_encoder_phys_vid_control_vblank_irq(phys_enc, true);
+	if (WARN_ON(ret))
+		return;
+
+	dpu_core_irq_register_callback(phys_enc->dpu_kms,
+				       phys_enc->irq[INTR_IDX_UNDERRUN],
+				       dpu_encoder_phys_vid_underrun_irq,
+				       phys_enc);
+}
+
+static void dpu_encoder_phys_vid_irq_disable(struct dpu_encoder_phys *phys_enc)
+{
+	trace_dpu_enc_phys_vid_irq_disable(DRMID(phys_enc->parent),
+					   phys_enc->hw_intf->idx - INTF_0,
+					   phys_enc->vblank_refcount);
+
+	dpu_encoder_phys_vid_control_vblank_irq(phys_enc, false);
+	dpu_core_irq_unregister_callback(phys_enc->dpu_kms,
+					 phys_enc->irq[INTR_IDX_UNDERRUN]);
 }
 
 static int dpu_encoder_phys_vid_get_line_count(
@@ -689,7 +692,8 @@ static void dpu_encoder_phys_vid_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->control_vblank_irq = dpu_encoder_phys_vid_control_vblank_irq;
 	ops->wait_for_commit_done = dpu_encoder_phys_vid_wait_for_commit_done;
 	ops->wait_for_tx_complete = dpu_encoder_phys_vid_wait_for_tx_complete;
-	ops->irq_control = dpu_encoder_phys_vid_irq_control;
+	ops->irq_enable = dpu_encoder_phys_vid_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_vid_irq_disable;
 	ops->prepare_for_kickoff = dpu_encoder_phys_vid_prepare_for_kickoff;
 	ops->handle_post_kickoff = dpu_encoder_phys_vid_handle_post_kickoff;
 	ops->needs_single_flush = dpu_encoder_phys_vid_needs_single_flush;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 4cd2d9e3131a..602013725484 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -511,21 +511,31 @@ static void dpu_encoder_phys_wb_done_irq(void *arg)
 }
 
 /**
- * dpu_encoder_phys_wb_irq_ctrl - irq control of WB
+ * dpu_encoder_phys_wb_irq_enable - irq control of WB
  * @phys:	Pointer to physical encoder
- * @enable:	indicates enable or disable interrupts
  */
-static void dpu_encoder_phys_wb_irq_ctrl(
-		struct dpu_encoder_phys *phys, bool enable)
+static void dpu_encoder_phys_wb_irq_enable(struct dpu_encoder_phys *phys)
 {
 
 	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
 
-	if (enable && atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
+	if (atomic_inc_return(&wb_enc->wbirq_refcount) == 1)
 		dpu_core_irq_register_callback(phys->dpu_kms,
-				phys->irq[INTR_IDX_WB_DONE], dpu_encoder_phys_wb_done_irq, phys);
-	else if (!enable &&
-			atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
+					       phys->irq[INTR_IDX_WB_DONE],
+					       dpu_encoder_phys_wb_done_irq,
+					       phys);
+}
+
+/**
+ * dpu_encoder_phys_wb_irq_disable - irq control of WB
+ * @phys:	Pointer to physical encoder
+ */
+static void dpu_encoder_phys_wb_irq_disable(struct dpu_encoder_phys *phys)
+{
+
+	struct dpu_encoder_phys_wb *wb_enc = to_dpu_encoder_phys_wb(phys);
+
+	if (atomic_dec_return(&wb_enc->wbirq_refcount) == 0)
 		dpu_core_irq_unregister_callback(phys->dpu_kms, phys->irq[INTR_IDX_WB_DONE]);
 }
 
@@ -785,7 +795,8 @@ static void dpu_encoder_phys_wb_init_ops(struct dpu_encoder_phys_ops *ops)
 	ops->trigger_start = dpu_encoder_helper_trigger_start;
 	ops->prepare_wb_job = dpu_encoder_phys_wb_prepare_wb_job;
 	ops->cleanup_wb_job = dpu_encoder_phys_wb_cleanup_wb_job;
-	ops->irq_control = dpu_encoder_phys_wb_irq_ctrl;
+	ops->irq_enable = dpu_encoder_phys_wb_irq_enable;
+	ops->irq_disable = dpu_encoder_phys_wb_irq_disable;
 	ops->is_valid_for_commit = dpu_encoder_phys_wb_is_valid_for_commit;
 
 }
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 35d03b121a0b..95ce7647ff76 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -514,24 +514,41 @@ TRACE_EVENT(dpu_enc_wait_event_timeout,
 		  __entry->expected_time, __entry->atomic_cnt)
 );
 
-TRACE_EVENT(dpu_enc_phys_cmd_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp, bool enable,
+TRACE_EVENT(dpu_enc_phys_cmd_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
 		 int refcnt),
-	TP_ARGS(drm_id, pp, enable, refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,		drm_id	)
+		__field(	enum dpu_pingpong,	pp	)
+		__field(	int,			refcnt	)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->pp = pp;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
+		  __entry->refcnt)
+);
+
+TRACE_EVENT(dpu_enc_phys_cmd_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_pingpong pp,
+		 int refcnt),
+	TP_ARGS(drm_id, pp, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		drm_id	)
 		__field(	enum dpu_pingpong,	pp	)
-		__field(	bool,			enable	)
 		__field(	int,			refcnt	)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->pp = pp;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, pp=%d, enable=%s, refcnt=%d", __entry->drm_id,
-		  __entry->pp, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, pp=%d, refcnt=%d", __entry->drm_id,
+		  __entry->pp,
 		  __entry->refcnt)
 );
 
@@ -592,24 +609,41 @@ TRACE_EVENT(dpu_enc_phys_vid_post_kickoff,
 	TP_printk("id=%u, intf_idx=%d", __entry->drm_id, __entry->intf_idx)
 );
 
-TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
-	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx, bool enable,
+TRACE_EVENT(dpu_enc_phys_vid_irq_enable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
 		 int refcnt),
-	TP_ARGS(drm_id, intf_idx, enable, refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
+	TP_STRUCT__entry(
+		__field(	uint32_t,	drm_id		)
+		__field(	enum dpu_intf,	intf_idx	)
+		__field(	int,		refcnt		)
+	),
+	TP_fast_assign(
+		__entry->drm_id = drm_id;
+		__entry->intf_idx = intf_idx;
+		__entry->refcnt = refcnt;
+	),
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
+		  __entry->drm_id)
+);
+
+TRACE_EVENT(dpu_enc_phys_vid_irq_disable,
+	TP_PROTO(uint32_t drm_id, enum dpu_intf intf_idx,
+		 int refcnt),
+	TP_ARGS(drm_id, intf_idx, refcnt),
 	TP_STRUCT__entry(
 		__field(	uint32_t,	drm_id		)
 		__field(	enum dpu_intf,	intf_idx	)
-		__field(	bool,		enable		)
 		__field(	int,		refcnt		)
 	),
 	TP_fast_assign(
 		__entry->drm_id = drm_id;
 		__entry->intf_idx = intf_idx;
-		__entry->enable = enable;
 		__entry->refcnt = refcnt;
 	),
-	TP_printk("id=%u, intf_idx=%d enable=%s refcnt=%d", __entry->drm_id,
-		  __entry->intf_idx, __entry->enable ? "true" : "false",
+	TP_printk("id=%u, intf_idx=%d refcnt=%d", __entry->drm_id,
+		  __entry->intf_idx,
 		  __entry->drm_id)
 );
 

-- 
2.39.2


