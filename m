Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6577D639544
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Nov 2022 11:21:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229500AbiKZKVs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 26 Nov 2022 05:21:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbiKZKVr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 26 Nov 2022 05:21:47 -0500
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC18A2BCA
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 02:21:45 -0800 (PST)
Received: by mail-lf1-x133.google.com with SMTP id j16so10254456lfe.12
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Nov 2022 02:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8VB00XXo9e3yriyeL24q/eXlYJsfaOLwJ8XWwhfhTqA=;
        b=ExrqDAugiXRgy91CLwarhGFEg2Ez0q7BZo8oDcUf6yydxWCnLgivBeF83eURzwfnpQ
         eZamHzh8pJzdNT6OFEIScF297q1xIh7HbwQBnm+fKsmfUO0AHjbnENPtLa4n4AuFRB6N
         WyZKoig3IW8sWKQIzwKlOzu3GNBnOBQXgRlqd+49jsXOS2KKmARVDog/weVhWdz2/cVI
         praGx1Hv7QjII2hUfqHmzjNXKtmwSaSfyAs7OXsiUKBo6TICm/ORSoaW2XuAHtQ6UeFr
         p7TKnBoThURtQAeoMEkD0euo2R19wexdqox9v0D/O9s5Jep+wNRgHxa8pBr4fzpj6dJh
         Eh3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8VB00XXo9e3yriyeL24q/eXlYJsfaOLwJ8XWwhfhTqA=;
        b=1Y4zSYp8kvwKYKwYZYpeUoMuntpr+jUsQ8WpT3qoo+F6MfVI/LnRWNFyYRMESsCvjT
         q8SBd6JIg9dMCznndmwg6yD9II02e3IePwEsJnUB2o02UXL0V8HrfBAacyVKmXncsmYx
         QbM+eBV3TCz1fVWt+C4H6TYKXXMyYFBohGCyDrVlApvXmVQQyUPj1B1iUc8YOMTTUXPm
         QAYMiuS2WYiYlWp/ni31wruQfCxHffQ/9I4RZ9HEr1ovVGXq84PthHbjNQ870kgEPIqS
         EVLiLoxSaI0CYUINlPHBiVQMzZkGXDdSzKgI3CY18Z1tXC3MUH6RQenL4mTP2xvevTaz
         HAZg==
X-Gm-Message-State: ANoB5pmOdnVwQGCvP18+e32ay+0UtYIjFpGGN8fOkcM/HO0+Q+qauab+
        l/gcn+Hr44NJvdcuhHJQry2/0A==
X-Google-Smtp-Source: AA0mqf4biFG+SG+VDq69tcEYoguPGiqaqr8H2IKEfIUzcKZjPApuVbUInCBKJa5DsMyoifl9jz9ZAw==
X-Received: by 2002:ac2:518c:0:b0:4a2:4560:61e7 with SMTP id u12-20020ac2518c000000b004a2456061e7mr14010516lfi.170.1669458104099;
        Sat, 26 Nov 2022 02:21:44 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id q10-20020ac2528a000000b0048b003c4bf7sm875462lfm.169.2022.11.26.02.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Nov 2022 02:21:43 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org
Subject: [pull] drm/msm: drm-msm-display-for-6.2
Date:   Sat, 26 Nov 2022 12:21:41 +0200
Message-Id: <20221126102141.721353-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

As agreed with Rob Clark, a pull request for the non-GPU part of the drm/msm driver. Summary below.

The following changes since commit 7f7a942c0a338c4a2a7b359bdb2b68e9896122ec:

  Merge tag 'drm-next-20221025' of git://linuxtv.org/pinchartl/media into drm-next (2022-10-27 14:44:15 +1000)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git tags/drm-msm-display-for-6.2

for you to fetch changes up to 8d1d17d47eaebe4466459846d07e4ba8953fa585:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag (2022-11-26 12:06:29 +0200)

----------------------------------------------------------------
drm/msm updates for 6.2

Core:
- MSM_INFO_GET_FLAGS support
- Cleaned up MSM IOMMU wrapper code

DPU:
- Added support for XR30 and P010 image formats
- Reworked MDSS/DPU schema, added SM8250 MDSS bindings
- Added Qualcomm SM6115 support

DP:
- Dropped unsane sanity checks

DSI:
- Fix calculation of DSC pps payload

DSI PHY:
- DSI PHY support for QCM2290

HDMI:
- Reworked dev init path

----------------------------------------------------------------
Adam Skladowski (2):
      dt-bindings: display/msm: add support for SM6115
      drm/msm/disp/dpu1: add support for display on SM6115

Bryan O'Donoghue (1):
      dt-bindings: msm: dsi-controller-main: Drop redundant phy-names

Dan Carpenter (1):
      drm/msm/hdmi: remove unnecessary NULL check

Dmitry Baryshkov (25):
      Merge remote-tracking branch 'msm/msm-fixes' into HEAD
      drm/msm: less magic numbers in msm_mdss_enable
      drm/msm/mdp5: stop overriding drvdata
      dt-bindings: display/msm: split qcom, mdss bindings
      dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
      dt-bindings: display/msm: add interconnects property to qcom, mdss-smd845
      dt-bindings: display/msm: move common DPU properties to dpu-common.yaml
      dt-bindings: display/msm: move common MDSS properties to mdss-common.yaml
      dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
      dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
      dt-bindings: display/msm: add missing device nodes to mdss-* schemas
      dt-bindings: display/msm: add support for the display on SM8250
      drm/msm/hdmi: use devres helper for runtime PM management
      drm/msm/hdmi: drop constant resource names from platform config
      drm/msm: move domain allocation into msm_iommu_new()
      drm/msm: remove duplicated code from a6xx_create_address_space
      drm/msm/hdmi: move resource allocation to probe function
      drm/msm/hdmi: don't take extra reference on PHY device
      drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()
      dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
      drm/msm/mdp5: fix reading hw revision on db410c platform
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi' and 'msm-next-lumag-mdp5' into msm-next-lumag

