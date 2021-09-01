Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1DCBE3FD537
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Sep 2021 10:21:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243101AbhIAIU1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Sep 2021 04:20:27 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:35787 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243129AbhIAIUW (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Sep 2021 04:20:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1630484366; x=1662020366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OtSq+ort8B4nCsCM1w2vsb0LnoZeXWiSQQkCUckld2I=;
  b=ZkkcJdhgi5GsnCKPtyJpsznxhoW6peAMwLJrcHK+OTcF3B/qVUKVdLvi
   ncHNjtXGnJPd9Nd+1u1ovkVDGKmUkftsRLOOtLWeKCFcxDFM9dfn1eZEC
   Ts3rd/KzV0hyzAq2nuk5odqLaVe2aORMdAc0ajpFXAXKwdNCuFLs1OvEA
   U=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 01 Sep 2021 01:19:25 -0700
X-QCInternal: smtphost
Received: from nalasex01c.na.qualcomm.com ([10.47.97.35])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Sep 2021 01:19:25 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Wed, 1 Sep 2021 01:19:22 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 6/9] spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
Date:   Wed, 1 Sep 2021 16:18:07 +0800
Message-ID: <1630484290-28190-7-git-send-email-quic_fenglinw@quicinc.com>
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
2.7.4

