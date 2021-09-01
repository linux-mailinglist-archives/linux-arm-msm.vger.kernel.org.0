Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF28A3FD52E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 10:21:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243098AbhIAIUN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 04:20:13 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:37460 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229934AbhIAIUJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 04:20:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630484354; x=1662020354;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=tAnC1etYTMo3V+Modhj6QJR1D5QTZ5y6YOqeoMVCGsg=;
  b=jS5w6/ElxpWCozfSE1WX7S3HGPRpRY/HIRs2sDPCxNrDwqzowoZE+HBi
   G1bxj57rmPRG5DYpQkLI0FctxV1zStgomf5hgSRNKZBY1Xa7q7b68yk34
   Bu8QH9m18DOz2XqcQ0h8mCa9SxTSWP9PJxMhFKf58fnFgTCL/mfE6vzea
   8=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2021 01:19:13 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:19:12 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 1 Sep 2021 01:19:10 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>,
        Abhijeet Dharmapurikar <adharmap@codeaurora.org>
Subject: [RESEND PATCH v1 1/9] spmi: pmic-arb: add a print in cleanup_irq
Date:   Wed, 1 Sep 2021 16:18:02 +0800
Message-ID: <1630484290-28190-2-git-send-email-quic_fenglinw@quicinc.com>
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
2.7.4

