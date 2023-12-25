Return-Path: <linux-arm-msm+bounces-5958-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A029E81E0C7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 14:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CB9328249F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 Dec 2023 13:09:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 19E31524A1;
	Mon, 25 Dec 2023 13:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p9rrhDyG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5804851C49
	for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 13:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ccae380df2so19615501fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 Dec 2023 05:09:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1703509738; x=1704114538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NKgjg/qwWLdf/Rc3gV8ov6vt9tgKlbpQ12GfaOf7LUw=;
        b=p9rrhDyGsADa9OYsAo3a8PnJ4k7dB2/uyHcOG+WE5W59TufKYh79cKSfkaMmnDCKAh
         Jy6pbkRccendHdTmk1jGexUr0zsJNJqNWRcpaUvuFO9zu2jiygoMc9bXvqImTLwvHFeN
         WbzhI74u6XNeIFuAZHw7wHNjeJ/fZZ9ApCDSGp06y4jlwkr7dBtFkQml7SaHFftRY1nZ
         kZUl5yBSm8TIE7sE858NN3YoNcSrzvfPgr6TWUdWBQ0l697EEG3S36n8JmDa66rxmr1B
         9r26U+9m5YN+LHdOzN557bcyAtaVMa2xp+RZcgpYmgGPPDMJELhmfG+7AshQj3qZ8uKz
         w1LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703509738; x=1704114538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NKgjg/qwWLdf/Rc3gV8ov6vt9tgKlbpQ12GfaOf7LUw=;
        b=X0kXp7bVvNoyJwJQ1jNPSnJKUBGAjN4ONGMrQq3MqN+y4X440JTL+qF+lClxbu9uqP
         gAaLvIeC5Ci3duvOvH3Wafn5S2ZMJ/6TgKcg3zvliKSD4ZS9ywPpAxjTFf7fdpwj6mwS
         g7rb9qqPanemFtso7pThMh7FXZkp4ZCqU1S1TRIWHT4M3A9mtdKO3d8/XNoHGGLpNfw0
         sKu/2X4RBOHpXcfXz0bAwWUovvbQ1WxNvwO5VMHSRo2OZeIokRHtUr4BgHwEcqV7kKcX
         /AF92hpfGMc9znz0j7w7gfmt2itA2vueEWUZLlOGb+dMqNgYHptxVmQtqeLOug5nWWa6
         KiXw==
X-Gm-Message-State: AOJu0YyddHOjvGDCzC7nuLUhdNyuxvS57aX/L0CC9N4R5X9JRLFosSSF
	nMeDDM/8AtOf+UxPniGEQRIRMTcuQPLdow==
X-Google-Smtp-Source: AGHT+IFvnNd4ZodENjjaNpbB5lSq6HlUlpm7IHCA6RCuU/Kqx9HKB3fMEvdE3t4VLitELQtsDWJJag==
X-Received: by 2002:a2e:5c42:0:b0:2cc:932e:6bc8 with SMTP id q63-20020a2e5c42000000b002cc932e6bc8mr1992924ljb.6.1703509738514;
        Mon, 25 Dec 2023 05:08:58 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c19-20020a05651c015300b002c9f75a48fcsm1030207ljd.16.2023.12.25.05.08.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Dec 2023 05:08:58 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v3 5/5] drm/msm/dpu: drop dpu_encoder_phys_ops::atomic_check()
Date: Mon, 25 Dec 2023 15:08:53 +0200
Message-Id: <20231225130853.3659424-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
References: <20231225130853.3659424-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Writeback was the last user of dpu_encoder_phys_ops's atomic_check()
callback. As the code was moved to the dpu_writeback.c, the callback
becomes unused. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 15 ---------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |  4 ----
 2 files changed, 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5022d0b9b4b4..8a8aae850a3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -584,7 +584,6 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_global_state *global_state;
 	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
-	int i = 0;
 	int ret = 0;
 
 	if (!drm_enc || !crtc_state || !conn_state) {
@@ -605,20 +604,6 @@ static int dpu_encoder_virt_atomic_check(
 
 	trace_dpu_enc_atomic_check(DRMID(drm_enc));
 
-	/* perform atomic check on the first physical encoder (master) */
-	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
-		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
-
-		if (phys->ops.atomic_check)
-			ret = phys->ops.atomic_check(phys, crtc_state,
-					conn_state);
-		if (ret) {
-			DPU_ERROR_ENC(dpu_enc,
-					"mode unsupported, phys idx %d\n", i);
-			return ret;
-		}
-	}
-
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
 	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 7eb8bdfe6bbe..dd9e3603d120 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -71,7 +71,6 @@ struct dpu_encoder_phys;
  *				on split_role and current mode (CMD/VID).
  * @enable:			DRM Call. Enable a DRM mode.
  * @disable:			DRM Call. Disable mode.
- * @atomic_check:		DRM Call. Atomic check new DRM state.
  * @control_vblank_irq		Register/Deregister for VBLANK IRQ
  * @wait_for_commit_done:	Wait for hardware to have flushed the
  *				current pending frames to hardware
@@ -96,9 +95,6 @@ struct dpu_encoder_phys_ops {
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*enable)(struct dpu_encoder_phys *encoder);
 	void (*disable)(struct dpu_encoder_phys *encoder);
-	int (*atomic_check)(struct dpu_encoder_phys *encoder,
-			    struct drm_crtc_state *crtc_state,
-			    struct drm_connector_state *conn_state);
 	int (*control_vblank_irq)(struct dpu_encoder_phys *enc, bool enable);
 	int (*wait_for_commit_done)(struct dpu_encoder_phys *phys_enc);
 	int (*wait_for_tx_complete)(struct dpu_encoder_phys *phys_enc);
-- 
2.39.2


