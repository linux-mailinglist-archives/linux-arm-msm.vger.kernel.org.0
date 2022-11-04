Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7F7F46196D0
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Nov 2022 14:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231530AbiKDNDe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Nov 2022 09:03:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230301AbiKDNDc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Nov 2022 09:03:32 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0FFA315
        for <linux-arm-msm@vger.kernel.org>; Fri,  4 Nov 2022 06:03:30 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id u2so6258591ljl.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 04 Nov 2022 06:03:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NRhMNxQi6Qu7fp/d11z2XuTmlDZU0glcg0Uw8w9zeiw=;
        b=gIRqwUn/2btJsIMZEgpZeFlv5xMX1U4dhaUglHYKk0txFpixWoSmkyWLPKpDZ4PlvD
         sLTiWKJ7aGLvIhLrZ66WNAgY9ArJ2uNEk/ER5xgpMAllw6mRA1LnjBtr2CFwQqxgb074
         jchfQplVCkBAHM9mKAHySFdKdS6FMtwVsryX/8mO7ulWSlO2xUMAj9Q11wulCaAaPxVG
         501UxBoTShudVTpPG0HfM4TZZWiM9bqjxCimjSm2GYaxXEOK1X8n+9CzNAw7udDOBe1X
         SdMEpmFm3OlLGI8Wtjwmrou+NA8W+FedAWIyJ3TZpNiP2xMNHiV5RavpK7eiGg0qrKxL
         coFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NRhMNxQi6Qu7fp/d11z2XuTmlDZU0glcg0Uw8w9zeiw=;
        b=DNeXRtZO7JAZ1tkxRsFrB6/KJL6SXjIy4tyjirKySy8hZfUm7yWFuO7b1kXmAHyMIZ
         1qB2XqoX5mVawbGNh4uffQwUHEjrzXgKfydCy9riF7KUM4EqMdP1GaGmYa1f1HiHkfa2
         CkSk5qqdwFQAU9aAxsyekQR4lGq4/pmo7O1lbXR15rRlEKKmdgIk6yrKFifaRAneYRLR
         jN/LWsZXyUWr0rTMn6fzJko0EuM8dAs56uxdciE3ahg1EP6kCcKlfLwca7AGK+Ap1eZ9
         GQ87TRW8KU4vn2qle2nRJMlFPR76wJp82XRZxtrURmQrCDbEel7qCmVIepssTTIw4rLU
         XmwA==
X-Gm-Message-State: ACrzQf3GV2qgY2hAeacWVExLuyBvVSq7mU0WJ22OPAiJ1vVrtqetrx4n
        /zuZw8aNgPmW+c5ZdLE14SEAxg==
X-Google-Smtp-Source: AMsMyM4R4JXKI6jpXn5A+LUD4pafING6a+I3Qec0AyQfuWzhYM6M6siyNZT5loXbGGdBDiJqEkpf9Q==
X-Received: by 2002:a2e:9697:0:b0:277:74dd:1fac with SMTP id q23-20020a2e9697000000b0027774dd1facmr717357lji.307.1667567008379;
        Fri, 04 Nov 2022 06:03:28 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id s6-20020a2eb626000000b0026fe0a052c5sm419975ljn.129.2022.11.04.06.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Nov 2022 06:03:28 -0700 (PDT)
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
Subject: [PATCH v3 0/8] drm/msm: add support for SM8450
Date:   Fri,  4 Nov 2022 16:03:16 +0300
Message-Id: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
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

Dependencies for the DT bindings: [1].

[1] https://lore.kernel.org/all/20221024164225.3236654-1-dmitry.baryshkov@linaro.org/

Change since v2:
- Rebased onto msm-next-lumag
- Cleaned up bindings according to Krzysztof's suggestions

Change since v1:
- Fixed the regdma pointer in sm8450_dpu_cfg
- Rebased onto pending msm-next-lumag
- Added DT bindings for corresponding devices

Dmitry Baryshkov (8):
  dt-bindings: display/msm/dsi-controller-main: allow defining opp-table
  dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
  dt-bindings: display/msm: add support for the display on SM8450
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss: add support for SM8450

 .../display/msm/dsi-controller-main.yaml      |   3 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   2 +
 .../bindings/display/msm/qcom,sm8450-dpu.yaml | 132 +++++++
 .../display/msm/qcom,sm8450-mdss.yaml         | 347 ++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 +++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 128 ++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 15 files changed, 858 insertions(+), 15 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

