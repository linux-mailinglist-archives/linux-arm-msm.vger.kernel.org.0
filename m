Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 040F6432D24
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:30:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233058AbhJSFcM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:12 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:29734 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbhJSFcL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621399; x=1666157399;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=cdkFVgjDJ8+uVmfLIwHM3XZjlTGoRIvGrQjqko0zAxI=;
  b=HCP6eiPbjMVN1rBpIHpMTF5OGnAIkEouOAG/yvxb7H8h/NRO2wKPYJOd
   Mt/0Wv8FW5gGHEicCRMumLjOun+3EbI5QHKITVpj3tnJ2xHmRSx/E2Rl4
   QM+AS87byRTetoo2fxLtGTCwFNaPCL+sXPx/WTTfytEG2iIfmPZ3eNm8E
   w=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:29:59 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:29:58 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:29:56 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>,
        <maz@kernel.org>,
        "Abhijeet Dharmapurikar" <adharmap@codeaurora.org>
Subject: [PATCH v2 01/10] spmi: pmic-arb: handle spurious interrupt
Date:   Tue, 19 Oct 2021 13:29:12 +0800
Message-ID: <1634621361-17155-2-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1634621361-17155-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Abhijeet Dharmapurikar <adharmap@codeaurora.org>

Call handle_bad_irq() for handling spurious interrupt. While at it,
add an error print in cleanup_irq() for any spurious interrupt which
is fired but not having interrupt handler registered.

Signed-off-by: Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index bbbd311..da629cc 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -489,6 +489,8 @@ static void cleanup_irq(struct spmi_pmic_arb *pmic_arb, u16 apid, int id)
 	u8 per = ppid & 0xFF;
 	u8 irq_mask = BIT(id);
 
+	dev_err_ratelimited(&pmic_arb->spmic->dev, "%s apid=%d sid=0x%x per=0x%x irq=%d\n",
+			__func__, apid, sid, per, id);
 	writel_relaxed(irq_mask, pmic_arb->ver_ops->irq_clear(pmic_arb, apid));
 
 	if (pmic_arb_write_cmd(pmic_arb->spmic, SPMI_CMD_EXT_WRITEL, sid,
@@ -502,10 +504,10 @@ static void cleanup_irq(struct spmi_pmic_arb *pmic_arb, u16 apid, int id)
 				irq_mask, ppid);
 }
 
-static void periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
+static int periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
 {
 	unsigned int irq;
-	u32 status, id;
+	u32 status, id, handled = 0;
 	u8 sid = (pmic_arb->apid_data[apid].ppid >> 8) & 0xF;
 	u8 per = pmic_arb->apid_data[apid].ppid & 0xFF;
 
@@ -520,7 +522,10 @@ static void periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
 			continue;
 		}
 		generic_handle_irq(irq);
+		handled++;
 	}
+
+	return (handled) ? 0 : -EINVAL;
 }
 
 static void pmic_arb_chained_irq(struct irq_desc *desc)
@@ -531,7 +536,7 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 	int first = pmic_arb->min_apid >> 5;
 	int last = pmic_arb->max_apid >> 5;
 	u8 ee = pmic_arb->ee;
-	u32 status, enable;
+	u32 status, enable, handled = 0;
 	int i, id, apid;
 
 	chained_irq_enter(chip, desc);
@@ -546,10 +551,14 @@ static void pmic_arb_chained_irq(struct irq_desc *desc)
 			enable = readl_relaxed(
 					ver_ops->acc_enable(pmic_arb, apid));
 			if (enable & SPMI_PIC_ACC_ENABLE_BIT)
-				periph_interrupt(pmic_arb, apid);
+				if (periph_interrupt(pmic_arb, apid) == 0)
+					handled++;
 		}
 	}
 
+	if (handled == 0)
+		handle_bad_irq(desc);
+
 	chained_irq_exit(chip, desc);
 }
 
-- 
2.7.4

