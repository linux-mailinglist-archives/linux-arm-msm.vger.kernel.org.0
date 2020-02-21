Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C5A74168A61
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Feb 2020 00:28:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727273AbgBUX2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Feb 2020 18:28:17 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:36837 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726826AbgBUX2R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Feb 2020 18:28:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582327696; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=aRwX1jcVN/JyxVj3dlueMTh7f3R8MmKjYZHHaruUc7A=; b=cap+CtjfTtREhE+rjzq3sVYZ/xPfp5taO7lOEXoC8gvYCmfbjCajmf/xyH9ncjf/yqTr2mBA
 OOeC9XzQnHUf/DYxW6wsU20FHDYqhs8N6QGNRZifZ1AmKZbtHx8gZuva5Mcs2y8IO8iX2YIg
 9J/8Mvs2WkNmZial+OlB/buwGxA=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e50678e.7fec5d426ca8-smtp-out-n01;
 Fri, 21 Feb 2020 23:28:14 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BAAB1C447A4; Fri, 21 Feb 2020 23:28:13 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C303FC447A0;
        Fri, 21 Feb 2020 23:28:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C303FC447A0
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Mark Rutland <mark.rutland@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Trilok Soni <tsoni@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>,
        David Collins <collinsd@codeaurora.org>,
        linux-arm-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] firmware: psci: Add support for dt-supplied SYSTEM_RESET2 type
Date:   Fri, 21 Feb 2020 15:28:04 -0800
Message-Id: <1582327685-6316-3-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1582327685-6316-1-git-send-email-eberman@codeaurora.org>
References: <1582327685-6316-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Some implementors of PSCI may relax the requirements of the PSCI
architectural warm reset. In order to comply with PSCI specification, a
different reset_type value must be used. The alternate PSCI
SYSTEM_RESET2 may be used in all warm/soft reboot scenarios, replacing
the architectural warm reset.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/psci/psci.c | 21 +++++++++++++++++----
 include/linux/psci.h         |  1 +
 include/uapi/linux/psci.h    |  2 ++
 3 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/psci/psci.c b/drivers/firmware/psci/psci.c
index 2937d44..75e6a38 100644
--- a/drivers/firmware/psci/psci.c
+++ b/drivers/firmware/psci/psci.c
@@ -55,6 +55,7 @@ bool psci_tos_resident_on(int cpu)
 struct psci_operations psci_ops = {
 	.conduit = SMCCC_CONDUIT_NONE,
 	.smccc_version = SMCCC_VERSION_1_0,
+	.sys_reset2_reset_type = PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET,
 };
 
 enum arm_smccc_conduit arm_smccc_1_1_get_conduit(void)
@@ -272,11 +273,10 @@ static void psci_sys_reset(enum reboot_mode reboot_mode, const char *cmd)
 	if ((reboot_mode == REBOOT_WARM || reboot_mode == REBOOT_SOFT) &&
 	    psci_system_reset2_supported) {
 		/*
-		 * reset_type[31] = 0 (architectural)
-		 * reset_type[30:0] = 0 (SYSTEM_WARM_RESET)
 		 * cookie = 0 (ignored by the implementation)
 		 */
-		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2), 0, 0, 0);
+		invoke_psci_fn(PSCI_FN_NATIVE(1_1, SYSTEM_RESET2),
+			       psci_ops.sys_reset2_reset_type, 0, 0);
 	} else {
 		invoke_psci_fn(PSCI_0_2_FN_SYSTEM_RESET, 0, 0, 0);
 	}
@@ -493,6 +493,7 @@ typedef int (*psci_initcall_t)(const struct device_node *);
 static int __init psci_0_2_init(struct device_node *np)
 {
 	int err;
+	u32 param;
 
 	err = get_set_conduit_method(np);
 	if (err)
@@ -505,7 +506,19 @@ static int __init psci_0_2_init(struct device_node *np)
 	 * can be carried out according to the specific version reported
 	 * by firmware
 	 */
-	return psci_probe();
+	err = psci_probe();
+	if (err)
+		return err;
+
+	if (psci_system_reset2_supported &&
+	    !of_property_read_u32(np, "arm,psci-sys-reset2-type", &param)) {
+		if ((s32)param > 0)
+			pr_warn("%08x is an invalid architectural reset type.\n",
+				param);
+		psci_ops.sys_reset2_reset_type = param;
+	}
+
+	return 0;
 }
 
 /*
diff --git a/include/linux/psci.h b/include/linux/psci.h
index a67712b..1959a80 100644
--- a/include/linux/psci.h
+++ b/include/linux/psci.h
@@ -37,6 +37,7 @@ struct psci_operations {
 	int (*migrate_info_type)(void);
 	enum arm_smccc_conduit conduit;
 	enum smccc_version smccc_version;
+	u32 sys_reset2_reset_type;
 };
 
 extern struct psci_operations psci_ops;
diff --git a/include/uapi/linux/psci.h b/include/uapi/linux/psci.h
index 2fcad1d..d786ec8 100644
--- a/include/uapi/linux/psci.h
+++ b/include/uapi/linux/psci.h
@@ -55,6 +55,8 @@
 #define PSCI_1_0_FN64_SYSTEM_SUSPEND		PSCI_0_2_FN64(14)
 #define PSCI_1_1_FN64_SYSTEM_RESET2		PSCI_0_2_FN64(18)
 
+#define PSCI_1_1_SYSTEM_RESET2_SYSTEM_WARM_RESET	0
+
 /* PSCI v0.2 power state encoding for CPU_SUSPEND function */
 #define PSCI_0_2_POWER_STATE_ID_MASK		0xffff
 #define PSCI_0_2_POWER_STATE_ID_SHIFT		0
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
