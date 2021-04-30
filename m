Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC92237012F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Apr 2021 21:31:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231857AbhD3Tb6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Apr 2021 15:31:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57656 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231136AbhD3Tb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Apr 2021 15:31:57 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AFBAC06174A
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so2303945pjv.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Apr 2021 12:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCEZUZsej6PYGYdfrUSAPElJP+cMh+qBBhd7LIg8wdA=;
        b=KoB3ejoz2F2gX3PDhdj/9gZXL01KuXoWg+k+QDyqJvO3zdZBamHkKjdfpDYEjKvt67
         +L4tRNbFUd8f5kLuSaQoJ6Y225lSdr/EGRvlVZ567+pRV8SCOghVvu2vv/vtXah3AVZM
         O9suig51wjCyf/OdskvmTGYMBq01LKFlippMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XCEZUZsej6PYGYdfrUSAPElJP+cMh+qBBhd7LIg8wdA=;
        b=FUIu4wmyIn0giP5PoxjjOkXVHU0M9pEDg4ik0IlL8ijoHCVwyn1WkQrcpDQDuQtNjO
         YtUJGC9hlJIFxmJ36EG5XqgzXfb63C7oXwK2Dwa1fmO8Ba9FenztfUOC+sgAc+N7Q1nG
         AdICRzy/b29kZluUxwP/eCi6q/tF+5jgvYyk9HGuxzmwt0aY7l8oOV3wzgC5fXnHh5EP
         lKCi3NrbJvdXOI8e0ANHXMCM5pz5BQpxavbCqi7EqqR1sF2fmSw6H9W+exVscUCupbMx
         J/M0Lie3a1RomIXMDU7UsWFLDPltrIEaeWD8vwuP+KaqT3JsnvFMDOwyDJ5lceZAWxxt
         dwCA==
X-Gm-Message-State: AOAM531scrl3W4Jaj10ztZbaFf0gZ7sXNobByuWtS8wzS7jpEVm9m41M
        tL5NMDoksI3hywTQmNJ/iYWLD571p3z4ow==
X-Google-Smtp-Source: ABdhPJzfRGR6XuD7lIQKGyXCXKEG4HC9T/S8Nnlka/0tDSwrbt4yC2zH6wZ/u2spHOidfnmVgIGaeQ==
X-Received: by 2002:a17:90a:a78c:: with SMTP id f12mr16598779pjq.219.1619811066715;
        Fri, 30 Apr 2021 12:31:06 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:dacb:8fee:a41f:12ac])
        by smtp.gmail.com with ESMTPSA id t6sm3143500pjl.57.2021.04.30.12.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 12:31:06 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Rob Clark <robdclark@gmail.com>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Kuogee Hsieh <khsieh@codeaurora.org>, aravindh@codeaurora.org,
        Sean Paul <sean@poorly.run>
Subject: [PATCH 0/6] drm/msm: Trim down drm debugging logs
Date:   Fri, 30 Apr 2021 12:30:58 -0700
Message-Id: <20210430193104.1770538-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.1.527.g47e6f16901-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch series attempts to trim down the drm logging in the msm
driver to make it useable with DRM_UT_DRIVER, DRM_UT_KMS, and DRM_UT_DP
levels enabled. Right now the log is really spammy and prints multiple
lines for what feels like every frame. I moved those prints off to
other DRM_UT_* levels that felt appropriate. Please review.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>
Cc: aravindh@codeaurora.org
Cc: Sean Paul <sean@poorly.run>

Stephen Boyd (6):
  drm/msm: Move vblank debug prints to drm_dbg_vbl()
  drm/msm: Use VERB() for extra verbose logging
  drm/msm/dp: Drop malformed debug print
  drm/msm: Move FB debug prints to drm_dbg_state()
  drm/msm/disp: Use plane debug print helper
  drm/msm/disp: Move various debug logs to atomic bucket

 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c  | 16 ++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 22 +++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 38 +++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 10 ++---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 19 ++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      | 14 +++----
 drivers/gpu/drm/msm/dp/dp_panel.c             |  1 -
 drivers/gpu/drm/msm/msm_drv.c                 |  4 +-
 drivers/gpu/drm/msm/msm_fb.c                  |  8 ++--
 12 files changed, 67 insertions(+), 75 deletions(-)


base-commit: 9f4ad9e425a1d3b6a34617b8ea226d56a119a717
-- 
https://chromeos.dev

