Return-Path: <linux-arm-msm+bounces-45425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C91A8A1539F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:04:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 85EC93ABE4A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:03:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BC8313C67C;
	Fri, 17 Jan 2025 16:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SQfbr5Hz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581319D065
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:02:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129725; cv=none; b=pwK+jboeRWhvacZBxWFYurvpoOC0xOzG5KpeFzLTFkXxKgp5OGSvLmn8SMAnq+gQ4A5gWj2ogJNpW/PxId3K7GQbiJdKgJY18n4zCebxixbOvCx5UMj4iwxzmdlbY/pIigRgie6EHxDl+zJAWiVffFAXz3UkEbZGedjCNX5LtU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129725; c=relaxed/simple;
	bh=P09VemQNzqBDdvHhQ5RoBT+r/Mx7DapnEfBXSAfFDaY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uJoSn2OUXufx/0kRJ+WCr8YCANztrpGGUTP0OYD4pD1N1r1oB31yc6cRD44O5go6Q9tum2oQ778jAMjll0edgUyyTJsus9iRdYyydEJcN7/oRV5vqDULDAZf67f7K0lRGFKQhuAhG3sPHLOpmC2CZ9H2J6Y2puWAfFitJlUuXDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SQfbr5Hz; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2156e078563so31500285ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:02:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129723; x=1737734523; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6q3cnHsEuZVr/zEMkZGR5hWRcSl2u4y1EXFLQUZer5w=;
        b=SQfbr5HzfWYTv9AHLv3BICMsdZJcimjN54zPFnv80Z4537KDYObbPuCA/nYKkzpmk5
         wOaUG7iaJOnmjVevuYMSEth4ZtWwnrTGbrEmdCxZLJG/e/Z2bbg/EmmwJzciaA3znOJm
         ibbaHhTLxvquIPqTyw7zdp2Hmb1ctOcJhgELnmjsB+v3lYceQSq1R57phi7alNH1m32e
         alMnZb7rXhjUWl85qkKaYb9fcuASvD8Pj+kBiu7jEFL2I1njJDfSgmdRr8vSVQ8AMmLi
         9+r1FlhzSlB50iwFMmnEKJrTwqMgD/wVjXolEe2H0eKSlbSQpL92avVaF+xoknThXoOv
         mMNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129723; x=1737734523;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6q3cnHsEuZVr/zEMkZGR5hWRcSl2u4y1EXFLQUZer5w=;
        b=cnjubk+Nj5EAw2+cPiO3ZPIECbyENbEi96/fmvL70x+zNQKYB6A8aJ5Oz02aJehRBR
         abqjr46bZWaJi4EDrHjXR098IevgEZNqfpqDMKsH92rSdsV799DTxCoyG4Cg+gpzCrJ9
         VIvhckpquBcXHW4fyg7eCjn5aXL+cL7lOSwBPk4suSBJN7iBYUUxIT+fIXTVtRrjKswl
         ZTf4XeZzPEwJeT/Bf2fHXSpMgHRO1sM9fW6WL4zwGScCPeujrpSSIzIUurFuheI67rU4
         hp9mwmajeS9QGK9pM9b1yZg3UPmXnj7Nn4mi9up7aFrsEPcAkzij9ivCZOBXOSyFbxqY
         DF0w==
X-Gm-Message-State: AOJu0YyuDg3wqbms82T06bngcZn4QOx2l3189Wg5MSqmhaQDHLU4j88Q
	faodJJ7dZWkvpcC8d9VZ4VniuAOEgXFDpHEeNj50H6EgtTfhZzzAH/cKGIuv34M=
X-Gm-Gg: ASbGncvAo0+pR9BFjVfD0kEyhjgcsOQbh/aZVLl7TGGi/4012zEzTvdp4Rk8o1Et4E+
	25m0/N2pZshCy6LOLgYqXe/t23Kmy5I/9/48ctRShLRJz8EgwgUx7pYv66qQw6qXD36rX5ROy7P
	q3RIQeZRjzADTJ5OCZb/sqGV+9ZCEa2BYOaxL/jhIV/ryM6k+93OLB8oyNkl76mBnHAiBH98ODV
	dVKN6ZfDrNCdp+wNqsSgxK9XxAqIbl+GMKNz893SMTC/LivX9Hk2Q==
X-Google-Smtp-Source: AGHT+IEcQx94Mhr70LcsHACJt01aBK1sXTAD0hC1NNZAWCxI3m1ywm3GiJUDoMGgIvOOBSiR6FgPyQ==
X-Received: by 2002:a17:902:ea05:b0:216:73a5:ea16 with SMTP id d9443c01a7336-21c35513c9fmr44604415ad.21.1737129723081;
        Fri, 17 Jan 2025 08:02:03 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:02:02 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Sat, 18 Jan 2025 00:00:52 +0800
Subject: [PATCH v5 09/15] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-9-9701a16340da@linaro.org>
References: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
In-Reply-To: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=2323;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=P09VemQNzqBDdvHhQ5RoBT+r/Mx7DapnEfBXSAfFDaY=;
 b=a5IwoImLMpbIIHoR6/gSdDRdbT8GNTtFhMfeHAfal7uUPJ2p9/lZXhwUoxRcxtfSgN/HP0lGk
 f09rNyVtmcdDoME6RzCZQN+pbI22eVKMJBVzL8+bgJLYqxlRerYe9zI
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument in trace_dpu_crtc_setup_mixer() to ease
converting pipe into pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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


