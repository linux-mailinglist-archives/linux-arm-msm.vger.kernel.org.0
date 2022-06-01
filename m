Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F144353A9C1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Jun 2022 17:16:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355000AbiFAPQS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Jun 2022 11:16:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354999AbiFAPQR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Jun 2022 11:16:17 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7789691552
        for <linux-arm-msm@vger.kernel.org>; Wed,  1 Jun 2022 08:16:16 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id u26so2578442lfd.8
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Jun 2022 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6KOzK1wBJwy3fIC+H9t0O69JIU0L0pK8Y3WOrDMzMo=;
        b=o/5TryVyPmMjLG6+uoJ4V8nADbhbsOpy17OYQL62lVOvXlC2q5J+9UVnUdOke4QS41
         ZzMO+QbvpjNqfPyXJsTeAcc6GEPL7a1khH4SYRZKeo2O565kW5rkHYikDAnKimuiCyYW
         brW74y/z1jnYvkttaBtPoejriej4ubcSVsUXwU6XLUoABdIewEAsvH0kfA3TlyYcna0j
         UxsgRZiJAGyUDJMB72D3AEaeDaVdoskleRS6mM8mYW1S4+aA+ZcvLcSEsQNTfNBMg8SB
         ko32JA625HVN4cVQQtQu9+GepOkD4vQZWGD+DPV+bldvTeU+jhDdBuaMbluiTUfFFa6K
         O2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=g6KOzK1wBJwy3fIC+H9t0O69JIU0L0pK8Y3WOrDMzMo=;
        b=jQxO27l6N5e0d1d7O0JU2M3tZSQzajHdmmDXlDh3TY27WFQGMW9Z2qN4kezPKzJnFT
         vfKfknT/cCvmqyEftyqwXFcoUaeGH/6L7LJP1EJPwucSd/GpmYK4+N8DO5Rzl+GEK/yW
         5gBNKTyfnjwLSjAOKWIfv51sP4fgY8wPFbHDCs7JaK5XFUioS6b+F5ne9F+vCeUVsGKL
         r/AJCgu9437xdotwURMcj5nnznq51M8S7oxvb2bJcH0tCWpjlKK1Nb83shkX74rp4awC
         6/VAdVgJBnc04UVwResvSCWnK3G8sqWvunm4hMOjf0pi0OGMVl0QpABwpr7YNaVCKv7o
         CQgA==
X-Gm-Message-State: AOAM532W05hNGT57n9FCZLI3hdnpm2a7K5hPerGnucZgCr2KxH9MvB17
        C3m02GKxbjhjv4eVuAp986Julg==
X-Google-Smtp-Source: ABdhPJxxgtMFmzHwUs2iXsWaBdtpeFiYbbmXLIq9X+HInbKbcMdBW7tel2W6a9F27fzw3+04H5Tn9w==
X-Received: by 2002:a05:6512:c04:b0:478:f837:d813 with SMTP id z4-20020a0565120c0400b00478f837d813mr136328lfu.17.1654096574815;
        Wed, 01 Jun 2022 08:16:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 08:16:14 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
Subject: [PATCH v1 0/5] drm/msm: clean up the hw catalog init
Date:   Wed,  1 Jun 2022 18:16:08 +0300
Message-Id: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Dmitry Baryshkov (5):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 500 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 258 insertions(+), 334 deletions(-)

-- 
2.35.1

