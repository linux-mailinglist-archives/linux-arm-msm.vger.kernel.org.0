Return-Path: <linux-arm-msm+bounces-45194-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B60FDA133AF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 08:26:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BF22A1672D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 07:26:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32D06192B96;
	Thu, 16 Jan 2025 07:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Yak7eSem"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71F0818D65C
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 07:26:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737012363; cv=none; b=se5tJoJiE70YVpb260ijsGgL0IZHV99o/ryRAM+z3gy1w9+qoduS+XbmquLA4fVo8ujkDmJdVBFf863a6VUL+sjYGBTFVVadzBGk2glh/7A8Ke/rYYrTGelZbYFlFH6RQFkGOfTrF7330/Cjt/SHXX4C/c477jYdksTEEfZoALc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737012363; c=relaxed/simple;
	bh=iN3rkkVVQ1U6oQTbbwJT5ewJ9MwWXVsxDdoLcCK8c4k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=EpW1Q1f+rathhpNL4Z9q8uDWXqh4ajKevq04vTLVC1MosgD9w96AcS/n9M64hHRVIrsOrf9/1u7CVO6yqvzDbEVwkCAZfEu+lrSVzTInGrJU2hyDwby8TpgSHrqrO1lXqWTpe2zJpuzZyDpgrVrk24MYTaGxy0FiA2vtb7e05Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Yak7eSem; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216281bc30fso13447435ad.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jan 2025 23:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737012361; x=1737617161; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=gmSZKP5nRN+Q6NlmFK451aMopBVPJnHJqMeCmEC5sBE=;
        b=Yak7eSem6lUk64F1jE+bVAaPOxV8mlOT+Us0yUxKQnmlE2X22DmYvU5kuybYS+RmkK
         2lCtIYskcXCVvzjb0iO0p5/Vsc5Ev4xdvxUDmbsv6Cno8fNHPxzReUXgk5rNYSEs/hF3
         UVllwngZ7nU3jnouWt0LuHGdeXKE7PlbL633qkYaCtA7Q0u6ZL8gaG/lv3j+GsKo5YHu
         pF3+cSxnbtIQmZUJGF1lrFJtUS1l7les173koML7fjrvwHkha2fo8zLDcKuIgoN43x84
         tSfZFYgoFVByHZIw9K9I4ar8yxY2EZAiYEJ9164Ug0nHYc7xgyMgXe63Oh5a20JHlhLz
         QnFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737012361; x=1737617161;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gmSZKP5nRN+Q6NlmFK451aMopBVPJnHJqMeCmEC5sBE=;
        b=cwpXI6uDipYGJAPOBmi5Nh7dx4oL+kcxjD8IwC4o+4wZMOOoawhFy3WDS2BQWpSsIp
         WB8UICZhFMRJaZgBvD6l3Vxo/1m6GmwUNcF7hs0UvmGnyi9S477NS7dZ+1Z/CrhJkiM+
         ogOt1clGRPNiiJpu3CnWH0TYH3cb5MyFkq/KYsXnlcuxQfRiXm7+YI+skvX5uLirCVSN
         gzEiSli1C63+T7JObGuLD3GSi5k/HN8Cr4SAPo7lNE6F0hvpFqQ/qk9bUipjwwkZi95+
         NjtD4wmGDVaJ236ScLM+frQ1Vu6qMGMNie6mTwRKqvtWeaj9kWe1qQqtBssw7akNR1By
         /eKA==
X-Gm-Message-State: AOJu0Yx6aneBJyhySEG+xvquOh8D0iORH5pLtdWWWzbRpRSO3T+cQXwR
	cGjhJKky/B72tOyQcAAzVBJEcMBfUCGQsuNE/9NUvgvAYiA34OzEJw5kzV7+e88=
X-Gm-Gg: ASbGncsSJ7b+cf/jQs41AUVmU2aKmkIFxFBiGcegdacqIQftpzBSuOFbeACKzsziW42
	SKtQ5CLVTRKelR1xLqulu5I33qwjaC+IsU0vRDsJUrh2bq/+TlBmHJ02ErzskDjNMh5fINlm++r
	FZUaQO2xikGnnwkJEHaJ1O+B2UXBfI1W+0go/0606KILg2SRIwi3txNPf+UUShNTGaiBoa6nHtF
	Etyh44jXhMEcoKQBl0jKvOgBsPCTYOmFAEUDjKQNiO13hGnJMhfFQ==
X-Google-Smtp-Source: AGHT+IFTIvI5EkuaQ6KqfaH3qw31GwmqkJoOy5oKdbitVNylLzy29o6du0CVwp87h9+cDIRz70pxdg==
X-Received: by 2002:a05:6a00:6c89:b0:725:936d:4187 with SMTP id d2e1a72fcca58-72d21fcec01mr42147603b3a.17.1737012360682;
        Wed, 15 Jan 2025 23:26:00 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jan 2025 23:26:00 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v4 00/16] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Thu, 16 Jan 2025 15:25:49 +0800
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH20iGcC/x3Nyw6CMBBG4Vchs/ZPegFEX8W4aDqDNKaIHSEmh
 He3cfltztlJpSRRujY7FdmSptdc0Z4ailOYH4LE1eSM64y1PTQPfWew9bAeU2awxGcojMyqeK+
 BsS76KRIyvMcYLuxaduc4WKrRpciYvv/h7X4cPy25C2yAAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=4359;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=iN3rkkVVQ1U6oQTbbwJT5ewJ9MwWXVsxDdoLcCK8c4k=;
 b=I9iV2vxjX1FrPV/0K21/6N1u9Xo4urLeZKSu8Im1n/io/Imj14vC4Epxxqht1iMJjvg/eHh8s
 mrvGefbyNRHB/kjUkWDaXDjffJ7Bg0QfqaQ3zZ8irs1uj6JXNfrjnlG
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=

2 or more SSPPs and dual-DSI interface are need for super wide DSI panel.
And 4 DSC are preferred for power optimal in this case. This patch set
extend number of pipes to 4 and revise related mixer blending logic
to support quad pipe.  All these changes depends on the virtual plane
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

Changes in v4:
- Restrict SSPP flushing to the required mixer, instead of all active mixers.
- Polish commit messages and code comments.
- Rebase to latest msm/drm-next branch.
- Move pipe checking patch to the top of patch set.
- Link to v3: https://lore.kernel.org/dri-devel/20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org/

Changes in v3:
- Split change in trace into a separate patch.
- Rebase to latest msm-next branch.
- Reorder patch sequence to make sure valid flag is set in earlier patch
- Rectify rewrite patch to move logic change into other patch
- Polish commit messages and code comments.
- Link to v2: https://lore.kernel.org/dri-devel/20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org/

Changes in v2:
- Revise the patch sequence with changing to 2 pipes topology first. Then
  prepare for quad-pipe setup, then enable quad-pipe at last.
- Split DSI patches into other patch set.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (16):
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
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: support SSPP assignment for quad-pipe case
      drm/msm/dpu: Disable SSPP multi-rect mode for every pair
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  85 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  76 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 405 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 13 files changed, 516 insertions(+), 347 deletions(-)
---
base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


