Return-Path: <linux-arm-msm+bounces-66846-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id EB4B1B13B21
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 15:15:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B3DDB7A52FA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Jul 2025 13:13:38 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3FA919F135;
	Mon, 28 Jul 2025 13:14:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="TDYWqG8W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C49266F00
	for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 13:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753708485; cv=none; b=l5XYI/PCmO/PC9V9KzamkotV6hUBjYkyKxVJJ0/f+5YyTA05M0i0plC5FjRjcgD/vvCwbE31zAfpJ192Gux8sArgcOXi0Zf7Qzda6a8B8qk80d2+SLXT4k7UfKODYkXZsPMS8M5EtRZHIj3RNYFejCPWVeex7ACI4i8VqACIfvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753708485; c=relaxed/simple;
	bh=oHnomoQNurQ262c95EUGcA9VUZC5w3vYLcl1eHD+Vq4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=bFME6oUGGMQk/ZqImsIZL241E2JhMPoPDi5uUMda5vLoBpjZUarOoquGhDyd+BL0ZUH5phfaVSjeOeIdIzSDsvSeGjXIcsc6CB1EY3ZB3TidAoMKvt1WBge6v8+r8L1aS9CMTsl/LFdBJtnxTLqjJ5fTIRdKbj9TslA1uf1mUZ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=TDYWqG8W; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-75bd436d970so2700536b3a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Jul 2025 06:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753708483; x=1754313283; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9Os7DNwoskb1IsKyb51IzFj8AQYOgVJlUT/2IBWZmzU=;
        b=TDYWqG8WtWC3e5SPA4TVl5wAH+h9+Jzsa+kwfSS+OfVjmyFor3lPEICy1OK4BklLXU
         10jVOKgJdpskaT94AleH95ltWWe8lLVnnqGjRTrd30oxFAogNHzGOP2L5SiDzwsz3P4M
         xEIwYbIfcUiiRLcp+BAIaR1DXzj2BTQib3jhlIVXBf8a35MUuKmDfDdBJM9rIu9fb4D5
         X9q/Og3G3nPkhJilpyRqNhSd+NJ5ZIjOoUpscuAkB5kcQ/JmqgXT30mQ4rtBjzXuk4OL
         sizYBDmSUi4YTvRYQ2CLt00WFhu9O7Zsx8bqtfQxPF/OR8+FmBAhLZJtNVZ5hDHlKnGs
         y9nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753708483; x=1754313283;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9Os7DNwoskb1IsKyb51IzFj8AQYOgVJlUT/2IBWZmzU=;
        b=sZnEWGYwTuzq1OjDP76tWLqgomWjWdRgy2seLX9pR/JkmIf5HwiT5Ky6Yk3sX1xShD
         KE8JhHADRbGJ8QhYAg4UxtChjLgjNz9kiPU82HkMaufLFRr3YV7PEWf8N1AZosQsUiFl
         mqKvPeLtSgMLl3/NiX5DgQkosvna0dsUfOIr9vpItskD1zheiWCLa/pfMgc44KHRE/32
         9YMgIopuclXP+LodiJgzOE5+MWA50y69A8y7KK0aWmUiZbKWpMSIjBE+d/0oDqK6lnfJ
         PRJe69pqcNeS7YKKNia2t2kzkvB+ApbS47+HHLWkDYd63x4Y/yooHROYLtrhtAfCuGmf
         Cnmg==
X-Gm-Message-State: AOJu0YyOzi/gGmtVZssqzCYaQaOJudBOIoY22xu6C6jQDZt8Hd4dFAmq
	eKUHKE2Dc7KXO2EeTNZftuSQcNmwqcBFnr+GbG3mMaFCp+A8DDNfZLGpCmec+HG/gwc=
X-Gm-Gg: ASbGncs+hKBLt00Gbik3gwutb3EBkSyJ13W0vMgQn5kzpeeyTnsUV9M+zk/mO+f3gnS
	SmmG0wCWfj2W+OA5nGyIameRjHHXWjZYMx1VrWDgrwbfGagO7SogQC7hTA6qwaGOV60yLBd+KJK
	kl8NmZNY4FnyeiK+xzjppBA68lUAIQK5JVxs9Tz58T9FXmTMWCHvkBTEhv+QYJmXsfxqybMd67W
	ppgsfaWbtic+bK0oWzYK+dNd0GAcWiW8L62Q3uqBhbb3BDl9RF1F98dCwDodL91vNo6ZxxKAyLs
	oIqu07t6O2spKL/uHjxBtKimiAAFbQi9tjJ+7g3B/3Kc1KRLyc1xH2k9oULEwanSUQ2HEQAMbIM
	f1RFNb/jkoxlCBY1UOw==
X-Google-Smtp-Source: AGHT+IFWvBQlH2Z3eC509zBmXkklAzYfkd8XjUD1eLYuAIIy4UEMsaqX1nRZoTgcBTP6yhHZ2CXTqw==
X-Received: by 2002:a05:6a00:3984:b0:742:aecc:c472 with SMTP id d2e1a72fcca58-76332282d12mr16107023b3a.2.1753708479215;
        Mon, 28 Jul 2025 06:14:39 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 06:14:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v13 00/12] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Mon, 28 Jul 2025 21:14:24 +0800
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALB3h2gC/32NywrCMBBFf6Vk7UgeJhFX/od0EZpJG9AmTtqil
 P67seDW5Tlczl1ZQYpY2KVZGeESS0xjBaEODesGN/YI0VfBJJeaW25gMSAMUCfhOTsPOWaEOZe
 J0D1AG6609iqEU2A1kQlDfO39W1t5iGVK9N7vFiG/+le2/8t1DRyMRWWlQOvP6nqPo6N0TNSzd
 tu2DyGdGyvMAAAA
X-Change-ID: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=7322;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=oHnomoQNurQ262c95EUGcA9VUZC5w3vYLcl1eHD+Vq4=;
 b=tOVnJFOn7iZ0dJfwx3coWMgmiKK4mK8kyG5CZ/cViZOucyMQnAgaLN16qxiZWONcLYwdhj4cI
 OGKWRANEXb8AvrMGgN0lPiPehG9c+CJfVaPOK4J3Xx0zgrpWC4tJAkQ
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

Changes in v13:
- Fix null pointer bug SSPP sharing.
- Modify the SSPP assignment patch for sharing SSPP among planes in
  quad-pipe case.
- Link to v12: https://lore.kernel.org/r/20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org

Changes in v12:
- Polish single pipe case detection in a plane. Add stage index check when
  sharing SSPP with multi-rect mode in 2 planes.
- Abstract SSPP assignment in a stage into a function.
- Rebase to latest msm/msm-next.
- Link to v11: https://lore.kernel.org/r/20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org

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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 120 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 442 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 415 insertions(+), 255 deletions(-)
---
base-commit: 3e2eb687837e24ef221d253625b3150137a135fd
change-id: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


