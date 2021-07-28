Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F9D83D86C8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 06:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234627AbhG1Ea6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 00:30:58 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35713 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234473AbhG1Ea5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 00:30:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627446656; x=1658982656;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=IWJ0A04ElihV+hsa8p2cu+aTFCm2Gzo/yxHhJJUCiV0=;
  b=faP67nMhBZLMqhSeJD0c3PRxqRssnZ+HN9euhIi+dT0aXzkh21AXusOY
   M6aGjyPmdfhYLg5CBoS4qtLr6PifeAG29JEXQtQqktjphsL7FTSe4OirV
   ksSef8/X9evkXELvl2ZWQZ7pIyUD3OMcos2t2M0s0QZc03JSJJmc1bRyO
   Y=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jul 2021 21:30:56 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Jul 2021 21:30:56 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 27 Jul 2021 21:30:54 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, Yimin Peng <yiminp@codeaurora.org>
Subject: [spmi-pmic-arb fixes and optimization patches V1 7/9] spmi: pmic-arb: support updating interrupt type flags
Date:   Wed, 28 Jul 2021 12:30:07 +0800
Message-ID: <1627446609-9064-8-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627446609-9064-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1627446609-9064-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Yimin Peng <yiminp@codeaurora.org>

Have the qpnpint_irq_set_type function clear unwanted high/low
trigger bits when updating the interrupt flags.

Signed-off-by: Yimin Peng <yiminp@codeaurora.org>
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 9239830..988204c 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -636,8 +636,12 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
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
@@ -646,10 +650,13 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
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
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

