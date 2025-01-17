Return-Path: <linux-arm-msm+bounces-45423-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DE71A1538A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 2EBA27A4E61
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:02:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D8F719B3EC;
	Fri, 17 Jan 2025 16:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dYMV4dVX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3098F19AD86
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129714; cv=none; b=WAsslRwfgHUn3VPS8FHekCCBUNsoyx9YwY1ba5zLkeLVnTSxu1V1BHqUdRlo7D9i6do1r6Vm0mOioHXL1XX+yIJkNuXCxmbsm9BZGpM5S7PKByHVSVvqx5ka9BA9XDQnHNO1HRp95LqmN7c0UCFkr4Z0iMoRI4c7jXLYWbnGb4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129714; c=relaxed/simple;
	bh=7GfvyxcuWqHbHEU2AdBKLrrYvJpt16W8C+HgcqT/wV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NOgj4X0eIl12hwXXVyE4+xKPM6uSI40lgh5M3Yz7bidb+JtcQ/FnEp2amEMnZoLiljG0onoDmYQSHTXxfOpp0iHjOqD5sUw7YHRuWBPCDepg5GgP8az/di1GR+S5ToNkJN0yOyxNpw9XGGScOmJyIgfGlrnapX3zI6207Vpc39w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dYMV4dVX; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21654fdd5daso42098185ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129711; x=1737734511; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8KG6htoS1zXmRqQWh0t96H8VEUcNiMf1phDNczY2Zf0=;
        b=dYMV4dVXD8x7aGX6XUI5ZaDtlr/a83JqiULTLidh9nZFB7j3z3SVvdB2IDEHRm15MV
         ezG2bCxvP5q8JHhPxyfERakR37dLeMaJLU0Yu0pj5KS+ZY6RZCJ6YyG7UdSbKSwF3B7J
         ylARwAuQpsTzHVg0gMdU6K2tTFtJqSwK1YebaP4ISN4UKDzTjRoR8Zo8gOG4nGx6cDrn
         ZnV4TcK2gKl9WZDnllhdKvXW+OPsXeDJ4I5KLwDuN+tv974+EqaxHVJHD6tjqC1iKFC8
         XkU2IE/LDuPmFhUDa+94AHFTZFFVY48zf6iiEYRLSeqNV+BJ9ld4DmaUl/nP7dGDLUW8
         zB/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129711; x=1737734511;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KG6htoS1zXmRqQWh0t96H8VEUcNiMf1phDNczY2Zf0=;
        b=OR23RZBy4aSg966bmw29XA+o8pVyMzVDcOpQBWeUpWoiIHWA9UMgJ61URgpb0njEKk
         DTFvD+37L8tSEF7J2QxH8MEET8J/McX415hcWwqJMQOlwLfiOtLYuNtQEWNBzCGAOsIM
         n4nKWs4cve68mDffN0aNYuFUIas1o8xeV0UFi09fhXrHWTDJFLBzyIN0LJf/MzA/Uurl
         TEFZ0UEkthK1jg4PCa5axTrpMSexJRYVBiMcA55an4zoIV6aQsOyxbYFR84rcxQfftCI
         3maoRaTl5pwSN+grdX5IyU83vhfz78NJJhXJnfl4Iz+ySe0AzFwwufLObZWbp4oB0l8v
         Ou2g==
X-Gm-Message-State: AOJu0Yxq6U76iyd/7Hazg97xjQLXCF2JXyPrqNhnEH/rSQO+3ftk1F8b
	sePaqfC6IYh3mxa73uPskRQ7fZQHe458vBYFV/qMGWHpkXoqDD+pJQPW2XtyGLU=
X-Gm-Gg: ASbGncu2d/+7TVPtDktmdgyIJWVSkl0qFPUCVSner7i0weE6I5GF+vXziGkMSew+MEi
	CPdnbdIi9Yxu2056ButFBpMQ6NIG4wpiqIpWsqOURV6AzJla1cj264ACW6+d/OOPTIdCIWAaTQ6
	x9fzOk/ogKq0X7A/3qSHa1N8ZK9gLnRyxWeJyoHKG+s4z5f82bZE6RW4g4/ccwvYAzHjeQmfr/i
	g2wU7LBrt6sq4qFV7BozMflrl5WxobASzU7dCrvAuHD+ImFqFqRRw==
