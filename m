Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CA4AB3A0050
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 20:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235148AbhFHSlr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 14:41:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235440AbhFHSkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 14:40:02 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E86FC061574
        for <linux-arm-msm@vger.kernel.org>; Tue,  8 Jun 2021 11:38:08 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso2637200wmh.4
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 11:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=0CZ6zsGDL077ByflUrLGblxh/3X5AA+P2DAAGI3NXok=;
        b=sh0LqyQtNIoetbCxFUgG84dH7ZbOYOa62Ty1uLs4FCfZ1ubBk/A+6hOml0hlDrdptD
         5gxXQu+GevHgG5IvY+WbYbW1WZfiiOujM1wyNvP6N1JecArV+Hk9ZXM00q4V+TmsQSEp
         W4Xex8rsdScBOLi/gkcLhPHz29z2t2rlr7xtH0tS/S9jhRve8vxQSI5WKFj+oW8Xkjkr
         ePuOvRhVB54d6M7rcpa9Umt20eIqz9kWa63oFuSJOca/IjQcWnk5kDZfVrIGIdRrxttN
         24eMbbMcPqlYwHnTHCb0ZFyO2iBMCOpGaS3eQ5zfo3t+Z8hVIxUvj8RgiQa/4eRY1YvL
         pkUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=0CZ6zsGDL077ByflUrLGblxh/3X5AA+P2DAAGI3NXok=;
        b=QMj7GEjXYz4od6X9FmMMq/ljjbkHUIHBiI2ZIiCR782v2BOoNKa7qGMXqM651QVQpL
         Y4CdX6E56ijIewX8WWEFXpzlfq2/nTyYDW/gI4jV2Lx/nnjwwEiOkrqpeH04qS+t0YdW
         32ylq3yYjty+bgCiIaS7nSJFk/FylfodpFjbMR/GE51eJNJtgRQp9Llq3pjjfXb6R/s0
         JGZId97AYm3OimyBmJ3R8zgeCQG9BkLwIqpQqAo/dLUDPFe6e6k6RjeGGD6WLQ1ZQElD
         4o5MR7sHnCVTv72F67R6cZpShGjDWvE9mIXyjI0olG8eY+zg/E6Q8hCC4D8WoalTT7YH
         Juig==
X-Gm-Message-State: AOAM532oU20o6Gp2iQDvhoU3KRCQhbdJmc7mCFJZTYI5SnFjL04zNJjP
        fRWzpc/ODodZn8FrBoW/1nVWto79Bz4viGOags0=
X-Google-Smtp-Source: ABdhPJxirZxedUoMUQETD/MhwZmMGfn6CphqaZt114BgCS8pQ+KfftTNOsK/xpk8l3/hTzrnzM6lvKzLDPEs4UxwBfE=
X-Received: by 2002:a05:600c:1c84:: with SMTP id k4mr5862126wms.164.1623177484616;
 Tue, 08 Jun 2021 11:38:04 -0700 (PDT)
MIME-Version: 1.0
From:   Rob Clark <robdclark@gmail.com>
Date:   Tue, 8 Jun 2021 11:41:58 -0700
Message-ID: <CAF6AEGsyenBs3hmEzPZ445JWpCaUR7Pm1e232oOYMmdpgovKkw@mail.gmail.com>
Subject: [pull v2] drm/msm: msm-fixes-v5.13-rc6 for v5.13-rc6
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     freedreno <freedreno@lists.freedesktop.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Dave & Daniel,

A few late fixes for v5.13

The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06
16:26:57 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/msm.git msm-fixes-v5.13-rc6

for you to fetch changes up to ce86c239e4d218ae6040bec18e6d19a58edb8b7c:

  drm/msm/a6xx: avoid shadow NULL reference in failure path
(2021-06-08 11:26:45 -0700)

----------------------------------------------------------------
Alexey Minnekhanov (1):
      drm/msm: Init mm_list before accessing it for use_vram path

Jonathan Marek (3):
      drm/msm/a6xx: update/fix CP_PROTECT initialization
      drm/msm/a6xx: fix incorrectly set uavflagprd_inv field for A650
      drm/msm/a6xx: avoid shadow NULL reference in failure path

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 155 +++++++++++++++++++++++++---------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |   2 +-
 drivers/gpu/drm/msm/msm_gem.c         |   7 ++
 3 files changed, 122 insertions(+), 42 deletions(-)
