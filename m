Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7C9D1E5D45
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 12:38:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387846AbgE1Kif (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 06:38:35 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:14171 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2387950AbgE1Kie (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 06:38:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590662313; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=W+PLB8yTgdEMHV27WJ3DIjLDjSUejKal5HqUAeoVY74=; b=ljCuJkvBPK7W0C4gqs8xtJ/MDv4LjOjeyOndZFydx6ZEo5o0pbwmOs3A5DzNALki3cgYFr/R
 rVEfLBGWePCCew8fVlvA14C574n0CV5EY5ar6k9ctpngFV5qahbt4pDfpcCwuZJ6BqrqOxwL
 pxYwOJrFvzaP8UmXlkUxO80RUKc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ecf94a737a454afcbe55612 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 10:38:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A3467C43387; Thu, 28 May 2020 10:38:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAC38C433CA;
        Thu, 28 May 2020 10:38:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAC38C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v1] bluetooth: hci_qca: Fix suspend/resume functionality failure
Date:   Thu, 28 May 2020 18:38:22 +0800
Message-Id: <1590662302-10102-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

@dev parameter of qca_suspend()/qca_resume() represents
serdev_device, but it is mistook for hci_dev and causes
succedent unexpected memory access.

Fix by taking @dev as serdev_device.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a6823..c159161 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1977,8 +1977,10 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 
 static int __maybe_unused qca_suspend(struct device *dev)
 {
-	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
-	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
+	struct hci_dev *hdev __maybe_unused = hu->hdev;
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
 	int ret = 0;
@@ -2057,8 +2059,10 @@ static int __maybe_unused qca_suspend(struct device *dev)
 
 static int __maybe_unused qca_resume(struct device *dev)
 {
-	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
-	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
+	struct hci_dev *hdev __maybe_unused = hu->hdev;
 	struct qca_data *qca = hu->priv;
 
 	clear_bit(QCA_SUSPENDING, &qca->flags);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

