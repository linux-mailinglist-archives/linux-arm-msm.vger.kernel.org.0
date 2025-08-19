Return-Path: <linux-arm-msm+bounces-69630-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5765AB2B62B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:33:03 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6BC5652726E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:32:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6493922B8B6;
	Tue, 19 Aug 2025 01:31:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DasRVuhG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D0223311
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567100; cv=none; b=IkRdk5wy1pH4T/xulQZSLl2CTb2oDP4aTpkYGqJRgIxeT84CFiMzACHbAAi35fykMbu6XGTc8oWJ/Y5ljOzKlPmcmTd7K7yS8zqxiU2qIVOZ1ThelqOOorT968r8lXVdKzyce9T9TnO8HnmXv7sgmx4ka3x0mW8U7sFhC6Gc75g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567100; c=relaxed/simple;
	bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fAcib6lvyY7VG5YSRsEyv0m6fcPHFFJo2obyKsvee1dwssHtxovLXGaaSUZdM6tRgWJTTTZ11cxeAAfkUSl0zoIzRITRAEEoaQQ3r0hulB9oJCMG5Z3Sb9TK3E5XM2OKVeWOjCZd+sdkxmC+4rE21H0xqVGHFJocFkzFpWV9bOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DasRVuhG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-32326e5a623so3885107a91.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:31:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567098; x=1756171898; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=DasRVuhGRj8+s+6ulcJ2TVtEZhIo15rNM7ohILVbDWWXWTrkbIs5I1+wU1/9nnzHLx
         Sfc76PjPFcKkAkCjPnuAzpgC+N3woKFuqv9rCfWUlkOgxtNPpMN2TMhqenfzIGtaeuDl
         sPVebVocg6zljWUkUxHd/E84qKAzzMfpITp7IE9rZ/jgmJTW9fF8qDw/N1C4aPDJPW6T
         hYRRsIp5tNj2IM94mz74SF0nVgEf08MUEx4YlBE9Xd4u6pYw+9ZU9UeBZs5vZienXqxg
         xNSkbzAxWVwjDWDYm7wTJ0sop3bieYlPgtRqbZrYLT+zbVtJ+Ccr8xe2sKpxAOsWxlqx
         fVuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567098; x=1756171898;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKfocSyum6c+ZXGva6cBv+Qtfqbf1qkUCIjZpV0tOYg=;
        b=sp+Zh+nxp9PrKWW+De34FZmzIv4PNI/fBVNtPpiIvPdM1bqFtF9ZrR55xiZNUwfY1l
         nCBdRdICpqDwa9NcEImyw5aDpQ4bUSVQCL/19JFUdT6/EX9zY3o8gR9dHMlG1k5oYv0K
         inrEK0FYJSDafYi8iTEw5pB4JZcgL60bdoWWSOVZDTs6opR7Hk2DBPqwXorBfvFKkR4n
         8snhRYtey+Rn3rMm0ObQnxbw1m/6IqWxmtGttbr+Bar5AcyzPo4nNui1kBtRCcOywstL
         tXXJCF4qHt++VMg9UEczkDrsIgXYDIYOZR/DoIUxBV+RM7onCkin13um8yBcBx648Nmx
         l7jg==
X-Gm-Message-State: AOJu0YzAZkUwbXw+HBBujehXlwdPicFmtw7AR/eWMliUKLvs0Y8uOVYg
	+wJPDYAAoJ/O1M4JoKe7Ag8Dz9jtjqnD6/BGaW36rfN3Vtguj0aHau4CwYL1KCSYFm4BI/ah/5G
	KsW4QF00=
X-Gm-Gg: ASbGncs22vwjjCc/KVN0V+hLPXVBokXmaMrLyTSKvPdR9AR3rFZlrZ+beQOCbI1ztkC
	8NMxh/gt2KybhC9Ei+WyKRS/BjIArr1Eui1VhJb7FEBNXjL3CS4j0VS8EPlsfp1a4r0nZQxMRFr
	RGWf6v9KkRNJs2Vmg5XIesHZXV+ZIDu5zk2vUWElyjsozR+5k7EWjpjFsl+JQE5H3r5FADxHE3u
	EIsRXuE6wjVEuL7Pkxxp+ls5cy5Wr09e+fGqrJZvNtBkK3QtebEIZwgCME/PzEo4p1/LAB6lKQ0
	apEWhXHKaCK0vc1mreYufz79dBi4CBBkMIFSg4il9UYmZqlwBQbKD3vA+dH+jIFdHP/oMvrpKQ/
	KKmflKuTbwSAQuBy1jw==
X-Google-Smtp-Source: AGHT+IFBYheVkG50EzfDqBmExCSz/0gQ0qRfVgS3M2MFzRfVUBIs2TV5c2LXURvHwasnK59I+e9cWw==
X-Received: by 2002:a17:90b:560b:b0:312:1ae9:1525 with SMTP id 98e67ed59e1d1-32476a4fd42mr1185311a91.8.1755567097649;
        Mon, 18 Aug 2025 18:31:37 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:37 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:00 +0800
Subject: [PATCH v15 06/13] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-6-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=3U0bowJZD1UHEussz5PlKOBS3bAoQPdxBHy2P4TuJ5A=;
 b=QtXuzwdPZXPmSH7jcPO4RtVcjz3yHVBf6AK3KIZ9C03aGoPvZkYSeCO2CbNMJ9VuLR+PViSuS
 Xc1xCvUeCj6ALX+hkQm5o2z9ZVblfBguniBArs7KtUIcawlRZiYVb+1
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


