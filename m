Return-Path: <linux-arm-msm+bounces-51059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D9633A5CEE8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 20:08:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 651E13B9154
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Mar 2025 19:07:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 380C2267AFA;
	Tue, 11 Mar 2025 19:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o4QWAaBP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E779C26773F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 19:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741719789; cv=none; b=ulBylCulRLM8cUobNIPDqVC3dmB1Cp4Rd9ZuGYTT5jDIKkLelc96m0Rf9U/Zit+7ZydQSUeLN/N5AdEUR14ueN5GgY4QQoZnON8XUFbp36BOZoHnp8QJevfppVHZ3T/5A0VEx7+SRbbcobVnZP+wKwiPo0EZaDDHNwy6LM+UAR8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741719789; c=relaxed/simple;
	bh=PSTyTqOx7jja3G6Cv6HLW9r6HL9E2Dl8EyxIZGayVV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dAAHsDASFVVccDsMnYB1uXGJIaTYSX45AqRbLR5QjpPdDE3iHdhdF9bf5XzLrT3nRLanfTMGLSXGZjQyhFTnZjKE7EZwcmO331I9xE3DhX2YMK6hv003U8QPWKwdOmsWOgmfH5WaxQF66eTOLaVYOiMo8ebkVg8vyn0d9xLcHUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o4QWAaBP; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so497498f8f.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Mar 2025 12:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741719784; x=1742324584; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dvGGozK1zbRjVC1wg0jcLXbemJ8t5CzWul4B50NkPjU=;
        b=o4QWAaBP1tAK6FKM6p/xfErnPOlBIflmn/8noX6C+nZttAzPy4ZsyUYF68Jvgy09Jg
         Q9Dbc2HkbsHu56DuXLqeU/hzS2UiXnuYnmn6t8W867pKh9wj7LslYPGtzDdCjxlauZxB
         A+UKzokoB4jUWH8a033FfTlOSq9DuK4sb7zb9L6YzoeHk7eZX+unnVLTIGvH2jc15scD
         vVZ8PEB+DVw6FXtgihP/iVK0H1ZSy63Vdx8+hLuIWlNSCRKM6+ibxbN/jA+04yLGtegN
         GSvlNy+Rk20MwzOKhGgjGzR2+dMJIxQFMNBDcphXa7TVinUofZKauFwwOvvjcTtaD509
         7KKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741719784; x=1742324584;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dvGGozK1zbRjVC1wg0jcLXbemJ8t5CzWul4B50NkPjU=;
        b=aWD32O4jK6/pNS9BGMvsEku/X2JrUPbrBsMLUtsJylw7kca0ZgP8DS8lDELryccyJ7
         Ru/T7qk3KLMr9cARoJcsxvNWzZvKyC9svVsqbe7EngkfnXNVqtLUhge+9ZXwgIyWhve+
         iJPVW9Z4VrtyvQtOBxheEoFL35NMx6w276e33f1sHEZVh6eyTgIOFVsvMEyjDsq/Zi4v
         BxS7IzSoLU5porHSxU/3sXKvNcgudiTh0FEca4QTDpXc5N14VhqT9+7sZxCPrttEuHMo
         yX8+oRXTuyZZuyHy0pnJTLM3e02gx/SVUF39hLz6cB4MqhijX+/c2QHlOEFoT0lLmDrC
         GH0w==
X-Gm-Message-State: AOJu0YzM7ReHOmodHL5b++7UhpYmxZbulpIzF2nYnZZEB6p9HAGJF2eK
	9dfiQISpO+xdbvMvKbM6EbxqSikyTBxbDOM44BTjJ99/Aj/IPi5YraNMs4bE0GU=
X-Gm-Gg: ASbGnctsZBexsqEvbbq4ZhMs1QB4TlXVQ5B7eM7hqDMHxWLBT87C2uPlpgHnDzP5AvX
	xwLOyzFqymkTCRQnEPL1nQW42c3E5aS7jTWKCXtEL0gvocCDbsEI8BzSBI4EoVkjGUMRUFWEU0f
	BeWuXaTnUgm8RXh9CWUKpd36T0srvhL40ZT5x545ax7dX26lIubgSt/dE+cCo93nL7TeYvz2JJA
	V7Yz7utzImONz3hN0jsbAkJfHlxXA1Ue63vcFai7iXUQR8cco5LG3SuL62K1a3h9Oi+XpefKGcL
	BjORSvPS3lhVcUyf4y5A+PCoGwdwXKrcbhKdeeXR61dtMbtoHmRb5l8IxY4=
X-Google-Smtp-Source: AGHT+IHfVFndmBoc1wN//r4n8KYaa9qn/KE4wNIs4NioCnlX1OGHs+pWytGe7WhXgpO5rc7MRjI7Bw==
X-Received: by 2002:a05:6000:4021:b0:38d:dee1:e2d2 with SMTP id ffacd0b85a97d-3913bb2f050mr4672807f8f.2.1741719784180;
        Tue, 11 Mar 2025 12:03:04 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 12:03:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:07 +0100
