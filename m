Return-Path: <linux-arm-msm+bounces-97162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qLUgIix5sml/MwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-97162-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:28:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEA026EED2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 09:28:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B592F3014FE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2026 08:28:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6C8B33A6F7;
	Thu, 12 Mar 2026 08:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vJU+7oB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B58331E85D
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 08:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773304105; cv=none; b=aC4Vvsfiv5eLU7+/gluJa6XQk2Vo47lc67yk6xHjAGG7EEuLRp0nmeXr7kO4y8ruqKQsZCA9yNsGiD6wWygpzulvvDEaVEuUasJfydbc4wTnR5PyU35YNA76SPYscZdgY7oB1c/x4gndBnFcdONQsBe/UZOscQm7dtcX2t0jqzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773304105; c=relaxed/simple;
	bh=Bxt2U52lPL07a5OoXuzUWpyv7YqP5r2BR1OthgEnkJY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=UgOV1fZdg1YfR8LMthEgZF4yz7Lp+Z+fKdXCmJF92o4AVMm6vg/i8IDm4cmi47AXUTXyZh+sssQszdaf0LDyVJ+6PHzzWm9xTYKgxSeKl9mb86hZ33QzdSipjhKh26LRIphYm2XwEwLrBRXckqHLZ4+JgymzE6atQJ25KIzbKN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vJU+7oB2; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-439b8a3f2bcso573700f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Mar 2026 01:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773304102; x=1773908902; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q5FWNw52AqfRLIosB7hIr4R97cM/INhjIx5gerYZpjY=;
        b=vJU+7oB2ab1b4dJFTMbr55RDSI6EyBCt6HJGgzet+gkwITqobLROWCaFfv8WHPC5+M
         DxM/BXimZXJrmFmuzaA4kk2f/P92z68dqMQ0wXtIKdOHcFUgW2b8lbTzKOHNtDI+iWqE
         /0oi7g5kYbp0k7loXC7YFJyd+lxFkp8V42Db3fcCWliT7WAnn1H0P4unxbcg3Acwx3KU
         /e+VoDJJpUbZP7n0uz+it2WJCAMwmUZS2VbRRF2+7NmKmwZCGOD8bHKnLmKuhRKM1c/a
         Ycc0pcad1f1QYG8YC2NZXgmn7CXFqzW/05KfqW77MNkNdzDr42T6aZyNp/BtffLBXPU8
         3+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773304102; x=1773908902;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5FWNw52AqfRLIosB7hIr4R97cM/INhjIx5gerYZpjY=;
        b=E8NjNh3+XAj9ROEuikm9HMSgyeSzR226zg/iab8kmGsCubDtfcSUp/3c75y/CgNdYW
         t/hf/ZGFLkC0aqovqv5gERekdvFj4TNrn3vYZZU7SR2waNjO2kQTbXF7Cn9exPU4sMb8
         2d4j3z4scKRKxsCvcrgsjt89ydS0stQ9rWhh900W8eD2gP8A7YyEfq6hXeaHnPUvzFxL
         TRNealCq5IzHFJNMhdij5JHYnXYi+c0wEyuN1IqdHXH8dRYV9bxNNeO8/83d99G3850i
         SvsQWaZASzG2OMDCg3oiC1hAObTOesZPzSdlBWv1whwqaLtf7NiPALXaq0RoXS6yZxew
         ENuw==
X-Gm-Message-State: AOJu0YxHvEay9GHd6kgw3uIM2TTstwV6HvWenZr915ibO+f8BJff1sor
	WhwyOZfD/LsngxFY8Ht4S7HLAAytSP3e8CYOFxcIQvki6KjHEW2lujDnwP2Czkn6QPo=
