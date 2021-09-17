Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3A42440F264
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236103AbhIQGeq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:34:46 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:60418 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbhIQGen (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860402; x=1663396402;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=p82VOXmbjdo886MdyqYqr8kAUG2iDKw6pyvPODt1jVg=;
  b=JpsbDo0hG4QsbMjcUZRLQ9k4HfCwBt7PVMEFAp7HCap8J1+agrfMaMTZ
   QWISUjK+qRDdMZ1ac6efNC2q0wx7y30eTiG56GcgkzqkrHNCQwM3uVsSj
   KAK3nphOENBZHfxguw6Negmy2qBHDRVZwrYZ8yVqh9914OJnWL2gYeM6U
   M=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:22 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:21 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:19 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, Ashay Jaiswal <ashayj@codeaurora.org>
Subject: [RESEND PATCH v1 4/9] spmi: pmic-arb: add support to dispatch interrupt based on IRQ status
Date:   Fri, 17 Sep 2021 14:32:59 +0800
Message-ID: <1631860384-26608-5-git-send-email-quic_fenglinw@quicinc.com>
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
2.7.4