Jessica Zhang (2):
      drm/msm/dpu: Add support for XR30 format
      drm/msm/dpu: Add support for P010 format

Johan Hovold (2):
      drm/msm/dp: drop modeset sanity checks
      drm/msm/dsi: drop modeset sanity checks

Kuogee Hsieh (2):
      drm/msm/dp: replace variable err with len at dp_aux_link_power_up()
      drm/msm/dp: retry 3 times if set sink to D0 poweer state failed

Liu Shixin (1):
      drm/msm/dpu: use DEFINE_SHOW_ATTRIBUTE to simplify dpu_regset32

Loic Poulain (2):
      dt-bindings: display/msm: Add QCM2290 DSI phy
      drm/msm/dsi: Add phy configuration for QCM2290

Marijn Suijten (11):
      drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional bits
      drm/msm/dsi: Remove useless math in DSC calculations
      drm/msm/dsi: Remove repeated calculation of slice_per_intf
      drm/msm/dsi: Use DIV_ROUND_UP instead of conditional increment on modulo
      drm/msm/dsi: Reuse earlier computed dsc->slice_chunk_size
      drm/msm/dsi: Appropriately set dsc->mux_word_size based on bpc
      drm/msm/dsi: Migrate to drm_dsc_compute_rc_parameters()
      drm/msm/dsi: Account for DSC's bits_per_pixel having 4 fractional bits
      drm/msm/dsi: Disallow 8 BPC DSC configuration for alternative BPC values
      drm/msm/dpu1: Account for DSC's bits_per_pixel having 4 fractional bits
      drm/msm/dsi: Prevent signed BPG offsets from bleeding into adjacent bits

Rob Clark (1):
      drm/msm: Add MSM_INFO_GET_FLAGS

Robert Foss (1):
      drm/msm/dpu: Refactor sc7280_pp location

 .../bindings/display/msm/dpu-common.yaml           |  52 +++
 .../bindings/display/msm/dpu-msm8998.yaml          | 223 -----------
 .../bindings/display/msm/dpu-qcm2290.yaml          | 222 -----------
 .../bindings/display/msm/dpu-sc7180.yaml           | 235 ------------
 .../bindings/display/msm/dpu-sc7280.yaml           | 239 ------------
 .../bindings/display/msm/dpu-sdm845.yaml           | 217 -----------
 .../bindings/display/msm/dsi-controller-main.yaml  |   5 +-
 .../bindings/display/msm/dsi-phy-14nm.yaml         |   1 +
 .../devicetree/bindings/display/msm/mdp5.txt       |  30 +-
 .../bindings/display/msm/mdss-common.yaml          |  83 ++++
 .../devicetree/bindings/display/msm/qcom,mdss.yaml | 196 ++++++++++
 .../bindings/display/msm/qcom,msm8998-dpu.yaml     |  95 +++++
 .../bindings/display/msm/qcom,msm8998-mdss.yaml    | 268 +++++++++++++
 .../bindings/display/msm/qcom,qcm2290-dpu.yaml     |  84 ++++
 .../bindings/display/msm/qcom,qcm2290-mdss.yaml    | 198 ++++++++++
 .../bindings/display/msm/qcom,sc7180-dpu.yaml      |  95 +++++
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     | 304 +++++++++++++++
 .../bindings/display/msm/qcom,sc7280-dpu.yaml      |  98 +++++
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 422 +++++++++++++++++++++
 .../bindings/display/msm/qcom,sdm845-dpu.yaml      |  90 +++++
 .../bindings/display/msm/qcom,sdm845-mdss.yaml     | 270 +++++++++++++
 .../bindings/display/msm/qcom,sm6115-dpu.yaml      |  94 +++++
 .../bindings/display/msm/qcom,sm6115-mdss.yaml     | 182 +++++++++
 .../bindings/display/msm/qcom,sm8250-dpu.yaml      |  92 +++++
 .../bindings/display/msm/qcom,sm8250-mdss.yaml     | 330 ++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                        |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  33 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  14 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c         |  10 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            |  36 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c        |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 104 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |   2 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  19 +-
 .../gpu/drm/msm/disp/mdp4/mdp4_lvds_connector.c    |   5 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  27 +-
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  13 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |  23 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    |  34 ++
 drivers/gpu/drm/msm/dp/dp_link.c                   |  21 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |   6 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   5 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   9 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 121 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c         |  17 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 359 ++++++++----------
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |   3 -
 drivers/gpu/drm/msm/msm_drv.c                      |  29 +-
 drivers/gpu/drm/msm/msm_gem_submit.c               |   9 +-
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +
 drivers/gpu/drm/msm/msm_gpu.h                      |   4 +
 drivers/gpu/drm/msm/msm_iommu.c                    |  20 +-
 drivers/gpu/drm/msm/msm_mdss.c                     |  85 ++++-
 drivers/gpu/drm/msm/msm_mmu.h                      |   3 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   3 +-
 include/uapi/drm/msm_drm.h                         |   1 +
 66 files changed, 3602 insertions(+), 1627 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-common.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
 delete mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/mdss-common.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml
