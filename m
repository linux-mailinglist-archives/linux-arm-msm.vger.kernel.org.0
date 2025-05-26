Return-Path: <linux-arm-msm+bounces-59402-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4E7AC3CB5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 11:28:50 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id F01633A5349
	for <lists+linux-arm-msm@lfdr.de>; Mon, 26 May 2025 09:28:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC4401DF97C;
	Mon, 26 May 2025 09:28:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AdGiiWOR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B77A1953BB
	for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 09:28:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748251714; cv=none; b=W+68BYlDdjFh+Lv/m0kOvcY1JXlzyM0qboUk1l5P/DXCsfecmPNMFyNXNwbAbm1Ja8sF+8Hzi3yK3X9mhCFC/LJwZ/O2je27Xi5uILV1Z4KM+AzRDDGwAOGtgm1aEILOG6BufWs87W4tKNjpRrG3QZ8YRbkPKPtRH+0ifGHB14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748251714; c=relaxed/simple;
	bh=VRIB9TvG2hUh9wimHv6fQoaJBGhT+dC4OrXW8LmGVGc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tmMZIdGlWXn2hz24/bGS2cPpsERuce1a7V6AKPJAXnFWuvHfDi4J7Cl92jSXe1DmudVYr+vnN5+RRVr8cnv2jKhBxXf+G6i/8Nento0h+jJXrIHwvJxrrkCzJpYB2S+uYcJToENt0KxLt2a7rbNaY8KnIVl5+v8iiYh6Cyx44i0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AdGiiWOR; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso1461278b3a.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 26 May 2025 02:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748251712; x=1748856512; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FR+PHGPVJCSXO6Ljla8wClhFRVs2i9P25mgTuKSnMzM=;
        b=AdGiiWORErzgG1G6f+xM0tTBEsmn07iwwOeb+JTGFmiZwvuqKoWBRy2vFkmztqzKEu
         gTprjmD76N/KOazdr0+0wlax2LMvylLmkONa1fVAk9yeshKtW/v6AKm0ZxYkrPUoBAb9
         VNmwvandX/pNSBwTgVetFRth/cimkLL5Cfl2D+O7eZao8fDaY9O/xn3536wVxmpCyvpn
         fNVt5if699b+kaArIpMZ5Y4Z5MJZDm1+6fIODDvhUbiY6ZHj7qBnLx3ApkAFT9c/OZk4
         XWTCW7cidZ9S9iVCOvq4+sLtaRyHfkNC+JJo5FqpbDCcbUC6n79NVWfZbIJ9nwkF9pd1
         wcyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748251712; x=1748856512;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FR+PHGPVJCSXO6Ljla8wClhFRVs2i9P25mgTuKSnMzM=;
        b=v2HPUJPFLL3f6NwbD4ABfvgAGcUBiXowlU3541V4nSqVhHloo+9Nmp1QPfVpjNAZgM
         U6zdx0OyokqUBeVUcLHYAtAUHqqbE7drKs4VujQy2F56Fss5oRZAfs/hJHaY1vaS/hil
         dOxNAX6LaylUOJDLwM8Goo2QmpO4Fr54qEONIG2+O0PB78gFCzUbuSzEyyG3tBRV5CVf
         KJJmihBTnMviQ19/8NsehVTs4Gw7qEUNLg5aIULYdiz8WEk+QU3vq5MbJ7VQw4CfE5zh
         81OZW7rpKy5LZAWFFFtOgObVzzpn0qoPqpAO6cYV3tiYxXRARBU9ylX0SAf9z2E2Jorz
         RzPQ==
X-Gm-Message-State: AOJu0Yw61nrUMjB2+AMLWT4tg8Erf+4df53WrkojxXvAtfAiz/l0arFV
	1zVxF9MoNVk2wlqCLHVULEUzlZsN2tlzCEh3JV7OwTACNQ/H+UHPjGumaMF3bSxs6lg=
