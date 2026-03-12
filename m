Return-Path: <linux-arm-msm+bounces-97165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cPbREuV5sml/MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97165-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:31:33 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BEE026EF8F
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:31:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 2A33330E9AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F20F434EEED;
	Thu, 12 Mar 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VHNszzxe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96432C937
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304130; cv=none; b=gL3QNGhpgEc5F7+ksd1+lLfVZ+MbwgL1/314DHvH7OdmXz/Jlbw0q6lXySMFyh4MSP92S8bX7jjphVMTfKPm1KWfov9g/s1nD2RUhnBBby3Pcei9YXOGjSl0hdEIrwo8Xz2iEanri8FC+U0enJpiezEfNeXXDRzr8g6GtM2uhng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304130; c=relaxed/simple;
	bh=mLiQ8kq+Hoe6yZbmNWCYHtVl5NbNfCazswthJQplHr8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=EcHZwRZrehIRxuM5/takAiab5KdUauGfcme88Ca7DQkrL7P+HUszbP5GFCLLMeZbOe/eFoquDaUfKmCruSrG9FkdVLb0INc98zLjIZSZs+McXUzQB2dLPA67LE5/mfZ1uufqojOzeBnbs3s3NEtPNvHg8B6XI75ApBd0YB0AxKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VHNszzxe; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b9cf8cb5so833043f8f.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773304128; x=1773908928; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gSlDLHNlq6yl671wwnnD9Z5eWz9U89VKuVstCERaaBI=;
        b=VHNszzxeY/kQ1IOlq99kU4kV/h6dWZYvRUCDPUb5P1nLg2/4WF3xH9ik+9IjMxoEag
         cjc08eVzVmoDAx6lSChDB4a9L20XnmnqQVEt1USmAwd823heZgJOdk0saGEZ8VAQSdBV
         Bz7dFxFEUKx8sHJfSuddoBveoS1QAIEY0eFwxlQtQcJkgIICBgjCBbYUNf8jDcPZgvma
         ihL1GZJIATBr5BdO66seTlUWyKL1b9dnbuDUZYnNK2tNNZPY3achvtVXY/rcRY3gtJu8
         z+UtQHm9ObZcQk+Qf1jh2kLvPacdMMoejjI/gtxVtByQMZpjvb0XDB6NbMTHyaJ4k5LU
         CRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304128; x=1773908928;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gSlDLHNlq6yl671wwnnD9Z5eWz9U89VKuVstCERaaBI=;
        b=HMn7nZLM28VtxupZ1v0AoDkTPkJkk03JWMJaHUr9u/dbhVjGOfaXhkEVGTTPQzje0k
         uA/6uZ35Rx03hr8xHi8qCf0EIVKtymmkbgbkojXINfT+j1n+ZhsuPAfUmbtD5zo50OHz
         TolXkzl9JnU4L/gJbi2HBjbMiY33xDj3L7jJSnDVRgI2agE+xeCky98RmZMDvX0ykuLk
         yp4odl14YEnUFpo1nTDuOqnKEW8v8gzb4H9XSUvN5GE4nwYcmPbsguj1GbfzSBs2vwYN
         UwT0fWtJ1mxvqfguPLB282z2zMDIW3TCO+iUVAZh99UZaq37SebxBuExgFVl2UT8Cn5t
         xEUA==
X-Gm-Message-State: AOJu0Yzs8nBeVqSW37Hb71BnMEOzUVwH96uuVa8GVd2qQ1P+7T/1zHlb
	jN8YPjW0/X4AK9XTJh7j/V9hJRg7NJKKLYmXuI4oMiGjoV5DbTzfSuyx3WH6xxNPulo=
X-Gm-Gg: ATEYQzwmofxKNfyjvreBVao8NFh4W63+YK/ERLMLhc/547l/WrmrEDkgqUuEkca5Q7p
	7MeJGSqOc5kwudYA4HGeVa/F/l7FcnI2MWOx66qFKlksjKKiUaTP5L0vo7QRkmjqVR3ZyWnZ1e5
	cSsFIZZ2C4+SuyFFjajiFCzRa6aRUURp9eGhZiu+eBzXTKOKiQSVugZ+CWQCJrX27xA9pJsKekN
	CGYvwp9P9ciAH7exyWXChFbAdIVTXouve1aahNhViYt9JuArHdzEGHW9vrZ3U6/xoi6EQ7R526J
	FkJ+ZEZuwknyy6vwVgNSQ2mEqgtg8thJ0GdA83yL7N/ySN9YdSR6wfeUQIvSX5JO54xpaeaullq
	mcUgKdVCGlqubfb0OK47MXVut0uaiOQ/JGQakn6cSuRWQk5z+zB3MiyBqCKNz0HJ8l77KS4yJhf
	LfGQY=
