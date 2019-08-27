Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 889AA9F527
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Aug 2019 23:36:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726871AbfH0Vgo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Aug 2019 17:36:44 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38004 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfH0Vgo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Aug 2019 17:36:44 -0400
Received: by mail-pl1-f195.google.com with SMTP id w11so177154plp.5;
        Tue, 27 Aug 2019 14:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+0AUBxbU6JVGwde8Yye0R2BikQpnByAsWECQmXnXdg=;
        b=ORQG6ecUUO5DHHrbAG09EZHk4pcKZezQuBxRAF+KWI2FGlRh5SpcXahV1RvNmYAeFl
         dn1epk7Ea0CJf26fKzI/BP5wzDexaa4K9aOFA2nGh98/oHHeHJf25lame43eyEgYOtNN
         PIexZfo4kWgQrIKgGV1PspZOBb53LpAoG5aO/wAbEqfUlEbIIcfTyK8+a52s3lXPXjbO
         bqeoqBQbMSkDMQoua45nrrUo0S9OSEBLwN9uRyZ0Zn505CbC+8+vogDtWZSCTTM6tahU
         7w9X76M1Jwnevb1HG3vcL5+/WlcOoFvyZAUVDkTldSvpT5s3xzipcHNQFsWS+KJTHJg8
         7RxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=k+0AUBxbU6JVGwde8Yye0R2BikQpnByAsWECQmXnXdg=;
        b=qXi+GXrAjDzkXj4Cs2mEXLhVbEu6aA+a0HOMfDujGMvZfJT/pJ0mbUix8ub0BYYD1E
         O8BdZ0hddJmOMZha3xxAbXcwavXgAbrfubp99BEo6+tKw3lTdU8PMZYvxw8vj/CSgJcu
         Lx6NkVMwO7vFgEc4/HmEruWuNuzpnxXHR865ycCYd3mNEnee0sCqLZGjgV4HviyS+CHq
         Y6JY3T3H6MODeUiVa9gXHnfumkOax7G/QtFNSACEjvA6RHmXd7i8pM+1UgQV0GdLk14Y
         9R6G020UCA1nCgjf1rzcvng8Jz3R9CDYVxlUD19hAWYGl2t8I7cxJePhEVnKghS0kEXa
         o9HA==
X-Gm-Message-State: APjAAAV1MZR701VbQHO1saODfUMPhCDk/PA1q4X3y3kSF7uec0yLGQIj
        KEGAbo2nLn4d/we+7QkUfn4=
X-Google-Smtp-Source: APXvYqy07weBiz46/PfoQJBr6AVmaA4u5nf1lNwSBxa3zqpE7lPXtS1ZoG1ndxvssYCOXXhfmOjHoQ==
X-Received: by 2002:a17:902:f01:: with SMTP id 1mr981614ply.337.1566941803570;
        Tue, 27 Aug 2019 14:36:43 -0700 (PDT)
Received: from localhost ([100.118.89.196])
        by smtp.gmail.com with ESMTPSA id b126sm275451pfa.177.2019.08.27.14.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 14:36:42 -0700 (PDT)
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
        GPU), Fritz Koenig <frkoenig@google.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
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
Subject: [PATCH 0/9] drm/msm: async commit support
Date:   Tue, 27 Aug 2019 14:33:30 -0700
Message-Id: <20190827213421.21917-1-robdclark@gmail.com>
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

Rob Clark (9):
  drm/msm/dpu: unwind async commit handling
  drm/msm/dpu: add real wait_for_commit_done()
  drm/msm/dpu: handle_frame_done() from vblank irq
  drm/msm: add kms->wait_flush()
  drm/msm: convert kms->complete_commit() to crtc_mask
  drm/msm: add kms->flush_commit()
  drm/msm: split power control from prepare/complete_commit
  drm/msm: async commit support
  drm/msm/dpu: async commit support

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |  48 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h      |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  46 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  39 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  99 +++++----
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c      |  48 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c      |  47 ++--
 drivers/gpu/drm/msm/msm_atomic.c              | 210 +++++++++++++++---
 drivers/gpu/drm/msm/msm_drv.c                 |   1 +
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +
 drivers/gpu/drm/msm/msm_kms.h                 | 108 ++++++++-
 12 files changed, 466 insertions(+), 199 deletions(-)

-- 
2.21.0

