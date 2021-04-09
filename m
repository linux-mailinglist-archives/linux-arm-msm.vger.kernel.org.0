Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C74753597BC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Apr 2021 10:24:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232670AbhDIIYP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 04:24:15 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15647 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232046AbhDIIYD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 04:24:03 -0400
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FGrgK25dJzpWh2;
        Fri,  9 Apr 2021 16:21:01 +0800 (CST)
Received: from huawei.com (10.67.174.37) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Fri, 9 Apr 2021
 16:23:47 +0800
From:   Chen Hui <clare.chenhui@huawei.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mturquette@baylibre.com>, <sboyd@kernel.org>, <mani@kernel.org>,
        <georgi.djakov@linaro.org>, <sivaprak@codeaurora.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 -next 1/3] clk: qcom: a7-pll: Add missing MODULE_DEVICE_TABLE
Date:   Fri, 9 Apr 2021 16:23:50 +0800
Message-ID: <20210409082352.233810-2-clare.chenhui@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210409082352.233810-1-clare.chenhui@huawei.com>
References: <20210409082352.233810-1-clare.chenhui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.67.174.37]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CONFIG_QCOM_A7PLL is tristate option and therefore this driver can be
compiled as a module. This patch adds missing MODULE_DEVICE_TABLE
definition which generates correct modalias for automatic loading of
this driver when it is built as an external module.

Fixes: 5a5223ffd7ef ("clk: qcom: Add A7 PLL support")
Signed-off-by: Chen Hui <clare.chenhui@huawei.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/qcom/a7-pll.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/qcom/a7-pll.c b/drivers/clk/qcom/a7-pll.c
index e171d3caf2cf..c4a53e5db229 100644
--- a/drivers/clk/qcom/a7-pll.c
+++ b/drivers/clk/qcom/a7-pll.c
@@ -86,6 +86,7 @@ static const struct of_device_id qcom_a7pll_match_table[] = {
 	{ .compatible = "qcom,sdx55-a7pll" },
 	{ }
 };
+MODULE_DEVICE_TABLE(of, qcom_a7pll_match_table);
 
 static struct platform_driver qcom_a7pll_driver = {
 	.probe = qcom_a7pll_probe,
-- 
2.17.1

