Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6C9DD349E41
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 01:55:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229847AbhCZAzM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 25 Mar 2021 20:55:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229761AbhCZAyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 25 Mar 2021 20:54:44 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF5FC06174A
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 17:54:43 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id u5-20020a7bcb050000b029010e9316b9d5so2138724wmj.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 25 Mar 2021 17:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=YuBwH1yrwebF7YZ6NybwekcKLEftOt6WeljGm7H4DDg=;
        b=JGegx6GQf4y5/ogeQ1Xy/BwSsztBssUrPHuyQ+aiS/vdP+FTBXcxY62BuhK6meFdy+
         sDeVoSkiZ0k4a8xDCoVio7bemOrg7zF0ewEy4mZNwwLJpDl3n7TywbTpBvjwN74fmjKV
         7Nh4rAom4G0hwVZwOLnkSd9pIPNBWcfxSHow7lsjrC48zZfHNkVGsgVhBgiMYIJQUmbR
         LIdbmzUkv9Cpsv3EM7GMApFZo+KZMQVM+C4+8drmsaD0tVB8pe13BmYjJQ6tnueAazKP
         fdg4nOK5zPHwi9Qnyk/mONnaSfPVpkvT057/8y5iRJqrt31W3T1YUXgWl19NedjSKts0
         bllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=YuBwH1yrwebF7YZ6NybwekcKLEftOt6WeljGm7H4DDg=;
        b=pYC6ZG9mDUHI6dhl3D1tl4Hr+UuOeDysWofugKrRjKuos7IKUBNYwxurMz4TvdyN37
         xPK+B0aCK+D4Fq+Ex7aTcNm9aDVB0TjAEBOIehe17NQGuOgbC4twG9Hq6OXGDtOBi3uo
         icAe5sb6cF6auEVuVYchx53ozivtNRfIF/CV75ekKCrgTKXKRJE8BT80L3ASTor2Puww
         Gafw51VqjNgY8ugYNO9shaisCWXEf6zfDubQv+eZbZ3s1TNyFm32onDptdTW8CyO69jY
         hVNKU7zg+prwlarmxMNFCuUFpETIxRTVtOLE5BkdFHYYfcVihW9HNCUlIYoKSf1qKz03
         v5jw==
X-Gm-Message-State: AOAM530cYUikTXxBFdpr2TwMCxzxVSWqGJIc2fSAZe1a3fttiWsNG1kX
        8kC28NNf2QiRH9HK4QXVCf8p46HMR4GRagQKLYY=
X-Google-Smtp-Source: ABdhPJySjv2fOKFXb/unIYRFsUJMvBttGq7FJPdo71XAwOdq0KZm1mAm+csV/a/aLFrziqQozHhoMVGroVUZtwke9Mw=
X-Received: by 2002:a1c:4b15:: with SMTP id y21mr10634934wma.94.1616720082628;
 Thu, 25 Mar 2021 17:54:42 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Thu, 25 Mar 2021 17:57:56 -0700
Message-ID: <CAF6AEGvmiMKRms_NVavD=NA_jbuexZUcqqL35ke7umqpp-TxMw@mail.gmail.com>
Subject: [pull] drm/msm: drm-msm-fixes-2021-02-25 for v5.12-rc5
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Sean Paul <sean@poorly.run>, jordan@cosmicpenguin.net,
        Abhinav Kumar <abhinavk@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

(resending one more time without git tag copy/paste fail)

A few fixes for v5.12

The following changes since commit 182b4a2d251305201b6f9cae29067f7112f05835:

  drm/msm/dp: Add a missing semi-colon (2021-02-07 09:57:04 -0800)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-02-25

for you to fetch changes up to 627dc55c273dab308303a5217bd3e767d7083ddb:

  drm/msm/disp/dpu1: icc path needs to be set before dpu runtime
resume (2021-03-22 18:52:34 -0700)

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm/dsi: fix check-before-set in the 7nm dsi_pll code
      drm/msm/dsi_pll_7nm: Solve TODO for multiplier frac_bits assignment
      drm/msm/dsi_pll_7nm: Fix variable usage for pll_lockdet_rate
      drm/msm: fix shutdown hook in case GPU components failed to bind

Douglas Anderson (1):
      drm/msm: Fix speed-bin support not to access outside valid memory

Fabio Estevam (1):
      drm/msm: Fix suspend/resume on i.MX5

Jonathan Marek (1):
      drm/msm: fix a6xx_gmu_clear_oob

Jordan Crouse (1):
      drm/msm: a6xx: Make sure the SQE microcode is safe

Kalyan Thota (1):
      drm/msm/disp/dpu1: icc path needs to be set before dpu runtime resume

Konrad Dybcio (1):
      drm/msm/adreno: a5xx_power: Don't apply A540 lm_setup to other GPUs

Rob Clark (1):
      drm/msm: Ratelimit invalid-fence message

Stephen Boyd (2):
      drm/msm/kms: Use nested locking for crtc lock instead of custom classes
      drm/msm/dp: Restore aux retry tuning logic

 drivers/gpu/drm/msm/adreno/a5xx_power.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     | 108 ++++++++++++++++++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  12 ++--
 drivers/gpu/drm/msm/dp/dp_aux.c           |   7 ++
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c     |   2 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h     |   6 +-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c |  11 +--
 drivers/gpu/drm/msm/msm_atomic.c          |   7 +-
 drivers/gpu/drm/msm/msm_drv.c             |  12 ++++
 drivers/gpu/drm/msm/msm_fence.c           |   2 +-
 drivers/gpu/drm/msm/msm_kms.h             |   8 +--
 12 files changed, 119 insertions(+), 60 deletions(-)
