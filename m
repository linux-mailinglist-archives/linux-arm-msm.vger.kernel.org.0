Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E7038369AAE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Apr 2021 21:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232291AbhDWTMj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 23 Apr 2021 15:12:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232212AbhDWTMj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 23 Apr 2021 15:12:39 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58224C061574
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id q4so8830089qtn.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Apr 2021 12:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
        b=kuLS0suPNfLfL/e8JYU0ZgCsM09iPvMie9U8PBPzCHE65hayjIIyW/c4VG+rtLVCSu
         05TvT3RLM45wuNRjopgjY3Ors5GfQ3GgS4MzsYw0AROaDcmp3HGCEXLesOWJqNnwyUv/
         KNMT2zM+KPa66AQGjuCtTmcxbdAnZZFMYgSIClJJe4aldjscpatDVowDz9PfHRWwzSvK
         5ehh2Cv0Q2JZVupwoAxE/5tR84zK+L89u6vsLAHhgN95YQBxjXrULY0sjy5EImrS4d25
         9KA8QFscriXuiQggAaZlQ3YITF3zntxWUoR5StcQnymT/ycSe8fELhGgl1gqMv0AD8dM
         tXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=kEaQvWN4Z8yVJOtNMFNTVQ5YEguXpuTG96s4DFICCJ0=;
        b=P1PX8W2faqTDhkiDRX+eGx/Y26Zh6UZowVEdY/Jeu0QbqRUtAt70gBMFP0VOFs47P5
         1vpuwSHr/xibyc/AE6uxGrdLDoD8z00aPPoXK/3Wd3D1mtcYHXPGsxDLFQEYkG4FYppa
         6UKh0ADIe9O0WFzOpP59BvPtKX9J15Z9Acf+Tj+CJOcXkKlspXKywFSFTCNFluS0gY5g
         ODB85AE0VishYq/tMDr0WaQJUBBJlLqzYqRFOJy1FVVwq04+NVB5GhYyO7NWSDiob5nT
         rNAECYepeE/0Euj275xfeh9yqiZZ2V+NapIwvlyiaXPKGqu7Guv30wuUzbFE0NsnJxWH
         YstQ==
X-Gm-Message-State: AOAM531oCMFLezlb8vaxCjqkP4ZRkKYH1S+pofOO9WX9DNcB7Z12N1UC
        fa3rz0UONU1JFj8JpNIX5dqbyw==
X-Google-Smtp-Source: ABdhPJyNFE1wEhOEH03d5WveOtjIevlxoZNdPt2fGHLKPGOwI4mNzLVERkLgfGOFwAeF0imWrkJqYA==
X-Received: by 2002:ac8:7191:: with SMTP id w17mr5368523qto.199.1619205121519;
        Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id a22sm4834630qtp.80.2021.04.23.12.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Apr 2021 12:12:01 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bernard Zhao <bernard@vivo.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        Dave Airlie <airlied@redhat.com>,
        David Airlie <airlied@linux.ie>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Iskren Chernev <iskren.chernev@gmail.com>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sean Paul <sean@poorly.run>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH 0/5] drm/msm: add MSM_BO_CACHED_COHERENT (and related changes)
Date:   Fri, 23 Apr 2021 15:08:16 -0400
Message-Id: <20210423190833.25319-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support for MSM_BO_CACHED_COHERENT, a coherent version of MSM_BO_CACHED
which is implemented by setting the IOMMU_CACHE flag.

Jonathan Marek (5):
  drm/msm: remove unnecessary mmap logic for cached BOs
  drm/msm: replace MSM_BO_UNCACHED with MSM_BO_WC for internal objects
  drm/msm: use the right pgprot when mapping BOs in the kernel
  drm/msm: add MSM_BO_CACHED_COHERENT
  drm/msm: deprecate MSM_BO_UNCACHED (map as writecombine instead)

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  4 +--
 drivers/gpu/drm/msm/adreno/a5xx_power.c     |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  2 +-
 drivers/gpu/drm/msm/adreno/adreno_device.c  |  1 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  2 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c          |  2 +-
 drivers/gpu/drm/msm/msm_drv.c               |  3 +-
 drivers/gpu/drm/msm/msm_drv.h               |  1 +
 drivers/gpu/drm/msm/msm_gem.c               | 34 ++++++++++-----------
 include/uapi/drm/msm_drm.h                  |  7 ++---
 12 files changed, 33 insertions(+), 31 deletions(-)

-- 
2.26.1

