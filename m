Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A34C137702
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2020 20:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728752AbgAJT3W (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jan 2020 14:29:22 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:40497 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728452AbgAJT3W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jan 2020 14:29:22 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578684561; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=EHK7ZOIjToT9khxX7iSgvPJgRfkrf/0cdN7Y+Xvfzcw=; b=OGSVvCgevWNKsm5ez8hd5WkLZ9yhaUWrEkYQ3bXfbt6lE3LotgB6PzcUp230wNnGdOokJNjx
 v2xTK6Duor+bRR7mDmr0eSBIe8M/0A+ri7CmkOJ+iLnIjcUSlUKrs4hGMzQZZMtFth2p6BKj
 5Yje41uo7XA/KzkU6xnkt9WxanE=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e18d090.7f1488644dc0-smtp-out-n03;
 Fri, 10 Jan 2020 19:29:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1C700C4479F; Fri, 10 Jan 2020 19:29:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 12C10C43383;
        Fri, 10 Jan 2020 19:29:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12C10C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [RFC] drivers: firmware: psci: Add function to support SYSTEM_RESET2
Date:   Fri, 10 Jan 2020 11:29:12 -0800
Message-Id: <1578684552-15953-2-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578684552-15953-1-git-send-email-eberman@codeaurora.org>
References: <1578684552-15953-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Make SYSTEM_RESET2 command part of its own function which client drivers
may also invoke to support vendor-specific reset types.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/psci/psci.c | 16 +++++++++++++++-
 include/linux/psci.h         |  3 +++
 include/uapi/linux/psci.h    |  8 ++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index b3b6c15..338e4be 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -220,6 +220,15 @@ static unsigned long psci_migrate_info_up_cpu(void)
 			      0, 0, 0);
 }
 
+int psci_system_reset2(const u32 reset_type, const unsigned long cookie)
+{
+	if (!psci_system_reset2_supported)
+		return -EOPNOTSUPP;
+	return invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), reset_type,
+			      cookie, 0);
+}
+EXPORT_SYMBOL_GPL(psci_system_reset2);
+
 static void set_conduit(enum arm_smccc_conduit conduit)
 {
 	switch (conduit) {
@@ -267,7 +276,12 @@ static void psci_sys_reset(enum reboot_mode reboot_mode, const char *cmd)
 		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
 		 * cookie = 0 (ignored by the implementation)
 		 */
-		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
+		psci_system_reset2(
+			PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET |
+			(PSCI_1_1_SYSTEM_RESET2_TYPE_ARCHITECTURE <<
+			PSCI_1_1_SYSTEM_RESET2_SHIFT),
+			0
+		);
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
diff --git a/include/linux/psci.h b/include/linux/psci.h
index ebe0a88..9479952 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -41,8 +41,11 @@ extern struct psci_operations psci_ops;
 
 #if defined(CONFIG_ARM_PSCI_FW)
 int __init psci_dt_init(void);
+int psci_system_reset2(const u32 reset_type, const unsigned long cookie);
 #else
 static inline int psci_dt_init(void) { return 0; }
+static inline int psci_system_reset2(const u32 reset_type,
+	const unsigned long cookie) { return -ENODEV; }
 #endif
 
 #if defined(CONFIG_ARM_PSCI_FW) && defined(CONFIG_ACPI)
diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
index 2fcad1d..42edbd7 100644
--- a/include/uapi/linux/psci.h
+++ b/include/uapi/linux/psci.h
@@ -72,6 +72,14 @@
 #define PSCI_1_0_EXT_POWER_STATE_TYPE_MASK	\
 				(0x1 << PSCI_1_0_EXT_POWER_STATE_TYPE_SHIFT)
 
+/* PSCI SYSTEM_RESET2 reset_type argument */
+#define PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET	0x0
+#define PSCI_1_1_SYSTEM_RESET2_TYPE_VENDOR		1
+#define PSCI_1_1_SYSTEM_RESET2_TYPE_ARCHITECTURE	0
+#define PSCI_1_1_SYSTEM_RESET2_TYPE_SHIFT		30
+#define PSCI_1_1_SYSTEM_RESET2_TYPE_MASK		\
+				(0x1 << PSCI_1_1_SYSTEM_RESET2_TYPE_SHIFT)
+
 /* PSCI v0.2 affinity level state returned by AFFINITY_INFO */
 #define PSCI_0_2_AFFINITY_LEVEL_ON		0
 #define PSCI_0_2_AFFINITY_LEVEL_OFF		1
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
