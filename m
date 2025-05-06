Return-Path: <linux-arm-msm+bounces-56975-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9F7AAC9FD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:49:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 446EA98145E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:49:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B783C284B3C;
	Tue,  6 May 2025 15:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HLemBsMG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD77284676
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:48:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546524; cv=none; b=Qvve00JVewUxWv4Hp0DAODeEPv2lUbXqPgrTZIqAtMXnrJ4e0cRZAK/INj1YHjOqqyVW6As3BKzRvpPu7A7/D4lQaCZ8iQimSPhseQhepHHnW9ztTWNQx63J2D8Bi65+y2bv9lYfc63JMpAOimGUrkyfh4Kb2EeQ7lbctXwQ7Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546524; c=relaxed/simple;
	bh=dkXtXCEO5Q6Tv9ZAERidu+cw1iHRZ7TImSor0/VGmi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mNSnsaKim9Yb5h5CuaB/+F1os7LRIWH/qrDN1D3+bVB4HZAKyU86+UmSL3J5y+HQ4LA3MG26CmvzgXWOj6hJSp0Zf4UGQBxuZ9veV7dDcOFf7cefiVh/ydEw/qAln4iSfk0qRVTsWDconjxRpIQR7YmZsFXAPH99j/mg3m8m4kU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HLemBsMG; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-30a89c31ae7so1064306a91.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:48:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546522; x=1747151322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
        b=HLemBsMGnlPrfgbqqm3Tr7hWWl8gIbOi1kDX2BP6i88q9n7RLRC2ODKCh0xFbc4/WD
         4lJW7F6ZAe0YkWqcjnm2JNkBPFn11os3NMBvkTspnTH/GGsnf9q79Z4vs7kJlzPqoIGd
         ptcMmqIjzVbG/7Bi/v6e4pXXx0s/6vzsFJlWuI6K4xX/d9XV7AvsY5iZ+LN2QUHhkpjp
         4vHc8+zRzfjJ8I+NVjbTZZokBRpXabxn+u+SDAfS2sL1lsoqThwYcJp07qepMfYb4Zt4
         Yprah4He1HvhZDkbcg3CdzRI4U3CkbCEEY+GnEjnqiwClTkK1R7AJmSOEWtVxTCXUp/K
         w4+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546522; x=1747151322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zxbvSQZyP7zd+OjKdls9ttnVESv8uUgxFxtkpvZdxt0=;
        b=TGVMR75gMaRNh0vBjP4QOwV5gNV8agi3Ni4YA20ti5DqifM+AgBZo2LJNApHVgDE8h
         L0x3RraJiZY2P+4v5hEzIgEO4XLAIy7+C6ELXsAkUiTkThQ1K3WshUntsfxqcMza5EnA
         wya4ABZoUTKTqxXs385jXSD2Xzgu2nKXF77eYhqkjr7ue1gPAhg3wSroXHP66HXaRw5K
         NZvT7Es65jBDc6wCWPVg2Fmge6+WGcKN+VPqRZbsGLxh9tkN8rv6OIQuD05UFa6TTsyE
         u8wINnTIkf8W5a59IzdPZzAzj+4nqfS6kk3Vaojl73tUCFYZd0ZXbvsfWkdPaZNCDbBI
         No2A==
X-Gm-Message-State: AOJu0YyrKF4JTJGcMDeSZp1qSvm0I9SNinMXvSqrBuahA9ywi/IfobPl
	Ig7LnK+ymQgllSV4O08iYHeovTCr/TKNj324+GV1Kl4kG/a9m6m/916zjK86PnG3jCcjbjfl2Qd
	oeZBnhw==
X-Gm-Gg: ASbGncuZQqdSOs4Rm8Ra7Imu1aN8XP+FB5hZ6grjls7lgM7TZrS6fDYM0Lzji0sAMYl
	3UHNAeoopFG6u89Az4PirUFSO/GFHaWr6VHYtEx8ZDnkCbzQpR31DP1l6YjF8dMehXroOQ50L4h
	w++dhL1Lz1YbTUV0ER74LriWxC9ORER442S7qFBjKhwiHbu3qkJ6AeCqwq2vhHR24ccmVzMSnfs
	xCV1pg7qEhHb8WHokzXfeqngDCpp4kBghesRAC1XShBUn9yAYOtHpKBZf8pMJ5x9g5IuvWfT5Ng
	D8ihpq4WTYitrVmgh4+UUI32N8CJC7AexjtqmA==
X-Google-Smtp-Source: AGHT+IHZeHCrOeq3H2L0fpBwZ7urndRGJ7zRpySXR+v3K7pTWa7b25ypy5G7H4CUfrtFq9IkZEngMg==
X-Received: by 2002:a17:90b:1f82:b0:2ff:693a:7590 with SMTP id 98e67ed59e1d1-30a61a700b9mr19620258a91.33.1746546521786;
        Tue, 06 May 2025 08:48:41 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:48:41 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 06 May 2025 23:47:37 +0800
Subject: [PATCH v9 07/14] drm/msm/dpu: Add pipe as trace argument
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-quad-pipe-upstream-v9-7-f7b273a8cc80@linaro.org>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
In-Reply-To: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=2487;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=dkXtXCEO5Q6Tv9ZAERidu+cw1iHRZ7TImSor0/VGmi4=;
 b=8ncQSdz+52Re3aTAnYi/3vBqAnu4RWjDskM6ZCECqqjaeCZnnsYHX+Ty4mCnhabGRwiRUktHE
 c5AvJsbIS1bC/cLbKchKTaZRRJMCSSvoRYz56sLLIKzxYscyo+Ucduw
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
index b0ee89ed7053f940d01bb55a8ea8de8ec5bc3462..095497d80e8a4168ed6b7b0a1b0f535bb9099d7d 100644
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


