Return-Path: <linux-arm-msm+bounces-23979-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCE79150D4
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 16:51:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1765B285DFB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Jun 2024 14:51:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F33E71A00D9;
	Mon, 24 Jun 2024 14:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F303LgKt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AED19FA8E
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 14:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719240439; cv=none; b=CcWiYqQcoX+IONVLpH4ony5iKtn4tLIzYIyuN3ey2OtFHHnTehu+SRxzlQUKkwacCAhgqWd/t/qfcoZuQR0e6m10R2fzWjSusVa/GkqnMmiFGzG0uRFJyzF0X6gM5rIpv1Agd+7L7tQHpvuO9BrldFGk/cYCxvymZB9FoRIiG34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719240439; c=relaxed/simple;
	bh=+m6EcRPOVuIQ4Ug721Qf+o7LpvWeO2gPaRzcMB1CAms=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P2v6tdzUa9h88U1HyrMwAT3HEI+SWh11la91kGvUIIv71AXker7U+IbIZf8y1rEYUN/P0muUV5u7TJRhyAMwsMdH62001NOiSl8ubOROaTYfOd86kysbYaj6mR4zNclvZr4Zxy0jkOL79NKFGry35mTqPCyOv70duFmaLG/d5M8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F303LgKt; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-2eaea28868dso58626171fa.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Jun 2024 07:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1719240436; x=1719845236; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HKZSiV9G3gFkGj7hwm8fSGNfiB8+3czA2DqUvgFsmYA=;
        b=F303LgKt3hMXDeNZ0FTg3z7hlu2ELMfT7Qv6sGao1aGQS55YpvPw8q1Xy1ibk707ML
         96NwtTEDzNgIg9TO49luIp1pO7XpikQVsySS5DtRjzgQMnYWlp3wFx0gXvWaLzbj0Adl
         3deWxVOPIBKZxNnPB5X6Ds65bsGm4+jb8dKfWrq0JChuxKbfy7zxJaq0LJXQsY/6ldZJ
         b7sWmDONxrCLcvUgHRhMSUam3OWIzSuosa1UiWABnAwlGhDwHLIJ1bh/LKxH9bihDhdH
         T8B37lfj+WqgHA2Ie9XVGPuyC9TWNIN8tJh6sEoS74hT3hxs1M0wQo9u2MN2rPiMW9hf
         DYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719240436; x=1719845236;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HKZSiV9G3gFkGj7hwm8fSGNfiB8+3czA2DqUvgFsmYA=;
        b=uHlqgxJsQbYFUodzMiywCajPhDDDwceNTYD3wSddPVxyyaZvsYUDmVF+6KE2ZCPJS6
         Mj0UQ7g2RrOX3+/yaLScBSJcc5HyXJIVVoe1WekTVHGpUBfffLLnZ1Msm1coxo67zvvh
         lw06HW4y3w7rq28kai4Gvco+913ZCMqozvCQEhRxqK2F+1O9kVGbDE554n0rQ/0UmtEe
         auxYHYO1usVLw2T48dLUnNy5HuoTyUP2VBH8vw6QQUnPfb4W/N7oANRKho75cz95dSxt
         cWNVOx966m7JyBJjdVVZ5XK/nNUKAieuShUl+ntUA8PhUhvjT+I1F+e4RHU+HdKw8Q9w
         Vswg==
X-Forwarded-Encrypted: i=1; AJvYcCUw8xl2ffB3QOgDLly50fmX9SZpU/sX3sEwfenQOLPSzJPdJl4+H/6nKbREsAQqEL05sLN1gz6UqoT5UGtsiFxKpLxnxQms++ZYxGJk6A==
X-Gm-Message-State: AOJu0YwVEs4WYFDOQJDRhPYhBLe2ANPkiF4CI7jjW7jwwC834/7nB6RA
	0r6NLR7nhctXrc5Ptl3NAR2TGWaiQB+8SeGTm1bvgT+wuX21FR8BM9qFezO23aY=
X-Google-Smtp-Source: AGHT+IGjWyw92lHNP7WN9sIPkY0MlaC5IXBfkIA1CI8Fj49YsgxAjvxPMLiq67r0wc0OT8gL23ScEQ==
X-Received: by 2002:a19:e048:0:b0:52c:da18:618a with SMTP id 2adb3069b0e04-52ce185d011mr3404343e87.68.1719240436105;
        Mon, 24 Jun 2024 07:47:16 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52ce88b0119sm212699e87.222.2024.06.24.07.47.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jun 2024 07:47:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 24 Jun 2024 17:47:09 +0300
Subject: [PATCH v4 03/16] drm/msm/dpu: move CRTC resource assignment to
 dpu_encoder_virt_atomic_mode_set
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240624-dpu-mode-config-width-v4-3-1038c13da3a5@linaro.org>
References: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
In-Reply-To: <20240624-dpu-mode-config-width-v4-0-1038c13da3a5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmeYbv+lCDZcmtttJ+Vyy/aLapjmxxlpslC/UCp
 zEViRKo3VeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZnmG7wAKCRCLPIo+Aiko
 1dXoB/oD8Bb3sqlC33TAJAskbzM1jPxUaR8zv+D4s8LxmWRJDDod4NdeKjMZfVWXRhObKnjXPWF
 DE9M10kPevPDUG4SVwFiLLEVJdEOQSOmXjlArP+FPTAfqCkUuMKMe7rgT+C591Bdugwyj/wVVvj
 VdmJdKCQgDwSYjnHou7fbHcnJwqBm2N7IcrRgA9+qDwalZKGuNn6jWdZyZtYgSD0ftf7XwSaW/Y
 iQqsVCiEZiDJ51tFns9pYIzODC8YXAzd2jK6zQ+Yfa9pKxdg/jMxZSHuf/qr+5+GDdqs3VFwu2G
 SQGXpCFuhmQ620bLb+MIoWj7XJXWrhydqa4UJNKqaUB/iamX
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


