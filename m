Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 181E5746745
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 Jul 2023 04:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229779AbjGDCVm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 Jul 2023 22:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229732AbjGDCVl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 Jul 2023 22:21:41 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 834D5136
        for <linux-arm-msm@vger.kernel.org>; Mon,  3 Jul 2023 19:21:39 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-2b6c5ede714so61549181fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 03 Jul 2023 19:21:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688437298; x=1691029298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DNaLlgqmXpehmO7hZM6HUZEY+t0g3IozFf5sOQZ0Ryc=;
        b=lNL9v3nzQ/lezoz1Gp01ZULavvis0nYvkgfThOpMJSU6Z7nOvN9e47+kPCrQDshu6G
         Yj+IqwjTYcf/XJ1/FZE44cq8QdR+vj/6eClYBb1BhwntE7+SjVSxbSAGKcSYL8y1RccW
         3kCNUgeQvoUF+BWR/uBdWVkLVnfNqqbE3qt0PrZAO6UudvOhieCwhJYdpkDFpSN5quW2
         Csn6tQK3TsGCaZ4mfOSHR87tsorSqxX8cAtdO22UDWOj87g4zKRBnsnHlvKCtn71XNGa
         jv7m6p2hV0lA6RVE7+ru5eNzCkUdTHBTmOxVMdh3sREBaRWu1Nru1wS3QXaW3zulzXxU
         h44g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688437298; x=1691029298;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DNaLlgqmXpehmO7hZM6HUZEY+t0g3IozFf5sOQZ0Ryc=;
        b=L/SBGMJt9PeuSCRgSXUUQ7hxlxqsCncKb/9wSWJvssuJAC5e+2hyVLeKc/4nL857YM
         deMx+xZVeoHqMKVBqgFccXFKmWFJWHCYxIqpeP+8+ZlQWORptxhonoBc/KJ4eqZgVmBl
         gVPQviwApIE3U4QMrDJLXKkBSR8r8oWCoxXWR36uIZtS9l4ggO2abThNPLaA1YhaUaVo
         lraZlkBIGX07IREPUU5jXPi2FTJPUp2zbKwlxGgmz95p03W+Bj8zjmx9K3xJ5tkyDJHP
         P10LpPaRvTUGXnyxZ5F++jhZckAcZAnsLpgVQd1W4pkq8+eKT78PZqThmuCby0umBM0h
         V48Q==
X-Gm-Message-State: ABy/qLYz/kC4F/GcEqdmL3T6XG3OLtYbBNYwtUDfoMwBxlMqsuQojRll
        qEllfB58k/yS5zqPuKVuGcidlA==
X-Google-Smtp-Source: APBJJlFGwPZNfT8iGruH3zEpr4nbS1p+bTJ4441nfnVIgqJDUc/mp6piF1R95qKNTOIexPeWRlGasw==
X-Received: by 2002:a05:651c:231:b0:2b4:50b8:5d3b with SMTP id z17-20020a05651c023100b002b450b85d3bmr4268342ljn.0.1688437297303;
        Mon, 03 Jul 2023 19:21:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id y16-20020a05651c021000b002b6e863108esm1137830ljn.9.2023.07.03.19.21.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jul 2023 19:21:36 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v5 00/19] drm/msm/dpu: another catalog rework
Date:   Tue,  4 Jul 2023 05:21:17 +0300
Message-Id: <20230704022136.130522-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Having a macro with 10 arguments doesn't seem like a good idea. It makes
it inherently harder to compare the actual structure values. Also this
leads to adding macros covering varieties of the block.

As it was previously discussed, inline all foo_BLK macros in order to
ease performing changes to the catalog data.

Major part of the conversion was performed using vim script found at
[1]. Then some manual cleanups were applied, like dropping fields set to
0.

Changes since v4:
 - Fixed DSC 1.1 block length for sm6350 / sm6375 (Marijn, Abhinav)
 - Fixed a comment to dpu_hw_mdptop_init (Marijn)
 - Restored dpu_mdss_cfg argument to dpu_hw_mdptop_init() (Abhinav)
 - Reworded the commit message for the 'peer LM' patch (Abhinav)

Changes since v3:
 - Fixed DSC 1.1 block length to 0x140 (Marijn)
 - Fixed mdp->caps assignment in dpu_hw_mdptop_init() (Marijn)

Changes since v2:
 - Rebased on top of msm-next-lumag
 - Fixed MSM_DP/DSI_CONTROLLER_n usage in sm6350 and sm6375 catalog data
   (Abhinav, Marijn).

Changes since v1:
 - Rebased on top of msm-next
 - Dropped dependency on interrupt rework

[1] https://pastebin.ubuntu.com/p/K6vkjmxZdd/

Dmitry Baryshkov (19):
  drm/msm: enumerate DSI interfaces
  drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
  drm/msm/dpu: simplify peer LM handling
  drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
  drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
  drm/msm/dpu: expand .clk_ctrls definitions
  drm/msm/dpu: drop zero features from dpu_mdp_cfg data
  drm/msm/dpu: drop zero features from dpu_ctl_cfg data
  drm/msm/dpu: correct indentation for CTL definitions
  drm/msm/dpu: inline SSPP_BLK macros
  drm/msm/dpu: inline DSPP_BLK macros
  drm/msm/dpu: inline LM_BLK macros
  drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros
  drm/msm/dpu: inline MERGE_3D_BLK macros
  drm/msm/dpu: inline various PP_BLK_* macros
  drm/msm/dpu: inline WB_BLK macros
  drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
  drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
  drm/msm/dpu: drop empty features mask INTF_SDM845_MASK

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 327 ++++++++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 348 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 411 ++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 430 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 184 +++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  88 +++-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  88 +++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  95 +++-
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 244 ++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 484 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 445 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 467 ++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 130 -----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 23 files changed, 3320 insertions(+), 1571 deletions(-)

-- 
2.39.2

