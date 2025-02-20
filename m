Return-Path: <linux-arm-msm+bounces-48749-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C5DA3E295
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 18:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 469C21894086
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Feb 2025 17:34:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D9A7D1D63D9;
	Thu, 20 Feb 2025 17:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lsoLtQCM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45EEE1CEEB2
	for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 17:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740072837; cv=none; b=rz4eJ0YAg1fJU9eo0hpqiBy2pzlEdMfQNVlX65lj+CXrjujVTYpAoK7Ok4PE7EWUgQZPNsgBRz4ymwj4de6EXnJP7cHiK6qbhBjeF7yVPKIUR7PC88t7bJfF6hnN6uH8p+yRkHXRhT3zRzUFUREyfrKTC8Gmf4fy3cHTCqiQ380=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740072837; c=relaxed/simple;
	bh=EqCgfe86+0DURy8tXlhpA8RIsHVe/3u2+QzXmIRdn0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=eJinrE3HdTVBpx1MlXntBYoZaNrSeNiBux++3rS6YccOuEL5oQ8Buo2B/J1QpfDh/nBgle+/bM0ppC5zSXpkfBWHnWddwjqwDwFY461d39ard1ldqJ4Bdnp8HScnzAC6kakeGCIfLagxan04rKZ+htAUdEpR2tSf6pWoYX/MXW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lsoLtQCM; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3d2a869d016so3130245ab.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 20 Feb 2025 09:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740072835; x=1740677635; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gxER21wbdJEn1/DEOATqVDO/xV7ARnH3zJrJ/dHAsbw=;
        b=lsoLtQCM+AWZKV5wpQXFZvZVsBCeH0c2gOMQ9O+a2xLwODFOLzIsL6RVknahZwx6Jh
         DqLcb5o2qw70qrac7AmEW7/SeH/1hG+NoTf5jJ97zq0Zl5HEezZal8SePfB0DyY8Kc8Q
         uIM4Ein/mkHY4lK/li/YqgGNV6wtnjxDzDGe7bZcuXqM/k3KR/LqGoWDBtH86MeMD5uM
         LwZpSAbWAjFG+K5N5PYOsOQtFOEr03Bh5jkPXJjwDRQSzmQuthyCnwzEmRSGXjUY/F1Q
         mp2GaQHV3HC7xpCLNexmB7dadVqnO7v4++vAatdulEiWwbTqgQ/oviuYc0/lx5CI/wyV
         EFLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740072835; x=1740677635;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gxER21wbdJEn1/DEOATqVDO/xV7ARnH3zJrJ/dHAsbw=;
        b=Uq2cGJhDCccBom9xMPyMbL9a4UpydxiRcIsboCPy2SlEGTlXi3XFBGaCqQ6DM6w/3J
         E4ftlTmkzBsDjgtDh/CMz1S6CcCEqX2xNu27+O6ZdK0D966YTWCYWmQ4tFMRsxA+Y1xL
         /rJX0noPzG+RXSVTPGER6Cvrh+Jy+uCz//mCS5oH6t/EIHJiyYHQhuZwzqUd+YI2n66H
         fukyMLnwDiPU1qQ2S5LeJojELX7k66BYUs6/fg7qWQXua3En354QavrNKgB717TAeJSp
         MtNd8j8oqHUqhFiMjT22vdY/5JVfNCcCwQHAU4Dpv70AU1L2uPmprxbawR3Ipr/PxWqz
         L2qw==
X-Forwarded-Encrypted: i=1; AJvYcCVI713HDaq5qEdgCfZ1EZegGioro0RLAUb1cWXPxrQDCgV/tJtX+3HrVzlcSqG0dkkaeU1/Q+cEpioOy6G7@vger.kernel.org
X-Gm-Message-State: AOJu0YxzR1OvjUNcGdCDb+Xiqt/ofM5+9Bvm1deOStg2XrmQpLhOtLCH
	x2Oxlf5tzRAtmmAj+hB4eS6IiHHqcPJlZKiwLYXgRXdkCIkcysZjIi6NI1eEWWe5JViF/YuuxvZ
	5/eO91sV74epj7iiyEZ+nOi5ztZE=
