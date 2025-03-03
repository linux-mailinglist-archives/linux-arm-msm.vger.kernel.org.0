Return-Path: <linux-arm-msm+bounces-50022-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 00CA8A4C4B6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:18:56 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42BB81897955
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:18:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5C3A72144B7;
	Mon,  3 Mar 2025 15:15:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mrOHFsWu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14FF21CC74
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:15:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014953; cv=none; b=BNITrAyfgqdYEXxPJCPmXF/ZAkxj9n7vo5ItpWWQBdkisOJTqxI1s/BOrOw2+TW+KN/25cMMsJbTq8BOUTzdx3/vbRjRfL2BPFRfeYttYfMnBmiKr656i+MH0d5DZpFotHZJLvqNP6zRvCX6NMvWQsJCtxEy8yMS0WsJove8o/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014953; c=relaxed/simple;
	bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=avIAC5ZTD6Cc+56WUci+q5SR8HfEJXs40Yspue9Q5kYWHBbauZIXkvtGLprxp/+90fe+FBxGPm8aPt4xDtcYp8p7+MUQp8aB6KssjIeCVOeqU1LQ40H5UjrdVfkSa0yspLias5xlv9hYvmAMyO+7cGcBgJM9vr7WmXNl0d27NM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mrOHFsWu; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2234bec7192so66482305ad.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:15:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014951; x=1741619751; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=mrOHFsWueKXVwYJNFaUIQxaaHG8V9FFv4RGX+O/fiA7PLM8rq6z0sXI65VlNEAeL35
         +3Hh5tavVM1W6OYswkdcoDYQdp4KN+bTr8rGSD67rnk1GLIuvzZd8vnIxxPxn51VDTv2
         c+aHRNoipQySlJNhgRQZfY6aaH/KPnbqsMDwKPQeCl3pzxdzmMUh9lLIzvjLI7G1BvyC
         njMmIObFaGZWsZNtSJR378Wn0aQr+Vnf+lWh+gGIKBQAPO0HIEnF/Z6gidin5e1bnLaF
         Ua7qImu3AU5QDiv363KX1Xf9OdMCmIPK9z85upOwSxfkASz8m+5l29ohfvplogoJG2gT
         4uEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014951; x=1741619751;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=HXOXOLJ6bpvmIywMTZLo6Zy4a6H7iUeJ6JmyKvdgZWufeowICTWNK/hl940T49Ia4+
         sgjjG3yRYBLdHZrJmxUp4Oh/hw63sa7QWj+8coiKVnYL3PZb5pNrNd9UjEEWoQpspgi3
         yeczkzV0D4Hz5/FRZuaQ/3LLFTtNw6Rd+6XBNoNpgTVnO36do5eE88ubLM8nAIRiT+Qi
         w2gHcV6+mkl74LiBiStejAtQRuWF+lm888ybzI8D3BXsaVl8pNpavNp3H+tTOrYkG5d7
         UeipIzxzGdH12gCmGQAN9BjEvTNOgln/L+OQyB5a0xQp9a96/ZDmqjpzNAyS9x7Od0q/
         PgtA==
X-Gm-Message-State: AOJu0Ywqw2vrWMRr1baH/yAaGM+hMVE8SjAi6uu9EbBCv5XxOeBqGXhu
	CXa2TADp7zn3U/+xarit1CNGPG1HzZUnlhfwz25h2N2SyCXDpggKVgajhGSOUuklSUXk1gMDIib
	Hq6zirg==
X-Gm-Gg: ASbGncs0LSqVDLMZsR3ZdYwpwh1+RqInVI1m0fYFb50owkLUL2myh7M2gB7F9VA3+0O
	qN3AE3D4T3Gc6F3T3nhcgZteg+SPkaUcb+4x0H2kNwFrVEeELt4DrGaRcQqisLmz9UhdDtVukVw
	EOos5jdvmC5Fbg7EQC3J6e8uf95nbSam/nH1Ewz4AxojvZmbua93DyZRkr65J4ML21T06OR2S8L
	glrN2c5ZrBZBIQIyee6QtqJfrLKWwp/qV6mUnT/ZTKBYF74b57TeQ02wK1BCkN8irtkKOha+WWi
	k3qKf6VAwk1RGy6I9PAQkAXKn1qN4ATGkv/89WDvGw==
X-Google-Smtp-Source: AGHT+IHBMkeJ/K/xmZ0r+6e1iC6/N1q8Tpd5ZgTdrqZ75hZ98XnPHX+o0gzUBYeec6SHcEus8rnwfA==
X-Received: by 2002:a05:6a00:139c:b0:736:5e6f:295b with SMTP id d2e1a72fcca58-7365e6f2a10mr4343635b3a.12.1741014951078;
        Mon, 03 Mar 2025 07:15:51 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:15:50 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:38 +0800
Subject: [PATCH v8 09/15] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-9-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=tEkg4RUT7oIGfsE4cuD/GwxCmFq8r/pBRQl9NiRcBh8QSHfXdU+84EoL4yepFYoNSj4QpB8Dh
 i4x5sqCQIuNBKjB1Q4RTZE+R5Y4emQpw31G4+A4LPEc+J5kUhrVA0gI
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


