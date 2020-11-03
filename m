Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 48A452A45B9
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 13:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729085AbgKCM60 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 07:58:26 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:21819 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729028AbgKCM6Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 07:58:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604408304; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=wip3SqxPDZ8IG7Sc4+GAbXTApb3DFMxp79tDHTBbQ88=; b=f8kgKg3PZpuFDVXj81BCs/ac7nmRaWvYZ9LGndrHeLhbHvm7XkW4L7mwvIcyJsl++o4+wKTK
 ciCwgZVKTsdZOw1MyzmjcKxWtyyahxb4g84XJacSxsla+UNMDnWfcdjCDGyqyFoBfVq3Onn7
 CBQ6ssRF/qYp1RsmwhH55WKa7oM=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5fa153eb875877e3ed9a2b58 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 12:58:19
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 49B7BC38543; Tue,  3 Nov 2020 09:19:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0B1C7C4A61D;
        Tue,  3 Nov 2020 09:19:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0B1C7C4A61D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v7 1/4] remoteproc: core: Add ops to enable custom coredump functionality
Date:   Tue,  3 Nov 2020 01:19:17 -0800
Message-Id: <1604395160-12443-2-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Each remoteproc might have different requirements for coredumps and might
want to choose the type of dumps it wants to collect. This change allows
remoteproc drivers to specify their own custom dump function to be executed
in place of rproc_coredump. If the coredump op is not specified by the
remoteproc driver it will be set to rproc_coredump by default.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/remoteproc_core.c | 6 +++++-
 include/linux/remoteproc.h           | 2 ++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
index dab2c0f..eba7543 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1704,7 +1704,7 @@ int rproc_trigger_recovery(struct rproc *rproc)
 		goto unlock_mutex;
 
 	/* generate coredump */
-	rproc_coredump(rproc);
+	rproc->ops->coredump(rproc);
 
 	/* load firmware */
 	ret = request_firmware(&firmware_p, rproc->firmware, dev);
@@ -2126,6 +2126,10 @@ static int rproc_alloc_ops(struct rproc *rproc, const struct rproc_ops *ops)
 	if (!rproc->ops)
 		return -ENOMEM;
 
+	/* Default to rproc_coredump if no coredump function is specified */
+	if (!rproc->ops->coredump)
+		rproc->ops->coredump = rproc_coredump;
+
 	if (rproc->ops->load)
 		return 0;
 
diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
index 3fa3ba6..a419878 100644
--- a/include/linux/remoteproc.h
+++ b/include/linux/remoteproc.h
@@ -375,6 +375,7 @@ enum rsc_handling_status {
  * @get_boot_addr:	get boot address to entry point specified in firmware
  * @panic:	optional callback to react to system panic, core will delay
  *		panic at least the returned number of milliseconds
+ * @coredump:	  collect firmware dump after the subsystem is shutdown
  */
 struct rproc_ops {
 	int (*prepare)(struct rproc *rproc);
@@ -393,6 +394,7 @@ struct rproc_ops {
 	int (*sanity_check)(struct rproc *rproc, const struct firmware *fw);
 	u64 (*get_boot_addr)(struct rproc *rproc, const struct firmware *fw);
 	unsigned long (*panic)(struct rproc *rproc);
+	void (*coredump)(struct rproc *rproc);
 };
 
 /**
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

