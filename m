Return-Path: <linux-arm-msm+bounces-74083-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D809B84D57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:31:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F1E7C623421
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:30:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B8ED3090E0;
	Thu, 18 Sep 2025 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dE8Xl8eX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D55B530CB20
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202185; cv=none; b=aPr0LEJWibZNamy0Suey16noNvkT29zVqmnRpMqpbZBCu/5TCqhvnWjQCc7NPq/v8ExrpMsy2BIonPCB+rjfF22KYlLJfI+4N/1q/mwmhargvYHwRVjCqB9Q2Rq94NzUlX1Ioqekq+n05/1pyPbj/xoTD3Ya15/xHofwfB7TdVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202185; c=relaxed/simple;
	bh=W7Ypqle5HGFFo4IvgWFjt6doyniRke+2cRvl/toTL9w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oTR9fWfxcUCi7r3sACF3+3S1f640+Z3iikGgIkljUuj/PoJb/hgZKjWLPvYFNRYak6kKQtXp+vx238sxjAXmxDWJizOP0kqGcI9gyvwivvIf+eocFsU40QbrSGPQb64xzvh9l6KNhQJm2muKfVNZ5PrEwn0ZLGyEeN3G31OxFlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dE8Xl8eX; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-7761bca481dso885592b3a.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202183; x=1758806983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nb8DHyczwqx5+B7VoAEcDJ2+iN4T6lU4LExrmwq9l0Q=;
        b=dE8Xl8eXLDFfSmcpzkXJ49rmAaz8oWcRmJznz1oeV0AELGTe/G5Ku9Y94NWeHK49FM
         3jeCGAVoEynjUv/bBItxyo+d65xeckjCZBaPEPZPELgh5ZpBU+4/IwT9l+yQrFwtUEJZ
         ZycIUQfgDGtXchpriUDEbFFLfONDjjaQeElK8hrQGeb+RsTnV+RB2n/dl9kk8JFyYuMJ
         KSmXx7VSOxtf9RoKmeRuVznNGHIHvbs0Z8adbnGCYqicWsZdDsaO6BoNgYrC/eVIcKti
         X3RRcdiD838fwteZEm8LFveWRNjaQIV5Xv8lfNwuaAW3l57CUlZomFhBIiW1R3BrlAsm
         Vl7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202183; x=1758806983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nb8DHyczwqx5+B7VoAEcDJ2+iN4T6lU4LExrmwq9l0Q=;
        b=RlexOKeq6xSVA83JIt+UMH2zvU35LJvYDwv/IlXpSO5sA81FLGGSauaXuJOMOtjEfW
         tQ9E1yjXKMvjoWCgFCJECQGXATvPZY09FSvQvTWzyvYeFcSi68b4mnEptvG4MQsVr5ey
         Z8wZvLgwzL6Gu+uV+GuCdDbywKHTJwmKkuhfqB4BQWQAiKXYBrHT/oF5xOXFU7kmy/JP
         W0J3kvZxyViRMQMoDVsvthbEpH67lV/B02DoKFqUnCw2GdcyFuvX0Qq8v7DMJjer62Ud
         wbixxtoXCoIZWJhbsmBZVt2/PcJEOo+JDZTNkOIZsDsNSBAGDrF0fNv7Jewb+Zx0oCl7
         2pSw==
X-Gm-Message-State: AOJu0YzvLWIyN4HTdyP/daLduaTbgP2KNktulSzs51/WUC+f1IvqJQLW
	ZKQ9CObE179PTfd1dO/wc8FDNTjVPIC5zBSRopayUzzgY8fsrPC2y0ld+T/EQmwpYME=
X-Gm-Gg: ASbGncuklrr7w6NDW0OdVsWkHQZqmecQW+sSfcutN/ArV+Rm1T4lVOev4qolEFBMqL0
	zWnIhBT9916tqeu4tmcDBLBzG/S5m+BMZAElPCr5mpAH1ffWJIzunFR4HlqlotgWVrW6rNTYMUN
	Es9PChXn6+pV8e8C/O1KWhPJa6vQPgoB6MwkAWkbnlp1fTB/m9vFoh6OsL7O7zK89vCTXvSf4bg
	IEQu3muU1U6z5ZJvSVSaaaNNkfBIZZcdUroUp0Pp6EPuYGJ/yFuq3tRlECSq5PV0ryeEQpo99+l
	VindDDTPN1TDyKsLO4PGhjkmoMAj9WV0zGiKw5E/9rvBUv2YT6RVzEc3C3kH2pPeoSM+BBj74xw
	rhmGRJeaj2rEkRqe4J/y6zo5OnhPXMGdD4woxhNco5UmMuA==
X-Google-Smtp-Source: AGHT+IERrXzRoc+Dcq10Q0G9F1/YT45cEstADmE67sqQDMdNAlS0SOYp9/sdHR5M5e7UMvIXy/yQRA==
X-Received: by 2002:a05:6a21:6d9c:b0:243:ff76:eada with SMTP id adf61e73a8af0-27a99f4dda9mr8608207637.6.1758202183247;
        Thu, 18 Sep 2025 06:29:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:57 +0800
