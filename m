Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D80C107B53
	for <lists+linux-arm-msm@lfdr.de>; Sat, 23 Nov 2019 00:31:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726736AbfKVXbv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 22 Nov 2019 18:31:51 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:51044
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726089AbfKVXbv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 22 Nov 2019 18:31:51 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1574465510;
        h=From:To:Cc:Subject:Date:Message-Id;
        bh=6W+Hea0Amd6/uilOnF5QbG8DckcKj2ySVsuPY5EsZLg=;
        b=OKx5N9/d2RzM3IN02Qdhz0lNc0yptuq8m4q2qV1fFBRfzpYL6PeoBJ1t7yoCif+P
        PrMBY5m12Lds/1dyxc0ZSbuf7yHaURm1vq2IKL9jBYGTga2DbbWS7W6jqSyUtC7Oh+f
        4a01e1pulUt/AtkMIIGQ7ur29XThp1o2aXhy0kcs=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1574465510;
        h=From:To:Cc:Subject:Date:Message-Id:Feedback-ID;
        bh=6W+Hea0Amd6/uilOnF5QbG8DckcKj2ySVsuPY5EsZLg=;
        b=HUhLp5P1+oVejmnlVwOq/vQ63sNB9Id+4g6pPe6OqpsZM9iclRFq5i6b++tNoWql
        cmSgMe68mDNEu/n87snWQd0qIRSj6yjzn5k1RMWz5dWmrX+khow1BTBecAXDTkvM/gJ
        a2BvGJZEOtTY++qXO0cTecLH7wl58sKx6vrQ8eEQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 79D8FC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     iommu@lists.linux-foundation.org
Cc:     robin.murphy@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Sean Paul <sean@poorly.run>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sharat Masetty <smasetty@codeaurora.org>,
        dri-devel@lists.freedesktop.org, Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Joerg Roedel <joro@8bytes.org>,
        Ben Dooks <ben.dooks@codethink.co.uk>,
        Allison Randal <allison@lohutok.net>,
        AngeloGioacchino Del Regno <kholk11@gmail.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Clark <robdclark@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jeffrey Hugo <jeffrey.l.hugo@gmail.com>,
        devicetree@vger.kernel.org, Wen Yang <wen.yang99@zte.com.cn>,
        Alexios Zavras <alexios.zavras@intel.com>,
        Jeykumar Sankaran <jsanka@codeaurora.org>,
        Bruce Wang <bzwang@chromium.org>, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Brian Masney <masneyb@onstation.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Drew Davenport <ddavenport@chromium.org>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>,
        freedreno@lists.freedesktop.org,
        Mamta Shukla <mamtashukla555@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 0/8] iommu/arm-smmu: Split pagetable support for Adreno GPUs
Date:   Fri, 22 Nov 2019 23:31:50 +0000
Message-ID: <0101016e95751a9a-9eb77449-4f72-4aac-a9df-c1a28ac67132-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
X-SES-Outgoing: 2019.11.22-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Another refresh to support split pagetables for Adreno GPUs as part of an
incremental process to enable per-context pagetables.

In order to support per-context pagetables the GPU needs to enable split tables
so that we can store global buffers in the TTBR1 space leaving the GPU free to
program the TTBR0 register with the address of a context specific pagetable.

This patchset adds split pagetable support for devices identified with the
compatible string qcom,adreno-smmu-v2. If the compatible string is enabled and
DOMAIN_ATTR_SPLIT_TABLES is non zero at attach time, the implementation will
set up the TTBR0 and TTBR1 spaces with identical configurations and program
the domain pagetable into the TTBR1 register. The TTBR0 register will be
unused.

The driver can determine if split pagetables were programmed by querying
DOMAIN_ATTR_SPLIT_TABLES after attaching. The domain geometry will also be
updated to reflect the virtual address space for the TTBR1 range.

These patches are on based on top of linux-next-20191120 with [1], [2], and [3]
from Robin on the iommu list.

The first four patches add the device tree bindings and implementation
specific support for arm-smmu and the rest of the patches add the drm/msm
implementation followed by the device tree update for sdm845.

[1] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039718.html
[2] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039719.html
[3] https://lists.linuxfoundation.org/pipermail/iommu/2019-October/039720.html


Jordan Crouse (8):
  dt-bindings: arm-smmu: Add Adreno GPU variant
  iommu: Add DOMAIN_ATTR_SPLIT_TABLES
  iommu/arm-smmu: Pass io_pgtable_cfg to impl specific init_context
  iommu/arm-smmu: Add split pagetables for Adreno IOMMU implementations
  drm/msm: Attach the IOMMU device during initialization
  drm/msm: Refactor address space initialization
  drm/msm/a6xx: Support split pagetables
  arm64: dts: qcom: sdm845:  Update Adreno GPU SMMU compatible string

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  6 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  2 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              | 16 ++++
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |  1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 45 ++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.c            | 23 ++++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  8 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 18 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           | 18 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |  4 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           | 18 ++--
 drivers/gpu/drm/msm/msm_drv.h                      |  8 +-
 drivers/gpu/drm/msm/msm_gem_vma.c                  | 37 ++-------
 drivers/gpu/drm/msm/msm_gpu.c                      | 49 +----------
 drivers/gpu/drm/msm/msm_gpu.h                      |  4 +-
 drivers/gpu/drm/msm/msm_gpummu.c                   |  6 --
 drivers/gpu/drm/msm/msm_iommu.c                    | 18 ++--
 drivers/gpu/drm/msm/msm_mmu.h                      |  1 -
 drivers/iommu/arm-smmu-impl.c                      |  6 +-
 drivers/iommu/arm-smmu-qcom.c                      | 96 ++++++++++++++++++++++
 drivers/iommu/arm-smmu.c                           | 52 +++++++++---
 drivers/iommu/arm-smmu.h                           | 14 +++-
 include/linux/iommu.h                              |  1 +
 25 files changed, 295 insertions(+), 158 deletions(-)

-- 
2.7.4

