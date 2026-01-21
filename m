Return-Path: <linux-arm-msm+bounces-89952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CPGOGBuIcGkEYQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-89952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:02:35 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 00D095336E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 09:02:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1FE77467326
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jan 2026 08:02:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 914A847279D;
	Wed, 21 Jan 2026 08:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDojYV6e"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3888B4534A4
	for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 08:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768982525; cv=none; b=dC5avmmt3szJb4pT01dVZ76RhDCL9zmSpUNtaD61QHike83MS0UJZpW7URAgacCQXAXl04GOAJp7G4cWD3DRyY+Zal5gH/hf0wa9RddoRz9IwtqPG03yQ30oMZ8BtN6nBcsiEIsnoRWaDqIQ74YLEsP2kGMZnuAusAdrD9VQluE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768982525; c=relaxed/simple;
	bh=WnMaF78Y5j5jsDtvdu33Avxi2Q4yFc5RtwudZjqJl5o=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pbM125z/O7m9USr/Ruru+vntGgofSegrBlErF3k7RCOtldF6wi7JktQdVPWS24Bi/hR/rJxm1DujhPKpP4osalRINefFvLAaXHQC6hGO3/GUKbgnJUNA6CEgY1ReFJ/ccC6pzrl2MMeC12tTaglkYvBqvgg6X791+PB49yGrWBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDojYV6e; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a0834769f0so43234485ad.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 21 Jan 2026 00:02:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1768982522; x=1769587322; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SqFvFXu0jGZHtPXoUYA9xsq2a6yDeDGBB1pPLJQJ1aA=;
        b=jDojYV6e+fZ+z0f1jwcp5M+43duHwHVppVuD0AAe2/EbIWzTPmzJyC6T+yxhZ3M1E/
         dgaXqk4QVEFtuiPB0+EPZFA7299L/gMfs/+1lwxxI5vp0VJMqpbcGz0sGW4RO8DxeTSc
         tHB3U5OSI2zCqUHnQEOf247X/r6fevH0Dou4dFrjbAQ67MI4yyx6+lvpWSJMhvfZoDki
         t5pL7kX+CV+ycAYitZ4LVGksRvD44NUIUd4fm0ytU3CMTaqvvS9wE/ImcpiNMNnFpIcT
         /F/wn6P+WtpqU9t32NN870AdVOWqjtS8M+EAVKTxf5dmHpJKzZVtPuzM/miLVy6pjhY8
         9xTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768982522; x=1769587322;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SqFvFXu0jGZHtPXoUYA9xsq2a6yDeDGBB1pPLJQJ1aA=;
        b=KCl7a6bndT82GBsqq02lbY0hF+KoEc6EPKPqEjPv34v21tbc6NHtFHOvqAzyTv4Uu5
         IUNzMNYxu08G2luFsQGDWunMq0RiXAIXPf94BWGrOTTDw4pSQ5xoPHpJfLklUPePkyUi
         tNZiTlB9PMwwrpDekiqUKF6finm2Y1vEwDlHUCskNZIJKVq+/H8XjMgkhFl9P007u1HY
         siOlZY0eSdUv9En9RhdvZe0QlSQf3DDFxqIwRBMbU4CzcPOZjQBg8zcW2oKOC1WnvMNa
         LMN9TVYlP9lhTb5KkDghMqLIsP9Ym4VP9/0O51p9anFHF6gaX2KVO6Itk3NVnUVuwo3m
         UFnw==
X-Gm-Message-State: AOJu0YyAlq7/KH0Lyl30yjBB7Bss/y9/LllckkUVIEUjOUE9iFCdWMFB
	QMDpP+/Rg/Zbx9Mi+QpzI8h5RFYQu/DxxC+72ZiLEfN3dXcMkgFIX0g9YfJmFz/tATc=