Subject: [PATCH v16 05/10] drm/msm/dpu: split PIPES_PER_STAGE definition
 per plane and mixer
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-5-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=6547;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=W7Ypqle5HGFFo4IvgWFjt6doyniRke+2cRvl/toTL9w=;
 b=fAUAwG8srJr1uBcTLuEup5NeEpfBmRb/V2ElRLETXxKXcy/NY/fNnKOwVmXqYUg7WtaXFy5E4
 jtDNNWxFDUoAYiDVjh6oYo9/2iXDcAdyedCTLuIh/QVGqpVZ6rw5I9M
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

The stage contains configuration for a mixer pair. Currently the plane
supports just one stage and 2 pipes. Quad-pipe support will require
handling 2 stages and 4 pipes at the same time. In preparation for that
add a separate define, PIPES_PER_PLANE, to denote number of pipes that
can be used by the plane.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  7 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 19 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h   |  4 ++--
 4 files changed, 15 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index c69b63f858329f60908fa7544fb2e5b3aba88540..7b57e638def60f02116325401a8341da11d58e50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -472,8 +472,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
 		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
 			bg_alpha_enable = true;
 
-
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			set_bit(pstate->pipe[i].sspp->idx, active_fetch);
@@ -1305,7 +1304,7 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
-#define MAX_CHANNELS_PER_CRTC 2
+#define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
 static struct msm_display_topology dpu_crtc_get_topology(
@@ -1675,7 +1674,7 @@ static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
 			state->crtc_x, state->crtc_y, state->crtc_w,
 			state->crtc_h);
 
-		for (i = 0; i < PIPES_PER_STAGE; i++) {
+		for (i = 0; i < PIPES_PER_PLANE; i++) {
 			if (!pstate->pipe[i].sspp)
 				continue;
 			seq_printf(s, "\tsspp[%d]:%s\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 175639c8bfbb9bbd02ed35f1780bcbd869f08c36..9f75b497aa0c939296207d58dde32028d0a76a6d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -34,6 +34,7 @@
 #define DPU_MAX_PLANES			4
 #endif
 
+#define PIPES_PER_PLANE			2
 #define PIPES_PER_STAGE			2
 #ifndef DPU_MAX_DE_CURVES
 #define DPU_MAX_DE_CURVES		3
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 5bcdfe7078f717a59dc5a4883702d921ecf2025b..0be3eeb5edf0c14efb20eec02ba17e072fa2c829 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -634,7 +634,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
 		return;
 
 	/* update sspp */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
@@ -1157,7 +1157,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 		 * resources are freed by dpu_crtc_assign_plane_resources(),
 		 * but clean them here.
 		 */
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			pstate->pipe[i].sspp = NULL;
 
 		return 0;
@@ -1211,7 +1211,7 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	pipe_cfg = &pstate->pipe_cfg[0];
 	r_pipe_cfg = &pstate->pipe_cfg[1];
 
-	for (i = 0; i < PIPES_PER_STAGE; i++)
+	for (i = 0; i < PIPES_PER_PLANE; i++)
 		pstate->pipe[i].sspp = NULL;
 
 	if (!plane_state->fb)
@@ -1344,7 +1344,7 @@ void dpu_plane_flush(struct drm_plane *plane)
 		/* force 100% alpha */
 		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
 	else {
-		for (i = 0; i < PIPES_PER_STAGE; i++)
+		for (i = 0; i < PIPES_PER_PLANE; i++)
 			dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
 	}
 
@@ -1466,8 +1466,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 			crtc->base.id, DRM_RECT_ARG(&state->dst),
 			&fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
 
-	/* move the assignment here, to ease handling to another pairs later */
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!drm_rect_width(&pstate->pipe_cfg[i].src_rect))
 			continue;
 		dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
@@ -1481,7 +1480,7 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane,
 
 	pstate->plane_fetch_bw = 0;
 	pstate->plane_clk = 0;
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!drm_rect_width(&pstate->pipe_cfg[i].src_rect))
 			continue;
 		pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
@@ -1500,7 +1499,7 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
 	struct dpu_sw_pipe *pipe;
 	int i;
 
-	for (i = 0; i < PIPES_PER_STAGE; i += 1) {
+	for (i = 0; i < PIPES_PER_PLANE; i += 1) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1619,7 +1618,7 @@ static void dpu_plane_atomic_print_state(struct drm_printer *p,
 
 	drm_printf(p, "\tstage=%d\n", pstate->stage);
 
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		pipe = &pstate->pipe[i];
 		if (!pipe->sspp)
 			continue;
@@ -1676,7 +1675,7 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 		return;
 
 	pm_runtime_get_sync(&dpu_kms->pdev->dev);
-	for (i = 0; i < PIPES_PER_STAGE; i++) {
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
 		if (!pstate->pipe[i].sspp)
 			continue;
 		_dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
index 007f044499b99ac9c2e4b58e98e6add013a986de..1ef5a041b8acae270826f20ea9553cbfa35a9f82 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h
@@ -31,8 +31,8 @@
  */
 struct dpu_plane_state {
 	struct drm_plane_state base;
-	struct dpu_sw_pipe pipe[PIPES_PER_STAGE];
-	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_STAGE];
+	struct dpu_sw_pipe pipe[PIPES_PER_PLANE];
+	struct dpu_sw_pipe_cfg pipe_cfg[PIPES_PER_PLANE];
 	enum dpu_stage stage;
 	bool needs_qos_remap;
 	bool pending;

-- 
2.34.1


