Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B09BB3D9AE2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 03:13:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbhG2BNt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 21:13:49 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:18606 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233067AbhG2BNq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 21:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627521224; x=1659057224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=TT6H1LTJc5D9BENIvvBWTikBFkwSSOsfTIGLszPVMv8=;
  b=vFkeEauQtLqg21iftGequ9m9e4vRGa3LDhT6iqHhUCH2vwPCJp5FXgX/
   myKRubtnnGtNj/HxpgtIolMbUYw3D5+iEACZcj5h6CYDF2gcP9OzcIyZ5
   DjnHy2LXn2Tc9US83/8tsDdeKgMgd3mT46BubDSGPrFn0ZeDlxrwMnQzI
   k=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Jul 2021 18:13:44 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jul 2021 18:13:44 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 28 Jul 2021 18:13:42 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Subject: [PATCH V1 1/9] spmi: pmic-arb: add a print in cleanup_irq
Date:   Thu, 29 Jul 2021 09:12:39 +0800
Message-ID: <1627521167-18848-2-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627521167-18848-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1627521167-18848-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>

The cleanup_irq() was meant to clear and mask interrupts that were
left enabled in the hardware but there was no interrupt handler
registered for it. Add an error print when it gets invoked.

Signed-off-by: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index bbbd311..295e19f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -489,6 +489,8 @@ static void cleanup_irq(struct spmi_pmic_arb *pmic_arb, u16 apid, int id)
 	u8 per = ppid & 0xFF;
 	u8 irq_mask = BIT(id);
 
+	dev_err_ratelimited(&pmic_arb->spmic->dev, "%s apid=%d sid=0x%x per=0x%x irq=%d\n",
+			__func__, apid, sid, per, id);
 	writel_relaxed(irq_mask, pmic_arb->ver_ops->irq_clear(pmic_arb, apid));
 
 	if (pmic_arb_write_cmd(pmic_arb->spmic, SPMI_CMD_EXT_WRITEL, sid,
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

