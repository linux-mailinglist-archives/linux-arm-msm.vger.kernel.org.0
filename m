Return-Path: <linux-arm-msm+bounces-69624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13801B2B600
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 03:31:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4C11D1965813
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Aug 2025 01:31:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B8CD1798F;
	Tue, 19 Aug 2025 01:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LkJImJHb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D792110
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Aug 2025 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755567070; cv=none; b=rXR104KiQSx79Uw2Cwnpl1bmMseenk3dWT6/QZ6cmKbAQhvKbWHSixcbw8lKCqh31+A657ZJVfen16RB28mAqNNB1pgQM50lMWrqJUuScMrmnUCOJM58Ffwil97QPy89w9TWnFWorPiJtRX1i4XYuxHlkUe3bmaS/WL2U3J2dUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755567070; c=relaxed/simple;
	bh=n05dBYMnPbyyIo23Q0QMyafHo1VFW+j7Ak5lshRs6ZI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=irw5ss1u6eIv4z9QFykvwKcXhFHJRYKOreB5sCqRaxg80eTX7ZbxMoEEcsqnvRV8hwQjwjaJtIy+DE3bG6L9kdOP5Q9AwEX0MOPJFP9tzqVuejmUp12KqnD8O/pngkHTkye9kerskzVjWVLuIvcDGrqEyUtAIZCmXPQLGWelioU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LkJImJHb; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b471754bf05so4166110a12.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 18 Aug 2025 18:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755567066; x=1756171866; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SVMxilSNXLvPQiGiXg5LBRBu5PN/wWk09SUXitnTB7w=;
        b=LkJImJHbyPk7gFZUWXECpWmGU3gPqZrBM0NiEPwFya/uYqNeQORockdU6nWG2uLcrS
         EN+7ANj5gEDEwx7CYh20wUTwLkBML6zxJBGVsMnDMm+7UYi0qtoLM0TPlHYL4q2nn4co
         ogo+md38gn9MP2Qoac5ZxmPitYmhOo6bNb4mYE8Tk2lipi4ZdQs0AgXH8TRg2AlXt9m3
         QXZWDDeHGoyKmNHfGhWSNBtNlmiINLixBXGAc7WRowHP5XDppbgY3CdnOFuTAsLr9EN0
         BJHb9qE8nvIxV7jpfow+ZqHFIK6BR3Z/10JX0kZf+39YqDqubhmROw0x1AeIY9sr0qSi
         fkQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755567066; x=1756171866;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SVMxilSNXLvPQiGiXg5LBRBu5PN/wWk09SUXitnTB7w=;
        b=Enml50ej0GY/DEnSlDvkTYEt7RdemmxUZhdifxdO7YyscSyEsNSDxwi9G35tcGASdb
         uWf7AZyyvHwxvoRhyNNnN6jGryAkvajWU2u/WJ0fF7131qWK1QHdWMGlZgaVoD371mLc
         rr5Oq64OmfGXwdqmZf3LGrrCSj4EpuNU/xOnx6Ref7oeuWoiub4B7vaQRPrRXNlfzNfa
         PQ78ohocMg1DRdepoBG/CNZW6QFqF8bs5KImZdobRSBEHSBecWI+ICYqpj0Q09ZbqO/N
         e+lE1Xi98d4P0bG8ymckep0vINcZJ/VB6giFYvDolU+86BnpypHEUKQ0+aRbzLxOQn5Q
         XuGg==
X-Gm-Message-State: AOJu0YymnIzENGpqSKrMkh2OIiW4+V7ltxOiN6FCPxXN41cktDOpg9CU
	UsLd/Mzg2CSwXzH+mamEtJYGGHzK9wa+yYF8/I/8a6u6+2e/qmPoTXVwGvbLr6okBm7ne/ZT3iO
	Xb5o5UJM=
X-Gm-Gg: ASbGncuYVNb6WJZAWyorqP9WlA1E6KcKZgcoNGMZWalrCU9XYlQpKhKYgLpRtBdqk/G
	HPmF3+uTSIAK/dykFuYn7lSrM5tJ+qu1Fl85XtcN2hRazv3nlA+NKeyP8QdxwiqC/5GZ6R4smKr
	CfdNkD8aclOCZgG0+3Lo4Qbl8bCc1sa4YebsQYiCAKhCyXd5RTHFuEIad4Ou7eKXzBuu67yzTLY
	Wv/2Zh+3684FAaGJ3xOi6/Jwl5thGdtpvHo6MafYa4J4uKyU9ylW4c4j0ukKvaCsU6D0ABN4xg6
	FYpzQ5N1LCUknb4xL9TnvtQTzXOpVhbvJ8XEjBczDbVZNvxCIKveY4aoB2ccivsOir8/5uLeR+a
	vJ/M76EfB9dP8EXybTA==
X-Google-Smtp-Source: AGHT+IGfoK6ZCgI7/QGs7e08Km8ULhFfPzNgzu/mb3QHcvsnthH0cEgCmcKcsv61aaqhXTq53YgSvQ==
X-Received: by 2002:a05:6a20:7d9b:b0:240:af8:1758 with SMTP id adf61e73a8af0-2430d4d554emr943932637.45.1755567065819;
        Mon, 18 Aug 2025 18:31:05 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 18:31:05 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v15 00/13] drm/msm/dpu: Support quad pipe with
 dual-interface
Date: Tue, 19 Aug 2025 09:30:54 +0800
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM7To2gC/4XNTQ6CMBQE4KuQrn2m/yWuvIdxgfAKTZTWFoiGc
 HcLiTFudDmTyTczSRgdJnIoZhJxcsn5PgemdgWpu6pvEVyTC8IpV9RQDZMGpiHWHO5j1UBwAWE
 MaYhY3UBpKpRqhLXSkkyEiNY9Nv90zrlzafDxud1NjK/1Wza/5bwGCtqgMJyhaUpxvLq+in7vY
 0tWe2Ly45WU/fNk9i6aay60lbVgX96yLC/VvWogHAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=7927;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=n05dBYMnPbyyIo23Q0QMyafHo1VFW+j7Ak5lshRs6ZI=;
 b=aHDuF/UvpQKo/pw2MtE5W5PD9Hkq9NuBoiPYz6VHywuv38eAjlKyicyc7+9nxMyXaSrs7qdat
 DsP8Qbqh4aIBoDxFeY3/9iHXG9V+HexB1Stu6RHAonvblxS181LHLoZ
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
Jun Nie (13):
      drm/msm: Do not validate SSPP when it is not ready
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 436 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 10 files changed, 409 insertions(+), 255 deletions(-)
---
base-commit: c7f3b7e47fcc7bcb5326275e38c203770e21357e
change-id: 20250706-v6-16-rc2-quad-pipe-upstream-560355d3ff4f

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


