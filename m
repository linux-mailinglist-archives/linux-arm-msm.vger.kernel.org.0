Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 21B7565CF16
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Jan 2023 10:08:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbjADJIw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Jan 2023 04:08:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34260 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234504AbjADJIu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Jan 2023 04:08:50 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A586DFD8
        for <linux-arm-msm@vger.kernel.org>; Wed,  4 Jan 2023 01:08:48 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id ja17so25065793wmb.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Jan 2023 01:08:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RLgWl/+12+zYaLEmWDfGej8mqhlvU+lC1KAgdBYbhOc=;
        b=fBpz2cR/BQrD2tt7gREAr8ZabnXD8IRRis/Ub2MJSH1aj55C6B4l056SBEOxxH0g5J
         5emTxod52CCJ9LDqQk7+J0leY+/AEX6eWxQ7ZbsBRZ9KR4o9pBPBFdlIkAJJv1bb7MBr
         ga3hnCz8cU2Z8fHZW6gbcMVt0KcS3lur+DvS1ebWwO5FH2XmVIcjyGFSK0Y1Jwvb+4TX
         G3MYIKnHXRsrEGHALpZqA02+0arhxa3G2gQMj3BGZ2mYNO8BKTGsj3Dk2mwPu0xdQMBf
         ucgSYmRND1BemQuA3s68G/d6pBlk/3ChE+e6IryCtjhwHuUKEiRO0AEkQQ9/qaErmK1E
         ByDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RLgWl/+12+zYaLEmWDfGej8mqhlvU+lC1KAgdBYbhOc=;
        b=70jAj1AUd2DCjpNwr7JobHnAycdAwmU2Bi6QmK8/rkL0IH8dopiBeFlNnkcyEmLGtF
         YK9Sg4HyZ5TT0MFCu/mnnZkDuMt3Np3Z+ImrEwo+gOkh+BDyA793dXRrBI790B/cD6P4
         yEAL0QuxYXtDlhk2N2lv6TojtkRvduD8GdI7Adah5UB0X7YBatoG+l9oQcWg9D4cLl6F
         UVyHIu5pnuuFs8C7NbHs/uq3ZhwY77qMq/DNEIdAIjHaue+PGYRAP0XbsGr60z6bi5wm
         PXKWPdnLHN/Y4EjFiweUBFjSPHz9UARt8FlvQKzaa0ScaSEMe+35XIf/uDYuYk6a9nFb
         xPoQ==
X-Gm-Message-State: AFqh2kqTz5+nJLpJIwpNinfwDddLQ+7KDTo0XpWzChGXDb54HF+6FS/y
        tk8OQruYK58ZzLbdqkq2++48AA==
X-Google-Smtp-Source: AMrXdXue543tPVOInDtzTa5ylHEcT2zRX1xuy44MXPa77K3UY9MtF3gnab0PLt7WNDRoSiczUipSSQ==
X-Received: by 2002:a05:600c:512a:b0:3d3:3c60:b2bb with SMTP id o42-20020a05600c512a00b003d33c60b2bbmr33281924wms.23.1672823326934;
        Wed, 04 Jan 2023 01:08:46 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id j34-20020a05600c1c2200b003d98438a43asm36124622wms.34.2023.01.04.01.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jan 2023 01:08:46 -0800 (PST)
From:   Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH 0/6] drm/msm: add support for SM8450
Date:   Wed, 04 Jan 2023 10:08:43 +0100
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABtCtWMC/x2NQQqDMBAAvyJ77kJMCNh+pfSwJmtdMDFkVQri3
 xs8zhxmTlCuwgqv7oTKh6isuUH/6CDMlL+MEhuDNdaZ3jjc1iIBNQ3eG9yLbpUpYYqqGFXQ+UAD
 BSZvn9AiIynjWCmHuWXyvixNlsqT/O7r+3Ndf1O0oWqFAAAA
To:     Rob Clark <robdclark@gmail.com>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.11.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8550 platform.

This patchset is based on the SM8450 display support serie at [1].

In order to work, the following patchsets are required:
- PM8550 LDO fix at [2]
- DISPCC driver at [3]

+ the DT changes.

[1] https://lore.kernel.org/all/20221207012231.112059-1-dmitry.baryshkov@linaro.org/
[2] https://lore.kernel.org/all/20230102-topic-sm8550-upstream-fixes-reg-l11b-nldo-v1-1-d97def246338@linaro.org/
[3] https://lore.kernel.org/all/20230103-topic-sm8550-upstream-dispcc-v1-0-81bfcc26b2dc@linaro.org/

To: Rob Clark <robdclark@gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Sean Paul <sean@poorly.run>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh+dt@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
To: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>

---
Neil Armstrong (6):
      dt-bindings: display/msm: document the SM8550 DSI PHY
      dt-bindings: display/msm: document the display hardware for SM8550
      drm/msm/dpu: add support for SM8550
      drm/msm: mdss: add support for SM8550
      drm/msm/dsi: add support for DSI-PHY on SM8550
      drm/msm/dsi: add support for DSI 2.7.0

 .../bindings/display/msm/dsi-phy-7nm.yaml          |   1 +
 .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++
 .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
 drivers/gpu/drm/msm/Kconfig                        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 197 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c                  |  16 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 102 +++++--
 drivers/gpu/drm/msm/msm_mdss.c                     |   2 +
 14 files changed, 775 insertions(+), 20 deletions(-)
---
base-commit: d862fd95b9c924bd0a257f7708a6e3868d39ff43
change-id: 20230103-topic-sm8550-upstream-mdss-dsi-35ca8acea529

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>
