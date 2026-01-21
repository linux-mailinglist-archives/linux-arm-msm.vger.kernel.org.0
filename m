Return-Path: <linux-arm-msm+bounces-89955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gMxfCHWIcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89955-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:04:05 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AE853392
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:04:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id AF7FB407940
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:03:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A1E02477E5A;
	Wed, 21 Jan 2026 08:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YI7ZqVSV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EEA3477991
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:02:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982542; cv=none; b=Pe3yXgi/yleUYhVlTCPj4nYPzkPIg7q+JDn+u/A4QVSgK8A9njpAhMmEDMbtyq928WhGtywAu29fqcGLhsnn4QLVfrWX8K1FRL+1H/WAjGmshhiBlw1j2oKAKc1SWEcJtzLSWFUXOw4AwEvMqB/DL4mDET/QGZ07EUAWWFLU7R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982542; c=relaxed/simple;
	bh=S1T74Y6D2F9qA1dfaYrbbsQtI+apSIgdZMEVXSOwbbM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ar7XEbQsy3WBjZB1/9Clhlh1qb27MDo8Lf3Qm0nXkqYbt9hc7352HjEdcAKbIa7WxOY6kR0wAuhZ9oKNKYN23YOB+YhLnOBqQqjEQTmWbiKQoPylNJi02bHQshZbQtIwZjC5ogkF/zrYyLH4oScWAv5KEhayxLHGLdVjrXmnCrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YI7ZqVSV; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0fe77d141so40674815ad.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:02:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768982539; x=1769587339; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBDteOxdBzOojlPhsjzryNojfnZi+drcSiJZtd7Uqqo=;
        b=YI7ZqVSV3om+R/kUjNgIgIktg4fyZ8editOIXDmhtalOlUbGYX0sus0yJBzr2JPsdr
         QtiDYPP5bIf9AT2aNdCwVEhQzV+oXIIFhEUjudr3ZZaAXs33IANlVdvPbp+qw6fmxycG
         f28Xq0qv/qZlh+VhAwlnCjwnMMQGzm4/8/8MevRA5rflzSF6CKbYqNEZbx83RJHAA2LG
         TaFqFaSa9yWateK1/5tdkmBeuN6UgfJdFwV/DcB0OWBfled8rzIXPbEBjUyRO5uRWzqq
         If0G5Ct3gB6HrXZAGJ5F1uMQ9SRyDXHk6J1ImB7CR2ojW3W/bGZ4VuvSF+zhhndNqWzq
         LymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982539; x=1769587339;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FBDteOxdBzOojlPhsjzryNojfnZi+drcSiJZtd7Uqqo=;
        b=Zgbk4t/AGwi6tJtvIrN4doaHWFpvxA075/KXn7dBAU3CZ7RASYPXmpRv6RZxevnHAL
         1PE1l5jakEG0X4M1buysUravrlqdzDHzqoSqk//tDO+G7YKf76PQjqrT4SQj6X7a2Elk
         He1/hW3p8Oo/rqBfY6/NBxmjJGULkohc4EaCT3an0IePSeyoOnici2GflW1fSYGTqc1Q
         FxZ22pMs3r5aw/P3vJUO8gQAazbo+kc7c22MoY/hz2Z5KYzbtqoMqazBC6lLGHPb7RER
         jimw5KM2iLFNAbBw4Z0YJCF+9yMMZQWFCiMuCA2ngmAseEiMb0nyguy4A9cli+ApixY0
         gR2A==
X-Gm-Message-State: AOJu0YzPwsRYOuwEoPf61l2qocs11E1JlvU4nt1/zsk7T8sZ2qa8Omcv
	2XUMVwG7PFfkgNl3oz+8a2Yzbz3XKAac5asvOE8AX/UfaVvqZcbyMi5xiNpwPjj+u6Q=
X-Gm-Gg: AZuq6aJcI/R8EX3sPN2UG5wWJlV+K63EZztyXnmp6U+8BWqyD4JPDfyEGnEqHm2A04q
	VnWP4JNT1vWPO0CQpVI1IXkBRS40bh+4g3QCt3b/wMqnF+dv8KlVm4uTsvxS8EOJI9vaTjeymXG
	MmOvNMIsPf1r5NB1lK5C/zqP6zQCpehU7TczmL9D2boHn3EOhne3gSLwaup86/dDdjr2zIrrPS+
	0CGkhAgv5uPo9/86bhvn3TqMbo8TYWlm5Zp83/fM1VNVjMZ6VBx/AwBpHT7FbbAHBwHAPhg+Jib
	5ijNmit+N3M02VMzIS6DjmHX0ejf9X4i/TSNVzWEWASeCZykqBW1jpboG/gP7LwMKGA8qfDWmvW
	nFmEIrM4tqrn9ah5rwC1gBeE/7VWRj6XBiNLevB8TDuqSFheMyULfGaIWl3H1
X-Received: by 2002:a17:902:fc4d:b0:2a2:dc1f:78d8 with SMTP id d9443c01a7336-2a7176cc6dfmr164302875ad.42.1768982538308;
        Wed, 21 Jan 2026 00:02:18 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.02.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:02:17 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 21 Jan 2026 16:01:52 +0800
