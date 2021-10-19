Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D431E432D38
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:31:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233882AbhJSFck (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:40 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58245 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233790AbhJSFcc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621421; x=1666157421;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=i2sRGUdbWlFGLl2Me94YbV+SXxs3jEAHx9US9SJ/f/s=;
  b=eCepg1gUG0pjYyR0dTz/UKF1mX49z6R0n4oXMeHwteIwGhIQAdo0cdF1
   FVZiestnaGTCTI6EKUqj4IQJ954sF4WebFt90+E2tGoNw6CKnjWv08/95
   0hg/I/JnsgUTzFNEvZOZ+xlOtdhZ5AHdmEuKOKilLllQ3+yvsBc2znRsf
   g=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:20 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:30:20 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:30:18 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH v2 09/10] spmi: pmic-arb: make interrupt support optional
Date:   Tue, 19 Oct 2021 13:29:20 +0800
Message-ID: <1634621361-17155-10-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
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
index 93e14b4..d7bf8b6 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1287,10 +1287,12 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 		goto err_put_ctrl;
 	}
 
-	pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
-	if (pmic_arb->irq < 0) {
-		err = pmic_arb->irq;
-		goto err_put_ctrl;
+	if (of_find_property(pdev->dev.of_node, "interrupt-controller", NULL)) {
+		pmic_arb->irq = platform_get_irq_byname(pdev, "periph_irq");
+		if (pmic_arb->irq < 0) {
+			err = pmic_arb->irq;
+			goto err_put_ctrl;
+		}
 	}
 
 	err = of_property_read_u32(pdev->dev.of_node, "qcom,channel", &channel);
@@ -1350,17 +1352,22 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
@@ -1368,8 +1375,10 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
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
@@ -1380,8 +1389,10 @@ static int spmi_pmic_arb_remove(struct platform_device *pdev)
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

