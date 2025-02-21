Return-Path: <linux-arm-msm+bounces-48921-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D54A3F8CE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 16:32:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E63638607E4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 15:29:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70FDF221DAE;
	Fri, 21 Feb 2025 15:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aqzEjKT+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3115212FBE
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740151532; cv=none; b=uVeZDLoidgG6+vHMmZ6gLtqDiPUl2yjzvh0YiKGAd/fIckAQxw2W7dsg02Q2vO/0oZwmyzJlx0w3P3lPyuk/7ggmKJ2PcnJ3QgsgVcnEdPGb7TH7xhM5PkzmfDL9aCmTF6D/tb5WRpjGYZqW5gsXkNGnX8enuXPZBfYjJJYX6E8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740151532; c=relaxed/simple;
	bh=qywHZh1a3AzNu2AoRAPcgEJpAFWbwkzThuNgqprskLA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FMBlXCVDU2f3+yeZQVoxgOVRDA3iiDRAE8VSj4VLbQBAPOj3V77biLEuRl4T13OMoUH7AW0CWukCDOxx6HlAOvxdGMCLnEXoHLDNNfQOgMckm004HKaWsU1hVLNZE/o2FIIp+RrB3FkvAtPdD3gL5bmXgPDVjYfkTE6aGTTEIiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aqzEjKT+; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-abb88d2b67eso28385866b.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Feb 2025 07:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740151527; x=1740756327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mzix2WcbdHTOcKqz7Q/5zOK6hK/dDY8oTy+jT/M0N8U=;
        b=aqzEjKT+zxM1DfqLyCSGZY9t83CDL594F95F8L+38ddfvQBENA5KCdIXZ8S70amLzT
         lHkhekjo/t2rXK3dW1Ctq8FHQu6iRkDHBsXTcYhxR18ghoiJNEdH02yVe46iJkDa35p2
         xTLGBdOp8cn+kYlderlZODnH1A6o694QCS/ZDj8wnsXY0FTfQddvEbTHfTbAEggHeQCV
         WNM3Al4Ca9em9WrRb9qYHFEwmM68v04zQZwers2XFfXMC/mV9IVLk/rqcHSle2BFm0Mx
         OfWoZtu8RdWB8sZXgx+FXoSUczUrKKyW5NCwBsSkRxrVN6m0xZc4/6+cUCbmhQKTCfR2
         BrSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740151527; x=1740756327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mzix2WcbdHTOcKqz7Q/5zOK6hK/dDY8oTy+jT/M0N8U=;
        b=J3JIMNSDJAC3olq4UNJ205ayLghTftcZ//pj7wbJo99MxCDJ/SHxRcgQN8rSMEXmK1
         tE8YxBqJzodBIOiJjuz2EBNqKqK4juEMr8ZvbKm+5f2vKVVUNkwhx+qtA6yM1xoyQ4JQ
         TA+zUarjCDjHTPCSY1aYFHXKFdEqhPSP6XRpmjhWsN0e5Fj67LnlSkre2ClBQXFOb/le
         hTlKbRdJm7uhyIsNCo9gNrXrGA/Qau8qhNdRP84qN5biq1uKvO9XeHORWV7DTmrajmP2
         701lcRmgUyKpb+IXq3iwF3sXtA7pt7rUH8hWFWQpWKKQykNSXZ6v2YCPZdWZir9Vh1NG
         T5oA==
X-Gm-Message-State: AOJu0Yz7Yo3sTUGFBdv1UgvqhKbg5agd7LfhXVrOkMA+QZUlDkAJo1vf
	GMBPG5gSOphFzvNF4X29n3iLm93gCaDZVChz6D0wno+jHxePaaA3DhMR/0ASFAE=
X-Gm-Gg: ASbGncvJ7jmiFo1Ouk73VGVOERApVUTGMQSAt6e+OPihHOb1Vbcf+psARDWi2kbxmUp
	UdBt6D4ER+P1oFyEB3KCaUfisgqRhQUEDfg/mY+hBA7kcmSznhJKz5JKfVT7WEYu2qc+u0hC0+h
	TVLe+OWyI5VtCjmqO5Skue4ayub/e7x9eVcjwVvbkQb/MklH4lts43lAqzqjY8SlVhewsyFA+5m
	7bWU+1LdAfLwnGJQSPTTwH7cxW3z8kOOMRLBCcVmKW0ARqSrF+nYtbVbsJeFRM7yAHksh90gV4n
	trCOHN8yIEXMe85tOBLXlfEK6t+pH4OwuKfiYYgV7hrJBfMsj1sMksS/XIjHT9JtnOXs+V4WDQv
	P
X-Google-Smtp-Source: AGHT+IG3C5T4roWr96aFDzbxAqtp7mR2Ps4rGsuliW5b/Aur0MMzt74r4WrFiCoYs3WUiKeHOZZRYA==
X-Received: by 2002:a17:907:86ab:b0:ab7:b545:b2eb with SMTP id a640c23a62f3a-abc099b813bmr151737066b.2.1740151527023;
        Fri, 21 Feb 2025 07:25:27 -0800 (PST)
Received: from [127.0.1.1] (78-11-220-99.static.ip.netia.com.pl. [78.11.220.99])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-abbaa56026fsm865456666b.113.2025.02.21.07.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Feb 2025 07:25:26 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 21 Feb 2025 16:24:29 +0100
Subject: [PATCH v3 19/21] drm/msm/dpu: Implement CTL_PIPE_ACTIVE for v12.0
 DPU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250221-b4-sm8750-display-v3-19-3ea95b1630ea@linaro.org>
