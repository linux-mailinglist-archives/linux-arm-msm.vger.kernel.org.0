Return-Path: <linux-arm-msm+bounces-42757-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 730979F7655
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:54:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 670DD1683E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:53:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2E4F219EB6;
	Thu, 19 Dec 2024 07:50:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cUMbc2nB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1EE9219A91
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594652; cv=none; b=VF0w1bJ4NwxjIYYEVmn1Jqf78XApucZVrIwJWWGx9QiloxWRloTPd0OxfHob0ELJRIwz9855zzqS6raPpjZt5VTH01cId2hSHpOvZTw8Fp23wImTqcnYeTpt1b7xOg9o6/wT6W3UERB0Je9qjlcQtqvfc169IDIXGGD1Xq93BnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594652; c=relaxed/simple;
	bh=TlGDQaK+RIr4jaGppe96K5ODnLOh+oTUjGh0kiPdyMc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P0Zl5Bo85ztnSvoTZJmnPbI6AEHq4lrZVU66D5neUOvi9/v4HtJ2HC31bfDghE2syQTGvIWo4shrcQ/Ys9SeXKj5m6nbfRA8M+PTNnFGwpehLnFxSjldGI0Q17Ch3yn5phRe/1acktkoN8N8I91pLUFf6F511qT/S/DRmnm1Yyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cUMbc2nB; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-21631789fcdso10736225ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594650; x=1735199450; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=18nlxVwPoKLr3E2wHXVPadI8cx5c0FRvaFnyj0j882Q=;
        b=cUMbc2nBm3l3/YTxgmJg7W698Fxj3Q6Y74x0XQ25A6mpDK0JaQBlR9Jzh8uEi1H8kN
         inkisILgUXTT6uSYrMoACIeoL3+3744P82CeH8333oQD3zbRvQfAXMc3uheMVCKR4c0B
         4lH5lDeNls1TxuG7d0jA+dtWA1AhYrs5i+ptmQ60ZyxFT3z0wjDodtd6PJQ0sJD3AmN9
         ff5Sslyg0O32OAHcYjJ4vMQJ8rPka2AjNkYERKrZBPg6F/kqbN6eo5NCChwWxT+O9Kbp
         FN8RxIJLqyywshVrWw3ylf4jpDp46BrcRTLx+dBnhciC4FdTyiS7ITMUGCiLNQqVO3VU
         Yy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594650; x=1735199450;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=18nlxVwPoKLr3E2wHXVPadI8cx5c0FRvaFnyj0j882Q=;
        b=i2D0+/8IrZqPb6TmBuOl4Dgye50ig0N5IR6eMbcdygMu0q5Dudxo9ls0BiNGKOEydp
         KIstCviYThHHBRC+40STV+dM8UgFpxdmYT4SHq40mhG31FeIQyobI5ZeoeWGe77fSoUY
         9Kd8qocQdM6ArG8jb/j0uJJHvY7gGWHHroDLbDiqLOaoKgNg28a1i2kK3hLoI74y+fDm
         EDIws2mAc3VF2V8v2AO3jkDRqpUerg4AVgGAvVQFBOO/ZRvv9D3BzC8bedes+rdt1GMj
         E7MxW9EblJ9rdhzSc0KqfPPKoo4W9cmEu0U4NDwcnNa19MzbB5FiUJf013nh4B0kmBv4
         v2IA==
X-Gm-Message-State: AOJu0YxVzZ/c+X+qFyfzcWHaVPtEq4shQevVNnfNjKmCr2z4MKZ/4USh
	P8MaOq4oStfO93tg2gIlmNoegEeVUTuB7gdtiM9PGGRrFGvYhinArolhNAJEsZyNfrGR0atduy1
	lW85L2w==
X-Gm-Gg: ASbGnctyQ18P3LbN6MDl3O7NdYagP6VQ1U068Pl9Z+fqO9dFPOokB3eyX8sR4JPA1cy
	e+5mhZIX7L7QpdbKCXkuJwTDapKX8cHDNDTvMcHWxMwPPf1NkM6cd4aYsdA/myeJZw51rvjmUpg
	4uGnwv1c7v6dxbc7TGlwoZ1RDhUFtswVw2FfTsHfgXUxaKSnDHpL9adpMlkunt3hmE8k5H6+QYf
	DP0N5X1vuOfpcmYaawT6hcb9CIHlwN8XhY1gKqYOtmzaH4chJmjzA==
X-Google-Smtp-Source: AGHT+IHGhWssJJ0I+Rok6/BWTnxTjdpxP2HomvpGSIQ0VmIZFtIkQM1HyIQshxHoKEuwfXQuoAnk8w==
X-Received: by 2002:a17:902:ebc2:b0:216:311e:b1c4 with SMTP id d9443c01a7336-219da5b9cc6mr33955365ad.4.1734594650003;
        Wed, 18 Dec 2024 23:50:50 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:49 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:30 +0800
