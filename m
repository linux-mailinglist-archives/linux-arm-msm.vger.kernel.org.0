Return-Path: <linux-arm-msm+bounces-48226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id AA919A385ED
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:19:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id C3BE57A45B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:18:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E313D21E086;
	Mon, 17 Feb 2025 14:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aZpO8Pfd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489362248B4
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 14:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801860; cv=none; b=lfmL/KRI4lWaM9ts00J3l3Qnd1BV4ZGUWnBina69WVzVu6MVioKD4vT46s8aWqzhYoqMKkN7Xt9QZbiHuR94f6naVQVVMMk+GO7VjdoS55Q3X1ODz9Y7dksvl25aCPEF10RHq+gNezFZ3uDNx7HkaoFf8+dmROxG4yL9lX6Xd9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801860; c=relaxed/simple;
	bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d9AWSfHN1uu7IQv6XoGsJYTVvE7R+izu8lHbIqxTfXpPkrpjcKBZXmVQDaWKRZYTNUT4oyV01+8IHwiANYHCkMCwikPeVubMSRr6Vh82plmAXtxAIl8i5S8qrYrIzRxqLN0BUnCea6l1R3zfLmfmks7aDSsjGngmtH8DliaAibg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aZpO8Pfd; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-220e6028214so70159255ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:17:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801858; x=1740406658; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=aZpO8PfdHWfAIpTDMz7pSPW45NbknS/sp02Id+rEJVr42jeDJlBuc3vCOCekm9Kf2F
         58OoxZX94Y92XRKTD87C6EYm7U4VgK75D59o4LZSnJWeJMakjzc1FpeV2W5tuAlvSPeI
         9E6gQCZ6Et+YUA0p5Qt51puwOjVYgrG8GKNmAr9CDTpB/Vsj/MEttL4jqFvLjv3t94E8
         XQWTm6QIRFtyzySMO4If6poc2URtzeKDZ1CaFlsu2zO2aa8j/pwdKUz13TSBy4ypYTms
         /74Kv2atG/GlV9gcfbdGOc1xyK21hOe6yHEbYdLr2CLqzClZ8FkYlerT0GJRptp4acw9
         L9vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801858; x=1740406658;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYqL5aquEf9QP1MU+9dPpzn37KZ182hWurvxtiyryKc=;
        b=G8e7KoJYK+e/rUxm/zyT8wYCD5Aa7F7W75j0b5i7U65S8SS+KPRodUWZHe/YNpnbPV
         wnOPloyG3GLS1lgYIoFF1Z/4DGxm6qHmNUtZXD4HvXxdu9o4FnBxjwsh5/0PVf7BV2dk
         qfSTA2DVB2xdM/SLjqfTLVMxY0OZIPdjpDpyU+11Lsz65U46sFTn5COrl2KiBtLHqXha
         lMZfiv9ZG9sCVdOYOT8QQu5pnZI3Lxeit1xOBvyxBPyTyXa+yt8uVn8j5Ip3S5+cEE67
         /83mq/v5qJZ3CsKQU8xDjugcq5BOSCPfHbXwKZ47huhNpefxqtOR/Dn6u831ehsP+B8U
         +cHw==
X-Gm-Message-State: AOJu0YyTJv5pQbUPKinTXVS3r8mUsQ8gd6mNcj1Vc5TXFajAa7lttc/k
	BzLgoN2Yr8zYVA+HKtafiygMq07Kn7EsRO9u/EP2Z+tu7h2Vqp+9Kdh95bRVmto=
X-Gm-Gg: ASbGncsOd38DUT+o4kDLXgoeg/Gr3IM/CUVumbLgQIxYZEPgycfTOYZzTFV8LYEJdDB
	fMy4A1E+6oAV4OtFCAlF7MrkjSLhpBuqi5m2NCoh6q75nOAkjnDbt13QfPHgpeUNO4cF8XmLhiH
	a4rcmG4NTmUFTwgcCz3aQGX7+QYYPaMAXyA7Pd5phi+d2ZGVbtkkWCOC3rzzisnbrXgKWOFwyi/
	mpHu55Kdef4FDcSQgvJmWW64kf3qATg/TjY+fcmDS0paPFC0LtwiRMR9+pglwQFl6mSKw1eWQNx
	Kvr8Rd5m/hXB
X-Google-Smtp-Source: AGHT+IFS0jCADQX2AcgQY79NodGJN5uJRBAzhISMBvHFJ/ExxIfY5jpXxhVRd14EYRwV6Ijl2nRmvA==
X-Received: by 2002:a17:902:e88a:b0:220:cd13:d0ec with SMTP id d9443c01a7336-221040cf8admr179662625ad.48.1739801858618;
        Mon, 17 Feb 2025 06:17:38 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:17:38 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:58 +0800
Subject: [PATCH v6 09/15] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-9-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=CYxXjoGPBo4uvT8jsEkwbX8WYPTbGIdNFxJtu3SWxQs=;
 b=B2USM0nmUXZxmqrKZovzuB8XerL0erfBe62Y10I49/1MRvp8nQlfAn9jo+PNTNYpWx/cQbM9w
 MOQC7Hp3220AdrYMGUqOjjWj8+fDjbOvDxW51kieS9V1hjiBg5SSetp
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