X-Gm-Gg: ASbGncuiaoVOz1yO5k/sLp5uC5NAPANO2wMkWqV5Irng/LpXRaarA3WoYbD3PFbWWpV
	LxAwoRLk5VcxYB7fLu96gcLiFcp3T0oINKLDBc3+bW7m48zcKfEpdT6m0Su0NwAW+xpwE8SjE2S
	+mp38N19WONu7/WwiL0xIqBBzuxod4cQs=
X-Google-Smtp-Source: AGHT+IFGwYcN/vp7Fh4H9BvR8I/GiwEabeRWmMmgC/fwrMKjTrncLEvk4UQ9VaGd8Qep4/NNGtnRjtWCpYVEKHWNCPo=
X-Received: by 2002:a05:6e02:3882:b0:3d0:4a82:3f42 with SMTP id
 e9e14a558f8ab-3d2b536ef0amr84272825ab.16.1740072835191; Thu, 20 Feb 2025
 09:33:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Rob Clark <robdclark@gmail.com>
Date: Thu, 20 Feb 2025 09:33:43 -0800
X-Gm-Features: AWEUYZlqKD1Gyp1C5EfK3AsCtFxqBumbtjfPAP1oJTHymGw-8iTynKVDWs30wtk
Message-ID: <CAF6AEGtt2AODBXdod8ULXcAygf_qYvwRDVeUVtODx=2jErp6cA@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2025-02-20 for v6.14-rc4
To: Dave Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
	linux-arm-msm <linux-arm-msm@vger.kernel.org>, freedreno <freedreno@lists.freedesktop.org>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"

Hi Dave, Simona,

A few fixes for v6.14, as described below.

The following changes since commit 866e43b945bf98f8e807dfa45eca92f931f3a032:

  drm/msm: UAPI error reporting (2025-01-03 07:20:28 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2025-02-20

for you to fetch changes up to 73f69c6be2a9f22c31c775ec03c6c286bfe12cfa:

  drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing
bitclk source (2025-02-15 11:46:42 -0800)

----------------------------------------------------------------
Fixes for v6.14-rc4

Display:
* More catalog fixes:
 - to skip watchdog programming through top block if its not present
 - fix the setting of WB mask to ensure the WB input control is programmed
   correctly through ping-pong
 - drop lm_pair for sm6150 as that chipset does not have any 3dmerge block
* Fix the mode validation logic for DP/eDP to account for widebus (2ppc)
  to allow high clock resolutions
* Fix to disable dither during encoder disable as otherwise this was
  causing kms_writeback failure due to resource sharing between
* WB and DSI paths as DSI uses dither but WB does not
* Fixes for virtual planes, namely to drop extraneous return and fix
  uninitialized variables
* Fix to avoid spill-over of DSC encoder block bits when programming
  the bits-per-component
* Fixes in the DSI PHY to protect against concurrent access of
  PHY_CMN_CLK_CFG regs between clock and display drivers

Core/GPU:
* Fix non-blocking fence wait incorrectly rounding up to 1 jiffy timeout
* Only print GMU fw version once, instead of each time the GPU resumes

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dp: account for widebus and yuv420 during mode validation

Dmitry Baryshkov (3):
      drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
      drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
      drm/msm/dpu: correct LM pairing for SM6150

Ethan Carter Edwards (1):
      drm/msm/dpu: Fix uninitialized variable

Jessica Zhang (2):
      drm/msm/dpu: Disable dither in phys encoder cleanup
      drm/msm/dpu: Drop extraneous return in dpu_crtc_reassign_planes()

Konrad Dybcio (1):
      drm/msm/a6xx: Only print the GMU firmware version once

Krzysztof Kozlowski (3):
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG0 updated from driver side
      drm/msm/dsi/phy: Protect PHY_CMN_CLK_CFG1 against clock driver
      drm/msm/dsi/phy: Do not overwite PHY_CMN_CLK_CFG1 when choosing
bitclk source

Marijn Suijten (1):
      drm/msm/dpu: Don't leak bits_per_component into random DSC_ENC fields

Rob Clark (1):
      drm/msm: Avoid rounding up to one jiffy

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  8 ++--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  2 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  3 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  7 ++-
 drivers/gpu/drm/msm/dp/dp_display.c                | 11 +++--
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  5 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 53 +++++++++++++++-------
 drivers/gpu/drm/msm/msm_drv.h                      | 11 ++---
 .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 11 ++++-
 15 files changed, 75 insertions(+), 49 deletions(-)

