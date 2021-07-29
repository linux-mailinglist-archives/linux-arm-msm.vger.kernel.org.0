Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0043D9AE5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Jul 2021 03:13:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhG2BNw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 21:13:52 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:64136 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233260AbhG2BNv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 21:13:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627521229; x=1659057229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=AER5CHXg3NdjLXqRGWQm/QEcWLjWKJ+9+Fk2vCBGXzQ=;
  b=rGKecjaYa9Kpan/NMBthCbfVPljQbkkAwMBOoJrVliAH1F4e/FFSX0K1
   hJzirLfnK2hLEWjwYppsw7bdaDHxlSc5UctAlJcD+qcZHbCoDkOrmXVq4
   HrIsjFtS9oi+vxD0xc2+e3D1Rm1Wmwv1OgTDazfygpr+YZ//S1CwyYVAv
   E=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 28 Jul 2021 18:13:49 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 28 Jul 2021 18:13:48 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Wed, 28 Jul 2021 18:13:46 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [PATCH V1 3/9] spmi: pmic-arb: check apid against limits before calling irq handler
Date:   Thu, 29 Jul 2021 09:12:41 +0800
Message-ID: <1627521167-18848-4-git-send-email-quic_fenglinw@quicinc.com>
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
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