X-Gm-Gg: AZuq6aLxqSabRCz2y2PtavWgdkPH8lOIJG8FYemDTZShvROFJM7717os/SkL9OT3pOg
	s0afhJ+gBQ4RIOF7GH4P2nhnPn9mvnpK6cVaM3FEu0LBExYUkywLAmsd3HP4mZjQhTLcwQClmVK
	9ggfPAYC6iy/DDnYHYpuLJvt776VK774EBJaXLVHZ/zC4KzP0LmCwCTTHfBwHDkoqnduvzjXr37
	OIqGmeTojxBiJ6GXVIh0UyBldEKogAR8HjZjzjf1VLD0sae3oc+jqbTRKX9BGbUoRL0iVYwpY9D
	sdVWmX0TJ1ThqjNPE6KPQ417q6ToXPBcudNtXj6D3sbMi4wqimyU/W5W5Ak9iHhL/X8m4lN9352
	1G14FdWJHhWSLWccVRtNoT1Xp82BasoGWf6MN+VB28vC+pMU9kbuYRccMta/0RcqO/v0Nq0o=
X-Received: by 2002:a17:902:da8f:b0:2a0:9d16:5fb4 with SMTP id d9443c01a7336-2a7188896d2mr184266045ad.18.1768982521970;
        Wed, 21 Jan 2026 00:02:01 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4039])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a7190d14cfsm146851545ad.38.2026.01.21.00.01.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 00:02:01 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v17 0/4] drm/msm/dpu: Support quad pipe with dual-interface
Date: Wed, 21 Jan 2026 16:01:49 +0800
Message-Id: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAO2HcGkC/x2MQQqEMAwAvyI5G7AVXdaviIdqUzew1tpUEcS/W
 zzOwMwFQpFJoCsuiHSw8OozqE9ZwPQzfiZkmwXoSreV0goXWdDTmXDbjcXAgVDCnxOa8duMLdX
 O2RpyHiI5Pt93P9z3A40cthNrAAAA
To: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768982516; l=8902;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WnMaF78Y5j5jsDtvdu33Avxi2Q4yFc5RtwudZjqJl5o=;
 b=R1Viwafw2T0Yz4dzFH+erRLeucXxdiR/TRAfJCEE/4QhCwkSept65by4trdOIoGieQX2tAgi0
 xyU1bdt3XwlCD2Sno1J271+iUHMxB/EtdREq85bjEVrOZq7Q/GkrXYU
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-1.96 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-89952-lists,linux-arm-msm=lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:7979, ipnet:2a01:60a::/32, country:US];
	TO_DN_SOME(0.00)[];
	R_SPF_SOFTFAIL(0.00)[~all:c];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[ams.mirrors.kernel.org:rdns,ams.mirrors.kernel.org:helo]
X-Rspamd-Queue-Id: 00D095336E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

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

    Changes in v17:
    - Fix iommu warning on Hamoa.
    - Extract plane splitting into a dedicated function.
    - Defer plan splitting and SSPP allocation until CRTC check
      so that topology information is available.
    - Add virtual plane condition to quad-pipe topology so that
      legacy devices are not impacted.
    - Drop the merged 8 patches of v16, only the last 2 is revised
      and sent here.
    - Link to v16: https://lore.kernel.org/linux-arm-msm/20250918-v6-16-rc2-quad-pipe-upstream-4-v16-0-ff6232e3472f@linaro.org

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

To: Abhinav Kumar <abhinav.kumar@linux.dev>
To: Dmitry Baryshkov <lumag@kernel.org>
To: Sean Paul <sean@poorly.run>
To: Marijn Suijten <marijn.suijten@somainline.org>
To: David Airlie <airlied@gmail.com>
To: Simona Vetter <simona@ffwll.ch>
To: Rob Clark <robin.clark@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (4):
      drm/msm/dpu: Extract plane splitting into a dedicated function
      drm/msm/dpu: Defer SSPP allocation until CRTC check
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  42 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 270 ++++++++++++++++-------
 7 files changed, 237 insertions(+), 118 deletions(-)
---
base-commit: 837f96989da508a94e1db77e6c5ba36a60dd010b
change-id: 20260121-msm-next-quad-pipe-split-ab95b6e3ffd3

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


