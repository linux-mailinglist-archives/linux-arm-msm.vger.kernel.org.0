Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 011A65522DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jun 2022 19:46:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239371AbiFTRp7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 20 Jun 2022 13:45:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234534AbiFTRp7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 20 Jun 2022 13:45:59 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4234E1AF15
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 10:45:57 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id z17so6220265wmi.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 Jun 2022 10:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=IeQAYHSX50DSoga/bjO85m7RJZ5eeGCk6fh4GvV0eXA=;
        b=nLoxWDhzHZdQoJrRs9Lg/ZXFOVIW9AFUdiYl33t81H4gMMwGerK2pyR5MKO6KPkMBr
         gPuUbPTvWQ/RlhxEi5VLNxGmKs4kcTXnbhZmoLmhgFVNbKjwu7goAIQMMC13kqUL0dAN
         qJwxxxOKXgPVG5Hrm4nEMfBp/GReWDmpqdzp5URC9pDM5BhfJFP79e2pGJSTSh1QZi6T
         SNqiCXjHmWHLJXRcCJiec7FPrkjdTgBaIX+fV/XXFssHi4hzq/VAvqkLNgVmk5AJfroO
         NOhbW/UEXZ1HqillXk/AkxLRiVwUrsxERNSzZ2Vq8wqf80sqfyids/I1C6Qk5BJR961W
         xZ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=IeQAYHSX50DSoga/bjO85m7RJZ5eeGCk6fh4GvV0eXA=;
        b=NOlALEllZx8Dd0tgusZAk2vWUw4Rcn1W1uR7IM1mGCj5F8EO3Xf1/tcupjGWiYpPGW
         dV4z3TsoOLk+9pGulrraOOMWF4IZp6TAnn6fctKU5HjVg5mVhQQevo788Zu0iFmgzmzw
         IdNp6qfwvPbbsIdZzV7FLbFPNq7VoeQ6inDeNoiMegzNIayoo+QL7gr0JTQnsgnJWpin
         wjmNEY4umtld0AiQ5/NGbz3Azx7Tzs2KMPFL4uX7V5CgfRSvAVPDfGY7NTJgkXhPnmDf
         W9Zu/lIZRDkrSV9Bof72lKv+EdbrHBPPQgnEh1dWMyW3jRtkMM4v6bkC9htLCdsAYiQO
         uuKQ==
X-Gm-Message-State: AJIora/WfGX1r2yQTeBmFHv7BJjlSrG2YU6PvZH21CiWtkLYNo5nOtJz
        MJSl8DGZOYGckhCF/JPFPilozLF22yosT1sKSyk=
X-Google-Smtp-Source: AGRyM1sbZaeyZDiL8AlWQz++9TMHx0tYJRGXDq69us1pqz9Wni9YYQ5WAwzlZc9IQe7YpygXBwnIsbfU/qOwVxFe6eE=
X-Received: by 2002:a05:600c:4f96:b0:39c:951e:66b7 with SMTP id
 n22-20020a05600c4f9600b0039c951e66b7mr26056903wmq.84.1655747155463; Mon, 20
 Jun 2022 10:45:55 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Mon, 20 Jun 2022 10:46:02 -0700
Message-ID: <CAF6AEGvdsOF1-+WfTWyEyu33XPcvxOCU00G-dz7EF2J+fdyUHg@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2022-06-20 for v5.19-rc4
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Here are fixes for v5.19, summary below (and in tag msg)

