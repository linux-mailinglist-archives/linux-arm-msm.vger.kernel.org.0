Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 95ADE732CB8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jun 2023 12:03:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241358AbjFPKDa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 06:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232372AbjFPKDZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 06:03:25 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A7062137
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:24 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4f76a0a19d4so604175e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 03:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686909802; x=1689501802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wqvCgQcB3Bv4IdopumPU4IXPG8TJ8H9aWDi0425LcU8=;
        b=jRnNwVx4kuiOhl9c7s8HE20l/pDDXGkSVuZLy/P70BCAd6jMUtSQ9fvECPc/YF+ke2
         HyQy//r8sCxOVbHvwsQBIdZZuE4h879AUfEZm9FK9Xe/2D+LFi7yBvLgYUbNU0zNKLlx
         Jm8oh4GvRambtGCBkTxRKCYZPaGz5GMGm+frqV9GRhr9PdNTNw64DAd2UpTqt6ujBWV9
         nBiS4SfDTsSWx+hLpanMeIy6mK/KTpcWmDBoaWNnfkJ5QDQzOTZ1mKpE6HSbqn/vQDYt
         rC+k8SkbKzOGv/Nlkx0hwqelpAnqyx5U2sHdQwOhF1PdOdpUhbHg59cpPDz0jNTAX/9G
         L+BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686909802; x=1689501802;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wqvCgQcB3Bv4IdopumPU4IXPG8TJ8H9aWDi0425LcU8=;
        b=KZaHvF8TDXmfVlnc7iweikIpbm2RBm8TstqN1y8+ZEoGoRy3SIfKpktDy0ZE++bp04
         VjjdYPF6Duzp28cKVF75qPZMDAAozrUjD/rNVWxEeHaTXM9K6ccVdI7YhmYXh3JCyAsQ
         aF4LvnY7j836oQ/g1tWroMXw/5t2WMp3C/YnrWKilEJOaKnOM/GRpnkekPNWkoc7NG1s
         MSOnaWBGuFhEPVl+DIWulymiaa9NjT7vmWA9bE1h4u2dFicniJxj1bb75nHVcbftgrGz
         TDqnirb3R9NXN67/Em/3zUCDc3HyRfvnoD5OUnrqh3ScscZDwClMqznZtNA5TGplzl9w
         p0Lw==
X-Gm-Message-State: AC+VfDxTETP6+unT+FjhI96El2KFtfV7vR51xmk2z6vkTzZm8O+nJNQU
        HjwfxfVKHb3e4X6Ra+bXrCRMbQ==
X-Google-Smtp-Source: ACHHUZ44G32FwLMijo5mBxcqQF7R/SrfcUW605+MOMTaWwmMZ/8fbLI81k6Wp5v5HOjdaDcI+TM3MQ==
X-Received: by 2002:a05:6512:1c5:b0:4f6:217a:5615 with SMTP id f5-20020a05651201c500b004f6217a5615mr873574lfp.38.1686909802612;
        Fri, 16 Jun 2023 03:03:22 -0700 (PDT)
Received: from eriador.lan (85-76-68-127-nat.elisa-mobile.fi. [85.76.68.127])
        by smtp.gmail.com with ESMTPSA id r12-20020ac24d0c000000b004f4ce9c9338sm2967423lfi.283.2023.06.16.03.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jun 2023 03:03:21 -0700 (PDT)
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
Subject: [PATCH v3 00/19] drm/msm/dpu: another catalog rework
Date:   Fri, 16 Jun 2023 13:02:58 +0300
Message-Id: <20230616100317.500687-1-dmitry.baryshkov@linaro.org>
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

Dependencies: msm-next-lumag.

Changes since v2:
 - Rebased on top of msm-next-lumag
 - Fixed MSM_DP/DSI_CONTROLLER_n usage in sm6350 and sm6375 catalog data
   (Abhinav, Marijn).

Changes since v1:
 - Rebased on top of msm-next
 - Dropped dependency on interrupt rework

[1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
[2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1

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

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 329 ++++++++----
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 23 files changed, 3320 insertions(+), 1572 deletions(-)

-- 
2.39.2

