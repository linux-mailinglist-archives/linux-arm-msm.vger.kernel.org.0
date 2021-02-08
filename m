Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CFF02313F1A
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Feb 2021 20:36:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236277AbhBHTf0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Feb 2021 14:35:26 -0500
Received: from so15.mailgun.net ([198.61.254.15]:22418 "EHLO so15.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236242AbhBHTe3 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Feb 2021 14:34:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612812844; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=ekryDzh7CqtuJpTiAyGom8aL8IUPv2qJB5wkgaK5lQQ=; b=oeL6TENSwiMWk2qDFuyi6n/dhSwxAnotnzMLaD8h0wCOq97aPz2SCSafJeHXJZRE2/R1GKFU
 hr1acDJ8HuDAZ6px7J3IwnfqYSOY7CR0oIuJPgB3/moya07+tR0FOCX+pHRYgsX7buN5YY81
 nqBk74zaeYNgtfTSMehtVrrgI3Y=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6021920a81f6c45dceca36e3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 08 Feb 2021 19:33:30
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA063C43461; Mon,  8 Feb 2021 19:33:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from subbaram-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CCDCBC433CA;
        Mon,  8 Feb 2021 19:33:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CCDCBC433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org
Cc:     linux-arm-msm@vger.kernel.org,
        David Collins <collinsd@codeaurora.org>,
        Subbaraman Narayanamurthy <subbaram@codeaurora.org>,
        stable@vger.kernel.org
Subject: [PATCH] spmi: spmi-pmic-arb: Fix hw_irq overflow
Date:   Mon,  8 Feb 2021 11:33:04 -0800
Message-Id: <1612812784-26369-1-git-send-email-subbaram@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently, when handling the SPMI summary interrupt, the hw_irq
number is calculated based on SID, Peripheral ID, IRQ index and
APID. This is then passed to irq_find_mapping() to see if a
mapping exists for this hw_irq and if available, invoke the
interrupt handler. Since the IRQ index uses an "int" type, hw_irq
which is of unsigned long data type can take a large value when
SID has its MSB set to 1 and the type conversion happens. Because
of this, irq_find_mapping() returns 0 as there is no mapping
for this hw_irq. This ends up invoking cleanup_irq() as if
the interrupt is spurious whereas it is actually a valid
interrupt. Fix this by using the proper data type (u32) for id.

Cc: stable@vger.kernel.org
Signed-off-by: Subbaraman Narayanamurthy <subbaram@codeaurora.org>
---
 drivers/spmi/spmi-pmic-arb.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index de844b4..bbbd311 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
- * Copyright (c) 2012-2015, 2017, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2012-2015, 2017, 2021, The Linux Foundation. All rights reserved.
  */
 #include <linux/bitmap.h>
 #include <linux/delay.h>
@@ -505,8 +505,7 @@ static void cleanup_irq(struct spmi_pmic_arb *pmic_arb, u16 apid, int id)
 static void periph_interrupt(struct spmi_pmic_arb *pmic_arb, u16 apid)
 {
 	unsigned int irq;
-	u32 status;
-	int id;
+	u32 status, id;
 	u8 sid = (pmic_arb->apid_data[apid].ppid >> 8) & 0xF;
 	u8 per = pmic_arb->apid_data[apid].ppid & 0xFF;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

