Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79A044588B6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 06:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229809AbhKVFJT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 00:09:19 -0500
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:63255 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230304AbhKVFJT (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 00:09:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637557573; x=1669093573;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=/jTUHmgVqsrh9MYZ6GClmBYhC00riUxG5NWrdNJ8hSE=;
  b=hO8Fwb+MnXw1de20J9XIMvJVy+gT0SqoVkuRDp2T0OlhZcld2O3FIfdX
   YVI9VxE91E602sTHsc5bwr5WZY6yyqxznpa83k2a33h2uCXFtOfGiPrPs
   /GwX10MkIs5VceuMjOFkWzMcdszpD6e7u22qx/Ujz702KLZqJchb91jS7
   Y=;
Received: from unknown (HELO ironmsg02-sd.qualcomm.com) ([10.53.140.142])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 21 Nov 2021 21:06:13 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg02-sd.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 21:06:11 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:10 -0800
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:07 -0800
From:   Huang Yiwei <quic_hyiwei@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mani@kernel.org>, <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_eberman@quicinc.com>, Huang Yiwei <quic_hyiwei@quicinc.com>
Subject: [PATCH 2/4] mailbox: qcom-ipcc: Support more IPCC instance
Date:   Mon, 22 Nov 2021 13:05:07 +0800
Message-ID: <20211122050509.5979-3-quic_hyiwei@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211122050509.5979-1-quic_hyiwei@quicinc.com>
References: <20211122050509.5979-1-quic_hyiwei@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Since hardware is supporting multiple IPCC instance,
use ipcc_%d instead of ipcc as the irq name to support
in driver.

Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
---
 drivers/mailbox/qcom-ipcc.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index 10cb0b546109..e80aaf83a089 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -257,6 +257,8 @@ static int qcom_ipcc_setup_mbox(struct qcom_ipcc *ipcc,
 static int qcom_ipcc_probe(struct platform_device *pdev)
 {
 	struct qcom_ipcc *ipcc;
+	static int id;
+	char *name;
 	int ret;
 
 	ipcc = devm_kzalloc(&pdev->dev, sizeof(*ipcc), GFP_KERNEL);
@@ -273,6 +275,10 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 	if (ipcc->irq < 0)
 		return ipcc->irq;
 
+	name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "ipcc_%d", id++);
+	if (!name)
+		return -ENOMEM;
+
 	ipcc->irq_domain = irq_domain_add_tree(pdev->dev.of_node,
 					       &qcom_ipcc_irq_ops, ipcc);
 	if (!ipcc->irq_domain)
@@ -283,7 +289,7 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 		goto err_mbox;
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
-			       IRQF_TRIGGER_HIGH, "ipcc", ipcc);
+			       IRQF_TRIGGER_HIGH, name, ipcc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
 		goto err_req_irq;
-- 
2.17.1

