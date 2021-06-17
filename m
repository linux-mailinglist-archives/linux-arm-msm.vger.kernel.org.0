Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F6953ABEBF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Jun 2021 00:20:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231891AbhFQWWm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 18:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbhFQWWl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 18:22:41 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48288C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r198so12969817lff.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnDxm5Myfwg5gbjOfoJxbYlC7zAotfbp+Dq9xZI9JiA=;
        b=MTgqmKBjCmaCC6ez9w4CKSQaheV4WhyLWOrnZc07tP/BHPdcg1WxNpVnSiJtVw0JIy
         uOo0RFhaDmQVfHNERPhPa9rpcmMoidbEkGsVXVBUbRpJWG4WDwmPrVRIts6g062MVQUd
         PeuQqTixHpFKm+0sSiCZUEoZkOgu+V4uIGdoDUfpdYMQOtdg7g6mv3TMHK7OT+uOLMWW
         EuLSTnRA9OAMm3SXz0WcRHEsV3rAxfG6FwVQjXm/99k3tO/BqfyXYydL9VlndoY/JBGo
         peKeg0twzAXBCCXMI8kKubMPzZNFQO05svRxlj01qL9k4tAMplLJQ2bStOVzMtX0iJ/b
         V6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=TnDxm5Myfwg5gbjOfoJxbYlC7zAotfbp+Dq9xZI9JiA=;
        b=ga9S2/rcvdiQC8W5d8/N0c195cbxvCHStcsCQ3KEbOyL7lvYOkBrBREFjdzMaqh/Ya
         6yJyKfOuYq2x51gGrmwoHj7TTBs4EkOq0fU6ZRwIJjthx2kUCQJdFLpO6vXeJPMIAxhz
         a1x425YeK8uNRazKX8f6HFFu+7qiyxbSzfKtG8lZ9NGlB9eMlz+ZzyNfAAKlwC/ugh6G
         3IE0BP3AHeWfJeGCdAKdHa9rNvdD86KvHAbB2NkyjnFSH0sPZw2BX4E+SBJQiCih0XIm
         3rIDKFcEVoVTyeS9TbK5tzHgH9GHMuiICjZ04yZkqqRf5PW76lG+DujG1vNpYVdi0c3q
         t+9Q==
X-Gm-Message-State: AOAM532o84lFP91IHQCVInlNcukHG7sWvWm74r846MzmZa6zkfMmC+8O
        f2JLaA3T7Zgt2a9x8DhSVuzooA==
X-Google-Smtp-Source: ABdhPJykKB4jPM0I75Oqa7g81G7IJicYX4WI5rZ8vxpGyRUdhcGZTKx7xBgzDHsrNbLQqsKJI/OpoA==
X-Received: by 2002:ac2:4833:: with SMTP id 19mr448547lft.231.1623968431683;
        Thu, 17 Jun 2021 15:20:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 15:20:31 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Cc:     Jonathan Marek <jonathan@marek.ca>,
        Stephen Boyd <sboyd@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Subject: [PARCH v2 0/7] drm/msm/dpu: merge dpu_core_irq into dpu_hw_interrupts
Date:   Fri, 18 Jun 2021 01:20:22 +0300
Message-Id: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series reworks DPU's irq handling code by merging
dpu_core_irq into dpu_hw_intr, reworking/dropping irq-related helpers
and wrappers, etc.

Changes since v1:
 - Rework callbacks registration code to allow just single callback per
   interrupt. This removes need to do any memory allocation in reg/unreg
   code and simplifies handling of interrupts.

The following changes since commit 7e0230fd096c03e9662e66150f951075dd16e496:

  drm/msm/mdp5: provide dynamic bandwidth management (2021-06-17 09:51:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-irq-simplify-5

for you to fetch changes up to b2ae835c61b2065037c55b4596e16053484f4904:

  drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx (2021-06-18 01:12:04 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dpu: allow just single IRQ callback
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx

 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       | 256 --------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  30 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 111 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  66 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  99 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  56 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 264 +++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  96 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  25 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  51 ++--
 12 files changed, 334 insertions(+), 748 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c


