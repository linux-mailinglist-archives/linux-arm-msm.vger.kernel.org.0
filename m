Return-Path: <linux-arm-msm+bounces-92799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id +DEHEP87j2mtNgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-92799-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:58:07 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AE3F1375A8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 15:58:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 63B193040AAD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Feb 2026 14:54:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ED0293570C9;
	Fri, 13 Feb 2026 14:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VGGU+vr9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC2B1C5D44
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 14:54:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770994482; cv=none; b=D4GeeIftnPY74Twsi8qtAUaSJiyJAJFobbxSjvAzEGcDyw7BoNoQtVNWfQxfG+x58TwU6lgHdoW2Y7Hb0f01UA8xLML1NrjTfLEzWd6CqrNSfjtIS6y0/xbjEj8+CKVMdfqhd4r1myxO6gV7qn5BA+EsP/JueUNhVHRVDTLq4bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770994482; c=relaxed/simple;
	bh=ZSr3OfkGh211T3wZ0jypVL1pBqVEzf78zH3ocJwHf0A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Se/azjTSlPrQYTBRkZUM+pp2KpP+1+XdqSiftmO51ZvXOe0RUIGDJCEnT1VUyF3aQbmdwUx6uZaxm57m2xqy96g9KMjaePB02fPWG5HJHSAcmEKKWUyvXlSNyKw1qJT/Lgp6Co/Xn0Zr94+EGf0HUVCLDNpaOHnIT6UuZCbrYrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VGGU+vr9; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-354c67da885so838818a91.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Feb 2026 06:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1770994481; x=1771599281; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rletUrcUN7ShAO8UQiB2puJZzRLEZ+mDGtAy0YaJSRI=;
        b=VGGU+vr92mUCyuC/AgZzcGDFyP8Be5FNCctMqE6EoIwIpOLeWs5+/oAqflIgAyLT/l
         5hs9vGNiVO2RsQGVl9yZyIjypZTFoXkjc7QmKfTyQd6D9njA8XC5QJ1xmN9kpBSKKEL1
         9hVc5aghokLGYZguQGqiKHOvsJGtDdQlx9Sy7pR706UeOldHCRTLmRePmr4YWi8bAsBj
         uXkFRj/Q+WLJkc8/fTJ4Tyz3A4dZHMijx9KYZfJbziIAhuCx6EsRGmEexCxI6mPLXkhi
         rWrIjpdEM+NrQeym0H4NLp87RmI0skKDchULvwU6ENtMV0rKi85dxgNwnocp62JqI8II
         xf9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770994481; x=1771599281;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rletUrcUN7ShAO8UQiB2puJZzRLEZ+mDGtAy0YaJSRI=;
        b=EuHKQqLKN7ft+tSXhDKIB5l+S25JvlzflCrlkUT1LcdZ5NMCGTK8YrsSCiBKDlYd/T
         mVK4pL3lDaznMDZjSRB8GHeID3UVqhSPk4xdgYbTybWUjWU51ABxgvYRCJzu3e+/panY
         J9BKm5KsJL9O2rVm7XWLuOnM6ejKVWy31dazXFs+sGoEXHY8YO5ugyJwWlBz1B9HKSfR
         zkeTEiCfcz4VjNoRQwgKdMqrzX6MTw65nIeh2VUcDsUkRLtvIeW9OznfXNTpuUoNFZrJ
         msAxJioZo8xXr8xLffgnYyW6DlOWTwg54C/iM0tR94hvtr7NwwtYfqBEfmKaZ6Rel6bB
         LNUQ==
X-Gm-Message-State: AOJu0Yx0Wv8TLQ6/2GbqccpFFFVDp9R1HiBjlOITIwLftRU7jv9jM1dA
	HUuKo5p/1AQl+VhVNuK8qv6reBAkGpunEU59tzopXDFF3T1ITVmW+dfeHwoCbEFjjrQ=
X-Gm-Gg: AZuq6aKHDhP42NhSSiPsL/DvISDJEUFk3D9sGUVBNP/+CCMVYEvYGcrfRLWkVu5BWZk
	BJYKvKB03VwfTNJGSDNuQVDRdrKzDxvkkfAsUS7b87dtoR1dyUgN/rX0Esdqs7lUDWz4k/0QNC+
	grnq1K3J4TLP7g+avZt4Ytir6aXcSxfprXx453KbDlCW+S5Z+EPKEfJK5CkMroEcxckj0jG6vWv
	pxBKRusYI4DCCoTF6hbL620yHAJ2yQJwo9irQW/kD2iD9/cj7UMAxVPYkHFQy+g4E6g+kK8cBWu
	q7aXI1lTgIZDfZ/8Eu/qVjUdeGHscejElMLoYMnNi951IsypiSdyaBj4qw6bWMr3zAvJtp0UC9h
	iiycpRJiWTYNDuaRWRzPZU42zmtvEOYEbZs5aHdmJRMwMTKZQ9UtFJAbuqS51P/9E/mch3eY7R2
	joSsWJMXjmPps1BlbwjAkpLec9bvxbUdrPq0dIDj0B6pl728f5QdZATow0
X-Received: by 2002:a17:90b:4d86:b0:343:7714:4ca8 with SMTP id 98e67ed59e1d1-356aabe97bemr2406501a91.15.1770994480428;
        Fri, 13 Feb 2026 06:54:40 -0800 (PST)
Received: from [127.0.1.1] (210-61-187-172.hinet-ip.hinet.net. [210.61.187.172])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567eba9b2esm8814759a91.9.2026.02.13.06.54.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Feb 2026 06:54:40 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v18 0/4] drm/msm/dpu: Support quad pipe with dual-interface
Date: Fri, 13 Feb 2026 22:54:24 +0800
Message-Id: <20260213-msm-next-quad-pipe-split-v18-0-5815158d3635@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACA7j2kC/42NQQ6CMBBFr0Jm7RhaQkFX3sOwKHSASaCtLRIM4
 e5WTuDyv/z//g6RAlOEe7ZDoJUjO5uCqC8ZdKO2AyGbBEDmUuVCCpzjjJa2BV9vbdCzJ4x+4gV
 1eytbRUXfmwLS3AfqeTvdzyblkePiwue8WkX1w39YUxNzVNQqU6uq7LR8TGx1cFcXBmiO4/gCl
 SDVGsQAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770994473; l=9506;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=ZSr3OfkGh211T3wZ0jypVL1pBqVEzf78zH3ocJwHf0A=;
 b=+OLtsXJbCj7Zu3OYwY4zO2kwlUtN1QHn2RA9MV1/L7tNmXTXnn6qos3BuUkcPXAbsrzNSGlXw
 8FqvxMqBhAkDT3/kChVF9hnLIWCUf5mFlAf+tfsPLVCc7OcDck+qFTe
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-92799-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[linaro.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jun.nie@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 9AE3F1375A8
X-Rspamd-Action: no action

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
Jun Nie (4):
      drm/msm/dpu: Extract plane splitting into a dedicated function
      drm/msm/dpu: Defer SSPP allocation until CRTC check
      drm/msm/dpu: support plane splitting in quad-pipe case
      drm/msm/dpu: Enable quad-pipe for DSC and dual-DSI case

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  62 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 320 +++++++++++++----------
 7 files changed, 250 insertions(+), 175 deletions(-)
---
base-commit: 9ca80c3d6712fcd3d91d5123f49c5ec47fb4aa1a
change-id: 20260121-msm-next-quad-pipe-split-ab95b6e3ffd3

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


