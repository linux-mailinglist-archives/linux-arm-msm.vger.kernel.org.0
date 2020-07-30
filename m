Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 46A40233A73
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Jul 2020 23:22:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730594AbgG3VWj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 30 Jul 2020 17:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730551AbgG3VWj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 30 Jul 2020 17:22:39 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7E41C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 14:22:38 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id l4so29325261ejd.13
        for <linux-arm-msm@vger.kernel.org>; Thu, 30 Jul 2020 14:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=AHa4cCw7UaXFq21Bry8nxx/yxjhkEeZr9mmkXZz+/CA=;
        b=Lr9QGCDwKuV19j3Hna4uA6xn927LxQwNAiw575xSPKY1DTdTsdQfhISPb6pqf7Yf1q
         dDiTwLugtkLKnXZrQZozM1FOboncVli/qBg+4Y/gku6EhGmgFHkDGgKD7a5hRSHolCCk
         /pVWBgoEBRddPMmCRcaflx2pUKPEDq0BKcry6J2ZJQmNrlu7eumANRgZiozdN1jGlRYp
         2ZqEPJrNoKuNh9mUffgGXjevlufmm0BQx08bzavxiBoA7X4iOERRGDl3sp7hzcikA4LW
         K0Rd5fvt4W6OSRb7pin4WXvgbL0mVyjFJxAcdQYvxuyT5kByGEFZmipJTmiPyExhKMCu
         4jlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=AHa4cCw7UaXFq21Bry8nxx/yxjhkEeZr9mmkXZz+/CA=;
        b=FM+MWchoqJDSnp0dJOEz52WKHLLF34T6gPuXAv4+guYDST4MZo3Q1x/W5PllWlzGuN
         Nf5NTEiAygIkv3VC7tLJQ8w/QnYfuClAokNwOcHO1pfpBRUDq9qA82j4olT3SfcYgC48
         kJ+5qucCSb6xs1Z21o9sYqns7iNxRuFtDWVhseeXBV4fm3o/lU7D2GtHvC+VLaL7d4fo
         HbYOgv+v+l/KM7uipZ4Cn9irnOHaEspSwgyeyr4uCEqTzbPzkZXN9Z9AsmjFptJoNgct
         ck3iZ4sIrxMZMVyZ9pgIer5boJKakSwa45T/ViDgv3I6+eN+nSf9K/TxGurZY2o1xbfp
         JogQ==
X-Gm-Message-State: AOAM5302C79xKFJVa876IO0jDBawmrhB1ZqbOZjPfNWoS5XOyLQEsiNW
        4YQAjm3RhidHkVchnyEWMNwBD+f/D1f3Tutdeuk=
X-Google-Smtp-Source: ABdhPJxMcqyr/ooN16q5acNPylmLQkjVzf0AqYmtfekpVV2nr07Tx9u8WmLGhKLhU06grHFTnpznaYwxlsKUFd19k/Q=
X-Received: by 2002:a17:906:95cb:: with SMTP id n11mr1014423ejy.506.1596144157217;
 Thu, 30 Jul 2020 14:22:37 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 30 Jul 2020 14:23:18 -0700
Message-ID: <CAF6AEGs_eswoX-E0Ddg5DoEQy35x3GG+6SDXUAjPMrtAWFkqng@mail.gmail.com>
Subject: [pull v2] drm/msm: msm-next for 5.9
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

Take 2 of msm-next pull, this version drops the OPP patch due to [1],
so I'll send the gpu opp/bw scaling patch after the OPP patch lands.
Since I had to force-push I took the opportunity to rebase on
drm-next, and since you already merged in 5.8-rc6 a few fixes from the
last cycle dropped out.

This time around:

* A bunch more a650/a640 (sm8150/sm8250) display and GPU enablement
  and fixes
* Enable dpu dither block for 6bpc panels
* dpu suspend fixes
* dpu fix for cursor on 2nd display
* dsi/mdp5 enablement for sdm630/sdm636/sdm660

I also regenerated the register headers, which accounts for a good
bit of the size this time, because we hadn't re-synced the register
headers since the early days of a6xx bringup.

[1] https://lkml.org/lkml/2020/7/30/23

The following changes since commit 5de5b6ecf97a021f29403aa272cb4e03318ef586:

  drm/ttm/nouveau: don't call tt destroy callback on alloc failure.
(2020-07-29 10:06:38 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2020-07-30

for you to fetch changes up to aa6800856f3aba864f8174dd1ac2c325e37be428:

  drm/msm: use kthread_create_worker instead of kthread_run
(2020-07-30 13:46:11 -0700)

----------------------------------------------------------------
Akhil P Oommen (2):
      drm/msm: Fix a null pointer access in msm_gem_shrinker_count()
      drm: msm: a6xx: fix gpu failure after system resume

Bernard (1):
      drm/msm: use kthread_create_worker instead of kthread_run

Eric Anholt (2):
      drm/msm: Garbage collect unused resource _len fields.
      drm/msm: Quiet error during failure in optional resource mappings.

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

Kalyan Thota (3):
      drm/msm/dpu: ensure device suspend happens during PM sleep
      drm/msm/dpu: enumerate second cursor pipe for external interface
      drm/msm/dpu: add support for dither block in display

Konrad Dybcio (4):
      drm/msm/dsi: Add phy configuration for SDM630/636/660
      drm/msm/mdp5: Add MDP5 configuration for SDM630
      drm/msm/dsi: Add DSI configuration for SDM660
      drm/msm/mdp5: Add MDP5 configuration for SDM636/660

Rajendra Nayak (2):
      drm/msm/dpu: Use OPP API to set clk/perf state
      drm/msm: dsi: Use OPP API to set clk/perf state

Rob Clark (5):
      drm/msm/adreno: fix gpu probe if no interconnect-names
      drm/msm: ratelimit crtc event overflow error
      drm/msm/dpu: fix/enable 6bpc dither with split-lm
      drm/msm: sync generated headers
      drm/msm/adreno: un-open-code some packets

Sharat Masetty (2):
      dt-bindings: drm/msm/gpu: Document gpu opp table
      drm: msm: a6xx: send opp instead of a frequency

 .../devicetree/bindings/display/msm/dsi.txt        |    1 +
 .../devicetree/bindings/display/msm/gpu.txt        |   28 +
 drivers/gpu/drm/msm/adreno/a2xx.xml.h              | 1102 +++++-
 drivers/gpu/drm/msm/adreno/a3xx.xml.h              |  102 +-
 drivers/gpu/drm/msm/adreno/a4xx.xml.h              |  125 +-
 drivers/gpu/drm/msm/adreno/a5xx.xml.h              |  403 ++-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |    5 +-
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              | 3624 ++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  107 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |    5 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |  147 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  191 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   12 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   74 +
 drivers/gpu/drm/msm/adreno/adreno_common.xml.h     |  230 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    3 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   70 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |    8 +
 drivers/gpu/drm/msm/adreno/adreno_pm4.xml.h        |  933 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |    3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |   49 +-
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   54 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           |   84 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |    6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4.xml.h           |   26 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5.xml.h           |   26 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  198 ++
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
 61 files changed, 7205 insertions(+), 1609 deletions(-)
