Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C26171F77DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Jun 2020 14:21:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725872AbgFLMVr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Jun 2020 08:21:47 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:46399 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725791AbgFLMVp (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Jun 2020 08:21:45 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1591964505; h=Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=Qe/TAbBkaeyTep4BFNMVDJKRlemiF9HbSLVopCwDv/U=; b=q2mV5/oweHPaNYP5UX7AVSNmU9LI1UjoiPoW7qwwcADiVYXeCW+kZ1aesXvHSZj0HmWSHQe1
 nUcgLB2pN1Y5BpgcdKOOOfTUlcOiTopKxIRivwkZtIB82CeAaHZlCEMGVVVwm69F/SUKf4Le
 f7xHEewPJcfzUTRY2/YPcaw/r5U=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n15.prod.us-west-2.postgun.com with SMTP id
 5ee373575866879c762467a3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 12 Jun 2020 12:21:43
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CED0C43387; Fri, 12 Jun 2020 12:21:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from bgodavar-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bgodavar)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4169EC43395;
        Fri, 12 Jun 2020 12:21:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4169EC43395
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=bgodavar@codeaurora.org
From:   Balakrishna Godavarthi <bgodavar@codeaurora.org>
To:     marcel@holtmann.org, johan.hedberg@gmail.com
Cc:     mka@chromium.org, linux-kernel@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, hemantg@codeaurora.org,
        linux-arm-msm@vger.kernel.org, abhishekpandit@chromium.org,
        rjliao@codeaurora.org, gubbaven@codeaurora.org,
        Balakrishna Godavarthi <bgodavar@codeaurora.org>
Subject: [PATCH v1] Bluetooth: hci_qca: Increase SoC idle timeout to 200ms
Date:   Fri, 12 Jun 2020 17:51:31 +0530
Message-Id: <1591964491-9776-1-git-send-email-bgodavar@codeaurora.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

In some version of WCN399x, SoC idle timeout is configured
as 80ms instead of 20ms or 40ms. To honor all the SoC's
supported in the driver increasing SoC idle timeout to 200ms.

Fixes: 41d5b25fed0a0 ("Bluetooth: hci_qca: add PM support")
Signed-off-by: Balakrishna Godavarthi <bgodavar@codeaurora.org>
---
 drivers/bluetooth/hci_qca.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index f3fde99..91c9aa6 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -46,7 +46,7 @@
 #define HCI_MAX_IBS_SIZE	10
 
 #define IBS_WAKE_RETRANS_TIMEOUT_MS	100
-#define IBS_BTSOC_TX_IDLE_TIMEOUT_MS	40
+#define IBS_BTSOC_TX_IDLE_TIMEOUT_MS	200
 #define IBS_HOST_TX_IDLE_TIMEOUT_MS	2000
 #define CMD_TRANS_TIMEOUT_MS		100
 #define MEMDUMP_TIMEOUT_MS		8000
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

