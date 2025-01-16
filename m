Return-Path: <linux-arm-msm+bounces-45208-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 321ABA133E6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:30:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 481D47A4B3A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:30:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BBE591A8F95;
	Thu, 16 Jan 2025 07:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nzTLt2O+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E05197A8B
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012459; cv=none; b=XtBqxRvaSb6Qr1buU4gsS1X2mdgOtNtG4DSH7aJ7YB35MX+EYgdMXDZ5evt1PhK2bfmyctINBW0SgqiGioAAUXbLn21LOn9bfKXnDCsxO9RlDGeCUqD0kZayDJTQgRufMMrpVhWBN2PewExPXybQqVQZFmRhhw+G0a4vaC5pU6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012459; c=relaxed/simple;
	bh=NyvSg0KJfZTvWnDqJ/WZxZ7v01R6k3CbRD9uX29j+C8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hmtIiI+HnsPjqnqmSHFPEGCh/5e/iMyhxtMHTjO1oVIWCRI0kkffXNg+AkUZlwarAP6Ka8+PIad6BRQxKaZxz3lRYf1g3LhiuHVDisVwv8sBzbOa7J3a8xKFkQ+3kDb+0l3rs91E/pBAxjFkMOpHnkJkck51b89+wTioVHlGzkA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nzTLt2O+; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2162c0f6a39so33828955ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:27:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012457; x=1737617257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fx1E8t/9QjcbEBH2snoxAgb5EcAAcnSsz77Xp2NQP5I=;
        b=nzTLt2O+/Ai/gbke/1/yW38ZKSoCoZhyXilFkVXNgS5hyZ+Qu95WBRp0OHV6cH5nfw
         Dk51pmvbVMdKkfkCGLahCKFx2MDrK6tkW9nu9Yom4mvWQOCcv2lnBhFESztSsXutsKfJ
         2nB/MrQj/UGr25tbW9WjJyYLcphlV0iTnnkJFmdJRrDeMUMztf3e8xY4dVFnoKeWvS3F
         mzj1U/uOHXQPvRJvj4vIC7NZDoBoJb7d52Fa192Rjgm54c9Aa4D7z3CCZi+0Hyn1pZFB
         El2QUdsKsrVCWjx0DGc7MPcmXVjJoX5VGWJkvNctlFtky4mvXXGdfqsHocP80hg6PCPc
         uViw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012457; x=1737617257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fx1E8t/9QjcbEBH2snoxAgb5EcAAcnSsz77Xp2NQP5I=;
        b=N8TvQzudMQHis5RlVHT8lQfTM3wBGy2sxUT76JcgGcBZQd/dd+iheLWfwEXIz+eD+j
         cgDz/e2ItlgPjYiaXEjyM3mNmrksfGv5NV/+Mn4HuyI0zSFLByGNqIbkwLb8IFRVUM+o
         jKSM9yZMLdrPEkGy68BGl5tNeR4IlHB4S72O5xdhffCXyr8qfqpPrZRiwFR8/IEsyViz
         tK4NNeiL00gcrB07VGQoSCqZn53OYWdz9Vo7UUuxpdIsc8PLsTjbuDPrC1zmWDLULo9p
         IErJiMUXLBWTYR3hdr8LETnH2LEZ3AON/YTUearYK3Pv6J0N3LjonyNOy6uuVZuZb5K8
         0+rw==
X-Gm-Message-State: AOJu0Yxw6nUz1iFrSA8gzFF3ANgg6DPEM+ULIBCt/QhlD1mBDwBC8mo2
	AUiakrAjXOnnKGmWgABi/CQFAhYiMSNE1tlUPXpbNzP+li24BZPsfkAEsxvOe4w=
X-Gm-Gg: ASbGncucUT27GxWUqb6SkU1N7nhLqXDVx+spVI/Em+AwZtBlxWTncWYuuAXCqjrD4ju
	kubE1HycQflojAs1rbq+4wlm2b1SskdV2Yw0ttu1laIZ/eNzw1Jr+TVwi20z1nMpKH9Cz4ATI0A
	tBpai91bf2KOR9PKmVX+Yh6EF2cqx1bjZBls1SgQut9Ku7Wrfwv0KU1eZGk0WXOW3tz5Dg9fHMA
	cLEPleA8j6803+Vb+fwGwOBDHxmf58CcavEsZQxxXXSq4PmhxNuJQ==
X-Google-Smtp-Source: AGHT+IFlz9dBX0rGmKcNVbcQUBIkLZpkwHdI+j7/IKtEw+Ef8fAxK6I2mpVzzxRu5dFMnBQ+JYkXeQ==
X-Received: by 2002:a05:6a00:c87:b0:72d:25ae:cafb with SMTP id d2e1a72fcca58-72d8c6d0eb7mr9054624b3a.7.1737012457578;
        Wed, 15 Jan 2025 23:27:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.27.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:27:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:26:03 +0800
Subject: [PATCH v4 14/16] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-14-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=3729;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=NyvSg0KJfZTvWnDqJ/WZxZ7v01R6k3CbRD9uX29j+C8=;
 b=Bj6Hq9J9sd8TR/yYNSkA6ij5fsXcMMX7JFITo4HPY4ohR9yyag1zTf/7N6iwyJ8mzz94hfdaO
 gRPDOe8PuKrAgKGBeTapkuUs7QDgOtXqp3eGBxc/yxyPzqqn58MlZWV
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Support SSPP assignment for quad-pipe case with unified method.
The first 2 pipes can share a set of mixer config and enable
multi-rect mode if condition is met. It is also the case for
the later 2 pipes.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 63 +++++++++++++++++++------------
 1 file changed, 39 insertions(+), 24 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4bcd7b1a05c16..d96f4405a4c26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1171,8 +1171,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	struct dpu_sw_pipe *r_pipe;
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	const struct msm_format *fmt;
-	int i;
+	int i, num_lm, stage_id, num_stages;
 
 	if (plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
@@ -1180,11 +1181,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
 	pstate = to_dpu_plane_state(plane_state);
 
-	pipe = &pstate->pipe[0];
-	r_pipe = &pstate->pipe[1];
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-
 	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
@@ -1198,24 +1194,43 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 
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
+			pipe = &pstate->pipe[i];
+			pipe_cfg = &pstate->pipe_cfg[i];
+
+			if (!pipe_cfg->valid)
+				break;
+
+			pipe->sspp = dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, crtc, &reqs);
+			if (!pipe->sspp)
+				return -ENODEV;
+
+			r_pipe = &pstate->pipe[i + 1];
+			r_pipe_cfg = &pstate->pipe_cfg[i + 1];
+
+			/*
+			 * If current pipe is the first pipe in pipe pair, check
+			 * multi-rect opportunity for the 2nd pipe in the pair.
+			 * SSPP multi-rect mode cross mixer pairs is not supported.
+			 */
+			if ((i % PIPES_PER_STAGE == 0) &&
+			    r_pipe_cfg->valid &&
+			    dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+							      pipe->sspp,
+							      msm_framebuffer_format(plane_state->fb),
+							      dpu_kms->catalog->caps->max_linewidth)) {
+				i++;
+			} else {
+				/* multirect is not possible, use two SSPP blocks */
+				pipe->multirect_index = DPU_SSPP_RECT_SOLO;
+				pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
+				DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pipe %d.\n",
+						pipe->sspp->idx - SSPP_NONE, i);
+			}
+		}
 	}
 
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);

-- 
2.34.1


