Return-Path: <linux-arm-msm+bounces-49508-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 25EAEA45F58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:35:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5BFC01777EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:35:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1FA421D3F0;
	Wed, 26 Feb 2025 12:33:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PXUcEWQS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F41C221703
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573232; cv=none; b=CessquHWMMLIQWT0ABG6IRcGDicr+rojqq2KljrV27aq3+3XWn6PD7KsH6r9cqu8f2NN9y9MRUfFtBvkcBFpAH7Y/Mmg/qpQtFOejsBu9T3FCm+sIIDik8166vxERvTXbtKCyBFqtk8aF+u64pfL1lN9PyPMPa1Dn/ZLGUKlNBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573232; c=relaxed/simple;
	bh=lK2zpnkmypG1djckaz9FnmdKtFocUQgptRIASed/8K8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ma+7IE0apWF95zgbt/ue0zVz0Z2ubZNRBRJcQjDEAaxqGauXhlSB8gJzMNs08w2JzqGvdsIHVDdLF2CMaik4lAgbJgdykIXMlJzs9gdQaDaPkQI7pIZLhrv2m2ItUg1kSTXuRoFOZzMgGulVwcT2eTN/VxeSW/kLthaP5jqWqvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PXUcEWQS; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2fc0026eb79so13482413a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573230; x=1741178030; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=77s7vz+/WLZt970t45pLBthxCe7Wu9JvkeWBAau9QSc=;
        b=PXUcEWQSn7bPiQVpsYb679U8MKCBKxig4LlRuo8srKUQqgq/gC+MgpsH/zQyYPjVeC
         +gjdzAESwx8h5MwMQGVe2ssBZgqGdChkF87WbRIqWqdhcMiNcYQD+BE8oNeIAKg2zl0n
         w4Aw8VVS2qAfk4OE7rxVy2eDXIwmBB8m/zqvNkIMJZn1G20m7INfS1kBraPABvKRc8Uc
         4uIokMeoAgSUa12Tn8cd60GsMJ30B5N9/0TrNrrr0r5jmjpPucisvM0Xt0faDT8z94KO
         hzizr3vf/yC0U5/3V3a52tzwVayp9SRy5neXn02Qj6w6+QOrMCYUYpEQklBZGvBSjAiF
         kccQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573230; x=1741178030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=77s7vz+/WLZt970t45pLBthxCe7Wu9JvkeWBAau9QSc=;
        b=SSvtBlPnnQX3Z/DRl3ry6ItZMjE9L5DShPrWqS3DixSW0rX7SaUYX8yijV7RtBAf33
         3AdhxTBabOFKwAxxioE/dnlnKdRPdS9IOtfdbodyKGiaF+3zFB5sWUzKgi2fYsXWRyIT
         1Qj27KNtTzbacLoNqq1xH/mCKfKB1zJ5ILCjq4gQ4E8BCMwH2dilAWtoIPFFele5kXCZ
         Pz/cNp9gehHDh/Cr+nqKhQOjrErj1W4FBTmYyx+70qh+WmZP9goTgMFD9VwavDmDPWz9
         JsDBhRpJz3phjBiciw9CY1fqRg5M76aaHKiody+Q+xNrGhVpu6Lv4cFxQSC+DhLQcuqD
         uOpA==
X-Gm-Message-State: AOJu0YymLIo65xzgtTMracBPDxQxdoaduFxOmVjOdyOFDUPq2rST2AeL
	GoeROGrP88lUPjqzPzXk84GTsnyfAyr5CADVkZIs6GFexVJW/X5DMX4GwpdrcYm5Vy9ZRj/MCMI
	DneenbS7U
X-Gm-Gg: ASbGncv39mpGrPeDJa6rjuci5gVuDorPeXVOFitoYHdq5xSPqnUhqKo0CyflRq3v/OG
	1Gj+n8wxbukeFycFrOfmBmtrKn5bxm/bBU+6DuG+cPfR/P18aJ1Y5iRvBLvTbWa349N0ENE/TGq
	IUnjhQPfEl0sMIDcUM623mUIx7b1IiitFz4Zywj/+rE26crrFmIeykPnk0t4g383Uxxb8MYvEWC
	JmPTTOLHx6OENDphKr8ncz34kEhpLALkZvoiN8nU9Lab0XHHhJtT5zyDs0AgeKNnOb/kiMGVaB9
	/Y6wYW1qDKUn+UQkVaRwCbs=
X-Google-Smtp-Source: AGHT+IFk1ci1BbhibkAaGpcpOooMiica9MJmrmewXuln4wGcX2YKJyZHDBq8S1eU9D/v3NSe43dWxQ==
X-Received: by 2002:a17:90b:2248:b0:2fa:2124:8782 with SMTP id 98e67ed59e1d1-2fe7e39f185mr5102979a91.25.1740573230422;
        Wed, 26 Feb 2025 04:33:50 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:33:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:31:02 +0800
Subject: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=5677;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=lK2zpnkmypG1djckaz9FnmdKtFocUQgptRIASed/8K8=;
 b=sLmMuO4uTpYyuLd3gJ4Uf3176DFQh9EgWwwxnHE2P9ga3bdgBTFZZppD/U1It7javItMNfU0s
 eIMRdQLCFx5BPu7TfvKxhKsmTCGCn8afs0FT2n7S1U/fCwabSyPdbWC
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Currently, SSPPs are assigned to a maximum of two pipes. However,
quad-pipe usage scenarios require four pipes and involve configuring
two stages. In quad-pipe case, the first two pipes share a set of
mixer configurations and enable multi-rect mode when certain
conditions are met. The same applies to the subsequent two pipes.

Assign SSPPs to the pipes in each stage using a unified method and
to loop the stages accordingly.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++-----------
 3 files changed, 58 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f954cd8c6aed3a222723 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * @state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
+{
+	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
+
+	return cstate->num_mixers;
+}
+
 #ifdef CONFIG_DEBUG_FS
 static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d09e11a43b9b4cf4153 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca42546fbc421609f72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_rm_sspp_requirements reqs;
 	struct dpu_plane_state *pstate;
 	struct dpu_sw_pipe *pipe;
-	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	reqs.rot90 = drm_rotation_90_or_270(plane_state->rotation);
 
-	pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-	if (!pipe->sspp)
-		return -ENODEV;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(plane_state->fb),
-					      dpu_kms->catalog->caps->max_linewidth)) {
-		/* multirect is not possible, use two SSPP blocks */
-		r_pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
-		if (!r_pipe->sspp)
-			return -ENODEV;
-
-		pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
-
-		r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
-		r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	num_stages = (num_lm + 1) / 2;
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		for (i = stage_id * PIPES_PER_STAGE; i < (stage_id + 1) * PIPES_PER_STAGE; i++) {
+			struct dpu_sw_pipe *r_pipe;
+			struct dpu_sw_pipe_cfg *r_pipe_cfg;
+
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (drm_rect_width(&pipe_cfg->src_rect) == 0)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			/* use solo SSPP for the 2nd pipe in pipe pair */
+			if (i % PIPES_PER_STAGE != 0)
+				goto use_solo_sspp;
+
+			/*
+			 * Check multi-rect opportunity for the 2nd pipe in the
+			 * pair. SSPP multi-rect mode cross mixer pairs is not
+			 * supported.
+			 */
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			if (drm_rect_width(&r_pipe_cfg->src_rect) != 0 &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+				continue;
+			}
+use_solo_sspp:
+			pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+			pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+			DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+					pipe->sspp->idx - SSPP_NONE, i);
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1