X-Gm-Gg: ATEYQzyy2VaFealVh/3BrOSOJckRrEX6+fkWJZ6fCElEIavVd5rOkHveFOgeoW3fdB6
	2uiRcWhmv7hjKNevV4XguKRech4QqaxTRhDKN2imaxiuSMxVJUbgwqDqpc9stifmjv5tOSonwFq
	SA/xQn+KwrwIuwIsia3eKq7VBy5/uYfob/lOkft7raebsR3QGp662xVrUqtcTKf2OuYqbv4/vVT
	N3lK0htjOE8Jgxsp2NCJTdGQQ15p+r3iOnYIOwOf5LqiMMYVvlcPHObQpX1QaqX+oL1NQUqDUpj
	G42u1HEkbPPxqpUHCpP73MN5dzx0Idc9ME6w1J2cGLzcDFFMk7aCUQgX54Xt78WTZjLwOP0cHnA
	BCKXkw/GDZakrH1xi92VF2TPSlIJ3c4YRJJQZm7qenxUfh4B6QLmFjKvY8mQc0f1kfJLPsIuETV
	hoQhw=
X-Received: by 2002:a05:6000:2283:b0:439:b5f9:eec8 with SMTP id ffacd0b85a97d-439f81bdbabmr10110387f8f.4.1773304102278;
        Thu, 12 Mar 2026 01:28:22 -0700 (PDT)
Received: from [127.0.1.1] ([2a04:6f00:1::ee:b:1015])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439fe219c41sm6273780f8f.29.2026.03.12.01.28.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Mar 2026 01:28:21 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v19 0/4] drm/msm/dpu: Support quad pipe with dual-interface
Date: Thu, 12 Mar 2026 16:28:09 +0800
Message-Id: <20260312-msm-next-quad-pipe-split-v19-0-4ffa2b06c996@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABl5smkC/43NTQ6CMBAF4KuQrh1D27QUV97DuCh0gEn4s0WCI
 dzdwsa4MS7fy7xvVhbQEwZ2SVbmcaZAQx8Dz08JKxvb1wjkYsFEKnTKBYcudNDjMsHjaR2MNCK
 EsaUJbJGrQqOsKidZnI8eK1oO+3aPuaEwDf51vJp5ttd/qPESUtBYaGd0pkorri311g/nwddsd
 2duPpbg8pdloqUMV1wZJ7VUX9a2bW8TpIgFEAEAAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773304094; l=9802;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Bxt2U52lPL07a5OoXuzUWpyv7YqP5r2BR1OthgEnkJY=;
 b=DfRM6Qg12+CoEvCgDlM8Y51ql4z27UBxOlqN9JkB2d2oABbmVzcjSPAQLop5kFNaJrcBuKb0H
 GSBxBNDMHWJD3iu6x7Kqz6z4Uhvu/cSb5F1fXUnP1PtWFJtnZSZ1jYU
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-97162-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 4EEA026EED2
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

This patch set drop the merged heading 8 patches of v16, only the last
2 are revised and split into 4 patches here.

    Changes in v19:
    - Refine the plane resource assignment to avoid unnecessary argument
      and operation for non-virtual plane case.
    - Fix wording in comments.
    - Link to v18: https://lore.kernel.org/r/20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org

    Changes in v18:
    - Revise the deferring of SSPP handling and comments to distinguish
      assignment of non-virtual plane case and allocation of virtual plane case.
    - Always assume 1 stage in non-virtual plane case when splitting and
      mapping plane to pipes.
    - Revise topology decision making and comments to fix possible
      regression.
    - Link to v17: https://lore.kernel.org/r/20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org
    
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
---
Jun Nie (4):
      drm/msm/dpu: Extract plane splitting into a dedicated function
      drm/msm/dpu: Defer SSPP allocation until CRTC check
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  84 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 298 ++++++++++++++---------
 7 files changed, 261 insertions(+), 164 deletions(-)
---
base-commit: 9ca80c3d6712fcd3d91d5123f49c5ec47fb4aa1a
change-id: 20260121-msm-next-quad-pipe-split-ab95b6e3ffd3

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


