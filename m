Return-Path: <linux-arm-msm+bounces-92801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iEPYLoY7j2nHNAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:56:06 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 39283137552
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:56:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id D7AC630BBD74
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:55:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8FA29360722;
	Fri, 13 Feb 2026 14:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bLbprQrJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F027362124
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994498; cv=none; b=Nd56CWQ03yhQ2JofC4zWHmji+z0eQklThtghuqDuwYXhY52+GeyGcqrAH+UDBLTWm/YEhW7qm1yW4M84rEuCTYKU6GPwcozvkyRBX2i1NwGaAyzACkpoqcTmibb2nlRTuOMix7Rj3bNW9x1WG7QFo8+AgxCkoF//9JZkokGsITU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994498; c=relaxed/simple;
	bh=i1RzzvrabPDykfHEg1NdrWB/7Psq7/tLp+Qwsh/cZPk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HvTYgwq/oLvWJrxPO+PthIFliX51Wj6ncVyMe5bdrEKKu8WIw1aRiUdn1FTA7oQ21RnrQ8t2RUUC14CxQhui6dBrmzC12OhDyzvSLm4aKmSL2v61edmp12u7bHAvNr576ontFg4m8yyIYoYpObuZi8qUm2lekhEwm5Qdk9Izuno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bLbprQrJ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2ab46931cf1so9390105ad.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:54:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770994496; x=1771599296; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJRT2v8jR64TlQeKrM51Zo5YOhN2bxIL4OyBharSJp0=;
        b=bLbprQrJ4YjWeytjxQqBzWCdyEumsFl4fK7H92bZ4+gcjQLgHaNjj/KD7oeKDD0Cys
         daQYc8yF3M12P0L++zwiGgzJ7YVWwHaQiW17MJhQazhirMf9x9jtVHdsVBjJJiUNeN/+
         z5Eh9HVfaTULv2CrFwz4ck2hhq6tgSECWMfbSTNvw1yQCc4H5JIDxOHC9uFJVe9wogKO
         P58C686dwQ6jh86yiy3bBHb3yMToJEAAXEVCwe5G/iBXVjRLk0x86JdKqCjfvr/64GbP
         exC72Jvf6hApIP4mzgf6uBTp5MZgXabJWXBA6lcbSVFyIlVoLwFI96zj96Sv0KMlhjn0
         83NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994496; x=1771599296;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uJRT2v8jR64TlQeKrM51Zo5YOhN2bxIL4OyBharSJp0=;
        b=QgWso49UZ1sMB4h+0N4C3TZZH1Peqk6YPtiOCnaojxoRH5dma6hpKgfbAx4jezjWlA
         0ITOvxSs1sBQk+2rVyS/ggJYiTpFLnNDPK1n6DJnrd+jKUVZ1qDYh5YCYGqNs1Awq7/E
         ZpmscgMDj5cvt0ttLRnlGCGilAsSD/R8+STjb5eXyOiEx3mMsEwtY6+xqkTiyfnICy3d
         vM7PAl/rHdLxsR87+64UyOIOSjPXLcLco0amK7OuJ6u0tzoYyp7iC/A5kt6se184pPil
         JJdbsuU6/9zGeOc0nIMeP71qA1sg83FivmuKbb7DgOX4lsIYsnGAHXYY4NcP3cw9tY9l
         IyiQ==
X-Gm-Message-State: AOJu0Yw3k4QjWZrpNfk67PLcXbVpzXIWuOZ1Vbn78bDe+Na/u+TQOAtT
	+UYWL1+ce2ody7zacV/aQaZkBZtUt816YqZCcGpxjAL5FvMSqp5PGE7E1kIDQ4BzKwI=
