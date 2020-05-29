Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 867B41E80BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 29 May 2020 16:46:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726905AbgE2OqY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 29 May 2020 10:46:24 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:33518 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726999AbgE2OqX (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 29 May 2020 10:46:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590763583; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=5zi+dHY2H+udPHk6hvdgwxKhHZOYwiTIbkrPlGN9DOA=; b=fCrrqSTglm0w8NajSLSgiBNUyFHkQj5aDGUCUn4Bsa+AcZ7yUL3083y8oU2pqoemZxNbhC25
 xeSvnkShODRemp0ILwDvb1RfLXyZ/GzzYxq7EOcNI25sgJvs/QjKH37mt6wTa7T9r685dr3w
 +7xDcRfpwqmhgTwbalh1CBFieNY=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5ed1203eb4f0a9ae22e9c774 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 29 May 2020 14:46:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9E37BC43387; Fri, 29 May 2020 14:46:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EA227C433C9;
        Fri, 29 May 2020 14:46:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EA227C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v4] Bluetooth: hci_qca: Improve controller ID info log level
Date:   Fri, 29 May 2020 22:46:13 +0800
Message-Id: <1590763573-8302-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Controller ID info got by VSC EDL_PATCH_GETVER is very
important, so improve its log level from DEBUG to INFO.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
Changes in v4:
- correct coding style of qca_read_soc_version()

Changes in v3:
- correct coding style

Changes in v2:
- adjust controller ID info print order

 drivers/bluetooth/btqca.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 3ea866d44568..5629e2c80b97 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -74,17 +74,21 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 
 	ver = (struct qca_btsoc_version *)(edl->data);
 
-	BT_DBG("%s: Product:0x%08x", hdev->name, le32_to_cpu(ver->product_id));
-	BT_DBG("%s: Patch  :0x%08x", hdev->name, le16_to_cpu(ver->patch_ver));
-	BT_DBG("%s: ROM    :0x%08x", hdev->name, le16_to_cpu(ver->rom_ver));
-	BT_DBG("%s: SOC    :0x%08x", hdev->name, le32_to_cpu(ver->soc_id));
+	bt_dev_info(hdev, "QCA Product ID   :0x%08x",
+		    le32_to_cpu(ver->product_id));
+	bt_dev_info(hdev, "QCA SOC Version  :0x%08x",
+		    le32_to_cpu(ver->soc_id));
+	bt_dev_info(hdev, "QCA ROM Version  :0x%08x",
+		    le16_to_cpu(ver->rom_ver));
+	bt_dev_info(hdev, "QCA Patch Version:0x%08x",
+		    le16_to_cpu(ver->patch_ver));
 
 	/* QCA chipset version can be decided by patch and SoC
 	 * version, combination with upper 2 bytes from SoC
 	 * and lower 2 bytes from patch will be used.
 	 */
 	*soc_version = (le32_to_cpu(ver->soc_id) << 16) |
-			(le16_to_cpu(ver->rom_ver) & 0x0000ffff);
+		(le16_to_cpu(ver->rom_ver) & 0x0000ffff);
 	if (*soc_version == 0)
 		err = -EILSEQ;
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

