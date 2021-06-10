Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E940C3A3626
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Jun 2021 23:44:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhFJVp6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Jun 2021 17:45:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229941AbhFJVp6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Jun 2021 17:45:58 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCF6C061574;
        Thu, 10 Jun 2021 14:44:01 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id v13so1750154ple.9;
        Thu, 10 Jun 2021 14:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXpzcgNJpQHDdAAXuY/oQ+b/W0CaqN4oZOi6cgulc3w=;
        b=E2rbXL6CzPIKl7GWbqD7FCanhZAzWtfGCuqJrFoaEQgsw5urIjzABVakFeezgw+MF9
         dPS1G7lhP/5pp/WE5+VtaBnHKjR/0QzthCWTcHRwkPDCAvNwJ6mn6Kbh1Tho8cDO0wrb
         R5YhgKOtFkV8qrAPER3NbSwhY/JPpabWfzpYzd1AvK9MthQJD50skgQ/v93OLH0fU2T/
         l1Z4dfXrQoxVTMMJOrkwKLmi6+hghrguF987nlMO+Kd+QlIfzXFR3nfoAMdEFti6YXAL
         Agwug7Eiwl+gQ36hHVAnaJXxQ//VEBvG71kovgdzds+Kn85Lyb3UhS1DqIYWyIbT7vSf
         X4Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=YXpzcgNJpQHDdAAXuY/oQ+b/W0CaqN4oZOi6cgulc3w=;
        b=qmoO/ChjKbzfHPiQcND32rXagLhKCdxL3ToS+/mVXKLJSgUE79EjWvp9jO8LKxf1Q9
         30xo45TtR48kQnjblxgc/0oqQTl9EW8AGRnDyzw2r8PJ2n3FYqiFsMeIomVhQvCzMQ+5
         /jLMK0gWaNRqsuWcUw8dLKwqruHuKQ5cH34EaArBxoq1bTYPpQkMAL0rgAxPq2NfgUdA
         JrAFWQgqa6SoGK6jKSruKuZd8MVn4VzRwfP8CUjbF1X+UHp3NO66VRP/k5i67SYLi4Zq
         f59V7PlFJV1xvW2GrURlle9LPI2CJIAbtlOlcFPK34BjvrMLFpXDVpafJBy1Um312KU0
         JYHA==
X-Gm-Message-State: AOAM531r+Jn0ZAvB9N2GV0iHW0aeMKTSECw3QRzuzMA26kmqmvVCRjVd
        sd7dJuTrseTigNwQSCJi0CU=
X-Google-Smtp-Source: ABdhPJxJD11XqOOGjIiTUfiFNQ5RyIt0F4HMLtsf3nUmUETo7UraoM7d4RGl+EHgGk/z8yVGSa0MWA==
X-Received: by 2002:a17:902:f54d:b029:107:b14c:423d with SMTP id h13-20020a170902f54db0290107b14c423dmr746664plf.77.1623361440568;
        Thu, 10 Jun 2021 14:44:00 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id d15sm3173040pfd.35.2021.06.10.14.43.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 14:43:59 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        "Isaac J. Manjarres" <isaacm@codeaurora.org>,
        Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        "Kristian H. Kristensen" <hoegsberg@google.com>,
        Lee Jones <lee.jones@linaro.org>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Marijn Suijten <marijn.suijten@somainline.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Will Deacon <will@kernel.org>,
        Zhenzhong Duan <zhenzhong.duan@gmail.com>
Subject: [PATCH v5 0/5] iommu/arm-smmu: adreno-smmu page fault handling
Date:   Thu, 10 Jun 2021 14:44:08 -0700
Message-Id: <20210610214431.539029-1-robdclark@gmail.com>
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

v5: [Rob] Use RBBM_STATUS3.SMMU_STALLED_ON_FAULT to detect case where
    GPU snapshotting needs to avoid crashdumper, and check the
    RBBM_STATUS3.SMMU_STALLED_ON_FAULT in GPU hang irq paths
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

Rob Clark (2):
  iommu/arm-smmu-qcom: Add stall support
  drm/msm: devcoredump iommu fault support

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       |  23 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 110 +++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  42 ++++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.c     |  15 +++
 drivers/gpu/drm/msm/msm_gem.h               |   1 +
 drivers/gpu/drm/msm/msm_gem_submit.c        |   1 +
 drivers/gpu/drm/msm/msm_gpu.c               |  48 +++++++++
 drivers/gpu/drm/msm/msm_gpu.h               |  17 +++
 drivers/gpu/drm/msm/msm_gpummu.c            |   5 +
 drivers/gpu/drm/msm/msm_iommu.c             |  22 +++-
 drivers/gpu/drm/msm/msm_mmu.h               |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c  |  50 +++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |   9 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.h       |   2 +
 include/linux/adreno-smmu-priv.h            |  38 ++++++-
 15 files changed, 367 insertions(+), 21 deletions(-)

-- 
2.31.1

