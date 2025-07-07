Return-Path: <linux-arm-msm+bounces-63878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC147AFAB99
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 08:18:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 596BF7AB2C9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Jul 2025 06:17:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5CF9A26E700;
	Mon,  7 Jul 2025 06:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gIjyM8C9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76792189919
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Jul 2025 06:18:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751869093; cv=none; b=WpNlV93ZJaVH1vbj5v+tSL3BORcwlOLesypiXsLpIOJP4U0B+wpYa5oWASc4BYAmHvvWsHrZARocofmRHJJXjotBVy4+1NITeyxeRoD2WHQLAanBd1dzpuDMX9sfaTuXtRg3d9sSO6+I9SxK06flJ45/WG5J3wb0f+mvR3hMTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751869093; c=relaxed/simple;
	bh=kRMs3N1+obgCn0o2cqNOj2MXAWTFlFRbgwr7wHbwYiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=LVQAM8o8W3Q7hrfwLR0C8k6YrTVOD+IdNPfibuLPCk/RgGdHEjfie5nlmC48vN62/WZjX6xdTjiB6bX+7Vs2w4udBLX5CZDP8n/sVDlSWzND123T9246akDPqwz7v2Kr7CncfFJSHfxOAKXGEEtVzSqZs/U+45H+JCfHQhHa4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gIjyM8C9; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b31c978688dso1236199a12.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Jul 2025 23:18:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751869091; x=1752473891; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mlm/9k4GZjp2hvLfJpU8/5ULBCdPfdhbLMjtmznWJvI=;
        b=gIjyM8C9RTTyeADlFQMFodxesruN+WeILgZcGwbxLZjgFS5AstQ5WlWqGV4X/Ca7Ht
         +124E1tYOGF52uTsK0gJeFJKIUoRNQwWzp44bXEeioNeyK+L2NrDD/eElisC8I/O1XOG
         Q9Ct+bERHCb71+s16jcE6Ea99ns49i/rlJs8/X0ZuZ4chVO3aoz0imni3EUmNBvKjiQj
         G+Do79y5I6iZ2sy/5V5GRJyCSiZ4pP73p4lkd7Nl5bWodW25PhfrRg1M+mSzBReimPJh
         Gg8+fs7k5TcgoJNQrCq0prT+CEPgK0HxinvcB0aNMH27JpGku3Su5CIyqi48AFqrAYma
         TPUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751869091; x=1752473891;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Mlm/9k4GZjp2hvLfJpU8/5ULBCdPfdhbLMjtmznWJvI=;
        b=Aq9LLP45qt+pRrtI9Ohi7JLqbqruXJgJ96WgMm6OPHebgbpCWEaaMAAc/Z2aLDaoaj
         xb58+YudlfqtqIft7FFAsEON6uvIA1UthDZIxNue8T93z9KPD1/BzomnZulBfpoQnhMF
         dEiVzrf1KN9HzIX/1DaWfXTh1+BURhcLKVcZYXSQUzYvLg1uAxhSi+TICXAA6OvuSw8T
         OJ4/iBWu7UGFf4dLB5QmA3s2qwHj3KCfP4+jKoIJ8acQ4oTYAoyIpspTU+3+OOQLwCcY
         6DlmJhjjFkPq96b4gW1jyKjJMsqFLRPV2m9TDz6yld1HXeyc7sUbc4Vc3HFwoJM8Bx+V
         wdsg==
X-Gm-Message-State: AOJu0YzLRNXq04H5VKQ51sNr46tWl75PLhGymu5LuajT2b+aj28tw+dL
	3cZqABe2ZbT79Uni43qSK1gnqnCHBCoKrql8TEGgr1h0nS25qLcQ3AQaiR6G0Etnojg=
X-Gm-Gg: ASbGnct5p5u2llfP8sW+H+j6l9r8FSi6nWEl0sprET7zIwg+xLEbNngmfg1jL0tqv0V
	sO55kzzG9jPFN5uEcZ0QHrpbWaARuunXWZooanh7yMCEiR3K+S/S7HL0474fCEAEHm1r+OWvcLv
	gzGjFgTkTGs1fEMaXNvS9tVP3NiLNobFcbAzM+zWtk2zoKWvxDkwre9UYPynyjRiXHb1+acOYpM
	nsoji+aJFhyLzodSOD/seyHAtoQ1fSr1jkmfkaHzK1EzjtkehCbD2/lvhTdyVMUwcrKCZF2jMu8
	RMMJSDvPsQYAf7/AIgfV3heTvoa4M4/RV7yJKFW4xxOSxPTD4c/77lb8Lms=
X-Google-Smtp-Source: AGHT+IEvZd34DIQQn4nJSmU2nrD3AtOJJU+vEW55JI/+47hzPHSDXEF99UR4ThxeaoyCBKvGttzcjQ==
X-Received: by 2002:a05:6a20:a126:b0:220:842f:2765 with SMTP id adf61e73a8af0-22723eaf178mr12729943637.32.1751869090760;
        Sun, 06 Jul 2025 23:18:10 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 23:18:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v12 00/12] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Mon, 07 Jul 2025 14:17:55 +0800
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJNma2gC/x3MQQ5AMBBA0avIrE1SpZW4ilg0OmUWqCkiEXfXW
 P6/eA8kEqYEXfGA0MWJtzVHpcsCxtmtEyH7PEArbVSrLF4WK4syatxP5zFyJDxjOoTcgsaq2hh
 fh9AEyEQUCnz/fj+87wdYCpAhbwAAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=7068;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=kRMs3N1+obgCn0o2cqNOj2MXAWTFlFRbgwr7wHbwYiM=;
 b=Nh0cy4nfGJCwloxYD0+TfMHs2VfAQpEjRZnMIJBJfBQFQFGfrdvzQ1UXqY2H3/4ADfsxQoIvm
 sBrgA6nAGPIBxDhYSTGqYZRMSE6dCuuJwviCnzoLCA4Xf6dNTMy39zU
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 120 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 423 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 404 insertions(+), 247 deletions(-)
---
base-commit: c7f3b7e47fcc7bcb5326275e38c203770e21357e
change-id: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


