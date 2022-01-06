Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 839CC485D5A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jan 2022 01:43:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343922AbiAFAnJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Jan 2022 19:43:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343933AbiAFAnE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Jan 2022 19:43:04 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2ECAAC061212
        for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jan 2022 16:43:04 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id k27so1545883ljc.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jan 2022 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
        b=DK4Xf6mITXkcOevJ4wZ51waw2rIr7t8adiZGB11WgPNMb43rmftVNODC0ZnNHtnFJa
         E03mOGa5vxMhterhVQcMMG3tyvp/wBKjJTFPG16d28no6B8QhOv5+/5FNy+u6qQGeZZY
         TvE60iWfQXN4nYECUxJdfFs2/O6sb7wC1ibBCSCMuuL2ofyJ2ysQWsLP/uBxk1S5A+fp
         ZSnzzTA/iYdGMTXaBzqNm9epOh7zcxcTSXIPBkMeZeeR37xsSx/t7bFLFQdCnGO93o7D
         ZnZ9UB3g93B0qeaYxulmTwBE7x5b7pdZfplGVSBPjhYrhDfiNjjv7rj8wAE4v4C+Wikn
         qR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
        b=J0cXV28fg15Tqx1vfPwWXC2+N0e+hYwXnIqOyMfUZzgIyYTptZiBv1XKo3uHqg9tDA
         63KKFtQp2RVevCrbcCVz700NCEi/8Ocxllgkwp2fblisUcCpvNv6pd0Fl/2uBvKsMdLi
         pjmPNWRryJG0uJnB0bTAOFUMTjhrgYHXh/bNNsSEntuti7m+40DA358Lv3y8k1JktOIJ
         d5TRIkAGTxMmZLD+Vu/ja1uGiljIEYhpuWDKcFTRT5c0NvdeE9m5ZSmmbA8hwdfRW+yA
         t2zxbyD/vn0sGPiJQlD/972HNNlqDGmxVlLMZdLIRyrizJZPzFTfdVsZhzAZXGD8+aaY
         bjzQ==
X-Gm-Message-State: AOAM5302nlxlnbCoyEe28QnvCj00g2nUOP9if4rDTtTYusTHt7KnXz+l
        3WXTwX3MqCJVdSVL/Wiuc/a98w==
X-Google-Smtp-Source: ABdhPJxOTBEliR4cyqqJRtekI49AUXMGi66dhMUQeLqjnoFKWAFQEfnR2O1wFXMHOxlZU5biDnaFlw==
X-Received: by 2002:a05:651c:1a0d:: with SMTP id by13mr38658971ljb.107.1641429782465;
        Wed, 05 Jan 2022 16:43:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jan 2022 16:43:02 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@quicinc.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PATCH 0/4] drm/msm: rework MDSS drivers
Date:   Thu,  6 Jan 2022 03:42:53 +0300
Message-Id: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patch
https://patchwork.freedesktop.org/patch/464362/?series=97310&rev=2 to be
applied (just 1/2, no need for 2/2).

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer

 drivers/gpu/drm/msm/Makefile              |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 ------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -----------------
 drivers/gpu/drm/msm/msm_drv.c             | 260 ++++--------------
 drivers/gpu/drm/msm/msm_drv.h             |  16 ++
 drivers/gpu/drm/msm/msm_kms.h             |  18 --
 drivers/gpu/drm/msm/msm_mdss.c            | 438 ++++++++++++++++++++++++++++++
 10 files changed, 578 insertions(+), 758 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


