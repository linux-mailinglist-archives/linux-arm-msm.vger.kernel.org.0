Return-Path: <linux-arm-msm+bounces-89953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wCJNG2KIcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89953-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:03:46 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 1545E5338B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:03:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id C9BCF72442E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:02:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DAE794779A7;
	Wed, 21 Jan 2026 08:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rl+ZaBN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287E47277A
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982529; cv=none; b=ZC8aJ5Fh01BxnCPL6i0iiZGQVb3JthGhp/QGavFy3ig17kOKPayxfdrj+c4T4ddlY40u1CPGsY+zhJHHfA/IoIb4OZXEn/GZnjYBhMDBsl01eXvtdisZQaY44gN6Z/K+t0/TdKcB8zzt6pj98DnhN8mxdwjFf/Kaj8PgEIzARcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982529; c=relaxed/simple;
	bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=suSqJN2d27OpW/x6a5d0Cg3ANT1+X7ZzJOWxFAXMHjPFWnn6zdsSBSAtlfIzhVWqpixO8F6CSmnlJxyTnL/Q99ZqH95JptBP+P+Ed/X1jcX9p8nU2vPDq7CaUbS8FJbtt+Hqg0Oe/D22cNl88qkzjlK5bZYENCD0fzqjw9ahstk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rl+ZaBN6; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d67f1877so43225025ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:02:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768982527; x=1769587327; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
        b=rl+ZaBN62QPWRqf8Yy9XxupZDbliFZUQh0fgnhrQenLjJ2C/MrS/O08ND+YsrpKDoB
         kZ4i2eUteb/F/+p0FGtlYGwSk9KRab96VPITnThbCAgjmT2d7pbx4+uQO0zUW1gFblYg
         bzesWYSFzfyNM4/88BdJUX9bzn7qFCjrzoRZbbwztJodSEPrTI4tLrxikOPkC93Vh9u4
         o/CjMtYlThIAQAHeM71dS+7VA9RV86E2dZrhLHknKDuTqYxT45lr6ePmRnXdsDGOH/6+
         YzxT47F7mOq02PFl5HQJMU0t24eUvtAV5CjUGGYm5BrSKXdwbwtMFzu4BlH/IxGfNes5
         xfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982527; x=1769587327;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
        b=descsnkBIGezbXMwQPXNsrwLfvQTdGU/wBqgxdhMz98PQ6ycPKbxEZvVl/LfUR+zeQ
         peA3NjkxKrG52F9endFiK8FPDQlekUIRmslQXbypCYn/+RiGblm9RTYOC9aTJVmIehKo
         OWcVkd+OZ6OguOQEUgwanof058gO0/Koejs+WkOuP2lP6Rz9cVDzarI6mloKKcEykZ/H
         gBsQcsbT6NMxwbeKWHwV1j4nsjOpCYifrKoRL86WGLvwX6TNW3/x6qjy5Z0vh+8Snuu2
         Ruo2pIwM90pOCynIUuBPs2fKGts+ESNbL6hlTg0A7ghJ1tnpoli7rVFyVEqGPYs3DRmJ
         //gg==
X-Gm-Message-State: AOJu0Yz8cz4tZJzU4Evjbld8TpsWNLpUFlLjdUB5Bi4fB9ZPCJBrck7G
	+9XUV1WMpVJfs6hx+3pG0DUoM1jHHbS+X3alo+pV5Lct7HO6fhrogRRSNlcbdmMNDyA=
X-Gm-Gg: AZuq6aImpRHHgHzIiDR/YyHwDfniP5/ibmNjb5PvnUiBG7luhMzZ1547q/MeEpO0pSI
	Pt9+lRWw00ZQfYVKj00WEp2QF/qyc6z5FKmushRh74Y+K5GWm1HrhcCa0OgLuPXy5HlCMOC/0Md
	avrZk7JOG0QPIij009GOOzSTw/7gbN813Y/fzpWa736eRz+MzcIDosE/uG1bh+jVacxF21TQbxB
	5kjZfA5eY1aCodjZp0XT0EFLHGmjgUpm6+Eo/5gvlMh8zUahK3ypsA7B6ltaqzxyVr3a52SOaT0
	+4f+n5jYGJDN5csohrN4AhCI4SfpzCQJ2bfxjWl7Xpdgr/B8bVTXuGz+AgG2nHA8lZeorwoilwG
	i+haom8S3rFWn4L1x3R2ItMcKliN1OByvixn1sB06SWIdIlHpyOCDckow0AeS
