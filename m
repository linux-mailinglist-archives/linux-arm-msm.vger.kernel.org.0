Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F023BF0316
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 17:34:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390177AbfKEQev (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Nov 2019 11:34:51 -0500
Received: from mail-ed1-f67.google.com ([209.85.208.67]:34685 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390153AbfKEQev (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Nov 2019 11:34:51 -0500
Received: by mail-ed1-f67.google.com with SMTP id b72so16714473edf.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 05 Nov 2019 08:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=mNR/MSWlimZAiXcm7qQEJqNH/suNSkOqI93zRfY3ukg=;
        b=TnOQy1YGhM0LwaFiaw5gfg5cLgvH7xVWr7BrdwdT8hwGyuOHPGrp/fdK5XLD3i4jc+
         ZJWPutCDiteg8C51gtdUBCf4pIe0a0sl2MgQmgymKnI6GMi5ErliMaEpCbj0F22EnXzk
         Bz/E8RJcIDJ4aP5uq5AwFO5ep+q0n5DtPYNTSNYYr97JnsjHZr5sBDNqagE+rMf4hP9i
         MlTio9ZzzcanQ5eOKHLxmccEC95MyRbpn2iTT5RZt8zkZHGsZlA6wVBwwaJNPq6SypAA
         g0h4myuM8STuJZz479yP+OMwBDNZ0BOhBdKVMZY65GG55ZGlvptOhvmBdi8HgDKhXJ6w
         JZRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=mNR/MSWlimZAiXcm7qQEJqNH/suNSkOqI93zRfY3ukg=;
        b=XqZTCijXFsQYaQlQ8+eLa2kyDF3vUmcGsmSSqZ02KqynBW5639OBV/UBM5x56UTN/K
         +Bq+0bGrDkf4oHnqlBiGo70+pf2UPUmylgiSZQDXdamiHsoIU6p+JuPxdrYlTVTFB4B2
         pcaoS4Kbjdd9rvwClmLsSlgOOc01+O7YDmqB3JSYe0JffWKGAossVCCI1J76sDLz7tu5
         eDHzJaL8hBSGG/w1HqVs4x1VKLyrQrdLOK9ErzChN/iPwKLyxs+snTvATl4WUOvMdsNg
         LXKE1+qDI17BHMsU+fB6uvdUXpvdI72wQxLce8Qna0q1h6LTt6B2lQxnymR6J4uEybHC
         rQTQ==
X-Gm-Message-State: APjAAAWPC1Z2ZLc5Kg/NkR/3MNNskXpHY3gsi+1SG48M4F3RvCnP/Pcz
        B5tChJbX0GcgEnH+XSrAmKKl/bDwNPxg6bvvlfA=
X-Google-Smtp-Source: APXvYqwa78scJmHC4aO08kO2YFvBBcoSO6Inq6/772fOtxeXzhmswR7THbj4gynJs0wU7G/pO4AKfZQ6yg9/L7UNm8E=
X-Received: by 2002:a17:906:a44:: with SMTP id x4mr29819993ejf.64.1572971688897;
 Tue, 05 Nov 2019 08:34:48 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 5 Nov 2019 08:34:38 -0800
Message-ID: <CAF6AEGt_Zg9shp9XO=fY3nnef6uL5XPEcGndKGZ6L=TaPiEEcQ@mail.gmail.com>
Subject: 
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

This time around:

+ OCMEM support to enable the couple generations that had shared OCMEM
  rather than GMEM exclusively for the GPU (late a3xx and I think basically
  all of a4xx).  Bjorn and Brian decided to land this through the drm
  tree to avoid having to coordinate merge requests.
+ a510 support, and various associated display support
+ the usual misc cleanups and fixes

The following changes since commit da0c9ea146cbe92b832f1b0f694840ea8eb33cce:
  Linux 5.4-rc2 (2019-10-06 14:27:30 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-next-2019-11-05

for you to fetch changes up to e20c9284c8f212081afc28471daaac9b0d54252f:

  drm/msm/adreno: Add support for Adreno 510 GPU (2019-11-04 13:18:31 -0800)

----------------------------------------------------------------
AngeloGioacchino Del Regno (6):
      drm/msm/mdp5: Add optional TBU and TBU_RT clocks
      dt-bindings: msm/mdp5: Document optional TBU and TBU_RT clocks
      drm/msm/mdp5: Add configuration for msm8x76
      drm/msm/dsi: Add configuration for 28nm PLL on family B
      drm/msm/dsi: Add configuration for 8x76
      drm/msm/adreno: Add support for Adreno 510 GPU

Arnd Bergmann (1):
      drm/msm: include linux/sched/task.h

Ben Dooks (2):
      drm/msm: make a5xx_show and a5xx_gpu_state_put static
      drm/msm/mdp5: make config variables static

Brian Masney (6):
      dt-bindings: soc: qcom: add On Chip MEMory (OCMEM) bindings
      dt-bindings: display: msm: gmu: add optional ocmem property
      soc: qcom: add OCMEM driver
      drm/msm/gpu: add ocmem init/cleanup functions
      soc: qcom: ocmem: add missing includes
      drm/msm/hdmi: silence -EPROBE_DEFER warning

Drew Davenport (7):
      drm/msm/dpu: Remove unused variables
      drm/msm/dpu: Remove unused macro
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm/dpu: Remove unnecessary NULL checks
      drm/msm: Remove unused function arguments

Krzysztof Wilczynski (1):
      drm/msm/dsi: Move static keyword to the front of declarations

Rob Clark (4):
      firmware: qcom: scm: add OCMEM lock/unlock interface
      firmware: qcom: scm: add support to restore secure config to qcm_scm-32
      drm/msm: fix rd dumping for split-IB1
      drm/msm: always dump buffer base/size

Sean Paul (1):
      drm/msm: Sanitize the modeset_is_locked checks in dpu

Stephan Gerhold (1):
      drm/msm/dsi: Implement qcom, dsi-phy-regulator-ldo-mode for 28nm PHY

zhengbin (11):
      drm/msm/dpu: Remove set but not used variable 'priv' in dpu_kms.c
      drm/msm/dpu: Remove set but not used variable 'priv' in
dpu_encoder_phys_vid.c
      drm/msm/dpu: Remove set but not used variable 'priv' in dpu_core_irq.c
      drm/msm/dpu: Remove set but not used variables 'dpu_cstate', 'priv'
      drm/msm/dpu: Remove set but not used variables 'cmd_enc', 'priv'
      drm/msm/dpu: Remove set but not used variables 'mode', 'dpu_kms', 'priv'
      drm/msm/mdp5: Remove set but not used variable 'fmt'
      drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in blend_setup
      drm/msm/dsi: Remove set but not used variable 'lpx'
      drm/msm/dsi: Remove set but not used variable 'lp'
      drm/msm/mdp5: Remove set but not used variable 'hw_cfg' in modeset_init

 .../devicetree/bindings/display/msm/gmu.txt        |  51 +++
 .../devicetree/bindings/display/msm/mdp5.txt       |   2 +
 .../devicetree/bindings/sram/qcom,ocmem.yaml       |  96 +++++
 drivers/firmware/qcom_scm-32.c                     |  52 ++-
 drivers/firmware/qcom_scm-64.c                     |  12 +
 drivers/firmware/qcom_scm.c                        |  53 +++
 drivers/firmware/qcom_scm.h                        |   9 +
 drivers/gpu/drm/msm/Kconfig                        |   1 +
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  28 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |   3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  25 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |   3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  79 +++-
 drivers/gpu/drm/msm/adreno/a5xx_power.c            |   7 +
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  15 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  40 ++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  15 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       |  43 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  39 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  15 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  60 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |   6 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  10 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           | 114 +++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c          |   3 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  23 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h           |   2 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   2 -
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  28 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |   3 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   8 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c         |  60 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c                |   8 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   6 +-
 drivers/gpu/drm/msm/msm_gpummu.c                   |   6 +-
 drivers/gpu/drm/msm/msm_iommu.c                    |   6 +-
 drivers/gpu/drm/msm/msm_mmu.h                      |   4 +-
 drivers/gpu/drm/msm/msm_rd.c                       |  16 +-
 drivers/soc/qcom/Kconfig                           |  10 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/ocmem.c                           | 433 +++++++++++++++++++++
 include/linux/qcom_scm.h                           |  26 ++
 include/soc/qcom/ocmem.h                           |  65 ++++
 49 files changed, 1235 insertions(+), 307 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/sram/qcom,ocmem.yaml
 create mode 100644 drivers/soc/qcom/ocmem.c
 create mode 100644 include/soc/qcom/ocmem.h
