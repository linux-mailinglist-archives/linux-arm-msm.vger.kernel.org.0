Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C42B6EF2B1
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387399AbfKEB2N (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:13 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38144 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbfKEB2M (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:12 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4B56660F83; Tue,  5 Nov 2019 01:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917290;
        bh=VnFdUKh2L32i0tmOO6AdIacV6hLUL4vY01ZGI/Yc6pw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iqvJXbPDdyu4SsiV2OFVt7o435tiymKZek90MGm6qLnPgu3OxLYWyDjUkjChRo6hl
         TI2E8b9+k2HFja8VFTTJJKC3Kp/9j/yg5CeyE4OlP4EalPRrORNC+oOhaJ+QLmmU3G
         4q6lzzGbtyueri36MQlFz5cnz1SDOd5ncmSC+6pY=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F9A60EE2;
        Tue,  5 Nov 2019 01:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917283;
        bh=VnFdUKh2L32i0tmOO6AdIacV6hLUL4vY01ZGI/Yc6pw=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=dWMALy59LkTpPBYuM067o/Tx5YqqvwLb7W5VH4q+nTHu3k3fzsfc/8zzSkqBzU4cw
         BZVgiTG2DXVSaH+PgCMToOKQxOEDU6GbDwe8Y8a6zndtb5SXW25DCHNsYJDz+8Oi4i
         2a0jbE6lb0o5tUCV2bvaLdJYBaQNiDbcRc3V50Ac=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B0F9A60EE2
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 16/17] firmware: qcom_scm: Enable legacy calling convention in qcom_scm-64.c
Date:   Mon,  4 Nov 2019 17:27:35 -0800
Message-Id: <1572917256-24205-17-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable legacy calling convention in qcom_scm-64. Update
is_call_available to use legacy function numbers when using legacy
convention.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 43 ++++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 7bb68f2..355d9d7 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -60,6 +60,7 @@ struct arm_smccc_args {
 
 enum qcom_smc_convention {
 	SMC_CONVENTION_UNKNOWN,
+	SMC_CONVENTION_LEGACY,
 	SMC_CONVENTION_ARM_32,
 	SMC_CONVENTION_ARM_64,
 };
@@ -415,7 +416,16 @@ static int qcom_scm_call_atomic_legacy(struct device *dev,
 static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	might_sleep();
-	return qcom_scm_call_smccc(dev, desc, false);
+	switch (qcom_smc_convention) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return qcom_scm_call_smccc(dev, desc, false);
+	case SMC_CONVENTION_LEGACY:
+		return qcom_scm_call_legacy(dev, desc);
+	default:
+		pr_err("Unknown current SCM calling convention.\n");
+		return -EINVAL;
+	}
 }
 
 /**
@@ -431,7 +441,16 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
  */
 static int qcom_scm_call_atomic(struct device *dev, struct qcom_scm_desc *desc)
 {
-	return qcom_scm_call_smccc(dev, desc, true);
+	switch (qcom_smc_convention) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		return qcom_scm_call_smccc(dev, desc, true);
+	case SMC_CONVENTION_LEGACY:
+		return qcom_scm_call_atomic_legacy(dev, desc);
+	default:
+		pr_err("Unknown current SCM calling convention.\n");
+		return -EINVAL;
+	}
 }
 
 #define QCOM_SCM_FLAG_COLDBOOT_CPU0	0x00
@@ -750,8 +769,19 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
 	};
 
 	desc.arginfo = QCOM_SCM_ARGS(1);
-	desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
-			(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+	switch (qcom_smc_convention) {
+	case SMC_CONVENTION_ARM_32:
+	case SMC_CONVENTION_ARM_64:
+		desc.args[0] = SMCCC_FUNCNUM(svc_id, cmd_id) |
+				(ARM_SMCCC_OWNER_SIP << ARM_SMCCC_OWNER_SHIFT);
+		break;
+	case SMC_CONVENTION_LEGACY:
+		desc.args[0] = LEGACY_FUNCNUM(svc_id, cmd_id);
+		break;
+	default:
+		pr_err("Unknown SMC convention being used\n");
+		return -EINVAL;
+	}
 
 	ret = qcom_scm_call(dev, &desc);
 
@@ -898,6 +928,11 @@ int __qcom_scm_qsmmu500_wait_safe_toggle(struct device *dev, bool en)
 
 void __qcom_scm_init(void)
 {
+	qcom_smc_convention = SMC_CONVENTION_LEGACY;
+	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
+			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
+		goto out;
+
 	qcom_smc_convention = SMC_CONVENTION_ARM_64;
 	if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
 			QCOM_SCM_INFO_IS_CALL_AVAIL) == 1)
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

