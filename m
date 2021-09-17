Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B841B40F26A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244647AbhIQGfA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:35:00 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56066 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240745AbhIQGew (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860411; x=1663396411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=hCWrDSqZz1/MJx0Y2r+Vv1EF0PQcvg19mxnobpT+a9s=;
  b=ZXwXe+ds5Rair7nLlt9hWLmKFH1V7gE0hRilWp1Zd00MF0RV87l3JunP
   ADuFgVNAd6u+Pc6FaCSoXID3R5UkVtKLvdtEWS5L7MbXrDfmeDStz1TsR
   02r06AzGMcbLdZhpsCzG2XxtMnRfPWPZu7uAMgKMc3IZVGS5oYJLBS3tP
   s=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:31 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:31 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:29 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support optional
Date:   Fri, 17 Sep 2021 14:33:03 +0800
Message-ID: <1631860384-26608-9-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: David Collins <collinsd@codeaurora.org>

Make the support of PMIC peripheral interrupts optional for
spmi-pmic-arb devices.  This is useful in situations where
SPMI address mapping is required without the need for IRQ
support.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 45 +++++++++++++++++++++++++++-----------------
 1 file changed, 28 insertions(+), 17 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 988204c..55fa981 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1280,10 +1280,12 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		goto err_put_ctrl;
 	}
 
-	pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
-	if (pmic_arb->irq < 0) {
-		err = pmic_arb->irq;
-		goto err_put_ctrl;
+	if (of_find_property(pdev->dev.of_node, "interrupt-names", NULL)) {
+		pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
+		if (pmic_arb->irq < 0) {
+			err = pmic_arb->irq;
+			goto err_put_ctrl;
+		}
 	}
 
 	err = of_property_read_u32(pdev->dev.of_node, "qcom,channel", &channel);
@@ -1343,17 +1345,22 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		}
 	}
 
-	dev_dbg(&pdev->dev, "adding irq domain\n");
-	pmic_arb->domain = irq_domain_add_tree(pdev->dev.of_node,
-					 &pmic_arb_irq_domain_ops, pmic_arb);
-	if (!pmic_arb->domain) {
-		dev_err(&pdev->dev, "unable to create irq_domain\n");
-		err = -ENOMEM;
-		goto err_put_ctrl;
+	if (pmic_arb->irq > 0) {
+		dev_dbg(&pdev->dev, "adding irq domain\n");
+		pmic_arb->domain = irq_domain_add_tree(pdev->dev.of_node,
+					    &pmic_arb_irq_domain_ops, pmic_arb);
+		if (!pmic_arb->domain) {
+			dev_err(&pdev->dev, "unable to create irq_domain\n");
+			err = -ENOMEM;
+			goto err_put_ctrl;
+		}
+
+		irq_set_chained_handler_and_data(pmic_arb->irq,
+						pmic_arb_chained_irq, pmic_arb);
+	} else {
+		dev_dbg(&pdev->dev, "not supporting PMIC interrupts\n");
 	}
 
-	irq_set_chained_handler_and_data(pmic_arb->irq, pmic_arb_chained_irq,
-					pmic_arb);
 	err = spmi_controller_add(ctrl);
 	if (err)
 		goto err_domain_remove;
@@ -1361,8 +1368,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 	return 0;
 
 err_domain_remove:
-	irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
-	irq_domain_remove(pmic_arb->domain);
+	if (pmic_arb->irq > 0) {
+		irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
+		irq_domain_remove(pmic_arb->domain);
+	}
 err_put_ctrl:
 	spmi_controller_put(ctrl);
 	return err;
@@ -1373,8 +1382,10 @@ static int spmi_pmic_arb_remove(struct platform_device *pdev)
 	struct spmi_controller *ctrl = platform_get_drvdata(pdev);
 	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
 	spmi_controller_remove(ctrl);
-	irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
-	irq_domain_remove(pmic_arb->domain);
+	if (pmic_arb->irq > 0) {
+		irq_set_chained_handler_and_data(pmic_arb->irq, NULL, NULL);
+		irq_domain_remove(pmic_arb->domain);
+	}
 	spmi_controller_put(ctrl);
 	return 0;
 }
-- 
2.7.4

