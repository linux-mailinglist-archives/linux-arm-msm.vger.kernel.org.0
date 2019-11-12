Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 73321F9C16
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:23:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727610AbfKLVXi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:38 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39530 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727558AbfKLVXd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:33 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A92B760E1C; Tue, 12 Nov 2019 21:23:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593811;
        bh=69sjY0Bsd+QEFmg+FpleUKMSHBQWLRsduYB+GG7/ZHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I6JjTCZDJ5CeNhwj4x3sUbTl/5KyVlIxH63VT5JkWcAXmbwlYsY4pnJGNpsBI06qL
         9/z4RBX+ZnMc4RpYUUixH+q3Dvj/H2oOWDhQl98KKMIawZ9aPk3MprYPCuQ8x2OjUJ
         Ud0u/IUDZ+MFmmydhQJdGsg3UejFaO5nt/oOWh8o=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ED9DD60DB6;
        Tue, 12 Nov 2019 21:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593796;
        bh=69sjY0Bsd+QEFmg+FpleUKMSHBQWLRsduYB+GG7/ZHs=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=IT45tcuJ/BStN9C0RZyT1vbfHnURnHXrKYvI275tnb7WiXnvqHJz2WHW6n4cQBXGU
         XmBRktoGK0bxfwYdnMixgqb4R9XVX5dE+Pl1+2Jb+CGWaJ/h2zf9jWK2XPZhRXNLlW
         G0c1LOmbL1Z6vW6MMJTaWqyS0I3YTwnlvLJiUDpY=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ED9DD60DB6
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/18] firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
Date:   Tue, 12 Nov 2019 13:22:49 -0800
Message-Id: <1573593774-12539-14-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

- Move SMCCC register filling to qcom_scm_call so that qcom_scm_call_do
  only needs to concern itself with retry mechanism.
- Use arm_smccc_args struct in atomic variants as well.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 47 ++++++++++++++++++++++++++++--------------
 1 file changed, 31 insertions(+), 16 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 4c287f6..913a77c 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -78,6 +78,9 @@ struct qcom_scm_desc {
 	u64 result[MAX_QCOM_SCM_RETS];
 	u32 owner;
 };
+struct arm_smccc_args {
+	unsigned long a[8];
+};
 
 #define LEGACY_FUNCNUM(s, c)	(((s) << 10) | ((c) & 0x3ff))
 
@@ -162,16 +165,13 @@ static inline void *legacy_get_response_buffer(
 	return (void *)rsp + le32_to_cpu(rsp->buf_offset);
 }
 
-static u32 __qcom_scm_call_do(u32 cmd_addr)
+static void __qcom_scm_call_do(const struct arm_smccc_args *smc,
+			      struct arm_smccc_res *res)
 {
-	int context_id;
-	struct arm_smccc_res res;
 	do {
-		arm_smccc_smc(1, (unsigned long)&context_id, cmd_addr,
-			      0, 0, 0, 0, 0, &res);
-	} while (res.a0 == QCOM_SCM_INTERRUPTED);
-
-	return res.a0;
+		arm_smccc_smc(smc->a[0], smc->a[1], smc->a[2], smc->a[3],
+			      smc->a[4], smc->a[5], smc->a[6], smc->a[7], res);
+	} while (res->a0 == QCOM_SCM_INTERRUPTED);
 }
 
 /**
@@ -188,10 +188,12 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
 static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int arglen = desc->arginfo & 0xf;
-	int ret;
+	int ret = 0, context_id;
 	size_t i;
 	struct qcom_scm_legacy_command *cmd;
 	struct qcom_scm_legacy_response *rsp;
+	struct arm_smccc_args smc = {0};
+	struct arm_smccc_res res;
 	const size_t cmd_len = arglen * sizeof(__le32);
 	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
@@ -220,10 +222,14 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 		return -ENOMEM;
 	}
 
+	smc.a[0] = 1;
+	smc.a[1] = (unsigned long)&context_id;
+	smc.a[2] = cmd_phys;
+
 	mutex_lock(&qcom_scm_lock);
-	ret = __qcom_scm_call_do(cmd_phys);
-	if (ret < 0)
-		ret = qcom_scm_remap_error(ret);
+	__qcom_scm_call_do(&smc, &res);
+	if (res.a0 < 0)
+		ret = qcom_scm_remap_error(res.a0);
 	mutex_unlock(&qcom_scm_lock);
 	if (ret)
 		goto out;
@@ -266,10 +272,14 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
+	struct arm_smccc_args smc = {0};
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(LEGACY_ATOMIC_ID(svc, cmd, 1), (unsigned long)&context_id,
-		      arg1, 0, 0, 0, 0, 0, &res);
+	smc.a[0] = LEGACY_ATOMIC_ID(svc, cmd, 1);
+	smc.a[1] = (unsigned long)&context_id;
+	smc.a[2] = arg1;
+	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
+		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
 
 	return res.a0;
 }
@@ -287,10 +297,15 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
+	struct arm_smccc_args smc = {0};
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(LEGACY_ATOMIC_ID(svc, cmd, 2), (unsigned long)&context_id,
-		      arg1, arg2, 0, 0, 0, 0, &res);
+	smc.a[0] = LEGACY_ATOMIC_ID(svc, cmd, 2);
+	smc.a[1] = (unsigned long)&context_id;
+	smc.a[2] = arg1;
+	smc.a[3] = arg2;
+	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
+		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
 
 	return res.a0;
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

