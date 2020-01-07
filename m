Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6D45F13337C
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:19:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgAGVEu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:04:50 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:42403 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729109AbgAGVEu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:50 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431089; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=BzELuQurj3nELGYbGTlLBxJ3x5noejw7EwAFfatQt2E=; b=ehrUfHiZBvFI1tfyVEwvECmFUcg3xionQnArJDRj0pXz+MTF2ZONaLCOw8EJD5OHrReY50cE
 rVTQLrOUZQqoTB82UHu/G4wZzf4xuj3zeAhsmk4RGPJl7NGfs9OZ2z2+8ms0Kv86+BkfPGhR
 y/+04bu/y4LxiLp964kREPbcAFk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f271.7f08bc1f0260-smtp-out-n02;
 Tue, 07 Jan 2020 21:04:49 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B00D6C447B5; Tue,  7 Jan 2020 21:04:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 151F7C447B2;
        Tue,  7 Jan 2020 21:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 151F7C447B2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 12/17] firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
Date:   Tue,  7 Jan 2020 13:04:21 -0800
Message-Id: <1578431066-19600-13-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move SMCCC register filling to qcom_scm_call so that __scm_legacy_do
only needs to concern itself with retry mechanism. qcom_scm_call then is
responsible for translating qcom_scm_desc into the complete set of
register arguments and passing onto qcom_scm_call_do.

Change-Id: I435d974724118943084f618f63fffb1109d1cfe0
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 36 ++++++++++++++++++++++++------------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index ce3a61b..acd956f 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -85,6 +85,14 @@ struct qcom_scm_res {
 	u64 result[MAX_QCOM_SCM_RETS];
 };
 
+/**
+ * struct arm_smccc_args
+ * @args:	The array of values used in registers in smc instruction
+ */
+struct arm_smccc_args {
+	unsigned long args[8];
+};
+
 #define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
 
 /**
@@ -167,16 +175,14 @@ static inline void *scm_legacy_get_response_buffer(
 	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
 }
 
-static u32 __scm_legacy_do(u32 cmd_addr)
+static void __scm_legacy_do(const struct arm_smccc_args *smc,
+			    struct arm_smccc_res *res)
 {
-	int context_id;
-	struct arm_smccc_res res;
 	do {
-		arm_smccc_smc(1, (unsigned long)&context_id, cmd_addr,
-			      0, 0, 0, 0, 0, &res);
-	} while (res.a0 == QCOM_SCM_INTERRUPTED);
-
-	return res.a0;
+		arm_smccc_smc(smc->args[0], smc->args[1], smc->args[2],
+			      smc->args[3], smc->args[4], smc->args[5],
+			      smc->args[6], smc->args[7], res);
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
 /**
@@ -194,10 +200,12 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 			 struct qcom_scm_res *res)
 {
 	u8 arglen = desc->arginfo & 0xf;
-	int ret;
+	int ret = 0, context_id;
 	unsigned int i;
 	struct scm_legacy_command *cmd;
 	struct scm_legacy_response *rsp;
+	struct arm_smccc_args smc = {0};
+	struct arm_smccc_res smc_res;
 	const size_t cmd_len = arglen * sizeof(__le32);
 	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
@@ -226,10 +234,14 @@ static int qcom_scm_call(struct device *dev, const struct qcom_scm_desc *desc,
 		return -ENOMEM;
 	}
 
+	smc.args[0] = 1;
+	smc.args[1] = (unsigned long)&context_id;
+	smc.args[2] = cmd_phys;
+
 	mutex_lock(&qcom_scm_lock);
-	ret = __scm_legacy_do(cmd_phys);
-	if (ret < 0)
-		ret = qcom_scm_remap_error(ret);
+	__scm_legacy_do(&smc, &smc_res);
+	if (smc_res.a0)
+		ret = qcom_scm_remap_error(smc_res.a0);
 	mutex_unlock(&qcom_scm_lock);
 	if (ret)
 		goto out;
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
