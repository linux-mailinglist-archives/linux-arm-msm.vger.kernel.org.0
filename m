Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F1C5934A49E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 26 Mar 2021 10:37:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhCZJhM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 26 Mar 2021 05:37:12 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:14562 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbhCZJg6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 26 Mar 2021 05:36:58 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F6GyR61PHzPn9f;
        Fri, 26 Mar 2021 17:34:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Fri, 26 Mar 2021 17:36:49 +0800
From:   Zhiqi Song <songzhiqi1@huawei.com>
To:     <will@kernel.org>, <joro@8bytes.org>, <robin.murphy@arm.com>,
        <robdclark@gmail.com>
CC:     <iommu@lists.linux-foundation.org>,
        <linux-arm-msm@vger.kernel.org>, <wangzhou1@hisilicon.com>,
        <fanghao11@huawei.com>, <shenyang39@huawei.com>
Subject: [PATCH 2/3] drivers: iommu/amd - coding style fix
Date:   Fri, 26 Mar 2021 17:37:16 +0800
Message-ID: <1616751437-59956-3-git-send-email-songzhiqi1@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
References: <1616751437-59956-1-git-send-email-songzhiqi1@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fixed following checkpatch errors:
- code indent should use tabs where possible
- space prohibited before ','

Signed-off-by: Zhiqi Song <songzhiqi1@huawei.com>
---
 drivers/iommu/amd/init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/amd/init.c b/drivers/iommu/amd/init.c
index 6a1f704..958fa17 100644
--- a/drivers/iommu/amd/init.c
+++ b/drivers/iommu/amd/init.c
@@ -997,7 +997,7 @@ static bool copy_device_table(void)
 				return false;
 			}

-		        old_dev_tbl_cpy[devid].data[2] = old_devtb[devid].data[2];
+			old_dev_tbl_cpy[devid].data[2] = old_devtb[devid].data[2];
 		}
 	}
 	memunmap(old_devtb);
@@ -1248,7 +1248,7 @@ static int __init init_iommu_from_acpi(struct amd_iommu *iommu,

 			devid = e->devid;
 			devid_to = e->ext >> 8;
-			set_dev_entry_from_acpi(iommu, devid   , e->flags, 0);
+			set_dev_entry_from_acpi(iommu, devid, e->flags, 0);
 			set_dev_entry_from_acpi(iommu, devid_to, e->flags, 0);
 			amd_iommu_alias_table[devid] = devid_to;
 			break;
--
2.7.4

