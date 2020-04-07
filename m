Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 975A31A13CA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 20:37:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726628AbgDGShw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 14:37:52 -0400
Received: from 8bytes.org ([81.169.241.247]:57308 "EHLO theia.8bytes.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726277AbgDGShv (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 14:37:51 -0400
Received: by theia.8bytes.org (Postfix, from userid 1000)
        id 49F26A5; Tue,  7 Apr 2020 20:37:48 +0200 (CEST)
From:   Joerg Roedel <joro@8bytes.org>
To:     Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Lu Baolu <baolu.lu@linux.intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc:     iommu@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [RFC PATCH 00/34] iommu: Move iommu_group setup to IOMMU core code
Date:   Tue,  7 Apr 2020 20:37:08 +0200
Message-Id: <20200407183742.4344-1-joro@8bytes.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

here is a patch-set to remove all calls of iommu_group_get_for_dev() from
the IOMMU drivers and move the per-device group setup and default domain
allocation into the IOMMU core code.

This eliminates some ugly back and forth between IOMMU core code and the
IOMMU drivers, where the driver called iommu_group_get_for_dev() which itself
called back into the driver.

The patch-set started as a "quick" Friday afternoon project to split the
IOMMU group creation and the allocation of the default domain, so that the
default domain is not allocated before all devices are added to the group.
In the end it took 1.5 weeks to get this in a reasonable shape, but now the
code (during bus probing) first adds all devices to their respective IOMMU
group before it determines the default domain type and then allocates it for
the group.

It turned out that this required to remove the calls of
iommu_group_get_for_dev() from the IOMMU drivers. While at it, the calls to
iommu_device_link()/unlink() where also moved out of the drivers, which
required a different interface than add_device()/remove_device(). The result
is the new probe_device()/release_device() interface, where the driver just
does its own setup and then returns the iommu_device which belongs to the
device being probed.

There is certainly more room for cleanups, but I think this is a good start
to simplify the code flow during IOMMU device probing.  It is also a more
robust base for the pending patch-sets which implement per-group default
domain types and the removal of the private domains from the Intel VT-d
driver.

With regards to testing, I verified this code works on three IOMMUs:

	- AMD-Vi
	- Intel VT-d (but there might be breakages on some hardware, the
	  patches to remove the private domain handling from the VT-d driver
	  should be rebased to these patches)
	- ARM-SMMU-v3 (as emulated by QEMU)

Most driver conversions to the probe_device()/release_device() interface
were trivial, but there were also some hard nuts, which I am not sure still
work. The more difficult drivers were:

	- ARM-SMMU-v2
	- OMAP
	- Renesas
	- Mediatek IOMMU v1
	- Exynos

It would be great if the changes could be tested (and possibly fixed) on
those IOMMUs, as I can't do testing on them.

The patches are based on the current iommu/next branch, I will rebase them
to v5.7-rc1 when it comes out. A branch with these patches applied can be
found here:

	https://git.kernel.org/pub/scm/linux/kernel/git/joro/linux.git/log/?h=iommu-probe-device

Please review and test these changes and let me know what breaks.

Thanks,

	Joerg

Joerg Roedel (33):
  iommu: Move default domain allocation to separate function
  iommu/amd: Implement iommu_ops->def_domain_type call-back
  iommu/vt-d: Wire up iommu_ops->def_domain_type
  iommu/amd: Remove dma_mask check from check_device()
  iommu/amd: Return -ENODEV in add_device when device is not handled by
    IOMMU
  iommu: Add probe_device() and remove_device() call-backs
  iommu: Move default domain allocation to iommu_probe_device()
  iommu: Keep a list of allocated groups in __iommu_probe_device()
  iommu: Move new probe_device path to separate function
  iommu: Split off default domain allocation from group assignment
  iommu: Move iommu_group_create_direct_mappings() out of
    iommu_group_add_device()
  iommu: Export bus_iommu_probe() and make is safe for re-probing
  iommu/amd: Remove dev_data->passthrough
  iommu/amd: Convert to probe/release_device() call-backs
  iommu/vt-d: Convert to probe/release_device() call-backs
  iommu/arm-smmu: Store device instead of group in arm_smmu_s2cr
  iommu/arm-smmu: Convert to probe/release_device() call-backs
  iommu/pamu: Convert to probe/release_device() call-backs
  iommu/s390: Convert to probe/release_device() call-backs
  iommu/virtio: Convert to probe/release_device() call-backs
  iommu/msm: Convert to probe/release_device() call-backs
  iommu/mediatek: Convert to probe/release_device() call-backs
  iommu/mediatek-v1 Convert to probe/release_device() call-backs
  iommu/qcom: Convert to probe/release_device() call-backs
  iommu/rockchip: Convert to probe/release_device() call-backs
  iommu/tegra: Convert to probe/release_device() call-backs
  iommu/renesas: Convert to probe/release_device() call-backs
  iommu/omap: Remove orphan_dev tracking
  iommu/omap: Convert to probe/release_device() call-backs
  iommu/exynos: Create iommu_device in struct exynos_iommu_owner
  iommu/exynos: Convert to probe/release_device() call-backs
  iommu: Remove add_device()/remove_device() code-paths
  iommu: Unexport iommu_group_get_for_dev()

Sai Praneeth Prakhya (1):
  iommu: Add def_domain_type() callback in iommu_ops

 drivers/iommu/amd_iommu.c       |  97 ++++----
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |  42 +---
 drivers/iommu/arm-smmu.c        |  44 ++--
 drivers/iommu/exynos-iommu.c    | 113 ++++++---
 drivers/iommu/fsl_pamu_domain.c |  22 +-
 drivers/iommu/intel-iommu.c     |  68 +-----
 drivers/iommu/iommu.c           | 391 +++++++++++++++++++++++++-------
 drivers/iommu/ipmmu-vmsa.c      |  60 ++---
 drivers/iommu/msm_iommu.c       |  34 +--
 drivers/iommu/mtk_iommu.c       |  24 +-
 drivers/iommu/mtk_iommu_v1.c    |  50 ++--
 drivers/iommu/omap-iommu.c      |  99 ++------
 drivers/iommu/qcom_iommu.c      |  24 +-
 drivers/iommu/rockchip-iommu.c  |  26 +--
 drivers/iommu/s390-iommu.c      |  22 +-
 drivers/iommu/tegra-gart.c      |  24 +-
 drivers/iommu/tegra-smmu.c      |  31 +--
 drivers/iommu/virtio-iommu.c    |  41 +---
 include/linux/iommu.h           |  21 +-
 20 files changed, 600 insertions(+), 634 deletions(-)

-- 
2.17.1

