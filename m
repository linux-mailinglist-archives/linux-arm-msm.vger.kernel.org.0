Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A4B271049
	for <lists+linux-arm-msm@lfdr.de>; Sat, 19 Sep 2020 21:36:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726518AbgISTgg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 19 Sep 2020 15:36:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726511AbgISTgg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 19 Sep 2020 15:36:36 -0400
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com [IPv6:2607:f8b0:4864:20::532])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1234BC0613CE;
        Sat, 19 Sep 2020 12:36:36 -0700 (PDT)
Received: by mail-pg1-x532.google.com with SMTP id u13so5555493pgh.1;
        Sat, 19 Sep 2020 12:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/hbQvW/WwycKpSevUDMADl+bOt9pZZjBbbmr6AnIEaI=;
        b=LV6oI91d2+vZgOpBsE3f5tmaEmuLfA7Q10jGKazhq2CUGtcu8o0tldMSpggbrL5u7m
         sO5twsUD4PMa9te7nppTnFJHrV2oD/h0QfLir3MaGmWZ+OEx/ViSJsie0+YbKww6hPts
         A55PE8p4pOWQq/zHNIvzaRBXJ3OJL0jLKqQr9Z6WlEeEGa54bzoxNrk0au9GK8T0e4Al
         fvkRM0ECxrsqQ5f/aGK9ZUTPAwPKSrAcNKN7SNl1oRXr0DRcGg9kizSn6fbBQLZ68Z61
         iZkJ5p/0sgZZryPhSTJRgJzXioKskcTnmyJY7QY+yr4WGH2U9FxZ0v6AKNvXKVewCdQN
         iySg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=/hbQvW/WwycKpSevUDMADl+bOt9pZZjBbbmr6AnIEaI=;
        b=KEci1CqHMJnwbtGx+COXpyfmzYPdT+6NQZMPoW1oURNDXpcF7aqNwdkboyUnnS7p0o
         yAgKYyy/wE/Oq+mP2XfH7Vri1gL5JRPbf/cAmc92YuoWI6VtoHGGzm+KN0I7IAHCW4X/
         t9mm0DG9lhXN+hfEbGCxBSrwYP7P5LOf32qAF3YTrzpywH1PcpqSMhZU2GJrhIyugBbe
         AVRsymqYWn5CvlLz2CdkVXCeDVrPKFnWk25VLJxkOGWFZtwErc7ewQKm6K8V83cgrR89
         Gxz93y1jiuVyJVsE8BxgFwynVWjLfCkpu+HkR5vfBGaFpupKfdNINnT+vAIyjKZagdlo
         hcnA==
X-Gm-Message-State: AOAM532o+QkWNZ0OZfjqHKYRzNBcsGqhTXN0DnGs6NDvO56N3MC9/KAc
        Id59h67QmLx9JAmrzH9ll1E=
X-Google-Smtp-Source: ABdhPJx9BimOCWqRHWSyLRsQP7obbHYEpFxvnWsXd3DpadbJxUFwl1Fa6tKEJ5FKQ1joMc6DMSSa4A==
X-Received: by 2002:a65:42c2:: with SMTP id l2mr11008521pgp.61.1600544195287;
        Sat, 19 Sep 2020 12:36:35 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id g24sm7553133pfk.65.2020.09.19.12.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2020 12:36:34 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Peter Zijlstra <peterz@infradead.org>, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/3] drm: commit_work scheduling
Date:   Sat, 19 Sep 2020 12:37:23 -0700
Message-Id: <20200919193727.2093945-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The android userspace treats the display pipeline as a realtime problem.
And arguably, if your goal is to not miss frame deadlines (ie. vblank),
it is.  (See https://lwn.net/Articles/809545/ for the best explaination
that I found.)

But this presents a problem with using workqueues for non-blocking
atomic commit_work(), because the SCHED_FIFO userspace thread(s) can
preempt the worker.  Which is not really the outcome you want.. once
the required fences are scheduled, you want to push the atomic commit
down to hw ASAP.

But the decision of whether commit_work should be RT or not really
depends on what userspace is doing.  For a pure CFS userspace display
pipeline, commit_work() should remain SCHED_NORMAL.

To handle this, convert non-blocking commit_work() to use per-CRTC
kthread workers, instead of system_unbound_wq.  Per-CRTC workers are
used to avoid serializing commits when userspace is using a per-CRTC
update loop.

A client-cap is introduced so that userspace can opt-in to SCHED_FIFO
priority commit work.

A potential issue is that since 616d91b68cd ("sched: Remove
sched_setscheduler*() EXPORTs") we have limited RT priority levels,
meaning that commit_work() ends up running at the same priority level
as vblank-work.  This shouldn't be a big problem *yet*, due to limited
use of vblank-work at this point.  And if it could be arranged that
vblank-work is scheduled before signaling out-fences and/or sending
pageflip events, it could probably work ok to use a single priority
level for both commit-work and vblank-work.

Rob Clark (3):
  drm/crtc: Introduce per-crtc kworker
  drm/atomic: Use kthread worker for nonblocking commits
  drm: Add a client-cap to set scheduling mode

 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++----
 drivers/gpu/drm/drm_auth.c          |  4 ++++
 drivers/gpu/drm/drm_crtc.c          | 37 +++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_ioctl.c         | 13 ++++++++++
 include/drm/drm_atomic.h            | 31 ++++++++++++++++++++++++
 include/drm/drm_crtc.h              | 10 ++++++++
 include/uapi/drm/drm.h              | 13 ++++++++++
 7 files changed, 117 insertions(+), 4 deletions(-)

-- 
2.26.2

