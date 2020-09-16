Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5244F26CA63
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Sep 2020 21:58:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbgIPT6T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Sep 2020 15:58:19 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:52902 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727256AbgIPT4a (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Sep 2020 15:56:30 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600286189; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Up7I/CriwmOnAvRCo5VD/fL2c6xGM0a9cxYx/5GGg1k=; b=ZR7fONdA+mLb5xdeuW9Uum5s6wn3qjxxPy1ddFORFYyujYpMB/fggCuAnvdPR4lKtbhDM+FH
 AOPjl4dQMjxW6nRND8BgnwrM19CcB0BUVjUwb1SVyKaff7teLuqrQWi9l7moxZvBNxN0pRkz
 ogTRCjlUX1B/pcamvxx/clh7vDs=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f626de04a8a578ddc09d7b1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 16 Sep 2020 19:56:16
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E9E39C433CA; Wed, 16 Sep 2020 19:56:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E38BC433FE;
        Wed, 16 Sep 2020 19:56:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E38BC433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
From:   Hemant Kumar <hemantk@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org, gregkh@linuxfoundation.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org,
        Hemant Kumar <hemantk@codeaurora.org>
Subject: [PATCH v6 2/4] bus: mhi: core: Move MHI_MAX_MTU to external header file
Date:   Wed, 16 Sep 2020 12:56:05 -0700
Message-Id: <1600286167-4432-3-git-send-email-hemantk@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
References: <1600286167-4432-1-git-send-email-hemantk@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Currently this macro is defined in internal MHI header as
a TRE length mask. Moving it to external header allows MHI
client drivers to set this upper bound for the transmit
buffer size.

Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
---
 drivers/bus/mhi/core/internal.h | 1 -
 include/linux/mhi.h             | 3 +++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/mhi/core/internal.h b/drivers/bus/mhi/core/internal.h
index 7989269..4abf0cf 100644
--- a/drivers/bus/mhi/core/internal.h
+++ b/drivers/bus/mhi/core/internal.h
@@ -453,7 +453,6 @@ enum mhi_pm_state {
 #define CMD_EL_PER_RING			128
 #define PRIMARY_CMD_RING		0
 #define MHI_DEV_WAKE_DB			127
-#define MHI_MAX_MTU			0xffff
 #define MHI_RANDOM_U32_NONZERO(bmsk)	(prandom_u32_max(bmsk) + 1)
 
 enum mhi_er_type {
diff --git a/include/linux/mhi.h b/include/linux/mhi.h
index 6565528..610f3b0 100644
--- a/include/linux/mhi.h
+++ b/include/linux/mhi.h
@@ -16,6 +16,9 @@
 #include <linux/wait.h>
 #include <linux/workqueue.h>
 
+/* MHI client drivers to set this upper bound for tx buffer */
+#define MHI_MAX_MTU 0xffff
+
 #define MHI_MAX_OEM_PK_HASH_SEGMENTS 16
 
 struct mhi_chan;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

