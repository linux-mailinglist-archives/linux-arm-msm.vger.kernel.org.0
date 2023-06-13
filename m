Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB4E772D555
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jun 2023 02:10:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjFMAKL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jun 2023 20:10:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbjFMAKJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jun 2023 20:10:09 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD34171C
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-4f62b512fe2so6141132e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jun 2023 17:10:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686615006; x=1689207006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3U48DhxE6jBvffVdT6/UwCqMtwTlpmQ4IYEd/FwXhNY=;
        b=NWLUY+X0FcB+QizAYU7rBJvAaB2kbU8MKmNmOLWmqCJ32a70gTqJB9qVhTMqENuMTB
         fBWT28m2QasBgtRtp5gF4+cYHdYs5uPvjo81dRTUXrsszkIVViLChwYqIG9I/sJsT0wj
         6KI9pro7F+mATSG+guiQArgaBJaADhGU4+kulvIS+Dc/0VUvkYQpy+OjnCKlAuej64Q0
         I9yL8SK4Qbe9NmdVK2hK7nLzw6YSUVJnHigGUKx4ddbXRa5FRA9R8cq9nknodjNPDBEj
         e9J/p+dZWKOelF7gR0zLvUX5NLqYUUmtYqKvRyhDBp2IpJxd+uXRDD5iDFS/bs20e+HB
         JJZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686615006; x=1689207006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3U48DhxE6jBvffVdT6/UwCqMtwTlpmQ4IYEd/FwXhNY=;
        b=GWukX1sM+YTG+PZ47WfpDX7SBFKbsnjT8ECUKlpH+1hj0b7TocswybP647bjdGn9ap
         xJr17cxWsq4qEGmUQxqtGTNuF+r7iGyQCIax/dQ5WSD6j1MvXlj7tPDjB+nJqs45mMbe
         dRkifDOXNwVchD6dHWoeb8v1zA1KvIsZ3SAXLSJ++hdGlJRZihP41h/N88qthnmZ50Yo
         aLrcxoeOeU3MlRXpfqWmj/+zVDf/C3jDPvNBnT18W4J143zQm7sLwiIJv/yCYI+0KR2G
         i3XpdfTYin2Y8RPTcc6uXbsXYHbNH39LDJa+K+OEOzd5TbY4yBpIkoWYPrB80L/idjvb
         IOAw==
X-Gm-Message-State: AC+VfDwqS4wrXUGxsE0JTi9m/p6+XeyIc+nokDtwIK/v/ZfiNVr0q5IU
        X0P3kGbgFspKwGathZbjFfNOfQ==
X-Google-Smtp-Source: ACHHUZ5dvyR/4ylEyIG9bPyNHMs5XB37dBz8Ip0UCLQ6VNUJYoNZH8XgS/LaEfOJFvrOXFr8DPJkkQ==
X-Received: by 2002:a19:5f5a:0:b0:4f6:2f97:7f8b with SMTP id a26-20020a195f5a000000b004f62f977f8bmr5186243lfj.1.1686615005809;
        Mon, 12 Jun 2023 17:10:05 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id c10-20020ac2530a000000b004f63eea01a7sm1581604lfh.192.2023.06.12.17.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jun 2023 17:10:04 -0700 (PDT)
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
Subject: [PATCH v2 00/22]drm/msm/dpu: another catalog rework
Date:   Tue, 13 Jun 2023 03:09:39 +0300
Message-Id: <20230613001004.3426676-1-dmitry.baryshkov@linaro.org>
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

Dependencies: [2].

Changes since v1:
 - Rebased on top of msm-next
 - Dropped dependency on interrupt rework

[1] https://pastebin.ubuntu.com/p/26cdW5VpYB/
[2] https://patchwork.freedesktop.org/patch/542142/?series=119220&rev=1

Dmitry Baryshkov (22):
  drm/msm/dpu: fix sc7280 and sc7180 PINGPONG done interrupts
  drm/msm/dpu: correct MERGE_3D length
  drm/msm/dpu: remove unused INTF_NONE interfaces
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
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    | 180 +++++--
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |  89 +++-
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    | 188 ++++---
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |  89 +++-
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |  96 ++--
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    | 418 ++++++++++-----
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    | 236 ++++++---
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
 23 files changed, 3320 insertions(+), 1563 deletions(-)

-- 
2.39.2

