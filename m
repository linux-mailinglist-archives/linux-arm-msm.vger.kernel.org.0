Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124D53D4BA4
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jul 2021 06:26:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230251AbhGYDpy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 24 Jul 2021 23:45:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230010AbhGYDpy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 24 Jul 2021 23:45:54 -0400
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AE03C061757
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:24 -0700 (PDT)
Received: by mail-oi1-x22c.google.com with SMTP id t14so6954570oiw.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 24 Jul 2021 21:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFd+X7oTHADuT288+EEd3xR940f0BDuWrDa2rxXiuIM=;
        b=WKNvI24GiVvhCutDHa54Je6JZH578NP4Btg9cqRBa3J4lITuNpJzNQwz1xhmRtkZ9V
         P4ZKQiby5aRxE5tSdlGDSOs6Xo5m8AeHvLP550X8DxvWs7pUKUxtb+aEJm5yGwMf2g9O
         OLRsQjZjKVIgNWpUD95sOziexq3GfCbefyOrpHwEzHi4pea9OGn5qXLbN38OWdT407lP
         97i/qUHb6VdFtQvj4SFcS9dJSe3VeeLdiu7PO0vJPZ6nT4JkYoDl5EiDqIRJwyLz5hmO
         w2pR9fYiP8i5PeZGKs65aTTPGaAKwZtbij5LJ0eLFSZvI+SrjXeFIJZMjg+nUOhSDsY2
         tsBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BFd+X7oTHADuT288+EEd3xR940f0BDuWrDa2rxXiuIM=;
        b=AgdrJWEn5AdpAA4qGhfzp3vMaTmpyfTrricjdcYrlIARLY+lfL7rNVUAaunhqY2hQb
         wddtwhQQoq9L1YgXDMw1+8yTSBW+tzRNU8z+u7LPA+q7KIVW+d7wF8fIusqzOa0lQ4+9
         AUVNvjLn3ttWhPG9XyES9qp12dHvuS3NUNMehI6J+4TwQihOEH7CxBKFII9ZJB8fsYPz
         wc1McLtSW91G+/d0B1sl+jGzSEW+QegymR5F/EWP4LLnYlj4notk38oblSvXILM69o6o
         bv0sTxvMrFlE7Ym6G6ot7Uh7JiFEebVRDJs/FRDBdcWJ8huYw1R9l2tt1wvWAErL4CJG
         WYLQ==
X-Gm-Message-State: AOAM531jQlkkhiVyyD0MmFigdUq6zRBXXu5kXXTy7K0C1Fcvpigl1Kt5
        myQNcMeF8Rw2ulHWx4SWfZTepQ==
X-Google-Smtp-Source: ABdhPJxAnqWdynxTIU/ZSqayCOuWNeg4YGWeTecnM/cvLrNlSFSGgBV+4XbDkEV+jpfC8SJs1ndAyA==
X-Received: by 2002:aca:4743:: with SMTP id u64mr13017033oia.52.1627187183742;
        Sat, 24 Jul 2021 21:26:23 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id t144sm6986200oih.57.2021.07.24.21.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Jul 2021 21:26:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] drm/msm/dp: Support multiple DP instances and add sc8180x
Date:   Sat, 24 Jul 2021 21:24:30 -0700
Message-Id: <20210725042436.3967173-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

This is based on v4 of Dmitry's work on multiple DSI interfaces:
https://lore.kernel.org/linux-arm-msm/20210717124016.316020-1-dmitry.baryshkov@linaro.org/

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (5):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  60 +++---
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 183 +++++++++++++-----
 drivers/gpu/drm/msm/msm_drv.h                 |  33 ++--
 6 files changed, 200 insertions(+), 103 deletions(-)

-- 
2.29.2

