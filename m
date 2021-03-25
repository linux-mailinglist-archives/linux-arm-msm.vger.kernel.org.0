Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 69CFA349B48
	for <lists+linux-arm-msm@lfdr.de>; Thu, 25 Mar 2021 21:53:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230241AbhCYUwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 16:52:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230313AbhCYUwG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 16:52:06 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9E8DC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 13:52:05 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id r10-20020a05600c35cab029010c946c95easo1907944wmq.4
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 13:52:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=bYspDUN33apg0LraByMLCJKAyWJ3G5vDe8LyXsNfZRY=;
        b=XdqNvHvtj2wwZghDS0ZrF5SEObW3kGDNluXnssbsGIIJbHZpqhyIisxSc1KYVDonmi
         GLE9j2z+P2P8x89LmxVPdJ2fv/Ypb9NNJHGpwJ/AG3gbr/x7gC6eHxq9U/AZ8Q6dO54z
         X/1LYwdpp9lCf2m7/z6gp00EyVB1GycjuzcI11nxPAlwlqI2EOPpIV9UfBgD8CewamP3
         iIkQdr9knbaCgyBVi+stQslK39Jp7Of6q4NWQ4ugZJUdLdyEqHxRzCLrd42UnnXG5CX1
         Ril/kC2Yxf1gsk6jJjfvJl57/8pSdHNnaVhesSha4FRgaMoBY3dO4Fu3siZIJX7AHkJ4
         1Qwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=bYspDUN33apg0LraByMLCJKAyWJ3G5vDe8LyXsNfZRY=;
        b=gM+y7950sVOOxeIWTbFpT2Hjt1SpdsJXSwxZ9TRdwso3qK/NRrJrcN85bNh5KDp1CG
         aGZBGvamuLuvrrca7V1CXnp1adOEIMOiZpwzeGToDXAFta8eCP+utii+6dT8dFVXkJYE
         nxe+SLQ+jzaQN3bH8gO7qryJOL9dUmiz6efQHyGXO3jhZFy9UIop28JequMT7DqknxAp
         mcl2ZsW01k85zDlEQlrr1OXUk/r5HZaWJuuSZRmtQr0eDzGJNe+IhLAMHJt4ycp99NjT
         H3/KXB6eC858XCy5QSNmxECSq05fCo2xKzOC/qbgb7FtrVgAgdMYUDHiBX634oMyga5Z
         pvjA==
X-Gm-Message-State: AOAM531KmEfsJRv3EUsNG4jg8SvHxGJwSxqEOGmbHTJPTc3FCH8rdNzM
        5epITxKdLftX/h2BB1hDHnM2W9pHr/NiZMuiBc0=
X-Google-Smtp-Source: ABdhPJwSBd9Il6DJf6VK0zFKB/+y7G1sSZMcI3jwvMolZAQKlXZlx2+PVU1MtRcxj2RheR+K74bk/HYi4yOdHC700eE=
X-Received: by 2002:a1c:66c4:: with SMTP id a187mr9794034wmc.164.1616705524328;
 Thu, 25 Mar 2021 13:52:04 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 25 Mar 2021 13:55:18 -0700
Message-ID: <CAF6AEGuZ1gpy4o-2wsLxhY_nRMEt95GTUPhDeS1ad20X4jasVg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2021-02-07 for v5.12-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, jordan@cosmicpenguin.net,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

(resend without missing list cc's)

A few fixes for v5.12

The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2021-02-07

for you to fetch changes up to 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
      drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
      drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
      drm/msm: fix shutdown hook in case GPU components failed to bind

Douglas Anderson (1):
      drm/msm: Fix speed-bin support not to access outside valid memory

Fabio Estevam (1):
      drm/msm: Fix suspend/resume on i.MX5

Jonathan Marek (1):
      drm/msm: fix a6xx_gmu_clear_oob

Jordan Crouse (1):
      drm/msm: a6xx: Make sure the SQE microcode is safe

Kalyan Thota (1):
      drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume

Konrad Dybcio (1):
      drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs

Rob Clark (1):
      drm/msm: Ratelimit invalid-fence message

Stephen Boyd (2):
      drm/msm/kms: Use nested locking for crtc lock instead of custom classes
      drm/msm/dp: Restore aux retry tuning logic

 drivers/gpu/drm/msm/adreno/a5xx_power.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 108 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  12 ++--
 drivers/gpu/drm/msm/dp/dp_aux.c           |   7 ++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     |   2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     |   6 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c |  11 +--
 drivers/gpu/drm/msm/msm_atomic.c          |   7 +-
 drivers/gpu/drm/msm/msm_drv.c             |  12 ++++
 drivers/gpu/drm/msm/msm_fence.c           |   2 +-
 drivers/gpu/drm/msm/msm_kms.h             |   8 +--
 12 files changed, 119 insertions(+), 60 deletions(-)
