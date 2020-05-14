Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4AFFA1D323C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 14 May 2020 16:10:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgENOIo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 14 May 2020 10:08:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:37514 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727956AbgENOIo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 14 May 2020 10:08:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589465323; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=4N3Qgu7jkYHdJTEPxc6flfM5C9+ZWgywokKlAJopoq0=; b=lBw6RrqeGltw1Ch8d6Ih+IvwamIw11wfZK09ocxJ9YIlVs39W3uk+uMuNjza7zMTyV11nduo
 FUe2hIPYd5QmrcMaU7njcsZOH/+RdOUl41MEuwUFi+rtv+OCiJJzTZUntIwnVeNttckFv/FX
 mxro1MFERrdYOItlHv8P++bUUag=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebd50d9.7f1279b30308-smtp-out-n05;
 Thu, 14 May 2020 14:08:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1DDE5C44793; Thu, 14 May 2020 14:08:23 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jhugo-perf-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F01AAC072B5;
        Thu, 14 May 2020 14:08:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org F01AAC072B5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
From:   Jeffrey Hugo <jhugo@codeaurora.org>
To:     arnd@arndb.de, gregkh@linuxfoundation.org
Cc:     manivannan.sadhasivam@linaro.org, bjorn.andersson@linaro.org,
        wufan@codeaurora.org, pratanan@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>
Subject: [RFC PATCH 6/8] qaic: Implement PCI link status error handlers
Date:   Thu, 14 May 2020 08:07:44 -0600
Message-Id: <1589465266-20056-7-git-send-email-jhugo@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
References: <1589465266-20056-1-git-send-email-jhugo@codeaurora.org>
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
index ba4808c..18fc830 100644
--- a/drivers/misc/qaic/mhi_controller.c
+++ b/drivers/misc/qaic/mhi_controller.c
@@ -493,3 +493,19 @@ void qaic_mhi_free_controller(struct mhi_controller *mhi_cntl, bool link_up)
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
index c81725e..5eca586 100644
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
index 800769d..1c8eefd 100644
--- a/drivers/misc/qaic/qaic_drv.c
+++ b/drivers/misc/qaic/qaic_drv.c
@@ -558,6 +558,28 @@ static void qaic_pci_remove(struct pci_dev *pdev)
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
@@ -581,11 +603,18 @@ static const struct pci_device_id ids[] = {
 };
 MODULE_DEVICE_TABLE(pci, ids);
 
+static const struct pci_error_handlers qaic_pci_err_handler = {
+	.error_detected = qaic_pci_error_detected,
+	.reset_prepare = qaic_pci_reset_prepare,
+	.reset_done = qaic_pci_reset_done,
+};
+
 static struct pci_driver qaic_pci_driver = {
 	.name = QAIC_NAME,
 	.id_table = ids,
 	.probe = qaic_pci_probe,
 	.remove = qaic_pci_remove,
+	.err_handler = &qaic_pci_err_handler,
 };
 
 static int __init qaic_init(void)
-- 
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
