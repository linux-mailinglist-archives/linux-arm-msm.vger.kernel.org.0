Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ADD4B39907E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jun 2021 18:49:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231441AbhFBQvK (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Jun 2021 12:51:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42550 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231327AbhFBQvI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Jun 2021 12:51:08 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FB5FC06174A;
        Wed,  2 Jun 2021 09:49:25 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id h16so1997398pjv.2;
        Wed, 02 Jun 2021 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y93PyBWiX9T4fVaYbqL1PL4Vs5/tKflWEP5FMSYoi74=;
        b=KCn3ESFyQZHxobIfkg3xhpJSrDW16XjKJ/fDxGo7guGgZUjCdanOaRHsGOtW91LUIK
         WIGz6UW/OhhNgue+Yf0Xdp1LK5EJm16MMd+yr+ZMP+PY2uAqumY+th6XSQqBfqpyUGT/
         ogb7vcJ2wOeUxau+ZAIQdPkPKjdAinIVFHvcjDzGVOnZsZsmZx7YuEr2xhV5xn3vmSv4
         vhN6XgmZR8QsIDVmbeQKpzmtbeMvXY87brGKKXx2jIYg4rYvaPtAu+MHU4PWeIMzJ6SN
         BcblGy7n0VeJ9Dgd6B8qs5zwHZxfKbsDgGsDjyFgojiwXKig/Da61u/sZW4MZy/soZPY
         CXuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=y93PyBWiX9T4fVaYbqL1PL4Vs5/tKflWEP5FMSYoi74=;
        b=B2WBPhuRp2dNmPxzrj+/0D2OcK4xAJHqwk0uTTKTAdKK5vXuf5UXMpBmT1Z2vYkbBu
         nLQtPy09QaQR/WddfNSHm+B7zgSIVwzIkl1NtOP7MEyoJ/yyBIdrr0kPzVDzGyJfsq16
         tCapsM17RzjcQcy1lGXMWQ55AEoa8zSCj0zuGkugkg4ZwbPL01qeCFeOIN8Zf7sXbvQx
         s9MqXQGBiPF9mfRum3wGmHvnBY/S8jfHXPFVeRhRpJlIsEn7bDRjgbZp0soZDXSDE3iH
         TchcuIJ28YZJgBYRiHcyKHsi/vWlQs+sWnD72LPFLlOdXsgdGiVMM1HqBD/Kgwog5TBs
         q+GA==
X-Gm-Message-State: AOAM531xC9vOM5+AYXoL/jRfS3srh+K1oyisWuzyukB/XWvFBVfkcFxc
        G0gPsWassuwsgZGxJQkpE6tpympzmegqnkQB
X-Google-Smtp-Source: ABdhPJxfv0BXHqo8MWWsEtUhi2Oy1PldNa2hrafNv/QLMkM2vfMSO20e1U11gvjznblyTVjICttw+A==
X-Received: by 2002:a17:90a:fa95:: with SMTP id cu21mr292230pjb.210.1622652564566;
        Wed, 02 Jun 2021 09:49:24 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id x193sm166388pfd.54.2021.06.02.09.49.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 09:49:23 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Douglas Anderson <dianders@chromium.org>,
        Eric Anholt <eric@anholt.net>,
        iommu@lists.linux-foundation.org (open list:IOMMU DRIVERS),
        Iskren Chernev <iskren.chernev@gmail.com>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
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
Subject: [RESEND PATCH v4 0/6] iommu/arm-smmu: adreno-smmu page fault handling
Date:   Wed,  2 Jun 2021 09:52:43 -0700
Message-Id: <20210602165313.553291-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

(Resend, first attempt seems to not have entirely shown up in patchwork
and had a random already merged patch tagging along because 00*patch
picks up things I forgot to delete)

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

