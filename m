Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45DB922A090
	for <lists+linux-arm-msm@lfdr.de>; Wed, 22 Jul 2020 22:11:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732858AbgGVULV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 22 Jul 2020 16:11:21 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:36724 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732777AbgGVULU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 22 Jul 2020 16:11:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595448679; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=m0Z1jOFuWm4ehOVsZJTRm/1T8UDTnsjJ3zswNn0Wz1c=; b=F9wsKqQ56SKW+Pv7Zvo41DjUbGCdapu3RTJviZd/lJw+aqS0hjDfoJvfxMSRUhX1Gk+McqGo
 6xvCS9kmeiAOGRR2KuEsuDI/vSTxRxDXSQjxVXyjeis8wUsI35oPidE9RJN3hrAP8Xj6EbLI
 T+IAhhii/tVxR8eVVjZLzpLjVCU=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n12.prod.us-east-1.postgun.com with SMTP id
 5f189d5e7c8ca473a8ee00e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 22 Jul 2020 20:11:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id CB599C433A0; Wed, 22 Jul 2020 20:11:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 60EDFC4339C;
        Wed, 22 Jul 2020 20:11:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 60EDFC4339C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sibis@codeaurora.org
From:   Sibi Sankar <sibis@codeaurora.org>
To:     bjorn.andersson@linaro.org
Cc:     agross@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        evgreen@chromium.org, ohad@wizery.com,
        Sibi Sankar <sibis@codeaurora.org>, stable@vger.kernel.org
Subject: [PATCH v3 2/3] remoteproc: qcom_q6v5_mss: Validate modem blob firmware size before load
Date:   Thu, 23 Jul 2020 01:40:46 +0530
Message-Id: <20200722201047.12975-3-sibis@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200722201047.12975-1-sibis@codeaurora.org>
References: <20200722201047.12975-1-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The following mem abort is observed when one of the modem blob firmware
size exceeds the allocated mpss region. Fix this by restricting the copy
size to segment size using request_firmware_into_buf before load.

Err Logs:
Unable to handle kernel paging request at virtual address
Mem abort info:
...
Call trace:
  __memcpy+0x110/0x180
  rproc_start+0xd0/0x190
  rproc_boot+0x404/0x550
  state_store+0x54/0xf8
  dev_attr_store+0x44/0x60
  sysfs_kf_write+0x58/0x80
  kernfs_fop_write+0x140/0x230
  vfs_write+0xc4/0x208
  ksys_write+0x74/0xf8
...

Fixes: 051fb70fd4ea4 ("remoteproc: qcom: Driver for the self-authenticating Hexagon v5")
Cc: stable@vger.kernel.org
Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index 4e72c9e30426c..f4aa61ba220dc 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1174,15 +1174,14 @@ static int q6v5_mpss_load(struct q6v5 *qproc)
 		} else if (phdr->p_filesz) {
 			/* Replace "xxx.xxx" with "xxx.bxx" */
 			sprintf(fw_name + fw_name_len - 3, "b%02d", i);
-			ret = request_firmware(&seg_fw, fw_name, qproc->dev);
+			ret = request_firmware_into_buf(&seg_fw, fw_name, qproc->dev,
+							ptr, phdr->p_filesz);
 			if (ret) {
 				dev_err(qproc->dev, "failed to load %s\n", fw_name);
 				iounmap(ptr);
 				goto release_firmware;
 			}
 
-			memcpy(ptr, seg_fw->data, seg_fw->size);
-
 			release_firmware(seg_fw);
 		}
 
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

