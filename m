Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E78DC27F404
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Sep 2020 23:16:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbgI3VQO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Sep 2020 17:16:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39522 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725355AbgI3VQN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Sep 2020 17:16:13 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 826FBC061755;
        Wed, 30 Sep 2020 14:16:11 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id o20so2150678pfp.11;
        Wed, 30 Sep 2020 14:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2o3lDSN5uV/shoTTYh+75euIHZMsefv5Gthxgu7JPwE=;
        b=caTBU4niMhHm5SdxvlDQTOhj2VarLxDNHJbZbv9fmrYarhZo2WvtxnzIx5keqEl32Z
         SqWbQr8oxaMtLeYMba82SB4Jfq6IgiloKNaGO74jvnkQB5vaIbv738+LykAkMkVtffjb
         7owNN+xga5QeG00+QGWK4LnmRsQaGhi1L1PabdADPs/swyOhKu1JajRlTvZo+rI8K3cC
         hFpAqzptQU2W75U0DKKct3v/72wj/Q6Ma6eiohXLw15zEdMo5bXcVORp8S4H8Zte8NPi
         LiZ5wmdHaMDCKiHOIBnUps4BrHGSkGk6qXEY8aOPtpeVIeWu+WqNVFLtn8FE1Wwt34zG
         SO/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2o3lDSN5uV/shoTTYh+75euIHZMsefv5Gthxgu7JPwE=;
        b=rGeKvBcUdPO8IPHgk1nZ1FT0njdFbCpmIXNU0JmMU0UcIITkrPpp7ShQ3IM3Ekpk+m
         qm7fjy5IWRYRUL4AQY/ekBXwUrwqot0p5KUCSOM30aziGrSlsDAPnTNtTpx0bwf900jH
         OQjKTHRvq/vpzerHqjqg8kqeVoDQyTsY3S7rwESTndgbhZ+kHlNepwajtML4+2NepL8N
         7iY8inAkjqAS8pSU0pMnkR6i2rp34p1KjzuC6ScU5yP/zAH9ygeLZAloQhcxrvEW9iQi
         4dlUB8JPVdJKXyKEZIXgg95SwvfWThx0c5dN/OPyWQ8+gM//2rM93SUacSUFRVQPOc52
         2lug==
X-Gm-Message-State: AOAM530fk8U+Z1jn3guymWslSAftxaGDupgpsK0+LgSl2GxIAu1AZXle
        RDyZnTA+aQfJnXP7KQRZ3OU=
X-Google-Smtp-Source: ABdhPJxzC4J7DZzesa6EYV5iuWtAvg7BXOstE7gtkBTPyQKLex1MQPuPSNEa+NwAyPkW4yM13IV6rg==
X-Received: by 2002:a17:902:6803:b029:d2:42a6:312 with SMTP id h3-20020a1709026803b02900d242a60312mr4046233plk.24.1601500570997;
        Wed, 30 Sep 2020 14:16:10 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id ih11sm3073170pjb.51.2020.09.30.14.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2020 14:16:09 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, Tejun Heo <tj@kernel.org>,
        timmurray@google.com, Daniel Vetter <daniel@ffwll.ch>,
        Qais Yousef <qais.yousef@arm.com>,
        Rob Clark <robdclark@chromium.org>,
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 0/3] drm: commit_work scheduling
Date:   Wed, 30 Sep 2020 14:17:19 -0700
Message-Id: <20200930211723.3028059-1-robdclark@gmail.com>
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
update loop.  And the last patch exposes the task id to userspace as
a CRTC property, so that userspace can adjust the priority and sched
policy to fit it's needs.


v2: Drop client cap and in-kernel setting of priority/policy in
    favor of exposing the kworker tid to userspace so that user-
    space can set priority/policy.

Rob Clark (3):
  drm/crtc: Introduce per-crtc kworker
  drm/atomic: Use kthread worker for nonblocking commits
  drm: Expose CRTC's kworker task id

 drivers/gpu/drm/drm_atomic_helper.c | 13 ++++++++----
 drivers/gpu/drm/drm_crtc.c          | 14 +++++++++++++
 drivers/gpu/drm/drm_mode_config.c   | 14 +++++++++++++
 drivers/gpu/drm/drm_mode_object.c   |  4 ++++
 include/drm/drm_atomic.h            | 31 +++++++++++++++++++++++++++++
 include/drm/drm_crtc.h              |  8 ++++++++
 include/drm/drm_mode_config.h       |  9 +++++++++
 include/drm/drm_property.h          |  9 +++++++++
 8 files changed, 98 insertions(+), 4 deletions(-)

-- 
2.26.2

