Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E9F4B1E5DC3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 28 May 2020 13:03:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388306AbgE1LD3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 28 May 2020 07:03:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:26676 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2388297AbgE1LD2 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 28 May 2020 07:03:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590663808; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=85XoM0RC3qYbWlqeNJuCnlm67Y/UmDqWjm8ga97G2o4=; b=O6FGjoDlQWDJFbBy9/P7b0XwMvncxRVSlRBECuwOXsNr8yKTSFJKZwtRLOU5bP2Rnrp0Au7W
 SOGyAA8KBd7/W42JhzeuKdrP+xyjLXXbvpn6f5zHTsnGObJ0bGEkQh4e5EmlX5FebukZQkL6
 vlVdNxCJnAv/UMfuoja9oNXC1VA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 5ecf9a7dea0dfa490e2bc65f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 28 May 2020 11:03:25
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BBB80C433A0; Thu, 28 May 2020 11:03:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from zijuhu-gv.qualcomm.com (unknown [180.166.53.21])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: zijuhu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A5ADEC433C9;
        Thu, 28 May 2020 11:03:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A5ADEC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=zijuhu@codeaurora.org
From:   Zijun Hu <zijuhu@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     linux-kernel@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, bgodavar@codeaurora.org,
        c-hbandi@codeaurora.org, hemantg@codeaurora.org, mka@chromium.org,
        rjliao@codeaurora.org, zijuhu@codeaurora.org
Subject: [PATCH v3] Bluetooth: hci_qca: Improve controller ID info log level
Date:   Thu, 28 May 2020 19:03:17 +0800
Message-Id: <1590663797-16531-1-git-send-email-zijuhu@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Controller ID info got by VSC EDL_PATCH_GETVER is very
important, so improve its log level from DEBUG to INFO.

Signed-off-by: Zijun Hu <zijuhu@codeaurora.org>
---
 drivers/bluetooth/btqca.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/bluetooth/btqca.c b/drivers/bluetooth/btqca.c
index 3ea866d..6193030 100644
--- a/drivers/bluetooth/btqca.c
+++ b/drivers/bluetooth/btqca.c
@@ -74,10 +74,14 @@ int qca_read_soc_version(struct hci_dev *hdev, u32 *soc_version,
 
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
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

