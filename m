Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74A30432D2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Oct 2021 07:30:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233717AbhJSFc1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 Oct 2021 01:32:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:20543 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233499AbhJSFcX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 Oct 2021 01:32:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1634621411; x=1666157411;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=2IhHWawDAYdH6lOcFna7YgAD3zdF+l6ddoaFvmouqmY=;
  b=qszHDjlLdaNPfAv7wUtB96Jw9mIC3ETVzcpYcBO2dL9Sd25HyxUHjj4K
   RadSgUzpcNY92E755gh171PfZez3XTo2Q33Slbh73HhnxD3tL/WLQzMDo
   wlhP9qR+NH5O0jMscyLC/coxEFfJ7PuSo7BD2KxAslWY+U1cDio6TBeoJ
   I=;
Received: from ironmsg07-lv.qualcomm.com ([10.47.202.151])
  by alexa-out.qualcomm.com with ESMTP; 18 Oct 2021 22:30:11 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg07-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2021 22:30:11 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Mon, 18 Oct 2021 22:30:09 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>, <tglx@linutronix.de>, <maz@kernel.org>
Subject: [PATCH v2 06/10] spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
Date:   Tue, 19 Oct 2021 13:29:17 +0800
Message-ID: <1634621361-17155-7-git-send-email-quic_fenglinw@quicinc.com>
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

The system crashes due to an access permission violation when
writing to a PMIC peripheral which is not owned by the current
ee.  Add a check for PMIC arbiter version 5 for such invalid
write requests and return an error instead of crashing the
system.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 011044e..e83342a 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1027,6 +1027,11 @@ static int pmic_arb_offset_v5(struct spmi_pmic_arb *pmic_arb, u8 sid, u16 addr,
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
2.7.4

