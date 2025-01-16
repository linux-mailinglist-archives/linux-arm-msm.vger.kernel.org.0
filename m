Return-Path: <linux-arm-msm+bounces-45203-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9EECA133D9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:28:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 478F63A21BE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:28:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4307919CC39;
	Thu, 16 Jan 2025 07:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="r9D+3F6E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9938D1B3955
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:27:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012425; cv=none; b=KOONxkgE4H03Vm2+XT743E0xapvBwb+bRhmxJAP0QF94kkE8s/VaHInBs/k2olisNg+faIH5fB23GDrDagBMFi89JBK96oIgJ7DxQ5meBCKtepPSX0aC41DbhbfmV05UBt019vWER6v0aqFGIxDIVLAkOSpkK4jYNtSR/3J4FUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012425; c=relaxed/simple;
	bh=YkPGu9nozT3vAqexZbO9/ANJwzFKO7zuAWrFHDipIGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TbKbSS/zEbZJf0P8zRNU7wD3H/fXTW2L/b6c36To1uajLV6QhezVHRgTXnz3i8DRxVn1iEjsHtOrOmkXXZbcDwisieSxFwIellusxlR6uIB2zZVwha8AHbyJX5OLLDV44A68rfNzJRezcyfS6Pjkv7l4U5QKe62SJI18YeFpd8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=r9D+3F6E; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163bd70069so10480775ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012423; x=1737617223; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HYLeiZyIOvA21Dgt9YqH8OCYcim7YKyut+u6v2ZNUc=;
        b=r9D+3F6EMtLQ7waN+hcEvkqvhUE6EdQAWkuqCTca62gzivfoJe5aosWJ7AOePFWyfz
         bzpBVw+plTBbIDfoyXgEBMAKzgFJxhBFHGQ4ez56LyFO3dComCuBWOIWpckJ7zQLn5x1
         EtgEeCKTDvWMdhCo8y0H/sJrxmxLK50KuOLAGpuk4ln1o/YRd7jyQJAVWSj0BxsaMLPP
         9YcHrVrSi6hFUY2pTPPwjUPfvGabEsz2RQSGaX7lTqiPLInPJgmLHDhfZiXBEQJLdDm/
         OGsYu5JsZKTt44tsjXgr2LiCemSBORXMGluh93MH5e5xzbYK57mG5mYNj6103JrurrWx
         u8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012423; x=1737617223;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1HYLeiZyIOvA21Dgt9YqH8OCYcim7YKyut+u6v2ZNUc=;
        b=CK4k+DxDKdqHawgUW/Yh9HAlnsvV2ijHEnNaxMJMG4NdLnCp7HRCNjJFFnhqnt6xHn
         +XmEFbsUl/lD3NGwotXkHDrydazwuDEYfuT8lDr+QyON1WoIsM50NnwpwXqaSG1JPUxO
         Hf3460W+qaT+iYtC64ki2sSYtoBqeiq6khxR5UQUEeZtufgAwodNxA+4V/z60rG23i5w
         gIRSje4D6agtbkjpIbuKSdOUY2fVX0PZQ1B5z2HYfpRe3NQbooP2N8HEz2imXGlcov1x
         /0qTgvMjUtUSvvZtyouI3NxS6Q95QmqyQvfmtxsOAfnJNivxH7YfHkz250PVszDtTpVu
         MzOg==
X-Gm-Message-State: AOJu0YyCQNL2aCmCp8mPzGZNgA34mwJjvKEFzZMp59lZPgHN8E/HXqnJ
	OY8Sb77jQrIosOMBZgOn2A6H2P6Bc7ZGt0pP7A1WhSdVCw7Q4kkGjb+1rkWR52s=
X-Gm-Gg: ASbGncsxvsBgmnp2Vu5GUY4s5p5HCRyVo4XEyUn0bETN+jWvVjBP8QRhF2nThR1R033
	D2Fz1xo0crceoe86NxYAjV6WGXzjyw2BJzgXMtDnqwwQsYfcFgPJssNzILXoEcqJK/y8MMZfoES
	4zSIztanj9GRU8nTREBZFI3PnX4XWkByGeTPa7CrrvFThVNJTOB85wGbHPS4TvMotLMvS8+uw8/
	InnvZ1J1HEMgWGIA2Jjvgyf4J6vns93zvXB2VEeX+19EMs8O9H59w==
X-Google-Smtp-Source: AGHT+IFMlqohE+m+oB2xKB2qyt7+cZY18igkkgu1BKdnZzBDVn/mcglu8dUjGlFiuAFhzV2EFU9N3Q==
X-Received: by 2002:a05:6a00:2e8f:b0:727:3cd0:122f with SMTP id d2e1a72fcca58-72d21f62d51mr41568525b3a.9.1737012422904;
        Wed, 15 Jan 2025 23:27:02 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:27:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:58 +0800
Subject: [PATCH v4 09/16] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-9-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=2262;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=YkPGu9nozT3vAqexZbO9/ANJwzFKO7zuAWrFHDipIGc=;
 b=oPBsKlFEkzdUaf+A8gqoC80xWLR2JyXkDOfTow5etF4pnPb7ua0+DzufxgYFYVrbaKCImULk1
 qnAQcnwodqNAygfFJaJyTfFvUlbRh9ygb4QmBy74CDwXn8stKdaMziW
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 41c9d3e3e3c7c..05abe2d05d8d8 100644
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
index 5307cbc2007c5..cb24ad2a6d8d3 100644
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


