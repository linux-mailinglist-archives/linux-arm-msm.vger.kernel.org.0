Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id CA0D34AA107
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Feb 2022 21:16:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233765AbiBDUQr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 4 Feb 2022 15:16:47 -0500
Received: from foss.arm.com ([217.140.110.172]:39950 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S237040AbiBDUQr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 4 Feb 2022 15:16:47 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DB84911D4;
        Fri,  4 Feb 2022 12:16:46 -0800 (PST)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.1.196.40])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id AFA843F718;
        Fri,  4 Feb 2022 12:16:45 -0800 (PST)
From:   Robin Murphy <robin.murphy@arm.com>
To:     joro@8bytes.org, will@kernel.org
Cc:     iommu@lists.linux-foundation.org,
        linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: [PATCH] iommu/msm: Use standard driver registration
Date:   Fri,  4 Feb 2022 20:16:40 +0000
Message-Id: <05ca5e1b29bdd350f4e20b9ceb031a2c281e23d2.1644005728.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.28.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It's been a long time since there was any reason to register IOMMU
drivers early. Convert to the standard platform driver helper.

CC: Andy Gross <agross@kernel.org>
CC: Bjorn Andersson <bjorn.andersson@linaro.org>
Signed-off-by: Robin Murphy <robin.murphy@arm.com>
---
 drivers/iommu/msm_iommu.c | 14 +-------------
 1 file changed, 1 insertion(+), 13 deletions(-)

diff --git a/drivers/iommu/msm_iommu.c b/drivers/iommu/msm_iommu.c
index 3a38352b603f..06bde6b66732 100644
--- a/drivers/iommu/msm_iommu.c
+++ b/drivers/iommu/msm_iommu.c
@@ -831,16 +831,4 @@ static struct platform_driver msm_iommu_driver = {
 	.probe		= msm_iommu_probe,
 	.remove		= msm_iommu_remove,
 };
-
-static int __init msm_iommu_driver_init(void)
-{
-	int ret;
-
-	ret = platform_driver_register(&msm_iommu_driver);
-	if (ret != 0)
-		pr_err("Failed to register IOMMU driver\n");
-
-	return ret;
-}
-subsys_initcall(msm_iommu_driver_init);
-
+builtin_platform_driver(msm_iommu_driver);
-- 
2.28.0.dirty

