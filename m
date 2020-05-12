Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F7BA1CEA8F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 May 2020 04:11:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728564AbgELCLX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 11 May 2020 22:11:23 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:4393 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727892AbgELCLX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 11 May 2020 22:11:23 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 90833A0F04202A38486F;
        Tue, 12 May 2020 10:11:21 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Tue, 12 May 2020 10:11:12 +0800
From:   Samuel Zou <zou_wei@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <joro@8bytes.org>
CC:     <linux-arm-msm@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>, <linux-kernel@vger.kernel.org>,
        Samuel Zou <zou_wei@huawei.com>
Subject: [PATCH -next] iommu/msm: Make msm_iommu_lock static
Date:   Tue, 12 May 2020 10:17:19 +0800
Message-ID: <1589249839-105820-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Fix the following sparse warning:

drivers/iommu/msm_iommu.c:37:1: warning: symbol 'msm_iommu_lock' was not declared.

The msm_iommu_lock has only call site within msm_iommu.c
It should be static

Fixes: 0720d1f052dc ("msm: Add MSM IOMMU support")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Samuel Zou <zou_wei@huawei.com>
---
 drivers/iommu/msm_iommu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 10cd4db..3d8a635 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -34,7 +34,7 @@ __asm__ __volatile__ (							\
 /* bitmap of the page sizes currently supported */
 #define MSM_IOMMU_PGSIZES	(SZ_4K | SZ_64K | SZ_1M | SZ_16M)
 
-DEFINE_SPINLOCK(msm_iommu_lock);
+static DEFINE_SPINLOCK(msm_iommu_lock);
 static LIST_HEAD(qcom_iommu_devices);
 static struct iommu_ops msm_iommu_ops;
 
-- 
2.6.2

