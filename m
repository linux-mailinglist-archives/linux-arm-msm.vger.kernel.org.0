Return-Path: <linux-arm-msm+bounces-60094-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BD749ACC0CD
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 09:10:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 82FFB169F82
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 07:10:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C09A3268688;
	Tue,  3 Jun 2025 07:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Suql4MFJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EBC267F75
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 07:10:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748934629; cv=none; b=NHecPYjOAmTfVf/U4anIcFGsEGyMHIjIIizj9Hz5eGcDS7H10AlujyR0paxrCp8OmJtgk4z5Q6aJuaL+Rgw7h0wfX1YRJFp6THySQ4o0zbC7t/CqrR5gao/0YmAjRhoV26zIURVxDWBonPIPeT385zvU7EZLSTprI2yQ70w0jTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748934629; c=relaxed/simple;
	bh=MhsHVwN8mmWld6SnMRl8WxdB0DJsEvyajCwsSx8ffxg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=oAqwr0Md2kZgxwXLNlYUp2q9A3La34wuTV4wUGB143LMpnw42j3o38ncQ9hcyPkYH3qrnh0PYjNaly7ikNEfT/ISD8u4DHYD5LDhaEt+iW7XMtou2HVbXUTvk2+hX0Yp6vueYrRDg79u3YUPeuwxRd3LFHiKidk2mOxhDMbW6vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Suql4MFJ; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-747d59045a0so1608549b3a.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 00:10:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748934627; x=1749539427; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0m54R8IX+y6quCUR+mEbhH4CuXoT//OoarEhcq2jl1Q=;
        b=Suql4MFJdRPcc0oZ8yr1Ax+SSvUgYGVRZYJGJrKFQomI6NDJv2L889b1Gu521XPlio
         yybQ9H3phN6H5gSu7TtPIK/WnsKdbNAAxZgxAjwBgpbQhVZ91JI5hi95KSzTTUh3E2Ii
         17MbM4GeNCXaVUkpOyqFmsbZHu3XixvY5q081kfaLYmab0LuE75iU7EYimV0RALahT/h
         U0k0/VzhcO19xy+ABR9Mz1ntz1AwoEzdhbKGakXk7UZMAUtCkFp2HazTYursSluoKPut
         mjkjf7xry24mvDkjsEkfNLgUKzsos9NVmZOoa8mfNKDtZJNuXkoiDY61tR/9JYQqAJ6h
         cEGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748934627; x=1749539427;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0m54R8IX+y6quCUR+mEbhH4CuXoT//OoarEhcq2jl1Q=;
        b=dlVLOsnF1iVVpaVXa5POK//JfIJFrf0hBFusBbfQHGffssoWj1j0LD/Vk71pLG7hnj
         at2iZ2K/G/3Tc1YMmpW0HqCfqtvJbsVxnYURz85M71e+V4gxY+ZStx5FIhITGUb9exGy
         Xqe6cuVnL8WGH4fgwFhG6cjLrYAKDz1lC6euAMO5gD6ggmpmZVnfQ4qRgjAmzZ1/sIgq
         uEfadK/KA8XLvFuNMPPvvbdeesC4QvqYDRcdNbkxFlmUS61u8PMtRcU4k2tDdMwe5G14
         4yoqeaWJB7tNvC/UUbHjSUmeO5BdAHjpKMc7YI8X7XHDyl3Ao3KS5GuEiMhC9Nq14DY4
         w9Vg==
X-Gm-Message-State: AOJu0YzJfKptH8x+1UvDvqQaUjXW3tX2Znx3oqCkp0tIXKLpE2FPRpyj
	RiFzXDaaSgILUzE7f2bvEQpdtEqZQno403ZtVepRUXmWLIbj36r/X0VOdWkhekVYzvY=
X-Gm-Gg: ASbGncsdNIh78RaRpH4zyuHDFv+fuJjXTxisQX8bLg/R66oCtqP74a/jKbYWnyaYMC1
	Wadk2USQCC2YBT7ERFEOty3+LrHyUFqqwMQXfk1htNBRl9lfmMtjNoOOCj0Z8jTH7uCZee3wFyq
	h7WuwFJkYDXw4vI4lLC0YYMXZbE+RXAf6lPTAsQ2izVnDaFJyIPo59MPvwPEZ9YG+ubEStRS0+9
	fU6ZLjtOL0Nm2aASxYld7jH6YXOiGcTmB6E8Ku2w50R0ZxNbnaCjHDpXPMkqwwcal0xBLhpVmY8
	BGDjAclWRmIyhgcO2HO+9yb+HnEJEaysrpk+eOK5dstUfm78nbmq3x2tdAAj
X-Google-Smtp-Source: AGHT+IHr0rlqgTTJOkO93eB9Nmg3a6zrIXONqESRb9M+N3XsHMe2tT0pO0huZ3VhsibRyAZPY6bdOQ==
X-Received: by 2002:a05:6a00:3a28:b0:746:2591:e531 with SMTP id d2e1a72fcca58-747c1bc8c33mr20934583b3a.12.1748934626983;
        Tue, 03 Jun 2025 00:10:26 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:10:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v11 00/12] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Tue, 03 Jun 2025 15:09:59 +0800
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMefPmgC/42NQQ6CMBBFr0K6dkzbUEBX3sOwaOgUJlFap0A0p
 He3cgKX/+X/93eRkAmTuFa7YNwoUZhLUOpUiWGy84hArgChpTbS6Aa2BpSB12odRIoIa0wLo32
 Cbxun5eAu7WBFmUdGT+/Dfe9LnigtgT/H1abkD/9hLU2QYDy62nddcde3B82WwznwKPqc8xcIj
 b+8xAAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=6722;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=MhsHVwN8mmWld6SnMRl8WxdB0DJsEvyajCwsSx8ffxg=;
 b=c5EaIzqDJHdjNADFKTky5ful3B10LAmR8ZrYkpWk7kPp6qBGanr4pul1GqPhX9dnpN/VqQvbQ
 SuzhouUw32gDmEEpzbvO4uMeTQglKz1puTqXBJQJTqb1A9dnwe2aDsp
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

Changes in v11:
- Change function name from dpu_plane_check_single_pipe to
  dpu_plane_get_single_pipe.
- Abstract SSPP assignment in stage into a function.
- Link to v10: https://lore.kernel.org/r/20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 428 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 407 insertions(+), 244 deletions(-)
---
base-commit: a9a5d1e329d508972cd86b6f76866d7ecb45a5f6
change-id: 20250526-v6-15-quad-pipe-upstream-f76d20cd97ca

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


