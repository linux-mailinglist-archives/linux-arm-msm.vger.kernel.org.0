Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C0B3125E9E4
	for <lists+linux-arm-msm@lfdr.de>; Sat,  5 Sep 2020 22:04:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728426AbgIEUD6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 5 Sep 2020 16:03:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728400AbgIEUD5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 5 Sep 2020 16:03:57 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB45CC061244;
        Sat,  5 Sep 2020 13:03:56 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id y6so2663326plk.10;
        Sat, 05 Sep 2020 13:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Stm2E5j9FGckZyhx7UBgK2IMpWRhScbRqwirLgXtiqY=;
        b=I1w8d6TiFVX7iqV22WSarlOJtz5Y0tvEVb7PMkXzrgvkeXZN6CaDdAYR7xtirrLVLD
         wyEjLEQNtc59PKyJ18L7FC60QXCsXTkmFKgAGj2YznRa29Ow/3NCqM7oo7DgIaiIwfaF
         qrYuIL89eLn+PwleS2FR4dAUZmwg06ewtfSpBYAG4Mu/VcOToKeViB4g/6jDJvGoLP5V
         Vxcgh/TzHdZlIHbMXqETrVEbRc1X140s6LPCOCi9NU9Oqv3U7DiO6k0ooWNAacB3Gpd6
         Fz3PEg+LO5wCwGav9f6tZjjznrxXExzYz79MqtFbAhM5C/tj6+9Yy5doVHV+WSvWxifs
         AYqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Stm2E5j9FGckZyhx7UBgK2IMpWRhScbRqwirLgXtiqY=;
        b=sUVcYlJJJz0VnOglB49xP5KR/MVJYLuxfUw3JbOKcWJQrgPRLxr7v+SFUEAgUIH0Ue
         JL7m3HpoNu8o5bL7wpjZ23GkYnud00l+kPDjXMm3zYz+QJsElGBZ3VyIVjUVotcqPD/y
         /1xcU7jp+AupTIPbxFbS/Gnf72zomVUDeDMdFvi2/N/L35a1GfRUtddnx15hUcRl+4vH
         xVRTpHRl+KMxukYdh7QcP6RzHmIJHEHEMJFMvA9YOhNLlr1MZXmxKeEsFRm3VVGuoB2t
         voXKu2ygw2SGQzb2iDvUSFQJEGWAoebsJkvGmg7Q/il+Rsky8Ymo0mJsTgaCQdnA+Pbh
         KHaw==
X-Gm-Message-State: AOAM533sZXOcLT9JdrujZBXQnaCTiEX16hIB3s3ndFTYmJaOKb4CPoJv
        BPYk7ntUH00dY09tjCDmtio=
X-Google-Smtp-Source: ABdhPJxCHojCMfrATlogacEUYwgAVTl2ge8pSgsGa8eymu1VZQOzWth3Kujnc0hqajuGcfy+5yGz+Q==
X-Received: by 2002:a17:90a:a601:: with SMTP id c1mr13169383pjq.130.1599336235810;
        Sat, 05 Sep 2020 13:03:55 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
        by smtp.gmail.com with ESMTPSA id m7sm10560083pfm.31.2020.09.05.13.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2020 13:03:54 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     iommu@lists.linux-foundation.org, dri-devel@lists.freedesktop.org,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>
Cc:     linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        Rob Clark <robdclark@chromium.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Douglas Anderson <dianders@chromium.org>,
        Emil Velikov <emil.velikov@collabora.com>,
        Eric Anholt <eric@anholt.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Joerg Roedel <jroedel@suse.de>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-kernel@vger.kernel.org (open list),
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH v17 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Date:   Sat,  5 Sep 2020 13:04:06 -0700
Message-Id: <20200905200454.240929-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

NOTE: I have re-ordered the series, and propose that we could merge this
      series in the following order:

       1) 01-11 - merge via drm / msm-next
       2) 12-15 - merge via iommu, no dependency on msm-next pull req
       3) 16-18 - patch 16 has a dependency on 02 and 04, so it would
                  need to come post -rc1 or on following cycle, but I
                  think it would be unlikely to conflict with other
                  arm-smmu patches (other than Bjorn's smmu handover
                  series?)
       4) 19-20 - dt bits should be safe to land in any order without
                  breaking anything

----

This series adds an Adreno SMMU implementation to arm-smmu to allow GPU hardware
pagetable switching.

The Adreno GPU has built in capabilities to switch the TTBR0 pagetable during
runtime to allow each individual instance or application to have its own
pagetable.  In order to take advantage of the HW capabilities there are certain
requirements needed of the SMMU hardware.

This series adds support for an Adreno specific arm-smmu implementation. The new
implementation 1) ensures that the GPU domain is always assigned context bank 0,
2) enables split pagetable support (TTBR1) so that the instance specific
pagetable can be swapped while the global memory remains in place and 3) shares
the current pagetable configuration with the GPU driver to allow it to create
its own io-pgtable instances.

