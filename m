Return-Path: <linux-arm-msm+bounces-49495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0BA45F53
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 13:35:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BB64A7A04EB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 26 Feb 2025 12:31:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4F73C16F288;
	Wed, 26 Feb 2025 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EPq9WAnq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C631CFBC
	for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 12:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740573138; cv=none; b=tuDduI6V7jaWLRV8fkvjYiLwkT19CGGbi6Ch3hBLX+s1iendSRg8/h0tLpUo0z26SS7OhpG0C0EC2QAsZS9cMbOPCe59V7v/qK8s0TsD9Pgfz8L5UbgqV11et0wC6xhiaM4AD9y1jdtGMAdWRglRb76xH+3tHxuXrIUInbHg+Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740573138; c=relaxed/simple;
	bh=VBK03V2F6vXX1tPpdWKGvw2UDlBxDRc/SEGCFWAoghw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BRiaobzDOXfrBfHwjnqnd8NnUstF7zML3m9I1WcUdOM6U9F2/BhGGFZ2UeZIe2aNbC0a71LM3TNkqCV+2esP9eV07kqWntakIfXD3Njm6n6SDH0j5TGo74yRS7LiEr56xKfstlolmFlA9kied87ohDU+WsPYbU6NXpTr5axhz0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EPq9WAnq; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2fc0bd358ccso13155286a91.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 04:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740573135; x=1741177935; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nLwMDc9HvQFeLzMA/QjMcCF3FmyqVGFtUL4wI4RN+NY=;
        b=EPq9WAnqFBhjzIBwOvm2yhHEGjE31lcUgm7IzDc/6aGU2afc01laOFGQIeicY2LiMI
         XhcvFRkoTnKbuuDY6tzSv3JSe8oS8d6zBjd6pRby+Jrwmwe69vMFCKzbQp1sNqx3r6G7
         dkMh1L2sAJ6XS4tpIDllBDSNabskKrYSfSSrO+a2L7pn3T6GBg6Ho5kNiNMVYCi65J5Y
         BVnvFJksmfmwW0Y/2YY+JEQbLKeDrufOHTdgy4gZztYMoaY3vq1K0dlrtl3AYamGV/CT
         1Wz27eSb2zl6jMXoxXhD0tNZCmSysHlQwDJBpkQVg9bfZSbgjkUQj9MJE3kuFsD5Ubam
         HUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740573135; x=1741177935;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nLwMDc9HvQFeLzMA/QjMcCF3FmyqVGFtUL4wI4RN+NY=;
        b=Qs1DxvIEwr8ESB96Mxphh/BqYKP88hO4FgEkmCOUJPyRtFD5013szCY9MvEtuD4dg7
         gC0+/AypSg2B/VlMRfKaPHjI2qEch0ITuLI6Y0Y0C9fpwqj3y/vhX/NWgYowZicL0omf
         Gm1RvuCehkVQ4mLFrfq/uqEBhodB8tQ5yfSh8apQbtiCcJi9vj4edy17DVIlpoetjx7r
         v5KYFYfNQftedPTZZuRkcqvayDHDq5bn905mqHNCIC87G74SUKFysBjUg/jBgQ3F7CCW
         viXZxSLxLTSnet9Ea+mNkEp5aXDpO5kkR7JAx2E/GTwvIrck76hlea63G9S9B0CnAXzY
         HyCg==
X-Gm-Message-State: AOJu0YzUsZhBSmIIcjKF14MLPIGVm2ULb6TabzCZsUbrZxjrUqhAVDvv
	rmU7OsWzoPSpAVCc29xazWrofcwC7izS7pkJRvegFAmQwwwCk+EaRXyfq+nXr/xcdnFgF/+jgJs
	CgJuwB2Ex
X-Gm-Gg: ASbGncsVOIkocrBXThaRtsRoYUN9NR8d0YGV+u4XiDBpqQlFq6SXeFyYAoihcVHaP10
	DOLdT0vMslfoxg6xiktrDEqODsCk7OrLf+DhPgdqYgEYemyj9FpHRa6kyvlRT/KmWXa7N0BD7xR
	0ol98ExmdcghRrNz8yQw7DhLElrdncqLmAwpW5QyyNSnucM1gnSWvqW0Qv5O/hXgFlxMsxM0o/Y
	b1lk4O19vhA3ROdlwL71Az1iafcTD34OZ+A8NCZzEpZDNCzo+3tUK7brWS8M8ur9wp0GAwL66h2
	z6DAGGna9gPeDf7/2kmPqR0=
