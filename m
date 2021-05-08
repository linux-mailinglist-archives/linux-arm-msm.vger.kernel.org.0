Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 67BCD3773E0
	for <lists+linux-arm-msm@lfdr.de>; Sat,  8 May 2021 21:53:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbhEHTx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 8 May 2021 15:53:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229549AbhEHTx7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 8 May 2021 15:53:59 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8B53C061574;
        Sat,  8 May 2021 12:52:57 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id t1so1412403pgl.4;
        Sat, 08 May 2021 12:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52/BODVej/sAPj1HAsVHhcFR3RxERy74g5pEGd5eMWs=;
        b=Lckz/cwvu9w/BaykBLqzfMjsL/UzQqsU+MmTCjOI6K9UxxSYmFuzeX2FoFWqqSHg+2
         InT7fyulz7rhUb0jU3JAmCtfarUKA4v4x09Z1Ka70powvuTaJSSwjiO36xdDagFCSTxK
         6moDnOuYz2a4wG6eP8UTr+7SDYQ6BmDSavDu/a1BxvZjD7DyMMVVrP5XU5ebIoIKab04
         s6Efs7s2NKzeKkIK8mloBupy3sUVKI2dmWS92vY+h60yKMmM7J4hFoSeZQObY8twiX4u
         YfOXkgLjEjPe3WMYhn/0p31S9ihmVQXjBH42wAq7j7QoeR9vcBFQY+j99ayowT/2hv8q
         pLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=52/BODVej/sAPj1HAsVHhcFR3RxERy74g5pEGd5eMWs=;
        b=evT75cc2CJL1uxCI1k6xDZrbIMN73DjMwB6RACXmOWV9YblUKVqSY6Sti2blULjkve
         ZRhIMR4djAQA70ULkr0p6xZwvedaX38N8DE6SwxiADl0DRT8+1rnANITAGd/0DTPsBv0
         tjMTaFwssD95JLqx4rlcSLZWxhFWRmNTHaYHHomMaY1MZ3ep8mXCovkAHReNZhHiL8Hd
         vAToXn0DQvykALzSUuIRpkqt79f3xVyv2Is975vpOS5sJvsd4QcAZTyEJ2CXjzWeZCcS
         JJQzjH/Pfur9GIKJ4jMC1HAg3nAO/wMCxhQ5q0YTFxHKKsmk6FZkAJZZLhAl9MblNH54
         rn+w==
X-Gm-Message-State: AOAM531ycSwE+NWDOuWCiA19LHQrGMTMoo6C/dinnAfOuAOHK84r+Gw3
        e1Bo9r1H1/jVZqXiasgYM97bporu5hqL2A==
X-Google-Smtp-Source: ABdhPJzShZqZ9yJXLeSXzV96pkdUxCEhyW3PchhSSkpkvoHPAOi4i4qCubtWTJgzZb+0BE3AedNzcw==
X-Received: by 2002:a62:8208:0:b029:289:112f:d43d with SMTP id w8-20020a6282080000b0290289112fd43dmr16583052pfd.61.1620503576956;
        Sat, 08 May 2021 12:52:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id u1sm7543017pgh.80.2021.05.08.12.52.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 12:52:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Bernard <bernard@vivo.com>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Hongbo Yao <yaohongbo@huawei.com>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Maxime Ripard <maxime@cerno.tech>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH 0/2] drm: Fix atomic helper dirtyfb stalls
Date:   Sat,  8 May 2021 12:56:37 -0700
Message-Id: <20210508195641.397198-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Someone on IRC once asked an innocent enough sounding question:  Why
with xf86-video-modesetting is es2gears limited at 120fps.

So I broke out the perfetto tracing mesa MR and took a look.  It turns
out the problem was drm_atomic_helper_dirtyfb(), which would end up
waiting for vblank.. es2gears would rapidly push two frames to Xorg,
which would blit them to screen and in idle hook (I assume) call the
DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
dirty rects, which would stall until the next vblank.  And then the
whole process would repeat.

But this is a bit silly, we only need dirtyfb for command mode DSI
panels.  So lets just skip it otherwise.

Rob Clark (2):
  drm: Fix dirtyfb stalls
  drm/msm/dpu: Wire up needs_dirtyfb

 drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.30.2

