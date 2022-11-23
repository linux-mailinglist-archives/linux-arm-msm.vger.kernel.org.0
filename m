Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9016636BCF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Nov 2022 22:04:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237158AbiKWVEI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Nov 2022 16:04:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236761AbiKWVEH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Nov 2022 16:04:07 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFD13922EB
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:05 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id z24so22758052ljn.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Nov 2022 13:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=r8jSJW2DFR9VpjYbtBoaMqz3ECt4+fqa37n6VL7mgaM=;
        b=VABAfQuuvb8XKvzRzWJQ2Nx9OC/N+P2FI0qVVF/DGRqLWxs1Lgo8PslmyMCTxloFkd
         KuJ/AuNCoqE4IrSIiWlmCkHS+XSwfXjJ8bqCBsMSlE62WGJU30Q+sdQSnLqBZKlh7yme
         AmxEoxLCgGD3KZDziUUCf3sn+CTQz2RYm8RVd4VPlGlakGeTTpE4+vgfCs/IWGTJ/AlH
         rGBhYGjfYDCQQ1Ch1vk6abH6KlBQ/KSd7l4vCBt6jFiW6kKt/5jKMlbwZ9If9rOysk2j
         JBtUb4whnExEsXReTxIqSuLw8DJfDiD3rDmyANGp7MLO5vSXRjRZPEcOMA0zPRuskKAk
         V3Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=r8jSJW2DFR9VpjYbtBoaMqz3ECt4+fqa37n6VL7mgaM=;
        b=Fx2LxAAyfFEont7t7DN7CnLBMQqwqt3WoArfg8fpAJ2Adu7IVHntEsNRYGFXe/xEoM
         xB+00tooJssSK+hF+KdS+H2MCbpthCDujYKXky3GtPDOuE7OBmRVCIdd+gvLsX7rzNIA
         LgR8AIhOLKgmilT+thii5Vu41X+YOUXOSmEwFclxfGopWC4AWo1HfN1/kLXVKW7m8J/e
         WcjM3MskxAPZr/kjoLjinDGbzmwLTrPiNOexKNW7pWEo51Mz5Hj2FuDavES9UlWT8G8o
         PxVROZ8+HuiAKbYv9OjUq3B6WOBF2wSQDO/S8g87h3oCqbaQLrjlucqlwmfJ180Z+DbK
         8gRA==
X-Gm-Message-State: ANoB5plDhf5OnKnxAsjTTulTGWkW4i/7m/KJmEPcYUraW0np3L93PUzE
        oJWdC6h/4Kl4PtE6eny1S0skUg==
X-Google-Smtp-Source: AA0mqf6hUv7nfOVapwBp29mpAtySAYhLc7gJ65sqHGeh0a1B5Q49xeUtXv8t3Q74MMLsdhUC6XSmBQ==
X-Received: by 2002:a2e:be8a:0:b0:26f:c081:9aed with SMTP id a10-20020a2ebe8a000000b0026fc0819aedmr9469424ljr.222.1669237444147;
        Wed, 23 Nov 2022 13:04:04 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id c3-20020ac25f63000000b004b177293a8dsm3009913lfc.210.2022.11.23.13.04.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Nov 2022 13:04:03 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 00/10] drm/msm: add support for SM8450
Date:   Wed, 23 Nov 2022 23:03:53 +0200
Message-Id: <20221123210403.3593366-1-dmitry.baryshkov@linaro.org>
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

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Change since v4:
- Fixed commit messages for the first two patches (Krzysztof)
- Dropped clock-names requirement patch
- Removed clock-names from qcom,sm8450-mdss.yaml schema
- Fixed the schema changes lost between v3 and v4 (thanks Krzysztof)
- Added kernel doc for DPU_MDP_PERIPH_0_REMOVED (Abhinav)
- Fixed build issue in dpu_kms_mdp_snapshot() (Niel)

Change since v3:
- Reworked the dpu-common.yaml / mdss-common.yaml to require properties
  from the same schema where they are defined (Krzysztof)
- Reworked PHY register settings to make it easier to understand
  (Konrad)

Change since v2:
- Rebased onto msm-next-lumag
- Cleaned up bindings according to Krzysztof's suggestions

Change since v1:
- Fixed the regdma pointer in sm8450_dpu_cfg
- Rebased onto pending msm-next-lumag
- Added DT bindings for corresponding devices

Dmitry Baryshkov (10):
  dt-bindings: display/msm: *dpu.yaml: split required properties clauses
  dt-bindings: display/msm: *mdss.yaml: split required properties
    clauses
  dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
  dt-bindings: display/msm: add support for the display on SM8450
  drm/msm/dsi/phy: rework register setting for 7nm PHY
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss add support for SM8450

 .../bindings/display/msm/dpu-common.yaml      |   4 -
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   2 +
 .../bindings/display/msm/mdss-common.yaml     |   1 -
 .../display/msm/qcom,msm8998-dpu.yaml         |   7 +
 .../display/msm/qcom,msm8998-mdss.yaml        |   3 +
 .../display/msm/qcom,qcm2290-dpu.yaml         |   7 +
 .../display/msm/qcom,qcm2290-mdss.yaml        |   3 +
 .../bindings/display/msm/qcom,sc7180-dpu.yaml |   7 +
 .../display/msm/qcom,sc7180-mdss.yaml         |   3 +
 .../bindings/display/msm/qcom,sc7280-dpu.yaml |   7 +
 .../display/msm/qcom,sc7280-mdss.yaml         |   3 +
 .../bindings/display/msm/qcom,sdm845-dpu.yaml |   7 +
 .../display/msm/qcom,sdm845-mdss.yaml         |   3 +
 .../bindings/display/msm/qcom,sm8250-dpu.yaml |   7 +
 .../display/msm/qcom,sm8250-mdss.yaml         |   3 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml | 139 +++++++
 .../display/msm/qcom,sm8450-mdss.yaml         | 343 ++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 141 +++++--
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 28 files changed, 922 insertions(+), 31 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

