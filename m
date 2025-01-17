Return-Path: <linux-arm-msm+bounces-45428-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4403FA1539C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:04:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id F198F167CF4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:03:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A8F7F19F42F;
	Fri, 17 Jan 2025 16:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Id22bjbm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0354119DF66
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129745; cv=none; b=RCAJmj0qffMQC6kn8kf373K1y4O+dIz7YjB3fv13oEfkBdCLIiykqqKSJWsaoKfWPes9ma/Th4xtevXj+jWoliB9H+yqSkgXz0ctgavLp36qq+T0ehIXOfnF5tzfJ0go7ENoM48Ce5g9qhxgllzofdwd4i3J01g7RL//lQH9yls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129745; c=relaxed/simple;
	bh=mNnbVchZDWdr8Yg/YpTwQUIazQTVsbTUg2THmF3QLm0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IQ5xaWyNcl8FCfDHASDS+9rUBwZYhp1qHQp4Ly4eLv/fMbhVrb7WGIa/UP8ew+spUF5OgyZa8mfQg+8ylTXNmPhJpRGITFIFdUIZqEinzOnfj94oiY04xgzgvJdjEOrBhX0sDdQMei5ssUy89jMbRq+s5AZvyPotLCsbIhRXQ3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Id22bjbm; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166f1e589cso57874885ad.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:02:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129743; x=1737734543; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cOulllN9aZzFO446Lt84ogptCoA3FAWcE93Bj/EGSKE=;
        b=Id22bjbm1q5bq/lzM2kVt4/gOwsBUgjg0HfpkuhswMqmWDaOMnCJDQo41XR5whsyzT
         LbBNLilDqlR17sL7frElklmCrWGONh9tg5AWjIazpy2jV1t6FABT6NXHhYwvgVP1En5/
         AURve3M8bCmE8PdCCMZOoyg8aXiJIR6FEvJmpUSZqXLJjPm287PLZX0m8IL8c0+O6+nI
         BGOPXqRTWjF7u5dMhkqp8ZiQsCtJGL0LoMnFZ1Opmo0dAvfUo6OSZkoS2jQNHF7CGbt1
         ka6EqIKNUmoTmbwGeickh/sZKtnkbydYJ1vEYaqkg1WNfctga+ZZEhtvuNuJov04/OwT
         yqoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129743; x=1737734543;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOulllN9aZzFO446Lt84ogptCoA3FAWcE93Bj/EGSKE=;
        b=anmpbqnXr9Qp4QtuKcyxaRD9xJSFI01iiAIbry7uwvdZ2LU6lm58uwiGUuqrCSUops
         vxcsMlts6tjsxASzqGfUbDZk2FH7yrAOBqswkNfGy9mSwTOBn0yZcUFptegZPidf2ge/
         tv70hSxGHBYmME0Jo0mYHFvVa4IEMw52Ky5mde01S9ncB9nqeo1MZaLaFjzKaeFkjPvH
         quVf6HT7mveIehiDGZpdnayiKLQGGG8N7NQrpqrY0TakjazZNDEtDCc9pgp4CuqDJ7ry
         ScxJ2ZAB155bm8P45l38+DuiVoKvcLgb9aM+x3/m4zvmpB40LJF48bOIzWugfFWY5H3K
         zF1Q==
X-Gm-Message-State: AOJu0YyGdZ56WSos+ICZQDsdJtFPa6jiP9k8PM68ynu8aorrPH3D4wIT
	PeUeI9Dr5jZqUJZ66kYSMjTJAw7ejEjyoAf22PCw3Uc8MonkChRr68o+RPvp64k=
X-Gm-Gg: ASbGncsuPG/vtBWS+rE8UpoDuRtg56EunI9cLy8QwChdD/Ydv6AWfLjbev9b1pQawGw
	NnYkh9B3K4FFiZZ9hobk8sPbVSa9eCd8URwdw4ahX31NqWVpYBgF+Ip8vZXoyItxfFWlrP+maNy
	vtjErg2ziGrKxjo8rh6R8X7hZw0asnNlNTpuTrf6dqw3LBSgDsh0FQOwKLNOpYi+n+ng/9pX/zj
	02gyKDM8naHHnXbmUq+JHV0blhl4JZVasiT5cH1R/9fcGBGskTh8Q==
X-Google-Smtp-Source: AGHT+IHpuygeP4a3oblxntKAoJkuSHzCTb/co1je6xxoMOTx17zxeIbEsAukBbzSmaNPTXrbekg4gg==
X-Received: by 2002:a17:90b:37c5:b0:2ee:ab29:1482 with SMTP id 98e67ed59e1d1-2f782c98743mr5030832a91.16.1737129742042;
        Fri, 17 Jan 2025 08:02:22 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:02:21 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:55 +0800
Subject: [PATCH v5 12/15] drm/msm/dpu: blend pipes per mixer pairs config
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-12-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4804;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=mNnbVchZDWdr8Yg/YpTwQUIazQTVsbTUg2THmF3QLm0=;
 b=78hjrdHzB29udjI1uXAhjvAvBl1liprsGWe6tFMH4pkq8Aby2Yq0rMlEofTeRg69Ca1NObJj8
 jrzJOJXVfiuBwitXACcoo3kcVOlmCtvHOVXazTtr9leG1fBdjeEOFax
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, only 2 pipes are used at most for a plane. A stage structure
describes the configuration for a mixer pair. So only one stage is needed
for current usage cases. The quad-pipe case will be added in future and 2
stages are used in the case. So extend the stage to an array with array size
STAGES_PER_PLANE and blend pipes per mixer pair with configuration in the
stage structure.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 45 +++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 2 files changed, 30 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 81474823e6799..50acaf25a3ffc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -401,7 +401,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 				       struct dpu_hw_stage_cfg *stage_cfg
 				      )
 {
-	uint32_t lm_idx;
+	uint32_t lm_idx, lm_in_pair;
 	enum dpu_sspp sspp_idx;
 	struct drm_plane_state *state;
 
@@ -426,7 +426,8 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 	stage_cfg->multirect_index[stage][stage_idx] = pipe->multirect_index;
 
 	/* blend config update */
-	for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
+	lm_in_pair = num_mixers > 1 ? 2 : 1;
+	for (lm_idx = 0; lm_idx < lm_in_pair; lm_idx++)
 		mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl, sspp_idx);
 }
 
@@ -442,7 +443,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 	const struct msm_format *format;
 	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
 
-	uint32_t lm_idx, i;
+	uint32_t lm_idx, stage, i, pipe_idx, head_pipe_in_stage;
 	bool bg_alpha_enable = false;
 	DECLARE_BITMAP(fetch_active, SSPP_MAX);
 
@@ -463,15 +464,22 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-		for (i = 0; i < PIPES_PER_PLANE; i++) {
-			if (!pstate->pipe[i].sspp)
-				continue;
-			set_bit(pstate->pipe[i].sspp->idx, fetch_active);
-			_dpu_crtc_blend_setup_pipe(crtc, plane,
-						   mixer, cstate->num_mixers,
-						   pstate->stage,
-						   format, fb ? fb->modifier : 0,
-						   &pstate->pipe[i], i, stage_cfg);
+		/* loop pipe per mixer pair with config in stage structure */
+		for (stage = 0; stage < STAGES_PER_PLANE; stage++) {
+			head_pipe_in_stage = stage * PIPES_PER_STAGE;
+			for (i = 0; i < PIPES_PER_STAGE; i++) {
+				pipe_idx = i + head_pipe_in_stage;
+				if (!pstate->pipe[pipe_idx].sspp)
+					continue;
+				set_bit(pstate->pipe[pipe_idx].sspp->idx, fetch_active);
+				_dpu_crtc_blend_setup_pipe(crtc, plane,
+							   &mixer[head_pipe_in_stage],
+							   cstate->num_mixers - (stage * PIPES_PER_STAGE),
+							   pstate->stage,
+							   format, fb ? fb->modifier : 0,
+							   &pstate->pipe[pipe_idx], i,
+							   &stage_cfg[stage]);
+			}
 		}
 
 		/* blend config update */
@@ -503,7 +511,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	struct dpu_crtc_mixer *mixer = cstate->mixers;
 	struct dpu_hw_ctl *ctl;
 	struct dpu_hw_mixer *lm;
-	struct dpu_hw_stage_cfg stage_cfg;
+	struct dpu_hw_stage_cfg stage_cfg[STAGES_PER_PLANE];
 	int i;
 
 	DRM_DEBUG_ATOMIC("%s\n", dpu_crtc->name);
@@ -516,9 +524,9 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 	}
 
 	/* initialize stage cfg */
-	memset(&stage_cfg, 0, sizeof(struct dpu_hw_stage_cfg));
+	memset(&stage_cfg, 0, sizeof(stage_cfg));
 
-	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, &stage_cfg);
+	_dpu_crtc_blend_setup_mixer(crtc, dpu_crtc, mixer, stage_cfg);
 
 	for (i = 0; i < cstate->num_mixers; i++) {
 		ctl = mixer[i].lm_ctl;
@@ -535,8 +543,13 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *crtc)
 			mixer[i].mixer_op_mode,
 			ctl->idx - CTL_0);
 
+		/*
+		 * call dpu_hw_ctl_setup_blendstage() to blend layers per stage cfg.
+		 * There are 4 mixers at most. The first 2 are for the left half, and
+		 * the later 2 are for the right half.
+		 */
 		ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
-			&stage_cfg);
+			&stage_cfg[i / PIPES_PER_STAGE]);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 5f010d36672cc..64e220987be56 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define STAGES_PER_PLANE		2
 #define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES

-- 
2.34.1


