Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BDDCE3D0685
	for <lists+linux-arm-msm@lfdr.de>; Wed, 21 Jul 2021 03:43:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231201AbhGUBDC (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 20 Jul 2021 21:03:02 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:41017 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230451AbhGUBCa (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 20 Jul 2021 21:02:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626831787; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=mtzWCbrz+cE9oYupzBvuDqsFyd7ZcoJ86HtTVGOmLiE=; b=NwBcS0ydd9ApUPSgBeUru+aMnzq99wBSLtQf9bG+8XUhaP5xsSm2orChGjJbHQ48MQY4jJrd
 MkRxNBWFqc7N8256dWs6dSytCSKpC+IaP8IWrJNyLtXwtuKQMtn2TWmv9FV3RKerMNuhnv4u
 dufVVtfbA64rvFvo0Nz0riC3n98=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60f77baae31d882d189c2841 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 21 Jul 2021 01:43:06
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F483C4338A; Wed, 21 Jul 2021 01:43:06 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 46699C433D3;
        Wed, 21 Jul 2021 01:43:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 46699C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     bqiang@codeaurora.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, clew@codeaurora.org,
        linux-kernel@vger.kernel.org, Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH] net: qrtr: mhi: synchronize qrtr and mhi preparation
Date:   Tue, 20 Jul 2021 18:42:58 -0700
Message-Id: <1626831778-31796-1-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

A dl callback can be received anytime after mhi_prepare_for_transfer
has been called. There is a window where the callback may happen
before the probe initializes the qrtr_mhi_dev state. Move the
mhi_prepare_for_transfer call after the registering the endpoint.

Once moved, the reverse can happen where qrtr will try to send a packet
before the channels are prepared. Add a wait in the sending path to
ensure the channels are prepared before trying to do a ul transfer.

Fixes: a2e2cc0dbb11 ("net: qrtr: Start MHI channels during init")
Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 net/qrtr/mhi.c | 20 +++++++++++++++-----
 1 file changed, 15 insertions(+), 5 deletions(-)

diff --git a/net/qrtr/mhi.c b/net/qrtr/mhi.c
index 29b4fa3..22b0395 100644
--- a/net/qrtr/mhi.c
+++ b/net/qrtr/mhi.c
@@ -15,6 +15,7 @@ struct qrtr_mhi_dev {
 	struct qrtr_endpoint ep;
 	struct mhi_device *mhi_dev;
 	struct device *dev;
+	struct completion ready;
 };
 
 /* From MHI to QRTR */
@@ -50,6 +51,10 @@ static int qcom_mhi_qrtr_send(struct qrtr_endpoint *ep, struct sk_buff *skb)
 	struct qrtr_mhi_dev *qdev = container_of(ep, struct qrtr_mhi_dev, ep);
 	int rc;
 
+	rc = wait_for_completion_interruptible(&qdev->ready);
+	if (rc)
+		goto free_skb;
+
 	if (skb->sk)
 		sock_hold(skb->sk);
 
@@ -78,11 +83,6 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	struct qrtr_mhi_dev *qdev;
 	int rc;
 
-	/* start channels */
-	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
-	if (rc)
-		return rc;
-
 	qdev = devm_kzalloc(&mhi_dev->dev, sizeof(*qdev), GFP_KERNEL);
 	if (!qdev)
 		return -ENOMEM;
@@ -90,12 +90,22 @@ static int qcom_mhi_qrtr_probe(struct mhi_device *mhi_dev,
 	qdev->mhi_dev = mhi_dev;
 	qdev->dev = &mhi_dev->dev;
 	qdev->ep.xmit = qcom_mhi_qrtr_send;
+	init_completion(&qdev->ready);
 
 	dev_set_drvdata(&mhi_dev->dev, qdev);
 	rc = qrtr_endpoint_register(&qdev->ep, QRTR_EP_NID_AUTO);
 	if (rc)
 		return rc;
 
+	/* start channels */
+	rc = mhi_prepare_for_transfer(mhi_dev, MHI_CH_INBOUND_ALLOC_BUFS);
+	if (rc) {
+		qrtr_endpoint_unregister(&qdev->ep);
+		dev_set_drvdata(&mhi_dev->dev, NULL);
+		return rc;
+	}
+
+	complete_all(&qdev->ready);
 	dev_dbg(qdev->dev, "Qualcomm MHI QRTR driver probed\n");
 
 	return 0;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

