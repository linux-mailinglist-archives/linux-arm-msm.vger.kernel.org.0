Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B4B7D11D665
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2019 19:52:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730595AbfLLSvN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Dec 2019 13:51:13 -0500
Received: from a27-188.smtp-out.us-west-2.amazonses.com ([54.240.27.188]:60194
        "EHLO a27-188.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730528AbfLLSvK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Dec 2019 13:51:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1576176669;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=/f/uwcycvkqHfz6rQ6bCQ07NgIkbE8y3JfXx2nqrEJw=;
        b=hY/5JiSz9C49d3MyANFZXKWw1R7TEKXr4XQea/8sP410LFo46qmTMyt5btL3uwp/
        RbIsh18Tjrop9qefgr/UFLsvUPf3yvuZOLHTr+S+gK6/tnsc0IKXQnjj4eJKw6e0PGV
        dKKBbU9Za4oi3IWWCPYqjEIu/qXEhn+kjQFkDtPU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1576176669;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=/f/uwcycvkqHfz6rQ6bCQ07NgIkbE8y3JfXx2nqrEJw=;
        b=SV4WXI+0If9zlz0QEF9uskHUpBenPhDTJQbC1lqntPL87d9uV4dBxs8M5CKXCr6b
        zWMvn7RBLZcCm8GVvxODG1VaIEORrYb4utIjQZq2w8meRzk2EFZwForzMZ/SMZ/NTM2
        lzAbP8guRqrNTMaBhhGZOUQd3HLXYJZ73+b9XHNc=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 22662C4479F
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/17] firmware: qcom_scm-64: Make SMC macros less magical
Date:   Thu, 12 Dec 2019 18:51:09 +0000
Message-ID: <0101016efb7353b8-d392d835-835b-4851-a560-4d6a11e7d46a-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
References: <1576176651-17089-1-git-send-email-eberman@codeaurora.org>
X-SES-Outgoing: 2019.12.12-54.240.27.188
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve understandability of SMC macros by reversing the logic as they
are all functions of how many arguments can be shoved in registers and
how many SCM arguments are supported.

There aren't 4 register arguments because are 7 arguments that go into a
buffer - there are up to 7 arguments that are overflowed into a buffer
because only 4 registers are allocated for arguments.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 976c2b9..3101f36 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -58,9 +58,9 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
-#define SCM_SMC_N_EXT_ARGS 7
-#define SCM_SMC_FIRST_EXT_IDX 3
-#define SCM_SMC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SCM_SMC_N_EXT_ARGS + 1)
+#define SCM_SMC_N_REG_ARGS	4
+#define SCM_SMC_FIRST_EXT_IDX	(SCM_SMC_N_REG_ARGS - 1)
+#define SCM_SMC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SCM_SMC_N_REG_ARGS + 1)
 
 static void __scm_smc_do_quirk(const struct qcom_scm_desc *desc,
 			       struct arm_smccc_res *res, u32 fn_id,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

