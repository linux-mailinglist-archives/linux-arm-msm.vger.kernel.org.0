Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F09B61746C4
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Feb 2020 13:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726960AbgB2MVf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Feb 2020 07:21:35 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:35350 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726975AbgB2MVf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Feb 2020 07:21:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582978894; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=F+eBibJf30Bv3cARm/2DH87+INk27P5oe4prBrGPe0c=; b=grM+JV0QxYW69C3bgwkFS272d5NkR5a2IOiG17FO/Q+0G++S8VYpM73vbzKiyUdQeoSLR2Li
 DoSsOB0jNg20B3t/RA/GH7Fz3v/ktQof6LB6G9sPPpp32Om37NHmMz8Kit/lPJGjaoR+zFer
 kph0c427n0U7+EbgK0JLkNwdw7Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5a5746.7fabc861f6c0-smtp-out-n01;
 Sat, 29 Feb 2020 12:21:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 45AF3C4479F; Sat, 29 Feb 2020 12:21:26 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 925E2C43383;
        Sat, 29 Feb 2020 12:21:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 925E2C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Not send vendor pre-shutdown command for QCA Rome
Date:   Sat, 29 Feb 2020 20:21:18 +0800
Message-Id: <20200229122118.26662-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

QCA Rome doesn't support the pre-shutdown vendor hci command, this patch
will check the soc type in qca_power_off() and only send this command
for wcn399x.

Fixes: ae563183b647 ("Bluetooth: hci_qca: Enable power off/on support during hci down/up for QCA Rome")
Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 1e4d6118d9bf..bf436d6e638e 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -1759,9 +1759,11 @@ static int qca_power_off(struct hci_dev *hdev)
 {
 	struct hci_uart *hu = hci_get_drvdata(hdev);
 	struct qca_data *qca = hu->priv;
+	enum qca_btsoc_type soc_type = qca_soc_type(hu);
 
 	/* Stop sending shutdown command if soc crashes. */
-	if (qca->memdump_state == QCA_MEMDUMP_IDLE) {
+	if (qca_is_wcn399x(soc_type)
+		&& qca->memdump_state == QCA_MEMDUMP_IDLE) {
 		qca_send_pre_shutdown_cmd(hdev);
 		usleep_range(8000, 10000);
 	}
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
