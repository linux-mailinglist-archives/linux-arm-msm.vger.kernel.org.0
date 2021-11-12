Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAA7844E10D
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Nov 2021 05:25:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234664AbhKLE2J (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 11 Nov 2021 23:28:09 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:11412 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234651AbhKLE2I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 11 Nov 2021 23:28:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1636691118; x=1668227118;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=6IMGfTuF3BVQ6/1Vk5UOBnvjkDqjWlq1aGTwIYOXs9w=;
  b=pYVNSeC8I26NqJXWglOqYjpNvHQiX0Unxm2ZsBt1XO9X1ca52TEuN54R
   0e+FxfeiHclnXVfWtsGsMd5LiktwIme/fs3rBgpuYHrIYh8S+Uxtl0YKG
   Sz7u1Vn9O9g5HLIjZTyQiuPb5+HMtjqWCL+e4rZMhLHERB2WnIt1QLdzW
   w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 11 Nov 2021 20:25:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2021 20:25:18 -0800
Received: from nalasex01c.na.qualcomm.com (10.47.97.35) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 11 Nov 2021 20:25:17 -0800
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Thu, 11 Nov 2021 20:25:15 -0800
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [RESEND PATCH v2 03/11] spmi: pmic-arb: check apid against limits before calling irq handler
Date:   Fri, 12 Nov 2021 12:24:11 +0800
Message-ID: <1636691059-4305-4-git-send-email-quic_fenglinw@quicinc.com>
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
 drivers/spmi/spmi-pmic-arb.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index ce7ae99..479f721 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -523,21 +523,26 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	struct spmi_pmic_arb *pmic_arb = irq_desc_get_handler_data(desc);
 	const struct pmic_arb_ver_ops *ver_ops = pmic_arb->ver_ops;
 	struct irq_chip *chip = irq_desc_get_chip(desc);
-	int first = pmic_arb->min_apid >> 5;
-	int last = pmic_arb->max_apid >> 5;
+	int first = pmic_arb->min_apid;
+	int last = pmic_arb->max_apid;
 	u8 ee = pmic_arb->ee;
 	u32 status, enable, handled = 0;
 	int i, id, apid;
 
 	chained_irq_enter(chip, desc);
 
-	for (i = first; i <= last; ++i) {
+	for (i = first >> 5; i <= last >> 5; ++i) {
 		status = readl_relaxed(
 				ver_ops->owner_acc_status(pmic_arb, ee, i));
 		while (status) {
 			id = ffs(status) - 1;
 			status &= ~BIT(id);
 			apid = id + i * 32;
+			if (apid < first || apid > last) {
+				WARN_ONCE(true, "spurious spmi irq received for apid=%d\n",
+					apid);
+				continue;
+			}
 			enable = readl_relaxed(
 					ver_ops->acc_enable(pmic_arb, apid));
 			if (enable & SPMI_PIC_ACC_ENABLE_BIT)
-- 
2.7.4

