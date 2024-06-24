Return-Path: <linux-arm-msm+bounces-24030-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 80B12915882
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 23:14:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E8F0D1F24978
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 21:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 207B61A08D6;
	Mon, 24 Jun 2024 21:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pQXJmj51"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 261081A08C3
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 21:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719263632; cv=none; b=Y5Ipi0PI0T1jbU2POlq4nsGiJEj+5uDACU5kk4v7kr4HhrXhW6DHS4cNrsjurKStQKi6K4KuBP2ly1MITdeugeoLpgXkJGDRp9Wsxz6JDUF6mbckrn3tJLMwQVhlROYaSoXbtlmrLNkpv1m1Q+cIkNH9FsZkDq2VqTmeccVWkCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719263632; c=relaxed/simple;
	bh=+m6EcRPOVuIQ4Ug721Qf+o7LpvWeO2gPaRzcMB1CAms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rR5s4M7Z6opMIzwiKp1cc3hg5fyJxomFTuHfXA/F08yZ5LObCfIhEFKhYgLPwOSYnTNNmZiSE7srftmkb+ZEDjY0iJu3JUFTRppVo0jof5mgeLRhRaxBZAMSFZoR8NX2lGwRHWNZgR4p/dJTbozGTim4NO4ITcgtgJcuoHo05PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pQXJmj51; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-52cdf579dd2so2284944e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719263628; x=1719868428; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKZSiV9G3gFkGj7hwm8fSGNfiB8+3czA2DqUvgFsmYA=;
        b=pQXJmj51zoHfxCZ3eVM7EOVwiWdpEF8f8Pv536KWC+VUjx4paD1fvI5Ryag1asRKlT
         6S3/9HPdZO1pvvmSKmdIPUTgNBxcQMHKDOWg7p0BremXoP76HrhY534CP5BP+O2X366F
         XBcS0BzmXZP4o/kweJzmBTPldQqra2xEUkBnGxl9lcIp7dA3ncRhnJJAELseEVUCP9hz
         Jft6YFZnjPhEOrG/tDc8b5VMdbslQeY3XlNl0OE0rUccFOURTHO3LhnZMJmdv2hkosaj
         UpygUz/dfX78nK/6JWOQZZe+M+0XZRJ++VO6Vh8H/kvfQijmPc/zoVyhoq5kJruOWnve
         +zfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719263628; x=1719868428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKZSiV9G3gFkGj7hwm8fSGNfiB8+3czA2DqUvgFsmYA=;
        b=vP+mVmJHB1f+TqPbXL/7o18HLAkTqBtw5DF8TawXzez1LA5sSFc+ixAnY+se7YxHls
         jDj1ALztNjfIhmFUBY9eET32ZbCzak92IDwC9k3ueeSYMUu5jaTNA4/o4IIldgJgvuLj
         swbNHWmK6o2Zad1v28q867Rz7tEjnu2caO0c4kXj/GyuwRbcGwsjpxtH5sThFx8qRMWE
         odgOweh4KtplF7h34JfftnYxkk52jgOks6DaKaT6wmw+OohvQ2UlVepF777x4Q+xqwSU
         WH7Z6IrGlh4N9+EAJ4+hs9aoYFF11BAKnXdbffM114C2MmNLUme3jGJE3cUfXm4o3g7s
         kDjA==
X-Forwarded-Encrypted: i=1; AJvYcCWzl1j1JtrSHYfkLUfxmXv3gpymlR1506fzbBg+Hu/DWTL8rfynWJnm/NwUr8d7/fI9ZXSCtAn2L0FDMBnxZOtl+qHbgvwOZVwUd7xeIw==
X-Gm-Message-State: AOJu0YzshDeKJX0oza2rPtYovjDzcj+mjZO+N/utexIDamdY0nM1XoiP
	FmWAT6tRE2tXbiGodB7JyxqhLneIjfkzA7Moabh14vGOzaBSON9DNd/4lyI60Zm4QfhlmlOmrWt
	2Vso=
X-Google-Smtp-Source: AGHT+IF6LNrOvvqTzVzX9h7Xhymezjdfemr/jc2WZQK7AgtER9k4c1m+jefDl2JNq4omI6ew87Fasg==
X-Received: by 2002:a19:9155:0:b0:52c:8a39:83d7 with SMTP id 2adb3069b0e04-52cdf8209cfmr3228372e87.52.1719263628370;
        Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52cd63b49f2sm1057512e87.56.2024.06.24.14.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 14:13:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 25 Jun 2024 00:13:43 +0300
