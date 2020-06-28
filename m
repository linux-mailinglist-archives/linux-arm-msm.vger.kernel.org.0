Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6E5320C567
	for <lists+linux-arm-msm@lfdr.de>; Sun, 28 Jun 2020 04:26:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725880AbgF1C0K (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 27 Jun 2020 22:26:10 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:6841 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725866AbgF1C0K (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 27 Jun 2020 22:26:10 -0400
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id D9BCCFCDA9277C50F1BA;
        Sun, 28 Jun 2020 10:26:07 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Sun, 28 Jun 2020 10:25:57 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Sivaprakash Murugesan <sivaprak@codeaurora.org>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] clk: qcom: Fix return value check in apss_ipq6018_probe()
Date:   Sun, 28 Jun 2020 02:30:55 +0000
Message-ID: <20200628023055.50608-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type:   text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7BIT
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In case of error, the function dev_get_regmap() returns NULL pointer
not ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: 5e77b4ef1b19 ("clk: qcom: Add ipq6018 apss clock controller")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/clk/qcom/apss-ipq6018.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/qcom/apss-ipq6018.c b/drivers/clk/qcom/apss-ipq6018.c
index 004f7e1ecdc2..d78ff2f310bf 100644
--- a/drivers/clk/qcom/apss-ipq6018.c
+++ b/drivers/clk/qcom/apss-ipq6018.c
@@ -87,8 +87,8 @@ static int apss_ipq6018_probe(struct platform_device *pdev)
 	struct regmap *regmap;
 
 	regmap = dev_get_regmap(pdev->dev.parent, NULL);
-	if (IS_ERR(regmap))
-		return PTR_ERR(regmap);
+	if (!regmap)
+		return -ENODEV;
 
 	return qcom_cc_really_probe(pdev, &apss_ipq6018_desc, regmap);
 }



