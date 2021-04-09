Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED18359199
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 03:44:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233192AbhDIBor (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Apr 2021 21:44:47 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:16102 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232996AbhDIBop (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Apr 2021 21:44:45 -0400
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGgqH5VcKz19KmH;
        Fri,  9 Apr 2021 09:42:19 +0800 (CST)
Received: from huawei.com (10.175.124.27) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 09:44:28 +0800
From:   Jia Yang <jiayang5@huawei.com>
To:     <adrian.hunter@intel.com>, <agross@kernel.org>,
        <bjorn.andersson@linaro.org>, <ulf.hansson@linaro.org>
CC:     <linux-mmc@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH -next] mmc: sdhci-msm: Remove unnecessary error log
Date:   Fri, 9 Apr 2021 09:54:24 +0800
Message-ID: <20210409015424.3277212-1-jiayang5@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.124.27]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

devm_ioremap_resource() has recorded error log, so it's
unnecessary to record log again.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Jia Yang <jiayang5@huawei.com>
---
 drivers/mmc/host/sdhci-msm.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mmc/host/sdhci-msm.c b/drivers/mmc/host/sdhci-msm.c
index d170c919e6e4..e44b7a66b73c 100644
--- a/drivers/mmc/host/sdhci-msm.c
+++ b/drivers/mmc/host/sdhci-msm.c
@@ -1863,7 +1863,6 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	struct mmc_host *mmc = msm_host->mmc;
 	struct device *dev = mmc_dev(mmc);
 	struct resource *res;
-	int err;
 
 	if (!(cqhci_readl(cq_host, CQHCI_CAP) & CQHCI_CAP_CS))
 		return 0;
@@ -1881,11 +1880,8 @@ static int sdhci_msm_ice_init(struct sdhci_msm_host *msm_host,
 	}
 
 	msm_host->ice_mem = devm_ioremap_resource(dev, res);
-	if (IS_ERR(msm_host->ice_mem)) {
-		err = PTR_ERR(msm_host->ice_mem);
-		dev_err(dev, "Failed to map ICE registers; err=%d\n", err);
-		return err;
-	}
+	if (IS_ERR(msm_host->ice_mem))
+		return PTR_ERR(msm_host->ice_mem);
 
 	if (!sdhci_msm_ice_supported(msm_host))
 		goto disable;
-- 
2.25.1

