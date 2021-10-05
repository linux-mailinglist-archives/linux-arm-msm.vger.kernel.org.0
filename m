Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 968B3423397
	for <lists+linux-arm-msm@lfdr.de>; Wed,  6 Oct 2021 00:40:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230477AbhJEWmU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Oct 2021 18:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230113AbhJEWmU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Oct 2021 18:42:20 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 182BBC061749
        for <linux-arm-msm@vger.kernel.org>; Tue,  5 Oct 2021 15:40:29 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id k7so2439031wrd.13
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Oct 2021 15:40:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=EE1N+bfCKEtcpLH1yw49Mo8q4RWVpXJnrOOxJFV+Jv0=;
        b=aOxpbCHYROLznpuQovQBi0rIqnI6816Fhr/qwjEMNljQWdB3ZAJ8wc/2fCWWivlUpb
         6Tzxs8R3zoltWS7N22fGP0KTgK+emvhwHqcVOoblfKThzStwJD+BRUBS9B8SuRi8TYAV
         CapeeuOe3V8LYFcaLAgJQtjY3f01eL0Hr8kZOJeA0PokBoffnpSXBJNjjk6bCwt7iqkF
         XraCA1Y1D2LyiWLWSY6jvpSydIIQ/58zmzPBxNwlHJkqKTlId4iABI/8isw2MU/V0tQe
         33GDTY8b975uh4SlEEiv92B9ZDNm7UxsHP76YyYbELuhVnyXP//495rsHx8wob6HhqAr
         BH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=EE1N+bfCKEtcpLH1yw49Mo8q4RWVpXJnrOOxJFV+Jv0=;
        b=vGGw/zBj7R+2FlUWIzM6alv9WEjnY/5Nmy5Gsrl0IxoBra6nNgvJjtHcEVMVzRJr7o
         Rc+HD0NMstEOhL5+nOupbb4vb5dxugV8/LUQhpjrcEorq6u9meU85uNqvhmejs5Ru3h8
         qXMMNjizM5QPku9osIAKIPEO/7dmtnr2SKpfTwWIKBDIGfBCEXpEfy9pV5OATiXRngGo
         YCT7qR7buAZ5vM003M85AqAgyNFWsa9bHsbKco3sn9WdOWsUHrP7IohlfLufly5mze5I
         FwDNK1bTrWNTWH351KBWmwzUs4lcJ2NkrLgzTw1pVqGZ7LsPgiWhVuDYIKIeu/1ursxV
         LaMQ==
X-Gm-Message-State: AOAM530fmrJva7LLjQG1K8XtZk7SqvcHtb6WcX74yUfpGSksGeJZOlle
        P414WkF9n/ZTBkkSBr07VVuZqkWkkI+eXheKuvk=
X-Google-Smtp-Source: ABdhPJx0sdIpsZBhUxzcVpRCcsIH+vvrgS7Q3nlkNKE5Yx0pjP4fCvXO7FECC8I3BRQFwLhdovlEBz0buniwJPZ4NPw=
X-Received: by 2002:a5d:4908:: with SMTP id x8mr11146817wrq.251.1633473627674;
 Tue, 05 Oct 2021 15:40:27 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 5 Oct 2021 15:45:02 -0700
Message-ID: <CAF6AEGtD4u7yyiy+BQLmibUCbn=AdDRu7FrmdViHVx0QrcGf8g@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-10-05 for v5.15-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few fixes for v5.15:

* Fix a new crash on dev file close if the dev file was opened when
  GPU is not loaded (such as missing fw in initrd)
* Switch to single drm_sched_entity per priority level per drm_file
  to unbreak multi-context userspace
* Serialize GMU access to fix GMU OOB errors
* Various error path fixes
* A couple integer overflow fixes
* Fix mdp5 cursor plane WARNs

The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:

  Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-10-05

for you to fetch changes up to c6921fbc88e120b2279c55686a071ca312d058e9:

  drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
(2021-10-04 08:08:07 -0700)

----------------------------------------------------------------
Arnd Bergmann (1):
      drm/msm/submit: fix overflow check on 64-bit architectures

Colin Ian King (1):
      drm/msm: Fix null pointer dereference on pointer edp

Dan Carpenter (4):
      drm/msm/a4xx: fix error handling in a4xx_gpu_init()
      drm/msm/a3xx: fix error handling in a3xx_gpu_init()
      drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
      drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling

Dmitry Baryshkov (2):
      drm/msm/mdp5: fix cursor-related warnings
      drm/msm/dsi/phy: fix clock names in 28nm_8960 phy

Fabio Estevam (1):
      drm/msm: Do not run snapshot on non-DPU devices

Kuogee Hsieh (1):
      drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume

Marek Vasut (1):
      drm/msm: Avoid potential overflow in timeout_to_jiffies()

Marijn Suijten (1):
      drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready

Rob Clark (5):
      drm/msm: Fix crash on dev file close
      drm/msm/a6xx: Serialize GMU communication
      drm/msm/a6xx: Track current ctx by seqno
      drm/msm: A bit more docs + cleanup
      drm/msm: One sched entity per process per priority

Robert Foss (1):
      drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register

Stephan Gerhold (1):
      drm/msm: Fix devfreq NULL pointer dereference on a3xx

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c           |  9 ++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c           |  9 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c           |  6 +++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h           |  3 ++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c           | 46 ++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h           | 11 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c  |  2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       | 16 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c             | 10 ++--
 drivers/gpu/drm/msm/dsi/dsi.c                   |  4 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |  2 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 30 +++++------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 +-
 drivers/gpu/drm/msm/edp/edp_ctrl.c              |  3 +-
 drivers/gpu/drm/msm/msm_drv.c                   | 15 ++++--
 drivers/gpu/drm/msm/msm_drv.h                   | 47 +---------------
 drivers/gpu/drm/msm/msm_gem_submit.c            |  7 +--
 drivers/gpu/drm/msm/msm_gpu.h                   | 66 ++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c           |  6 +++
 drivers/gpu/drm/msm/msm_submitqueue.c           | 72 ++++++++++++++++++++-----
 20 files changed, 256 insertions(+), 112 deletions(-)