X-Received: by 2002:a17:903:120e:b0:2a7:a653:5203 with SMTP id d9443c01a7336-2a7a65357e2mr14021225ad.27.1768982527409;
        Wed, 21 Jan 2026 00:02:07 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:02:07 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 16:01:50 +0800
Subject: [PATCH v17 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-msm-next-quad-pipe-split-v17-1-6eb6d8675ca2@linaro.org>
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
In-Reply-To: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=3875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
 b=juT6dM7+wS6bJ686Sz7r81JjtuD2R3kEK1T/TWFYvoeqbWMGUk0aI9oIPqlOt55UihLWbNWX1
 DtWFQDyewVcCrJu4auRZ6pmyKxxlrana1zeB0SWz3g0EqmIShha9sJk
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89953-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:142.0.200.0/24, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[dfw.mirrors.kernel.org:rdns,dfw.mirrors.kernel.org:helo,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: 1545E5338B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

dpu_plane_atomic_check_nosspp() currently handles both plane
validation and plane splitting. For better simplicity and to
facilitate future refactoring, move the splitting logic into
its own dedicated function.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 51 ++++++++++++++++++++++---------
 1 file changed, 36 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 9b7a8b46bfa91..66f240ce29d07 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -821,13 +821,8 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 {
 	int i, ret = 0, min_scale, max_scale;
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
-	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
-	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe_cfg *pipe_cfg;
-	struct dpu_sw_pipe_cfg *r_pipe_cfg;
 	struct drm_rect fb_rect = { 0 };
-	uint32_t max_linewidth;
 
 	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
 	max_scale = MAX_DOWNSCALE_RATIO << 16;
@@ -850,14 +845,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		return -EINVAL;
 	}
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
-
 	fb_rect.x2 = new_plane_state->fb->width;
 	fb_rect.y2 = new_plane_state->fb->height;
 
@@ -879,6 +866,34 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 		if (pstate->layout.plane_pitch[i] > DPU_SSPP_MAX_PITCH_SIZE)
 			return -E2BIG;
 
+	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
+
+	return 0;
+}
+
+static int dpu_plane_split(struct drm_plane *plane,
+			   struct drm_plane_state *new_plane_state,
+			   const struct drm_crtc_state *crtc_state)
+{
+	struct dpu_plane *pdpu = to_dpu_plane(plane);
+	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
+	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
+	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	uint32_t max_linewidth;
+
+	if (!new_plane_state->visible)
+		return 0;
+
+	/* move the assignment here, to ease handling to another pairs later */
+	pipe_cfg = &pstate->pipe_cfg[0];
+	r_pipe_cfg = &pstate->pipe_cfg[1];
+	/* state->src is 16.16, src_rect is not */
+	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+	pipe_cfg->dst_rect = new_plane_state->dst;
+
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
 	drm_rect_rotate(&pipe_cfg->src_rect,
@@ -910,8 +925,6 @@ static int dpu_plane_atomic_check_nosspp(struct drm_plane *plane,
 				    new_plane_state->fb->width, new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
-	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
-
 	return 0;
 }
 
@@ -1129,6 +1142,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, new_plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!new_plane_state->visible)
 		return 0;
 
@@ -1169,6 +1186,10 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
 	if (ret)
 		return ret;
 
+	ret = dpu_plane_split(plane, plane_state, crtc_state);
+	if (ret)
+		return ret;
+
 	if (!plane_state->visible) {
 		/*
 		 * resources are freed by dpu_crtc_assign_plane_resources(),

-- 
2.43.0


