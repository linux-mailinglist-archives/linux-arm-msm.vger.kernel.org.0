Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAEF5735EF9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jun 2023 23:25:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229763AbjFSVZ1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 19 Jun 2023 17:25:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229632AbjFSVZY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 19 Jun 2023 17:25:24 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9930E5
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:22 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4f8792d2e86so535425e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Jun 2023 14:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687209921; x=1689801921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=exiUNDF+HLAmrnFOJCdCXslDvr1fdVOQP4pLWtKVC4Y=;
        b=M2yv01uKGXVKwbSTF0Y1mXa5MjewuYlrIAI/9n5uYPuzLGPiKhTOziMwr5XVb8o5k9
         1dZ0Y2QBA1gR01v1og97H5lim3oKLZkHHoz8lWvIW21aZAufl/TkCeoAr+t2SUJ/tL+a
         CqItG/9S9fYVah2wN0TsLmlvdhMuNdGfrug/JuvTPTISJ7/ouYbbL10GllpDHWO0JKAQ
         YlOji7tzp29AofTQps52T5sGFsxibjJVFQoBFcx5kYW+/IvZezSxatAUSl0YDTB3BTQ+
         1TV9pa/BN+4ioxXNFqYM4HUo3L8LPYanG0Gj4ZGF9r9FyTGFzDAZojD+ecY6gU5DHS6R
         Cu0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687209921; x=1689801921;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=exiUNDF+HLAmrnFOJCdCXslDvr1fdVOQP4pLWtKVC4Y=;
        b=EsmDVSGPSCd7dNUuWvO346JOx8O+8PEH07U7L+Qxuz9faztPicH4caKllBLRg/OMwN
         va41uZkw7dE68vHhh5ieeMlEiTd15TQq9vBipQDAQf4LMcLPBhhbnf0ulT4Jpjeqf97f
         WDLtguKonXUHcyPiCTqWX4s2nWmB+QvUaUrarVORaTt27dnnEidnWOYFza5UPI77kVBR
         MlVIxBlcokRrLHlU3Bc8A+hevbnvWr6tifwWjeFwNAasAMwlKlw8zPrUekxGpKG6ByII
         mCqi9R3UijMwnbr/x2qEcSYneRKz+XY6kmvpOJi+RAghh636BQyXjFwbsEZAC+Ocd+tw
         tJJA==
X-Gm-Message-State: AC+VfDxHyfyMh4wxQz/iHqbh/PBvOnmLDWjTRIw0nnfH2FeUTYAq3dGZ
        DepPUdYOWI7qH/DySgmUUhjGiQ==
X-Google-Smtp-Source: ACHHUZ6xStTemwjKOPg3BoWhXDlyu//kiuJceBLdouHhOMARUQXFtWJJWfvI6cNaSpIFQ9hleAcRcg==
X-Received: by 2002:a19:660a:0:b0:4f6:424c:4fa8 with SMTP id a10-20020a19660a000000b004f6424c4fa8mr5679570lfc.17.1687209920828;
        Mon, 19 Jun 2023 14:25:20 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 14:25:20 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Marijn Suijten <marijn.suijten@somainline.org>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v4 00/19] drm/msm/dpu: another catalog rework
Date:   Tue, 20 Jun 2023 00:25:00 +0300
Message-Id: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
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

Dependencies: msm-next-lumag.

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
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |  37 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h    |   9 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  34 +-
 drivers/gpu/drm/msm/msm_drv.h                 |   8 +-
 23 files changed, 3321 insertions(+), 1576 deletions(-)

-- 
2.39.2

