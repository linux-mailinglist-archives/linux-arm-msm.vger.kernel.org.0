Return-Path: <linux-arm-msm+bounces-59407-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC644AC3CD1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:29:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 770E416B1CF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9DC7C1F1527;
	Mon, 26 May 2025 09:29:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BXPk9GbT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE4F11F1306
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251747; cv=none; b=QBOi2C6Bo6dOisWNw/7/1FMbqfmDc1jQJQsbNSaQuqqVmVr3OFXDVO3eYZTKtKVc+z9vcm7GzMQQiEkm8rg4W84FTQmMlNsFW7B7goDBFzN2lR2pq2W/z2IpD1PkoN32pUGKf6JiJKwbVn5IBCUWHrpSrn8VXqhkCCH/bSE/3jM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251747; c=relaxed/simple;
	bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pIBhZt+iK4mC/xCUKhDhP9akZBSvZSKGr9SoJqsN1KFeP4SgYyUeH9kkScX4HUxR6iES8a541Wvlsdde7VQV+Y9YYY9qo6nW+uTqcLoNhvUl/hnASJwFWJzpvxJ4vzBSHwhnuwF6PlljcPYNRMEpLYq8mhgNvzvj5cAfz4agGgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BXPk9GbT; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-742c73f82dfso1395808b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251745; x=1748856545; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
        b=BXPk9GbTfrVGJNj0XCQqEdUyz3GDcy5eoQFiO7zgDqoPPsoB/M2lcfivkTuJ9rqUa/
         MdgiaQ55V6Cm5ZFdJRaOPL1jUAtHXBenU5Vo3aMleI54He51PF1wJAyy+ShgBmLrxhW/
         tqdSEBzFOrU4FugORe15xgI8ySlOnFLU+FrqKCg5TP3gUQy3aOe/YTRttKebNwCpCHso
         iCKTVKGvqtXBvVTn6mFiAS00gok6PwnUwDJ73nCigfEz6CT2g06Rm6/pVwEGzZKAzhj5
         U4KPQJQVuYr3QxXc8uY2+P72ncg1uLBtZkT8gUdYe9ZCBTtv1PXtUxze3B/vDmAZshfj
         yYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251745; x=1748856545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9JA927uWtYKHWYqLpVeeOOuDkS72N+Td94lU14Gx7eE=;
        b=tcl6bkt+hutBfSsD5o2lzXxT7CUmg6BwDlmpwecwt7lpnflApBMfFiuwKRKQOS/Vf/
         XU41D64Bnb9Nis4tCRppIFMV9BBr/1XZQvl8lHnslXN9ZJJWJ6qmRq2uP15v2HKXplTK
         CB1dbg1btXwpC8vbYKq4GCohuc0Q6DWnqKFbDEc1i9o6QdVnDLPr2zTSW9lXKK8ruAb0
         nNllrSPHs7tFBnSfdWOdLzgSn86EYbF6y4FoAegXJJXdl0iGQ7/b98gxZWfVf7AgYhoM
         qbCgy0mdTzeoCH3QN9/GSkxDAAWCpqYnfQ6ytTYAXQ91rSxXjAHADaWNh9XAOLIXQhTG
         vW9g==
X-Gm-Message-State: AOJu0YyyMfHdOZpId+94texP8QPzReuOxfGdAl6z09KuDzV9yI9fAzq8
	YWXV1/OaYw8QIKeZBoxN6ZB3EiO+wY/lgPS/9Z97yNwJIDx3dT4QwlWt5BuPF39r/Es=
X-Gm-Gg: ASbGncvfA7O49Ef4+/VlxOmQhlzbmnujFe/i/ACq7cgG0DBgMfVpTg5p4PeUj00sUaL
	jJCigNivn/Ev3mMm7NP8LZyix2gUYwhWkbt1t3qykpdCI2IIogsJjyXclEJ8xc08kVBkgEai70X
	+zVxfEg8juZeSb2tNJNUNY9oVKQQgUmTGf6KTsG0on2cWYFSrvtiIxLS5EsJrI9lPh6e1PKfnbD
	ApXi6DMnzPm3L3jfDLMvtDxfWJegJhUCSvf0lZnmsNyY+hnbx7+Bw0E9307IQ/iTlbuaP5kffHo
	VSPtuGnFHhRM4eT+zfYIJR0VNtQsD/DlwNg8Uu7qNk9A9z0IEA==
X-Google-Smtp-Source: AGHT+IEfpaV5RMzOqtdfCNJc96vkUVwkfQfweeWxe8pOUvEMvoqIQ+2/dZVO44+go5U/uqEDw2lwKQ==
X-Received: by 2002:a05:6a20:7d9a:b0:203:bb3b:5f03 with SMTP id adf61e73a8af0-2188c20e04emr13542802637.6.1748251745296;
        Mon, 26 May 2025 02:29:05 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:29:04 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:23 +0800
Subject: [PATCH v10 05/12] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-5-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=AzK35uakUtRc9B2/mkaI31Hgz37sujAtB+6mV9+2mao=;
 b=usJtqEGDndm7ZVeIqseoGaTQlRsnJgcsJnE8Nc6A/ggxAaKwUmry4U4M0Qz9ydHPVAiMrtzK8
 V7EmjEpVEZhDBlUc+srM/VkGazsUR/SmWgJ+Tfq8Rz06SDFwMI1g6je
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
index 90941ff4104f620d1f4f18ec260418ee59dc16b2..3a7e030e1241a5115460a1e9d552341f8dff7d85 100644
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


