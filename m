Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0E97035AA5E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 10 Apr 2021 04:49:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232796AbhDJCtY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Apr 2021 22:49:24 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:15658 "EHLO
        szxga04-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231737AbhDJCtX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Apr 2021 22:49:23 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
        by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FHKBf4xXHzpWm5;
        Sat, 10 Apr 2021 10:46:18 +0800 (CST)
Received: from huawei.com (10.174.28.241) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.498.0; Sat, 10 Apr 2021
 10:48:58 +0800
From:   Bixuan Cui <cuibixuan@huawei.com>
To:     <cuibixuan@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Felipe Balbi <balbi@kernel.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>
Subject: [PATCH -next] usb: dwc3: qcom: Remove redundant dev_err call in dwc3_qcom_probe()
Date:   Sat, 10 Apr 2021 10:48:18 +0800
Message-ID: <20210410024818.65659-1-cuibixuan@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.28.241]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

There is a error message within devm_ioremap_resource
already, so remove the dev_err call to avoid redundant
error message.

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Bixuan Cui <cuibixuan@huawei.com>
---
 drivers/usb/dwc3/dwc3-qcom.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e37cc58dfa55..726d5048d87c 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -774,7 +774,6 @@ static int dwc3_qcom_probe(struct platform_device *pdev)
 
 	qcom->qscratch_base = devm_ioremap_resource(dev, parent_res);
 	if (IS_ERR(qcom->qscratch_base)) {
-		dev_err(dev, "failed to map qscratch, err=%d\n", ret);
 		ret = PTR_ERR(qcom->qscratch_base);
 		goto clk_disable;
 	}

