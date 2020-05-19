Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A71781D9927
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 May 2020 16:15:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729157AbgESOOv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 19 May 2020 10:14:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:44141 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729102AbgESOOu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 19 May 2020 10:14:50 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589897689; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Vyp+hEO5hf8GYwz6X2L6iMDXElho5JZfbOncmp0Trv4=; b=w+TeR55T0+0GaN95i6EXAwAvQ7vsFGM+wqCjwGt/jcWbvvyE2Di6fw9X4EyiRYHUvBTwF+5o
 DDk8PbVnoJTR8XGwa/92jtMWc90ng7fTl1cjuuNQYs/MICn6gob0TNu2SiKrD8t87zaS4AI9
 8aP3PTZKCQgvepSiIAZWg6vrDw8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ec3e9c6.7f128b2c29d0-smtp-out-n05;
 Tue, 19 May 2020 14:14:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2F81C44795; Tue, 19 May 2020 14:14:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 27ED0C43637;
        Tue, 19 May 2020 14:14:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 27ED0C43637
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC v2 PATCH 6/8] qaic: Implement PCI link status error handlers
Date:   Tue, 19 May 2020 08:14:03 -0600
Message-Id: <1589897645-17088-7-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
References: <1589897645-17088-1-git-send-email-jhugo@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Whenever the link goes down, the device loses all state.  Therefore, we
need to be aware of when the link goes down and comes back up so that
our state is kept in sync with the device.  Implement the PCI error
handlers to be notified of links tate changes.

Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
---
 drivers/misc/qaic/mhi_controller.c | 16 ++++++++++++++++
 drivers/misc/qaic/mhi_controller.h |  4 ++++
 drivers/misc/qaic/qaic_drv.c       | 29 +++++++++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/drivers/misc/qaic/mhi_controller.c b/drivers/misc/qaic/mhi_controller.c
index a667a2f..9ba74fc 100644
--- a/drivers/misc/qaic/mhi_controller.c
+++ b/drivers/misc/qaic/mhi_controller.c
@@ -495,3 +495,19 @@ void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
 	kfree(mhi_cntl->irq);
 	kfree(mhi_cntl);
 }
+
+void qaic_mhi_link_down(struct mhi_controller *mhi_cntl)
+{
+	mhi_power_down(mhi_cntl, false);
+}
+
+void qaic_mhi_link_up(struct mhi_controller *mhi_cntl)
+{
+	struct pci_dev *pci_dev = container_of(mhi_cntl->cntrl_dev,
+					       struct pci_dev, dev);
+	int ret;
+
+	ret = mhi_async_power_up(mhi_cntl);
+	if (ret)
+		pci_err(pci_dev, "mhi_async_power_up failed when link came back %d\n", ret);
+}
diff --git a/drivers/misc/qaic/mhi_controller.h b/drivers/misc/qaic/mhi_controller.h
index f5197f1..6dca59d 100644
--- a/drivers/misc/qaic/mhi_controller.h
+++ b/drivers/misc/qaic/mhi_controller.h
@@ -11,4 +11,8 @@ struct mhi_controller *qaic_mhi_register_controller(struct pci_dev *pci_dev,
 						    int mhi_irq);
 
 void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up);
+
+void qaic_mhi_link_down(struct mhi_controller *mhi_cntl);
+void qaic_mhi_link_up(struct mhi_controller *mhi_cntl);
+
 #endif /* MHICONTROLLERQAIC_H_ */
diff --git a/drivers/misc/qaic/qaic_drv.c b/drivers/misc/qaic/qaic_drv.c
index e548881..ac4315a 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -484,6 +484,28 @@ static void qaic_pci_remove(struct pci_dev *pdev)
 	kfree(qdev);
 }
 
+static pci_ers_result_t qaic_pci_error_detected(struct pci_dev *pdev,
+						enum pci_channel_state error)
+{
+	return PCI_ERS_RESULT_NEED_RESET;
+}
+
+static void qaic_pci_reset_prepare(struct pci_dev *pdev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	qaic_dev_reset_clean_local_state(qdev);
+	qaic_mhi_link_down(qdev->mhi_cntl);
+}
+
+static void qaic_pci_reset_done(struct pci_dev *pdev)
+{
+	struct qaic_device *qdev = pci_get_drvdata(pdev);
+
+	qdev->in_reset = false;
+	qaic_mhi_link_up(qdev->mhi_cntl);
+}
+
 static const struct mhi_device_id qaic_mhi_match_table[] = {
 	{ .chan = "QAIC_CONTROL", },
 	{},
@@ -507,11 +529,18 @@ static const struct pci_device_id ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, ids);
 
+static const struct pci_error_handlers qaic_pci_err_handler = {
+	.error_detected = qaic_pci_error_detected,
+	.reset_prepare = qaic_pci_reset_prepare,
+	.reset_done = qaic_pci_reset_done,
+};
+
 static struct pci_driver qaic_pci_driver = {
 	.name = KBUILD_MODNAME,
 	.id_table = ids,
 	.probe = qaic_pci_probe,
 	.remove = qaic_pci_remove,
+	.err_handler = &qaic_pci_err_handler,
 };
 
 static int __init qaic_init(void)
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
