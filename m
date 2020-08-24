Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7D1D72507EC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Aug 2020 20:41:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725946AbgHXSlm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 Aug 2020 14:41:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45028 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgHXSlm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 Aug 2020 14:41:42 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52B3DC061573;
        Mon, 24 Aug 2020 11:41:42 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id o5so4994776pgb.2;
        Mon, 24 Aug 2020 11:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wwv5QKlsYiPcoZ9vuO+QxOYhnZeQ6Dx6D5HJLYXehes=;
        b=E0O3WnxBUF8L78zXaQX1nHHjeYMnDVtuXZ847oZjQHo9f0XLrALQtjPg7Rjpc9y5Iw
         pbkIZ4q4RgOEK77v7CajdPP+URT8FsWP5hcUXALDIcFkZ0hsI9D+8Hb2e8+dWg4Fj//U
         S7LHP8JGG71C39udDFnxxAZNzA+o4EBnd4Ol8yzlTQt9A7R9mldsjPQuPJbY15rR3Ni5
         Hb0FfBlLANPR353rWiPT04EpH0axTMftxyJdiv87UmgU1cVBat8U1n4j9Izs83AYhj/a
         HPFwwi+vwJk01Dmf5Aix2d13Mi0JziqhRPB7aSo29uhP1Qzn3/U7vnIA6sxoMMQWkfER
         p16g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Wwv5QKlsYiPcoZ9vuO+QxOYhnZeQ6Dx6D5HJLYXehes=;
        b=gDMFFBBxuAYWGdxFmTSHoTncIMdk0u5V+Z/fcuXsEY+twfCF+I2/ntyIngVY39ttU/
         zZ8veB74agq5/8GLWSaxKnZQ+dQUntqDPiBHX4qD3r5SFb75r1hgxj1AWNejyCvwtZbU
         4Df5HjptWkK2bUEsseVSrfiFlZF3SZqf17pu4xJCXy7Qbj7CsysLXi+nNZcb2iJ55Ef5
         ALgTRf7VllH8u5QN1RkwMvmCFlmMmJ6Df4xZW+bWQK/MWZ2VprjfthEPlpDn7XrS4bZi
         uy4WYU/WoPFYgrxoqIDfqeqwkzfxblHbrG+c+Se99NsHnr5gy5Lw5C8B2NtTL/h7MRk3
         m2YQ==
X-Gm-Message-State: AOAM530B5npNdV4I4UJw9wwRxZGHTLuVmlVlPWLGvEwHTQX1+6ZRJlGI
        HAgu9tgWQBphRI0a1kM6NRU=
X-Google-Smtp-Source: ABdhPJzsprqvPOwIzpdx45JzScr/fZFSXcCrXiO3cj1RrrDFYs9Qjo68cCESjsDQav2IZ7FV1xTYeQ==
X-Received: by 2002:a62:1b0e:: with SMTP id b14mr5116111pfb.281.1598294501572;
        Mon, 24 Aug 2020 11:41:41 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
        by smtp.gmail.com with ESMTPSA id y7sm3144209pgk.73.2020.08.24.11.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2020 11:41:40 -0700 (PDT)
From:   Rob Clark <robdclark@gmail.com>
To:     dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org
Cc:     Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
        Will Deacon <will@kernel.org>, freedreno@lists.freedesktop.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Vivek Gautam <vivek.gautam@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robdclark@chromium.org>,
        Akhil P Oommen <akhilpo@codeaurora.org>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Brian Masney <masneyb@onstation.org>,
        Eric Anholt <eric@anholt.net>, Joerg Roedel <jroedel@suse.de>,
        John Stultz <john.stultz@linaro.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), Emil Velikov <emil.velikov@collabora.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Hanna Hawa <hannah@marvell.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
        linux-arm-msm@vger.kernel.org (open list:ARM/QUALCOMM SUPPORT),
        linux-kernel@vger.kernel.org (open list),
        Sam Ravnborg <sam@ravnborg.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        Shawn Guo <shawn.guo@linaro.org>, Takashi Iwai <tiwai@suse.de>,
        Thierry Reding <thierry.reding@gmail.com>,
        Thierry Reding <treding@nvidia.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Wambui Karuga <wambui.karugax@gmail.com>
Subject: [PATCH 00/20] iommu/arm-smmu + drm/msm: per-process GPU pgtables
Date:   Mon, 24 Aug 2020 11:37:34 -0700
Message-Id: <20200824183825.1778810-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Rob Clark <robdclark@chromium.org>

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
  iommu/arm-smmu: Pass io-pgtable config to implementation specific
    function
  iommu/arm-smmu: Add support for split pagetables
  iommu/arm-smmu: Prepare for the adreno-smmu implementation
  iommu/arm-smmu-qcom: Add implementation for the adreno GPU SMMU
  dt-bindings: arm-smmu: Add compatible string for Adreno GPU SMMU
  drm/msm: Add a context pointer to the submitqueue
  drm/msm: Drop context arg to gpu->submit()
  drm/msm: Set the global virtual address range from the IOMMU domain
  drm/msm: Add support to create a local pagetable
  drm/msm: Add support for private address space instances
  drm/msm/a6xx: Add support for per-instance pagetables
  arm: dts: qcom: sm845: Set the compatible string for the GPU SMMU

Rob Clark (8):
  drm/msm: remove dangling submitqueue references
  iommu: add private interface for adreno-smmu
  drm/msm/gpu: add dev_to_gpu() helper
  drm/msm: set adreno_smmu as gpu's drvdata
  iommu/arm-smmu: constify some helpers
  arm: dts: qcom: sc7180: Set the compatible string for the GPU SMMU
  iommu/arm-smmu: add a way for implementations to influence SCTLR
  drm/msm: show process names in gem_describe

 .../devicetree/bindings/iommu/arm,smmu.yaml   |   9 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |   2 +-
 arch/arm64/boot/dts/qcom/sdm845-cheza.dtsi    |   9 +
 arch/arm64/boot/dts/qcom/sdm845.dtsi          |   2 +-
 drivers/gpu/drm/msm/Kconfig                   |   1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  12 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         |  68 +++++-
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
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c    | 155 ++++++++++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c         | 102 ++++-----
 drivers/iommu/arm/arm-smmu/arm-smmu.h         |  87 +++++++-
 include/linux/adreno-smmu-priv.h              |  36 +++
 29 files changed, 772 insertions(+), 135 deletions(-)
 create mode 100644 include/linux/adreno-smmu-priv.h

-- 
2.26.2

