Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 810FE30802D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 Jan 2021 22:06:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231347AbhA1VFC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 Jan 2021 16:05:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43268 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231231AbhA1VFC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 Jan 2021 16:05:02 -0500
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53F2AC061788
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:43 -0800 (PST)
Received: by mail-pg1-x532.google.com with SMTP id s23so3840849pgh.11
        for <linux-arm-msm@vger.kernel.org>; Thu, 28 Jan 2021 13:03:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=anholt-net.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
        b=YBojJS9p5xbUaHKy2Lz2exq+I/GlOwWsVyMzlakgcN5k6/BM6757RCUFuEhsw8dCfB
         9UEEpZeZj1zog1T/mkmttEZM8l3dbQVyYDv6LBQdB/UPJOe03VCWXD5VBq0BRQX4KiLH
         ma3VCoVUws7V3pu4w1LfWsKEv02ZUmn/UfmGg4GY77V1wJvPlaOdIRlro9d6Dp9PopvF
         kM5Qmt/lRx5kDPtA06kkMyG3RDp0Pu3B/eGPIRRA9JzNr98Sey/KnZuJbIt1nh8oIh5l
         SHsqgSF3FTXSJpCCzOoNGuU48b99UVXx/HwVY7lwCRKEnfBuDbIIZ09OjEDuXF+ikVee
         C3rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3WONUXtOBA+aimidJBvuVmUVV583MRFRwJEB2kxrPYs=;
        b=oqaehCV6QOUeNcnsWUhoAxff7w2Zi1sq3F/v/bm1U7TKXe2o7wQHWf90JHr3FN2ayO
         jRQ7LVXdhURZiC6tBux43KSjWR71h4Wk1E2yRb8/j1WUmq4BClYfFBjYSinNUFwme5MU
         1G3m0qT24cB+TdWCBesFooO7WuzY+x5xbH480uQjP4rYqSbnm9SgiPwv2auiXm2Irxnk
         6H5rJPJG7H7m23VWDhTyruN7QwaQhQp2nSgjei72U9k4gs42HZ3k+DDEw0eKkzOVKeLW
         zV/ftLuBW6me17ioSb6jKab7DLVfjNNLnt9tYw7nnGVslQFT/HeibESI7grq3lAcOhI0
         0ONw==
X-Gm-Message-State: AOAM533T3/d1slqCQmGCKPFoShecqp/U/SREm2RpyYZkTPT0DjMf4WMx
        q3AZuKNKHjhaysreZKAiFMtNwA==
X-Google-Smtp-Source: ABdhPJyjDHTf5cZ2T8LWCexxoeNi+YORZrAIIvHkgQ9CukxkleXU959cZ4xsh58LnwRvlkSO+tlCgw==
X-Received: by 2002:a65:62d3:: with SMTP id m19mr1313991pgv.180.1611867821498;
        Thu, 28 Jan 2021 13:03:41 -0800 (PST)
Received: from wildbow.anholt.net ([75.164.105.146])
        by smtp.gmail.com with ESMTPSA id l2sm6753295pga.65.2021.01.28.13.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jan 2021 13:03:40 -0800 (PST)
From:   Eric Anholt <eric@anholt.net>
To:     dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>
Cc:     linux-kernel@vger.kernel.org, Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 0/3] drm/msm: fix for "Timeout waiting for GMU OOB set GPU_SET: 0x0"
Date:   Thu, 28 Jan 2021 13:03:29 -0800
Message-Id: <20210128210332.1690609-1-eric@anholt.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Updated commit messages over v2, no code changes.

Eric Anholt (3):
  drm/msm: Fix race of GPU init vs timestamp power management.
  drm/msm: Fix races managing the OOB state for timestamp vs timestamps.
  drm/msm: Clean up GMU OOB set/clear handling.

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 105 +++++++++++++++-----------
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  49 ++++--------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   8 +-
 3 files changed, 84 insertions(+), 78 deletions(-)

-- 
2.30.0

