Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 65A3B432D2B
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:30:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233726AbhJSFcX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:23 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:26015 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233614AbhJSFcV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621409; x=1666157409;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=QtKWRKRPIDZsG/mIHa8J1aT+7Ucf+KbAml0KGOxYzrU=;
  b=h7qHFzTwjVModD424keZ7qTqbOkKXnE05wnstPzo1/uQku0O/zASTpuj
   zNCZjrRQioQ8JfQrM5c3TNygY7T4Xeg0RCo4O31USIKZ2Kz8R4/+L7kzq
   9KTq1tYZX6DLmxoVtrNrGC6x/TmsALaJzRJ3y1GLYF6epryq4sz8c2IyF
   A=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:09 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:30:09 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:30:06 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>, Kiran Gunda <kgunda@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC:     <subbaram@codeaurora.org>, <quic_fenglinw@quicinc.com>,
        <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH v2 05/10] spmi: pmic-arb: correct duplicate APID to PPID mapping logic
Date:   Tue, 19 Oct 2021 13:29:16 +0800
Message-ID: <1634621361-17155-6-git-send-email-quic_fenglinw@quicinc.com>
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

From: David Collins <collinsd@codeaurora.org>

Correct the way that duplicate PPID mappings are handled for PMIC
arbiter v5.  The final APID mapped to a given PPID should be the
one which has write owner = APPS EE, if it exists, or if not
that, then the first APID mapped to the PPID, if it exists.

Fixes: 40f318f0ed67 ("spmi: pmic-arb: add support for HW version 5")
Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 127a427..011044e 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -925,7 +925,8 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb *pmic_arb)
 	 * version 5, there is more than one APID mapped to each PPID.
 	 * The owner field for each of these mappings specifies the EE which is
 	 * allowed to write to the APID.  The owner of the last (highest) APID
-	 * for a given PPID will receive interrupts from the PPID.
+	 * which has the IRQ owner bit set for a given PPID will receive
+	 * interrupts from the PPID.
 	 */
 	for (i = 0; ; i++, apidd++) {
 		offset = pmic_arb->ver_ops->apid_map_offset(i);
@@ -948,16 +949,16 @@ static int pmic_arb_read_apid_map_v5(struct spmi_pmic_arb *pmic_arb)
 		apid = pmic_arb->ppid_to_apid[ppid] & ~PMIC_ARB_APID_VALID;
 		prev_apidd = &pmic_arb->apid_data[apid];
 
-		if (valid && is_irq_ee &&
-				prev_apidd->write_ee == pmic_arb->ee) {
+		if (!valid || apidd->write_ee == pmic_arb->ee) {
+			/* First PPID mapping or one for this EE */
+			pmic_arb->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
+		} else if (valid && is_irq_ee &&
+			   prev_apidd->write_ee == pmic_arb->ee) {
 			/*
 			 * Duplicate PPID mapping after the one for this EE;
 			 * override the irq owner
 			 */
 			prev_apidd->irq_ee = apidd->irq_ee;
-		} else if (!valid || is_irq_ee) {
-			/* First PPID mapping or duplicate for another EE */
-			pmic_arb->ppid_to_apid[ppid] = i | PMIC_ARB_APID_VALID;
 		}
 
 		apidd->ppid = ppid;
-- 
2.7.4

