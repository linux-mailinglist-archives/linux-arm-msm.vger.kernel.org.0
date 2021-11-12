Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C362444E114
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 05:25:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234713AbhKLE2b (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 23:28:31 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:5194 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234705AbhKLE2U (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 23:28:20 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636691130; x=1668227130;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=dkZgQEo+I/MIFCB7ISYjwANwxbl2cmmmXadZsEC4zBQ=;
  b=OO0fNxLC3QUivkk0eErSw7NVh7/UFOAyvW4DHfxsZLDNoIhQuhRJdNzD
   TFwt5DmygJmlL67G6dww0xQk93RcUikIeseJPvsgWhFzWkqM62mIunOT0
   cUzwWsb99WulnYcMHIEpb6VDyivNFAF2weu5kfKAh5syZ/SK7VkYNllTS
   8=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 11 Nov 2021 20:25:29 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 20:25:29 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 11 Nov 2021 20:25:29 -0800
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 20:25:26 -0800
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>, Josh Cartwright <joshc@codeaurora.org>,
        "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>,
        <maz@kernel.org>, "Yimin Peng" <yiminp@codeaurora.org>
Subject: [RESEND PATCH v2 07/11] spmi: pmic-arb: clear unexpected interrupt trigger type
Date:   Fri, 12 Nov 2021 12:24:15 +0800
Message-ID: <1636691059-4305-8-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1636691059-4305-1-git-send-email-quic_fenglinw@quicinc.com>
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

