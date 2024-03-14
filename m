Return-Path: <linux-arm-msm+bounces-14055-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DD84887B591
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 01:02:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0C9BA1C219B3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 Mar 2024 00:02:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07888EC2;
	Thu, 14 Mar 2024 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bol4sS23"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E72947B
	for <linux-arm-msm@vger.kernel.org>; Thu, 14 Mar 2024 00:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710374546; cv=none; b=maRW/TfaKzp4xjrD8cyg79bO8pBvMrDIvm3S47JTcWsm+lLleOVYgAUGtlAwclclIOzlK+F71l6mY9ApFesE/HauOFJRj0ZfoTNNoO3FJjNX1DR6maniWvkD2hx2wdhaW0IrHyhXYq0v5BKs+hshHHttmXUl+tGJxZz7lsMcftk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710374546; c=relaxed/simple;
	bh=oGhm2AfFpbwDUwQXJd23O5OpDvnVkCsnioPMvs7UQWw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fZ6vZKkrhKNu+ep3rVMhEr0GE2Oobq8LbivCONZaiNrqiRFFCZnZF3etKVEQegWsh9YMqNw5iwU9YCz0Z4c1NkIUISK41Tiy/VR6yZ1SHjYsEg/1t027iUEKIfBvhf9NBN78k8PiN6hv4DnurANf+KKs4C3J8ccAQG4p1OYySbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bol4sS23; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-2d109e82bd0so4223821fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 13 Mar 2024 17:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710374542; x=1710979342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omhQlSoxtqwZ2DMzUczrlWHRB9OlkJVlUrZG2hp78ts=;
        b=bol4sS23TlCee2NVorbumYlVFNCnVjhR/+8lOSCxWYtPagk0rv66dFftTAccY17MV/
         r2fNL745fyC55RKCmFpKRRv7NrO+scFD1f1KoYYbYhLzGTYnS4WBnyVXdgH2lNskrKX+
         rxxy6iKpdzwvdsdRfc6MzfYQwsKEMy2vUp493WPNg571JhuXKdM/CLblR9P0lBfaWTQQ
         n03CZmcqIH43Hti4XEppSFNLhHv4SG30U/MMRZ50xCDrPqbwBvKJzSHHWqdTF6O3FoFM
         EkbUEEIJWqWsij0fZF7Fw8w7mPGv1h1x20ZKxCZgL4SmBFx7agK0I1xWlEs0923DpIY9
         t6jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710374542; x=1710979342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omhQlSoxtqwZ2DMzUczrlWHRB9OlkJVlUrZG2hp78ts=;
        b=Va882d7YKt6Yqu78brX446//ufkLcp6skqKaWhZcM2vHkSJZ7fGqBDgBF1JAtuw4q3
         5tsH9k9Go6xLmV4dJznq1cHVepfgVn+Kq0zLJhxTiTf6M5fQxo5dTG2UGzyjCBzVgw1n
         0DW+J8XaNYkE/7gUG6EYhGprYi+9GQtuaclvsJxIid9P98omL5NB4FDHeMzN6LE+aV9i
         9qVuCMdXfUixhQZb0ghf+USzcLKEb0MY7PXhhwmhOmbxWhz+qEKOvIy6HsYZjzYeVUQT
         Wt1AYFWtppDZySUZysJS8vRZ/EHTZWhp3u3HnTF8wPXNkE8sl189Pa7KAR8AoEBQN7sZ
         zsNg==
X-Forwarded-Encrypted: i=1; AJvYcCUMQIk/B3wvSjkh1Ix6sGZQ7ClVs9bo0IU5Tyu3sv05YtfpW44eCPCI+QMjrg3H0f5TbqReTsJDRMKUk/sxVVCN6mnxM8jwys0y5EZPMA==
X-Gm-Message-State: AOJu0YwomN24wyvKkFUwvrG4kKqhRJ1A4Jt2ikd8DFiBc3IaZ38ny7WD
	2fVxQm574F0ERKTb73fE6PYhh8+QmG/dYNqMbdTMhPlRwmqSzfjn3r665pCFOk4=