Subject: [PATCH v17 3/4] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-msm-next-quad-pipe-split-v17-3-6eb6d8675ca2@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=9242;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=S1T74Y6D2F9qA1dfaYrbbsQtI+apSIgdZMEVXSOwbbM=;
 b=fIAULDF7cS2VXPNYOVzkpJvCZ62aZuyDv4TDf2ZEV/exFmMAMp5rvC8XEvzTix4AuY2hj5usz
 vgmIAa0BTaGBA9fRJtDDFwa+ugQ9eUaV1BYAYQA8flXfAN3X/7zHk31
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89955-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[patchwork.freedesktop.org:url,ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo,qualcomm.com:email,linaro.org:email,linaro.org:dkim,linaro.org:mid]
X-Rspamd-Queue-Id: B7AE853392
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The content of every half of screen is sent out via one interface in
dual-DSI case. The content for every interface is blended by a LM
pair in quad-pipe case, thus a LM pair should not blend any content
that cross the half of screen in this case. Clip plane into pipes per
left and right half screen ROI if topology is quad pipe case.

The clipped rectangle on every half of screen is futher handled by two
pipes if its width exceeds a limit for a single pipe.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/675416/
Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 139 +++++++++++++++++++++---------
 3 files changed, 110 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index debdbbe6160dd..87a934e3801f3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1606,6 +1606,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
 	return 0;
 }
 
+/**
+ * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
+ * @state: Pointer to drm crtc state object
+ */
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
index 94392b9b92454..6eaba5696e8e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
@@ -267,4 +267,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
 
 void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
 
+unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
+
 #endif /* _DPU_CRTC_H_ */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 3c629f4df461d..2637abefe2602 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,50 +881,107 @@ static int dpu_plane_split(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 num_lm;
+	int stage_id, num_stages;
 
 	if (!new_plane_state->visible)
 		return 0;
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
-
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
 
 	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
-			new_plane_state->fb->width, new_plane_state->fb->height,
-			new_plane_state->rotation);
+	/*
+	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
+	 * configs for left and right half screen in case of 4:4:2 topology.
+	 * But we may have 2 rect to split wide plane that exceeds limit with 1
+	 * config for 2:2:1. So need to handle both wide plane splitting, and
+	 * two halves of screen splitting for quad-pipe case. Check dest
+	 * rectangle left/right clipping first, then check wide rectangle
+	 * splitting in every half next.
+	 */
+	num_stages = (num_lm + 1) / 2;
+	/* iterate mixer configs for this plane, to separate left/right with the id */
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		struct drm_rect mixer_rect = {
+			.x1 = stage_id * mode->hdisplay / num_stages,
+			.y1 = 0,
+			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
+			.y2 = mode->vdisplay
+			};
+		int cfg_idx = stage_id * PIPES_PER_STAGE;
+
+		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
+		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
+
+		drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+
+		drm_rect_rotate(&pipe_cfg->src_rect,
+				new_plane_state->fb->width, new_plane_state->fb->height,
+				new_plane_state->rotation);
+
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
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
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
+		pipe_cfg->dst_rect.x1 -= mixer_rect.x1;
+		pipe_cfg->dst_rect.x2 -= mixer_rect.x1;
+
+		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
+				DRM_RECT_ARG(&pipe_cfg->src_rect), DRM_RECT_ARG(&pipe_cfg->dst_rect));
+
+		/* Split wide rect into 2 rect */
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
+			DPU_DEBUG_PLANE(pdpu, "Split wide plane into:"
+					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
+					DRM_RECT_ARG(&pipe_cfg->src_rect),
+					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
+		} else {
+			memset(r_pipe_cfg, 0, sizeof(struct dpu_sw_pipe_cfg));
+		}
 
-	drm_rect_rotate_inv(&pipe_cfg->src_rect,
-			    new_plane_state->fb->width, new_plane_state->fb->height,
-			    new_plane_state->rotation);
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
-		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
-				    new_plane_state->fb->width, new_plane_state->fb->height,
+		drm_rect_rotate_inv(&pipe_cfg->src_rect,
+				    new_plane_state->fb->width,
+				    new_plane_state->fb->height,
 				    new_plane_state->rotation);
 
+		if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
+			drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
+					    new_plane_state->fb->width,
+					    new_plane_state->fb->height,
+					    new_plane_state->rotation);
+	}
+
 	return 0;
 }
 
@@ -998,20 +1055,18 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
 		drm_atomic_get_new_plane_state(state, plane);
 	struct dpu_plane *pdpu = to_dpu_plane(plane);
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
-	struct dpu_sw_pipe *pipe = &pstate->pipe[0];
-	struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
-	struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
-	struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
-	int ret = 0;
 
-	ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
-					  &crtc_state->adjusted_mode,
-					  new_plane_state);
-	if (ret)
-		return ret;
+	struct dpu_sw_pipe *pipe;
+	struct dpu_sw_pipe_cfg *pipe_cfg;
+	int ret = 0, i;
 
-	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
-		ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg,
+	for (i = 0; i < PIPES_PER_PLANE; i++) {
+		pipe = &pstate->pipe[i];
+		pipe_cfg = &pstate->pipe_cfg[i];
+		if (!drm_rect_width(&pipe_cfg->src_rect))
+			continue;
+		DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
+		ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
 						  &crtc_state->adjusted_mode,
 						  new_plane_state);
 		if (ret)

-- 
2.43.0


