Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 377FD11D5C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:37:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730486AbfLLShI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:37:08 -0500
Received: from a27-21.smtp-out.us-west-2.amazonses.com ([54.240.27.21]:32894
        "EHLO a27-21.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730211AbfLLShI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:37:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576175827;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=/A4JNs5+DD0XYn+BOoqAC4r96uLwhOOtNDypqGwSDlQ=;
        b=KfvC0uGuoowPiFqRisX+K4WcdM4pPal1+lJkpNdXyizvtCoqooa9eCoe8A7i8NSb
        IeUoxCsGX1tgfFTXV8tbxrGSm87691tIaEt8Wd0XldVXuVzz0D0Luhb7D26/zyq7lZS
        cXWfR9JFpE3MDxtj9GyfHsMTfw7xrUNbEf/977fg=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576175827;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=/A4JNs5+DD0XYn+BOoqAC4r96uLwhOOtNDypqGwSDlQ=;
        b=YWSXUzWaqvlWNifq939d7JVQh/LnHI161wzFOZGHGstXfHJFMdSzOZ8Kf6m0VLch
        OCit/hsc0wynkW/AfAg5ITJNyoXwjxxZ+ri9F/LszPNpzCLZfOm4tUScpMfBcsEgyDC
        dKh5150j1abdRXduJLJdmyIg6zH1703Ki06oA774=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD0D5C447A1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.anderssen@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/17] firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
Date:   Thu, 12 Dec 2019 18:37:07 +0000
Message-ID: <0101016efb6678fb-ee28fef8-971f-4a1e-a975-1db24ab3f49f-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
References: <1576175807-11775-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.21
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Move SMCCC register filling to qcom_scm_call so that __scm_legacy_do
only needs to concern itself with retry mechanism. qcom_scm_call then is
responsible for translating qcom_scm_desc into the complete set of
register arguments and passing onto __scm_legacy_do.

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

