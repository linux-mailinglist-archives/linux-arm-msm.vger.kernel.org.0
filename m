Return-Path: <linux-arm-msm+bounces-97164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cF8zND15sml/MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:28:45 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 7838226EEFB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:28:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id E238F301511F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:28:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0851731E85D;
	Thu, 12 Mar 2026 08:28:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eBRzh6JK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A46D2FFDDE
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304123; cv=none; b=W4GsKPmhZc5yZHn2kJs4NaGkWfQ2oKsO0RQ1BfOqzSQzEBgHU+75qmGJTa1Qw/P6DJ7T/2rLjZJljEZcUcduLd9MXkTlqBKbMP8Lgi/dr6ygV7n2KspPkf47ZlI2evap1yiUeQB3YDgf5a3PtMb8kbxvVRNHBzn0QWcer9sijQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304123; c=relaxed/simple;
	bh=llcAoN5oMCj08hUSIdLT6NP8xPSgK+elXOWbE1sjvd8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BlE3YDtGTtcPw9dTM1rfwmjtY4sgY7WlYJwGVjPElR0i90VijfiPlufbc3kChWk37OzKDg8N173vJaZr9vheLcpms/GvVrEBfLg7Pi4LzTVBlaqTJXmi4mN8j0M8lYLU4tqAHlSIyXJCCGNKe0ZGwRehOjOCQ9xfYql4jgwAHME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eBRzh6JK; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439bc14dcf4so1381222f8f.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:28:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773304121; x=1773908921; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H21vp6hR1X4O6tjqIgvx5S4K1FkSDkFIhmuzuM7d1Yg=;
        b=eBRzh6JK6nI+zZDejlC6IkPIb3RG63FSU08ppO1BTG6usvzzvTCio4WTl++o9m3bgI
         Vpv9npIEeVN9bVUDLEuJZjH4DenRya1jE/NlMJuhM6byVikoBYzCH1fNw9M96D+6GWw8
         WwcFgm2W7Ru6Q/JRbnwC6iTFdZekXJMdOxcCsMJFkBgJrPtEXYixA73ehqZ00tSYUmuV
         KGvYBwcFDu1hquQ6lwqLL6LNkHvVIgxgwGVq5mvsBiDYSMwBnGi1vySQjgHU2GCa6nXj
         oKeY1X01aqdh08FQWVazn7nXpAqonACpKFDcdCUbZy0JB9VwODDtNMVYKx9QYZ5jfvRR
         ZVtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304121; x=1773908921;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=H21vp6hR1X4O6tjqIgvx5S4K1FkSDkFIhmuzuM7d1Yg=;
        b=EA6g6sxyKA+2elAsu8PdAWtk5FdYmkPo3IdyJkdTyW4ojqTKelMvvouOd/gZ4nAa0C
         0X4FJp4ZM74a8nJIeXS2580gBj6WFXMyRXCq9buCVFLFPPeOLjAwnVS8ZFRv2SWi65oL
         Lo6tlTtlmn3e2YiKbVg+hmMNKLmejaGCJoROJG/ALBpYpXgFKjDnXoFZLr2SDG57ewnN
         prxa0TZ+LJ3G19EAMipTa5AG3+bdpmq7flCNJhmkG6zv9wfAjEL+mX98o9BjBYk8Bkfu
         qaS+qsIj0Q/nF/yHhUapsBAQ7AZVYkEa0v3XN2L8EX8WAbbzdOdHa/TfA9HN6UhD96jU
         leQw==
X-Gm-Message-State: AOJu0YwI6sC7n8wv5G+mPgNpAanpTwlPPsG1SwlUIyNJ6hFUP1DVU0G4
	Ob9kVNxozS482B7kLhgZV8IOSQ+1oVGQnsrwLCGRTC7Ymt3xts9ZzA18o18p5ynzdns=
X-Gm-Gg: ATEYQzxf3aXT228fQ7KqOwLv9jY+W9RYMa07cnPrptcVLMr1u6QwOsKWLh1QolEmkBP
	XU907TJP8LKcuGhUTP293mPGNCjsNiz4nI76oQzrXcSzeJVab4/sAg3WaPB6+Lkbj4ttPBwup+L
	/AopMxeUByup2mzCnDW3Y24Xemvbpj0+dXCtmjL4uOqNEMt4Fk3gIEeuvcjBU8e5hTLaRn8MYbZ
	2rwu93lGi8FpiGYWSAgpF6zypu57yqmHyCrSpMX1EeEEeyDQnYP75bYjkY9IB1GXm6z6vgDb10T
	HFkeCkIWU04Eh0hSeZE4BpmLd55N3eezuWVFgaRGdEFKBLoaiQeEkBgGDZM0p+oVemy08zB+8On
	Ai13utkk5gRzOpfiOp3RJpOY6nhMGOFfrDWSTLGyc55CMI8amaMd/aacyj+F40muvJ55Ue6/QlF
	WjwRE=
