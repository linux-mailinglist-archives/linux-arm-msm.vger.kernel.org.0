Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5FDE54607F7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Nov 2021 18:20:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347654AbhK1RXQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 28 Nov 2021 12:23:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44844 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243536AbhK1RVP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 28 Nov 2021 12:21:15 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AE854C06175D
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Nov 2021 09:14:23 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id p18so12698852wmq.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 28 Nov 2021 09:14:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=SDo6kRceja4bdqr/aJr2wU4CsUC6M9nZSYXWVouzbwE=;
        b=F/NmXpX3uv7MWq9O5UxSiaH/JBFcZLGL4OH6YgnkfbhUp4SipPdMcYmZRzDlCdminC
         xlSF6DiMKMdG63+cL6np+Oth1It/B2z8Ofqb5Fp3QNUcgxHNZ+oh0LUHVpkkAZeDgS0w
         HttH36osJfgL30ItwP1IhCah+OUHLPraKakntibxJ5Vv0EPpWr/pPCIr+E7tttOfjcAT
         Nyp/iXqTJRJzELYfmWZUEi0+rLrpxUut8xdh6hD09Pi8IhMgXie/Sv4ut3s8IEVnaAH2
         LU7YGpe9Ax4oc69ywd97K1UeKOVYO/gX/DTDIF4vvhXV9ciPnj1ocS2lyybLeTqnBYZz
         +xUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=SDo6kRceja4bdqr/aJr2wU4CsUC6M9nZSYXWVouzbwE=;
        b=F8CgOHRA3gbHoQ7MFDuIZ4xLV3Mm0R/GGmmtzCPeySZma9mHWYt3ws8XAgTLVtpnnL
         8W+/RBAd+5AbHjvmo+RFlfoEuAaxEOPStc2XlZWdOAskfykF4JfEb1XXNN6mBfQhWzye
         DBKyfbqZUeG/g5odyz+cL1wvCsCcocbCUKoguwRc/j/SAUt8Jluw5joX4NVIDkHOe+TQ
         5SsKe+M6d52MFnykjMjcvzBiXzMrp7cI1J1/oolnE0kjGKPqUpkg7CF6SDjwbLumaDFl
         ywNYWc7TIv0D0zNSpVeRDlu1K0OYSPlQZKJcIMQ4AvGvjOk+j21iW+o4bnIW6sEaHgXC
         qWLQ==
X-Gm-Message-State: AOAM533iq8OCmIfL9YvRoLJcu1O/LPqy189z2WPTCE5sguN6MdHszspM
        4CDW7DyVOu/xik1dSlCn15nCMZ9yPJvEPVwHHj7izZH3sSQ=
X-Google-Smtp-Source: ABdhPJxaaZtHilcyBMs1TRuEdRW9798Kp2P7IZq1VCjZ9JEIdYP52GYC8OD+scy4zDM9DZxJd0GASFByQbXg6ciEzcU=
X-Received: by 2002:a1c:790d:: with SMTP id l13mr31744121wme.101.1638119662245;
 Sun, 28 Nov 2021 09:14:22 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Sun, 28 Nov 2021 09:19:34 -0800
Message-ID: <CAF6AEGsV-ntO_u323XMKuD6bgbgvXporwi1sbyXwNDAuA52Afw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-11-28 for v5.16
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few fixes for v5.16.

The following changes since commit fa55b7dcdc43c1aa1ba12bca9d2dd4318c2a0dbf:

  Linux 5.16-rc1 (2021-11-14 13:56:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-11-28

for you to fetch changes up to afece15a68dc83b438cc4c3a64634e48a5735573:

  drm: msm: fix building without CONFIG_COMMON_CLK (2021-11-26 08:58:57 -0800)

----------------------------------------------------------------
Akhil P Oommen (2):
      drm/msm: Fix null ptr access msm_ioctl_gem_submit()
      drm/msm/a6xx: Fix uinitialized use of gpu_scid

Arnd Bergmann (1):
      drm: msm: fix building without CONFIG_COMMON_CLK

Douglas Anderson (3):
      drm/msm/a6xx: Allocate enough space for GMU registers
      drm/msm: Fix mmap to include VM_IO and VM_DONTDUMP
      drm/msm/dp: Avoid unpowered AUX xfers that caused crashes

Philip Chen (1):
      drm/msm/dsi: set default num_data_lanes

Rob Clark (8):
      drm/msm/devfreq: Fix OPP refcnt leak
      drm/msm: Fix wait_fence submitqueue leak
      drm/msm: Restore error return on invalid fence
      drm/msm: Make a6xx_gpu_set_freq() static
      drm/msm: Demote debug message
      drm/msm/gpu: Fix idle_work time
      drm/msm/gpu: Fix check for devices without devfreq
      drm/msm: Do hw_init() before capturing GPU state

 drivers/gpu/drm/msm/Kconfig                 |  2 +-
 drivers/gpu/drm/msm/Makefile                |  6 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 20 ++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  4 +--
 drivers/gpu/drm/msm/dp/dp_aux.c             | 17 ++++++++++
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  2 ++
 drivers/gpu/drm/msm/msm_debugfs.c           |  1 +
 drivers/gpu/drm/msm/msm_drv.c               | 49 +++++++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.c               |  5 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c        |  2 ++
 drivers/gpu/drm/msm/msm_gpu.h               |  3 ++
 drivers/gpu/drm/msm/msm_gpu_devfreq.c       | 13 +++++---
 12 files changed, 84 insertions(+), 40 deletions(-)
