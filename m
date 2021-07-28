Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BD273D86CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Jul 2021 06:31:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbhG1EbC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 28 Jul 2021 00:31:02 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:40665 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234563AbhG1EbB (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 28 Jul 2021 00:31:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1627446660; x=1658982660;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=vWwEvArIAhoutDVPC+RAhs2Lierm8rahTWWjKXhsZnw=;
  b=gadEFcW8dmkUd5jPQyHUvaIi5M/Br5sBw7bBieGKusEfcGE2yJRoA+0T
   YPIMegIcA9oA0pohGqp14IsNddBsK3WUTV1YOok8IE9icqd4W6TZnvT3n
   D1bKjGyT2kM0o+AhKRrTeDltePTTbZCpn4sPItRinLAFsvmZ1UWaeGNXj
   g=;
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 27 Jul 2021 21:31:00 -0700
X-QCInternal: smtphost
Received: from nasanexm03e.na.qualcomm.com ([10.85.0.48])
  by ironmsg03-sd.qualcomm.com with ESMTP/TLS/AES256-SHA; 27 Jul 2021 21:31:00 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nasanexm03e.na.qualcomm.com (10.85.0.48) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Tue, 27 Jul 2021 21:30:58 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Stephen Boyd" <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [spmi-pmic-arb fixes and optimization patches V1 9/9] spmi: pmic-arb: increase SPMI transaction timeout delay
Date:   Wed, 28 Jul 2021 12:30:09 +0800
Message-ID: <1627446609-9064-10-git-send-email-quic_fenglinw@quicinc.com>
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

Increase the SPMI transaction timeout delay from 100 us to
1000 us in order to account for the slower execution time
found on some simulator targets.

Signed-off-by: David Collins <collinsd@codeaurora.org>
Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
---
 drivers/spmi/spmi-pmic-arb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spmi/spmi-pmic-arb.c b/drivers/spmi/spmi-pmic-arb.c
index 55fa981..08c2566 100644
--- a/drivers/spmi/spmi-pmic-arb.c
+++ b/drivers/spmi/spmi-pmic-arb.c
@@ -91,7 +91,7 @@ enum pmic_arb_channel {
 
 /* Maximum number of support PMIC peripherals */
 #define PMIC_ARB_MAX_PERIPHS		512
-#define PMIC_ARB_TIMEOUT_US		100
+#define PMIC_ARB_TIMEOUT_US		1000
 #define PMIC_ARB_MAX_TRANS_BYTES	(8)
 
 #define PMIC_ARB_APID_MASK		0xFF
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project.

