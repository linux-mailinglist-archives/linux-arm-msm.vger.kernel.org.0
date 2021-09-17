Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B656040F269
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244245AbhIQGe7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:34:59 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:63132 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243221AbhIQGez (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860414; x=1663396414;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/rJWYNLEshjtrC1IGOED6acbfsbHHmLBFIvrAeJEFiI=;
  b=MBdthKwijV/pCdARgBtZf1ISGQD2aAokrM7eNebH0XWYi3g5COTWyNBe
   k90HDMLvmZ8JZ3h42lzDPrq76nDYX6meNCNUyzYVihlVGJcniUJid79E0
   YPKOUhcKsX7QDk9StiJnB8jaErF3s28FzWYpYllwq2ukXa3zwCxVfJOHo
   A=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:34 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:34 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:31 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 9/9] spmi: pmic-arb: increase SPMI transaction timeout delay
Date:   Fri, 17 Sep 2021 14:33:04 +0800
Message-ID: <1631860384-26608-10-git-send-email-quic_fenglinw@quicinc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
References: <1631860384-26608-1-git-send-email-quic_fenglinw@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
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
2.7.4