The following changes since commit 24df12013853ac59c52cc726e9cbe51e38d09eda:

  MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer (2022-05-07
12:02:29 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-fixes-2022-06-20

for you to fetch changes up to a6e2af64a79afa7f1b29375b5231e840a84bb845:

  drm/msm/dp: force link training for display resolution change
(2022-06-18 09:14:06 -0700)

----------------------------------------------------------------
Fixes for v5.19-rc4

- Workaround for parade DSI bridge power sequencing
- Fix for multi-planar YUV format offsets
- Limiting WB modes to max sspp linewidth
- Fixing the supported rotations to add 180 back for IGT
- Fix to handle pm_runtime_get_sync() errors to avoid unclocked access
  in the bind() path for dpu driver
- Fix the irq_free() without request issue which was being hit frequently
  in CI.
- Fix to add minimum ICC vote in the msm_mdss pm_resume path to address
  bootup splats
- Fix to avoid dereferencing without checking in WB encoder
- Fix to avoid crash during suspend in DP driver by ensuring interrupt
  mask bits are updated
- Remove unused code from dpu_encoder_virt_atomic_check()
- Fix to remove redundant init of dsc variable
- Fix to ensure mmap offset is initialized to avoid memory corruption
  from unpin/evict
- Fix double runpm disable in probe-defer path
- VMA fenced-unpin fixes
- Fix for WB max-width
- Fix for rare dp resolution change issue

----------------------------------------------------------------
Abhinav Kumar (4):
      drm/msm/dpu: limit writeback modes according to max_linewidth
      drm/msm/dpu: add DRM_MODE_ROTATE_180 back to supported rotations
      drm/msm/dpu: handle pm_runtime_get_sync() errors in bind path
      drm/msm/dpu: limit wb modes based on max_mixer_width

Dmitry Baryshkov (1):
      drm/msm: don't free the IRQ if it was not requested

Douglas Anderson (2):
      drm/msm/dsi: don't powerup at modeset time for parade-ps8640
      drm/msm/dpu: Move min BW request and full BW disable back to mdss

Hangyu Hua (1):
      drm: msm: fix possible memory leak in mdp5_crtc_cursor_set()

Haowen Bai (1):
      drm/msm/dpu: Fix pointer dereferenced before checking

Jiapeng Chong (1):
      drm/msm/dpu: Remove unused code

Jonathan Marek (1):
      drm/msm: use for_each_sgtable_sg to iterate over scatterlist

Kuogee Hsieh (3):
      drm/msm/dp: Always clear mask bits to disable interrupts at
dp_ctrl_reset_irq_ctrl()
      drm/msm/dp: check core_initialized before disable interrupts at
dp_display_unbind()
      drm/msm/dp: force link training for display resolution change

Maximilian Luz (1):
      drm/msm: Fix double pm_runtime_disable() call

Miaoqian Lin (2):
      drm/msm/a6xx: Fix refcount leak in a6xx_gpu_init
      drm/msm/mdp4: Fix refcount leak in mdp4_modeset_init_intf

Rob Clark (9):
      drm/msm: Fix fb plane offset calculation
      Merge tag 'msm-next-5.19-fixes' of
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging
      Merge tag 'msm-next-5.19-fixes-06-01' of
https://gitlab.freedesktop.org/abhinavk/msm into msm-fixes-staging
      drm/msm: Ensure mmap offset is initialized
      drm/msm: Switch ordering of runpm put vs devfreq_idle
      drm/msm/gem: Separate object and vma unpin
      drm/msm/gem: Drop early returns in close/purge vma
      drm/msm: Drop update_fences()
      drm/msm: Don't overwrite hw fence in hw_init

Vinod Koul (1):
      drm/msm/disp/dpu1: remove superfluous init

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 14 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  3 --
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 12 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      | 13 ++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |  4 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 42 ++++++++++++----
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                | 16 +++---
 drivers/gpu/drm/msm/dsi/dsi_manager.c              | 32 +++++++++++-
 drivers/gpu/drm/msm/msm_drv.c                      |  9 +++-
 drivers/gpu/drm/msm/msm_drv.h                      |  1 +
 drivers/gpu/drm/msm/msm_fb.c                       |  2 +-
 drivers/gpu/drm/msm/msm_fence.c                    |  8 +--
 drivers/gpu/drm/msm/msm_gem.c                      |  7 ++-
 drivers/gpu/drm/msm/msm_gem.h                      | 11 +++--
 drivers/gpu/drm/msm/msm_gem_prime.c                | 15 ++++++
 drivers/gpu/drm/msm/msm_gem_submit.c               | 18 ++++---
 drivers/gpu/drm/msm/msm_gem_vma.c                  |  6 +--
 drivers/gpu/drm/msm/msm_gpu.c                      | 27 ++--------
 drivers/gpu/drm/msm/msm_iommu.c                    |  2 +-
 drivers/gpu/drm/msm/msm_kms.h                      |  1 +
 drivers/gpu/drm/msm/msm_mdss.c                     | 57 ++++++++++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |  2 +-
 27 files changed, 222 insertions(+), 91 deletions(-)