X-Google-Smtp-Source: AGHT+IHlkBY66sgCNo09psCh4nqPVoa89kE4OCcXdHUBG/Mk9zpNqkLGlmbxxiDjhVMOkPHfHSSulA==
X-Received: by 2002:a17:902:ec8f:b0:216:6d48:9177 with SMTP id d9443c01a7336-21c352c7976mr49748195ad.11.1737129709847;
        Fri, 17 Jan 2025 08:01:49 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:49 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:50 +0800
Subject: [PATCH v5 07/15] drm/msm/dpu: switch RM to use crtc_id rather than
 enc_id for allocation
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-7-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=27195;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=7GfvyxcuWqHbHEU2AdBKLrrYvJpt16W8C+HgcqT/wV0=;
 b=QkhDWKk8HOJl7lcGT/f9BDzKOgp8kgUu1lDxfWuhORUc4p3VHZSIKjtrYDfyDVwri7n6rb1rE
 3ePQqnEhxiXATUvc9KEOOSDCK9S13VbohmO6YAsOyPC6ZBMeppajsDl
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Up to now the driver has been using encoder to allocate hardware resources.
Switch it to use CRTC id so that mixer number can be known in
dpu_plane_virtual_assign_resources() via CRTC id for sspp alloation.

Because the mixer allocation is done in drm_atomic_helper_check_modeset()
as part of CRTC operation. While the sspp assignment is in
drm_atomic_helper_check_planes() call tree. So CRTC is more central
than encoder. Siwtching the id achieves above goal.

Co-developed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  20 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 194 ++++++++++++++--------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |  32 ++++-
 4 files changed, 137 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 5b98ae96bf5d4..018a1a49ca7d1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -716,11 +716,11 @@ static void dpu_encoder_assign_crtc_resources(struct dpu_kms *dpu_kms,
 	memset(cstate->mixers, 0, sizeof(cstate->mixers));
 
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+		crtc_state->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 	num_lm = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+		crtc_state->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 	num_dspp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_DSPP, hw_dspp,
+		crtc_state->crtc, DPU_HW_BLK_DSPP, hw_dspp,
 		ARRAY_SIZE(hw_dspp));
 
 	for (i = 0; i < num_lm; i++) {
@@ -797,11 +797,11 @@ static int dpu_encoder_virt_atomic_check(
 	 * Dont allocate when active is false.
 	 */
 	if (drm_atomic_crtc_needs_modeset(crtc_state)) {
-		dpu_rm_release(global_state, drm_enc);
+		dpu_rm_release(global_state, crtc_state->crtc);
 
 		if (!crtc_state->active_changed || crtc_state->enable)
 			ret = dpu_rm_reserve(&dpu_kms->rm, global_state,
-					drm_enc, crtc_state, &topology);
+					crtc_state->crtc, &topology);
 		if (!ret)
 			dpu_encoder_assign_crtc_resources(dpu_kms, drm_enc,
 							  global_state, crtc_state);
@@ -1245,17 +1245,17 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 
 	/* Query resource that have been reserved in atomic check step. */
 	num_pp = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_PINGPONG, hw_pp,
+		drm_enc->crtc, DPU_HW_BLK_PINGPONG, hw_pp,
 		ARRAY_SIZE(hw_pp));
 	num_ctl = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-		drm_enc->base.id, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
+		drm_enc->crtc, DPU_HW_BLK_CTL, hw_ctl, ARRAY_SIZE(hw_ctl));
 
 	for (i = 0; i < MAX_CHANNELS_PER_ENC; i++)
 		dpu_enc->hw_pp[i] = i < num_pp ? to_dpu_hw_pingpong(hw_pp[i])
 						: NULL;
 
 	num_dsc = dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-						drm_enc->base.id, DPU_HW_BLK_DSC,
