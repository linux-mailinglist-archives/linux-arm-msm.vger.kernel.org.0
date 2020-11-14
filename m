Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B35A2B302F
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 Nov 2020 20:30:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgKNT2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 14 Nov 2020 14:28:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726112AbgKNT2a (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 14 Nov 2020 14:28:30 -0500
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2282C0613D1;
        Sat, 14 Nov 2020 11:28:30 -0800 (PST)
Received: by mail-pl1-x644.google.com with SMTP id d17so4604490plr.5;
        Sat, 14 Nov 2020 11:28:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
        b=tudOwl5k0DEf1JMf54FAh1NRxuvSxaazL8VdkjdApqPV45SwUXJhYIyJsPdsxtVBpf
         hgDV43HjAAGCuB2G4meVH7M4PeXQmowKYNyOTMAFQM2BIAn3EYum5smmbnLL525Nnrm1
         mcf1+VRnINeySCvgR+63WsBnQK5zaPiQggNkMLP9WVwgnNnt7BC8iQ4zDjzgyP9TvOU+
         fzRW9/HCvwY/G8a561RSboBba48456HSDIjvejQVIWyW3eZyf3IW0OKAG34zfuQY+BAQ
         cuHlnTxbyXyCFaIKxkZlIYWVTb+pnrrkrO8bqHgz650rwMxn4Npdm+VvzxavjDpIWpzY
         6dQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=AFQ+O37FNhcW/Av1cdzRedXy1kVAe5xo2SMJ3+HW4OM=;
        b=uAn8VBik5TSwOpgNoBer8KpijLR/2GQzK3Pw5pKr5RHFPJKUGXuQi/lwzlctRcA7bP
         XuA7GFdjw0OKWMcWHll3m3xt91ZoMtT6+lkRfSoH9Xto/zvVa+iS4frCsRqdDtdm6X7D
         8LoSiblTZRrf1h7NNH8LTqq7ytIcoK38dxYSR2qLQgFIm3wkX26WlPruCsPHfT6jBkmw
         +W7nzP7HIasvodfPdnWsDFZCf0vFtXUSajk4EYZucUijmALlsW4cZXAVc94Yh0oRaGN6
         iNYLZ/vO7g+wCPDIy9VqNw5IO2LD6MYcHp3Dp+SLPRRbSE+6MEW4FR0uTc+big2mPcxJ
         5kPg==
X-Gm-Message-State: AOAM533RNgvYvY9eEPasZpMQePepfbis7RkpK/b40Qd2uOGlsP/T+Lqo
        5nS2yCKRLLP0YIi3dDxup0c=
X-Google-Smtp-Source: ABdhPJz97OgwKrxTObJzEQUlL24OvH7R1dO5YeQlR3R2sYUOneSNlt1UEShKzMlvCtFXdJejagJqtg==
X-Received: by 2002:a17:90a:d495:: with SMTP id s21mr8950511pju.30.1605382110209;
        Sat, 14 Nov 2020 11:28:30 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id z7sm13794282pfq.214.2020.11.14.11.28.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 11:28:29 -0800 (PST)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jcrouse@codeaurora.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] drm/msm: Shrinker fixes and opts
Date:   Sat, 14 Nov 2020 11:30:07 -0800
Message-Id: <20201114193010.753355-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The last patch is the main thing, motivated by some cases where we would
spend a lot of time in msm_gem_shrinker_count().  First two are fixes I
noticed along the way.

Rob Clark (3):
  drm/msm: Protect obj->active_count under obj lock
  drm/msm/shrinker: We can vmap shrink active_list too
  drm/msm/shrinker: Only iterate dontneed objs

 drivers/gpu/drm/msm/msm_debugfs.c      |  3 +-
 drivers/gpu/drm/msm/msm_drv.c          |  3 +-
 drivers/gpu/drm/msm/msm_drv.h          |  8 ++--
 drivers/gpu/drm/msm/msm_gem.c          | 45 ++++++++++++++++------
 drivers/gpu/drm/msm/msm_gem.h          |  5 ++-
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 52 +++++++++++++++++++-------
 drivers/gpu/drm/msm/msm_gpu.c          | 10 +++--
 7 files changed, 89 insertions(+), 37 deletions(-)

-- 
2.28.0

