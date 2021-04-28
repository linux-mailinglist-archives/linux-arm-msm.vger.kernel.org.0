Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DC2436DFA6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Apr 2021 21:39:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237050AbhD1TeP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Apr 2021 15:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45042 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243499AbhD1TeN (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Apr 2021 15:34:13 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D2EC061573;
        Wed, 28 Apr 2021 12:33:27 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id y32so45473236pga.11;
        Wed, 28 Apr 2021 12:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIhpTOwyw9uU2y8Ldiu9V72cANVrbUwFZO9n58uo5jI=;
        b=NJWSLemsb2j+BLaZx79NQ5gyXULgyE1EBGlozSvCBf+ynkelb3Nh4SkKqEbpl3GPlH
         EWeHW0Pp5x/7S2fQI8azP+krCg4/YN46z4QmbCJOEapuJ5y27eDv5qa9ISh9fvAeX77+
         4pK1dpcv3FRL1X1eK23yXhRkaS60i7/B68JfHXY77uB0Dsiy6qeqtZpVB3YjooKPke2z
         J2t8sR2o0YzcO1xmLMXsbQCWB/qTwvnInd5hFDxJkC+StiM5Hpim8SIwd8q2vc/fMeJM
         nujJmgo3CwO+ApXPZIZZ+mvcFgcwO9rVJV45PhgnLv1pd+dcZSq17swbLJmBirJN9Bqf
         OLGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nIhpTOwyw9uU2y8Ldiu9V72cANVrbUwFZO9n58uo5jI=;
        b=daNOZaILrhFc2V4ReMjXMSXsOVYNwpZQiEp0UiIJFYVBpLz/WUax5BmR7sddD0u5+K
         lYr+Y1qFMB3fqO2a6ggqpU6AWSzrS7A/Sz+OQ+C4Kpb8V4Lqs6f89O4xwHABzGOPLakR
         Pq8z90AhBJ2F7w8fVymG2usN4vHflZnbx+D3P+nMxCsS9FnMi5Z/QMQEcemDjiE5YcmQ
         7/NMM4kALQj3O+0K2XVFRZKSRkG03CKODx1ues0smZU9p1hllrNJU/6zqJ6ei44gjd8y
         IiZHOy80hM0U/tzImMx5IbAY4sFFXb8AufvLV2otPfYOtUcBkUDpkVuvg9zSdUOn1aR3
         6Qpg==
X-Gm-Message-State: AOAM531th7SWaoiRNCmHs4nEMBBZZh5Yz9OnDrNsJ62/w3EgPm8jGCq2
        K2rGLkrZRYZGLDlXQ0Bipeo=
X-Google-Smtp-Source: ABdhPJxTW6ITsgYJ7en/J7NHadpEgbEHdg9X22l8P7f1/wFTXDuAztqmD67uEppIvXmCbJl03aeoag==
X-Received: by 2002:a05:6a00:8a:b029:260:e095:8581 with SMTP id c10-20020a056a00008ab0290260e0958581mr30404666pfj.43.1619638406750;
        Wed, 28 Apr 2021 12:33:26 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id q25sm390552pfs.152.2021.04.28.12.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 12:33:25 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Dave Airlie <airlied@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/2] drm/msm: Smooth out ringbuffer-full handling
Date:   Wed, 28 Apr 2021 12:36:47 -0700
Message-Id: <20210428193654.1498482-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

With some recent userspace work to allow more rendering to be merged
into a single SUBMIT ioctl, I realized we have some sharp edges around
running out of free ringbuffer space.

1) Currently we only flush once all the cmds (or rather IBs to the cmd
   buffer) are written into the ringbuffer.  Which places a restriction
   that the submit must fit in the rb.  Which means slightly less than
   2k cmds per submit, after accounting for some of the other packets
   needed.
2) Currently, for devices that use RPTR shadow, we only write the
   CP_WHERE_AM_I packet at the end of the submit, so we aren't seeing
   partial progress that the GPU is making chewing through previous
   large submits
3) We spin for up to 1sec waiting for rb space, and then give up and
   proceed to overwrite the packets that that CP is currently chewing
   on.. which goes badly.  If userspace is submitting >1sec of work
   per submit ioctl, this means we spin for a long time, and then
   corrupt the rb anyways.

This patchset doesn't completely address #1.  And in general we don't
want to be uninteruptably blocking for so much time.. but this will
require some more extensive changes.

What it does do is address #2 by periodically emitting a CP_WHERE_AM_I,
and #3 by adding detection and error handling for rb overflow, returning
-ENOSPC when that happens.

Rob Clark (2):
  drm/msm: Handle ringbuffer overflow
  drm/msm: Periodically update RPTR shadow

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   | 32 ++++++++++++++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 30 +++++++++++++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 24 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  7 +++++-
 drivers/gpu/drm/msm/msm_gpu.c           | 33 +++++++++++++++++++++++--
 drivers/gpu/drm/msm/msm_gpu.h           |  2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |  5 ++++
 7 files changed, 117 insertions(+), 16 deletions(-)

-- 
2.30.2

