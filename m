Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A766231A649
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Feb 2021 21:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231537AbhBLU4Q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Feb 2021 15:56:16 -0500
Received: from mail.baikalelectronics.com ([87.245.175.226]:40506 "EHLO
        mail.baikalelectronics.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231470AbhBLU4M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Feb 2021 15:56:12 -0500
From:   Serge Semin <Sergey.Semin@baikalelectronics.ru>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Serge Semin <Sergey.Semin@baikalelectronics.ru>,
        Serge Semin <fancer.lancer@gmail.com>,
        <devicetree@vger.kernel.org>, <linux-usb@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v7 2/3] usb: dwc3: qcom: Detect DWC3 DT-nodes using compatible string
Date:   Fri, 12 Feb 2021 23:55:20 +0300
Message-ID: <20210212205521.14280-2-Sergey.Semin@baikalelectronics.ru>
In-Reply-To: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
References: <20210212205521.14280-1-Sergey.Semin@baikalelectronics.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-ClientProxiedBy: MAIL.baikal.int (192.168.51.25) To mail (192.168.51.25)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In accordance with the USB HCD/DRD schema all the USB controllers are
supposed to have DT-nodes named with prefix "^usb(@.*)?". Since the
existing DT-nodes will be renamed in a subsequent patch let's fix the DWC3
Qcom-specific code to detect the DWC3 sub-node just by checking its
compatible string to match the "snps,dwc3". The semantic of the code
won't change seeing all the DWC USB3 nodes are supposed to have the
compatible property with any of those strings set.

Signed-off-by: Serge Semin <Sergey.Semin@baikalelectronics.ru>

---

Changelog v7:
- Replace "of_get_child_by_name(np, "usb") ?: of_get_child_by_name(np, "dwc3");"
  pattern with using of_get_compatible_child() method.
- Discard Bjorn Andersson Reviewed-by tag since the patch content
  has been changed.
---
 drivers/usb/dwc3/dwc3-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
index 3564d00cdce3..c8483becea5d 100644
--- a/drivers/usb/dwc3/dwc3-qcom.c
+++ b/drivers/usb/dwc3/dwc3-qcom.c
@@ -630,7 +630,7 @@ static int dwc3_qcom_of_register_core(struct platform_device *pdev)
 	struct device		*dev = &pdev->dev;
 	int			ret;
 
-	dwc3_np = of_get_child_by_name(np, "dwc3");
+	dwc3_np = of_get_compatible_child(np, "snps,dwc3");
 	if (!dwc3_np) {
 		dev_err(dev, "failed to find dwc3 core child\n");
 		return -ENODEV;
-- 
2.30.0