The series then adds the drm/msm code to enable these features. For targets that
support it allocate new pagetables using the io-pgtable configuration shared by
the arm-smmu driver and swap them in during runtime.

This version of the series merges the previous patchset(s) [1] and [2]
with the following improvements:

v17: (Respin by Rob)
  - Squash cleanup from Bjorn into 14/20
  - Small fix in 10/20 for issue found in testing
v16: (Respin by Rob)
  - Fix indentation
  - Re-order series to split drm and iommu parts
v15: (Respin by Rob)
  - Adjust dt bindings to keep SoC specific compatible (Doug)
  - Add dts workaround for cheza fw limitation
  - Add missing 'select IOMMU_IO_PGTABLE' (Guenter)
v14: (Respin by Rob)
  - Minor update to 16/20 (only force ASID to zero in one place)
  - Addition of sc7180 dtsi patch.
v13: (Respin by Rob)
  - Switch to a private interface between adreno-smmu and GPU driver,
    dropping the custom domain attr (Will Deacon)
  - Rework the SCTLR.HUPCF patch to add new fields in smmu_domain->cfg
    rather than adding new impl hook (Will Deacon)
  - Drop for_each_cfg_sme() in favor of plain for() loop (Will Deacon)
  - Fix context refcnt'ing issue which was causing problems with GPU
    crash recover stress testing.
  - Spiff up $debugfs/gem to show process information associated with
    VMAs
v12:
  - Nitpick cleanups in gpu/drm/msm/msm_iommu.c (Rob Clark)
  - Reorg in gpu/drm/msm/msm_gpu.c (Rob Clark)
  - Use the default asid for the context bank so that iommu_tlb_flush_all works
  - Flush the UCHE after a page switch
  - Add the SCTLR.HUPCF patch at the end of the series
v11:
  - Add implementation specific get_attr/set_attr functions (per Rob Clark)
  - Fix context bank allocation (per Bjorn Andersson)
v10:
  - arm-smmu: add implementation hook to allocate context banks
  - arm-smmu: Match the GPU domain by stream ID instead of compatible string
  - arm-smmu: Make DOMAIN_ATTR_PGTABLE_CFG bi-directional. The leaf driver
    queries the configuration to create a pagetable and then sends the newly
    created configuration back to the smmu-driver to enable TTBR0
  - drm/msm: Add context reference counting for submissions
  - drm/msm: Use dummy functions to skip TLB operations on per-instance
    pagetables

[1] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045653.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2020-June/045659.html

Jordan Crouse (12):
  drm/msm: Add a context pointer to the submitqueue
  drm/msm: Drop context arg to gpu->submit()
  drm/msm: Set the global virtual address range from the IOMMU domain
  drm/msm: Add support to create a local pagetable
  drm/msm: Add support for private address space instances
  drm/msm/a6xx: Add support for per-instance pagetables
  iommu/arm-smmu: Pass io-pgtable config to implementation specific
    function
  iommu/arm-smmu: Add support for split pagetables
  iommu/arm-smmu: Prepare for the adreno-smmu implementation
  iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Rob Clark (8):
  drm/msm: Remove dangling submitqueue references
  drm/msm: Add private interface for adreno-smmu
  drm/msm/gpu: Add dev_to_gpu() helper
  drm/msm: Set adreno_smmu as gpu's drvdata
  drm/msm: Show process names in gem_describe
  iommu/arm-smmu: Constify some helpers
  iommu/arm-smmu: Add a way for implementations to influence SCTLR
  arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   9 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   9 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  67 +++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h         |   1 +
 drivers/gpu/drm/msm/adreno/adreno_device.c    |  12 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  18 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       |   3 +-
 drivers/gpu/drm/msm/msm_drv.c                 |  16 +-
 drivers/gpu/drm/msm/msm_drv.h                 |  25 +++
 drivers/gpu/drm/msm/msm_gem.c                 |  25 ++-
 drivers/gpu/drm/msm/msm_gem.h                 |   6 +
 drivers/gpu/drm/msm/msm_gem_submit.c          |   8 +-
 drivers/gpu/drm/msm/msm_gem_vma.c             |  10 +
 drivers/gpu/drm/msm/msm_gpu.c                 |  41 +++-
 drivers/gpu/drm/msm/msm_gpu.h                 |  21 +-
 drivers/gpu/drm/msm/msm_gpummu.c              |   2 +-
 drivers/gpu/drm/msm/msm_iommu.c               | 206 +++++++++++++++++-
 drivers/gpu/drm/msm/msm_mmu.h                 |  16 +-
 drivers/gpu/drm/msm/msm_ringbuffer.h          |   1 +
 drivers/gpu/drm/msm/msm_submitqueue.c         |   7 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c    |   6 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 157 ++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 105 ++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |  88 +++++++-
 include/linux/adreno-smmu-priv.h              |  36 +++
 29 files changed, 777 insertions(+), 135 deletions(-)
 create mode 100644 include/linux/adreno-smmu-priv.h

-- 
2.26.2

