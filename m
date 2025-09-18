Return-Path: <linux-arm-msm+bounces-74081-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C39CB84D42
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:30:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 10D56545F00
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:30:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCEE230C61E;
	Thu, 18 Sep 2025 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DSI+J0vT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E01230C368
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202172; cv=none; b=WYMVdqZCvoUxF4XMeZebszrMZXWNHwDog399ZJQsP7TmG7o4bIrr1LKAf6yh66cwHq+y+3YTlBpOPCn2opJ+f1gEBdkqCNar9pXfDvoAHHRaUxKqOusbue2/nive29I7dp7EK9F8GaCvAM4I5/GuzpeTR5eSZlOz9WF0J5c88io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202172; c=relaxed/simple;
	bh=ipv+iK4CzMgH9qiPSwbsVlKVNkLoDzm+o7+o/w5Dg/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aP++pLWFv8zgAIgHlj+FbPysk2m3bfpYQYXABpAiu1F4xSOewD7NSbSaOfSABC5MVzW/lVvrvtR+5+v8zQQAzQ5VrYLIYJWVjFvRiMFJQr/mxHPRfyvm9Hbb0xonK4I44TS6YeQV926FEMCp+fa+V4Wlem+KyNXPto1G7TrZqiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DSI+J0vT; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-77d64726e47so530593b3a.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202170; x=1758806970; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=28syEWEQ+04nV2yrVvLwGhGtOEbRtKV5q4Tvc20tktk=;
        b=DSI+J0vT37gfnb618i0s4wU0DsbvmHpnrdqd9qn5Iv0oUjm96WmdWBODEJY3iTtzjm
         KLE4WmuDQzvNxAmAM63aCDw5wb+21YEUFTFPiAWGI8CNBCDli/9JLNdVuOw1Zrg3rqtf
         KC3YP4fU1D68A2E5C/8x+uEz4Cx7EAZ3sDpPvJNG506P7+BKXrjeMwv8i2/918nKJ14i
         7krWTm1zAffXMAa3l3QMdLPMFLGqtognvDBdO8fyBu1fjXTuOEt21S4mzrnka0q6CVh2
         Mv95fVgNkt+kHuGrkxruWQX3Aw/6v+dRNtq0vSW5aCLk9cRvpDAQwEYCeADMbF2GBSVB
         NA3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202170; x=1758806970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28syEWEQ+04nV2yrVvLwGhGtOEbRtKV5q4Tvc20tktk=;
        b=upaL+4gYsSm3YaE02QqdcVHiroOAC7Fq8AsXUDsFHixzZ2GIvTeTJ/7b+m50eUSmgG
         YENVJSily28ANf2DzLzjlbqA+CMSDNW03XU+Qwn0HO+04U2durOEdW2eXzcUwzWoDDV4
         1h3Rj+Ux8qngBNZiHojzIIM3WQFd4+DVwwYYgXrvV70Dui6F6bOHRMaSuYdguAAjLLKW
         POK5Iyn02Ltzxz+qamouhx4BxNUETIuAFkW1m2PQslirQXj4+7taHDjqOmdFJZmL6xZo
         R7zHowtSv5ZvF5lIgap39mhUmVKSUt+1MXe79I6bP+ma/KPATSbQ6W0O3mRiHNTj5QPJ
         CEIg==
X-Gm-Message-State: AOJu0YzTBUVq4FFuc24DMMHVx9pKIHZjtOIsruIMINDOnddyDNBkwVeE
	7XxbM+O7jqokZI6r+wyVJ4+/gQPnoVIP95j1RdhUyBJYD87GD8dMOAGMy5NyBlHZyGY=
X-Gm-Gg: ASbGncu0f0QCH8aRbgG3icrbdRGoVeOMo3EfF9feSH1UqkB5Gs5UaLyhfVl/vEvdTzs
	s+qZaD3a1M1Z+BGaSqJH0tThsRvit8q6Es0wMERJrlD3sGT5P16RDYmGQhJ81gYAavzpxuZsCY2
	Ijt90rk6pm1z/TXJLDVSZVUL8hlYbJ8JbD/4F6XxiSFuwoIUl3hpIVlZxx3QqG1sn8EauDczVdI
	stkDEvn/Ops/GAnff77AdlR2RbNmQXmYmFeTZhkt5f6aV1m8XQAUvdgg25CvFvXMwevU6vBfThf
	7MBNVkkdk7l6a6X8iszZzPg69MxIETx8KoOHGqHBCSUhJ+XWfbe4f1kH9w/wMLGXOEEhg3JJ6J1
	8Hodu+GpisHYOyf13suETTzTNu1ESaP2ikC4=
X-Google-Smtp-Source: AGHT+IEr67DRNgZ3DE6KFICzJIbFlfGSdHc/Slw8f1MzR5KK9YO+06RKpTdDXaS5rz2YkS8dCzoV5A==
X-Received: by 2002:a05:6a20:6a13:b0:263:616e:b62a with SMTP id adf61e73a8af0-27a9732f05fmr8819522637.13.1758202170544;
        Thu, 18 Sep 2025 06:29:30 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:30 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 18 Sep 2025 21:28:55 +0800
Subject: [PATCH v16 03/10] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-3-ff6232e3472f@linaro.org>
References: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
In-Reply-To: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ipv+iK4CzMgH9qiPSwbsVlKVNkLoDzm+o7+o/w5Dg/Y=;
 b=nGkZEsPuH8Lcqdbcyo3WUX02k6h40bejotuX9hh7cObt3eAMkDs7DBu+XJbKtHUY2NWARmVAV
 WkGJHeaHRdJCFi9aCUcGlq2YEcndSGDXOL91Hy5GbLfmOn27tV5+gv2
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
index 4b970a59deafdae3eb964da912e7f1f1d181eec7..f47e961de51265941820bb8d1081eed925b286fd 100644
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


