Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A535A4588BB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Nov 2021 06:06:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230450AbhKVFJd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Nov 2021 00:09:33 -0500
Received: from alexa-out.qualcomm.com ([129.46.98.28]:18068 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbhKVFJ1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Nov 2021 00:09:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1637557582; x=1669093582;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=XxDLogurrd64PyV/Br9ijusB7AfPa557JX+rPbEfBFw=;
  b=eCZRKhpF2TdtZ2/KQOTTnc3UsCr1SKCNZPWgWqO/Z5ZPZC7p3qWJScJY
   IymD+Vcgv0sLjEeTrQ/H05RjmhpWAaJnCxEbgWu5m1CYtqPcVK9jzUqqn
   VBpPrU5urq5Rnu5jGyk3FgRPjKZtHnp7vfy3ajw7ap3xGGKeDEDs6p9N9
   w=;
Received: from ironmsg-lv-alpha.qualcomm.com ([10.47.202.13])
  by alexa-out.qualcomm.com with ESMTP; 21 Nov 2021 21:06:18 -0800
X-QCInternal: smtphost
Received: from nasanex01c.na.qualcomm.com ([10.47.97.222])
  by ironmsg-lv-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2021 21:06:17 -0800
Received: from nalasex01a.na.qualcomm.com (10.47.209.196) by
 nasanex01c.na.qualcomm.com (10.47.97.222) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:17 -0800
Received: from hyiwei-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.922.19; Sun, 21 Nov 2021 21:06:13 -0800
From:   Huang Yiwei <quic_hyiwei@quicinc.com>
To:     <agross@kernel.org>, <bjorn.andersson@linaro.org>,
        <mani@kernel.org>, <jassisinghbrar@gmail.com>, <robh+dt@kernel.org>
CC:     <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <quic_psodagud@quicinc.com>,
        <quic_tsoni@quicinc.com>, <quic_aiquny@quicinc.com>,
        <quic_eberman@quicinc.com>, Huang Yiwei <quic_hyiwei@quicinc.com>
Subject: [PATCH 3/4] mailbox: qcom-ipcc: Support interrupt wake up from suspend
Date:   Mon, 22 Nov 2021 13:05:08 +0800
Message-ID: <20211122050509.5979-4-quic_hyiwei@quicinc.com>
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

Use IRQF_NO_SUSPEND flag instead of enable_irq_wake to
support interrupt wake up from suspend.

Signed-off-by: Huang Yiwei <quic_hyiwei@quicinc.com>
---
 drivers/mailbox/qcom-ipcc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mailbox/qcom-ipcc.c b/drivers/mailbox/qcom-ipcc.c
index e80aaf83a089..c5d963222014 100644
--- a/drivers/mailbox/qcom-ipcc.c
+++ b/drivers/mailbox/qcom-ipcc.c
@@ -289,13 +289,12 @@ static int qcom_ipcc_probe(struct platform_device *pdev)
 		goto err_mbox;
 
 	ret = devm_request_irq(&pdev->dev, ipcc->irq, qcom_ipcc_irq_fn,
-			       IRQF_TRIGGER_HIGH, name, ipcc);
+			       IRQF_TRIGGER_HIGH | IRQF_NO_SUSPEND, name, ipcc);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "Failed to register the irq: %d\n", ret);
 		goto err_req_irq;
 	}
 
-	enable_irq_wake(ipcc->irq);
 	platform_set_drvdata(pdev, ipcc);
 
 	return 0;
-- 
2.17.1

