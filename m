Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C6A128E9A6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Aug 2019 13:10:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730930AbfHOLKO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Aug 2019 07:10:14 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:34304 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730856AbfHOLKO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Aug 2019 07:10:14 -0400
Received: by mail-pg1-f193.google.com with SMTP id n9so1182964pgc.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 15 Aug 2019 04:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pnCulqyNhSM91IKVD9IZn1zR67Z7c5BvAhoQmog/5ec=;
        b=Q/yj0wdq+WilKs254iWd4ctGJJZQhMbIdIQejnyJ2yIZ2I3/VGazT/h5zdi6LD7eY8
         FwgETf3lOfMHLLcqgq8CX6eWsXdSOnzVllHOw4eeaE0NXqiFmk8nmB4m4ILkf0DWUhGl
         JMQh6MEqYX1Y/aId7O5b7KB1SCsX5COS7TIXwL/OLfWSbuLKcOFMiSy2pNH9NkkEkNBr
         vOPWQr2P1jdI57kcED+j4RTWUTiYLR6O+vQhsK1J9F6eA8G9tukV7lXi54eGF07uXuiI
         Xknh1VVTk7+o3JYaC+ItCXjA2eeC6ftIDB3zEkigJNAaCQqM79VsPpgrbJeTAytQ3YC4
         1SFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=pnCulqyNhSM91IKVD9IZn1zR67Z7c5BvAhoQmog/5ec=;
        b=VdrCmAzesYexGkd1iL57I7BN7AxCU5QnMB7JlLGPsdWRteH1uNozLwTFp+QqKEaV6q
         mEbPRlDi//yp6QWBkOa9g+4uLKUwYqpEHB/VbZgX9KOmk1wThXGFQHcNnbdQfX9/Z2vf
         k+hyGkfnuq3y+NSX3OuhWwcBcrPiuOZhRlPsk5pihmKY4SbXJaQybcO9hAAt87Agtmo0
         ROqzGMYd6TUKXlVoUmUsEHDBTIbd2dpDEI6DVCnNE6e5/pR2vShlqRZPMSU8odf+8OpQ
         6Z+hpqQtwC+Wbz9/ZavcozwBrIcaJYp+Kex/Uu3avCPdkti4FjBkBmh6q0MtY/gH4Fnr
         dMEQ==
X-Gm-Message-State: APjAAAXh2IJyo83jI7PjZvpElB0HV1qUh5JRaRu2IMHDernJKU4PUqGo
        ZvUUT5x8EGoWlrapyaUP7aWk1A==
X-Google-Smtp-Source: APXvYqxZ8fgFC+B1aOZDDqSuQf6BabOCz/a02ujOJQDOq0sxZQrHZCdzZZ4gWxdnMFReUWQ6Q4YS3Q==
X-Received: by 2002:a65:6458:: with SMTP id s24mr3060394pgv.158.1565867413007;
        Thu, 15 Aug 2019 04:10:13 -0700 (PDT)
Received: from localhost.localdomain ([2404:e801:200e:19c4:6c3f:b548:3a9c:7867])
        by smtp.googlemail.com with ESMTPSA id z13sm1042678pjn.32.2019.08.15.04.10.06
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 15 Aug 2019 04:10:12 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH V5 0/5] iommu/amd: Convert the AMD iommu driver to the dma-iommu api
Date:   Thu, 15 Aug 2019 12:09:38 +0100
Message-Id: <20190815110944.3579-1-murphyt7@tcd.ie>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the AMD iommu driver to the dma-iommu api. Remove the iova
handling and reserve region code from the AMD iommu driver.

Change-log:
V5:
-Rebase on top of linux-next
V4:
-Rebase on top of linux-next
-Split the removing of the unnecessary locking in the amd iommu driver into a seperate patch
-refactor the "iommu/dma-iommu: Handle deferred devices" patch and address comments
v3:
-rename dma_limit to dma_mask
-exit handle_deferred_device early if (!is_kdump_kernel())
-remove pointless calls to handle_deferred_device
v2:
-Rebase on top of this series:
 http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma-iommu-ops.3
-Add a gfp_t parameter to the iommu_ops::map function.
-Made use of the reserve region code inside the dma-iommu api

Tom Murphy (5):
  iommu/amd: Remove unnecessary locking from AMD iommu driver
  iommu: Add gfp parameter to iommu_ops::map
  iommu/dma-iommu: Handle deferred devices
  iommu/dma-iommu: Use the dev->coherent_dma_mask
  iommu/amd: Convert AMD iommu driver to the dma-iommu api

 drivers/iommu/Kconfig           |   1 +
 drivers/iommu/amd_iommu.c       | 690 ++++----------------------------
 drivers/iommu/amd_iommu_types.h |   1 -
 drivers/iommu/arm-smmu-v3.c     |   2 +-
 drivers/iommu/arm-smmu.c        |   2 +-
 drivers/iommu/dma-iommu.c       |  43 +-
 drivers/iommu/exynos-iommu.c    |   2 +-
 drivers/iommu/intel-iommu.c     |   2 +-
 drivers/iommu/iommu.c           |  43 +-
 drivers/iommu/ipmmu-vmsa.c      |   2 +-
 drivers/iommu/msm_iommu.c       |   2 +-
 drivers/iommu/mtk_iommu.c       |   2 +-
 drivers/iommu/mtk_iommu_v1.c    |   2 +-
 drivers/iommu/omap-iommu.c      |   2 +-
 drivers/iommu/qcom_iommu.c      |   2 +-
 drivers/iommu/rockchip-iommu.c  |   2 +-
 drivers/iommu/s390-iommu.c      |   2 +-
 drivers/iommu/tegra-gart.c      |   2 +-
 drivers/iommu/tegra-smmu.c      |   2 +-
 drivers/iommu/virtio-iommu.c    |   2 +-
 include/linux/iommu.h           |  21 +-
 21 files changed, 178 insertions(+), 651 deletions(-)

-- 
2.20.1

