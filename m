Return-Path: <linux-arm-msm+bounces-56970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C6344AAC9E1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:48:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4D3731C27CD1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:48:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 25917284B2F;
	Tue,  6 May 2025 15:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLLcYfEl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70F7B28466B
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546483; cv=none; b=WR3K46KbQuljh3MRLcA3CM3Qp18BJ9kdNh1urGWad1EXEF+isRfnbmXqK1Hg6IXdFAff+Q5u4EoNWXFNrm4qmx1u61AvXVWQDo5YyjI7OJ3yPXrlG4SSZVyOh0DJ2Km4HI6kZv5Jvbk/8pbT7dx+HGy1kAhawnKtQryrZm0yGaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546483; c=relaxed/simple;
	bh=p/aL3lRyLhuiXRZaetD8VgLDL3qdvShcJvN5F//fxjo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ugBYoskvWLFAaczi0ReGTBjtHC9Tfq4F1Sfv51r7jKEtfMZXkEDyYEEFjqlcaVAXi6VOeZuhDvTRqB1gocH9k08q+y0k5xrtND3dBGs00QsRNXoDKdR8DZdlU1vt2wqY1Chi/MktvIyoEkX7RTqIPuX7Ny+V8GWExH9/IZmRZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLLcYfEl; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b12b984e791so5280156a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546480; x=1747151280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
        b=bLLcYfElT5EDQXhZ3m9a0QdqYPth4oUtDD/tC9LqtA8L90Je3K0/vQyTBet3k16PmM
         WNUgTQm8uSU1avYe3jexsvzP4v8aUeST5wGHeQZXPU7MnI/WsvNDb0p/3WqgZwW3uy87
         wCMmh9MoEMESEaUri15CFptxoLi/dKUvBVZZ9FnzaFuDpqzjGJ/pO2u3L+jiAoWWRpJN
         bVM2Xjtw2cpk2Uzpu2JNgwLPjguEGio1kqTFaC4iUIsBjEoKLC6qe/rjSoZm2au+DarV
         fPTBgoOqWil+RRPDJQGZcwt3P3Xvr7l3ux2lXgOAq9kZ0cyGerxpQdjjMSX9TV170aNM
         c/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546480; x=1747151280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kxt4igjGW7kIkwK3pM9gIy1N3ytZL+6O3l4DQKM/gJw=;
        b=p5FrA2vhIR4JO7wG0y0s1sdUFhtJ55dWvte2gmF9s5QZeHR2dbzUV7SUzlIPLHFX1C
         2T7N5NGtwJcAksKcZvTd/uOzYHz1esUmrLLwI5sgTTewzCsjfLh24DkcuIclty57dFQA
         FDmccJZQFtiQhzE2z2VBVoNS5Q+2P2zIUcXXZ3wcnR2eEtbKjrWWSpthPmZQVm86CcdO
         6DuymRhBHBzFnb8TV7JtT8LBtHPddLuTIBqA/67MAjAR3S//NL7/4VNRvD5SqrdhEaMs
         rC5AaYu54CYYNwAVKMB8pHPSMv/4OmWUksBHvlOgbaYeSfmfhR1O4U5nDTGNLr+Az0ew
         AK9A==
X-Gm-Message-State: AOJu0YxJzx/zjA6veKOaWMXWrvVYRmj08jzX6me/y01uD2SuFnDwo2u8
	qxkP9wqi3DZLC4B/I09fdQArtcgWzt4W/mHiH99HYv3JU8oM11g3wWy3Yd4+mfuPE3TM9j6vR+n
	J1m0VQg==
X-Gm-Gg: ASbGnctCChvMNVs1CXG0eJ4BkpBlsjGednN7lpn3IbwyR+YjL2N/0hmoLZLXRhkd7eo
	H3YQN32kR672AXKFLozHraaZsdLHLK2a0OWC8qm3puUhwGLXz1++X2fF0visomMyqs3X/O+y7I4
	8d4uuDuEl97yGNfu+ciFEp1IhI6PjEBOoFmsH3L6eMqP5fgz4MOrJsGPNUe2JeFKIEZ1lwz9qTb
	4z401US541FxmGYi34eOxUZOVCAZVBPCkkDvw4/B3xnjq9wi9z+YgGjPS6XEuE/pAoa784Ixs7p
	u2nLGW/2l+anKkvrfkT6k/ZCRwFzj81Szb3rqQ==
