Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 056B940F267
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Sep 2021 08:33:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240998AbhIQGew (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 17 Sep 2021 02:34:52 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:56066 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235541AbhIQGes (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 17 Sep 2021 02:34:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1631860407; x=1663396407;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=OtSq+ort8B4nCsCM1w2vsb0LnoZeXWiSQQkCUckld2I=;
  b=vF/j250OwGzm9ZrGhC+UMnRewwnD3lN0fTplO5pr0VkcKeF3fP9eofJ+
   /QCaXfhKBnkdMgsr07gdifvHURoNYA9XdoS195TVRLAzZPxHHlMybmvwn
   aR5SwXoQlOwMDP+lQuaYSkMT9dAzbusYihR1SfLv+r0VjyFXCBcOTMi64
   M=;
Received: from ironmsg09-lv.qualcomm.com ([10.47.202.153])
  by alexa-out.qualcomm.com with ESMTP; 16 Sep 2021 23:33:26 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg09-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 23:33:26 -0700
Received: from fenglinw-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.922.7;
 Thu, 16 Sep 2021 23:33:24 -0700
From:   Fenglin Wu <quic_fenglinw@quicinc.com>
To:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <sboyd@kernel.org>
CC:     <collinsd@codeaurora.org>, <subbaram@codeaurora.org>,
        <quic_fenglinw@quicinc.com>
Subject: [RESEND PATCH v1 6/9] spmi: pmic-arb: block access for invalid PMIC arbiter v5 SPMI writes
Date:   Fri, 17 Sep 2021 14:33:01 +0800
Message-ID: <1631860384-26608-7-git-send-email-quic_fenglinw@quicinc.com>
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

