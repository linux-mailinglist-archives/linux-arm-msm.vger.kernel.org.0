Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 072EA4AA108
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 21:16:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237045AbiBDUQt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 15:16:49 -0500
Received: from foss.arm.com ([217.140.110.172]:39964 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237040AbiBDUQt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 15:16:49 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB3EA1476;
        Fri,  4 Feb 2022 12:16:48 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id BD2983F718;
        Fri,  4 Feb 2022 12:16:47 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org, will@kernel.org
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH] iommu/rockchip: : Use standard driver registration
Date:   Fri,  4 Feb 2022 20:16:41 +0000
Message-Id: <c08d58bff340da6a829e76d66d2fa090a9718384.1644005728.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
In-Reply-To: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com>
References: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's been a long time since there was any reason to register IOMMU
drivers early. Convert to the standard platform driver helper.

CC: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/rockchip-iommu.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/iommu/rockchip-iommu.c b/drivers/iommu/rockchip-iommu.c
index 7f23ad61c094..204a93a72572 100644
--- a/drivers/iommu/rockchip-iommu.c
+++ b/drivers/iommu/rockchip-iommu.c
@@ -1407,9 +1407,4 @@ static struct platform_driver rk_iommu_driver = {
 		   .suppress_bind_attrs = true,
 	},
 };
-
-static int __init rk_iommu_init(void)
-{
-	return platform_driver_register(&rk_iommu_driver);
-}
-subsys_initcall(rk_iommu_init);
+builtin_platform_driver(rk_iommu_driver);
-- 
2.28.0.dirty