+						drm_enc->crtc, DPU_HW_BLK_DSC,
 						hw_dsc, ARRAY_SIZE(hw_dsc));
 	for (i = 0; i < num_dsc; i++) {
 		dpu_enc->hw_dsc[i] = to_dpu_hw_dsc(hw_dsc[i]);
@@ -1270,7 +1270,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		struct dpu_hw_blk *hw_cdm = NULL;
 
 		dpu_rm_get_assigned_resources(&dpu_kms->rm, global_state,
-					      drm_enc->base.id, DPU_HW_BLK_CDM,
+					      drm_enc->crtc, DPU_HW_BLK_CDM,
 					      &hw_cdm, 1);
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
@@ -2196,7 +2196,7 @@ static void dpu_encoder_helper_reset_mixers(struct dpu_encoder_phys *phys_enc)
 	global_state = dpu_kms_get_existing_global_state(phys_enc->dpu_kms);
 
 	num_lm = dpu_rm_get_assigned_resources(&phys_enc->dpu_kms->rm, global_state,
-		phys_enc->parent->base.id, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
+		phys_enc->parent->crtc, DPU_HW_BLK_LM, hw_lm, ARRAY_SIZE(hw_lm));
 
 	for (i = 0; i < num_lm; i++) {
 		hw_mixer[i] = to_dpu_hw_mixer(hw_lm[i]);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
index 547cdb2c0c788..54ef6cfa2485a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
@@ -124,12 +124,12 @@ struct dpu_global_state {
 
 	struct dpu_rm *rm;
 
-	uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
-	uint32_t mixer_to_enc_id[LM_MAX - LM_0];
-	uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
-	uint32_t dspp_to_enc_id[DSPP_MAX - DSPP_0];
-	uint32_t dsc_to_enc_id[DSC_MAX - DSC_0];
-	uint32_t cdm_to_enc_id;
+	uint32_t pingpong_to_crtc_id[PINGPONG_MAX - PINGPONG_0];
+	uint32_t mixer_to_crtc_id[LM_MAX - LM_0];
+	uint32_t ctl_to_crtc_id[CTL_MAX - CTL_0];
+	uint32_t dspp_to_crtc_id[DSPP_MAX - DSPP_0];
+	uint32_t dsc_to_crtc_id[DSC_MAX - DSC_0];
+	uint32_t cdm_to_crtc_id;
 
 	uint32_t sspp_to_crtc_id[SSPP_MAX - SSPP_NONE];
 };
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 3b3660d0b166d..7e137ace5b8a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -22,9 +22,9 @@
 
 
 static inline bool reserved_by_other(uint32_t *res_map, int idx,
-				     uint32_t enc_id)
+				     uint32_t crtc_id)
 {
-	return res_map[idx] && res_map[idx] != enc_id;
+	return res_map[idx] && res_map[idx] != crtc_id;
 }
 
 /**
@@ -241,7 +241,7 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  *	pingpong
  * @rm: dpu resource manager handle
  * @global_state: resources shared across multiple kms objects
- * @enc_id: encoder id requesting for allocation
+ * @crtc_id: crtc id requesting for allocation
  * @lm_idx: index of proposed layer mixer in rm->mixer_blks[], function checks
  *      if lm, and all other hardwired blocks connected to the lm (pp) is
  *      available and appropriate
@@ -254,14 +254,14 @@ static int _dpu_rm_get_lm_peer(struct dpu_rm *rm, int primary_idx)
  */
 static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		uint32_t enc_id, int lm_idx, int *pp_idx, int *dspp_idx,
+		uint32_t crtc_id, int lm_idx, int *pp_idx, int *dspp_idx,
 		struct msm_display_topology *topology)
 {
 	const struct dpu_lm_cfg *lm_cfg;
 	int idx;
 
 	/* Already reserved? */
-	if (reserved_by_other(global_state->mixer_to_enc_id, lm_idx, enc_id)) {
+	if (reserved_by_other(global_state->mixer_to_crtc_id, lm_idx, crtc_id)) {
 		DPU_DEBUG("lm %d already reserved\n", lm_idx + LM_0);
 		return false;
 	}
@@ -273,7 +273,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return false;
 	}
 
-	if (reserved_by_other(global_state->pingpong_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->pingpong_to_crtc_id, idx, crtc_id)) {
 		DPU_DEBUG("lm %d pp %d already reserved\n", lm_cfg->id,
 				lm_cfg->pingpong);
 		return false;
@@ -289,7 +289,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 		return false;
 	}
 
-	if (reserved_by_other(global_state->dspp_to_enc_id, idx, enc_id)) {
+	if (reserved_by_other(global_state->dspp_to_crtc_id, idx, crtc_id)) {
 		DPU_DEBUG("lm %d dspp %d already reserved\n", lm_cfg->id,
 				lm_cfg->dspp);
 		return false;
@@ -301,7 +301,7 @@ static bool _dpu_rm_check_lm_and_get_connected_blks(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       uint32_t enc_id,
+			       uint32_t crtc_id,
 			       struct msm_display_topology *topology)
 
 {
@@ -329,7 +329,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,
-				enc_id, i, &pp_idx[lm_count],
+				crtc_id, i, &pp_idx[lm_count],
 				&dspp_idx[lm_count], topology)) {
 			continue;
 		}
@@ -348,7 +348,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 				continue;
 
 			if (!_dpu_rm_check_lm_and_get_connected_blks(rm,
-					global_state, enc_id, j,
+					global_state, crtc_id, j,
 					&pp_idx[lm_count], &dspp_idx[lm_count],
 					topology)) {
 				continue;
@@ -365,13 +365,16 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 	}
 
 	for (i = 0; i < lm_count; i++) {
-		global_state->mixer_to_enc_id[lm_idx[i]] = enc_id;
-		global_state->pingpong_to_enc_id[pp_idx[i]] = enc_id;
-		global_state->dspp_to_enc_id[dspp_idx[i]] =
-			topology->num_dspp ? enc_id : 0;
+		global_state->mixer_to_crtc_id[lm_idx[i]] = crtc_id;
+		global_state->pingpong_to_crtc_id[pp_idx[i]] = crtc_id;
+		global_state->dspp_to_crtc_id[dspp_idx[i]] =
+			topology->num_dspp ? crtc_id : 0;
 
-		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, enc_id,
+		trace_dpu_rm_reserve_lms(lm_idx[i] + LM_0, crtc_id,
 					 pp_idx[i] + PINGPONG_0);
+
+		DPU_DEBUG("reserve lm[%d]:%d, pp_idx[%d]:%d, dspp[%d]:%d for crtc_id %d\n",
+			  i, lm_idx[i], i, pp_idx[i], i, dspp_idx[i], crtc_id);
 	}
 
 	return 0;
@@ -380,7 +383,7 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 static int _dpu_rm_reserve_ctls(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		uint32_t enc_id,
+		uint32_t crtc_id,
 		const struct msm_display_topology *top)
 {
 	int ctl_idx[MAX_BLOCKS];
@@ -404,7 +407,7 @@ static int _dpu_rm_reserve_ctls(
 
 		if (!rm->ctl_blks[j])
 			continue;
-		if (reserved_by_other(global_state->ctl_to_enc_id, j, enc_id))
+		if (reserved_by_other(global_state->ctl_to_crtc_id, j, crtc_id))
 			continue;
 
 		ctl = to_dpu_hw_ctl(rm->ctl_blks[j]);
@@ -428,8 +431,8 @@ static int _dpu_rm_reserve_ctls(
 		return -ENAVAIL;
 
 	for (i = 0; i < ARRAY_SIZE(ctl_idx) && i < num_ctls; i++) {
-		global_state->ctl_to_enc_id[ctl_idx[i]] = enc_id;
-		trace_dpu_rm_reserve_ctls(i + CTL_0, enc_id);
+		global_state->ctl_to_crtc_id[ctl_idx[i]] = crtc_id;
+		trace_dpu_rm_reserve_ctls(i + CTL_0, crtc_id);
 	}
 
 	return 0;
@@ -437,12 +440,12 @@ static int _dpu_rm_reserve_ctls(
 
 static int _dpu_rm_pingpong_next_index(struct dpu_global_state *global_state,
 				       int start,
-				       uint32_t enc_id)
+				       uint32_t crtc_id)
 {
 	int i;
 
 	for (i = start; i < (PINGPONG_MAX - PINGPONG_0); i++) {
-		if (global_state->pingpong_to_enc_id[i] == enc_id)
+		if (global_state->pingpong_to_crtc_id[i] == crtc_id)
 			return i;
 	}
 
@@ -463,7 +466,7 @@ static int _dpu_rm_pingpong_dsc_check(int dsc_idx, int pp_idx)
 
 static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 			     struct dpu_global_state *global_state,
-			     uint32_t enc_id,
+			     uint32_t crtc_id,
 			     const struct msm_display_topology *top)
 {
 	int num_dsc = 0;
@@ -476,10 +479,10 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 		if (!rm->dsc_blks[dsc_idx])
 			continue;
 
-		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id))
+		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id))
 			continue;
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -487,7 +490,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 		if (ret)
 			return -ENAVAIL;
 
-		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
+		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
 		num_dsc++;
 		pp_idx++;
 	}
@@ -503,7 +506,7 @@ static int _dpu_rm_dsc_alloc(struct dpu_rm *rm,
 
 static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 				  struct dpu_global_state *global_state,
-				  uint32_t enc_id,
+				  uint32_t crtc_id,
 				  const struct msm_display_topology *top)
 {
 	int num_dsc = 0;
@@ -518,11 +521,11 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 
 		/* consective dsc index to be paired */
-		if (reserved_by_other(global_state->dsc_to_enc_id, dsc_idx, enc_id) ||
-		    reserved_by_other(global_state->dsc_to_enc_id, dsc_idx + 1, enc_id))
+		if (reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx, crtc_id) ||
+		    reserved_by_other(global_state->dsc_to_crtc_id, dsc_idx + 1, crtc_id))
 			continue;
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -532,7 +535,7 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 		}
 
