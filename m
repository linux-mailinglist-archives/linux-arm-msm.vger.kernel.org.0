Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 121A8397C84
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 00:44:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234714AbhFAWpk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Jun 2021 18:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52942 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234985AbhFAWpk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Jun 2021 18:45:40 -0400
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591ECC061574;
        Tue,  1 Jun 2021 15:43:57 -0700 (PDT)
Received: by mail-pj1-x102a.google.com with SMTP id ei4so532157pjb.3;
        Tue, 01 Jun 2021 15:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7E0ztSWBZtOlaDKHfsCxqv376BZVJpQCMWAAU6G5G88=;
        b=DleniQqk4mS2+2kein8dLcGyoPKrBjH9m0Z5PpLGC2bNJDuxywHlzSBlE1QndfWK7n
         dStP3Ah4dc9a1FKmip239Zu3EU8Z2XNLiHuU31qMPQ2b4OpkhwhGN2KP/LXtXBwcrVgc
         mS9nB5NKDYxiRDXCrkKoXsn0cBNthDtoDwVj0QuXSwQCXNF6OroW73BSC9zA+5dlu3hg
         MFKz4eC7Xb0mzUHbB4Ko39uPuk89yI96k8l1/uApgi0plUFcCVOBAllpFPLX6dnbPpGE
         EBvhdE32Xlt4O6nPpjbX/Nd4qMi7xTSa4zz86NoC/24K1CZrJvjX8Gg+vTM/V2zQA9db
         G+zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=7E0ztSWBZtOlaDKHfsCxqv376BZVJpQCMWAAU6G5G88=;
        b=FkYsgbHEDj9rn0vW0Jb+Ye/1TI+e/S5VkOq4VaENQyy7FbAkelk8EdP/lH2eBpybKe
         rr4ANOZtlFoXmdqst8ZumucqTkSRzluQWNcWCIAjWk9nY2cyuha4fQcpnDIwSTPXMMZS
         pMBwmtvLem78NRCOP3LPTAdTmgCYdAy530Jq3nebIzbBhopiADKQQi/uYxqg/QfNqbip
         ioXw/JtRJy1J3yomth6XcGeidjGuvioSce6dIEiwYXSWFRuqDS+CrGas+6i3Gef8D+Gu
         RwRbOZ+kDgRPn61SmIjPzVKKGqskHqoQIKUXHiGuXzW3/xLjHfxRQM9Ggs6yKB+/VQyA
         jDnw==
X-Gm-Message-State: AOAM532BVmyFQbzIJwxQeGWQoOC/l7YQFpXbgFwlZs34G+MJOaHfPU8I
        POO82U2ktiMJjdmuDTUjo11qJ9xe+a8wT+S7
X-Google-Smtp-Source: ABdhPJx+MXlJVAK3VU9sUj3Q8wM8rPRlRXKTA4bATZVDKq9RVk6Y1mVomVLJn7SS3hiZvw7QTuhVmw==
X-Received: by 2002:a17:90b:252:: with SMTP id fz18mr2232979pjb.52.1622587436763;
        Tue, 01 Jun 2021 15:43:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id fs24sm9228104pjb.6.2021.06.01.15.43.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 15:43:55 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Abhinav Kumar <abhinavk@codeaurora.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Dave Airlie <airlied@redhat.com>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        freedreno@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU), iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        Iskren Chernev <iskren.chernev@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Kalyan Thota <kalyan_t@codeaurora.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maxime Ripard <maxime@cerno.tech>,
        Qinglang Miao <miaoqinglang@huawei.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Will Deacon <will@kernel.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH v4 0/6] iommu/arm-smmu: adreno-smmu page fault handling
Date:   Tue,  1 Jun 2021 15:47:18 -0700
Message-Id: <20210601224750.513996-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

This picks up an earlier series[1] from Jordan, and adds additional
support needed to generate GPU devcore dumps on iova faults.  Original
description:

This is a stack to add an Adreno GPU specific handler for pagefaults. The first
patch starts by wiring up report_iommu_fault for arm-smmu. The next patch adds
a adreno-smmu-priv function hook to capture a handful of important debugging
registers such as TTBR0, CONTEXTIDR, FSYNR0 and others. This is used by the
third patch to print more detailed information on page fault such as the TTBR0
for the pagetable that caused the fault and the source of the fault as
determined by a combination of the FSYNR1 register and an internal GPU
register.

This code provides a solid base that we can expand on later for even more
extensive GPU side page fault debugging capabilities.

v4: [Rob] Add support to stall SMMU on fault, and let the GPU driver
    resume translation after it has had a chance to snapshot the GPUs
    state
v3: Always clear FSR even if the target driver is going to handle resume
v2: Fix comment wording and function pointer check per Rob Clark

[1] https://lore.kernel.org/dri-devel/20210225175135.91922-1-jcrouse@codeaurora.org/

Jordan Crouse (3):
  iommu/arm-smmu: Add support for driver IOMMU fault handlers
  iommu/arm-smmu-qcom: Add an adreno-smmu-priv callback to get pagefault
    info
  drm/msm: Improve the a6xx page fault handler

Rob Clark (3):
  iommu/arm-smmu-qcom: Add stall support
  drm/msm: Add crashdump support for stalled SMMU
  drm/msm: devcoredump iommu fault support

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |   9 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 101 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  43 +++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
 drivers/gpu/drm/msm/msm_debugfs.c           |   2 +-
 drivers/gpu/drm/msm/msm_gem.h               |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
 drivers/gpu/drm/msm/msm_gpu.c               |  55 ++++++++++-
 drivers/gpu/drm/msm/msm_gpu.h               |  19 +++-
 drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
 drivers/gpu/drm/msm/msm_iommu.c             |  22 ++++-
 drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 ++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
 include/linux/adreno-smmu-priv.h            |  38 +++++++-
 20 files changed, 354 insertions(+), 31 deletions(-)

-- 
2.31.1