Subject: [PATCH v4 17/19] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0
 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-17-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6583;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=PSTyTqOx7jja3G6Cv6HLW9r6HL9E2Dl8EyxIZGayVV4=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IizedGslJcqs9O7xgbEi0QEezrZOndjJO4nq
 mYc7xUS9K6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIswAKCRDBN2bmhouD
 1waCD/9hMY4oVZPgHZ+W/J1KC1qrNSegkjn/gB1iZ28MSSBW7MxGQwvOQmhoR5VJudb1NU95NIM
 nI8nGWwuwGSSEkZ/nBsBIq2uxcU24/GCO9XNJwrZqEtwkew9yyKsGPEaQnpuVMgZ/hhKkyoIEzb
 QM7CPwAAUsN7OL7G6DtZr+X1AXT8LmE92BZZHiRrHoaJjhxBTBNevmmb/0RiDyKHHqK6vtikunJ
 pOi4fSQq7jU1EwiXaxB4PiPxl+PLNdOhTQGKCoHEkulHPdEMROOPte7zulzREdte6GNQmyk/EB0
 28wu1p/0nzOHDDJz2CHZY0mZTKW/YXTzW02jCX05lq552Tijo6HU7S9IuNZawU7C1yiIJjIjNlu
 KRJeqTdYseMqIvTPyZQLvl9JtD1quIzztGP5IpyM1iepkw6+aAgU/cTr9aF4yad9PQeGJB7V6YF
 JXvtPcuTiIy9fD1SwZCFeSxOy5MO3Hj+OSahT3CSrZmyKhnIZLu4mNWia/GYevYRYHDlWIofGQ2
 Mp6oigoP1W431RzObU5trRIpulr0TnMN0xC8jOBcSA6RQHwCyvZslPnwrNAvk+shBf3D3WnbTkW
 rBz1JKQXA3+tm+bLsbwQaQH7n93qCFB7C05yGLcCroRnsaSFStJBCUSzMNHc6h3z0mXQusynb+y
 I1ZgWc+x1lGHvuQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
selective activation of pipes, which replaces earlier
dpu_hw_ctl_setup_blendstage() code path for newer devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Changes in v4:
1. Lowercase hex
2. Add Dmitry's tag

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 90f47fc15ee5708795701d78a1380f4ab01c1427..3135e5ab9e8121f3dbd93dde9458f007ae45392a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -452,8 +452,10 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	uint32_t lm_idx;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(active_fetch, SSPP_MAX);
+	DECLARE_BITMAP(active_pipes, SSPP_MAX);
 
 	memset(active_fetch, 0, sizeof(active_fetch));
+	memset(active_pipes, 0, sizeof(active_pipes));
 	drm_atomic_crtc_for_each_plane(plane, crtc) {
 		state = plane->state;
 		if (!state)
@@ -471,6 +473,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 			bg_alpha_enable = true;
 
 		set_bit(pstate->pipe.sspp->idx, active_fetch);
+		set_bit(pstate->pipe.sspp->idx, active_pipes);
 		_dpu_crtc_blend_setup_pipe(crtc, plane,
 					   mixer, cstate->num_mixers,
 					   pstate->stage,
@@ -479,6 +482,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 
 		if (pstate->r_pipe.sspp) {
 			set_bit(pstate->r_pipe.sspp->idx, active_fetch);
+			set_bit(pstate->r_pipe.sspp->idx, active_pipes);
 			_dpu_crtc_blend_setup_pipe(crtc, plane,
 						   mixer, cstate->num_mixers,
 						   pstate->stage,
@@ -502,6 +506,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	if (ctl->ops.set_active_fetch_pipes)
 		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, active_pipes);
+
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
 
@@ -528,6 +535,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 					mixer[i].lm_ctl);
 		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
+		if (mixer[i].lm_ctl->ops.set_active_pipes)
+			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index ccf492f27140a2841b454d413e885e4bbd9ee497..aec71a86f809afedc2660d66d2cbf4109c302067 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2191,6 +2191,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
+
+		if (ctl->ops.set_active_pipes)
+			ctl->ops.set_active_pipes(ctl, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 3e5e1e09e9d00ade74371489b2b4e50e648e2d16..c9c65d5e9d36d3a4ce2aef9f57da631f2acd9123 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -42,6 +42,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12c
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -676,6 +677,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
 
+	if (ctx->ops.set_active_pipes)
+		ctx->ops.set_active_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
@@ -724,6 +728,23 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
+static void dpu_hw_ctl_set_active_pipes(struct dpu_hw_ctl *ctx,
+					unsigned long *active_pipes)
+{
+	int i;
+	u32 val = 0;
+
+	if (active_pipes) {
+		for (i = 0; i < SSPP_MAX; i++) {
+			if (test_bit(i, active_pipes) &&
+			    fetch_tbl[i] != CTL_INVALID_BIT)
+				val |= BIT(fetch_tbl[i]);
+		}
+	}
+
+	DPU_REG_WRITE(&ctx->hw, CTL_PIPE_ACTIVE, val);
+}
+
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -786,8 +807,12 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
 	c->ops.reset = dpu_hw_ctl_reset_control;
 	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	if (mdss_ver->core_major_ver < 12) {
+		c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+		c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	} else {
+		c->ops.set_active_pipes = dpu_hw_ctl_set_active_pipes;
+	}
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
 	if (mdss_ver->core_major_ver >= 7)
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
index 1b40d8cc92865e31e5ac4a8c3ee8fac8c5499bbd..186c467e1a64e71116b65b19dd8ecdbb09dac114 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -256,6 +256,14 @@ struct dpu_hw_ctl_ops {
 
 	void (*set_active_fetch_pipes)(struct dpu_hw_ctl *ctx,
 		unsigned long *fetch_active);
+
+	/**
+	 * Set active pipes attached to this CTL
+	 * @ctx: ctl path ctx pointer
+	 * @active_pipes: bitmap of enum dpu_sspp
+	 */
+	void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
+				 unsigned long *active_pipes);
 };
 
 /**

-- 
2.43.0


