Return-Path: <linux-arm-msm+bounces-48217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id C58BFA385B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 15:16:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 9C2417A42BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 14:15:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B6B021D58B;
	Mon, 17 Feb 2025 14:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+ZFvHxD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD71216E00
	for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 14:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739801797; cv=none; b=Q3iIHyfBraoBmnJPSfAYtN4pTqvQm09atSC2axKhUfuwEhj4cvprMTME8mW6VBNhzt6hIrauHfpcrqSubFCjelnAO4P/RzcxTzorltVHDISvAlcahP6nGDyX+C6fCl4EbMV741Iknba4tnYVLRb1HD8ca6MxXTsLUOeSYguiV2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739801797; c=relaxed/simple;
	bh=OFImnrcWjNciYGwVZ8IHue4RaKWvGkRcm4ILoNytHTk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WR14JB7zyIeCBFhmZvYiH/Yyhk8ItpPkx9vsIIBAeT8hxbtq5OHKABy/+N01RxkWQEfIyPUdy/DnXE7V0cxHLE2lw7DQ9DKrsbkZWvMUfuAn0mVQKSn4kKGmSnvOKQ7Fh+CGk2GzDLoXAs6O0exNV7syeLAwprQle8i0oIabJaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+ZFvHxD; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2211acda7f6so27317405ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 17 Feb 2025 06:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739801795; x=1740406595; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RmMTq1yg3BdpG12biaZryVgitfDEs+8M3vo1Tg0fh1k=;
        b=T+ZFvHxDCaEN+z7QgSRZCgsFCqFAaxm51vbpEZs+en0RiQf9mMK64vjgaWxyR4xtcj
         Lsg2JJuBhZK9Ydvwp4oTfQ6YhOVyS9VVTOV9EKWMkeeSr5/AWGZU7LqVHwmMW5SjO8cQ
         Hf8ZePtKQ8X03t8iigbinAy+PpYod/v49XRcCfbORFzS4DWtnAzmJTBUKjFp+sSbQ/Zb
         Hp4cSBIHVVKFztZ1yuDJ1fnr5MzJCjBnWZmToMuWvp+QY5bE9ZJzcg+qphrdC+b+/8p2
         GyElLeufZoB47THVG7IlFbCVmqBJyBYrbAu7083WGXNHCqjUC369pdLoELf3IcwcVd29
         uXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739801795; x=1740406595;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RmMTq1yg3BdpG12biaZryVgitfDEs+8M3vo1Tg0fh1k=;
        b=fAMhnMi4IdDdb5KGfnZ1fABe729w6hkb8Ap7sCyLtMn3KjNAQmxmBq+ofOWKyTUv95
         60yBKHNMPHiI/UfvtUEKfKZ4UtFIXstOJ6sVOg8WtmaBAk6YVun9Ap15rbdzV8IJXFBF
         NBTAYfF8Ou3bn+78LmF+RypDouDMj1kUgVWK2XPVvdpze4syVRTFI5oFtJIq6dqXt5Ck
         kR0rJPzg2uDjOmzCXDMYZdSFdKHNAJaJx97wtgyWRqjCREBGRt7BsurZ8O9FjIL7ph9H
         Ew4tHZfj+cXeBkJ1F1SeoueBsl68nmnJ1CLCEfun+IEjDMMhXA/XnBYvTWLqQEnkqkO7
         9jbw==
X-Gm-Message-State: AOJu0YxG3HaiTgwXFjglMm4NXUEaS6z3Hr6oLKd4UMbP8s3nYEnPW6cb
	zpSUHNP98/BxDL2sUAOCUWmzbqYa1oEyxUmGNTz6hv9BvRi1DKscbCZUbnbKBaU=
X-Gm-Gg: ASbGncuzN2Ffg80o70kqXRby/Pun4nc2rSCifxzeJlbD0wq3/sw1cugzO5bbCD8ToPz
	rPo9BfsPxEfRiD2wxMeKpOhvSILGs5dENAy4jWw/LH3owDSi1N/l87rYCtwGcKsb/wUnoFjDKpu
	f0cjxGhrflnCTuuioQLz7LT1sK4Db1/iAw/dhU2ASFPOSRn7k9xJzFLzl8wYbfuyziIagcEJ0XG
	z+UBSPeLegQDPTKCEv4oHfyr5Kn17tLYQ3WL3fADhBwviBYOKL6YRMV+3WaDt1CUqdxJVUNQmw1
	b4P8tSe+gYNA
X-Google-Smtp-Source: AGHT+IHTUhzBstpP8pZgLyNRseCksJ6qVR+zySk21CoPLmhQjIQggRR9jeoPxxbblipKzTHwuYWXjA==
X-Received: by 2002:a17:903:22c3:b0:220:ef79:aca9 with SMTP id d9443c01a7336-221040ac0cbmr146525745ad.53.1739801794601;
        Mon, 17 Feb 2025 06:16:34 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 06:16:34 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v6 00/15] drm/msm/dpu: Support quad pipe with dual-DSI
Date: Mon, 17 Feb 2025 22:15:49 +0800
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJZEs2cC/x2OQQ6CMBAAv0J6dpNCpYJfMR4qu5VGS8suoAnh7
 zYeZy4zuxLiQKKu1a6YtiAhTQXsqVLD6KYnQcDCqtFNq5v6AhI722rYLNRnGCMC0vByjBBRBOb
 VIaxZFiYXIb3xkdLyYZczMRgLmSkDGd373nfGWKdKqEgfvv+J2/04fpj+YASUAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=5025;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OFImnrcWjNciYGwVZ8IHue4RaKWvGkRcm4ILoNytHTk=;
 b=fZZL/25fH4kWX3elYxE/IfiUQQEM+iLOfCeCeHsprloY3Z3NjtUbzGbj+wH3LXYCfbVJomug1
 scyt7Nz5rU0Byw6dQRLvgLzPqqwFZOKoDExH7GSvYunzmBjnjT4Y9bG
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

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c         |  88 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h         |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      |  70 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h   |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h      |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h          |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c        | 403 ++++++++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c           | 215 ++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h           |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h        |  10 +-
 12 files changed, 510 insertions(+), 346 deletions(-)
---
base-commit: b44251a8c179381b9f3ed3aa49be04fe1d516903
change-id: 20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-e309f9f8336a

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>


