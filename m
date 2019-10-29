Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CF65EE902D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:42:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732835AbfJ2TlY (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:41:24 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:59398 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732813AbfJ2TlX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1C047611A0; Tue, 29 Oct 2019 19:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378081;
        bh=g2U8HWLTIcekjOXCUmt1PvmKhBgWatSqjqtl7Sh96/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=iToUY6SeLIwMv78MRsEbxKKBAd2N81tJlTkNsNpawarlMCO8Ekwax/YxI8C8HuJKJ
         tfUaukE18qwT3hnjczhbICOpnEi6fQws6yH3tGpiq4VSri/8fFmBK/x0VNY8BBMgCd
         6gLjIZKw7LQUIPQs3KnN/yPin5ly0TdEXM28CGtI=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0485661139;
        Tue, 29 Oct 2019 19:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378080;
        bh=g2U8HWLTIcekjOXCUmt1PvmKhBgWatSqjqtl7Sh96/c=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=luNjpd7IdsggE167WpwVUkiHvGvW9j9UOea6z0DSIV+QsqLF7bhTxyRefVgYOluaC
         y9FGxbRLrxord6yXY97O3R2YDGyfI75rJrqeoubJhL72Y8goEGp3VGQaCaWLVk92Kz
         fAHDmRvSfxQ0/Y4wOiRhQNjJf1+TSyEcwcv62SxE=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0485661139
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 16/17] firmware: qcom_scm: Enable legacy calling convention in qcom_scm-64.c
Date:   Tue, 29 Oct 2019 12:41:04 -0700
Message-Id: <1572378065-4490-17-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Enable legacy calling convention in qcom_scm-64. Update
is_call_available to use legacy function numbers when using legacy
convention.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 40 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 35 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 71b07b8..18f0bf5 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -60,6 +60,7 @@ struct arm_smccc_args {
 
 enum qcom_smc_convention {
 	SMC_CONVENTION_UNKNOWN,
+	SMC_CONVENTION_LEGACY,
 	SMC_CONVENTION_ARM_32,
 	SMC_CONVENTION_ARM_64,
 };
@@ -411,7 +412,16 @@ static int qcom_scm_call_atomic_legacy(struct device *dev,
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
@@ -427,7 +437,16 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
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
@@ -746,8 +765,19 @@ int __qcom_scm_is_call_available(struct device *dev, u32 svc_id, u32 cmd_id)
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
 
@@ -902,7 +932,7 @@ void __qcom_scm_init(void)
 		qcom_smc_convention = SMC_CONVENTION_ARM_32;
 		if (__qcom_scm_is_call_available(NULL, QCOM_SCM_SVC_INFO,
 						 QCOM_INFO_IS_CALL_AVAIL) <= 0) {
-			qcom_smc_convention = SMC_CONVENTION_UNKNOWN;
+			qcom_smc_convention = SMC_CONVENTION_LEGACY;
 		}
 	}
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

