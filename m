Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6C16A2144
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2019 18:49:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727257AbfH2QtG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 29 Aug 2019 12:49:06 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46655 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727115AbfH2QtG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 29 Aug 2019 12:49:06 -0400
Received: by mail-pg1-f194.google.com with SMTP id m3so1865796pgv.13;
        Thu, 29 Aug 2019 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+npB6gUnTr3XNVbB8y8PFXfDiZznn6tH9wpAPdNtoUY=;
        b=H6PCbsL4lkrK49kVBBw7zNbF2XUqct4jZEBExuqbxGaqcHnBLk6MWn6QLAgnza710W
         JGNb16n+DysidYP3kakhXN15EUuJ+qLDiX96yNuKm+s1Vk3bSXCgX0Kajimk/WQNyJmU
         6UNX6hrLBZR1lbTrJIxyOrGYmE0P3ijlx1K7rPwVdCcjacCNPYGZjPze69HcJA30yVkM
         9alFhTfuEIxNUCAMyFC7fmRR9tFf++1Zf9YPYFRsgEyWuCAsQXZZotGfBgG1fMlNOObD
         QXu/0M31fbjOU+3HI0dE1l65vOHT/dGR/1IJ3zKz3zqjkNgRV1b79XkKya0zM80m/1bR
         Mpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=+npB6gUnTr3XNVbB8y8PFXfDiZznn6tH9wpAPdNtoUY=;
        b=LS+edH2E65Ku+2I38gZYnYZp1wySZQymNQi1lqwSkWstldYi0y0YrXus9grbG24Ix/
         gG1QE5sP3sXJhyY9Al/ThZPlXaono/p7naiyo1zWV2WHF+7UkpC2QfGNUB3U1SON0ftP
         jerpr1D2bk2Biv9ZCVMNsrZ9TN1TgKk69ODYRTkeAoJ1xvjnd7CfNtDdS0D/TRSDuMVD
         ldIdgRJ/dmqvLwsaA6sMHwxtkODyn/OZYTw+W90CdYLqt7RmEXY0/xDTQKs7Ya8gdf+6
         YH3AGYyy/mBIlqf0RshyBvtp1hvztLzdQtOWv+wwNyH2Do1aHicYWaYAE+AHWaIfPzfa
         jpSQ==
X-Gm-Message-State: APjAAAVNQYbrQcmd8Kb9sOavSzIOMiWlKkIm+jnwpkgzGcs0KoIkhsef
        lQEEoU3SqJ8ZcBmj8ILoS3A=
X-Google-Smtp-Source: APXvYqxLUVD6+RHIyQbQ5RzIhVdLH8xfXFQXctXy0PMz8f8mfl97Hj12wgCKW6hQnaI6O8GFBBO2BA==
X-Received: by 2002:a17:90a:c08f:: with SMTP id o15mr11133504pjs.31.1567097345796;
        Thu, 29 Aug 2019 09:49:05 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id y9sm3548671pfn.152.2019.08.29.09.49.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 09:49:05 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Allison Randal <allison@lohutok.net>,
        Boris Brezillon <bbrezillon@kernel.org>,
        Bruce Wang <bzwang@chromium.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        Enrico Weigelt <info@metux.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Georgi Djakov <georgi.djakov@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Mamta Shukla <mamtashukla555@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Sravanthi Kollukuduru <skolluku@codeaurora.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 00/10] drm/msm: async commit support (v2)
Date:   Thu, 29 Aug 2019 09:45:08 -0700
Message-Id: <20190829164601.11615-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

Currently the dpu backend attempts to handle async commits.  But it
is racey and could result in flushing multiple times in a frame, or
modifying hw state (such as scanout address or cursor position) after
the previous flush, but before vblank, causing underflows (which
manifest as brief black flashes).

This patchset removes the previous dpu async commit handling, and
reworks the internal kms backend API to decouple flushing.  And in
the end introduces an hrtimer to flush async updates.  The overall
approach is:

 1) Move flushing various hw state out of encoder/crtc atomic commit
    (which is anyways an improvement over the current state, where
    we either flush from crtc or encoder, depending on whether it is
    a full modeset)

 2) Switch to crtc_mask for anything that completes after atomic
    _commit_tail(), so we do not need to keep the atomic state
    around.  Ie. from drm core's perspective, an async commit
    completes immediately.

    This avoids fighting with drm core about the lifecycle of an
    atomic state object.

 3) Track a bitmask of crtcs w/ pending async flush, and setup
    an hrtimer with expiration 1ms before vblank, to trigger
    the flush.  For async commits, we push the state down to
    the double buffered hw registers immediately, and only
    defer writing the flush registers.

Current patchset only includes the dpu backend support for async
commits.. mdp4 and mdp5 should be relatively trivial (less layers
of indirection involved).  But I won't have access to any mdp4 hw
for a few more weeks, so at least that part I might punt on for
now.

v2: couple small cosmetic updates, re-work locking to avoid stalls,
    add some tracepoints

Rob Clark (10):
  drm/msm/dpu: unwind async commit handling
  drm/msm/dpu: add real wait_for_commit_done()
  drm/msm/dpu: handle_frame_done() from vblank irq
  drm/msm: add kms->wait_flush()
  drm/msm: convert kms->complete_commit() to crtc_mask
  drm/msm: add kms->flush_commit()
  drm/msm: split power control from prepare/complete_commit
  drm/msm: async commit support
  drm/msm/dpu: async commit support
  drm/msm: add atomic traces

 drivers/gpu/drm/msm/Makefile                  |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  48 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  46 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  39 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  99 +++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  48 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  47 ++--
 drivers/gpu/drm/msm/msm_atomic.c              | 233 +++++++++++++++---
 drivers/gpu/drm/msm/msm_atomic_trace.h        | 110 +++++++++
 drivers/gpu/drm/msm/msm_atomic_tracepoints.c  |   3 +
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +
 drivers/gpu/drm/msm/msm_gpu_trace.h           |   2 +-
 drivers/gpu/drm/msm/msm_kms.h                 | 108 +++++++-
 16 files changed, 603 insertions(+), 201 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_trace.h
 create mode 100644 drivers/gpu/drm/msm/msm_atomic_tracepoints.c

-- 
2.21.0

