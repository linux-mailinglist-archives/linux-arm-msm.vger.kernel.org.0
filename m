Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 442B53D94E9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 20:03:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbhG1SDT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 14:03:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:43716 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229565AbhG1SDS (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 14:03:18 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1627495396; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=n8zu2+yyYfKoRSknIfHiAcFCRFragvnkngkp+ZsvrDo=; b=Kbxd2dWbyO+TBhzGttNxAhLS3wX0uIO6otY9ED8yaTWiJ0AtH4bebrdlKVOSjWPAHdTWjX7w
 CV9sn7c7gAEH3FKwr79qhLY2fx/kFJVQw7VhP4It+t0I0f1b8qSGjVd/UPoUR7hjDDdZsIuX
 MDgSYeUJioRDb4xBbEm/Hp+arKc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 61019bcf17c2b4047d3fee23 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 28 Jul 2021 18:02:55
 GMT
Sender: collinsd=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 80A93C433F1; Wed, 28 Jul 2021 18:02:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: collinsd)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0620DC4338A;
        Wed, 28 Jul 2021 18:02:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0620DC4338A
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=collinsd@codeaurora.org
From:   David Collins <collinsd@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Cc:     David Collins <collinsd@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, Kiran Gunda <kgunda@codeaurora.org>,
        Anirudh Ghayal <aghayal@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Subject: [RESEND PATCH] spmi: spmi-pmic-arb: fix irq_set_type race condition
Date:   Wed, 28 Jul 2021 11:02:09 -0700
Message-Id: <20210728180209.14764-1-collinsd@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The qpnpint_irq_set_type() callback function configures the type
(edge vs level) and polarity (high, low, or both) of a particular
PMIC interrupt within a given peripheral.  To do this, it reads
the three consecutive IRQ configuration registers, modifies the
specified IRQ bit within the register values, and finally writes
the three modified register values back to the PMIC.  While a
spinlock is used to provide mutual exclusion on the SPMI bus
during the register read and write calls, there is no locking
around the overall read, modify, write sequence.  This opens up
the possibility of a race condition if two tasks set the type of
a PMIC IRQ within the same peripheral simultaneously.

When the race condition is encountered, both tasks will read the
old value of the registers and IRQ bits set by one of the tasks
will be dropped upon the register write of the other task.  This
then leads to PMIC IRQs being enabled with an incorrect type and
polarity configured.  Such misconfiguration can lead to an IRQ
storm that overwhelms the system and causes it to crash.

This race condition and IRQ storm have been observed when using
a pair of pm8941-pwrkey devices to handle PMK8350 pwrkey and
resin interrupts.  The independent devices probe asynchronously
in parallel and can simultaneously request and configure PMIC
IRQs in the same PMIC peripheral.

For a good case, the IRQ configuration calls end up serialized
due to timing deltas and the register read/write sequence looks
like this:

1. pwrkey probe: SPMI  read(0x1311): 0x00, 0x00, 0x00
2. pwrkey probe: SPMI write(0x1311): 0x80, 0x80, 0x80
3. resin probe:  SPMI  read(0x1311): 0x80, 0x80, 0x80
4. resin probe:  SPMI write(0x1311): 0xC0, 0xC0, 0xC0

The final register states after both devices have requested and
enabled their respective IRQs is thus:

0x1311: 0xC0
0x1312: 0xC0
0x1313: 0xC0
0x1314: 0x00
0x1315: 0xC0

For a bad case, the IRQ configuration calls end up occurring
simultaneously and the race condition is encountered.  The
register read/write sequence then looks like this:

1. pwrkey probe: SPMI  read(0x1311): 0x00, 0x00, 0x00
2. resin probe:  SPMI  read(0x1311): 0x00, 0x00, 0x00
3. pwrkey probe: SPMI write(0x1311): 0x80, 0x80, 0x80
4. resin probe:  SPMI write(0x1311): 0x40, 0x40, 0x40

In this case, the final register states after both devices have
requested and enabled their respective IRQs is thus:

0x1311: 0x40
0x1312: 0x40
0x1313: 0x40
0x1314: 0x00
0x1315: 0xC0

This corresponds to the resin IRQ being configured for both
rising and falling edges, as expected.  However, the pwrkey IRQ
is misconfigured as level type with both polarity high and low
set to disabled.  The PMIC IRQ triggering hardware treats this
particular register configuration as if level low triggering is
enabled.

The raw pwrkey IRQ signal is low when the power key is not being
pressed.  Thus, the pwrkey IRQ begins firing continuously in an
IRQ storm.

Fix the race condition by locking a spinlock for the duration of
the read, modify, write sequence in the qpnpint_irq_set_type()
function.

Fixes: 67b563f1f258 ("spmi: pmic_arb: add support for interrupt handling")
Signed-off-by: David Collins <collinsd@codeaurora.org>
---
 drivers/spmi/spmi-pmic-arb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index bbbd311eda03..379ad6c1c14a 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -127,6 +127,7 @@ struct apid_data {
  * @intr:		address of the SPMI interrupt control registers.
  * @cnfg:		address of the PMIC Arbiter configuration registers.
  * @lock:		lock to synchronize accesses.
+ * @irq_lock:		lock to ensure mutual exclusion for IRQ type setting
  * @channel:		execution environment channel to use for accesses.
  * @irq:		PMIC ARB interrupt.
  * @ee:			the current Execution Environment
@@ -146,6 +147,7 @@ struct spmi_pmic_arb {
 	void __iomem		*core;
 	resource_size_t		core_size;
 	raw_spinlock_t		lock;
+	raw_spinlock_t		irq_lock;
 	u8			channel;
 	int			irq;
 	u8			ee;
@@ -600,10 +602,13 @@ static void qpnpint_irq_unmask(struct irq_data *d)
 
 static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
+	struct spmi_pmic_arb *pmic_arb = irq_data_get_irq_chip_data(d);
 	struct spmi_pmic_arb_qpnpint_type type;
 	irq_flow_handler_t flow_handler;
 	u8 irq = hwirq_to_irq(d->hwirq);
+	unsigned long flags;
 
+	raw_spin_lock_irqsave(&pmic_arb->irq_lock, flags);
 	qpnpint_spmi_read(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
 
 	if (flow_type & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
@@ -616,8 +621,10 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 		flow_handler = handle_edge_irq;
 	} else {
 		if ((flow_type & (IRQF_TRIGGER_HIGH)) &&
-		    (flow_type & (IRQF_TRIGGER_LOW)))
+		    (flow_type & (IRQF_TRIGGER_LOW))) {
+			raw_spin_unlock_irqrestore(&pmic_arb->irq_lock, flags);
 			return -EINVAL;
+		}
 
 		type.type &= ~BIT(irq); /* level trig */
 		if (flow_type & IRQF_TRIGGER_HIGH)
@@ -629,6 +636,8 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 	}
 
 	qpnpint_spmi_write(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
+	raw_spin_unlock_irqrestore(&pmic_arb->irq_lock, flags);
+
 	irq_set_handler_locked(d, flow_handler);
 
 	return 0;
@@ -1285,6 +1294,7 @@ static int spmi_pmic_arb_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, ctrl);
 	raw_spin_lock_init(&pmic_arb->lock);
+	raw_spin_lock_init(&pmic_arb->irq_lock);
 
 	ctrl->cmd = pmic_arb_cmd;
 	ctrl->read_cmd = pmic_arb_read_cmd;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

