Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4ACBF40F26C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbhIQGfB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:35:01 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:14950 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238174AbhIQGeu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860409; x=1663396409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=kOj1T/M9/T/1A0YLEYHMt7zmOnXmigoTevu8jxHooAU=;
  b=Odl4i+Wc7HX4FxpZXEVk0wwCX5nQu2iFR+uYEQtxFCjfu2GdOfYuqX6a
   jrudeTwa/F+KS12kazDOMQPXxADRPVLiJDN02kJGaD5d4a8FNmOgLruCt
   OAELanGWvDa5nNd/OiAmUrzmCSbuj3trWReBD54LbYaQlbAvRjKZMJAUs
   U=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:29 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:28 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:26 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, Yimin Peng <yiminp@codeaurora.org>
Subject: [RESEND PATCH v1 7/9] spmi: pmic-arb: support updating interrupt type flags
Date:   Fri, 17 Sep 2021 14:33:02 +0800
Message-ID: <1631860384-26608-8-git-send-email-quic_fenglinw@quicinc.com>
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
2.7.4

