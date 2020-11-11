Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 10BCC2AED21
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Nov 2020 10:16:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbgKKJQe (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 11 Nov 2020 04:16:34 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:39690 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726619AbgKKJQM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 11 Nov 2020 04:16:12 -0500
Received: from localhost (unknown [127.0.0.1])
        by mail.baikalelectronics.ru (Postfix) with ESMTP id A6B1D803017C;
        Wed, 11 Nov 2020 09:16:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at baikalelectronics.ru
Received: from mail.baikalelectronics.ru ([127.0.0.1])
        by localhost (mail.baikalelectronics.ru [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id GdhkLU1_JnUs; Wed, 11 Nov 2020 12:16:09 +0300 (MSK)
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 17/18] usb: dwc3: qcom: Detect DWC3 DT-nodes with "usb"-prefixed names
Date:   Wed, 11 Nov 2020 12:15:51 +0300
Message-ID: <20201111091552.15593-18-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
References: <20201111091552.15593-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In accordance with the USB HCD/DRD schema all the USB controllers are
supposed to have DT-nodes named with prefix "^usb(@.*)?".  Since the
existing DT-nodes will be renamed in a subsequent patch let's first make
sure the DWC3 Qualcomm driver supports them and second falls back to the
deprecated naming so not to fail on the legacy DTS-files passed to the
newer kernels.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>
---
 drivers/usb/dwc3/dwc3-qcom.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index e1e78e9824b1..661263e62f21 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -519,7 +519,8 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			ret;
 
-	dwc3_np = of_get_child_by_name(np, "dwc3");
+	dwc3_np = of_get_child_by_name(np, "usb") ?:
+		  of_get_child_by_name(np, "dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		return -ENODEV;
-- 
2.28.0

