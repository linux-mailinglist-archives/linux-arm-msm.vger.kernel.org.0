Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A42B96450E4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Dec 2022 02:22:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbiLGBWh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Dec 2022 20:22:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229573AbiLGBWg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Dec 2022 20:22:36 -0500
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60AFB0A
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Dec 2022 17:22:33 -0800 (PST)
Received: by mail-lj1-x22b.google.com with SMTP id f16so7569434ljc.8
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Dec 2022 17:22:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6JsCAvyAfveyw9UPyr+8LrwAhQksbXtuQSIuymG2nWo=;
        b=wdZfS3zirQtcwcjkMhQLrCB409axGi3IAV1QN7xtUK30znHu4gQywV6Y7KJtk73G37
         Mr/cRO0PmtiMGWgfhxqs+GMgW4JnM37nfwqNFK66VCnjsUFXmbe6jnOWl8ogkkYLVjCo
         YV57vZozd0/qEurAsrRz1dya1H4L8/7CETTr0x/rq6+DQLbUdXFNVk6y2Cot3qYJp/aC
         6131QOfIXDRdONVfHWn0UyeftYuDpIhfTzUBZi8hOs2o/MWkyybyOhmFDFgqQ/GGHDia
         38FL16TuBMR81YXcCd/PsGCDYPCtLyW9NMgXGVIYolhP+mQGq/Uh4Ge4uQ6XprntMoQg
         MG2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6JsCAvyAfveyw9UPyr+8LrwAhQksbXtuQSIuymG2nWo=;
        b=mvyA8+8qdmXfW5FmwOkY0bF/cY7Z1plSSOebc0itkZn/SRwxII9e3hi/I/RhMODawn
         PkFiy7FynqCISB0RcfewvuChfjzqqP8Dqi1rM01VpLuK8nvBTTUKrEgGXM2I39MZjcaX
         Hsbm4f1LuPnmUNC1mjB9MKcdiYTz9zDBQsgnfEeQlFsNYL5qiktCbkdH6PNpH3i/pWwS
         VrPX5ozEs9AfWFHgb9h7ZI23OIB0Zf/AG4bP477LxJTxHNHP2TXm9v/x6W/c7Juojpgi
         7yrJBX77v5D8CJiiy5f57lzG05C83RMqZxcMrkRn05GHF7kzqBOpu/Cc1OlqBaFP8mGy
         6WFg==
X-Gm-Message-State: ANoB5pnGAjcbEbogJKgZWgDub4CLojFkOqDU1e4WED2i+UDIecdhON+k
        Zbat8nw95eWQNNCDsQtdUfj2tZvkoRw2JhRFLwWD2A==
X-Google-Smtp-Source: AA0mqf7Q1LVRcqmmGODJnmkV7bqLX7h1PHzArjhMzVYApUWOp6+LZHzL/f7Lc32T52VdCwrGhcY+4A==
X-Received: by 2002:a2e:a90b:0:b0:277:794:ae09 with SMTP id j11-20020a2ea90b000000b002770794ae09mr27417891ljq.286.1670376152271;
        Tue, 06 Dec 2022 17:22:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Dec 2022 17:22:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v6 00/11] drm/msm: add support for SM8450
Date:   Wed,  7 Dec 2022 03:22:20 +0200
Message-Id: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
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

Change since v5:
- Added defines to be used for the MDP_PERIPH_TOP0 blackhole

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

Dmitry Baryshkov (11):
  dt-bindings: display/msm: *dpu.yaml: split required properties clauses
  dt-bindings: display/msm: *mdss.yaml: split required properties
    clauses
  dt-bindings: display/msm: add sm8350 and sm8450 DSI PHYs
  dt-bindings: display/msm: add support for the display on SM8450
  drm/msm/dsi/phy: rework register setting for 7nm PHY
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: merge all MDP TOP registers to dpu_hwio.h
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  25 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hwio.h      |  21 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 141 +++++--
 drivers/gpu/drm/msm/msm_mdss.c                |   5 +
 30 files changed, 943 insertions(+), 56 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-dpu.yaml
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml

-- 
2.35.1

