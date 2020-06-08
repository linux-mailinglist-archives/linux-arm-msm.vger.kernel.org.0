Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C390C1F11CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Jun 2020 05:39:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728782AbgFHDjI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 7 Jun 2020 23:39:08 -0400
Received: from out30-130.freemail.mail.aliyun.com ([115.124.30.130]:58664 "EHLO
        out30-130.freemail.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728773AbgFHDjI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 7 Jun 2020 23:39:08 -0400
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R211e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e07484;MF=baolin.wang@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0U-sW8OL_1591587543;
Received: from localhost(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0U-sW8OL_1591587543)
          by smtp.aliyun-inc.com(127.0.0.1);
          Mon, 08 Jun 2020 11:39:03 +0800
From:   Baolin Wang <baolin.wang@linux.alibaba.com>
To:     joro@8bytes.org, will@kernel.org, robin.murphy@arm.com,
        agross@kernel.org, bjorn.andersson@linaro.org,
        matthias.bgg@gmail.com, robdclark@gmail.com, robh@kernel.org,
        tomeu.vizoso@collabora.com, steven.price@arm.com,
        alyssa.rosenzweig@collabora.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     baolin.wang@linux.alibaba.com,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, linux-arm-msm@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] Some improvements for iommu
Date:   Mon,  8 Jun 2020 11:38:39 +0800
Message-Id: <cover.1591587029.git.baolin.wang@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

The first patch masks some functions as static, and the second patch
changes to use the gfp parameter from iommu_ops->map() to allocate
ARM page pages. Any comments are welcome. Thanks.

Baolin Wang (2):
  iommu: Mark __iommu_map/__iommu_map_sg as static
  iommu: Add gfp parameter to io_pgtable_ops->map()

 drivers/gpu/drm/panfrost/panfrost_mmu.c |  2 +-
 drivers/iommu/arm-smmu-v3.c             |  2 +-
 drivers/iommu/arm-smmu.c                |  2 +-
 drivers/iommu/io-pgtable-arm-v7s.c      | 10 +++++-----
 drivers/iommu/io-pgtable-arm.c          | 10 +++++-----
 drivers/iommu/iommu.c                   | 10 +++++-----
 drivers/iommu/ipmmu-vmsa.c              |  2 +-
 drivers/iommu/msm_iommu.c               |  2 +-
 drivers/iommu/mtk_iommu.c               |  2 +-
 drivers/iommu/qcom_iommu.c              |  2 +-
 include/linux/io-pgtable.h              |  2 +-
 11 files changed, 23 insertions(+), 23 deletions(-)

-- 
1.8.3.1

