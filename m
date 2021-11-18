Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 34793455388
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Nov 2021 04:52:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238553AbhKRDz0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Nov 2021 22:55:26 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:3860 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234183AbhKRDzZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Nov 2021 22:55:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637207546; x=1668743546;
  h=from:to:cc:subject:date:message-id:mime-version;
  bh=3+wzxyFJhGbbefMKoYpQEMPFrnq5e//k4r0qfhbdcv4=;
  b=E9DUi58M/Zykykme6ZIx6orfMDREESdopKpvFhdAardH3P5vgxZkEk2+
   KspVwqBBnhr0B0Z+PTwpMqUL28qcjl+vdJEYbjPLJEJ2dtTS3xclROJr0
   ckFerDyUI3MoxmL+4ZoGkPnMZpdMe4e8JdIRjAhnm+1jMtYy4EH9L6/+S
   o=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 17 Nov 2021 19:52:26 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2021 19:52:25 -0800
Received: from nalasex01b.na.qualcomm.com (10.47.209.197) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 19:52:25 -0800
Received: from collinsd-linux.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Wed, 17 Nov 2021 19:52:24 -0800
From:   David Collins <quic_collinsd@quicinc.com>
To:     Stephen Boyd <sboyd@kernel.org>, <linux-kernel@vger.kernel.org>
CC:     David Collins <quic_collinsd@quicinc.com>,
        <linux-arm-msm@vger.kernel.org>,
        Kiran Gunda <quic_kgunda@quicinc.com>,
        Anirudh Ghayal <quic_aghayal@quicinc.com>,
        Subbaraman Narayanamurthy <quic_subbaram@quicinc.com>
Subject: [PATCH v2] spmi: spmi-pmic-arb: fix irq_set_type race condition
Date:   Wed, 17 Nov 2021 19:47:19 -0800
Message-ID: <20211118034719.28971-1-quic_collinsd@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
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

Fix the race condition by holding the spmi-pmic-arb spinlock for
the duration of the read, modify, write sequence performed in the
qpnpint_irq_set_type() function.  Split the pmic_arb_read_cmd()
and pmic_arb_write_cmd() functions each into three parts so that
hardware register IO is decoupled from spinlock locking.  This
allows a new function pmic_arb_masked_write() to be added which
locks the spinlock and then calls register IO functions to
perform SPMI read and write commands in a single atomic
operation.

Signed-off-by: David Collins <quic_collinsd@quicinc.com>
---

Changes in v2:
- Reused existing struct spmi_pmic_arb spinlock 'lock' instead
  of adding a new one for use in qpnpint_irq_set_type()
- Split functionality from pmic_arb_read_cmd() into
  pmic_arb_fmt_read_cmd() and pmic_arb_read_cmd_unlocked()
- Split functionality from pmic_arb_write_cmd() into
  pmic_arb_fmt_write_cmd() and pmic_arb_write_cmd_unlocked()
- Added pmic_arb_masked_write() function which calls
  pmic_arb_fmt_read_cmd() and pmic_arb_fmt_write_cmd() then
  locks the spinlock and calls pmic_arb_read_cmd_unlocked()
  and pmic_arb_write_cmd_unlocked()
- Added qpnpint_spmi_masked_write() as a light wrapper around
  pmic_arb_masked_write()
- Modified qpnpint_irq_set_type() to make use of
  qpnpint_spmi_masked_write().

v1 of this patch can be found at [1].

[1]: https://lore.kernel.org/all/20210728180209.14764-1-collinsd@codeaurora.org

---
 drivers/spmi/spmi-pmic-arb.c | 176 ++++++++++++++++++++++++++++-------
 1 file changed, 140 insertions(+), 36 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index bbbd311eda03..6e0f450ed20f 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -333,24 +333,20 @@ static int pmic_arb_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid)
 	return pmic_arb->ver_ops->non_data_cmd(ctrl, opc, sid);
 }
 
