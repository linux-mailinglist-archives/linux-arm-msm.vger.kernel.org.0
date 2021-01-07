Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3E7AA2EE7FC
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Jan 2021 22:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727725AbhAGVxW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Jan 2021 16:53:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727446AbhAGVxW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Jan 2021 16:53:22 -0500
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com [IPv6:2a00:1450:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 989C3C0612F4
        for <linux-arm-msm@vger.kernel.org>; Thu,  7 Jan 2021 13:52:41 -0800 (PST)
Received: by mail-wr1-x430.google.com with SMTP id t16so7081981wra.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 07 Jan 2021 13:52:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=jBwDEco46WJrZ4/CdIGCsb6+UYHdqspvbvO5PyUFa+8=;
        b=qf9+wJXVL0hedizSsg83AjGvVuKjH/bAq226wJ8sK+mhwN4xirQytTbCmwECupbprn
         7eJvY57EbEoUI8wRBH51hBKdBlaK6Klqs2D7ye188Yy1NuzppB7zVhjrN8sPiNNTVoxf
         Scg775uxaWZf2kqC066zboogy6sYyWwH5Fbcq/CjD3GVtNVNsy1aJZeXL4/VwOOq8DEo
         1L+Tic5n5I/+GjolhPj3ta7vs20LIZ7Bh1Ij+FVUnMZLOor6S/L/DPnV+3fFVL+x/LV4
         tGHHsngOh4Z6H+63O44u0d/impVrn6fEPsh6VspkVuuXlU1O64uWBjYYI0ppmfcDx7z9
         eXOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=jBwDEco46WJrZ4/CdIGCsb6+UYHdqspvbvO5PyUFa+8=;
        b=FWg87g2HFDZNLo/pgySV7aBNzaNMTph5d77/6nZA/fPuKCb84N7jo60Uj8FiTGPMYl
         wNc/BdVOAdIWTecawsc3LbgX9E8p3UsmqCrfjiQC9vCY+lSVzL2eQHDhRq7SOuYSqUEA
         orZhwp8z0gpdhLumdd4T8izllbIaggQjOkQP362/cJ/rH8mbwhQDB9ShdninpYBUKsJh
         AYpPQzbCAZtGzwpgPNVcZnZpLa08bEBXv9y+j0NxV/Rx0avbkgiaws7npO4qY1Cmnhyb
         GkXhEY5K2HK1xNCXyzLBFODZNE6UdOcvXDUFL5m5sJ2Vs1ONS44M+frPuJbJ0Y7rHSUh
         OYmg==
X-Gm-Message-State: AOAM533sWy+//w50HQGjAAIU8vBUJdY0zimXQpjuiGK/gzqCYkaaAQM7
        8bOu44w+Z98C30l9NqFkHyWERqLeBN2n1Kq+6jo=
X-Google-Smtp-Source: ABdhPJwYcBtCcsJ3K5mBMg+ivUv+S2pcnin4WMfDGyw3yeGfJ0Xm1I2+hC7pXlosZuqWI4YgOt53wRrPA/Z7D5oJhLE=
X-Received: by 2002:adf:a3c1:: with SMTP id m1mr641279wrb.28.1610056360377;
 Thu, 07 Jan 2021 13:52:40 -0800 (PST)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 7 Jan 2021 13:54:59 -0800
Message-ID: <CAF6AEGtWMhzyD6kejmViZeZ+zfJxRvfq-R2t_zA+DcDiTxsYRQ@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-01-07
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        freedreno <freedreno@lists.freedesktop.org>,
        Sean Paul <sean@poorly.run>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave,

A few misc fixes

The following changes since commit e319a1b956f785f618611857cd946dca2bb68542:

  drm/msm: add IOMMU_SUPPORT dependency (2020-12-05 08:25:52 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-01-07

for you to fetch changes up to 00fd44a1a4700718d5d962432b55c09820f7e709:

  drm/msm: Only enable A6xx LLCC code on A6xx (2021-01-07 09:23:05 -0800)

----------------------------------------------------------------
Craig Tatlor (1):
      drm/msm: Call msm_init_vram before binding the gpu

Iskren Chernev (3):
      drm/msm: Fix null dereference in _msm_gem_new
      drm/msm: Ensure get_pages is called when locked
      drm/msm: Add modparam to allow vram carveout

Konrad Dybcio (1):
      drm/msm: Only enable A6xx LLCC code on A6xx

Kuogee Hsieh (1):
      drm/msm/dp: postpone irq_hpd event during connection pending state

Rob Clark (1):
      drm/msm: Fix WARN_ON() splat in _free_object()

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  6 ++++--
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 ++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 21 ++++++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++++++
 drivers/gpu/drm/msm/dp/dp_display.c        |  7 +++++++
 drivers/gpu/drm/msm/dp/dp_panel.c          | 12 +++++++++---
 drivers/gpu/drm/msm/msm_drv.c              |  8 ++++----
 drivers/gpu/drm/msm/msm_gem.c              | 13 +++++++++----
 10 files changed, 63 insertions(+), 26 deletions(-)