-		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, enc_id);
+		pp_idx = _dpu_rm_pingpong_next_index(global_state, pp_idx + 1, crtc_id);
 		if (pp_idx < 0)
 			return -ENAVAIL;
 
@@ -542,8 +545,8 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 			continue;
 		}
 
-		global_state->dsc_to_enc_id[dsc_idx] = enc_id;
-		global_state->dsc_to_enc_id[dsc_idx + 1] = enc_id;
+		global_state->dsc_to_crtc_id[dsc_idx] = crtc_id;
+		global_state->dsc_to_crtc_id[dsc_idx + 1] = crtc_id;
 		num_dsc += 2;
 		pp_idx++;	/* start for next pair */
 	}
@@ -559,11 +562,9 @@ static int _dpu_rm_dsc_alloc_pair(struct dpu_rm *rm,
 
 static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc,
+			       uint32_t crtc_id,
 			       const struct msm_display_topology *top)
 {
-	uint32_t enc_id = enc->base.id;
-
 	if (!top->num_dsc || !top->num_intf)
 		return 0;
 
@@ -573,22 +574,22 @@ static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
 	 * 2) DSC pair starts from even index, such as index(0,1), (2,3), etc
 	 * 3) even PINGPONG connects to even DSC
 	 * 4) odd PINGPONG connects to odd DSC
