Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAE4A1E1529
	for <lists+linux-arm-msm@lfdr.de>; Mon, 25 May 2020 22:20:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388994AbgEYUUQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 25 May 2020 16:20:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389978AbgEYUUQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 25 May 2020 16:20:16 -0400
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 926EFC061A0E
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 13:20:15 -0700 (PDT)
Received: by mail-ej1-x62a.google.com with SMTP id h21so21597360ejq.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 25 May 2020 13:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=PoIaK/pV9OVJlJWu+gk2RvaOMk7FYxWYIk7W+GWUZIc=;
        b=BlG1u/53E0k/cxphrEAEQh0jv/4wUw0rI7aAQNCNBebgaqk3MrjPRWLFP9lwzuti9w
         Y6lDJCz9LgYXAMXh6Ep9cpUsIGOflEQmYJHurd7xrwX7Fj8aiIpWAdsjXcYO5cA0O8i3
         TI/zsA0kdTtFXiLUZLkmLdPuMG/F0zfYwevXcyuF3hmrnLCiRPV/Q8D++vsltvRRjEb6
         AISfw9OPo3BQqf9izNvJo5e9E2hLRPvgNPyGXK7ZPkMeH/QRwHTmMk/PcrOGqZpWS3ig
         I0pQphUtnyIEwduqcTyOKT/MbQwnT9ub65zoIKHy1mmKTb0fJxZ9BK2fcU4LhiGnn1rM
         dCwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=PoIaK/pV9OVJlJWu+gk2RvaOMk7FYxWYIk7W+GWUZIc=;
        b=HBD4Bv89844ST2uj50OmWePKf4eCs0uCfZayZ1dl9OV+xcGnivM/t8M1kHyfs5OS4H
         bsuvWJt1sYxjPgc7GQ4RGIj1QIcy94xlZJLvVbcWlUobZqRoPLqHyOSpwVhJvs/T2hss
         wQCpDHBxEqTS9gDdfkT619HRLfaXlTz0CQGp9+baUxXB1l8eaXQrysF6AZr8x3HOI2/3
         oIH4G/BHbgjclWAuiY2HqPilKu5mQt/VLFN/+UD12e+gAkllaTMs3fE/qmdPLJwvBd/d
         53Nu0+IPJbAVqXbJ+wwp6/dEnD6MFvckDMmNuPKaqP8uOuBtsiGKqlkfbaOUqeE8lydP
         Zevg==
X-Gm-Message-State: AOAM5320C/630Q1bQWyM34zxP+vspK6d+vEHfjk4YtHpRVXC77oFoy4y
        q1as1c+yYAp6gEHVD3FbtxvY3uyHquSEjgnQivk=
X-Google-Smtp-Source: ABdhPJzGBBplhgkLgweqOx2JdMhGzZRkrpe9//0ny+sPB1V0GdFyUBsf7L+dELYRTCsUuX8afEdERCn9Oq85bxMBWk8=
X-Received: by 2002:a17:906:3a11:: with SMTP id z17mr20807986eje.460.1590438013845;
 Mon, 25 May 2020 13:20:13 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 25 May 2020 13:20:36 -0700
Message-ID: <CAF6AEGuBodxXBcEZOU+bSBmxRmVx+JHVkFnt+R8sNn3dGafnpg@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.8
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Not too huge this time around, but a bunch of interesting new
stuff:

 * new gpu support: a405, a640, a650
 * dpu: clock and bandwidth scaling
 * dpu: color processing support
 * mdp5: support for msm8x36 (the thing with a405)
 * some prep work for per-context pagetables (ie the part that
   does not depend on in-flight iommu patches)
 * last but not least, UABI update for submit ioctl to support
   syncobj (from Bas)

The UABI change has been on-list and reviewed for a while now.
The only reason I didn't pull it in last cycle was that I ran
out of time to review it myself at the time.  But I'm happy
with it.  The MR for mesa (vulkan/turnip) support is here:

https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/2769