X-Received: by 2002:a05:6000:1845:b0:439:bddb:cc77 with SMTP id ffacd0b85a97d-439f8206d14mr10016371f8f.37.1773304127586;
        Thu, 12 Mar 2026 01:28:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a04:6f00:1::ee:b:1015])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm6273780f8f.29.2026.03.12.01.28.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:28:47 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 12 Mar 2026 16:28:12 +0800
Subject: [PATCH v19 3/4] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-msm-next-quad-pipe-split-v19-3-4ffa2b06c996@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304094; l=9858;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=mLiQ8kq+Hoe6yZbmNWCYHtVl5NbNfCazswthJQplHr8=;
 b=nlNdoeoKyEe5V55uxhNPCqhFMeJERNVARzQlQpo4M6Jgn4L5oaCo6VwfPLjpw3tDo50O1rmuh
 StSTJ5qIrSIDS9J0uOcGAEIR8Bq0oignOMG8oMd3fJtRYKExLivcZi0
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97165-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:dkim,linaro.org:email,linaro.org:mid,qualcomm.com:email,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 5BEE026EF8F
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

The content of every half of screen is sent out via one interface in
dual-DSI case. The content for every interface is blended by a LM
pair in quad-pipe case, thus a LM pair should not blend any content
that cross the half of screen in this case. Clip plane into pipes per
left and right half screen ROI if topology is quad pipe case.
The clipped rectangle on every half of screen is futher handled by two
pipes if its width exceeds a limit for a single pipe.

For non-virtual-plane case, there is always one stage config to serve
a LM or LM pair. So the clipping does not occur when interating stages
in this case. The plane is mapped to 2 pipes only when width or clock
rate exceeds hardware constrain within stage check.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Patchwork: https://patchwork.freedesktop.org/patch/675416/
Link: https://lore.kernel.org/r/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-9-ff6232e3472f@linaro.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  11 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 146 +++++++++++++++++++++---------
 3 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index e97456d4fbb8c..321fe13ee4eb0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1670,6 +1670,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
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
index 70992a4401d69..5d83ff689de7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,47 +881,111 @@ static int dpu_plane_split(struct drm_plane *plane,
 	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
 	struct dpu_sw_pipe_cfg *pipe_cfg;
 	struct dpu_sw_pipe_cfg *r_pipe_cfg;
+	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
 	uint32_t max_linewidth;
+	u32 num_lm;
+	int stage_id, num_stages;
 
-	/* move the assignment here, to ease handling to another pairs later */
-	pipe_cfg = &pstate->pipe_cfg[0];
-	r_pipe_cfg = &pstate->pipe_cfg[1];
-	/* state->src is 16.16, src_rect is not */
-	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
+	max_linewidth = pdpu->catalog->caps->max_linewidth;
 
-	pipe_cfg->dst_rect = new_plane_state->dst;
+	/* In non-virtual plane case, one mixer pair is always needed. */
+	num_lm = dpu_crtc_get_num_lm(crtc_state);
+	if (dpu_use_virtual_planes)
+		num_stages = (num_lm + 1) / 2;
+	else
+		num_stages = 1;
 
-	max_linewidth = pdpu->catalog->caps->max_linewidth;
+	/*
+	 * For wide plane that exceeds SSPP rectangle constrain, it needed to
+	 * be split and mapped to 2 rectangles with 1 config for 2:2:1.
+	 * For 2 interfaces cases, such as dual DSI, 2:2:2 topology is needed.
+	 * If the width or clock exceeds hardware limitation in every half of
+	 * screen, 4:4:2 topology is needed and virtual plane feature should
+	 * be enabled to map plane to more than 1 SSPP. 2 stage configs are
+	 * needed to serve 2 mixer pairs in this 4:4:2 case. So both left/right
+	 * half of plane splitting, and splitting within the half of screen is
+	 * needed in quad-pipe case. Check dest rectangle left/right clipping
+	 * and iterate mixer configs for this plane first, then check wide
+	 * rectangle splitting in every half next.
+	 */
+	for (stage_id = 0; stage_id < num_stages; stage_id++) {
+		struct drm_rect mixer_rect = {
+			.x1 = stage_id * mode->hdisplay / num_stages,
+			.y1 = 0,
+			.x2 = (stage_id + 1) * mode->hdisplay / num_stages,
+			.y2 = mode->vdisplay
+			};
+		int cfg_idx = stage_id * PIPES_PER_STAGE;
 
-	drm_rect_rotate(&pipe_cfg->src_rect,
-			new_plane_state->fb->width, new_plane_state->fb->height,
-			new_plane_state->rotation);
+		pipe_cfg = &pstate->pipe_cfg[cfg_idx];
+		r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
 
-	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
-	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
-		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
-			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
-					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
-			return -E2BIG;
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
+
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
 
@@ -995,20 +1059,18 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
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


