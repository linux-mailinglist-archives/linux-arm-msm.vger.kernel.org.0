Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0AF29381B97
	for <lists+linux-arm-msm@lfdr.de>; Sun, 16 May 2021 00:58:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230330AbhEOW7S (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 15 May 2021 18:59:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230087AbhEOW7Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 15 May 2021 18:59:16 -0400
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8635AC061573
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:01 -0700 (PDT)
Received: by mail-lf1-x131.google.com with SMTP id m11so3453813lfg.3
        for <linux-arm-msm@vger.kernel.org>; Sat, 15 May 2021 15:58:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
        b=tPV/dGjVkXN5nq1h7uNLOhDPoF7XIcwERQ76MsEgF+PmQ+QNYbhhxO/i3T0iTCSlpk
         Id217cfqi0fgG/CyxbuCgmf6iN9tKMto3qPIUyecAs6aXtKd0C0vQM0oKdYgKzmzSdAc
         n1RlD/yevvkHZ1I1zlgXPVMy1D216pn9TCpDuwWM+K8WRnhjRSEpsl3HaBWgJnOH1udo
         Y4TabnrlRylsZzU4MUzuJTVWgMVbVMRkt/fjRLBUx6nc+0fFsIEpzN3jKHJcFw+LamsZ
         w2giAV0YkEuL+/jrweoT1nntGdN1hTwSxTo5u37CljFcQQmyM6d1VjHr9VccR+AZsYYv
         ODUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eBTQmpM/Ml6k7hvWgriWTmEFhLechL8G1HA7n71TelE=;
        b=Vr6+BjpiYBppPD2d4l1VTRGAKL5w2RhoMLaXcqm+eDnwu60AfGVtpzYB+cXOH8P9vB
         zZ3mVKr/7BMtms2/30BrZLg09pb+2fghniZFY+yiSDqfJ2k58b+5eKUgM4VW+iI2Wl2H
         F+DzwfSfeniIaAZETgBpr/af89q3tr4c5OfYn4bkMhROMqhipxhLQ8jgYRrSH2icc8l2
         BoZq9ePNGLLvLs2DhSZkagSsNM2beDF3bwQvzlrum/dBFN/6WkuSc3BYG9d0aP2oLbl0
         wx68+qlXaMWPdfsmOosUpeiCQ8mNr75gKcrr21M+V8aBQZYQJbwffOO+A0coK1Yx4Woe
         GYzw==
X-Gm-Message-State: AOAM533VtRtbeZ5O7kxWSIXEV6/lodbEEVMgYzLPJNIkFvKHQXkWgQ9F
        agoU0Rr7ZAYl78yGxTh/tPsP6A==
X-Google-Smtp-Source: ABdhPJyq+Rs0oTEyhmaCf7LKxlQ+Eibtf/uz0XmOMbZgMJIVeNGzdm5yvJ8vMU0kQV39Xg1tenk4hA==
X-Received: by 2002:a05:6512:22c2:: with SMTP id g2mr39209032lfu.305.1621119479940;
        Sat, 15 May 2021 15:57:59 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id j3sm1499729lfe.5.2021.05.15.15.57.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 15 May 2021 15:57:59 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: 
Date:   Sun, 16 May 2021 01:57:51 +0300
Message-Id: <20210515225757.1989955-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # This line is ignored.
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reply-To: 
Subject: [PATCH v2 0/6] drm/msm/dpu: simplify RM code
In-Reply-To: 

There is no need to request most of hardware blocks through the resource
manager (RM), since typically there is 1:1 or N:1 relationship between
corresponding blocks. Each LM is tied to the single PP. Each MERGE_3D
can be used by the specified pair of PPs.  Each DSPP is also tied to
single LM. So instead of allocating them through the RM, get them via
static configuration.

Depends on: https://lore.kernel.org/linux-arm-msm/20210515190909.1809050-1-dmitry.baryshkov@linaro.org

Changes since v1:
 - Split into separate patch series to ease review.

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/dpu: get DSPP blocks directly rather than through RM
      drm/msm/dpu: get MERGE_3D blocks directly rather than through RM
      drm/msm/dpu: get PINGPONG blocks directly rather than through RM
      drm/msm/dpu: get INTF blocks directly rather than through RM
      drm/msm/dpu: drop unused lm_max_width from RM
      drm/msm/dpu: simplify peer LM handling

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        |  54 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |   5 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   8 -
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   8 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  14 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  53 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             | 310 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |   9 +-
 16 files changed, 115 insertions(+), 401 deletions(-)


