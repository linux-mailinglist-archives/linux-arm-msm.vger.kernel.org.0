Return-Path: <linux-arm-msm+bounces-45416-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F96BA1536B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 17:01:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A9ED63A4F81
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Jan 2025 16:01:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 32E6C19CCEA;
	Fri, 17 Jan 2025 16:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jlukbUK8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F39A13C67C
	for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 16:01:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737129670; cv=none; b=uBnk4cCGWyQMYFoFBdQhME9VFzi2V+zAoqMJUg61I+U6z9P0IpzMXvqG4JvC80XDafinPPg9Ei7IlGlHb12ydMtmcwRYUCSzN7fvo4bkMfvc7zSyhVZKMte1dq8eh0n2vXodMAwCAugjmhmPb9ag91mqO9Nle3VJcgqreS514Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737129670; c=relaxed/simple;
	bh=g4wHki1acUZ4SGxtT81osJ+lxPcuS+NzxwZWfXfKlgI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OfRjSr1fNQGJLfyfGb1D25wKtd9jLAiW6MxglvGB+DOlSCQlhg1ptSkhSshg1Sc+KTapa0SkiBPRaXxsQnlNuCv5rPfFFr21D03KER2KidICcWLZHv+zhb+g6N8ZUHiD4fLBXPANTHOmvwW6798VjERSrv4i90vC4+9+IRl/cbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jlukbUK8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-21661be2c2dso45371375ad.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 17 Jan 2025 08:01:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737129666; x=1737734466; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
        b=jlukbUK80Q4e56SWP01JhH6dNwvOhdqiQleJVSlfMAb7zxpYOQgms5r6gw4/RomZYZ
         fMBvtu9e594eqoik2oKHV93xGeDtA3fYrrKluCqU6OlUelh5vJ6RXVghPthU/dcBKc7a
         A5iIRubf0CxUYfNJv4cKZmpCk5TOv2f3e7ZkjpyfZ1zO9UhtqL2YknVR0EheuIYrHbMW
         ZV4pw4Z8ZFqzZ/oEE0ULC/66jByf2n8rnlxaIcKWMPFqksWu5oaz7/pbO7v9eN7iAe2b
         /fAnR8Umwwss1XX9CXZ2xm3x9BDx0R6FyVOrgK4eRE2fxptlofhYmzOYUY/Khz1IEToM
         tb6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737129666; x=1737734466;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PPKBiO+R3EgZx77A0TPWnAvVcvrAKMzeINEZaeXVJnE=;
        b=AYxQwuDnBt6lybRW3WI+86WvZ8rPhN9RLbmHYeD+XYvlqHHb63rRS0rs2otaY7H1s9
         EB6ApltlnfHYeh2frIQW3H/FE6WkeGX9pe0LLRWhl9PFH+excIGgJOZ5oypGyCHJVbef
         rQnHVsmHqBg5bxdYeLOTZwLVNmjVx5I0cVluV1OHzXhz8r6JepYYPycS8TgaSIXFV5Kj
         PTIopDqurhj5zd9C1ban1bGzkxoaoA1G39OtiZDe14BuYTNP3DvhnVNAHDZ73Bh4RZv5
         tD6TWCNfkSUnpeDdt9ALP7jRpJLlhwiB9/5z3h0JSICeLnzJfxgi3GFhF8GGG5Ch2rcD
         JmQA==
X-Gm-Message-State: AOJu0YzmO4xz40zs03fLeRNGIkTvpaz66WNSPmKJRhPfWXLc4pPvoC2i
	GkW6pQ/ROW/mPI/j9VOEvPUTHdCTapBkAX+47xfJru3//Sq4p1+qcf0JynqPjx4=
X-Gm-Gg: ASbGncuukupQOUDUWvE/+3/YBed3Xbv4cq9fBdSx5nECYkegnBrVuRgZDC180l4Vc5k
	Zsz/XaJ/j8up/UdIH8tVpjXgHoOunlLZ51TI5YvXPDztcVv73JnO86mmmcz6rWOww79qHjfNhH6
	PP8SsD1/Xokuw0CSNDZpILD2hzvh+uo23PWnCEh79hz1s/8Vu+jWN91mEvkmxlB0EZ3n2VCFZlO
	lj36nHJDLmPkQzjD3fZWT0DfUkJ1mrnobVSJOwC8r4VYlZUBD+Y5Q==
X-Google-Smtp-Source: AGHT+IFCeX5eddePBHDI+lbpSYeds/KFM0/bcoTWVb9canYO3oKiBovN+3CGC03Ilb7/N7Iwi6Be2g==
X-Received: by 2002:a17:902:ea02:b0:215:19ae:77bf with SMTP id d9443c01a7336-21c355028e9mr53570145ad.19.1737129666083;
        Fri, 17 Jan 2025 08:01:06 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2d3e0df9sm17879755ad.196.2025.01.17.08.00.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jan 2025 08:01:05 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v5 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Sat, 18 Jan 2025 00:00:43 +0800
Message-Id: <20250118-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v5-0-9701a16340da@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKt+imcC/53NSw6CMBSF4a2Qjr2mLwo4ch+GQW0v0GgptkA0h
 L1bWYLD/wzOt5GE0WEil2IjEVeXXBhzlKeCmEGPPYKzuQmnvKSMKUi+ViWFVQETMHgLFs1DRwv
 epgSvRVtYpjRH1B6EgE43lkvLK1Mzkk+niJ17H+CtzT24NIf4OfxV/ta/qVUChUpWsjEK71qI6
 9ONOoZziD1p933/AndkG9LtAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737129659; l=4678;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=g4wHki1acUZ4SGxtT81osJ+lxPcuS+NzxwZWfXfKlgI=;
 b=CDs/fiB1Bs+rHnEJlPaGI1fKDaA9SzbRS4cYP5EftnVMDeA5XA2eTwmk/z5R9xQUw2/jodlEP
 bYJpeUXDWuCAxS32iWtY3cgDvQCowwve9gPXYkCcfJLYLbd1MU56fyH
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

Changes in v5:
- Iterate SSPP flushing within the required mixer pair, instead of all
  active mixers or specific mixer.
- Limit qaud-pipe usage case to SoC with 4 or more DSC engines and 2
  interfaces case.
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  75 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 404 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 517 insertions(+), 345 deletions(-)
---
base-commit: 793ba0dd2dc6a38180a82d0ad0c58920bcf595b5
change-id: 20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-fa9d24d27c81

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