References: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
In-Reply-To: <20250221-b4-sm8750-display-v3-0-3ea95b1630ea@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6467;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=qywHZh1a3AzNu2AoRAPcgEJpAFWbwkzThuNgqprskLA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnuJq9LeHb6wqwJ4fYIDJFjxdPiYFofXUuijp0e
 8ZcUXdoOf2JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ7iavQAKCRDBN2bmhouD
 17GuD/9clAoSTnzvQ04droQJutfV/n45X+BvIm8RVIq4dRwjztpie7idFeMufihiRCqlkrLQhqR
 HZFQ8Ovkisz6WKw5Zgs+AO3rXfuv0/Vs6hRrSoIkaUhG4tpgG/nZ5wPejt02qeU5dgW5uLihZGO
 tI8oCUp85qRkjLyY/afp1eyic5FPaXOEqGkVW1ekzLEBiiYE03UT20HgNpWhcqjwp1p8kHm+pP2
 21r2CC3Q0/m+1h6XPzTjLMf3KMzyJz5I5YNmBuAdpbv0pJPfXkh0Ba3kq2oJ0J24aeK1DcHZw6v
 Ms4lEUB1yLizQ+rGL8ZSXLsOap4qjuxxmcFm489jADfseTPdpIp61seh7g7NjuGDoXVDorS8VFK
 pDIJk5aogDhVF/J0DAT7HzCH6Ek0BJBtxD7httkplYN8yN7KmIARL1JD1ngu7TvfYXWBcdtTVj9
 J73BjT7jdsMSY6fiPSc+eh6Oe0HJCj6p5pM59w63weHLgek0CtDykmjaR0SLFSYzcbUmtO3iRR0
 4E/IwIovsO3oj+BXTZCvXmnYSdWU1JSKDxcRk2XUuqqaBBtDifRXb8SLC/teWAzFYRz8EdXjgaV
 TzqV5nBrlevZ47iLayKcGHjhHLqgcL1+wxl72ViePwY61FpRWvfT5jbEvwXmbYNwkDseKSkl9d2
 +WrfF39F1l+MPug==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

v12.0 DPU on SM8750 comes with new CTL_PIPE_ACTIVE register for
selective activation of pipes, which replaces earlier
dpu_hw_ctl_setup_blendstage() code path for newer devices.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v3:
1. New patch, split from previous big DPU v12.0.
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  9 +++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  3 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 29 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  8 ++++++++
 4 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 7a35939ece180c15898b2eaa2f1f451767c741ae..a362a622bc678e11c4e7ed8a05901ad18ccf38a9 100644
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
@@ -501,6 +505,9 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	if (ctl->ops.set_active_fetch_pipes)
 		ctl->ops.set_active_fetch_pipes(ctl, active_fetch);
 
+	if (ctl->ops.set_active_pipes)
+		ctl->ops.set_active_pipes(ctl, active_pipes);
+
 	_dpu_crtc_program_lm_output_roi(crtc);
 }
 
@@ -527,6 +534,8 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 					mixer[i].lm_ctl);
 		if (mixer[i].lm_ctl->ops.set_active_fetch_pipes)
 			mixer[i].lm_ctl->ops.set_active_fetch_pipes(mixer[i].lm_ctl, NULL);
+		if (mixer[i].lm_ctl->ops.set_active_pipes)
+			mixer[i].lm_ctl->ops.set_active_pipes(mixer[i].lm_ctl, NULL);
 	}
 
 	/* initialize stage cfg */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 090b2aa5a63b4797169b24928908215e2424e6b1..2b2b49fd769bd91634201e8921c1830473fc25c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2202,6 +2202,9 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 
 		if (ctl->ops.set_active_fetch_pipes)
 			ctl->ops.set_active_fetch_pipes(ctl, NULL);
+
+		if (ctl->ops.set_active_pipes)
+			ctl->ops.set_active_pipes(ctl, NULL);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 43a254cf57da571e2ec8aad38028477652f9283c..3e0bdd1100ebb0d302a852ceeaf8af86835e69a1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -40,6 +40,7 @@
 #define   CTL_INTF_FLUSH                0x110
 #define   CTL_CDM_FLUSH                0x114
 #define   CTL_PERIPH_FLUSH              0x128
+#define   CTL_PIPE_ACTIVE               0x12C
 #define   CTL_INTF_MASTER               0x134
 #define   CTL_DSPP_n_FLUSH(n)           ((0x13C) + ((n) * 4))
 
@@ -653,6 +654,9 @@ static void dpu_hw_ctl_reset_intf_cfg_v1(struct dpu_hw_ctl *ctx,
 	if (ctx->ops.set_active_fetch_pipes)
 		ctx->ops.set_active_fetch_pipes(ctx, NULL);
 
+	if (ctx->ops.set_active_pipes)
+		ctx->ops.set_active_pipes(ctx, NULL);
+
 	if (cfg->intf) {
 		intf_active = DPU_REG_READ(c, CTL_INTF_ACTIVE);
 		intf_active &= ~BIT(cfg->intf - INTF_0);
@@ -695,6 +699,23 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
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
@@ -757,8 +778,12 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
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
index b8bd5b22c5f8dadd01c16c352efef4063f2614a6..40c8190a329f331401b9503f047c1e74f970eefe 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
@@ -245,6 +245,14 @@ struct dpu_hw_ctl_ops {
 
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


