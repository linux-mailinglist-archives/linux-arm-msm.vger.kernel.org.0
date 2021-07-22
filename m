Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 076A73D2FB3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jul 2021 00:17:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232332AbhGVVhF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Jul 2021 17:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232360AbhGVVhE (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Jul 2021 17:37:04 -0400
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8D16C061760;
        Thu, 22 Jul 2021 15:17:38 -0700 (PDT)
Received: by mail-pj1-x1029.google.com with SMTP id hg12-20020a17090b300cb02901736d9d2218so1261931pjb.1;
        Thu, 22 Jul 2021 15:17:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMkDgOrvQyP1SLItHDLnfmWsC7sgMNSITNSdc/ws6zA=;
        b=d/QmizXKgwPlJFSmjjZrZ/EgTWN90QjKd3XvOAoGwkYwx8JLJmaULlhMenIUrIs9LU
         ehoxkuSV20H/pO0m1w8PRbYqzVVyNkRmE0wBRd9WiuOm0yu66uPzbUu4wYbsNBMwef04
         UNJ9ul7B67GnRxs5B1hv4ayctM2agheWYSl0k/NFx/aPRn8ZYf3jkp8CshMpK3GtZUN9
         HIuNhYXkr9mKDjLNmf3ndcpc6p4J1oFRjbaPIAsEp3A7Kgf97FEsBrZLRBT8Hhed+Kba
         K1gLPl+onz1fwf+XCjL+po+xsWhMRFOgiT2o7Upub+Pr6EsDeQLAS66c1s5YDjgAr97t
         UMsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EMkDgOrvQyP1SLItHDLnfmWsC7sgMNSITNSdc/ws6zA=;
        b=QvrPiMGPkus2KPbqCZxElaAN5sMU0e9JDFN9IoIh6wktIraxin82xV0hImaB0s/K+2
         tE37zzdqUXJSSc4lk7qLzS5PFfDYqTfOn0X9NS4vwc2dzz/eUFKO0V1aO89YVztsm3mJ
         DQewTPhyZSOYCDWa6k7cCTGnbSxDMbFrLsamEQ5zHFpgCL9e4I8aBmD00UDaP5yQ3fja
         KHKhb20Zcg0ljvxF2QEM5hUu6qKT48CTgTEabWS6Efpd/g+lKVqh7gHY0KIC6mq/uTl6
         rO+O191e0+0oAIHw9LNj7PL+dm9OXUVyy2YqLICvL0BsAK1R2GVIpJ+bcfku3TaVhJRg
         APHA==
X-Gm-Message-State: AOAM532ac3/ZrnbFdTCeKzv4Fn0WgGiu6mJJEMk06M6DFsutUt6ALtW9
        nPb+ZweG8219Kc1nrdu8/hc=
X-Google-Smtp-Source: ABdhPJzScGN6hhj5xPi+zBl19RrPH3Q+8v9QGVI6j6NSNBBqFSAkVc5t6gwgG5Ph6MH6vg4f7iYzXQ==
X-Received: by 2002:a17:903:2082:b029:12b:a0e9:5c88 with SMTP id d2-20020a1709032082b029012ba0e95c88mr1731398plc.27.1626992258242;
        Thu, 22 Jul 2021 15:17:38 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x10sm34105015pgj.73.2021.07.22.15.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 15:17:36 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>
Subject: [PATCH 0/3] drm/msm: Improved devfreq tuning
Date:   Thu, 22 Jul 2021 15:21:38 -0700
Message-Id: <20210722222145.1759900-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This is the outcome of trying to fix some bad gpu freq behavior seen in
some use-cases, in particular mobile games that throttle themselves to
30fps.  With the existing tuning, we'd end up spending most of the time
that we should be running fast at a low freq, and most of the idle time
at a high freq.

First two patches are prep, 3/3 is the interesting bit.  See the patch
description in 3/3 for more details.

Rob Clark (3):
  drm/msm: Split out devfreq handling
  drm/msm: Split out get_freq() helper
  drm/msm: Devfreq tuning

 drivers/gpu/drm/msm/Makefile          |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   4 +-
 drivers/gpu/drm/msm/msm_gpu.c         | 124 ++--------------
 drivers/gpu/drm/msm/msm_gpu.h         |  27 +++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 203 ++++++++++++++++++++++++++
 5 files changed, 238 insertions(+), 121 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/msm_gpu_devfreq.c

-- 
2.31.1

