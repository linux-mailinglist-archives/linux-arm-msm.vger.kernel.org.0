Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0140D3F2637
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 Aug 2021 06:59:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238199AbhHTE7h (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 Aug 2021 00:59:37 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:43416 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S237899AbhHTE72 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 Aug 2021 00:59:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629435531; x=1660971531;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=IWJ0A04ElihV+hsa8p2cu+aTFCm2Gzo/yxHhJJUCiV0=;
  b=LFqOQRLKXZdgDAlofSmiQj3WDUDAlnLvMKl2l6F80YX4imcSlFj7OUNf
   v7fPTz3TWMyS66mYJhitSRtNfhB1oR2kh9A/2chfTowdkTJMmVSm5jtvi
   XNwOW4ErNmkRhKSXsVfhZOhUBq6Aew255eIWg5CbF1HJUxLx2U2WN3Lui
   M=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 19 Aug 2021 21:58:51 -0700
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Aug 2021 21:58:51 -0700
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 21:58:51 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.858.15; Thu, 19 Aug 2021 21:58:48 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, Yimin Peng <yiminp@codeaurora.org>
Subject: [PATCH V1 7/9] spmi: pmic-arb: support updating interrupt type flags
Date:   Fri, 20 Aug 2021 12:58:02 +0800
Message-ID: <1629435488-10228-8-git-send-email-quic_fenglinw@quicinc.com>
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