X-Received: by 2002:a05:6000:2c07:b0:439:c24b:ec15 with SMTP id ffacd0b85a97d-439fdf8aa4fmr4431739f8f.5.1773304120641;
        Thu, 12 Mar 2026 01:28:40 -0700 (PDT)
Received: from [127.0.1.1] ([2a04:6f00:1::ee:b:1015])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm6273780f8f.29.2026.03.12.01.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:28:40 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Mar 2026 16:28:11 +0800
Subject: [PATCH v19 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-msm-next-quad-pipe-split-v19-2-4ffa2b06c996@linaro.org>
References: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
In-Reply-To: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304094; l=10582;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=llcAoN5oMCj08hUSIdLT6NP8xPSgK+elXOWbE1sjvd8=;
 b=ObM16Q5nSNb6OskbUYeeMtfFvDsy/YRjzDsHTsWSpTqbAcocUYuxFSX+LmAVArbQeMPZXms/F
 7C/Fus0C+7AAVDlPA2W4pFo5hC7O8rWJl4Q8VL2dM6blSK+y52r53FK
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97164-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,linaro.org:dkim,linaro.org:email,linaro.org:mid]
X-Rspamd-Queue-Id: 7838226EEFB
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Currently, mapping plane to SSPP occurs during the plane check phase for
non-virtual plane case. The SSPP allocation and plane mapping occurs during
CRTC check phase for virtual plane case. Defer these SSPP operations until
CRTC check stage to unify the 2 cases, and ease later revisement for
quad-pipe change.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  25 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 136 ++++++++++++++----------------
 2 files changed, 80 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6bf7c46379aed..e97456d4fbb8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1325,7 +1325,7 @@ static bool dpu_crtc_needs_dirtyfb(struct drm_crtc_state *cstate)
 	return false;
 }
 
-static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+static int dpu_crtc_assign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
 {
 	int total_planes = crtc->dev->mode_config.num_total_plane;
 	struct drm_atomic_state *state = crtc_state->state;
@@ -1338,8 +1338,6 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	if (IS_ERR(global_state))
 		return PTR_ERR(global_state);
 
-	dpu_rm_release_all_sspp(global_state, crtc);
-
 	if (!crtc_state->enable)
 		return 0;
 
@@ -1366,6 +1364,19 @@ static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state
 	return ret;
 }
 
+static int dpu_crtc_reassign_planes(struct drm_crtc *crtc, struct drm_crtc_state *crtc_state)
+{
+	struct dpu_global_state *global_state;
+
+	global_state = dpu_kms_get_global_state(crtc_state->state);
+	if (IS_ERR(global_state))
+		return PTR_ERR(global_state);
+
+	dpu_rm_release_all_sspp(global_state, crtc);
+
+	return dpu_crtc_assign_planes(crtc, crtc_state);
+}
+
 #define MAX_CHANNELS_PER_CRTC PIPES_PER_PLANE
 #define MAX_HDISPLAY_SPLIT 1080
 
@@ -1534,9 +1545,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return rc;
 	}
 
