Return-Path: <linux-arm-msm+bounces-56968-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 08B97AAC9D0
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 17:47:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EF5671C27CA1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  6 May 2025 15:48:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EF522836AF;
	Tue,  6 May 2025 15:47:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qDYLf2nZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85F525B69F
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 May 2025 15:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746546466; cv=none; b=UQnFhBY32sOTVstIEcKwn86xHlSgGY1sqTZsEuoHR7bhScQRROiX7BqpBxpA/ispFGI/YnOX56ouBd39enTqLJ/3rtaG0Sj2fouTPTdhO0AgMGmZPnog9kKTeYg0u2FRD3oBr7xQXpryqHGuIaMQtiDNdrQsITste3KhHAkKLlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746546466; c=relaxed/simple;
	bh=fRsSE07MO5RUSBN9OSYwWzEbBbJmQQggB3I2E+b9zdk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=AbX10VFN/BTKiVJgmc4wmra8OTVYXMNFRRz8+3To4KIskrbMQMO+9ZirdxSOqoylZaa60zX9QvHkwbMUWo2e6VoNWPqie37mU9kqMPPcwMEXM2EgvTYPaqy1nU1eH7V8S5EYnJQbSwMecVoVL2hSvQKIA2Aj9H72kY/Jle/a69A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qDYLf2nZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a99cff4feso604739a91.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 May 2025 08:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746546463; x=1747151263; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NsrOsUBqCO5Q5SZFn+5AGarKR0SfFGjvJfXesi7IMTs=;
        b=qDYLf2nZ3FMfPRqEabr5SU2yljmWU4djB8ut/mJ2s53m44SF5rV1tuRa4z2gXtacPs
         WfonkrVLgrF40O/BF/AXORWh+N83l1xJbEqKxj17ayFDsOqBSf5n8ayu99THgkXS0aHA
         ZlCu3TI+tK+gGZ7RpBx7ge/RgpL6aSVayfRd/42fZMsAA8VzIi8hRbCuQ65mFq+lz1CW
         /DVnZmvdoLVGyoOTM2l9ioE0lUtCB1EW1lSDvD+ncPSmKDpIfLUpbjA5Ehz2sRsS3Xf9
         FBsDyggrAa5Bo0m2LKfRT+L8dyvQr/1CDY8UP0L2hxSG6XtADKKIf3P2UWOIrxtGsC+b
         D0cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746546463; x=1747151263;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsrOsUBqCO5Q5SZFn+5AGarKR0SfFGjvJfXesi7IMTs=;
        b=WjVmiZypzYXBLoR3UXCFBWZC3vn7LajuYor+IXiBME3dPGKShXvPCnwWF+Uz4ZvHaH
         /KstcpGQ0MHg9ERhv1KmVcd6+S3TW9+Z2d5XD5sRj/9vJ2Q3qaULOJdVj9rmk3YCnHZo
         P1AS3JaV/MSaXIkjuxCfePXd37m9aOOqlLNwTJQn3IkW+8O2THVyqJ2mm66P9LIYiKKr
         9bNbpwnhxhxyp6f4lLAD6kQU8ATWsgtKhGpIMYrlcoVWXHVydwuQQq5OjaaGGjUOH1R0
         Se+xRimqzNHtiRJgj4PsJQ1YX7PWQB4e8NapWAoXiFo6d7V2rknVUHbSiSFCGysIyIbF
         2FuA==
X-Gm-Message-State: AOJu0Yzi4v8KdeEJMcEOqMswY5Jlep272G2LpyAlWgz5PmdZ9nfJlcWl
	NKAz3iNq3iaus5MwmR9559rhkL5psfPniPLSOSdIkzdVhbfi1xmKSTIZtUQjg43n9xfQAZ7doAi
	TclCsYw==
X-Gm-Gg: ASbGncvWBKafJra7xkKE6LyC5oy+f/T5vt733tunAHRTbzUwPyzUjyVJUlM0s/0rMhd
	T9F1IKdPsRcYGBwiF7957ZO0Cm6ZkVB/YO2R+NR4xkoP+lDUM184+PBAW3SOm3etEGvRP1iTMau
	HwtK903gSIucRaIpGs0jzlM8eEkZEi+TCYilFs/gNjl2llvzVTLhGnyiDli/G3YiMVlLfbkvTC0
	6Wlja4YP1wdvnZ+FcZQyTXLzrjL0R2dy0ih4iHdpbkH3XNOic7XRPLVWZ9TIekUQU4LE+4wRzRt
	yeX47fIpnHhfv+qe2in2S6gyD9qE8EMQhyx23Q==
X-Google-Smtp-Source: AGHT+IGYXZGu5JQQL5rWHElY0maLlBnpq0XUa98OP7P+l31dS5z2od40yCJMbghY3JLbEzXjU84fWA==
X-Received: by 2002:a17:90b:562f:b0:309:cf0b:cb37 with SMTP id 98e67ed59e1d1-30a6196ef18mr17984829a91.7.1746546463540;
        Tue, 06 May 2025 08:47:43 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.170])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4748e83bsm11495999a91.22.2025.05.06.08.47.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 08:47:43 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v9 00/14] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Tue, 06 May 2025 23:47:30 +0800
Message-Id: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABMvGmgC/x3MQQqAIBBA0avIrBswKaGuEi00p5pFZZoRhHdPW
 r7F/y9ECkwRevFCoJsjH3tBVwmYVrMvhOyKQUnVylZqPJNx6NkTJh+vQGZDoxvp3KRtbTWU0Ae
 a+fmnw5jzBwTgcDxkAAAA
X-Change-ID: 20250506-quad-pipe-upstream-a640ddc6b1b6
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746546456; l=6078;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=fRsSE07MO5RUSBN9OSYwWzEbBbJmQQggB3I2E+b9zdk=;
 b=epsXReT144s5pEJd7o6nTP7dmucju7dZPM6w4s37QKyOAtEO+QdijmP34TGUgrfVTKRPN0MgS
 kkAvAHBS9dyDt+F6s0WDdzT96oK+YVrBEYHFtOhwfWzCEjbDf5N+Dd5
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
Jun Nie (14):
      drm/atomic-helper: Add crtc check before checking plane
      drm/msm/dpu: check every pipe per capability
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

 drivers/gpu/drm/drm_atomic_helper.c              |  19 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         | 115 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  43 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 408 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 11 files changed, 403 insertions(+), 247 deletions(-)
---
base-commit: 227403a8562686275197009528ff9f1b440cb20f
change-id: 20250506-quad-pipe-upstream-a640ddc6b1b6

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