X-Gm-Gg: AZuq6aLZFGuiVZkoqe0z8eiTcIK4eFQnwgjrAb4w5XxSkgPzVrKwu3gb38H7EsABkvZ
	l2II7TMQLdm8EMOeC9br6hgqVwnd5j8nMz9G5Qal1dPswBP1J0vq78whOLdFIRORNuFODdpTwyp
	g/eSBndjFdfUSB2QCeM603BOeGifewQZc0qgtklCWantKYylRNRXBRC7Nhv0cfSqrEMGoVUD6jd
	xh9EqL2/Kflr2GNJiUSKklX/HuQySpn6yOREvilzUivskFEyLgCLiqXzTUq7QUjGlWUXj3/wnZf
	psC4PWzgEdnjLjKIPL+pNLgFo83ADDARh9Y8JISlCkpd4aYAr+lnakLhCehSjXKjEujTYQLyOFv
	/BF82ogiaQr4if9jArE54PafA4pglFTtLO1IPiAbubWK2AQCnqyuaalhGQoaGi0ogdUfW6DC4KN
	DzAjBhp1ylqwoQyVNH/0v/XTMtPv5mKnIxgqFlX/wBnRZshd3F8FYh4Ra9
X-Received: by 2002:a17:90b:3fcd:b0:349:162d:ae0c with SMTP id 98e67ed59e1d1-357b5099fc2mr268604a91.4.1770994495516;
        Fri, 13 Feb 2026 06:54:55 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net. [210.61.187.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:54:55 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:26 +0800
Subject: [PATCH v18 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-2-5815158d3635@linaro.org>
References: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
In-Reply-To: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=9685;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=i1RzzvrabPDykfHEg1NdrWB/7Psq7/tLp+Qwsh/cZPk=;
 b=nr7UC/X9qLl1fHVfTwnuqUJxOxnsm/m4g0kvNNqOcNxbzasp4NRSTg/+c8/2G4mlqNns6S52K
 H8bBOWmtDoPBjCp43KDF0ZfAOm/UtVlqmpvYNVPxnmYXvQVJSgFx1s9
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92801-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2600:3c04:e001:36c::12fc:5321:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[100.90.174.1:received,210.61.187.172:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: 39283137552
X-Rspamd-Action: no action

Currently, mapping plane to SSPP occurs during the plane check phase for
non-virtual plane case. The SSPP allocation and plane mapping occurs during
crtc check phase for virtual plane case. Defer these SSPP operations until
CRTC check stage to unify the 2 cases, and ease later revisement for
quad-pipe change.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 155 +++++++++++++-----------------
 2 files changed, 66 insertions(+), 92 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 6bf7c46379aed..797296b14264e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1534,8 +1534,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
 			return rc;
 	}
 
-	if (dpu_use_virtual_planes &&
-	    (crtc_state->planes_changed || crtc_state->zpos_changed)) {
+	if (crtc_state->planes_changed || crtc_state->zpos_changed) {
 		rc = dpu_crtc_reassign_planes(crtc, crtc_state);
 		if (rc < 0)
 			return rc;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 66f240ce29d07..be1a7fcf11b81 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1119,102 +1119,24 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
 										 plane);
 	int ret = 0;
-	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	const struct drm_crtc_state *crtc_state = NULL;
-	uint32_t max_linewidth = dpu_kms->catalog->caps->max_linewidth;
+	struct drm_crtc_state *crtc_state = NULL;
 
 	if (new_plane_state->crtc)
 		crtc_state = drm_atomic_get_new_crtc_state(state,
 							   new_plane_state->crtc);
 
-	pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
-
-	if (!pipe->sspp)
-		return -EINVAL;
-
 	ret = dpu_plane_atomic_check_nosspp(plane, new_plane_state, crtc_state);
 	if (ret)
 		return ret;
 
-	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
-	if (ret)
-		return ret;
-
 	if (!new_plane_state->visible)
 		return 0;
 
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
-{
-	struct drm_plane_state *plane_state =
-		drm_atomic_get_plane_state(state, plane);
-	struct drm_plane_state *old_plane_state =
-		drm_atomic_get_old_plane_state(state, plane);
-	struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
-	struct drm_crtc_state *crtc_state = NULL;
-	int ret, i;
-
-	if (IS_ERR(plane_state))
-		return PTR_ERR(plane_state);
-
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
-	ret = dpu_plane_atomic_check_nosspp(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	ret = dpu_plane_split(plane, plane_state, crtc_state);
-	if (ret)
-		return ret;
-
-	if (!plane_state->visible) {
-		/*
-		 * resources are freed by dpu_crtc_assign_plane_resources(),
-		 * but clean them here.
-		 */
-		for (i = 0; i < PIPES_PER_PLANE; i++)
-			pstate->pipe[i].sspp = NULL;
-
-		return 0;
-	}
-
 	/*
-	 * Force resource reallocation if the format of FB or src/dst have
-	 * changed. We might need to allocate different SSPP or SSPPs for this
-	 * plane than the one used previously.
+	 * To trigger the callback of dpu_assign_plane_resources() to
+	 * finish the sspp assignment or allocation and check.
 	 */
-	if (!old_plane_state || !old_plane_state->fb ||
-	    old_plane_state->src_w != plane_state->src_w ||
-	    old_plane_state->src_h != plane_state->src_h ||
-	    old_plane_state->crtc_w != plane_state->crtc_w ||
-	    old_plane_state->crtc_h != plane_state->crtc_h ||
-	    msm_framebuffer_format(old_plane_state->fb) !=
-	    msm_framebuffer_format(plane_state->fb))
-		crtc_state->planes_changed = true;
-
+	crtc_state->planes_changed = true;
 	return 0;
 }
 
@@ -1261,9 +1183,9 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
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
@@ -1273,10 +1195,6 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	const struct msm_format *fmt;
 	int i, ret;
 
-	if (plane_state->crtc)
-		crtc_state = drm_atomic_get_new_crtc_state(state,
-							   plane_state->crtc);
-
 	pstate = to_dpu_plane_state(plane_state);
 	for (i = 0; i < STAGES_PER_PLANE; i++)
 		prev_adjacent_pstate[i] = prev_adjacent_plane_state[i] ?
@@ -1288,6 +1206,10 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	if (!plane_state->fb)
 		return -EINVAL;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	fmt = msm_framebuffer_format(plane_state->fb);
 	reqs.yuv = MSM_FORMAT_IS_YUV(fmt);
 	reqs.scale = (plane_state->src_w >> 16 != plane_state->crtc_w) ||
@@ -1318,14 +1240,56 @@ static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
 	return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
 }
 
+static int dpu_plane_assign_resources(struct drm_crtc *crtc,
+				      struct dpu_global_state *global_state,
+				      struct drm_atomic_state *state,
+				      struct drm_plane_state *plane_state,
+				      const struct drm_crtc_state *crtc_state,
+				      struct drm_plane_state **prev_adjacent_plane_state)
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
@@ -1334,8 +1298,19 @@ int dpu_assign_plane_resources(struct dpu_global_state *global_state,
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
+							 crtc_state,
+							 prev_adjacent_plane_state);
+		else
+			ret = dpu_plane_virtual_assign_resources(crtc, global_state,
 							     state, plane_state,
+							     crtc_state,
 							     prev_adjacent_plane_state);
 		if (ret)
 			return ret;
@@ -1772,7 +1747,7 @@ static const struct drm_plane_helper_funcs dpu_plane_helper_funcs = {
 static const struct drm_plane_helper_funcs dpu_plane_virtual_helper_funcs = {
 	.prepare_fb = dpu_plane_prepare_fb,
 	.cleanup_fb = dpu_plane_cleanup_fb,
-	.atomic_check = dpu_plane_virtual_atomic_check,
+	.atomic_check = dpu_plane_atomic_check,
 	.atomic_update = dpu_plane_atomic_update,
 };
 

-- 
2.43.0


