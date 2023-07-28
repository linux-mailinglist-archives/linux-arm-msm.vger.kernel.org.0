Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E5FD97677AC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jul 2023 23:33:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234290AbjG1Vdk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jul 2023 17:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232597AbjG1Vdi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jul 2023 17:33:38 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B97F03C28
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:24 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-4fe216edaf7so1208916e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jul 2023 14:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690580003; x=1691184803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F7AFpVLhQJ5PQc/Bf5DhP3xmGWkfC7iIPHliAm6mja0=;
        b=w0L3KwsYOQUAN+diOBY57sZAYZHnhjzw6UGdkhWBaGp9ISM3Ur15ffpL/3w6hZmMcQ
         amkK+hLMd5BrmtjZ+7oAQ6+GeLJR+4kVbMnPWs7Hfx7F79s/dSaGgUq1E+dTthwj1hEJ
         23d5i8tuhkDB6hn4GEAgl8VUPjzLWrL3RlV5cFfZBhcrX7OhD203WOfdB/wk4/ZjXD7g
         m4qAsi8VzNP/unJZdL6LfdELMXysxzPnqFXOPDggyluA8xs+fPO+TGSM745RoHoUvKzJ
         K6ieqeh/f6ND/aiHvcyC3KvFz5Qg+mTevTciEVYnXzhbmiWravrvA8/e8ft6CRiOtoJv
         udrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690580003; x=1691184803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F7AFpVLhQJ5PQc/Bf5DhP3xmGWkfC7iIPHliAm6mja0=;
        b=OdE/t7uWmCn0/BsmxJ9cz7aVv5yQAKxEUxKATiev2121Zoorljb7LEkcfLjWla9wRw
         oyAIrE+Q173Rfdda+Sr67RoU0VA3rMmveULoaEnkiIsC5wcEfZiJtR8Oz7vMAtz56Ok3
         sFC1MyPlJI2cd5/l7/plR88I8soieZBwipaltxE9KFl+iGvLaLlZ1ViRDqIrbvvo8b0U
         urOLINe9Cz1F/AtZwE0KovCQ9Q80UuPnH5GReyVfzn+k2/9bAMgrqqhN76x+NgxcL/ba
         BpFR3KgX+xUslUDRb5WB26Zl1EkTDZ95JcDZyIN3mlWv0ueCrDspMGlRKWPfBLyPAXkp
         H40Q==
X-Gm-Message-State: ABy/qLZ1RvSim/Fkr3J7VtOb8Zg70eiKBzPODsGC0/mDk/QWTGoFF9Xv
        UOhG9SJbi7cGZYzAIjw2QcjHgkHFvZPiMsJPTK0=
X-Google-Smtp-Source: APBJJlHxGbDJja2pdb+Wwf+iFSEYszqRvIhTT2xYVNPer07dc5u/0DQg0cL916VpbKbH90v0/mN/MQ==
X-Received: by 2002:a05:6512:3118:b0:4fb:a088:cfca with SMTP id n24-20020a056512311800b004fba088cfcamr1289422lfb.6.1690580002982;
        Fri, 28 Jul 2023 14:33:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id n16-20020a056512389000b004fe13318aeesm956832lft.166.2023.07.28.14.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jul 2023 14:33:21 -0700 (PDT)
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
Subject: [PATCH v2 0/7] drm/msm/dpu: use UBWC data from MDSS driver
Date:   Sat, 29 Jul 2023 00:33:13 +0300
Message-Id: <20230728213320.97309-1-dmitry.baryshkov@linaro.org>
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

Both DPU and MDSS programming requires knowledge of some of UBWC
parameters. This results in duplication of UBWC data between MDSS and
DPU drivers. To remove such duplication and make the driver more
error-prone, export respective configuration from the MDSS driver and
make DPU use it, instead of bundling a copy of such data.

Changes since v1:
 - Rebased on top of msm-next-lumag
 - Reworked commit message by patch #5, following the request by Abhinav
 - Dropped DPU_HW_UBWC_VER_xx values
 - Also removed DPU_MDP_*BWC* defines

Dmitry Baryshkov (7):
  drm/msm/mdss: correct UBWC programming for SM8550
  drm/msm/mdss: rename ubwc_version to ubwc_enc_version
  drm/msm/mdss: export UBWC data
  drm/msm/mdss: populate missing data
  drm/msm/dpu: use MDSS data for programming SSPP
  drm/msm/dpu: drop UBWC configuration
  drm/msm/dpu: drop BWC features from DPU_MDP_foo namespace

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  6 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  5 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |  6 --
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  7 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  7 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  6 --
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    | 32 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 18 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       | 16 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  2 +
 drivers/gpu/drm/msm/msm_mdss.c                | 94 ++++++++++++-------
 drivers/gpu/drm/msm/msm_mdss.h                | 27 ++++++
 25 files changed, 121 insertions(+), 181 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.h

-- 
2.39.2

