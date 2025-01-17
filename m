Return-Path: <linux-arm-msm+bounces-45417-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F883A1537A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 562583A4461
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:01:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06CB9199FA4;
	Fri, 17 Jan 2025 16:01:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uDjRCZ98"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CC618B495
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129675; cv=none; b=d7+OX2bROwYaOn4QqVnEiFXtRtolaT0qoJZFbiCCpF0zRJrRq86oYqGKtniQwN4vwVVwT5vECXlcUy7shIdoKBhfKQsS1UKYeMVTrlfHw0b37pNXHeRGdufHGRhAUe7MaXQp71dGZpUNZQ12sGU3U1TK7teXKEUM+TfjhsR5Bgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129675; c=relaxed/simple;
	bh=KJWkBO8bCpinIjxlYmabI6MQIeEdpcEIU+bj264onvo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UEKJQJNC24yGaK6MeXD/HiMc1doKht7gHrgv84TZLk2t9gFoEwfuTCtCHZ693f9TlW9aBb9uAmVpGRc30rthhKNrEtChDAZ0daL1E2cj0XF2H5Tnt3Ih/qRYXSIrUHE6iHzFxNfwnFGt2pombU8acFu8AYHC/+PF9U24l9cW3H4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uDjRCZ98; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-216634dd574so28902675ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129672; x=1737734472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxsGH6YBic0xISYCDS0Q6XFgy6JfbBJkHL966lXOAxw=;
        b=uDjRCZ98JpDZYXuxPNQeEd2atqA5i2rRjkDb58N9/zZ1IFQ2qNxWC/90XJPMf/UGVn
         DFstjQYTXD+riiu4KCDvCsSEoVm6N/OqsojPDZ2u/vCfNCMsjaymWP5sWpzxR0Zy37D4
         K+9n69FJTYHJAXyWmxsTA+6stnN1UNELUFMxc46O/ldJc6ybPR3k7z9Xywg5NLJf5WqP
         PcK/kfQY2kjGYV3v/LcwnqumjoQQhbXXt7ECwjgG8SiVFUlUbm7h0xFp47oY0P7ahUBD
         VE6jVmAZW0Be51sW5fVE9CpOie3ro/OlzUPGfbKal9OmTKK2l5UgYbzzinMpNTtrn4gK
         3GbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129672; x=1737734472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxsGH6YBic0xISYCDS0Q6XFgy6JfbBJkHL966lXOAxw=;
        b=MsTssjByuW0N3b5HQvQ66J+To5L4TVrnd4ADTur3DNmET5lgHcOIszaALSs6xhwq14
         +vwE8O/SZXyNkGMpLUFDzuYhkDNnq6IlqAsh4Qi/tCcdRkaZGfdoW9wPvtkEDqI63YZX
         M5BfH3458U0HqPHgq4i0rI6Xf7ypOK0BEZHFiBqSHZd7pACs1KemNE4nVEgS7q2D/L8i
         WCHrefZkL6s52hcYyD380qjGJoRxgMcRw4Jg2SLCaZP560M4rzmjtHfgriGiR+spKXVG
         W30lxE2yWt9KYTCTKM0f9e5TZckgCNJh9zPms8SNS9QMnMeDQFVLhsoS4zlR3TgrHvtj
         S9sA==
X-Gm-Message-State: AOJu0Yzj0n6s40JQ1OuExWd7/xVykq2wkyLJtYHrflhSsCPT6J5NhOow
	IieBeaALlOt+Rp94dJxGb5kIAJZR/xIR7dWPd6QCLYsQ9x9lFowHvxjUMaC2Oy4=
X-Gm-Gg: ASbGnctRzADk4Erpee3dEje0FZIvzwLvGr+Ymg7xOP20nJcJrQPU0h1kvKcrX35Dw+A
	o/J4uexM7plbk1dkpWVc2LmFxFUs2sceZhfkf2fU4w6ObnbdkGFwCTYui7gz1t2lNV3JBmY6pfn
	wLO1zt1N886Dbp7AyYB14fkopA91e0ciVmAmwySHkbAOiEjUM/MhEoNvZ6MvBIWXUp/mlQJlpqw
	JN8d5iHZ/PIu/QuS7EZmwUyM5NRjlXhmOzqRlUB4NxUrutjpgorcA==
X-Google-Smtp-Source: AGHT+IGhASsyC9M2LOGT6wIJ0qAtrO/FZWME0ogfQShaBxMiwEcuZvPaUvw8zKmrTzgCt5RQnbCmcQ==
X-Received: by 2002:a17:902:d48f:b0:216:282d:c697 with SMTP id d9443c01a7336-21c35544097mr38427545ad.27.1737129672232;
        Fri, 17 Jan 2025 08:01:12 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:11 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:44 +0800
Subject: [PATCH v5 01/15] drm/msm/dpu: check every pipe per capability
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-1-9701a16340da@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4329;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=KJWkBO8bCpinIjxlYmabI6MQIeEdpcEIU+bj264onvo=;
 b=2kQbmo66Q+PrCi4xemcVUeA5NlX04rf+NJa7LTE/tVeBbCXRoXMDVi0RrMYHc7EkDNYZO1wcK
 MalEPVIJFGEARoc/PWe6pTYgeODG5YHDAEDYY43t3XejnM5LQgkrNb3
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The capability stored in sblk and pipe_hw_caps is checked only for
SSPP of the first pipe in the pair with current implementation. That
of the 2nd pipe, r_pipe, is not checked and may violate hardware
capability. Move requirement check to dpu_plane_atomic_check_pipe()
for the check of every pipe.

Fixes: ("dbbf57dfd04e6 drm/msm/dpu: split dpu_plane_atomic_check()")
Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++---------------
 1 file changed, 36 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index cf923287dcd05..2b75a6cf4e670 100644
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