X-Gm-Gg: ASbGncseC/dy5CciaigkAcPGlIIm4CY3wUZHNJ/u4tEECNMl+AB69tpEowqDQfZQbof
	2UohTFFowqPPJvXHn+oaAXlDblO6GdGVIzBjNqZXRRW/rz/CAUs6Y8zyENKNPk0J8mCLoo3kPQu
	SBfe2aDumy/+MplQybHzZXxw1t5dOLAtjOAUwVnjoHBG9/dFF3ECLarS6YFDtQrvUm2iRSOgTK+
	J/vNzejejErZXiDIxb8gP3wBvF723LloBu2ktd/lNVqd2iSpPfAdHWZLkHPxZJE0SbZ/V650R/F
	PER4rv5PCFkOn+jQbfizw3eWXAutrRpzPluozv0qiUjgL2NuhT69HggKUtib
X-Google-Smtp-Source: AGHT+IGnc73btOrsjWDntnsm8IkznTP7wick+3W4Gpyj8p+oNZouMsPWugDgy9IsyVVAgcWJTmc2lg==
X-Received: by 2002:a05:6a00:140f:b0:742:a0c8:b5cd with SMTP id d2e1a72fcca58-745fe035e53mr12257432b3a.19.1748251712209;
        Mon, 26 May 2025 02:28:32 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:28:31 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v10 00/12] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Mon, 26 May 2025 17:28:18 +0800
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADI0NGgC/x2MQQqAIBAAvxJ7bsEElfpKdBDdag+VaUkg/T3pO
 AMzBRJFpgRDUyBS5sTHXqETbQNutftCyL4KkEIqoaTGrLFTeN7WY+BAeId0RbIbzkZ7KZzvjbN
 Q8xBp5ud/j9P7frumJ+BrAAAA
X-Change-ID: 20250526-v6-15-quad-pipe-upstream-f76d20cd97ca
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=6454;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=VRIB9TvG2hUh9wimHv6fQoaJBGhT+dC4OrXW8LmGVGc=;
 b=9b/pprogDtWzvbo/BL8ltIL0diylc8OC9nqF5nXpr3lzabgNvyGFvveaQ2/K1qIQMzZw8b4LS
 glFcQKq2M9ZBkPNNSlSQHXhj29S3UctlnBxWjqxOBEEeM86MBu9q/C5
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

Changes in v10:
- Drop changes in drm helper side, because num_lm == 0 does not lead to
  any issue in the first call to dpu_plane_atomic_check_nosspp() with
  latest repo. It is initialized properly right after the call in
  drm_atomic_helper_check_planes(), thus the later plane splitting works
  as expected.
- Rebase to latest msm-next branch.
- Fix PIPES_PER_STAGE to PIPES_PER_PLANE where handling all pipes, instead
  of stages.
- Link to v9: https://lore.kernel.org/r/20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org

Changes in v9:
- Rebase to latest mainline and drop 3 patches as mainline already cover
  the logic.
  "Do not fix number of DSC"
  "configure DSC per number in use"
  "switch RM to use crtc_id rather than enc_id for allocation"
- Add a patch to check crtc before checking plane in drm framework.
- Add a patch to use dedicated WB number in an encoder to avoid regression.
- Revise the condition to decide quad-pipe topology.
- Link to v8: https://lore.kernel.org/r/20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org

Changes in v8:
- Fix looping pipes of a plane in _dpu_plane_color_fill()
- Improve pipe assignment with deleting pipes loop in stage.
- Define PIPES_PER_PLANE properly when it appears fisrt.
- rename lms_in_pair to lms_in_stage to avoid confusion.
- Add review tags.
- Link to v7: https://lore.kernel.org/r/20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org

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
Jun Nie (12):
      drm/msm/dpu: polish log for resource allocation
      drm/msm/dpu: decide right side per last bit
      drm/msm/dpu: fix mixer number counter on allocation
      drm/msm/dpu: bind correct pingpong for quad pipe
      drm/msm/dpu: Add pipe as trace argument
      drm/msm/dpu: handle pipes as array
      drm/msm/dpu: split PIPES_PER_STAGE definition per plane and mixer
      drm/msm/dpu: Use dedicated WB number definition
      drm/msm/dpu: blend pipes per mixer pairs config
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 406 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 388 insertions(+), 241 deletions(-)
---
base-commit: a9a5d1e329d508972cd86b6f76866d7ecb45a5f6
change-id: 20250526-v6-15-quad-pipe-upstream-f76d20cd97ca

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


