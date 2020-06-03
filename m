Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF271EC658
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jun 2020 02:50:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726589AbgFCAu3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 2 Jun 2020 20:50:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgFCAu3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 2 Jun 2020 20:50:29 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C234BC08C5C0
        for <linux-arm-msm@vger.kernel.org>; Tue,  2 Jun 2020 17:50:28 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id s19so270380edt.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 02 Jun 2020 17:50:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=m6qE/X0sOaatSZyv92ajzNnqOVpyDVid2J86Jtgzdus=;
        b=fizzgpL+7ZpbrTnWlXF+WFHbmvXQkcAuSRnt37aTmmPD+UYlihtyWKfFVBaIsOrbHs
         uJzn1JPPxXeW8/uw3eBEsn9r96Y8vPDhlpJRJbK1piD0aRBA/rK9sxjqhmEa41TXpwVJ
         PLMbL5URzU2DcUQFaID2f5AV4kUiexVpiXmWD9fGKAIVRSnTVLS4TDZ2RxdkkqxVz+wS
         959KFSdy5gp2AnRKJ0n05EAo1JXHVIVCYUUnmLi4C6gkw/pO6sIC2n5CRNXweGXlaPvv
         qroCwhT/n0+TCwnfonwjkQQ1n0joiPtT7kklesgSaTF1QUGFbNcdk6C4EoPCPjJwdf9J
         Lahg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=m6qE/X0sOaatSZyv92ajzNnqOVpyDVid2J86Jtgzdus=;
        b=PRMPRneKufLgWmMjH6cZUYXq01nqnsFwZZY8xs5IHiHw9IxLUOO38J3mzeLsUj5gQi
         t7tbAjmeEUZpYMTydfNkPh+IpvROJMD/vs4CilyijyoxeJhacMcjiD3e6BacxZi4peYV
         m/c7zxM9DH99XBFjNPkhWjQXPC/nPtz2P6fC3bAv2UxJ0t47phw5Hdf4g70UWhFy+s7l
         VsGZuz95oJVBWEPsJRCnUuH82nH7Ll7Q0KiYVfS1z2JkchkV1EcuQPwpASUp6eK3CUZS
         KrzA9XR1+uf2mCnmDu9wwlGbl0yIWK4Heu7MhhJjUj59rDSYQZtCcdyNPL0w185xWeMe
         p9kw==
X-Gm-Message-State: AOAM530dWdmdzh7puLIgF8JTUzISMgLwPUx+n8i7O40YUwEzYdkDy24X
        Ct2qjB4mkpZbIJHQMhJ0vXjNeA7aFzlO440tgSo=
X-Google-Smtp-Source: ABdhPJy/d0oai6ufqfyZigpTK+jeE2AGbcT7hzkFeJjfl6h+xNLVbFr/DASFnUoizyYH+pyDz91xkNAiympzIx+Rb54=
X-Received: by 2002:aa7:d7cc:: with SMTP id e12mr11520184eds.70.1591145425779;
 Tue, 02 Jun 2020 17:50:25 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 2 Jun 2020 17:50:51 -0700
Message-ID: <CAF6AEGvLMubYPeKZ0rvOp45=+h4HZz-K9XNf0CXYcvPDVbnqLA@mail.gmail.com>
Subject: [pull v2] drm/msm: msm-next for 5.8
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

v2 with the dpu clk and bw scaling patch that had issues on armv7 reverted.

updated description of original pull req:

Not too huge this time around, but a bunch of interesting new
stuff:

 * new gpu support: a405, a640, a650
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

  https://gitlab.freedesktop.org/drm/msm.git

for you to fetch changes up to 1cb2c4a2c89b2004a36399860c85a1af9b3fcba7:

  Revert "drm/msm/dpu: add support for clk and bw scaling for display"
(2020-06-01 20:56:18 -0700)

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

Rob Clark (1):
      Revert "drm/msm/dpu: add support for clk and bw scaling for display"

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c  |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c       |  95 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h       |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c    |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  48 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  39 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     |  26 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h     |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c    | 129 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h    | 100 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h        |   1 +
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
 47 files changed, 1697 insertions(+), 382 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h