The following changes since commit 2ef96a5bb12be62ef75b5828c0aab838ebb29cb8:

  Linux 5.7-rc5 (2020-05-10 15:16:58 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-05-25

for you to fetch changes up to d9e19d7966a31ae70edfe0cb7cb044e20343a0c9:

  drm/msm/a6xx: skip HFI set freq if GMU is powered down (2020-05-23
13:38:16 -0700)

----------------------------------------------------------------
Bas Nieuwenhuizen (1):
      drm/msm: Add syncobj support.

Bjorn Andersson (1):
      drm/msm: Fix undefined "rd_full" link error

Christophe JAILLET (2):
      drm/msm/a6xx: Fix a typo in an error message
      drm/msm: Fix typo

Hongbo Yao (1):
      drm/msm/dpu: Fix compile warnings

Jonathan Marek (10):
      drm/msm: add msm_gem_get_and_pin_iova_range
      drm/msm: add internal MSM_BO_MAP_PRIV flag
      drm/msm/a6xx: use msm_gem for GMU memory objects
      drm/msm/a6xx: add A640/A650 to gpulist
      drm/msm/a6xx: HFI v2 for A640 and A650
      drm/msm/a6xx: A640/A650 GMU firmware path
      drm/msm/a6xx: update pdc/rscc GMU registers for A640/A650
      drm/msm/a6xx: enable GMU log
      drm/msm/a6xx: update a6xx_hw_init for A640 and A650
      drm/msm/a6xx: skip HFI set freq if GMU is powered down

Jordan Crouse (4):
      drm/msm: Check for powered down HW in the devfreq callbacks
      drm/msm: Attach the IOMMU device during initialization
      drm/msm: Refactor address space initialization
      drm/msm: Update the MMU helper function APIs

Kalyan Thota (3):
      drm/msm/dpu: add support for color processing blocks in dpu driver
      drm/msm/dpu: add support for pcc color block in dpu driver
      drm/msm/dpu: add support for clk and bw scaling for display

Konrad Dybcio (1):
      drm/msm/mdp5: Add MDP5 configuration for MSM8x36.

Krishna Manikandan (1):
      drm/msm/dpu: update bandwidth threshold check

Roy Spliet (1):
      drm/msm/mdp5: Fix mdp5_init error path for failed mdp5_kms allocation

Shawn Guo (2):
      drm/msm/a4xx: add adreno a405 support
      drm/msm/a4xx: add a405_registers for a405 device

kbuild test robot (2):
      drm/msm/a6xx: a6xx_hfi_send_start() can be static
      drm/msm/dpu: dpu_setup_dspp_pcc() can be static

 drivers/gpu/drm/msm/Makefile                   |   1 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c          |  16 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c          |   1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c          |  83 ++++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c          |   7 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h          |  14 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c          | 418 +++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h          |  37 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h      |  48 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c          |  70 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c          | 123 +++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h          |  50 ++-
 drivers/gpu/drm/msm/adreno/adreno_device.c     |  35 +++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c        |  27 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h        |  23 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  | 125 +++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  95 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  53 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  43 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 129 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 100 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  55 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c       |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  82 +++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h      |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c         |  58 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h         |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c       |  18 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c       |  80 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c      |   4 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c       |  21 +-
 drivers/gpu/drm/msm/msm_drv.c                  |   6 +-
 drivers/gpu/drm/msm/msm_drv.h                  |  15 +-
 drivers/gpu/drm/msm/msm_gem.c                  |  31 +-
 drivers/gpu/drm/msm/msm_gem.h                  |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c           | 232 +++++++++++++-
 drivers/gpu/drm/msm/msm_gem_vma.c              |  42 +--
 drivers/gpu/drm/msm/msm_gpu.c                  |  49 +--
 drivers/gpu/drm/msm/msm_gpu.h                  |   4 +-
 drivers/gpu/drm/msm/msm_gpummu.c               |  10 +-
 drivers/gpu/drm/msm/msm_iommu.c                |  22 +-
 drivers/gpu/drm/msm/msm_mmu.h                  |   5 +-
 drivers/gpu/drm/msm/msm_rd.c                   |   4 +-
 include/uapi/drm/msm_drm.h                     |  24 +-
 50 files changed, 1923 insertions(+), 403 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