-	if (dpu_use_virtual_planes &&
-	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
-		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
+	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
+		if (dpu_use_virtual_planes)
+			rc = dpu_crtc_reassign_planes(crtc, crtc_state);
+		else
+			rc = dpu_crtc_assign_planes(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
 	}
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4ed14f203c315..70992a4401d69 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1112,65 +1112,13 @@ static int dpu_plane_try_multirect_shared(struct dpu_plane_state *pstate,
 
 static int dpu_plane_atomic_check(struct drm_plane *plane,
 				  struct drm_atomic_state *state)
-{
-	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
-										 plane);
-	int ret = 0;
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	const struct drm_crtc_state *crtc_state = NULL;
-	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
-
-	if (new_plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   new_plane_state->crtc);
-
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-
-	if (!pipe->sspp)
-		return -EINVAL;
-
-	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	if (!new_plane_state->visible)
-		return 0;
-
-	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
-					      pipe->sspp,
-					      msm_framebuffer_format(new_plane_state->fb),
-					      max_linewidth)) {
-		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
-				" max_line:%u, can't use split source\n",
-				DRM_RECT_ARG(&pipe_cfg->src_rect),
-				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
-				max_linewidth);
-		return -E2BIG;
-	}
-
-	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
-}
-
-static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
-					  struct drm_atomic_state *state)
 {
 	struct drm_plane_state *plane_state =
 		drm_atomic_get_plane_state(state, plane);
 	struct drm_plane_state *old_plane_state =
 		drm_atomic_get_old_plane_state(state, plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	int ret = 0;
 	struct drm_crtc_state *crtc_state = NULL;
-	int ret, i;
 
 	if (IS_ERR(plane_state))
 		return PTR_ERR(plane_state);
@@ -1183,20 +1131,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
-	if (!plane_state->visible) {
-		/*
-		 * resources are freed by dpu_crtc_assign_plane_resources(),
-		 * but clean them here.
-		 */
-		for (i = 0; i < PIPES_PER_PLANE; i++)
-			pstate->pipe[i].sspp = NULL;
-
+	if (!plane_state->visible)
 		return 0;
-	}
-
-	ret = dpu_plane_split(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
 
 	/*
 	 * Force resource reallocation if the format of FB or src/dst have
@@ -1211,7 +1147,6 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	    msm_framebuffer_format(old_plane_state->fb) !=
 	    msm_framebuffer_format(plane_state->fb))
 		crtc_state->planes_changed = true;
-
 	return 0;
 }
 
@@ -1258,9 +1193,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 					      struct dpu_global_state *global_state,
 					      struct drm_atomic_state *state,
 					      struct drm_plane_state *plane_state,
+					      const struct drm_crtc_state *crtc_state,
 					      struct drm_plane_state **prev_adjacent_plane_state)
 {
-	const struct drm_crtc_state *crtc_state = NULL;
 	struct drm_plane *plane = plane_state->plane;
 	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
 	struct dpu_rm_sspp_requirements reqs;
@@ -1270,10 +1205,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	const struct msm_format *fmt;
 	int i, ret;
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
 	pstate = to_dpu_plane_state(plane_state);
 	for (i = 0; i < STAGES_PER_PLANE; i++)
 		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
@@ -1285,6 +1216,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!plane_state->fb)
 		return -EINVAL;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	fmt = msm_framebuffer_format(plane_state->fb);
 	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
 	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
@@ -1315,14 +1250,55 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 
+static int dpu_plane_assign_resources(struct drm_crtc *crtc,
+				      struct dpu_global_state *global_state,
+				      struct drm_atomic_state *state,
+				      struct drm_plane_state *plane_state,
+				      const struct drm_crtc_state *crtc_state)
+{
+	struct drm_plane *plane = plane_state->plane;
+	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
+	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
+	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
+	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
+	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
+	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	int ret;
+
+	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
+	if (!pipe->sspp)
+		return -EINVAL;
+
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
+	if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pipe_cfg,
+					      pipe->sspp,
+					      msm_framebuffer_format(plane_state->fb),
+					      dpu_kms->catalog->caps->max_linewidth)) {
+		DPU_DEBUG_PLANE(pdpu, "invalid " DRM_RECT_FMT " /" DRM_RECT_FMT
+				" max_line:%u, can't use split source\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect),
+				DRM_RECT_ARG(&r_pipe_cfg->src_rect),
+				dpu_kms->catalog->caps->max_linewidth);
+		return -E2BIG;
+	}
+
+	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
+}
+
 int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 			       struct drm_atomic_state *state,
 			       struct drm_crtc *crtc,
 			       struct drm_plane_state **states,
 			       unsigned int num_planes)
 {
-	unsigned int i;
 	struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLANE] = { NULL };
+	const struct drm_crtc_state *crtc_state = NULL;
+	unsigned int i;
+	int ret;
 
 	for (i = 0; i < num_planes; i++) {
 		struct drm_plane_state *plane_state = states[i];
@@ -1331,8 +1307,18 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
 		    !plane_state->visible)
 			continue;
 
-		int ret = dpu_plane_virtual_assign_resources(crtc, global_state,
+		if (plane_state->crtc)
+			crtc_state = drm_atomic_get_new_crtc_state(state,
+								   plane_state->crtc);
+
+		if (!dpu_use_virtual_planes)
+			ret = dpu_plane_assign_resources(crtc, global_state,
+							 state, plane_state,
+							 crtc_state);
+		else
+			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
 							     state, plane_state,
+							     crtc_state,
 							     prev_adjacent_plane_state);
 		if (ret)
 			return ret;
@@ -1769,7 +1755,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
 	.prepare_fb = dpu_plane_prepare_fb,
 	.cleanup_fb = dpu_plane_cleanup_fb,
-	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_check = dpu_plane_atomic_check,
 	.atomic_update = dpu_plane_atomic_update,
 };
 

-- 
2.43.0


