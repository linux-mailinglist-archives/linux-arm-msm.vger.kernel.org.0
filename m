Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 080BA350A07
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Apr 2021 00:14:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232686AbhCaWNj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 31 Mar 2021 18:13:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231650AbhCaWNI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 31 Mar 2021 18:13:08 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2D0C061574;
        Wed, 31 Mar 2021 15:13:07 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id s21so24571pjq.1;
        Wed, 31 Mar 2021 15:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G0/dYIgnSX89Wncbzzni0dKPijuXuQy3ZNHTM+WWX+o=;
        b=i/o6hDwUTHXj7cRi3sw12njdfpFH/fTCTnwowNa8u0wWBiNhPtCwIZC/aNohKv5bQb
         SYMDgArhz4vXJRqZxxx/naDXxFULtBnWSY2kb6OBwcM93HAOPnL1GvEL3ycxh4+9rh9c
         u7GC9htWspdKR7ZpEGB9pgbVpB/3xf8DEDgprZtSbHK7tekQA7rjU6JzZTJyJNuGUI2I
         EAVfi/19pY3FOKxn3zV6LpiicfVJev/QJTVP7ZgM3Mw8IGp9zjKVhVIV6DbkYTern+K+
         d/tGFfaIHPtQuuHIZI0W5hl5MNnmgR6MN0rRZKMb7nnwV4WwQa8xyLjbVJdU7VBGK4SO
         dVNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=G0/dYIgnSX89Wncbzzni0dKPijuXuQy3ZNHTM+WWX+o=;
        b=LNtBrdxVlMFlY6gCn8uGjibv0JvJlMSIEktc/qar5N1OiO+Y5TAWJUTSz5HqW/avpN
         B0nLNcoAafDEN0FJ/8IM69ZB7vRyh6HlmGvh/Fxm/DdKVyXT3fxXW6NNNM9v7GqUkiax
         /6Afrdnn9PKXkubi7KnnzZZRmtgSME/T+8Sll8xSPb5FaTc/nL7Inng6Ls0TfwocjN4Z
         SbP49fUXvjqAmTcs9N99IVYTJ3wwV4xA2b+ju+8hFEnfn+Rqci8/Q9UBKUhJlA5JnJpJ
         OjNN46ZhNDRvDQSa7MWQKJe+KN3eDYzkCvVM8qNfS2WebG0v+0xrEiwafSuL6FhAkP0j
         ce0w==
X-Gm-Message-State: AOAM530gwBWDJUiJBkk8YHjDPI6hQafn04HMo4fBUqynVW0ezMlgvLUt
        GS0jHfPS36NC5w5i4jE/Mj12emrgevnMEg==
X-Google-Smtp-Source: ABdhPJxwe+oiVp7tvWPLGP/ZA7PBzUUo1nBjagFv5vUKkmNvUEx8VjN8e9JniAVvPkE2IeMxJG16Lg==
X-Received: by 2002:a17:902:d30c:b029:e3:f95:6da5 with SMTP id b12-20020a170902d30cb02900e30f956da5mr5021786plc.6.1617228787350;
        Wed, 31 Mar 2021 15:13:07 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id j3sm3231107pfi.74.2021.03.31.15.13.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 15:13:06 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jordan Crouse <jordan@cosmicpenguin.net>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 0/4] drm/msm: Shrinker (and related) fixes
Date:   Wed, 31 Mar 2021 15:16:25 -0700
Message-Id: <20210331221630.488498-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

I've been spending some time looking into how things behave under high
memory pressure.  The first patch is a random cleanup I noticed along
the way.  The second improves the situation significantly when we are
getting shrinker called from many threads in parallel.  And the last
two are $debugfs/gem fixes I needed so I could monitor the state of GEM
objects (ie. how many are active/purgable/purged) while triggering high
memory pressure.

We could probably go a bit further with dropping the mm_lock in the
shrinker->scan() loop, but this is already a pretty big improvement.
The next step is probably actually to add support to unpin/evict
inactive objects.  (We are part way there since we have already de-
coupled the iova lifetime from the pages lifetime, but there are a
few sharp corners to work through.)

Rob Clark (4):
  drm/msm: Remove unused freed llist node
  drm/msm: Avoid mutex in shrinker_count()
  drm/msm: Fix debugfs deadlock
  drm/msm: Improved debugfs gem stats

 drivers/gpu/drm/msm/msm_debugfs.c      | 14 ++----
 drivers/gpu/drm/msm/msm_drv.c          |  4 ++
 drivers/gpu/drm/msm/msm_drv.h          | 10 ++++-
 drivers/gpu/drm/msm/msm_fb.c           |  3 +-
 drivers/gpu/drm/msm/msm_gem.c          | 61 +++++++++++++++++++++-----
 drivers/gpu/drm/msm/msm_gem.h          | 58 +++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gem_shrinker.c | 17 +------
 7 files changed, 122 insertions(+), 45 deletions(-)

-- 
2.30.2

