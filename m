Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E694A3FD531
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 10:21:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243105AbhIAIUP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 04:20:15 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:17574 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243101AbhIAIUO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 04:20:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630484358; x=1662020358;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XwhljndGA6Jv2ltbwzx88Ni9Naz4wDVBE/5XzjZwT4c=;
  b=HMaV15ap69dC5OIJuqRLRRNbjKYgdWETMO0gzIf/elyHYqe9O+lc53QP
   AjSgmhWgPYLtYJafXEQZHsyj1uqqiarzxStVz78qhxL+VvtzAg2c95T7A
   57yKnZqNZAc/tY6HsNv3zefPNUDG4X0rGZVjE0XyZw8OpTwTG+d8puSSe
   o=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2021 01:19:18 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:19:17 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 1 Sep 2021 01:19:15 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 3/9] spmi: pmic-arb: check apid against limits before calling irq handler
Date:   Wed, 1 Sep 2021 16:18:04 +0800
Message-ID: <1630484290-28190-4-git-send-email-quic_fenglinw@quicinc.com>
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

Check that the apid for an SPMI interrupt falls between the
min_apid and max_apid that can be handled by the APPS processor
before invoking the per-apid interrupt handler:
periph_interrupt().

This avoids an access violation in rare cases where the status
bit is set for an interrupt that is not owned by the APPS
processor.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 4d7ad004..c4adc06 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -535,6 +535,12 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 			id = ffs(status) - 1;
 			status &= ~BIT(id);
 			apid = id + i * 32;
+			if (apid < pmic_arb->min_apid
+			    || apid > pmic_arb->max_apid) {
+				WARN_ONCE(true, "spurious spmi irq received for apid=%d\n",
+					apid);
+				continue;
+			}
 			enable = readl_relaxed(
 					ver_ops->acc_enable(pmic_arb, apid));
 			if (enable & SPMI_PIC_ACC_ENABLE_BIT)
-- 
2.7.4

