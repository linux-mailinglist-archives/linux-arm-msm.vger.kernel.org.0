Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D2745194265
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Mar 2020 16:08:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727939AbgCZPIq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Mar 2020 11:08:46 -0400
Received: from 8bytes.org ([81.169.241.247]:55778 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727803AbgCZPIq (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Mar 2020 11:08:46 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 978072AA; Thu, 26 Mar 2020 16:08:45 +0100 (CET)
From:   Joerg Roedel <joro@8bytes.org>
To:     iommu@lists.linux-foundation.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, guohanjun@huawei.com,
        Sudeep Holla <sudeep.holla@arm.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v4 00/16] iommu: Move iommu_fwspec out of 'struct device'
Date:   Thu, 26 Mar 2020 16:08:25 +0100
Message-Id: <20200326150841.10083-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

here is the updated version of the changes to move iommu_fwspec out of
'struct device'. Previous versions of this patch-set can be found here:

	v3: https://lore.kernel.org/lkml/20200320091414.3941-1-joro@8bytes.org/

	v2: https://lore.kernel.org/lkml/20200310091229.29830-1-joro@8bytes.org/

	v1: https://lore.kernel.org/lkml/20200228150820.15340-1-joro@8bytes.org/

Changes to v2:

	- Addressed Robins review comments

	- Added Robins patch to optimize arm-smmu changes

	- Rebased to v5.6-rc7

Please review.

Thanks,

	Joerg

Joerg Roedel (15):
  iommu: Define dev_iommu_fwspec_get() for !CONFIG_IOMMU_API
  ACPI/IORT: Remove direct access of dev->iommu_fwspec
  drm/msm/mdp5: Remove direct access of dev->iommu_fwspec
  iommu/tegra-gart: Remove direct access of dev->iommu_fwspec
  iommu: Rename struct iommu_param to dev_iommu
  iommu: Move iommu_fwspec to struct dev_iommu
  iommu/arm-smmu: Fix uninitilized variable warning
  iommu: Introduce accessors for iommu private data
  iommu/arm-smmu-v3: Use accessor functions for iommu private data
  iommu/arm-smmu: Use accessor functions for iommu private data
  iommu/renesas: Use accessor functions for iommu private data
  iommu/mediatek: Use accessor functions for iommu private data
  iommu/qcom: Use accessor functions for iommu private data
  iommu/virtio: Use accessor functions for iommu private data
  iommu: Move fwspec->iommu_priv to struct dev_iommu

Robin Murphy (1):
  iommu/arm-smmu: Refactor master_cfg/fwspec usage

 drivers/acpi/arm64/iort.c                |  6 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  2 +-
 drivers/iommu/arm-smmu-v3.c              | 10 ++--
 drivers/iommu/arm-smmu.c                 | 55 +++++++++++----------
 drivers/iommu/iommu.c                    | 31 ++++++------
 drivers/iommu/ipmmu-vmsa.c               |  7 +--
 drivers/iommu/mtk_iommu.c                | 13 +++--
 drivers/iommu/mtk_iommu_v1.c             | 14 +++---
 drivers/iommu/qcom_iommu.c               | 61 ++++++++++++++----------
 drivers/iommu/tegra-gart.c               |  2 +-
 drivers/iommu/virtio-iommu.c             | 11 ++---
 include/linux/device.h                   |  9 ++--
 include/linux/iommu.h                    | 33 ++++++++++---
 13 files changed, 142 insertions(+), 112 deletions(-)

-- 
2.17.1