-	 * 5) pair: encoder +--> pp_idx_0 --> dsc_idx_0
+	 * 5) pair: crtc    +--> pp_idx_0 --> dsc_idx_0
 	 *                  +--> pp_idx_1 --> dsc_idx_1
 	 */
 
 	/* num_dsc should be either 1, 2 or 4 */
 	if (top->num_dsc > top->num_intf)	/* merge mode */
-		return _dpu_rm_dsc_alloc_pair(rm, global_state, enc_id, top);
+		return _dpu_rm_dsc_alloc_pair(rm, global_state, crtc_id, top);
 	else
-		return _dpu_rm_dsc_alloc(rm, global_state, enc_id, top);
+		return _dpu_rm_dsc_alloc(rm, global_state, crtc_id, top);
 
 	return 0;
 }
 
 static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 			       struct dpu_global_state *global_state,
-			       struct drm_encoder *enc)
+			       uint32_t crtc_id)
 {
 	/* try allocating only one CDM block */
 	if (!rm->cdm_blk) {
@@ -596,12 +597,12 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 		return -EIO;
 	}
 
-	if (global_state->cdm_to_enc_id) {
+	if (global_state->cdm_to_crtc_id) {
 		DPU_ERROR("CDM_0 is already allocated\n");
 		return -EIO;
 	}
 
-	global_state->cdm_to_enc_id = enc->base.id;
+	global_state->cdm_to_crtc_id = crtc_id;
 
 	return 0;
 }
@@ -609,30 +610,30 @@ static int _dpu_rm_reserve_cdm(struct dpu_rm *rm,
 static int _dpu_rm_make_reservation(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *enc,
+		uint32_t crtc_id,
 		struct msm_display_topology *topology)
 {
 	int ret;
 
-	ret = _dpu_rm_reserve_lms(rm, global_state, enc->base.id, topology);
+	ret = _dpu_rm_reserve_lms(rm, global_state, crtc_id, topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate mixers\n");
 		return ret;
 	}
 
-	ret = _dpu_rm_reserve_ctls(rm, global_state, enc->base.id,
+	ret = _dpu_rm_reserve_ctls(rm, global_state, crtc_id,
 			topology);
 	if (ret) {
 		DPU_ERROR("unable to find appropriate CTL\n");
 		return ret;
 	}
 
-	ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, topology);
+	ret  = _dpu_rm_reserve_dsc(rm, global_state, crtc_id, topology);
 	if (ret)
 		return ret;
 
 	if (topology->needs_cdm) {
-		ret = _dpu_rm_reserve_cdm(rm, global_state, enc);
+		ret = _dpu_rm_reserve_cdm(rm, global_state, crtc_id);
 		if (ret) {
 			DPU_ERROR("unable to find CDM blk\n");
 			return ret;
@@ -643,12 +644,12 @@ static int _dpu_rm_make_reservation(
 }
 
 static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
-				  uint32_t enc_id)
+				  uint32_t crtc_id)
 {
 	int i;
 
 	for (i = 0; i < cnt; i++) {
-		if (res_mapping[i] == enc_id)
+		if (res_mapping[i] == crtc_id)
 			res_mapping[i] = 0;
 	}
 }
@@ -657,23 +658,25 @@ static void _dpu_rm_clear_mapping(uint32_t *res_mapping, int cnt,
  * dpu_rm_release - Given the encoder for the display chain, release any
  *	HW blocks previously reserved for that use case.
  * @global_state: resources shared across multiple kms objects
- * @enc: DRM Encoder handle
+ * @crtc: DRM CRTC handle
  * @return: 0 on Success otherwise -ERROR
  */
 void dpu_rm_release(struct dpu_global_state *global_state,
-		    struct drm_encoder *enc)
+		    struct drm_crtc *crtc)
 {
-	_dpu_rm_clear_mapping(global_state->pingpong_to_enc_id,
-		ARRAY_SIZE(global_state->pingpong_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->mixer_to_enc_id,
-		ARRAY_SIZE(global_state->mixer_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->ctl_to_enc_id,
-		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
-		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
-		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
-	_dpu_rm_clear_mapping(&global_state->cdm_to_enc_id, 1, enc->base.id);
+	uint32_t crtc_id = crtc->base.id;
+
+	_dpu_rm_clear_mapping(global_state->pingpong_to_crtc_id,
+		ARRAY_SIZE(global_state->pingpong_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->mixer_to_crtc_id,
+		ARRAY_SIZE(global_state->mixer_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->ctl_to_crtc_id,
+		ARRAY_SIZE(global_state->ctl_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->dsc_to_crtc_id,
+		ARRAY_SIZE(global_state->dsc_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(global_state->dspp_to_crtc_id,
+		ARRAY_SIZE(global_state->dspp_to_crtc_id), crtc_id);
+	_dpu_rm_clear_mapping(&global_state->cdm_to_crtc_id, 1, crtc_id);
 }
 
 /**
@@ -685,42 +688,32 @@ void dpu_rm_release(struct dpu_global_state *global_state,
  *	HW Reservations should be released via dpu_rm_release_hw.
  * @rm: DPU Resource Manager handle
  * @global_state: resources shared across multiple kms objects
- * @enc: DRM Encoder handle
- * @crtc_state: Proposed Atomic DRM CRTC State handle
+ * @crtc: DRM CRTC handle
  * @topology: Pointer to topology info for the display
  * @return: 0 on Success otherwise -ERROR
  */
 int dpu_rm_reserve(
 		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *enc,
-		struct drm_crtc_state *crtc_state,
+		struct drm_crtc *crtc,
 		struct msm_display_topology *topology)
 {
 	int ret;
 
-	/* Check if this is just a page-flip */
-	if (!drm_atomic_crtc_needs_modeset(crtc_state))
-		return 0;
-
 	if (IS_ERR(global_state)) {
 		DPU_ERROR("failed to global state\n");
 		return PTR_ERR(global_state);
 	}
 
-	DRM_DEBUG_KMS("reserving hw for enc %d crtc %d\n",
-		      enc->base.id, crtc_state->crtc->base.id);
-
+	DRM_DEBUG_KMS("reserving hw for crtc %d\n", crtc->base.id);
 	DRM_DEBUG_KMS("num_lm: %d num_dsc: %d num_intf: %d\n",
 		      topology->num_lm, topology->num_dsc,
 		      topology->num_intf);
 
-	ret = _dpu_rm_make_reservation(rm, global_state, enc, topology);
+	ret = _dpu_rm_make_reservation(rm, global_state, crtc->base.id, topology);
 	if (ret)
 		DPU_ERROR("failed to reserve hw resources: %d\n", ret);
 
-
-
 	return ret;
 }
 
@@ -826,48 +819,49 @@ static char *dpu_hw_blk_type_name[] = {
  *     assigned to this encoder
  * @rm: DPU Resource Manager handle
  * @global_state: resources shared across multiple kms objects
- * @enc_id: encoder id requesting for allocation
+ * @crtc: DRM CRTC handle
  * @type: resource type to return data for
  * @blks: pointer to the array to be filled by HW resources
  * @blks_size: size of the @blks array
  */
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
-	struct dpu_global_state *global_state, uint32_t enc_id,
+	struct dpu_global_state *global_state, struct drm_crtc *crtc,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size)
 {
+	uint32_t crtc_id = crtc->base.id;
 	struct dpu_hw_blk **hw_blks;
-	uint32_t *hw_to_enc_id;
+	uint32_t *hw_to_crtc_id;
 	int i, num_blks, max_blks;
 
 	switch (type) {
 	case DPU_HW_BLK_PINGPONG:
 		hw_blks = rm->pingpong_blks;
-		hw_to_enc_id = global_state->pingpong_to_enc_id;
+		hw_to_crtc_id = global_state->pingpong_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->pingpong_blks);
 		break;
 	case DPU_HW_BLK_LM:
 		hw_blks = rm->mixer_blks;
-		hw_to_enc_id = global_state->mixer_to_enc_id;
+		hw_to_crtc_id = global_state->mixer_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->mixer_blks);
 		break;
 	case DPU_HW_BLK_CTL:
 		hw_blks = rm->ctl_blks;
-		hw_to_enc_id = global_state->ctl_to_enc_id;
+		hw_to_crtc_id = global_state->ctl_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->ctl_blks);
 		break;
 	case DPU_HW_BLK_DSPP:
 		hw_blks = rm->dspp_blks;
-		hw_to_enc_id = global_state->dspp_to_enc_id;
+		hw_to_crtc_id = global_state->dspp_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->dspp_blks);
 		break;
 	case DPU_HW_BLK_DSC:
 		hw_blks = rm->dsc_blks;
-		hw_to_enc_id = global_state->dsc_to_enc_id;
+		hw_to_crtc_id = global_state->dsc_to_crtc_id;
 		max_blks = ARRAY_SIZE(rm->dsc_blks);
 		break;
 	case DPU_HW_BLK_CDM:
 		hw_blks = &rm->cdm_blk;
-		hw_to_enc_id = &global_state->cdm_to_enc_id;
+		hw_to_crtc_id = &global_state->cdm_to_crtc_id;
 		max_blks = 1;
 		break;
 	default:
@@ -877,17 +871,17 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 
 	num_blks = 0;
 	for (i = 0; i < max_blks; i++) {
-		if (hw_to_enc_id[i] != enc_id)
+		if (hw_to_crtc_id[i] != crtc_id)
 			continue;
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d %s assigned to enc %d\n",
-				  blks_size, dpu_hw_blk_type_name[type], enc_id);
+			DPU_ERROR("More than %d resources assigned to crtc %d\n",
+				  blks_size, crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("%s unavailable to assign to enc %d\n",
-				  dpu_hw_blk_type_name[type], enc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];
@@ -922,38 +916,38 @@ void dpu_rm_print_state(struct drm_printer *p,
 
 	drm_puts(p, "resource mapping:\n");
 	drm_puts(p, "\tpingpong=");
-	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->pingpong_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->pingpong_blks[i],
-					  global_state->pingpong_to_enc_id[i]);
+					  global_state->pingpong_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tmixer=");
-	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->mixer_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->mixer_blks[i],
-					  global_state->mixer_to_enc_id[i]);
+					  global_state->mixer_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tctl=");
-	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->ctl_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->ctl_blks[i],
-					  global_state->ctl_to_enc_id[i]);
+					  global_state->ctl_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tdspp=");
-	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->dspp_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->dspp_blks[i],
-					  global_state->dspp_to_enc_id[i]);
+					  global_state->dspp_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tdsc=");
-	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_enc_id); i++)
+	for (i = 0; i < ARRAY_SIZE(global_state->dsc_to_crtc_id); i++)
 		dpu_rm_print_state_helper(p, rm->dsc_blks[i],
-					  global_state->dsc_to_enc_id[i]);
+					  global_state->dsc_to_crtc_id[i]);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tcdm=");
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
-				  global_state->cdm_to_enc_id);
+				  global_state->cdm_to_crtc_id);
 	drm_puts(p, "\n");
 
 	drm_puts(p, "\tsspp=");
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
index 5e7c4f756c6a1..9bd81efa47b6a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h
@@ -68,14 +68,33 @@ int dpu_rm_init(struct drm_device *dev,
 		const struct msm_mdss_data *mdss_data,
 		void __iomem *mmio);
 
-int dpu_rm_reserve(struct dpu_rm *rm,
+/**
+ * dpu_rm_reserve - Given a CRTC->Encoder->Connector display chain, analyze
+ *	the use connections and user requirements, specified through related
+ *	topology control properties, and reserve hardware blocks to that
+ *	display chain.
+ *	HW blocks can then be accessed through dpu_rm_get_* functions.
+ *	HW Reservations should be released via dpu_rm_release_hw.
+ * @rm: DPU Resource Manager handle
+ * @crtc: DRM CRTC handle
+ * @topology: Pointer to topology info for the display
+ * @Return: 0 on Success otherwise -ERROR
+ */
+int dpu_rm_reserve(
+		struct dpu_rm *rm,
 		struct dpu_global_state *global_state,
-		struct drm_encoder *drm_enc,
-		struct drm_crtc_state *crtc_state,
+		struct drm_crtc *crtc,
 		struct msm_display_topology *topology);
 
+/**
+ * dpu_rm_release - Given the crtc for the display chain, release any
+ *	HW blocks previously reserved for that use case.
+ * @rm: DPU Resource Manager handle
+ * @crtc: DRM CRTC handle
+ * @Return: 0 on Success otherwise -ERROR
+ */
 void dpu_rm_release(struct dpu_global_state *global_state,
-		struct drm_encoder *enc);
+		struct drm_crtc *crtc);
 
 struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
 					struct dpu_global_state *global_state,
@@ -85,8 +104,11 @@ struct dpu_hw_sspp *dpu_rm_reserve_sspp(struct dpu_rm *rm,
 void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 			     struct drm_crtc *crtc);
 
+/**
+ * Get hw resources of the given type that are assigned to this crtc.
+ */
 int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
-	struct dpu_global_state *global_state, uint32_t enc_id,
+	struct dpu_global_state *global_state, struct drm_crtc *crtc,
 	enum dpu_hw_blk_type type, struct dpu_hw_blk **blks, int blks_size);
 
 void dpu_rm_print_state(struct drm_printer *p,

-- 
2.34.1


