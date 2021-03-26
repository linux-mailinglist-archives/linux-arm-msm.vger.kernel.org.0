Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEAB634A4A0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 10:37:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhCZJhR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 05:37:17 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14560 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230046AbhCZJhA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 05:37:00 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR5bPKzPn9b;
        Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:48 +0800
From:   Zhiqi Song <songzhiqi1@huawei.com>
To:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>, <wangzhou1@hisilicon.com>,
        <fanghao11@huawei.com>, <shenyang39@huawei.com>
Subject: [PATCH 0/3] drivers: iommu coding style fix
Date:   Fri, 26 Mar 2021 17:37:14 +0800
Message-ID: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the checkpatch errors in iommu module.

Zhiqi Song (3):
  drivers:iommu - coding style fix
  drivers:iommu/amd - coding style fix
  drivers:iommu/arm - coding style fix

 drivers/iommu/amd/init.c                    |  4 ++--
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c |  2 +-
 drivers/iommu/arm/arm-smmu/arm-smmu.c       |  6 +++---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c     |  4 ++--
 drivers/iommu/io-pgtable-arm.c              | 16 ++++++++--------
 5 files changed, 16 insertions(+), 16 deletions(-)

--
2.7.4