-static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			     u16 addr, u8 *buf, size_t len)
+static int pmic_arb_fmt_read_cmd(struct spmi_pmic_arb *pmic_arb, u8 opc, u8 sid,
+				 u16 addr, size_t len, u32 *cmd, u32 *offset)
 {
-	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
-	unsigned long flags;
 	u8 bc = len - 1;
-	u32 cmd;
 	int rc;
-	u32 offset;
 
 	rc = pmic_arb->ver_ops->offset(pmic_arb, sid, addr,
 				       PMIC_ARB_CHANNEL_OBS);
 	if (rc < 0)
 		return rc;
 
-	offset = rc;
+	*offset = rc;
 	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
-		dev_err(&ctrl->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
+		dev_err(&pmic_arb->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
 			PMIC_ARB_MAX_TRANS_BYTES, len);
 		return  -EINVAL;
 	}
@@ -365,14 +361,24 @@ static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	else
 		return -EINVAL;
 
-	cmd = pmic_arb->ver_ops->fmt_cmd(opc, sid, addr, bc);
+	*cmd = pmic_arb->ver_ops->fmt_cmd(opc, sid, addr, bc);
+
+	return 0;
+}
+
+static int pmic_arb_read_cmd_unlocked(struct spmi_controller *ctrl, u32 cmd,
+				      u32 offset, u8 sid, u16 addr, u8 *buf,
+				      size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	u8 bc = len - 1;
+	int rc;
 
-	raw_spin_lock_irqsave(&pmic_arb->lock, flags);
 	pmic_arb_set_rd_cmd(pmic_arb, offset + PMIC_ARB_CMD, cmd);
 	rc = pmic_arb_wait_for_done(ctrl, pmic_arb->rd_base, sid, addr,
 				    PMIC_ARB_CHANNEL_OBS);
 	if (rc)
-		goto done;
+		return rc;
 
 	pmic_arb_read_data(pmic_arb, buf, offset + PMIC_ARB_RDATA0,
 		     min_t(u8, bc, 3));
@@ -380,30 +386,44 @@ static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	if (bc > 3)
 		pmic_arb_read_data(pmic_arb, buf + 4, offset + PMIC_ARB_RDATA1,
 					bc - 4);
+	return 0;
+}
 
-done:
+static int pmic_arb_read_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			     u16 addr, u8 *buf, size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	u32 cmd, offset;
+	int rc;
+
+	rc = pmic_arb_fmt_read_cmd(pmic_arb, opc, sid, addr, len, &cmd,
+				   &offset);
+	if (rc)
+		return rc;
+
+	raw_spin_lock_irqsave(&pmic_arb->lock, flags);
+	rc = pmic_arb_read_cmd_unlocked(ctrl, cmd, offset, sid, addr, buf, len);
 	raw_spin_unlock_irqrestore(&pmic_arb->lock, flags);
+
 	return rc;
 }
 
-static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
-			u16 addr, const u8 *buf, size_t len)
+static int pmic_arb_fmt_write_cmd(struct spmi_pmic_arb *pmic_arb, u8 opc,
+				  u8 sid, u16 addr, size_t len, u32 *cmd,
+				  u32 *offset)
 {
-	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
-	unsigned long flags;
 	u8 bc = len - 1;
-	u32 cmd;
 	int rc;
-	u32 offset;
 
 	rc = pmic_arb->ver_ops->offset(pmic_arb, sid, addr,
 					PMIC_ARB_CHANNEL_RW);
 	if (rc < 0)
 		return rc;
 
-	offset = rc;
+	*offset = rc;
 	if (bc >= PMIC_ARB_MAX_TRANS_BYTES) {
-		dev_err(&ctrl->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
+		dev_err(&pmic_arb->spmic->dev, "pmic-arb supports 1..%d bytes per trans, but:%zu requested",
 			PMIC_ARB_MAX_TRANS_BYTES, len);
 		return  -EINVAL;
 	}
@@ -420,10 +440,19 @@ static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 	else
 		return -EINVAL;
 
-	cmd = pmic_arb->ver_ops->fmt_cmd(opc, sid, addr, bc);
+	*cmd = pmic_arb->ver_ops->fmt_cmd(opc, sid, addr, bc);
+
+	return 0;
+}
+
+static int pmic_arb_write_cmd_unlocked(struct spmi_controller *ctrl, u32 cmd,
+				      u32 offset, u8 sid, u16 addr,
+				      const u8 *buf, size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	u8 bc = len - 1;
 
 	/* Write data to FIFOs */
-	raw_spin_lock_irqsave(&pmic_arb->lock, flags);
 	pmic_arb_write_data(pmic_arb, buf, offset + PMIC_ARB_WDATA0,
 				min_t(u8, bc, 3));
 	if (bc > 3)
@@ -432,8 +461,62 @@ static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
 
 	/* Start the transaction */
 	pmic_arb_base_write(pmic_arb, offset + PMIC_ARB_CMD, cmd);
-	rc = pmic_arb_wait_for_done(ctrl, pmic_arb->wr_base, sid, addr,
-				    PMIC_ARB_CHANNEL_RW);
+	return pmic_arb_wait_for_done(ctrl, pmic_arb->wr_base, sid, addr,
+				      PMIC_ARB_CHANNEL_RW);
+}
+
+static int pmic_arb_write_cmd(struct spmi_controller *ctrl, u8 opc, u8 sid,
+			      u16 addr, const u8 *buf, size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	unsigned long flags;
+	u32 cmd, offset;
+	int rc;
+
+	rc = pmic_arb_fmt_write_cmd(pmic_arb, opc, sid, addr, len, &cmd,
+				    &offset);
+	if (rc)
+		return rc;
+
+	raw_spin_lock_irqsave(&pmic_arb->lock, flags);
+	rc = pmic_arb_write_cmd_unlocked(ctrl, cmd, offset, sid, addr, buf,
+					 len);
+	raw_spin_unlock_irqrestore(&pmic_arb->lock, flags);
+
+	return rc;
+}
+
+static int pmic_arb_masked_write(struct spmi_controller *ctrl, u8 sid, u16 addr,
+				 const u8 *buf, const u8 *mask, size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = spmi_controller_get_drvdata(ctrl);
+	u32 read_cmd, read_offset, write_cmd, write_offset;
+	u8 temp[PMIC_ARB_MAX_TRANS_BYTES];
+	unsigned long flags;
+	int rc, i;
+
+	rc = pmic_arb_fmt_read_cmd(pmic_arb, SPMI_CMD_EXT_READL, sid, addr, len,
+				   &read_cmd, &read_offset);
+	if (rc)
+		return rc;
+
+	rc = pmic_arb_fmt_write_cmd(pmic_arb, SPMI_CMD_EXT_WRITEL, sid, addr,
+				    len, &write_cmd, &write_offset);
+	if (rc)
+		return rc;
+
+	raw_spin_lock_irqsave(&pmic_arb->lock, flags);
+	rc = pmic_arb_read_cmd_unlocked(ctrl, read_cmd, read_offset, sid, addr,
+					temp, len);
+	if (rc)
+		goto done;
+
+	for (i = 0; i < len; i++)
+		temp[i] = (temp[i] & ~mask[i]) | (buf[i] & mask[i]);
+
+	rc = pmic_arb_write_cmd_unlocked(ctrl, write_cmd, write_offset, sid,
+					 addr, temp, len);
+done:
 	raw_spin_unlock_irqrestore(&pmic_arb->lock, flags);
 
 	return rc;
@@ -482,6 +565,23 @@ static void qpnpint_spmi_read(struct irq_data *d, u8 reg, void *buf, size_t len)
 				    d->irq);
 }
 
