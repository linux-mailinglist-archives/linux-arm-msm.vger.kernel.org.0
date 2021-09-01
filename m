Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13E603FD53E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 10:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243207AbhIAIUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 04:20:36 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:52979 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243141AbhIAIU0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 04:20:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630484370; x=1662020370;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=hCWrDSqZz1/MJx0Y2r+Vv1EF0PQcvg19mxnobpT+a9s=;
  b=uhrkqhUkeRAVUL32niVbyzmqaSPKZbynwbcYEMTPtY8P3yP7VeuP6LOd
   X4C4dlaInxneMwqYSHsxvdCjcVNYldftaCSp8cvrZo3xnD+Do0ZH5IwYz
   tkXPJ1gw47/UlsL2ftwnGesbMTXzqjGgKLwjHpW3tpfhe4qMZXEtVwUOy
   k=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2021 01:19:29 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:19:30 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 1 Sep 2021 01:19:27 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 8/9] spmi: pmic-arb: make interrupt support optional
Date:   Wed, 1 Sep 2021 16:18:09 +0800
Message-ID: <1630484290-28190-9-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1630484290-28190-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1630484290-28190-1-git-send-email-quic_fenglinw@quicinc.com>
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