Subject: [PATCH v3 12/15] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-12-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=8743;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=TlGDQaK+RIr4jaGppe96K5ODnLOh+oTUjGh0kiPdyMc=;
 b=LKCvbzjbUtlNpAKUkKExLqmo0i3GGPxESU3z90s8W9GgCw34CyAtD/b5Wa0IsMuu1F9plhR0a
 ccJBs8JH8H0BJy81Q/+92vcBjC9m4jtUDqLKvEniSzKTmV/zze0vt1v
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The content of every half of screen is sent out via one interface in
dual-DSI case. The content for every interface is blended by a LM
pair, thus no content of any pipe shall cross the LM pair. We need
to clip plane into pipes per left and right half screen ROI if topology
is quad pipe.

The clipped rectangle on every half of screen will be split further
by half if its width still exceeds limit.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |   7 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   6 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 108 +++++++++++++++++++++-------
 4 files changed, 97 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6ef7e6ed00238..bad75af4e50ab 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1363,6 +1363,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
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
index 0b148f3ce0d7a..d1bb3f84fe440 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -264,4 +264,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * state: Pointer to drm crtc state object
+ */
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 56a0edf2a57c6..39fe338e76691 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
  *             such as decimation, flip etc to program this field
  * @dest_rect: destination ROI.
  * @rotation: simplified drm rotation hint
+ * @valid: notify that this pipe and config is in use
  */
 struct dpu_sw_pipe_cfg {
 	struct drm_rect src_rect;
 	struct drm_rect dst_rect;
 	unsigned int rotation;
+	bool valid;
 };
 
 /**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 46c6b6126fe5c..fca6e609898a6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -802,8 +802,14 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe *r_pipe;
+	struct dpu_sw_pipe_cfg init_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 num_lm;
+	int stage_id, num_stages;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -826,13 +832,10 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
 
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src);
 
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
@@ -857,34 +860,87 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
+	drm_rect_rotate(&init_pipe_cfg.src_rect,
 			new_plane_state->fb->width, new_plane_state->fb->height,
 			new_plane_state->rotation);
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
+	/*
+	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
+	 * configs for left and right half screen in case of 4:4:2 topology.
+	 * But we may have 2 rect to split plane with 1 config for 2:2:1.
+	 * So need to handle super wide plane splitting, and plane on right half
+	 * for quad-pipe case. Check dest rectangle left/right clipping
+	 * first, then check super wide rectangle splitting in every half next.
+	 */
+	num_stages = (num_lm + 1) / 2;
+	/* iterate mixer configs for this plane, to separate left/right with the id */
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		struct drm_rect mixer_rect = {stage_id * mode->hdisplay / num_stages, 0,
+					(stage_id + 1) * mode->hdisplay / num_stages,
+					mode->vdisplay};
+		int cfg_idx = stage_id * PIPES_PER_STAGE;
+
+		pipe = &pstate->pipe[cfg_idx];
+		r_pipe = &pstate->pipe[cfg_idx + 1];
+		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
+		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
+
+		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+		pipe_cfg->dst_rect = new_plane_state->dst;
+
+		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
+				" vs clip window " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&mixer_rect));
+
+		/*
+		 * If this plane does not fall into mixer rect, check next
+		 * mixer rect.
+		 */
+		if (!drm_rect_clip_scaled(&pipe_cfg->src_rect,
+					  &pipe_cfg->dst_rect,
+					  &mixer_rect)) {
+			memset(pipe_cfg, 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
+			memset(pipe, 0, 2 * sizeof(struct dpu_sw_pipe));
+			continue;
 		}
 
-		*r_pipe_cfg = *pipe_cfg;
-		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
-		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
-		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
-		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
-	} else {
-		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
-	}
+		pipe_cfg->valid = true;
+		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
+		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
+
+		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
+
+		/* Split super wide rect into 2 rect */
+		if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
+		     _dpu_plane_calc_clk(mode, pipe_cfg) > max_mdp_clk_rate) {
+
+			if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
+				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
+						DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
+				return -E2BIG;
+			}
+
+			memcpy(r_pipe_cfg, pipe_cfg, sizeof(struct dpu_sw_pipe_cfg));
+			pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
+			pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
+			r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
+			r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
+			r_pipe_cfg->valid = true;
+			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:"
+					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect),
+					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		} else {
+			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
+			memset(r_pipe, 0, sizeof(struct dpu_sw_pipe));
+		}
 
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+		drm_rect_rotate_inv(&pipe_cfg->src_rect,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
+	}
 
 	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
 

-- 
2.34.1