X-Google-Smtp-Source: AGHT+IGb9+FnWo9267p0fx9BjNEIUzoXBumtQrk1tj78WuYav0rpIxj/FofGZuV9inH/1ziOSB8zHw==
X-Received: by 2002:a17:90b:3d50:b0:309:f407:5ad1 with SMTP id 98e67ed59e1d1-30a6198dbf4mr18334411a91.14.1746546480278;
        Tue, 06 May 2025 08:48:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:47:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:32 +0800
Subject: [PATCH v9 02/14] drm/msm/dpu: check every pipe per capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-2-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=4444;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=p/aL3lRyLhuiXRZaetD8VgLDL3qdvShcJvN5F//fxjo=;
 b=Eu02LrLr8B5tRbqz0tapuLHeVERr3KGsTPNNfTOCcvbI4dFAlxSJJiul1hzEsT4Uk/acHRoPe
 qL/UUJrq7RDBHQEHEyKnsXHUTKXLIq/A+4kVnxZBQHfMoqEBBWwmY9X
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index af3e541f60c303eb5212524e877129359b5ca98c..aeb90c287245d6aaa18b9f280d1e628ee6ed74f5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -729,12 +729,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
 static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 		struct dpu_sw_pipe *pipe,
 		struct dpu_sw_pipe_cfg *pipe_cfg,
-		const struct msm_format *fmt,
-		const struct drm_display_mode *mode)
+		const struct drm_display_mode *mode,
+		struct drm_plane_state *new_plane_state)
 {
 	uint32_t min_src_size;
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	int ret;
+	const struct msm_format *fmt;
+	uint32_t supported_rotations;
+	const struct dpu_sspp_cfg *pipe_hw_caps;
+	const struct dpu_sspp_sub_blks *sblk;
+
+	pipe_hw_caps = pipe->sspp->cap;
+	sblk = pipe->sspp->cap->sblk;
+
+	/*
+	 * We already have verified scaling against platform limitations.
+	 * Now check if the SSPP supports scaling at all.
+	 */
+	if (!sblk->scaler_blk.len &&
+	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
+	      drm_rect_width(&new_plane_state->dst)) ||
+	     (drm_rect_height(&new_plane_state->src) >> 16 !=
+	      drm_rect_height(&new_plane_state->dst))))
+		return -ERANGE;
+
+	fmt = msm_framebuffer_format(new_plane_state->fb);
+
+	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
+
+	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
+		supported_rotations |= DRM_MODE_ROTATE_90;
+
+	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
+						   supported_rotations);
 
 	min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
 
@@ -923,47 +951,20 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe *pipe = &pstate->pipe;
 	struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
-	const struct msm_format *fmt;
 	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
-	uint32_t supported_rotations;
-	const struct dpu_sspp_cfg *pipe_hw_caps;
-	const struct dpu_sspp_sub_blks *sblk;
 	int ret = 0;
 
-	pipe_hw_caps = pipe->sspp->cap;
-	sblk = pipe->sspp->cap->sblk;
-
-	/*
-	 * We already have verified scaling against platform limitations.
-	 * Now check if the SSPP supports scaling at all.
-	 */
-	if (!sblk->scaler_blk.len &&
-	    ((drm_rect_width(&new_plane_state->src) >> 16 !=
-	      drm_rect_width(&new_plane_state->dst)) ||
-	     (drm_rect_height(&new_plane_state->src) >> 16 !=
-	      drm_rect_height(&new_plane_state->dst))))
-		return -ERANGE;
-
-	fmt = msm_framebuffer_format(new_plane_state->fb);
-
-	supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
-
-	if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
-		supported_rotations |= DRM_MODE_ROTATE_90;
-
-	pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
-						   supported_rotations);
-	r_pipe_cfg->rotation = pipe_cfg->rotation;
-
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
-					  &crtc_state->adjusted_mode);
+	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
+					  &crtc_state->adjusted_mode,
+					  new_plane_state);
 	if (ret)
 		return ret;
 
 	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
-						  &crtc_state->adjusted_mode);
+		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+						  &crtc_state->adjusted_mode,
+						  new_plane_state);
 		if (ret)
 			return ret;
 	}

-- 
2.34.1


