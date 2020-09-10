Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB86E264581
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Sep 2020 13:51:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730335AbgIJLvl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 10 Sep 2020 07:51:41 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:11766 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727787AbgIJLvW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 10 Sep 2020 07:51:22 -0400
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id A926BB0100AB96D96DFD;
        Thu, 10 Sep 2020 19:32:01 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 10 Sep 2020 19:31:53 +0800
From:   Jing Xiangfeng <jingxiangfeng@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>,
        <tdas@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <jingxiangfeng@huawei.com>
Subject: [PATCH v2] clk: qcom: lpass: Correct goto target in lpass_core_sc7180_probe()
Date:   Thu, 10 Sep 2020 19:32:43 +0800
Message-ID: <20200910113243.46036-1-jingxiangfeng@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

lpass_core_sc7180_probe() misses to call pm_clk_destroy() and
pm_runtime_disable() in error paths. Correct goto target to fix it.
This issue is found by code inspection.

Fixes: edab812d802d ("clk: qcom: lpass: Add support for LPASS clock controller for SC7180")
Signed-off-by: Jing Xiangfeng <jingxiangfeng@huawei.com>
---
 drivers/clk/qcom/lpasscorecc-sc7180.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
index d4c1864e1ee9..228d08f5d26f 100644
--- a/drivers/clk/qcom/lpasscorecc-sc7180.c
+++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
@@ -420,17 +420,18 @@ static int lpass_core_sc7180_probe(struct platform_device *pdev)
 	pm_runtime_enable(&pdev->dev);
 	ret = pm_clk_create(&pdev->dev);
 	if (ret)
-		return ret;
+		goto disable_pm_runtime;
 
 	ret = pm_clk_add(&pdev->dev, "iface");
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to acquire iface clock\n");
-		goto disable_pm_runtime;
+		goto destroy_pm_clk;
 	}
 
+	ret = -EINVAL;
 	clk_probe = of_device_get_match_data(&pdev->dev);
 	if (!clk_probe)
-		return -EINVAL;
+		goto destroy_pm_clk;
 
 	ret = clk_probe(pdev);
 	if (ret)
-- 
2.26.0.106.g9fadedd

