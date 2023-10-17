Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 344C17CBC2A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Oct 2023 09:25:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234451AbjJQHZT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Oct 2023 03:25:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234503AbjJQHZS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Oct 2023 03:25:18 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 617F28E
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 00:25:15 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so9287241a12.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Oct 2023 00:25:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697527514; x=1698132314; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SpUWFksmAw2RbQdTeUoIkquSULAVk1pS6VqiHCBV19Y=;
        b=AMBBtE6CKsPJzahfu5sMiBpNnn+CfYL3Swb9/31foDRGn+kcK446FFhsOs0P0HgwbU
         gCgxLXFlesyk2w+g/BhC+ucbYY0q0qkzm/HMGV2s2XEumwrh1DeEBPLrPK28lOc14Fz6
         kaD4UjZl/axMGGMofid9+21Vt+p7SRD/rs+CJEQOUebB0SG6eP8tFV+WuJ1QD4mmW6uu
         BiSyzlf2h3gGt3nTELh5+TruM2YDtp5Llgj5mn+rqH+7mlpY1xNSsmCe289pj6cVR3V/
         /zDy7QAff4o/zNj5MeXj6lRZSdZ13kAKA0BQdlQ6C8mA6ZYmIXILEKVq1SRd9BfbcaOC
         jclw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697527514; x=1698132314;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SpUWFksmAw2RbQdTeUoIkquSULAVk1pS6VqiHCBV19Y=;
        b=iyqYF2K7MykcjjITwoxi38wQkX+5ClFC2a0mvwmjohIx3fRjy6XkbvqF3E6mwdUcLw
         SKMUXeEM9Q6DoezAjFrNq5XqWlGuwQvHEsajCc8TUynGJncmdMbvQ0ZQiREptTjs6VX9
         bqScENWKAAzYJ6Lhnpm0gJyzUNpjWnBZFnNrUV/lS+NSc9TujINVqQ8bBMwnWx0pbbWJ
         1xHtftznzg1RuD3X8mlHVzkaARH7o+3BSA/r2nVWF4x8QVbMT+roZH8Su1TNNUGIkX5s
         H9GIQVHdyDqbL1XxLaIFQpH2Cii1eQ+gVB87k27yQ5N8vlWySLIeMcOFaZ7aPFfhwiF2
         LLvw==
X-Gm-Message-State: AOJu0YyE4ujSMipsm7VxxeHueWKqzyYNvpedrc1IQfD+jPmrqW89iiIK
        fQzuo94lTWuPQzRBKJU5ZAkobr1VyGe7HyjyA/I=
X-Google-Smtp-Source: AGHT+IH3jVwxz+KrTGQ/dTepqK4fesCUXHsrnN4BcEVKA+GpQYS/yikbszBNy7mcX+lvagdcp4ZwFIQQqByHTIgnbEw=
X-Received: by 2002:a05:6402:518c:b0:53e:5f9:328b with SMTP id
 q12-20020a056402518c00b0053e05f9328bmr1025002edd.2.1697527513444; Tue, 17 Oct
 2023 00:25:13 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 17 Oct 2023 00:25:00 -0700
Message-ID: <CAF6AEGuUxdLLXj-5B6LEd-N21-+2wk8cv7CyLpV7dSDkVa9GrQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-next-2023-10-17 for v6.7
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

This is the pull for v6.7, see below for description.  There are some
conflicts with drm-next and mm trees.  The resolution in linux-next
looks correct.  Also, just in case, I've pushed the drm-next merge
resolution to msm-next-merge-resolution branch in the same tree.  (And
can do the same for mm if needed.)  Ping me if any questions.

The following changes since commit 10f20628c9b8e924b8046e63b36b2cea4d2c85e4:

  drm/msm/dpu: fail dpu_plane_atomic_check() based on mdp clk limits
