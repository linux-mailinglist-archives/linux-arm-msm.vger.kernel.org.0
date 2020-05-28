Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5DF711E6C93
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 22:31:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407281AbgE1Ubb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 16:31:31 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:52178 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2407143AbgE1Uba (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 16:31:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590697890; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=UQh3+K1vHOMTfx8eoXl36wopXtjJpVYLPWyxt6j7a1M=; b=iwe4+JlqWBvrVO5t2QO6sSxu/NVGW9feH0Dgp41jBwsZ12WKjg09Kk1sjR+w5sg0Oc2d3GHS
 5pdYM1l11J6QuBXyqxKwXhazi47yxJoE8CQWgC18pO5t/WHguKI1G4ayP9hwYwZ7KfZ9Yen1
 hPg15uZvSJAd5EWaMEIl92lcuTI=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5ed01f96c28b2cdd98298d3c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 20:31:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 8BC3AC43395; Thu, 28 May 2020 20:31:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26E1AC433C9;
        Thu, 28 May 2020 20:31:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26E1AC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org, stable@kernel.org,
        tientzu@chromium.org
Subject: [PATCH v2] bluetooth: hci_qca: Fix suspend/resume functionality failure
Date:   Fri, 29 May 2020 04:31:07 +0800
Message-Id: <1590697867-7618-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

@dev parameter of qca_suspend()/qca_resume() represents
serdev_device, but it is mistook for hci_dev and causes
succedent unexpected memory access.

Fix by taking @dev as serdev_device.

Fixes: 41d5b25fed0 ("Bluetooth: hci_qca: add PM support")
Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
Changes in v2:
- remove unused variable @hdev

 drivers/bluetooth/hci_qca.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index e4a6823..adcbe00 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1977,8 +1977,9 @@ static void qca_serdev_remove(struct serdev_device *serdev)
 
 static int __maybe_unused qca_suspend(struct device *dev)
 {
-	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
-	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
 	struct qca_data *qca = hu->priv;
 	unsigned long flags;
 	int ret = 0;
@@ -2057,8 +2058,9 @@ static int __maybe_unused qca_suspend(struct device *dev)
 
 static int __maybe_unused qca_resume(struct device *dev)
 {
-	struct hci_dev *hdev = container_of(dev, struct hci_dev, dev);
-	struct hci_uart *hu = hci_get_drvdata(hdev);
+	struct serdev_device *serdev = to_serdev_device(dev);
+	struct qca_serdev *qcadev = serdev_device_get_drvdata(serdev);
+	struct hci_uart *hu = &qcadev->serdev_hu;
 	struct qca_data *qca = hu->priv;
 
 	clear_bit(QCA_SUSPENDING, &qca->flags);
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

