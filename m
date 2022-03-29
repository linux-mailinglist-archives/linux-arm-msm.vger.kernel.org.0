Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C49EB4EB644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Mar 2022 01:00:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238725AbiC2XCB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Mar 2022 19:02:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238637AbiC2XCA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Mar 2022 19:02:00 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F44E496BC;
        Tue, 29 Mar 2022 16:00:16 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id i11so18982931plr.1;
        Tue, 29 Mar 2022 16:00:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8GRMi4BaOngdJPfp9V0+F4LD+JDrrKljXWdP6AfpMg=;
        b=M65jFxPlVkdE37G6xltsUGPVyQxAPAQc77jbKKmsJWdTPzFSMHnocL4rTktfNhOlEf
         JL566q6XWf6wARvbFknVfUEdIvYokyLyzycTNKQ1ChztkZqerMu476RVSjsRfA9TiHkl
         4bWhBuAQpSy+t9K/YlffBtPxPvKb4q8CndxznH45dgJX9xhjbNilZh5ujFrQ3PX6I//V
         zWni7Y1AYcbtj7AaIORQMKlvD8xw2TmPotEDVgIa9g18VFTcvr3ty7WJVkWPSdfJPTMq
         MQJcKmRZo5DnlNLPf/J+e8S6DgvRnrj1ROcHa9CHBykVRtYn9vPZokJeShJOl73xZPdl
         ePTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=o8GRMi4BaOngdJPfp9V0+F4LD+JDrrKljXWdP6AfpMg=;
        b=uk/nc9ARAsJSMkhz+ibSOojUXSp/fUC8yZFmnhNwdFlmj8XeohqSjHmkBIzW6P1mIz
         OIphQs92Bgj6ZSCTDt1Hu1CXEtdfcXEV3hjjoMioAq0+WFD/Lf1QnETTWD0VhYsmJj5p
         tYtXPI1Muo8oKuijk+HUROsyCk0MsffsdXYrhQqlaAP3wtwdGztOnINo7aTeJ0gU/9Qu
         07UqozJoBw/RfGJ7Mj1NJqIXf/StOddxEDKnReH5HQKCNcCGCmDDD1rRrMkMLSM/G1T7
         PDzuHKUYVgzGONEYkosymli9CoOyzVjGCYwHN5SYMp7KcYwfbBfxWF7KWsUgg7lVj9ei
         JsDQ==
X-Gm-Message-State: AOAM5319KjuYOqF+dN/l5iJBAKK29GTnERtkvAA+0rc6JYm7lwUInIqs
        RwIkSH5HmiSUHePUTGuASlPwaarT8Io=
X-Google-Smtp-Source: ABdhPJzAvBrlwtlVkQ9fKjD9KB7sU16jv8DVYU8hDEq60nLNnO5WnwWatNyurWLGlMtThb3Ay5vbbQ==
X-Received: by 2002:a17:902:e748:b0:153:b484:bdf4 with SMTP id p8-20020a170902e74800b00153b484bdf4mr31957764plf.66.1648594815849;
        Tue, 29 Mar 2022 16:00:15 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
        by smtp.gmail.com with ESMTPSA id k10-20020a056a00168a00b004f7e2a550ccsm21301092pfc.78.2022.03.29.16.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 16:00:14 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Akhil P Oommen <quic_akhilpo@quicinc.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Emma Anholt <emma@anholt.net>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-kernel@vger.kernel.org (open list),
        Viresh Kumar <viresh.kumar@linaro.org>,
        Vladimir Lypak <vladimir.lypak@gmail.com>,
        Wang Qing <wangqing@vivo.com>,
        Yangtao Li <tiny.windzz@gmail.com>
Subject: [PATCH 0/9] drm/msm: Userspace allocated GPU addresses
Date:   Tue, 29 Mar 2022 16:00:48 -0700
Message-Id: <20220329230105.601666-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

The first five paches are various cleanups and simplifications.  The
next two get rid of redundant vma lookups in the submit and retire
paths.  Following that, fenced vma lets us indicate a fence value
following which the vma is no longer used, which is needed because
otherwise userspace could observe the signaled fence prior to
retire_submits() finishing.  (With userspace allocated GPU addresses
userspace is tracking when a buffer is no longer used and it's vma can
be deleted.)  And finally the last patch adds the new uabi for user-
space allocated iova.

Rob Clark (9):
  drm/msm/gem: Move prototypes
  drm/msm/gpu: Drop duplicate fence counter
  drm/msm/gem: Split out inuse helper
  drm/msm/gem: Drop PAGE_SHIFT for address space mm
  drm/msm: Drop msm_gem_iova()
  drm/msm/gem: Rework vma lookup and pin
  drm/msm/gem: Split vma lookup and pin
  drm/msm/gem: Add fenced vma unpin
  drm/msm: Add a way for userspace to allocate GPU iova

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c |  14 ++-
 drivers/gpu/drm/msm/msm_drv.c           |  21 ++++
 drivers/gpu/drm/msm/msm_drv.h           |  23 ----
 drivers/gpu/drm/msm/msm_fb.c            |  16 ++-
 drivers/gpu/drm/msm/msm_fence.c         |   6 +-
 drivers/gpu/drm/msm/msm_fence.h         |   3 +
 drivers/gpu/drm/msm/msm_gem.c           | 151 ++++++++++++++----------
 drivers/gpu/drm/msm/msm_gem.h           |  47 +++++++-
 drivers/gpu/drm/msm/msm_gem_submit.c    |  17 ++-
 drivers/gpu/drm/msm/msm_gem_vma.c       |  59 ++++++---
 drivers/gpu/drm/msm/msm_gpu.c           |   8 +-
 drivers/gpu/drm/msm/msm_gpu.h           |   2 +-
 drivers/gpu/drm/msm/msm_ringbuffer.c    |  12 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h    |   1 -
 include/uapi/drm/msm_drm.h              |   3 +
 18 files changed, 258 insertions(+), 131 deletions(-)

-- 
2.35.1