(2023-10-05 10:18:10 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git tags/drm-msm-next-2023-10-17

for you to fetch changes up to b08d26dac1a1075c874f40ee02ec8ddc39e20146:

  drm/msm/a7xx: actually use a7xx state registers (2023-10-16 09:38:56 -0700)

----------------------------------------------------------------
Updates for v6.7

DP:
- use existing helpers for DPCD handling instead of open-coded functions
- set the subconnector type according to the plugged cable / dongle
  skip validity check for DP CTS EDID checksum

DPU:
- continued migration of feature flags to use core revision checks
- reworked interrupts code to use '0' as NO_IRQ, removed raw IRQ indices
  from log / trace output

gpu:
- a7xx support (a730, a740)
- fixes and additional speedbins for a635, a643

core:
- decouple msm_drv from kms to more cleanly support headless devices (like
  imx5+a2xx)

----------------------------------------------------------------
Dmitry Baryshkov (40):
      drm/msm/dpu: remove irq_idx argument from IRQ callbacks
      drm/msm/dpu: extract dpu_core_irq_is_valid() helper
      drm/msm/dpu: add helper to get IRQ-related data
      drm/msm/dpu: make the irq table size static
      drm/msm/dpu: stop using raw IRQ indices in the kernel output
      drm/msm/dpu: stop using raw IRQ indices in the kernel traces
      drm/msm/dpu: shift IRQ indices by 1
      drm/msm/dpu: inline _setup_pingpong_ops()
      drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
      drm/msm/dpu: drop the DPU_PINGPONG_TE flag
      drm/msm/dpu: inline _setup_intf_ops()
      drm/msm/dpu: enable INTF TE operations only when supported by HW
      drm/msm/dpu: drop DPU_INTF_TE feature flag
      drm/msm/dpu: drop useless check from dpu_encoder_phys_cmd_te_rd_ptr_irq()
      drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init
      drm/msm/dp: support setting the DP subconnector type
      drm/msm: allow passing struct msm_kms to msm_drv_probe()
      drm/msm/dpu: move resource allocation to the _probe function
      drm/msm/mdp4: move resource allocation to the _probe function
      drm/msm/mdp5: move resource allocation to the _probe function
      drm/msm/dsi: switch to devm_drm_bridge_add()
      drm/msm/hdmi: switch to devm_drm_bridge_add()
      drm/msm/dp: move pdev from struct dp_display_private to struct msm_dp
      drm/msm/dp: switch to devm_drm_bridge_add()
      drm/msm: remove msm_drm_private::bridges field
      drm/msm: drop pm ops from the headless msm driver
      drm/msm: rename msm_pm_prepare/complete to note the KMS nature
      drm/msm: remove shutdown callback from msm_platform_driver
      drm/msm: rename msm_drv_shutdown() to msm_kms_shutdown()
      drm/msm: switch to drmm_mode_config_init()
      drm/msm: only register 'kms' debug file if KMS is used
      drm/msm: make fb debugfs file available only in KMS case
      drm/msm: carve out KMS code from msm_drv.c
      drm/msm: fix fault injection support
      drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
      drm/msm/dp: use correct lifetime device for devm_drm_bridge_add
      drm/msm/dsi: use msm_gem_kernel_put to free TX buffer
      drm/msm/dsi: free TX buffer in unbind
      drm/msm/a7xx: actually use a7xx state registers

Jani Nikula (1):
      drm/msm/dp: skip validity check for DP CTS EDID checksum

Jessica Zhang (4):
      drm/msm/dpu: Move setting of dpu_enc::wide_bus_en to atomic enable()
      drm/msm/dpu: Enable widebus for DSI INTF
      drm/msm/dsi: Add DATABUS_WIDEN MDP_CTRL2 bit
      drm/msm/dsi: Enable widebus for DSI

Konrad Dybcio (15):
      dt-bindings: display/msm/gmu: Add Adreno 7[34]0 GMU
      dt-bindings: display/msm/gmu: Allow passing QMP handle
      dt-bindings: display/msm/gpu: Allow A7xx SKUs
      drm/msm/a6xx: Add missing regs for A7XX
      drm/msm/a6xx: Add skeleton A7xx support
      drm/msm/a6xx: Send ACD state to QMP at GMU resume
      drm/msm/a6xx: Mostly implement A7xx gpu_state
      drm/msm/a6xx: Add A730 support
      drm/msm/a6xx: Add A740 support
      drm/msm/a6xx: Poll for GBIF unhalt status in hw_init
      drm/msm/adreno: Fix SM6375 GPU ID
      drm/msm/a6xx: Fix unknown speedbin case
      drm/msm/adreno: Add ZAP firmware name to A635
      drm/msm/adreno: Add A635 speedbin 0xac (A643)
      drm/msm/a6xx: Fix up QMP handling

Neil Armstrong (5):
      drm/msm/dpu: create a dpu_hw_clk_force_ctrl() helper
      drm/msm/dpu: add setup_clk_force_ctrl() op to sspp & wb
      drm/msm/dpu: move setup_force_clk_ctrl handling into plane and wb
      drm/msm/dpu: sm8550: remove unused VIG and DMA clock controls entries
      drm/msm/dpu: enable writeback on SM8550

Rob Herring (2):
      dt-bindings: display: msm: Add missing unevaluatedProperties on
child node schemas
      dt-bindings: display: msm: Make "additionalProperties: true" explicit

Ruan Jinjie (1):
      drm/msm: Remove unnecessary NULL values

Stephen Boyd (9):
      drm/msm/dp: Replace open-coded drm_dp_read_dpcd_caps()
      drm/msm/dp: Use drm_dp_read_sink_count() helper
      drm/msm/dp: Remove dead code related to downstream cap info
      drm/msm/dp: Remove aux_cfg_update_done and related code
      drm/msm/dp: Simplify with drm_dp_{max_link_rate, max_lane_count}()
      drm/msm/dp: Inline dp_link_parse_sink_count()
      drm/msm/dp: Remove dp_display_is_ds_bridge()
      drm/msm/dp: Inline dp_display_is_sink_count_zero()
      drm/msm/dp: Remove error message when downstream port not connected

 .../bindings/display/msm/dp-controller.yaml        |   1 +
 .../devicetree/bindings/display/msm/gmu.yaml       |  47 +-
 .../devicetree/bindings/display/msm/gpu.yaml       |   4 +-
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    |   6 +
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    |   6 +
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |  10 +
 .../bindings/display/msm/qcom,sc8280xp-mdss.yaml   |   4 +
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6125-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm6375-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8150-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     |   6 +
 .../bindings/display/msm/qcom,sm8350-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm8450-mdss.yaml     |   8 +
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     |   8 +
 drivers/gpu/drm/msm/Makefile                       |   1 +
 drivers/gpu/drm/msm/adreno/a6xx.xml.h              |   9 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              | 209 +++++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   3 +
 drivers/gpu/drm/msm/adreno/a6xx_gmu.xml.h          |   8 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 655 +++++++++++++++++++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  69 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |  65 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |  88 +++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  34 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   7 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  32 +-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |   8 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  10 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |   8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |   3 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |   8 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |   6 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  13 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  12 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  48 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  55 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  62 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  53 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 160 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  58 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  41 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |  21 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  23 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  21 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 139 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  42 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  72 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           |  30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |   4 -
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           | 112 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           | 106 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c           |   2 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  60 +-
 drivers/gpu/drm/msm/dp/dp_display.h                |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  21 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                    |   2 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |  38 +-
 drivers/gpu/drm/msm/dp/dp_panel.c                  | 130 +---
 drivers/gpu/drm/msm/dp/dp_panel.h                  |  11 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |  34 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   5 +-
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |   1 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  47 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  22 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   5 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  30 +-
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |   3 +-
 drivers/gpu/drm/msm/msm_debugfs.c                  |  12 +-
 drivers/gpu/drm/msm/msm_drv.c                      | 365 +-----------
 drivers/gpu/drm/msm/msm_drv.h                      |  17 +-
 drivers/gpu/drm/msm/msm_kms.c                      | 345 +++++++++++
 drivers/gpu/drm/msm/msm_kms.h                      |   3 +
 drivers/gpu/drm/msm/msm_ringbuffer.h               |   2 +
 99 files changed, 2365 insertions(+), 1403 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_kms.c
