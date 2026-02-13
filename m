Return-Path: <linux-arm-msm+bounces-92800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +EJ4FUc7j2nHNAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92800-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:55:03 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id 962B51374E9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:55:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id D2CC83025F06
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:54:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ACE481C5D44;
	Fri, 13 Feb 2026 14:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GoHT6pul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CAA534A3B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994490; cv=none; b=SbAJp/68g1T1bQU3Vs9Ac+dPCrEOH7miTvxeABKc6hLsndYfeiYezxyWpQd1yiPPDfcvpLxg+kehrKcdktjDGbua0oS3ZzqHBCfiRqIVry3q1uSCbrQfWEsQ+H0Kd0cjCnwBmV27N48KvEqYOKGlF4QG9gU6ghV00l868//Mwz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994490; c=relaxed/simple;
	bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gtzml5hNgdc+l8/00QnIBXWyMS5BXNspyVNC8TpGp6IrYSBuDPN8Q3bb9Tp5cx0HFeUZXxu2fqOM3bwdgk2WNXfb4PsXoET4CaTUZv0ZaD+5Czd7sfSUEjFRoQanYBdm8sH+1gzcwPb6doYxvy+/xegIrt8MNeCgISh/T/qNexE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GoHT6pul; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c93e0269cso2184873a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:54:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770994489; x=1771599289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
        b=GoHT6pulgN+PmyX9dow7W8H5OQJihRjF1b0753weR+5VbmV1VGbHgsOCwBgd1W4CHk
         YhVXQun3Ar7kUmBZtFF97aC0cyh6eJPSqzn9SCkSP8M1/LFnjxMDuijPsH/xuAYdmqfa
         29A2yk6IqUmIQVZizTLVUlMb9RrleTN3inzcHCNLwtHjpRsjFNBkI3M4lDnm2B78ez9i
         aHjEh9EipOKX0lfwxbE9qIy8GTPYI8PZpkuXilTcI0loORwMTMstAUXQ293dGF1QMfDs
         XxcVQDLZrpS9u+XulguCr4gRb9GHf/oJjUN6wGSPp1jEYrPBBO4gQUYvivUeCmyGwzfT
         r3bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994489; x=1771599289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ROwhGAC+uM/YVDPTZ7SWeJKccnx9vcVwkY+8qPNgeE=;
        b=ZFYsPCbZLG3F71niaSugYdu+Cu6uWCV01s5O9wNKqpAMmYWqEIebMDmzm9bLy9YhD3
         vxzQ/D57nLNI4oKwTRP+S9A51SpxMUKsPk38boIAfm14XLlxYFY1C8FrfYU2cNQaRpgT
         LBip1fXcYkRfSas5GtvGR8yk9QKeLyWo+wOlmw6/FqNtrAywJiMpanDdmkHmFJbg0jRK
         +JS8HcXl8DV+FWP74zNo3QC+5mJS7hzb8BniTuUFwGK1CC8RRZ8oc9N9LigDKWR5Rt+/
         DrVy6Rt46VwO/usWWtbmc4QuOucjM4r1Lpa16Ax6vL7Jxy9Pg3U37PCEZ6GT8Y0e9x4L
         HqQQ==
X-Gm-Message-State: AOJu0Ywa7Wy+rAmZP4A5JQzX8IIOd4bUA/hRO8NU4M+JBEVv1DFgOCDq
	03uYmutLsLIm9vdzYPF0QtWnfDoU6HSmw9Zeh0VlInPGPy+UzgXyzv/eyO7TV67bqLw=
X-Gm-Gg: AZuq6aL75B/vPi+dBeGNkvAfSzxaPgxjuc/TFFDptW1/JYWm8dp9fZh0325MDzgrFdV
	+xfUNFuS6dGWiaK35fDGFdW8stJ3R8u9hy/hrsns+MJX+Hq1kGAKYn1r42O6lHMzWdaul57cqXl
	Rv0UMfEDoDKxnIrwE8LqDdRXDde9+k3MpeUTuyHermFm5A0VlJQEXIRDJv8QSMxLErW5N9k2e8v
	gKY8flP95y4Ka88nIV5lLJKQHF+hmTFXIyjvZB5Xti4JRvztwT+pVBrEsexTvsVkVvRqTjjPs7Q
	m5rfNX/q7emQiiGM5B7SRSwNjqq/sNZr5UVuuvHvFG30NnDjPsrxsQ3GZtrtv6ONa8RxehqNC/Y
	1xthOLKMSgh0zYVwC4Iqo2vjkWEoh9EDnPKcVGNfqPhQXiNwHAv8YR3EAYwPzkNV58x7k7zaitj
	OC9vDej+0xAetn18mW7iea10cBOeV7R3PwbjVV3vwK2lwUC76V/flY9dXnZG7N1GrZ3ZY=
X-Received: by 2002:a17:90b:3c03:b0:34c:7212:7a67 with SMTP id 98e67ed59e1d1-357b518b298mr278498a91.12.1770994488494;
        Fri, 13 Feb 2026 06:54:48 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net. [210.61.187.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:54:48 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:25 +0800
Subject: [PATCH v18 1/4] drm/msm/dpu: Extract plane splitting into a
 dedicated function
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-1-5815158d3635@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=3875;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=0lT7RY7u/q/OvDkV4Xni5NMBZEHeI41cYul1o1LxOgY=;
 b=x3weaFm2PlNMn3CfL4RIoYr1Kac9Rcr4tlBVb35PAKV9faheYU9eInS4/w7+FocmSsmDz96H1
 i/T4SkPRpHuD3sgBTd56hxtfXhSSxA78YpK1OCyYy+qbvIfHGpKQEly
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92800-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[104.64.211.4:from];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[13];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[209.85.216.48:received,100.90.174.1:received];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:mid,linaro.org:dkim,linaro.org:email,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 962B51374E9
X-Rspamd-Action: no action

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


