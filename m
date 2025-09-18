Return-Path: <linux-arm-msm+bounces-74078-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5926EB84D06
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 15:29:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB75E1B284C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Sep 2025 13:29:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CB762F9DBD;
	Thu, 18 Sep 2025 13:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RRr/9A5z"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D86121ADC5
	for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 13:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758202156; cv=none; b=jf5EQWlTJeli7NLVMGxyOOSlnez5MOxEnn8RYFy4YTgUq1w8VRyf8QfirrS4iL2F4M15jTbuayjMnRw1NjFtnsnA9BgD3UyO5Q5bQ5jffhIyY/oq4NSlZgXxkbOYpQACoQzI9ysRCzDmcT0KYvwHeRaq2LvSaH0hFs8+h3oU0U0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758202156; c=relaxed/simple;
	bh=jAA0W9zivzFc518ni2wZlLuH0VRfMnxoZMcCbTcN7r8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=W1OBDekXzYE1FILEWlG/ra66fu0vDqvGHwrYEs9WvMCYoaDQ+zsYKjq6eyno4ynHF2hvg0nU6QwNnbVJkW63bivIz98KHfSCqy8g6MKuDFaNdYPd4/Yr1hnhvVKdGwJBX1D1bqB5Qq4BSSlOYiG04nAiRJ/WDHxL1+v0GZUasr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RRr/9A5z; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-7762021c574so959439b3a.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 18 Sep 2025 06:29:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758202154; x=1758806954; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dOwkfE/lpu4kqNhIAjD42/DYM6juoh5ZfCsmQbeSZjo=;
        b=RRr/9A5z0VnXJs0YVDrO7k5VjMRLILfVNnKXJVcTfLS6jj67BhySzbpgk98UfNGBaW
         aEL11J++0Shq3iVFG2zpROLT8HlCVZ0+eLqSq0QY9OGRpm2WdQi6gKFBvG48YNhXHeTP
         I0mTX20unij6gRNUCtQxCmNkcKxWLUpNCH6AqgMKGtzATuZh+MhGbU25qCaCb096jfJO
         Gm7+85nnjMO2R34fwZgcvfk0Fbk2bHxXxov26QNygpLdCTkB0250WaPz3umW3L8uR6tv
         W3Ir5KAlcnfuOzxlMutLNAruSzUlJ/TVNRk8aGyddWk5B2lg0OcXEOND0Hvw2D47jSyR
         7KhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758202154; x=1758806954;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dOwkfE/lpu4kqNhIAjD42/DYM6juoh5ZfCsmQbeSZjo=;
        b=IF22P+lC63N6Lp3bcKfuXKPFohLBSrD8FFef5lsFKu7Fh0aKeTHs1OKzuGnU2bquhr
         UPppKV5MNIzeGth2F13Y6Lb2kCn7nMCzxV2Rds8qnH+MAPOic3Gd0UHQ6qqNIJwQfB9G
         bQP87+6prpfzrHChF7Hiwt8KeoQZI5gOOpIsx8PVYlGpp1ZTaEc1SwLTzukGpefTb8dC
         UUgOFENaxda7cgYSdp4DFLo/Ah7Hss0clhjYKJNGVvGMMo3u76bG8piuntpWmNi7EKXU
         68W8jw1RH0MrG9/44BuQX5KP2ZEdfsx84RLBsF7PX9dYOtrv41PsUOm7ETmCqmV8r1+S
         +GYQ==
X-Gm-Message-State: AOJu0YzdDpfLpqdWDbhV/WHriOFNs9Z5p0pMO9Aopoc984QpWziBYgmK
	AaoX11WVY7VCmVfyLCW2aEebE+TbltG+UofAXXce50A+rQr/Qu34znAnWyhVhOHAfSM=
X-Gm-Gg: ASbGncsCvfMY88HSJN9y4pc/ss8igi4lEfni/4UkQ9M32g+M57s3uoCYOmDY1YCokgI
	YexlUW4sSLsCCFCEhKVCAGH/Kn60hAeWEddmTEGkuZU6JFhewEB9v6xBmfORPQOe6N46PdMedIq
	rz0pMiZmk040BrDBF9uytaOWb5R4dzmCsHlx8QbR5Bi2kpbjI2xDanjRfuSGKWpUp3ZqqqH6cWb
	9PGWVB0OOJUUXUO/DLmaQMywpuMawsn7HaMnOEy7PCt9VJ9z9mSFYIE/3OfmcBmlOQzOWNQAKws
	sBWVV3L3Y4JDt/+zA5r+lBWIT3Gpz+VBJR9zRTkBefWOvQ9EU/DZxDC5HUvCsxM2PscdumVHuYI
	AsnZPO0f7cRxtSIXfkApCuJtxOLQOaSV1p90=
X-Google-Smtp-Source: AGHT+IEpk629RS8fvEtFqPQj48Mq3PuG8sH11LgAqCd0Tch4SuTCKn12502XheLVfe0ehKSN+CMKOg==
X-Received: by 2002:a05:6a20:6a07:b0:252:f0b6:bf3 with SMTP id adf61e73a8af0-27aa99c1a50mr9502181637.55.1758202153598;
        Thu, 18 Sep 2025 06:29:13 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b54ff35cc76sm2331479a12.10.2025.09.18.06.29.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Sep 2025 06:29:13 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v16 00/10] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Thu, 18 Sep 2025 21:28:52 +0800
Message-Id: <20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABQJzGgC/x2NwQ6CMBAFf4Xs2Ze0FSv4K8RDWVbdg1i3QkwI/
 27jceYws1ERUyl0aTYyWbXoa67g46EhfqT5LtCpCgounFzvO6wRPsI44L2kCVmzYMnlY5KeaMH
 d2bPj/jiyoxrJJjf9/g/Ddd9/I0rt73EAAAA=
X-Change-ID: 20250918-v6-16-rc2-quad-pipe-upstream-4-c871c0c93bc0
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758202147; l=8439;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=jAA0W9zivzFc518ni2wZlLuH0VRfMnxoZMcCbTcN7r8=;
 b=lftdvCy9O4XgO//pcDx9P7ejbk886Fv3HysOiyJVohn9NXtITkUGiktKi+nBh3dh9F2PSaTIS
 b9psga5t02cAoe6dHNTT0oIQu4h/wMFLIoYKEJyTFE1ID3fMA+550aB
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
    
    Changes in v16:
    - Rebase to latest branch msm-next-lumag.
    - Fix IGT test failures.
    - Drop patches that have been merged.
    - Link to v15: https://lore.kernel.org/r/20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org
    
    Changes in v15:
    - Polish logic in sspp check and assignment.
    - Link to v14: https://lore.kernel.org/r/20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org
    
    Changes in v14:
    - Add patch to fix null pointer bug SSPP sharing, which is missed in
      the last version.
    - Polish single pipe check with removing loop.
    - Polish logic of SSPP sharing test in dpu_plane_virtual_assign_resources()
    - Polish argument of dpu_plane_virtual_assign_resources().
    - Link to v13: https://lore.kernel.org/r/20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org
    
    Changes in v13:
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
Jun Nie (10):
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 380 insertions(+), 248 deletions(-)
---
base-commit: 01f31f83a125db48c058e1864cbfe877c086b6fb
change-id: 20250918-v6-16-rc2-quad-pipe-upstream-4-c871c0c93bc0

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


