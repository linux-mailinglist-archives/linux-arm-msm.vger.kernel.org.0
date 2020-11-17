Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E04082B677C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 15:34:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729680AbgKQObr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 09:31:47 -0500
Received: from z5.mailgun.us ([104.130.96.5]:39703 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729335AbgKQObr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 09:31:47 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605623506; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=zRoDPun0Hsjef4OG9w+Y5KQ464Gj4PbP2e/Lna4lmPQ=; b=DwNIO4+W9rXCheo0XA+0wa9XU71Wk6Nqs3U1WUhf9EQ2eca4YANGVOFLAEaa6SDGo2XQI144
 Y6ApU5mT+XWCJUO1pa6iVZ09MoNlt/3/HonrTKzDjAXsNQMNLJNTpO6ZBFwoUdBKVYpxMWIC
 w8u5gKswDPD1n5Am5MaYpDSkqxw=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5fb3deae07fe4e8a182418ae (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 17 Nov 2020 14:31:10
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C91AFC43465; Tue, 17 Nov 2020 14:31:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 289D5C433C6;
        Tue, 17 Nov 2020 14:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 289D5C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jordan Crouse <jcrouse@codeaurora.org>,
        Rob Clark <robdclark@gmail.com>
Cc:     Akhil P Oommen <akhilpo@codeaurora.org>,
        freedreno@lists.freedesktop.org,
        "Kristian H . Kristensen" <hoegsberg@google.com>,
        dri-devel@lists.freedesktop.org, iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCHv8 0/8] System Cache support for GPU and required SMMU support
Date:   Tue, 17 Nov 2020 20:00:39 +0530
Message-Id: <cover.1605621785.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some hardware variants contain a system cache or the last level
cache(llc). This cache is typically a large block which is shared
by multiple clients on the SOC. GPU uses the system cache to cache
both the GPU data buffers(like textures) as well the SMMU pagetables.
This helps with improved render performance as well as lower power
consumption by reducing the bus traffic to the system memory.

The system cache architecture allows the cache to be split into slices
which then be used by multiple SOC clients. This patch series is an
effort to enable and use two of those slices preallocated for the GPU,
one for the GPU data buffers and another for the GPU SMMU hardware
pagetables.

Patch 1 - Patch 6 adds system cache support in SMMU and GPU driver.
Patch 7 and 8 are minor cleanups for arm-smmu impl.

Changes in v8:
 * Introduce a generic domain attribute for pagetable config (Will)
 * Rename quirk to more generic IO_PGTABLE_QUIRK_ARM_OUTER_WBWA (Will)
 * Move non-strict mode to use new struct domain_attr_io_pgtbl_config (Will)

Changes in v7:
 * Squash Jordan's patch to support MMU500 targets
 * Rebase on top of for-joerg/arm-smmu/updates and Jordan's short series for adreno-smmu impl

Changes in v6:
 * Move table to arm-smmu-qcom (Robin)

Changes in v5:
 * Drop cleanup of blank lines since it was intentional (Robin)
 * Rebase again on top of msm-next-pgtables as it moves pretty fast

Changes in v4:
 * Drop IOMMU_SYS_CACHE prot flag
 * Rebase on top of https://gitlab.freedesktop.org/drm/msm/-/tree/msm-next-pgtables

Changes in v3:
 * Fix domain attribute setting to before iommu_attach_device()
 * Fix few code style and checkpatch warnings
 * Rebase on top of Jordan's latest split pagetables and per-instance
   pagetables support

Changes in v2:
 * Addressed review comments and rebased on top of Jordan's split
   pagetables series

Jordan Crouse (1):
  drm/msm/a6xx: Add support for using system cache on MMU500 based
    targets

Sai Prakash Ranjan (5):
  iommu/io-pgtable-arm: Add support to use system cache
  iommu/arm-smmu: Add domain attribute for pagetable configuration
  iommu/arm-smmu: Move non-strict mode to use domain_attr_io_pgtbl_cfg
  iommu: arm-smmu-impl: Use table to list QCOM implementations
  iommu: arm-smmu-impl: Add a space before open parenthesis

Sharat Masetty (2):
  drm/msm: rearrange the gpu_rmw() function
  drm/msm/a6xx: Add support for using system cache(LLC)

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 109 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   5 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    |  17 ++++
 drivers/gpu/drm/msm/msm_drv.c              |   8 ++
 drivers/gpu/drm/msm/msm_drv.h              |   1 +
 drivers/gpu/drm/msm/msm_gpu.h              |   5 +-
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  11 +--
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  21 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  30 +++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   3 +-
 drivers/iommu/io-pgtable-arm.c             |  10 +-
 include/linux/io-pgtable.h                 |   8 ++
 include/linux/iommu.h                      |   1 +
 13 files changed, 203 insertions(+), 26 deletions(-)


base-commit: a29bbb0861f487a5e144dc997a9f71a36c7a2404
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

