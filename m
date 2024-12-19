Return-Path: <linux-arm-msm+bounces-42755-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 33E359F7648
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 08:53:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AAC4516E6E4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Dec 2024 07:52:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 50B54217F41;
	Thu, 19 Dec 2024 07:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8vyB5It"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B95F0218ADD
	for <linux-arm-msm@vger.kernel.org>; Thu, 19 Dec 2024 07:50:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734594640; cv=none; b=MZ3qVP+upCtBGlKxmRMGAH3Y1DXe4RI8feYsOxYIgGVRXXsM/cgCaMqdXcXp94A5Wf76ibAZHrFw/3DvQZQeBKd2SKKQVyIgToMiy9fGIupPAhPTXJrcBDZReAK/bdGflF3VvcTnl3of4Zetl5c5xwxZL5Au0jwTW2WCb9T+a4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734594640; c=relaxed/simple;
	bh=6ZtdpxhXB/rhz3hCMyuJbmAdwfkWhh1P6PW5UxiXJuE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kPvYv6bW5NMKGPRop2XD4V9ZsxqyZaC6tmE6gO9TGn4QaDjDcHjLYyRQh0LwF77LU5fONfA1OlmzpXvB557YKT6ozWK1fE/w+E5Ba7D6Zp7AlqlMJ122ht+Nl35H25kBuBH6KBn+cbBUkBXJ1SPiLZEV85kkY2bx049DLpv8SNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8vyB5It; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2163b0c09afso4584985ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 23:50:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734594638; x=1735199438; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6QACPLHbU96vR5yGnVxi+OCvdrWdXj07n9rpK8uCOHE=;
        b=z8vyB5It8dtH0aMAtM0DVVm08/ghs+QoEARuBkIOSNdlielp0hRxGhvJpFIdO1uzce
         bU+9f0CYtOC4AI4uOTtHAp8SthYa55v9DylQilaAksxavkmL5mm+uaUBlgt6Mr7rVzoe
         r4W15m+7er6O0Yk6OGho+N1fd63hsgGAx1u8G9c3FMO6A4aJmXJdikb5u+qv3iMuvo4p
         t5WapnfHN2diNe449vuWi/P+jgaNPIqAPEY3mGv+NnbhuoBJHKda+yr9brgdnkXM+9KX
         7/rOEhApJR6t+ODRpPmJGQF2DHepq0lwQB1s7h0EZM1J5bWtuTcEezugCBLLcE82Z+V6
         FzoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734594638; x=1735199438;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QACPLHbU96vR5yGnVxi+OCvdrWdXj07n9rpK8uCOHE=;
        b=w2sj7adV1k7UgwvAzeizIj2JGK1ho5kiL1KIMt24uxbCoyf7C9UBWfcUwZZZcENZyh
         cgRXgqrcpv9qbgb1j52vLYjVY7yZ4pRBBQ9c3EXAVDZm5O4zUROZpII549e3eLJo7PH7
         Li7eNef9oJwLB96PXCAmkALJoDHUazqmoE5pMTCoS5EjKzPFSUdk4rGlD8ckGwshxLI0
         fIhPiT0zyHV3hqgNqSFsBR4/LnB/fgrk7NWlibmc8s2hIw7O0fVxDPXX9B8a4bEDrhwG
         Z8/wX8/9yzUGbDZgvo/LajXjO3gGZCUlQq4ZQMHqo1gpWRFOcmYL93BpeVMFzImYPVec
         iRyg==
X-Gm-Message-State: AOJu0YwmWzWrs9+sxymRElKt48BcVw5fpnAKYMyu4OwXkVzuxMzWpCt8
	8CsPKJvDV9skiqeXxm1tD7sjzBKWvPvRsYldLvR9qsEcBl7b7mwrpKadTZnCqDWDrVCkepBucTY
	FG7UEkg==
X-Gm-Gg: ASbGnctFppXAIvmgV01rBmAffZIq+MoEGWTCs8gKbI219q3mHUXXLWS6Jpqm8hLbbSu
	xR+ZdCLIK2eWMPzjnRIQakKehkzmhw7U8RhndHnOow2G4V8QL6yVOwUS0TUY7vECs+ih6juwq8n
	U8YqN7iaqMOAkqAicSMcObjvP1AUqnlSKDp6Y9XhTvodbM+pJiW0PeUM8itW+BbdU8D+FA2G+rA
	MgerDLXMlHLA+iUG+3S+VpGODd85x0kmt3Mdbi+p5WUB5fCCf4Snw==
X-Google-Smtp-Source: AGHT+IFw74Cgq7jywjWum0/vvzCufwreSULGiGLizUIz+reETmaHjliDxBUvaVtVLedA+GKu2zL2mg==
X-Received: by 2002:a17:903:18b:b0:216:2a36:5b2a with SMTP id d9443c01a7336-218d727dd8cmr83172895ad.47.1734594637757;
        Wed, 18 Dec 2024 23:50:37 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.50.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 23:50:37 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:28 +0800
Subject: [PATCH v3 10/15] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-10-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=2230;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6ZtdpxhXB/rhz3hCMyuJbmAdwfkWhh1P6PW5UxiXJuE=;
 b=DKvn2dcBo0LBd5J6yg1T8LHUwMwZBR8+U8I5tnUqhsqeeWjSyF2K1WgAOy2JmiekoigPcSUOf
 7AmgzuaRziLAakLiBOKe45if2lXog+ljyKv2gKGx/xOlvKMcfT04XH6
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

Add pipe as trace argument to ease converting pipe into
pipe array later.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 +++++-----
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 72ed8749cd716..6841d0504d450 100644
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


