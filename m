Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B1C3F2630
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 06:58:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238160AbhHTE7Y (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 00:59:24 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:43416 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235904AbhHTE7V (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 00:59:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629435524; x=1660971524;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=Ovw9WoZ0YrotwnPUK4JwpO7mOXRMGw27QHpFWOln15I=;
  b=uomQ06ag3rVfKIfhxVcZ21Ve/xdxVo9dBowUy5d+gbDruDZLB33Et/oJ
   crXh4JJBA3mZbV+Bv8MQb5itMFj/ByWEWsCXtcRkOOE77BFQpGnUfS0JJ
   9aVHeMtfUBwUWYXuGRyXCzZmaszpo0zzzginc7cJfkuZSghDxFBnsrpYh
   s=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Aug 2021 21:58:44 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 21:58:44 -0700
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 21:58:44 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 21:58:41 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, Ashay Jaiswal <ashayj@codeaurora.org>
Subject: [PATCH V1 4/9] spmi: pmic-arb: add support to dispatch interrupt based on IRQ status
Date:   Fri, 20 Aug 2021 12:57:59 +0800
Message-ID: <1629435488-10228-5-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1629435488-10228-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1629435488-10228-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03h.na.qualcomm.com (10.85.0.50) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ashay Jaiswal <ashayj@codeaurora.org>

Current implementation of SPMI arbiter dispatches interrupt based on the
Arbiter's accumulator status, in some cases the accumulator status may
remain zero and the interrupt remains un-handled. Add logic to dispatch
interrupts based Arbiter's IRQ status if the accumulator status is zero.

Signed-off-by: Ashay Jaiswal <ashayj@codeaurora.org>
Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index c4adc06..59c445b 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -525,12 +525,18 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	u8 ee = pmic_arb->ee;
 	u32 status, enable;
 	int i, id, apid;
+	/* status based dispatch */
+	bool acc_valid = false;
+	u32 irq_status = 0;
 
 	chained_irq_enter(chip, desc);
 
 	for (i = first; i <= last; ++i) {
 		status = readl_relaxed(
 				ver_ops->owner_acc_status(pmic_arb, ee, i));
+		if (status)
+			acc_valid = true;
+
 		while (status) {
 			id = ffs(status) - 1;
 			status &= ~BIT(id);
@@ -548,6 +554,28 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 		}
 	}
 
+	/* ACC_STATUS is empty but IRQ fired check IRQ_STATUS */
+	if (!acc_valid) {
+		for (i = pmic_arb->min_apid; i <= pmic_arb->max_apid; i++) {
+			/* skip if APPS is not irq owner */
+			if (pmic_arb->apid_data[i].irq_ee != pmic_arb->ee)
+				continue;
+
+			irq_status = readl_relaxed(
+					     ver_ops->irq_status(pmic_arb, i));
+			if (irq_status) {
+				enable = readl_relaxed(
+					     ver_ops->acc_enable(pmic_arb, i));
+				if (enable & SPMI_PIC_ACC_ENABLE_BIT) {
+					dev_dbg(&pmic_arb->spmic->dev,
+						"Dispatching IRQ for apid=%d status=%x\n",
+						i, irq_status);
+					periph_interrupt(pmic_arb, i);
+				}
+			}
+		}
+	}
+
 	chained_irq_exit(chip, desc);
 }
 
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