X-Google-Smtp-Source: AGHT+IEbAyFBBOMkxX8iii+oG2zEvN+iVSKnB8HOk1y0lYNcQvxQ9iWW6DeYSTP1NWuOybRV4hR6Ag==
X-Received: by 2002:a17:90b:2e08:b0:2f5:88bb:12f with SMTP id 98e67ed59e1d1-2fe68ae74ebmr10318377a91.21.1740573135543;
        Wed, 26 Feb 2025 04:32:15 -0800 (PST)
Received: from [127.0.1.1] ([112.64.61.158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fe825d2ed3sm1352479a91.29.2025.02.26.04.32.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Feb 2025 04:32:15 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v7 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Wed, 26 Feb 2025 20:30:49 +0800
Message-Id: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHkJv2cC/62OTQ6CMBBGr0K6dkyh0IIr72FYVDpAI9A6BdQQ7
 m7lDC7fS76fjQUki4Fdko0RrjZYN0VQp4Q1vZ46BGsis4xnBc9SBWEsZcFhlZDm0I8GDDYPTQZ
 GEwI8F21g8WEm1CO4wdydm1+kvUcCIcETekDBq7ZqSyGkZnEoyta+jxO3OnJvw+zoc3xa5c/+d
 T5mOTRpmsdOlQuproOdNLmzo47V+75/AeTMizQVAQAA
X-Change-ID: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740573128; l=5416;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VBK03V2F6vXX1tPpdWKGvw2UDlBxDRc/SEGCFWAoghw=;
 b=hscE8wpDC3R8ueN5JF46sO3IoxiKACWus9Wa5L/Y69195ArHTygUgkfnmSuo1hX1EwUw3hJUj
 bpmj+o80zo6Cf2m8H5K/8P721uK7s9gO4b7AogkHyngNh2iiB+E3PZh
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

2 or more SSPPs and dual-DSI interface are need for super wide panel.
And 4 DSC are preferred for power optimal in this case due to width
limitation of SSPP and MDP clock rate constrain. This patch set
extends number of pipes to 4 and revise related mixer blending logic
to support quad pipe. All these changes depends on the virtual plane
feature to split a super wide drm plane horizontally into 2 or more sub
clip. Thus DMA of multiple SSPPs can share the effort of fetching the
whole drm plane.

The first pipe pair co-work with the first mixer pair to cover the left
half of screen and 2nd pair of pipes and mixers are for the right half
of screen. If a plane is only for the right half of screen, only one
or two of pipes in the 2nd pipe pair are valid, and no SSPP or mixer is
assinged for invalid pipe.

For those panel that does not require quad-pipe, only 1 or 2 pipes in
the 1st pipe pair will be used. There is no concept of right half of
screen.

For legacy non virtual plane mode, the first 1 or 2 pipes are used for
the single SSPP and its multi-rect mode.

To test bonded DSI on SM8650, the 5 patches for active-CTL improvement
are needed:
https://gitlab.freedesktop.org/lumag/msm/-/commits/dpu-4k?ref_type=heads

Changes in v7:
- Improve pipe assignment to avoid point to invalid memory.
- Define STAGES_PER_PLANE as 2 only when quad-pipe is introduced.
- Polish LM number when blending pipes with min() and pull up to caller func.
- Add review tags.
- Link to v6: https://lore.kernel.org/r/20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org

Changes in v6:
- Replace LM number with PP number to calculate PP number per encoder.
- Rebase to Linux v6.14-rc2.
- Add review tags.
- Link to v5: https://lore.kernel.org/r/20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
- Remove valid flag and use width for pipe validation.
- Polish commit messages and code comments.
- Link to v4: https://lore.kernel.org/r/20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org
    

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (15):
      drm/msm/dpu: check every pipe per capability
      drm/msm/dpu: Do not fix number of DSC
      drm/msm/dpu: configure DSC per number in use
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: switch RM to use crtc_id rather than enc_id for allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  70 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 411 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 516 insertions(+), 348 deletions(-)
---
base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
change-id: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


