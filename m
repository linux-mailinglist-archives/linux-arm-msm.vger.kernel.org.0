Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 747C245E65F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Nov 2021 04:01:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1358696AbhKZCzj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Nov 2021 21:55:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358705AbhKZCxi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Nov 2021 21:53:38 -0500
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18ED5C061D6D
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:35:20 -0800 (PST)
Received: by mail-lf1-x134.google.com with SMTP id t26so20501726lfk.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Nov 2021 18:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K08hnQBTPfWEs+HMfPYvCpN/H48kICMBN1bfcTW0bUw=;
        b=QqG5fNRfambM/9eGjhWQTDgxNeUaGRGqGj1c4RU9sVvIy/itpEUlV+wwHI5cI/I7oH
         8o9ehfSavZZFGXKRInEHik8xP6lHPHWYjCKUkQoW9WgwTk9YifloDRmbrk6SXDqNU5vn
         FG1LrcuhZrxLJdb9qGnrC8PdXYLxjvFl/SqlL+pcAiJFxzRvS+eP8NGih2CjTDdhZwWp
         LppeMsIfMDEx/ozQjfnk6va5ArvB93Cq6KfTLtMLIV4P/HqZo7OfH6GP5rLxDeGBLWmq
         Tcu/UTma/0yIMBy49/DSH6OsgXuGAOfIRBC8qEau++DTyFk9euGBpZfC7gfqMaQFCCJN
         WeGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=K08hnQBTPfWEs+HMfPYvCpN/H48kICMBN1bfcTW0bUw=;
        b=3y3/WcrQ3FyMrIjmRT+zhsMDPDWvgI4DJeNxh3eChJYnvJPtL5zVaswwLYnvRPWMnn
         uvxdYIthc2/3qs2sI7H6XvLrf1WzC9tjhIScGVN2eKsb4HUuKQgVB0gCJuxdJYMJXvLv
         uWt3+fihrwKZc6oIGeTm5/QSwrnLqZ7IafEg+24SuWSSTel4Y2nptkZABoLvaqX2X2fJ
         SljtlcMBfdp85Cu59ko8ptia4DMRN5/ZnH+pcvz1jl09SYUFKVOAGtq1zsmQA9u3PUmv
         S2NOLJ0AOl638xuvCjbWN+w5o3BmrN2Zaj/ExRkrCyKNPaUrAfG/ViNi+JyGtljPZ2Oj
         xsqA==
X-Gm-Message-State: AOAM531gerQjzO8Xc3ERmVjG7GBH2qrkmAK5WXaifEym7ewzFiW8MKV2
        meslX1xCixuhNfdUbxV9f70OC9dLD6f90Q==
X-Google-Smtp-Source: ABdhPJwaHrap7PPmQnp6flFxVBPmROMv9vSRZo//q+MyiYYJ/7khxNgpJ1SAdmODw5i2LCGwTLjfkg==
X-Received: by 2002:a19:750d:: with SMTP id y13mr28325028lfe.101.1637894118290;
        Thu, 25 Nov 2021 18:35:18 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id n7sm391005lfu.116.2021.11.25.18.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Nov 2021 18:35:17 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Stephen Boyd <sboyd@kernel.org>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Kuogee Hsieh <khsieh@codeaurora.org>
Subject: [PATCH v2 0/2] drm/msm: rework clock handling
Date:   Fri, 26 Nov 2021 05:35:14 +0300
Message-Id: <20211126023516.1108411-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Changes since v1:
 - Rebase on top of current tree to fix conflicts

The following changes since commit e4840d537c2c6b1189d4de16ee0f4820e069dcea:

  drm/msm: Do hw_init() before capturing GPU state (2021-11-22 10:45:55 -0800)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-clocks-cleanup

for you to fetch changes up to d6c3e05f71d0fe131f427c32553a01b6df0bec9d:

  drm/msm/dp: rewrite dss_module_power to use bulk clock functions (2021-11-25 12:20:56 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (2):
      drm/msm/dpu: simplify clocks handling
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions

 drivers/gpu/drm/msm/Makefile                  |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 --------------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 ++--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 ++-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 ++-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 ++-
 drivers/gpu/drm/msm/dp/dp_power.c             |  81 ++++++-----
 drivers/gpu/drm/msm/msm_drv.c                 |  49 +++++++
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 14 files changed, 164 insertions(+), 358 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h


