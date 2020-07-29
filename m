Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 30CF1232111
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jul 2020 16:56:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726365AbgG2O4E (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Jul 2020 10:56:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726353AbgG2O4D (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Jul 2020 10:56:03 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99246C061794
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 07:56:03 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id m20so8137882eds.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jul 2020 07:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=6WHbdGbJvSHy7uFIXWZrr+QUzqXvlS5ZSmvCtbV0/wg=;
        b=nG1nuUl+RIurI5KS8sIIjMxi4wl5dK4v2rsNPdlhVHwxUP5+/kUFiJGXGGGMcAOm4+
         JfVVg3GVulA+LWYvOsP25T4HnfYXrw10Mv7pAcYIihoJ5nRtir3RDqgGoIhS9RE+gMjS
         ZPZFCZXDr2AIKzev0UDXSBjVxwjV4KfKz/bsJ02nJ23blNnHFPCTVmZeVE/4Lp0dD6Z4
         NHH5ZIFiJtwSwI8Fv+4tpy68qNmhxWsXlj3/lhfEDB04ldkiDtkMTuJdTWe1WVKritiU
         kUC68V+OeeGbKKxKvz0RBhKdVnHRx8HISAYxErG4oxM+CfG2FMwwHSx17DT+aXbDg2tP
         Q3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=6WHbdGbJvSHy7uFIXWZrr+QUzqXvlS5ZSmvCtbV0/wg=;
        b=Bc53i5krUu/MJHqISpOE9G5IGe9Pri/7eQG3UwoftrNTjvT5rhEq/Ij5jaJNfSpEtH
         obPqb9cRkbpuC4LtDuM3n+wTSpj0TbEx0Gj4lb/QC0knfQ739JYzRKQ+LS+r71eLwZP9
         BtCUm0uo73u3dqP+GWSZmslI4T7EPiqStQYVhVPgWzWA4wNhIoYJfX79740QvEofU2GQ
         I5pM/f4gDa+fAKR4Ovo88CMDVWI0C0KQ0YNvu/xXfENVd2bspHn658+VKQpYYjifeUZd
         TsdJeO25x+6nTlaSpumsCD4k5T8tAhzo/flw4yMv9f2eNcWyY1bLU2UCbvpZSHdYcgqO
         eRsQ==
X-Gm-Message-State: AOAM5303c6pcbN25hKriACJNggc4ZgdUGRr3Mt0WVKWM/1KRU1WxfwmI
        a24sjVMhF7U3Vd8sLYWnjeFebx+DqEsiacGClN4=
X-Google-Smtp-Source: ABdhPJyL3TiJfvyGFXES6v0KOK/L+StCF08mP+oq7AxXhaUjQYWjlv2ZfZ8Tc7PMisnZcutWtNB21+QQn+r1m6f6XZg=
X-Received: by 2002:a05:6402:1c10:: with SMTP id ck16mr7123894edb.151.1596034562240;
 Wed, 29 Jul 2020 07:56:02 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Wed, 29 Jul 2020 07:56:43 -0700
Message-ID: <CAF6AEGutOGAtOXhpnGV_1-Z-8XyGn+fvDYT7iS9L6P5ZejGmkA@mail.gmail.com>
Subject: [pull] drm/msm: msm-next for 5.9
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

This time around:

* A bunch more a650/a640 (sm8150/sm8250) display and GPU enablement
  and fixes
* Enable dpu dither block for 6bpc panels
* dpu suspend fixes
* dpu fix for cursor on 2nd display
* dsi/mdp5 enablement for sdm630/sdm636/sdm660
* gpu opp/bw scaling for a6xx

For the last part, there is one OPP patch that is ack'd by the OPP
maintainer to land thru the drm tree (since we are currently it's
sole user, and this avoids having to send a 2nd late PR).

I also regenerated the register headers, which accounts for a good
bit of the size this time, because we hadn't re-synced the register
headers since the early days of a6xx bringup.

The following changes since commit b3a9e3b9622ae10064826dccb4f7a52bd88c7407:

  Linux 5.8-rc1 (2020-06-14 12:45:04 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-07-29

for you to fetch changes up to 00be2abf1413bec4f4f83681cf5dcee7afbd9b4b:

  drm/msm: use kthread_create_worker instead of kthread_run
(2020-07-26 11:35:45 -0700)

----------------------------------------------------------------
Akhil P Oommen (2):
      drm/msm: Fix a null pointer access in msm_gem_shrinker_count()
      drm: msm: a6xx: fix gpu failure after system resume

Bernard (1):
      drm/msm: use kthread_create_worker instead of kthread_run

Bernard Zhao (1):
      drm/msm: fix potential memleak in error branch

Chen Tao (1):
      drm/msm/dpu: fix error return code in dpu_encoder_init

Eric Anholt (4):
      drm/msm: Fix address space size after refactor.
      drm/msm: Fix setup of a6xx create_address_space.
      drm/msm: Garbage collect unused resource _len fields.
      drm/msm: Quiet error during failure in optional resource mappings.

John Stultz (1):
      drm/msm: Fix 0xfffflub in "Refactor address space initialization"

Jonathan Marek (16):
      drm/msm: fix unbalanced pm_runtime_enable in adreno_gpu_{init, cleanup}
      drm/msm: reset devfreq freq_table/max_state before devfreq_add_device
      drm/msm: handle for EPROBE_DEFER for of_icc_get
      drm/msm/a6xx: fix crashstate capture for A650
      drm/msm/a6xx: add build_bw_table for A640/A650
      drm/msm/a6xx: set ubwc config for A640 and A650
      drm/msm/dpu: use right setup_blend_config for sm8150 and sm8250
      drm/msm/dpu: update UBWC config for sm8150 and sm8250
      drm/msm/dpu: move some sspp caps to dpu_caps
      drm/msm/dpu: don't use INTF_INPUT_CTRL feature on sdm845
      drm/msm/dpu: set missing flush bits for INTF_2 and INTF_3
      drm/msm/dpu: intf timing path for displayport
      drm/msm/dpu: add SM8150 to hw catalog
      drm/msm/dpu: add SM8250 to hw catalog
      drm/msm/a6xx: hwcg tables in gpulist
      drm/msm/a6xx: add A640/A650 hwcg

Jordan Crouse (1):
      drm/msm: Fix up the rest of the messed up address sizes

Kalyan Thota (4):
      drm/msm/dpu: request for display color blocks based on hw catalog entry
      drm/msm/dpu: ensure device suspend happens during PM sleep
      drm/msm/dpu: enumerate second cursor pipe for external interface
      drm/msm/dpu: add support for dither block in display

Konrad Dybcio (4):
      drm/msm/dsi: Add phy configuration for SDM630/636/660
      drm/msm/mdp5: Add MDP5 configuration for SDM630
      drm/msm/dsi: Add DSI configuration for SDM660
      drm/msm/mdp5: Add MDP5 configuration for SDM636/660

Krishna Manikandan (1):
      drm/msm/dpu: allow initialization of encoder locks during encoder init

Rajendra Nayak (2):
      drm/msm/dpu: Use OPP API to set clk/perf state
      drm/msm: dsi: Use OPP API to set clk/perf state

Rob Clark (5):
      drm/msm/adreno: fix gpu probe if no interconnect-names
      drm/msm: ratelimit crtc event overflow error
      drm/msm/dpu: fix/enable 6bpc dither with split-lm
      drm/msm: sync generated headers
      drm/msm/adreno: un-open-code some packets

Sharat Masetty (3):
      dt-bindings: drm/msm/gpu: Document gpu opp table
      drm: msm: a6xx: send opp instead of a frequency
      drm: msm: a6xx: use dev_pm_opp_set_bw to scale DDR

Sibi Sankar (1):
      OPP: Add and export helper to set bandwidth

 .../devicetree/bindings/display/msm/dsi.txt        |    1 +
 .../devicetree/bindings/display/msm/gpu.txt        |   28 +
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              | 1102 +++++-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |    2 +-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  102 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  125 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  403 ++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 3624 ++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  128 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    5 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |  147 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  193 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   12 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   74 +
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |  230 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   72 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    8 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  933 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   67 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  297 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |   29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |    2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   62 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   28 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   18 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h         |    7 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   56 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |   84 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |   26 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |    2 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |   26 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  198 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |    2 +-
 drivers/gpu/drm/msm/disp/mdp_common.xml.h          |   26 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |    2 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  230 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |   21 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |    1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   41 +-
 drivers/gpu/drm/msm/dsi/mmss_cc.xml.h              |   26 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |    2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |    1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |   18 +
 drivers/gpu/drm/msm/dsi/sfpb.xml.h                 |   26 +-
 drivers/gpu/drm/msm/edp/edp.xml.h                  |   26 +-
 drivers/gpu/drm/msm/hdmi/hdmi.xml.h                |   26 +-
 drivers/gpu/drm/msm/hdmi/qfprom.xml.h              |   26 +-
 drivers/gpu/drm/msm/msm_drv.c                      |  107 +-
 drivers/gpu/drm/msm/msm_drv.h                      |    5 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   36 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |    7 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |    3 +-
 drivers/gpu/drm/msm/msm_submitqueue.c              |    4 +-
 drivers/opp/core.c                                 |   31 +
 include/linux/pm_opp.h                             |    6 +
 67 files changed, 7277 insertions(+), 1629 deletions(-)
