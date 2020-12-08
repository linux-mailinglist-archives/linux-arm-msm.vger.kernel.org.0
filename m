Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 396152D2059
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 02:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726000AbgLHBvw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 20:51:52 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9031 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725877AbgLHBvv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 20:51:51 -0500
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cqjn70kW3zhp8H;
        Tue,  8 Dec 2020 09:50:35 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 8 Dec 2020 09:50:56 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Sagar Dharia <sdharia@codeaurora.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] slimbus: qcom: fix potential NULL dereference in qcom_slim_prg_slew()
Date:   Tue, 8 Dec 2020 09:54:32 +0800
Message-ID: <1607392473-20610-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

platform_get_resource_byname() may fail and in this case a NULL
dereference will occur.

Fix it to use devm_platform_ioremap_resource_byname() instead of calling
platform_get_resource_byname() and devm_ioremap().

This is detected by Coccinelle semantic patch.

@@
expression pdev, res, n, t, e, e1, e2;
@@

res = \(platform_get_resource\|platform_get_resource_byname\)(pdev, t,
n);
+ if (!res)
+   return -EINVAL;
... when != res == NULL
e = devm_ioremap(e1, res->start, e2);

Fixes: ad7fcbc308b0 ("slimbus: qcom: Add Qualcomm Slimbus controller driver")
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/slimbus/qcom-ctrl.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/slimbus/qcom-ctrl.c b/drivers/slimbus/qcom-ctrl.c
index 4aad256..f04b961 100644
--- a/drivers/slimbus/qcom-ctrl.c
+++ b/drivers/slimbus/qcom-ctrl.c
@@ -472,15 +472,10 @@ static void qcom_slim_rxwq(struct work_struct *work)
 static void qcom_slim_prg_slew(struct platform_device *pdev,
 				struct qcom_slim_ctrl *ctrl)
 {
-	struct resource	*slew_mem;
-
 	if (!ctrl->slew_reg) {
 		/* SLEW RATE register for this SLIMbus */
-		slew_mem = platform_get_resource_byname(pdev, IORESOURCE_MEM,
-				"slew");
-		ctrl->slew_reg = devm_ioremap(&pdev->dev, slew_mem->start,
-				resource_size(slew_mem));
-		if (!ctrl->slew_reg)
+		ctrl->slew_reg = devm_platform_ioremap_resource_byname(pdev, "slew");
+		if (IS_ERR(ctrl->slew_reg))
 			return;
 	}
 
-- 
2.9.5