Subject: [PATCH v5 03/16] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_mode_set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-dpu-mode-config-width-v5-3-501d984d634f@linaro.org>
References: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
In-Reply-To: <20240625-dpu-mode-config-width-v5-0-501d984d634f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5674;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=+m6EcRPOVuIQ4Ug721Qf+o7LpvWeO2gPaRzcMB1CAms=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeeGHnYt4E8EYGiHRBPHG8GXqC43TBbSloAIAL
 m7O1FTjOhWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnnhhwAKCRCLPIo+Aiko
 1c8CCACJA5qJ/m5TBHkrNRIs29eb5WCiMyYN5NY+xBeqbvVhHAlF+asUm/fhDUHCkg2e+M40pZA
 jK1bMAAwVeHfKWVLRLU7rDiRCxoZlOhbNeAZZg0qS9V2ITOIh1jgkUi6kiGchoCa8jKuzuhIrTX
 7sWcgRv8i4IAaeCE9EMDs+bHrDb8omJ6ParlCzHNpi0e7wSe9a7FQkKHBbynU5iucdwktbEv04o
 0qQo4bauys8h1F4gULZ6LnfbQHLtZqd1k5gkL8VI4jDrvw8m3E+2in7jslLF/+K0C78l8fAU8u3
 vMxVvJGMKBle+fXAl8gxD0rkVJj3yUOyf4OKTumVfRVHdgUX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Historically CRTC resources (LMs and CTLs) were assigned in
dpu_crtc_atomic_begin(). The commit 9222cdd27e82 ("drm/msm/dpu: move hw
resource tracking to crtc state") simply moved resources to
struct dpu_crtc_state, without changing the code sequence. Later on the
commit b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder
modeset") rearanged the code, but still kept the cstate->num_mixers
assignment to happen during commit phase. This makes dpu_crtc_state
inconsistent between consequent atomic_check() calls.

Move CRTC resource assignment to happen at the end of
dpu_encoder_virt_atomic_check().

Fixes: b107603b4ad0 ("drm/msm/dpu: map mixer/ctl hw blocks in encoder modeset")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  3 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 60 +++++++++++++++++++----------
 2 files changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 9f2164782844..7399794d75eb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1094,9 +1094,6 @@ static void dpu_crtc_disable(struct drm_crtc *crtc,
 	drm_for_each_encoder_mask(encoder, crtc->dev, crtc->state->encoder_mask)
 		dpu_encoder_register_frame_event_callback(encoder, NULL, NULL);
 
-	memset(cstate->mixers, 0, sizeof(cstate->mixers));
-	cstate->num_mixers = 0;
-
 	/* disable clk & bw control until clk & bw properties are set */
 	cstate->bw_control = false;
 	cstate->bw_split_vote = false;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7613005fbfea..98f3a8d84300 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -628,6 +628,41 @@ static struct msm_display_topology dpu_encoder_get_topology(
 	return topology;
 }
 
+static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
+					      struct drm_encoder *drm_enc,
+					      struct dpu_global_state *global_state,
+					      struct drm_crtc_state *crtc_state)
+{
+	struct dpu_crtc_state *cstate;
+	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC];
+	int num_lm, num_ctl, num_dspp, i;
+
+	cstate = to_dpu_crtc_state(crtc_state);
+
+	memset(cstate->mixers, 0, sizeof(cstate->mixers));
+
+	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
+		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
+		ARRAY_SIZE(hw_dspp));
+
+	for (i = 0; i < num_lm; i++) {
+		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
+
+		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
+		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
+		if (i < num_dspp)
+			cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
+	}
+
+	cstate->num_mixers = num_lm;
+}
+
 static int dpu_encoder_virt_atomic_check(
 		struct drm_encoder *drm_enc,
 		struct drm_crtc_state *crtc_state,
@@ -698,6 +733,9 @@ static int dpu_encoder_virt_atomic_check(
 					drm_enc, crtc_state, topology);
 	}
 
+	if (!ret)
+		dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc, global_state, crtc_state);
+
 	trace_dpu_enc_atomic_check_flags(DRMID(drm_enc), adj_mode->flags);
 
 	return ret;
@@ -1097,14 +1135,11 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_encoder_virt *dpu_enc;
 	struct msm_drm_private *priv;
 	struct dpu_kms *dpu_kms;
-	struct dpu_crtc_state *cstate;
 	struct dpu_global_state *global_state;
 	struct dpu_hw_blk *hw_pp[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_lm[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_blk *hw_dspp[MAX_CHANNELS_PER_ENC] = { NULL };
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
-	int num_lm, num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc;
 	unsigned int dsc_mask = 0;
 	int i;
 
@@ -1133,11 +1168,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
 		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
-	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
-	dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
-		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
@@ -1163,18 +1193,6 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
-	cstate = to_dpu_crtc_state(crtc_state);
-
-	for (i = 0; i < num_lm; i++) {
-		int ctl_idx = (i < num_ctl) ? i : (num_ctl-1);
-
-		cstate->mixers[i].hw_lm = to_dpu_hw_mixer(hw_lm[i]);
-		cstate->mixers[i].lm_ctl = to_dpu_hw_ctl(hw_ctl[ctl_idx]);
-		cstate->mixers[i].hw_dspp = to_dpu_hw_dspp(hw_dspp[i]);
-	}
-
-	cstate->num_mixers = num_lm;
-
 	dpu_enc->connector = conn_state->connector;
 
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {

-- 
2.39.2


