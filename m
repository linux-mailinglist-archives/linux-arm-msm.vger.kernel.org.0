Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0211D44F35
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Jun 2019 00:39:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725809AbfFMWjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Jun 2019 18:39:22 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:38252 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726519AbfFMWjS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Jun 2019 18:39:18 -0400
Received: by mail-ed1-f68.google.com with SMTP id g13so512382edu.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Jun 2019 15:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tcd-ie.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EcPKIz/cx9BuSCY4h5Jds9dddvg3WP5b4PjiRQaCMNk=;
        b=Q7YqbkWKog9myMLVKuEgSGV/QhFlPY8pqvqD3ElQJa5O+VupGahQ/2KWdmD42UChZU
         wPmlxSspSryqNb5xCB8JLtGZX6vRCzXM8xY7AmfA6QICBXISxNprKepOzIgPRJ0PmKvq
         lwOf3L9Aeaw9au+GkaXXU5HxIJQ1vxFfownqyJtqMjhF5SRbY4FdMVVh7ZLQ7hbQYj3Q
         iidXZkXXf0qlsVYk9WxwAFcMHH4IP3leZkOYhpAmRlGBv4K+6lmx2ZeQRojQOmlcq9FK
         mitiCFQNPcpZ74hbmAblxvrrqQFu7g6p6HGZuZiNBMXyyAAw52tc7SZA4bY0a5yZBSlR
         Rxmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=EcPKIz/cx9BuSCY4h5Jds9dddvg3WP5b4PjiRQaCMNk=;
        b=MT5kUi72mKD6uucvieaHtx7zP0/frd6NNhI6bGgaCFzQYylgQTqxCikj1zWyohPMP6
         7oMHWNhzP366/CF1oXqBi8c/w+VZhYKOifbVL2vKSYvEzWm6zZCeDsqMeHA1aOn6h5xT
         c9ezEDdckN65zOJJ8KIgDy7+O7SO0gRDDzLpdr90e/k8Epj4QKsbiityWh9ciw1NSB0m
         TcpgD7EP9FbphOxyzwanvFnWiOI4/UxSdbRDAifsgczq6CJjE/w2R/mKKWHQQ3KS+W1U
         XVtP4dQTlC/dexlXpYH0Odz96LYsJso25gbmuoqF1XuxUblgUN0Kq3VjQKGspqxKesye
         0ObA==
X-Gm-Message-State: APjAAAX/HEdc1vVbMHkBWUnbC4W8Gb30XjBwEjb0/iiA1hUUATRJnswW
        C/eiXBR+nGsh6juAG6yNDZLFCA==
X-Google-Smtp-Source: APXvYqznp1hHyw5PYwIoh2oTLD6q+OMGquaY21fb63SmdivVnsFdvFIZnOzRxPqoidZqkL4RdKrnQw==
X-Received: by 2002:a50:bdc2:: with SMTP id z2mr97240407edh.245.1560465555952;
        Thu, 13 Jun 2019 15:39:15 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8084:a0:bc00:8042:d435:a754:1f22])
        by smtp.googlemail.com with ESMTPSA id s16sm216522eji.27.2019.06.13.15.39.13
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 13 Jun 2019 15:39:14 -0700 (PDT)
From:   Tom Murphy <murphyt7@tcd.ie>
To:     iommu@lists.linux-foundation.org
Cc:     Tom Murphy <murphyt7@tcd.ie>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will.deacon@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        David Woodhouse <dwmw2@infradead.org>,
        Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Rob Clark <robdclark@gmail.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Gerald Schaefer <gerald.schaefer@de.ibm.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Jean-Philippe Brucker <jean-philippe.brucker@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-s390@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        virtualization@lists.linux-foundation.org
Subject: [PATCH v4 0/5] iommu/amd: Convert the AMD iommu driver to the dma-iommu api
Date:   Thu, 13 Jun 2019 23:38:55 +0100
Message-Id: <20190613223901.9523-1-murphyt7@tcd.ie>
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
 drivers/iommu/dma-iommu.c       |  45 ++-
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
 21 files changed, 179 insertions(+), 652 deletions(-)

-- 
2.20.1

