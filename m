Return-Path: <linux-arm-msm+bounces-49504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B88D4A45F4B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 193FF174BC1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:34:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DE2121D003;
	Wed, 26 Feb 2025 12:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FZXnGJ+1"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B76BB21B192
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573205; cv=none; b=f7YXKYscY2NmupeDJUZpPeBpHCnH94zfkGIH/xxmd8oI/ny/cvyPKXNY4U1Se2w+q/x99G1Q6zE3THUsRZ6ca3wMs7OOM+SljHDyuvBqOftRWVCwrK147OIU5dDoBCQtgBydhjGe2Ag8nryuMaiufyscLRoSAs7YL5pLQCgMP3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573205; c=relaxed/simple;
	bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n+t5Yrjg7trniAyiU7NxNZ3xLuFW9dhWw2CZCGw5+/Z0OnWfxzB19r9ZS65Dwz6OX2RhYGZCe2+gtPF6k1rU2h/pttNzg7ZvkF5dOp/toWbjobpbm5XdxGtHLVvzBXCMk3tLu6OELU53h8XtAjtN7ieqPzxApwAcsKHe9EBVTNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FZXnGJ+1; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2fbffe0254fso13428521a91.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:33:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573203; x=1741178003; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=FZXnGJ+1+xLEKQ3YWmKbsla/os5hvaTTaWbPf+HDKsTSw/Vg/a/6I6hL1Ma5oXelB/
         ePpv0Tl6DuLuibQq5qgZ87xFrj4hda/mZVF1rHSB9w+Q1MSgqxbpkCUXha0NNa+LVL5U
         LZn2p25vbeM6Z9K/b6ILFSUWCfcAid/jEuNEfNCW9dUc19NXIhhGS6b1iKLn0plyKnjN
         wayzOjz5zpgBNKItRtc+7hJaDUR/6IfrKOYfi+iyS5SvfDcQHtoQWcZ1qVqhWmNuh43J
         jUgk1uEJcAfGNFVDbpQIcvpdvsIaTyJ/N+vnYMBv8p7R9O8gEVGato1mMjbS8xSc1P85
         Trqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573203; x=1741178003;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=EafA3oulVPSOX+PW+plEdt2WAPzFmXBX1DY6s08o2eoEuGeVFGzXU+g217hoDGOJIy
         k5ys6R/ks0spUlqClJu4WgGJQmPtKnEGeVxGiquFrOw7LDb+xRo1zCnCXgXVnuDz0jCz
         ntT5umhAW6JLBHEgGyIp+qvVC9CO6RxWwjhV0jWBIhChm51KQoCrHab75gGzU/mmwiiD
         OiZsXcJwuKuGmxgp2E/qsS+rI5EUAx2B0/w22ryt12+D0RvxN58A9zN/kilYn7p/4IE5
         vwUhpvxdXVmPp0165uNwcHIS7wGev6gagkknoLeACvhs5NdgOUuoTSukAzEZvQrm+/mg
         gzeg==
X-Gm-Message-State: AOJu0Yz+vPmh6bDErIG0SmP8PZIRUlYHXVQZ07ae918XN9IZG3tbGH2j
	Mk32g6qmbLlrzH9Z3K0VJ57M5D02i5xFAs1D/iPGSB0/jokuzisRcME7YiOaO4mOTR5oV24z81y
	vVtPzOwzO
X-Gm-Gg: ASbGncv38gE39MLv0yx3s1DIwnEftlGWYCi45GbV3FtWUVoSRXG78VM/uIZ0ree+x/w
	tKnerMzlxrLO6ouZM5IrgwLuUNqb+7ZmNFkZwrAY2VxcmhQ97UxtPcWn0bRZtj5xPbUftPh7EG+
	qAfCimhteU1wR+NDe/YF2YvyymRkwO/2gCGjXl275LkyH45GMnzcpF3omFk4b/GG32heBtsyU5M
	qydgZt+Bg7fbYy/7QhGe032LM+0jdQmEH50bqWPuy7BkvOVJVY6UHG224ZXrm7LHv6/sOsrSrCh
	bhgoJo8A8U2DppOGpXOZVyU=
X-Google-Smtp-Source: AGHT+IHsRWCrq2DiG2E4HZHRAkbTAVuZlq04N9UMt8g8DJ5VwjH+rWpXJAvGnGGD9rx1X5GMyzEL8w==
X-Received: by 2002:a17:90b:5448:b0:2f4:432d:250d with SMTP id 98e67ed59e1d1-2fe7e32cf33mr4933980a91.21.1740573202921;
        Wed, 26 Feb 2025 04:33:22 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:33:22 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 26 Feb 2025 20:30:58 +0800
Subject: [PATCH v7 09/15] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-9-8d5f5f426eb2@linaro.org>
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
In-Reply-To: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=RCEoNk4L9l3LKa0iix2tyvH/toWrQAEbeknDx1LS/JCWX4A1NI74brWuzlp5oH8dGTkQokopm
 kdpAmyj+JE/BPlFbByYzFch1XJFHBCwR8Mq+6wB7t+1Z/M84ncvPMVc
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c0c74ac9007a1ea6dcdde0b05f97..05abe2d05d8d81fbaac58cf0b298abb8d2164735 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -411,7 +411,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
 	trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
 				   state, to_dpu_plane_state(state), stage_idx,
-				   format->pixel_format,
+				   format->pixel_format, pipe,
 				   modifier);
 
 	DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d multirect_idx %d\n",
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
index 5307cbc2007c5044c5b897c53b44a8e356f1ad0f..cb24ad2a6d8d386bbc97b173854c410220725a0d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
@@ -651,9 +651,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 	TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
 		 struct drm_plane_state *state, struct dpu_plane_state *pstate,
 		 uint32_t stage_idx, uint32_t pixel_format,
-		 uint64_t modifier),
+		 struct dpu_sw_pipe *pipe, uint64_t modifier),
 	TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
-		pixel_format, modifier),
+		pixel_format, pipe, modifier),
 	TP_STRUCT__entry(
 		__field(	uint32_t,		crtc_id		)
 		__field(	uint32_t,		plane_id	)
@@ -676,9 +676,9 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
 		__entry->dst_rect = drm_plane_state_dest(state);
 		__entry->stage_idx = stage_idx;
 		__entry->stage = pstate->stage;
-		__entry->sspp = pstate->pipe.sspp->idx;
-		__entry->multirect_idx = pstate->pipe.multirect_index;
-		__entry->multirect_mode = pstate->pipe.multirect_mode;
+		__entry->sspp = pipe->sspp->idx;
+		__entry->multirect_idx = pipe->multirect_index;
+		__entry->multirect_mode = pipe->multirect_mode;
 		__entry->pixel_format = pixel_format;
 		__entry->modifier = modifier;
 	),

-- 
2.34.1


