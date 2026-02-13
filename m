Return-Path: <linux-arm-msm+bounces-92802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uDZaFjY8j2mtNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92802-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:59:02 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B8DEA1375D5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:59:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A7C3430AA234
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:55:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BFB35B137;
	Fri, 13 Feb 2026 14:55:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Qy6NmRH/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7139E34A3B1
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:55:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994508; cv=none; b=WoQTycnhVC8YWsjrIvl+Bqwigc/4kGvKxbV0oAQg0+wo2JlGYqvxNWBnyclWvX7xj7meXOAczmgPG8Jw5s1lxNCRvD5YQfRifvXbzltSSykl+Wedh9UvmJwK2yoS5TfC8Tgw5TRFqwx9zWmj1nMUKx9deQeGtYiypES4tZEDr5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994508; c=relaxed/simple;
	bh=fweWEpFUPkhuB8qLiuep4kjFOtkQyJ3oObfCoqQhEMU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pfxvKv9Zy8fMn8uIIWRLh5ycE5nwZRgCXyJBixPnzd6oc5pu7APzfpIKzBl11fV6fgIlDQLM+h+OlhAAREl2EmjqCVmuIbO4JYSRYQ2VZxYOWMnp9gI2u6dXf6eDd6Byuz8noVNAGXeGULTJyzhl9Ohl/y1MfewZnYUOX/0qU4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Qy6NmRH/; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3562212b427so452381a91.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:55:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770994507; x=1771599307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jM+w16/anmUB0pC2Px2OhGFGUrAHdOSuoeL7qzqg9Ms=;
        b=Qy6NmRH/Ij465rVuEx/bJdpHAcDgwK1va4Z7eUIEk+Yq7Pjm0u0Nzz2Ed/4tzyAY6c
         tu9opS348GYKKP5Wf/+9cKVMpNT8qXAzBxdJNoIZBokiYuGBtw3sSc9sSiUpQO5zOLym
         SGBoHh7/dKaDVomZK1ohLoMxts4XBhjsIdxiRDZB+OkU6HhWBXwIzGonLZ02S/ONhyHi
         hapefd391kDWbKRwkZaZgFieu8vyhbZ55rGABjdKLeUSc0Wj3+4erJKuY0oOqvSbNVWy
         GSjpx7WJ0xWxIlHX7YDd+pDbLFKtTPwLj3Z71s7lPLosfWcJ+pzkt/RJDE8HrkBmvBO+
         m4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994507; x=1771599307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jM+w16/anmUB0pC2Px2OhGFGUrAHdOSuoeL7qzqg9Ms=;
        b=NYFj8cMsJxs9Q85Byxd0iPqdeIAiRCzEBipkP6F6jMQYgGrKOUazv54ioIn9K/2kA+
         gERevGnoZHka5DXjy//N03+yX3oMNgN8TTjR08yWN9oFEepuGC8MN+BJUZkxJhYiSqAl
         mTrtHFTZnjSxbDpiZmzXZygw54zm+w0smR/3AApa/OqXN8G7wZa2scAQwWEO/CA8xlPe
         omgOWWGWIVKMBkGwVq2QsmqExm96MiZSviHLCZHCCd8whF7ypPbdSRbdVEfJ9ZhRfcrU
         QeUuavu4CNhe9i+nqZSzKDY7t+U0Sv37HdIdaUelWRJucgA1bXuMOlgtiOnBT6YP/Te3
         oAnQ==
X-Gm-Message-State: AOJu0YzeXaLHS7SCecjvS+iRLWDwEFSkS04+6LaKWaNsBsHWHWv2r3zk
	h5hnIJ5CEJZ3XaatumDS6yxXOtilMjmeYziRyD0hUCNrUk1wWl/P2HM2nQmB/Nsszsc=
X-Gm-Gg: AZuq6aLNAqFx50EA6J1093DryjL0TaWscq5J6hUbont+1ryBtN1wA7jFOhkGrMvUZ3G
	7J5+/dyUI5phLpxkegEAwZJ2MyFkESNl0IOWfCwYOVkQYBQjs+L/r/DtleLnAMLcONgYB0A6QaX
	aI+IIqjzQsVDdDxQ0eWh/HT0fZJuyfxj9HH0B9+D4gpaaj5DROrNHrtzj/eyCNl1jWZQf9v9ntc
	rD0ncrkqh3xDkU3mYp2ArZXu7yLoI0zNhHvK5UgVKt3H4/6IWXPvMg7mUcOcGEbvE7yqcY1ZShc
	BmAB3bUBBAjsjBbhxQZNYWj1cMXaXToVlYMEEXZ9c2tmMNFjtWEJ0+OOkoyvI9mgRStsHtmPRkt
	QMX+1uZexlABQ0sFYIsaEIM+GvBJ3TGiDWWXukW8csVYCbZdYzB+CbGKkJnBBfX+zexDeTRWlIk
	Bet3znG7bPoWBx6RbHDNNgj9+pAG+Ckg7TzZ8TLhp/Bb52qvucRyrd62TY
X-Received: by 2002:a17:90b:2c8d:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-356aabcc347mr1678667a91.9.1770994506463;
        Fri, 13 Feb 2026 06:55:06 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net. [210.61.187.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:55:06 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 13 Feb 2026 22:54:27 +0800
Subject: [PATCH v18 3/4] drm/msm/dpu: support plane splitting in quad-pipe
 case
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260213-msm-next-quad-pipe-split-v18-3-5815158d3635@linaro.org>
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
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=9909;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fweWEpFUPkhuB8qLiuep4kjFOtkQyJ3oObfCoqQhEMU=;
 b=CB3ePUFFE20hwEjVr8jJyneuLYg/R/gfHgfVMQnxibx0lGKZq+gcDwTibdlJ8rXZui0IGswq6
 GmSW0tVfgZ7AyUriYsMAr99SiPnsacigGLIH04IZ0T2RSB+K5S2mxTM
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92802-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,patchwork.freedesktop.org:url,qualcomm.com:email,linaro.org:mid,linaro.org:dkim,linaro.org:email]
X-Rspamd-Queue-Id: B8DEA1375D5
X-Rspamd-Action: no action

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
index 797296b14264e..0bbe6c38b771a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -1656,6 +1656,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
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
index be1a7fcf11b81..c528bf924d515 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -881,50 +881,114 @@ static int dpu_plane_split(struct drm_plane *plane,
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
 
@@ -998,20 +1062,18 @@ static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
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


