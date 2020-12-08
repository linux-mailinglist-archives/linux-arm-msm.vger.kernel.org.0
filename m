Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 53A982D2057
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Dec 2020 02:52:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727293AbgLHBvg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 7 Dec 2020 20:51:36 -0500
Received: from szxga05-in.huawei.com ([45.249.212.191]:9552 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726396AbgLHBvg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 7 Dec 2020 20:51:36 -0500
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Cqjmj46mKzM1nT;
        Tue,  8 Dec 2020 09:50:13 +0800 (CST)
Received: from compute.localdomain (10.175.112.70) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Tue, 8 Dec 2020 09:50:43 +0800
From:   Zhang Changzhong <zhangchangzhong@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Sibi Sankar <sibis@codeaurora.org>,
        Rohit kumar <rohitkr@codeaurora.org>
CC:     Zhang Changzhong <zhangchangzhong@huawei.com>,
        <linux-arm-msm@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] remoteproc: qcom: Fix potential NULL dereference in adsp_init_mmio()
Date:   Tue, 8 Dec 2020 09:54:20 +0800
Message-ID: <1607392460-20516-1-git-send-email-zhangchangzhong@huawei.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.112.70]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

platform_get_resource() may fail and in this case a NULL dereference
will occur.

Fix it to use devm_platform_ioremap_resource() instead of calling
platform_get_resource() and devm_ioremap().

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

Fixes: dc160e449122 ("remoteproc: qcom: Introduce Non-PAS ADSP PIL driver")
Signed-off-by: Zhang Changzhong <zhangchangzhong@huawei.com>
---
 drivers/remoteproc/qcom_q6v5_adsp.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_adsp.c b/drivers/remoteproc/qcom_q6v5_adsp.c
index efb2c1a..8674b73 100644
--- a/drivers/remoteproc/qcom_q6v5_adsp.c
+++ b/drivers/remoteproc/qcom_q6v5_adsp.c
@@ -362,15 +362,12 @@ static int adsp_init_mmio(struct qcom_adsp *adsp,
 				struct platform_device *pdev)
 {
 	struct device_node *syscon;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	adsp->qdsp6ss_base = devm_ioremap(&pdev->dev, res->start,
-			resource_size(res));
-	if (!adsp->qdsp6ss_base) {
+	adsp->qdsp6ss_base = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(adsp->qdsp6ss_base)) {
 		dev_err(adsp->dev, "failed to map QDSP6SS registers\n");
-		return -ENOMEM;
+		return PTR_ERR(adsp->qdsp6ss_base);
 	}
 
 	syscon = of_parse_phandle(pdev->dev.of_node, "qcom,halt-regs", 0);
-- 
2.9.5