X-Google-Smtp-Source: AGHT+IFaWhVXOZSe75zGW3/qdv3Rp6jkv+9SmxpEyBltlIqwlLMBx+Ebzj6Tb8KVpz8Fk69lhkR/0A==
X-Received: by 2002:ac2:5b9a:0:b0:513:c9a6:46ce with SMTP id o26-20020ac25b9a000000b00513c9a646cemr51945lfn.9.1710374542109;
        Wed, 13 Mar 2024 17:02:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 17:02:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Bjorn Andersson <andersson@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Subject: [PATCH v4 05/13] drm/msm/dpu: move scaling limitations out of the hw_catalog
Date: Thu, 14 Mar 2024 02:02:08 +0200
Message-Id: <20240314000216.392549-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Max upscale / downscale factors are constant between platforms. In
preparation to adding support for virtual planes and allocating SSPP
blocks on demand move max scaling factors out of the HW catalog and
handle them in the dpu_plane directly. If any of the scaling blocks gets
different limitations, this will have to be handled separately, after
the plane refactoring.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 12 ------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  4 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      | 16 +++++++++++++---
 3 files changed, 13 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a2e4832aa25d..47fd8baf53e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -113,10 +113,6 @@
 #define MAX_HORZ_DECIMATION	4
 #define MAX_VERT_DECIMATION	4
 
-#define MAX_UPSCALE_RATIO	20
-#define MAX_DOWNSCALE_RATIO	4
-#define SSPP_UNITY_SCALE	1
-
 #define STRCAT(X, Y) (X Y)
 
 static const uint32_t plane_formats[] = {
@@ -280,8 +276,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 /* SSPP common configuration */
 #define _VIG_SBLK(scaler_ver) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -294,8 +288,6 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_ROT(scaler_ver, rot_cfg) \
 	{ \
-	.maxdwnscale = MAX_DOWNSCALE_RATIO, \
-	.maxupscale = MAX_UPSCALE_RATIO, \
 	.scaler_blk = {.name = "scaler", \
 		.version = scaler_ver, \
 		.base = 0xa00, .len = 0xa0,}, \
@@ -308,16 +300,12 @@ static const u32 wb2_formats_rgb_yuv[] = {
 
 #define _VIG_SBLK_NOSCALE() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats_yuv, \
 	.num_formats = ARRAY_SIZE(plane_formats_yuv), \
 	}
 
 #define _DMA_SBLK() \
 	{ \
-	.maxdwnscale = SSPP_UNITY_SCALE, \
-	.maxupscale = SSPP_UNITY_SCALE, \
 	.format_list = plane_formats, \
 	.num_formats = ARRAY_SIZE(plane_formats), \
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index addf8e932d12..fc7da6e1feeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -364,8 +364,6 @@ struct dpu_caps {
 /**
  * struct dpu_sspp_sub_blks : SSPP sub-blocks
  * common: Pointer to common configurations shared by sub blocks
- * @maxdwnscale: max downscale ratio supported(without DECIMATION)
- * @maxupscale:  maxupscale ratio supported
  * @max_per_pipe_bw: maximum allowable bandwidth of this pipe in kBps
  * @qseed_ver: qseed version
  * @scaler_blk:
@@ -375,8 +373,6 @@ struct dpu_caps {
  * @dpu_rotation_cfg: inline rotation configuration
  */
 struct dpu_sspp_sub_blks {
-	u32 maxdwnscale;
-	u32 maxupscale;
 	u32 max_per_pipe_bw;
 	u32 qseed_ver;
 	struct dpu_scaler_blk scaler_blk;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 70d6a8989e1a..6360052523b5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -785,12 +785,15 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
 	return 0;
 }
 
+#define MAX_UPSCALE_RATIO	20
+#define MAX_DOWNSCALE_RATIO	4
+
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
 {
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
-	int ret = 0, min_scale;
+	int ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
 	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
@@ -822,10 +825,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	pipe_hw_caps = pipe->sspp->cap;
 	sblk = pipe->sspp->cap->sblk;
 
-	min_scale = FRAC_16_16(1, sblk->maxupscale);
+	if (sblk->scaler_blk.len) {
+		min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
+		max_scale = MAX_DOWNSCALE_RATIO << 16;
+	} else {
+		min_scale = 1 << 16;
+		max_scale = 1 << 16;
+	}
+
 	ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
 						  min_scale,
-						  sblk->maxdwnscale << 16,
+						  max_scale,
 						  true, true);
 	if (ret) {
 		DPU_DEBUG_PLANE(pdpu, "Check plane state failed (%d)\n", ret);
-- 
2.39.2


