Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C14FE22ADCE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 23 Jul 2020 13:32:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727916AbgGWLc7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 23 Jul 2020 07:32:59 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:8259 "EHLO huawei.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725846AbgGWLc7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 23 Jul 2020 07:32:59 -0400
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
        by Forcepoint Email with ESMTP id 3EFC32424FBD2A36A2A6;
        Thu, 23 Jul 2020 19:32:56 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.487.0; Thu, 23 Jul 2020 19:32:46 +0800
From:   Wei Yongjun <weiyongjun1@huawei.com>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>,
        Ansuel Smith <ansuelsmth@gmail.com>
CC:     Wei Yongjun <weiyongjun1@huawei.com>,
        <linux-arm-msm@vger.kernel.org>, <kernel-janitors@vger.kernel.org>,
        Hulk Robot <hulkci@huawei.com>
Subject: [PATCH -next] phy: qualcomm: fix return value check in qcom_ipq806x_usb_phy_probe()
Date:   Thu, 23 Jul 2020 11:36:22 +0000
Message-ID: <20200723113622.136752-1-weiyongjun1@huawei.com>
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

In case of error, the function devm_ioremap() returns NULL pointer not
ERR_PTR(). The IS_ERR() test in the return value check should be
replaced with NULL test.

Fixes: ef19b117b834 ("phy: qualcomm: add qcom ipq806x dwc usb phy driver")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
index 71f257b4a7f5..092fd2d9c3f3 100644
--- a/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
+++ b/drivers/phy/qualcomm/phy-qcom-ipq806x-usb.c
@@ -505,9 +505,9 @@ static int qcom_ipq806x_usb_phy_probe(struct platform_device *pdev)
 	size = resource_size(res);
 	phy_dwc3->base = devm_ioremap(phy_dwc3->dev, res->start, size);
 
-	if (IS_ERR(phy_dwc3->base)) {
+	if (!phy_dwc3->base) {
 		dev_err(phy_dwc3->dev, "failed to map reg\n");
-		return PTR_ERR(phy_dwc3->base);
+		return -ENOMEM;
 	}
 
 	phy_dwc3->ref_clk = devm_clk_get(phy_dwc3->dev, "ref");



