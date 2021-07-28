Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 261453D86C6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 06:30:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234433AbhG1Eaz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 00:30:55 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:35713 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234507AbhG1Eay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 00:30:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627446653; x=1658982653;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=xMDIxzoEbq0aPJ2fBtVchMgpbiMzY/BXvnlgZEBdY1I=;
  b=plk8wap3M+QxePtjLSKZ1dqBtYp6y+sGh7/KB5I7nCZLLs18VbM2yB6W
   6l7ooWlDkNcHn2zWwhSHhatBg2kLQualQgSVj28PcCuxVDHxyEWFz/nqe
   LR3rdoCTWGaDouKfrtkOLSHqIp6D4DmCloCby3ZhPC9uj0povNbSQ02Tc
   4=;
Received: from unknown (HELO ironmsg05-sd.qualcomm.com) ([10.53.140.145])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jul 2021 21:30:53 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg05-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Jul 2021 21:30:53 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 27 Jul 2021 21:30:51 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [spmi-pmic-arb fixes and optimization patches V1 6/9] spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
Date:   Wed, 28 Jul 2021 12:30:06 +0800
Message-ID: <1627446609-9064-7-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1627446609-9064-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1627446609-9064-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03g.na.qualcomm.com (10.85.0.49) To
 nasanexm03e.na.qualcomm.com (10.85.0.48)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: David Collins <collinsd@codeaurora.org>

The system crashes due to an access permission violation when
writing to a PMIC peripheral which is not owned by the current
ee.  Add a check for PMIC arbiter version 5 for such invalid
write requests and return an error instead of crashing the
system.

Signed-off-by: David Collins <collinsd@codeaurora.org>
---
 drivers/spmi/spmi-pmic-arb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index f1b72d8..9239830 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1020,6 +1020,11 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
 		offset = 0x10000 * pmic_arb->ee + 0x80 * apid;
 		break;
 	case PMIC_ARB_CHANNEL_RW:
+		if (pmic_arb->apid_data[apid].write_ee != pmic_arb->ee) {
+			dev_err(&pmic_arb->spmic->dev, "disallowed SPMI write to sid=%u, addr=0x%04X\n",
+				sid, addr);
+			return -EPERM;
+		}
 		offset = 0x10000 * apid;
 		break;
 	}
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

