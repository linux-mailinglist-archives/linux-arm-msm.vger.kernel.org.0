Return-Path: <linux-arm-msm+bounces-50013-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A1EE1A4C48F
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 16:15:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7AD55171177
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Mar 2025 15:15:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AB8D6215045;
	Mon,  3 Mar 2025 15:14:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="V9GAp5hB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B57E42147F8
	for <linux-arm-msm@vger.kernel.org>; Mon,  3 Mar 2025 15:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741014889; cv=none; b=aa8Hz/Lcfpx0sHTIrUqMebRSc3LVgVnUoArygUomMfUBSf1/xq0kpf+New54CiOYTAu6rPiGYh+K/AnibHHyb8B6MY8jSS3bclsbukq6urpHawesLZiwwOj6mwxmcYdpC8hiBU5ud94/42jJVE76HZw45dbLtgGMoCRaQ2O8O6I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741014889; c=relaxed/simple;
	bh=1G9+v+xHSV6e/Cc3fWuThPAWhwSF7iYoH/iluRyVxpM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Gp31ggstltmiLSXc66FHmmyyWPfEjBkIbuoBIc9t+WPQwnombH3ZGfqWepuyD3ZLNtefIeuNETWhGACMGkkWxJvUzRrvA3HPdU6YKkP8fjCGWKm5aNYp2tV0aVXllNk39rO/EixrOQNgRxHvjOla9C+X/6ZNYzfi+bqpwBrf5jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=V9GAp5hB; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2235189adaeso71984815ad.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Mar 2025 07:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741014887; x=1741619687; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9P5ntA4Pdscf2TI4VTvqsQt0sGqmIO+SzteIpMMDQGU=;
        b=V9GAp5hBl9T/OP8NL5yLmpQg8jdN6J59aiZgulz4Fc+c3FSIRB+ZoulFIH0G/wphKS
         iXe+kF52tkiST8njmvhUIIORGEiQ0UIVGyuJynAxkICgmM+tUdGZwyYZh1dsWcM1oOID
         WE3smtsvAVzdoNF+C5I8EBU+ZXLz3s3OFFK7r8swoZ03X5gOQjpeslnFOPHXvLpb9ES6
         JSmQXgtcvcWy7mkLfwKQCrfJfd3kNAn1y/QLROuHUAxKp6izAkZf4XVGleNQre4G4dOO
         gGkgF0fJTfPUo8EmGjSaJ6itFxyr9o0GnGVDyOPQIliTW6obsllseUtsRi/r3S/HMk76
         lb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741014887; x=1741619687;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9P5ntA4Pdscf2TI4VTvqsQt0sGqmIO+SzteIpMMDQGU=;
        b=WA0BLk5MKZo7fpZLWIB9J5eEe5a1OZvL0E4eMZUIJWiGGUJgxc2uqTH+7vUPpKa1p0
         jw2zVUWJgHlzMmmmz5/3tvAJ6/jzaYglN2AToFTq+/khmaZSF60oW4wACzvgDDxbmi1C
         jn7QyTXNdAnsM0KrdXAMGctu1Dz2ESd5GRXIAaLHgLIj7dt+H4z1zaZjYRWm/9qy9DEh
         vb2GyzW3aJeVhEZvdZAVIwwl08Yg1LSIT2vE8qW0JfiFE81KlBOpjupzGBI1tN8VHybd
         xKZSucJSIuJLUjnZOm3pqaydwrRLb6H21scl6x0ybUZ926jf+yKWZf8YydR0f2BqQSCx
         aCPg==
X-Gm-Message-State: AOJu0YwMQwxxJ8ZU/BYrIL83nzuUxwSV36UCWb3Zqirv75nw1GC6cq4+
	Ron5xQ/wEuvxBJrHYK9IZRmEsNdtLynxzFSpIZC8OAw25RCu0tDR/S6eZFNgVlY=
X-Gm-Gg: ASbGncsu5rV2hGfsf4AKo43x9bFp2lufcDt6lmBeBL0Vc6J6SKOLPCloeTlZYNeWUrT
	RLl6L+1Q/bBIJzz41h25VPLCLqG1NDQwkD1tPBAnkq2rzodI35CUtFlPL0Q3+b/TSQ+y3Z/yQzB
	vJPydtbhLqjOcu3nzv3+rUtqTgdvyVKWC7RWbGECZAA0xeR7IVRgqHb+gBhtI74GFXaocEhPKWe
	ZCvZewqu/OrXPKiq67hIq0dmvl+dcE+bb+44V0VLzUp6JbjZEIKqVYx+xubz09iR32jT8dejLog
	SDrkrsS4tMsiX2z18yFZRqyGwix1GlWs2H7M4wQblw==
X-Google-Smtp-Source: AGHT+IFe6fVcPQmj+gJ0NXf8CdcwYqg9UtNnUZce37u8e4vpO7GXlKW0Ech1Rzk0wTUuGfL8eCwAiQ==
X-Received: by 2002:a17:902:ef81:b0:223:4dab:97e1 with SMTP id d9443c01a7336-2234dab9800mr209819245ad.24.1741014886968;
        Mon, 03 Mar 2025 07:14:46 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.14.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Mar 2025 07:14:46 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v8 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Mon, 03 Mar 2025 23:14:29 +0800
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFXHxWcC/63OQQ7CIBAF0KsY1o6h0EJ15T2MCyyDJdqCQ62ap
 neXutK9y/+TmfcnlpA8JrZbTYxw9MmHPod6vWJNa/ozgrc5M8FFxUWhIXW1qjiMCooS2s6CxeZ
 iyEJnU4Lb3Vi4xzQQmg7C1Z5CGB5kYkQCqSASRkDJt27raimVYRnKpfPPz4jDMefWpyHQ67NpV
 Ev7Vz7fcmiKosw/dSmV3l99byhsAp3Z4o/6yxTqL6bOZm0rV7lSKDyJH3Oe5zfxekogiQEAAA=
 =
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=5837;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=1G9+v+xHSV6e/Cc3fWuThPAWhwSF7iYoH/iluRyVxpM=;
 b=lnFFMORGnWu/x1BqCoAxxyw9PYcRBIteWY9/UwYrdm15EPnAs32HoqEaAGPbgIWvY5DC7goGp
 iSCzZ6IDgdPA4y6RSiw9Y9Pd+TyyKCD2x8+/X/JnUp7zYJsxvYxy8pZ
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  89 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  70 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 404 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 516 insertions(+), 342 deletions(-)
---
base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
change-id: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


