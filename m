Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4B8667219B5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  4 Jun 2023 22:35:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229449AbjFDUfi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jun 2023 16:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230403AbjFDUfh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jun 2023 16:35:37 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7AECE
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jun 2023 13:35:36 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-4f60bc818d7so4313790e87.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jun 2023 13:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685910934; x=1688502934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6ypl4i2KG/p31Wh9Yo8dE/0AhcoBByLO3ViH5R2zIzI=;
        b=Ic/W8zvMs9v9kCqyHDDrchWJKIh3KkAF/5BX4fLAO2BjRrZ1C9CxqkHja1Mh9EsZKB
         ClxFkJFYAyrifTpJg7UZ7XY+S7SEZpo0VlXEu4FvrZYOldh98iReEwg2UwB7xtRGl/5f
         9iADtN5tPAu1vwvj1B5QzIdnnEYE662YKRR76iEh2bgMQTI1BD/AINoci59+zs31L+D3
         5M/g6MYvBO2PZCxJTph3EV7sWrO+icu223DQBMOF2I39fJa6JzGpm9NppjPFU80EfnkE
         bdlP8/vdckN/dNSqx4DVt4aoLUIzBXoTsmlqbtOn6PlwDjT3r3IRhfmaIrV8kdfYgYkz
         15Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685910934; x=1688502934;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6ypl4i2KG/p31Wh9Yo8dE/0AhcoBByLO3ViH5R2zIzI=;
        b=RJPqIb4D7QG+qhR+gayoz2633x18dfoc2b/QP2DXwqw98AbUnLfmCbzPIHUmxdgf+q
         EsZMghvb7/iTHHSfHsgRU4+Gegdnep/IleurPxa+axNQ84cCvqtoXC3PLcUQClnuCyxv
         CVQG3yj2tt0RxanQcsqbB/i1r4Eov71boanJ2q6Q8TUpefiwJqullORU441RKz8aLDRy
         giqyzwhgOazDiFhT+Q9DHX8gy+9Jk5bsYs5AbVWljBylnUVsocm9nLmlVDaA7hl9YD/I
         0cd6Z+nGZ+KF8K5qGWWSNtt4WzD69csPiol+megpXTXVPOqoG1wF5zsh1+Vxx59APkLA
         vAyQ==
X-Gm-Message-State: AC+VfDwXLLTSVDNjqoqGgWQeF3SYRcKch0g1mfied4hMd/CKCocxzkRe
        v23eSh1XVMfYfUb3bnKade9aVQ==
X-Google-Smtp-Source: ACHHUZ4rES9qkxHO0G/LplW9cAUf8KhUTYlN5iFkSWMA0tlMO4SMEmXFknvBcIJufCSDHKkjQbnL7Q==
X-Received: by 2002:ac2:4d1b:0:b0:4f5:1ac9:ab1b with SMTP id r27-20020ac24d1b000000b004f51ac9ab1bmr3822484lfi.23.1685910934443;
        Sun, 04 Jun 2023 13:35:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 13:35:33 -0700 (PDT)
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
Subject: [PATCH 00/22] drm/msm/dpu: another catalog rework
Date:   Sun,  4 Jun 2023 23:35:10 +0300
Message-Id: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
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

Dependencies: [2].

[1] https://pastebin.ubuntu.com/p/mQRhBRXTJs/
[2] https://patchwork.freedesktop.org/series/118836/

Dmitry Baryshkov (22):
  drm/msm/dpu: correct MERGE_3D length
  drm/msm/dpu: remove unused INTF_NONE interfaces
  drm/msm: enumerate DSI interfaces
  drm/msm/dpu: always use MSM_DP/DSI_CONTROLLER_n
  drm/msm/dpu: simplify peer LM handling
  drm/msm/dpu: drop dpu_mdss_cfg::mdp_count field
  drm/msm/dpu: drop enum dpu_mdp and MDP_TOP value
  drm/msm/dpu: expand .clk_ctrls definitions
  drm/msm/dpu: drop zero features from dpu_ctl_cfg data
  drm/msm/dpu: correct indentation for CTL definitions
  drm/msm/dpu: drop zero features from dpu_mdp_cfg data
  drm/msm/dpu: inline SSPP_BLK macros
  drm/msm/dpu: inline DSPP_BLK macros
  drm/msm/dpu: inline LM_BLK macros
  drm/msm/dpu: inline DSC_BLK macros
  drm/msm/dpu: inline MERGE_3D_BLK macros
  drm/msm/dpu: inline various PP_BLK_* macros
  drm/msm/dpu: inline WB_BLK macros
  drm/msm/dpu: inline INTF_BLK and INTF_BLK_DSI_TE macros
  drm/msm/dpu: drop empty features mask MERGE_3D_SM8150_MASK
  drm/msm/dpu: drop empty features mask INTF_SDM845_MASK
  drm/msm/dpu: move DPU_PINGPONG_DSC to PINGPONG_SDM845_MASK

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   | 321 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    | 320 +++++++++----
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    | 410 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   | 448 ++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    | 429 ++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 177 +++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  87 ++--
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  87 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 389 +++++++++++----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 224 ++++++---
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  | 449 +++++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    | 415 +++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    | 439 ++++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 134 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   5 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 21 files changed, 3109 insertions(+), 1315 deletions(-)

-- 
2.39.2

