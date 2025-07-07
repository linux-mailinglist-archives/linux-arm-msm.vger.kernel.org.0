Return-Path: <linux-arm-msm+bounces-63883-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AEECFAFABB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:20:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9B85F189936D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:19:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B76242797BE;
	Mon,  7 Jul 2025 06:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CvvV/zIU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F572797AB
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869121; cv=none; b=WP5IkOZiuFQpW9TRrPKrxNN0Udh8qlY4i8ydOeJkuj1pJRAl92/wOyRmOjO+C1q/WsxYFVoz95b4XffRL6QJwRyE6A/csosTdkwUY8k9WtNv0yBJaHI9hvZPE1+ktDoYMXAHidzenrdn7cXwhcvwOwubVUJtFYLRJCkINxD3s9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869121; c=relaxed/simple;
	bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JLjIwRBl/XOiUTwL6xJsXm60wspUWixNGnukxL4rfyjQ+Hg9ZitrV55e9dTtGMN+WVXGHrqcaGhkqwItvK+gWnrFKYGMTTvsxpgMn8rnNjeAaaUSdBVKyWwKiTOHV7P2oGNk3qOCVZSjDmilpzNUemdV+V7Rj8AuqDl4Q3H1Q9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CvvV/zIU; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7481600130eso3742672b3a.3
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869119; x=1752473919; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=CvvV/zIUoUV9nZKRguCiqLCyuF70zXxEvx99cDOW59nxA0+0cVcb5VDrkRp8AA6nFn
         l+KxhZ+Dqw1xsLNbRTGljpXQTmGdqz5wHofjeKTDTgi3uaRDp0UmK2xL7/gPFu57oozf
         at9I8JKQdKeavNvzP9KWE8gRlwnDZjUqFjd/oLsZQzgecscJKefrOwYz1rnmbcG5kWy4
         JIt8bf19f36mQx7qrHIL0cjQlFYPU1LboZK5RQG5LaADcU01SVm42EM7CsqzO1vFzIp/
         wmuO5lXk3NO7dmniz9Fj2c/Hz75mLpm0Hizc//iCHL7mSrE6bBBf29rtCXAEC/zZDMHA
         VARg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869119; x=1752473919;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=nweqvGlnk7ia+8KER/dLLbQt9OwEkjGVfEmLoN52BCJuuwtm9dgS1DphQF63puYNox
         lvkUFEKu6wa8M/Zvda9FsbGhvrAlrkNICk1lXD3PhHEaHahdlBxtKwAwQL2YPGRk0C+7
         l9XLgWMvroFmnE3s1x5XcvSwwbUXR82sZyiSkYAGu9fmJ1nUa5CdFY9pBwbIt8gxPj/P
         WULx8BBazf5ZLmRPbwwNH4IYkV9k1a0o0Iy1fjzAXafnYvR+oQqh1CJn+zUo1AdedpBG
         +V6BQ9YZYf/Ctjxzxb1oH0REUsYAiSiPqK6xkPSJiS5YfF2dYH9OjLOJrqlSB19vVX5p
         HCZw==
X-Gm-Message-State: AOJu0YzlN6Fyi/Jwqu0Zx1+YfP6vjnnLz4jW+yjeAdXXRvUTVDjsmvqE
	XUvIMlOFGJm+HlNSpchCuooSphpaL1ZpPkdVnuSti+4asSSlvcD+BohgmPuoE/ys1+w=
X-Gm-Gg: ASbGncu/vJYNrg/f0zXS6eNSnWkmWTQB1FSglYfPNKH2OMS4peY+ORLUvEBaxY/KHFS
	Q/F7/2yo48Ibk8HBMRALLaFFU95+gMucUCClvuQxkm/C+Kue7uhH5lNYoCW7ON1/upp5Hb5Cqx/
	D/6+X17roWsnuQw9nULKSXCuYk/zutrHLwGr697JLann9qEl7p83pZwOky5nV37qsyiG/xuxD/N
	ckBoPdB8LeDpzxsGV4+JddsksQrcisru5mIexXm8zJzHYQBJPPrLxnJWyKN5JmwJnGb8+vNR578
	lOwbZr/Bzdn8WhxBInEwskb5GZ/h3F8/pL8+efsKBAeYdx6w8/T6ygKeaU8=
X-Google-Smtp-Source: AGHT+IHpu+7N095Dkvfv/xXCbcaHF/m5rGZUrD4vjHs5Fv7m1f25d05bGH5t9VgB3jR6lHG9xDeaXQ==
X-Received: by 2002:a05:6a21:339b:b0:215:cf53:c35 with SMTP id adf61e73a8af0-225ba537030mr18417131637.31.1751869119377;
        Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:39 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:00 +0800
Subject: [PATCH v12 05/12] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-5-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=ZP/NQiBXA71l6lBIz06Tal8NsSeCQ9sxKtlwYnwimsk+bkLSNgzf6+x324sO23baWtdXeQVH3
 a5uYD4cLF8LAbzVyjHaQqjivAn3k4gAxzESl5hHfuqkzoUfhg5MWUMI
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
index 9a40492e5aa961f7180ba4ac6c86e06fcccef8c2..cd0ec3edfe2fa8132e114bc1544c389141d1c1ec 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -419,7 +419,7 @@ static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
 
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


