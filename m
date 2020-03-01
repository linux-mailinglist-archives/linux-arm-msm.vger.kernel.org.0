Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8EAFB174CB6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  1 Mar 2020 11:11:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725874AbgCAKL3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 1 Mar 2020 05:11:29 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:53874 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725812AbgCAKL3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 1 Mar 2020 05:11:29 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583057488; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=TSnT8ymBeOGKKOS4ov8wXtM4tWGQw5Wy3vUWOVysF9M=; b=tJcRZoBMY7VHTjlUMPvB9WvBRekue9naGypJX2rDxuKAdvtAqF65yWN3pPraVSkGKgFeGsIU
 YIV5HD00kTPMhiF+/FczMG0c5oshbwyEWigj7VSmX3l3htxjlbRhc+24tcvPQjJPpw+QAuZw
 Az/3PVkR0gzig530CBdu1WAhKYA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5b8a4d.7f7ab4dd1260-smtp-out-n02;
 Sun, 01 Mar 2020 10:11:25 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D1215C4479F; Sun,  1 Mar 2020 10:11:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from rocky-Inspiron-7590.qca.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rjliao)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 70016C43383;
        Sun,  1 Mar 2020 10:11:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 70016C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=rjliao@codeaurora.org
From:   Rocky Liao <rjliao@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        bgodavar@codeaurora.org, Rocky Liao <rjliao@codeaurora.org>
Subject: [PATCH v1] Bluetooth: btqca: Fix the NVM baudrate tag offcet for wcn3991
Date:   Sun,  1 Mar 2020 18:11:19 +0800
Message-Id: <20200301101119.5867-1-rjliao@codeaurora.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The baudrate set byte of wcn3991 in the NVM tag is byte 1, not byte 2.
This patch will set correct byte for wcn3991.

Signed-off-by: Rocky Liao <rjliao@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index ec69e5dd7bd3..a16845c0751d 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -139,7 +139,7 @@ int qca_send_pre_shutdown_cmd(struct hci_dev *hdev)
 EXPORT_SYMBOL_GPL(qca_send_pre_shutdown_cmd);
 
 static void qca_tlv_check_data(struct qca_fw_config *config,
-				const struct firmware *fw)
+		const struct firmware *fw, enum qca_btsoc_type soc_type)
 {
 	const u8 *data;
 	u32 type_len;
@@ -148,6 +148,7 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 	struct tlv_type_hdr *tlv;
 	struct tlv_type_patch *tlv_patch;
 	struct tlv_type_nvm *tlv_nvm;
+	uint8_t nvm_baud_rate = config->user_baud_rate;
 
 	tlv = (struct tlv_type_hdr *)fw->data;
 
@@ -216,7 +217,10 @@ static void qca_tlv_check_data(struct qca_fw_config *config,
 				tlv_nvm->data[0] |= 0x80;
 
 				/* UART Baud Rate */
-				tlv_nvm->data[2] = config->user_baud_rate;
+				if (soc_type == QCA_WCN3991)
+					tlv_nvm->data[1] = nvm_baud_rate;
+				else
+					tlv_nvm->data[2] = nvm_baud_rate;
 
 				break;
 
@@ -354,7 +358,7 @@ static int qca_download_firmware(struct hci_dev *hdev,
 		return ret;
 	}
 
-	qca_tlv_check_data(config, fw);
+	qca_tlv_check_data(config, fw, soc_type);
 
 	segment = fw->data;
 	remain = fw->size;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project
