Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DB70B85E35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Aug 2019 11:26:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732076AbfHHJ0N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 8 Aug 2019 05:26:13 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:45730 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732015AbfHHJ0N (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 8 Aug 2019 05:26:13 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 062FC6076C; Thu,  8 Aug 2019 09:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565256372;
        bh=qW0uP162zlYE8xU1hw5SqjXMNqEdcyrHvoeLU0oMTIA=;
        h=From:To:Cc:Subject:Date:From;
        b=mMu35nz54piFBL/h67jSWXUdpMIk6mArY6CO8JMhrLCW/FVMLQ3I/FS4qUM8W6VGa
         SweaxcPBnKc2nI5hQVDMW9P48/3XpTTBQ4tfEIL4dj6XPVhG2FNtiUiixas42UCPfd
         voMCfJajwE+xUS9GL3GErW4Vcf55sj1jaDgWfLmE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from c-hbandi-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: c-hbandi@codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6E622602FC;
        Thu,  8 Aug 2019 09:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1565256370;
        bh=qW0uP162zlYE8xU1hw5SqjXMNqEdcyrHvoeLU0oMTIA=;
        h=From:To:Cc:Subject:Date:From;
        b=N/T9SlauS1Yj35CIxdcCCsSm4nIgzMx+f+mgSd81XlVpsniBmWeHGNTjPZyp32KGU
         Wrq55hHNH+KFqlBlxuidorCissNbveydEgzH6wIY/nr0Ql+HXCv93jqv5dsoPpdJFu
         uylbDGuOkonN+0/kTBprnW1FdYkxUAWGtUK+HhWw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6E622602FC
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=c-hbandi@codeaurora.org
From:   Harish Bandi <c-hbandi@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        anubhavg@codeaurora.org, Harish Bandi <c-hbandi@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: wait for Pre shutdown to command complete event before sending the Power off pulse
Date:   Thu,  8 Aug 2019 14:55:53 +0530
Message-Id: <1565256353-4476-1-git-send-email-c-hbandi@codeaurora.org>
X-Mailer: git-send-email 1.9.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

When SoC receives pre shut down command, it share the same
with other COEX shared clients. So SoC needs a short
time after sending VS pre shutdown command before
turning off the regulators and sending the power off pulse.

Signed-off-by: Harish Bandi <c-hbandi@codeaurora.org>
---
 drivers/bluetooth/btqca.c   | 5 +++--
 drivers/bluetooth/hci_qca.c | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 2221935..f20991e 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -106,8 +106,9 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 
 	bt_dev_dbg(hdev, "QCA pre shutdown cmd");
 
-	skb = __hci_cmd_sync(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
-				NULL, HCI_INIT_TIMEOUT);
+	skb = __hci_cmd_sync_ev(hdev, QCA_PRE_SHUTDOWN_CMD, 0,
+				NULL, HCI_EV_CMD_COMPLETE, HCI_INIT_TIMEOUT);
+
 	if (IS_ERR(skb)) {
 		err = PTR_ERR(skb);
 		bt_dev_err(hdev, "QCA preshutdown_cmd failed (%d)", err);
diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 16db6c0..566aa28 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1386,6 +1386,8 @@ static int qca_power_off(struct hci_dev *hdev)
 	/* Perform pre shutdown command */
 	qca_send_pre_shutdown_cmd(hdev);
 
+	usleep_range(8000, 10000);
+
 	qca_power_shutdown(hu);
 	return 0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