+static int qpnpint_spmi_masked_write(struct irq_data *d, u8 reg,
+				     const void *buf, const void *mask,
+				     size_t len)
+{
+	struct spmi_pmic_arb *pmic_arb = irq_data_get_irq_chip_data(d);
+	u8 sid = hwirq_to_sid(d->hwirq);
+	u8 per = hwirq_to_per(d->hwirq);
+	int rc;
+
+	rc = pmic_arb_masked_write(pmic_arb->spmic, sid, (per << 8) + reg, buf,
+				   mask, len);
+	if (rc)
+		dev_err_ratelimited(&pmic_arb->spmic->dev, "failed irqchip transaction on %x rc=%d\n",
+				    d->irq, rc);
+	return rc;
+}
+
 static void cleanup_irq(struct spmi_pmic_arb *pmic_arb, u16 apid, int id)
 {
 	u16 ppid = pmic_arb->apid_data[apid].ppid;
@@ -600,18 +700,18 @@ static void qpnpint_irq_unmask(struct irq_data *d)
 
 static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 {
-	struct spmi_pmic_arb_qpnpint_type type;
+	struct spmi_pmic_arb_qpnpint_type type = {0};
+	struct spmi_pmic_arb_qpnpint_type mask;
 	irq_flow_handler_t flow_handler;
-	u8 irq = hwirq_to_irq(d->hwirq);
-
-	qpnpint_spmi_read(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
+	u8 irq_bit = BIT(hwirq_to_irq(d->hwirq));
+	int rc;
 
 	if (flow_type & (IRQF_TRIGGER_RISING | IRQF_TRIGGER_FALLING)) {
-		type.type |= BIT(irq);
+		type.type = irq_bit;
 		if (flow_type & IRQF_TRIGGER_RISING)
-			type.polarity_high |= BIT(irq);
+			type.polarity_high = irq_bit;
 		if (flow_type & IRQF_TRIGGER_FALLING)
-			type.polarity_low  |= BIT(irq);
+			type.polarity_low = irq_bit;
 
 		flow_handler = handle_edge_irq;
 	} else {
@@ -619,19 +719,23 @@ static int qpnpint_irq_set_type(struct irq_data *d, unsigned int flow_type)
 		    (flow_type & (IRQF_TRIGGER_LOW)))
 			return -EINVAL;
 
-		type.type &= ~BIT(irq); /* level trig */
 		if (flow_type & IRQF_TRIGGER_HIGH)
-			type.polarity_high |= BIT(irq);
+			type.polarity_high = irq_bit;
 		else
-			type.polarity_low  |= BIT(irq);
+			type.polarity_low = irq_bit;
 
 		flow_handler = handle_level_irq;
 	}
 
-	qpnpint_spmi_write(d, QPNPINT_REG_SET_TYPE, &type, sizeof(type));
+	mask.type = irq_bit;
+	mask.polarity_high = irq_bit;
+	mask.polarity_low = irq_bit;
+
+	rc = qpnpint_spmi_masked_write(d, QPNPINT_REG_SET_TYPE, &type, &mask,
+				       sizeof(type));
 	irq_set_handler_locked(d, flow_handler);
 
-	return 0;
+	return rc;
 }
 
 static int qpnpint_irq_set_wake(struct irq_data *d, unsigned int on)
-- 
2.17.1

