Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 149EF432D30
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:30:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233671AbhJSFcb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:31 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:58245 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbhJSFc1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621416; x=1666157416;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=dkZgQEo+I/MIFCB7ISYjwANwxbl2cmmmXadZsEC4zBQ=;
  b=WPvJ3sIcoRFr5XH++7hbAO/kS5IQLr34hi90i8IMohrNDmXOUTHwrTxG
   xU1uaDSV4QIxQ7TcZ/sgdSv1ZNfiCKPj7GN/jH7uG49pvr1gvttC5UB6v
   yqoLEQnShr1y7EbWQw1jW9T1EPe0G916rfMbwwHa/v0X3d0QR5TgASymI
   Q=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:16 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:30:15 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:30:11 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Josh Cartwright" <joshc@codeaurora.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, "Yimin Peng" <yiminp@codeaurora.org>
Subject: [PATCH v2 07/10] spmi: pmic-arb: clear unexpected interrupt trigger type
Date:   Tue, 19 Oct 2021 13:29:18 +0800
Message-ID: <1634621361-17155-8-git-send-email-quic_fenglinw@quicinc.com>
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

From: Yimin Peng <yiminp@codeaurora.org>

Have the qpnpint_irq_set_type function clear unwanted high/low
trigger bits when updating the interrupt flags. This fixes issues
when the IRQ type needs to be updated at runtime by calling
irq_set_irq_type() with different trigger types.

Fixes: 67b563f1f258 ("spmi: pmic_arb: add support for interrupt handling")
Signed-off-by: Yimin Peng <yiminp@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index e83342a..93e14b4 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -643,8 +643,12 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 		type.type |= BIT(irq);
 		if (flow_type & IRQF_TRIGGER_RISING)
 			type.polarity_high |= BIT(irq);
+		else
+			type.polarity_high &= ~BIT(irq);
 		if (flow_type & IRQF_TRIGGER_FALLING)
 			type.polarity_low  |= BIT(irq);
+		else
+			type.polarity_low  &= ~BIT(irq);
 
 		flow_handler = handle_edge_irq;
 	} else {
@@ -653,10 +657,13 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 			return -EINVAL;
 
 		type.type &= ~BIT(irq); /* level trig */
-		if (flow_type & IRQF_TRIGGER_HIGH)
+		if (flow_type & IRQF_TRIGGER_HIGH) {
 			type.polarity_high |= BIT(irq);
-		else
+			type.polarity_low  &= ~BIT(irq);
+		} else {
 			type.polarity_low  |= BIT(irq);
+			type.polarity_high &= ~BIT(irq);
+		}
 
 		flow_handler = handle_level_irq;
 	}
-- 
2.7.4

