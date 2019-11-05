Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B16CEF2B4
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Nov 2019 02:29:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387505AbfKEB2R (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 20:28:17 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38248 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387452AbfKEB2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 20:28:16 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 3313260EE3; Tue,  5 Nov 2019 01:28:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917295;
        bh=X9ZzyOFKMrqhDNrZnEBr02spBBYDbYQ58Tmt/ROoqwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=MUyy45DUpIvYIFkmF8qxBwUlL1bckmKbYXXE0KN6dEOV1EcfbGi+wSRjL0b20Qwyj
         AKSPM+Z+0slJLDh6brYBkJW38Y1fxfSgDQv5I6Cs9uU5/LQ/FkG4op9t+AWhBKIf57
         1LUotmpJZToHyG9ZOCDpJz+4HLWJgtZIZ1sPU8aU=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A41E260F81;
        Tue,  5 Nov 2019 01:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572917279;
        bh=X9ZzyOFKMrqhDNrZnEBr02spBBYDbYQ58Tmt/ROoqwk=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kn/rDUoLDDx2doGPN5AAqj8sQPfdNIv3MwSRjBBUcwXBXd5yqwQC+Tzo7UQdNxVx3
         M8XkvYGxtYIyxoVhRL6Pt512++7tneQboBh+cqhvNCErpaYbjlGnLNrMwcpMz89BHx
         cuTpKNIZeErSeSDeA09+ZD2OHXyFLshZzWyHGlxs=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A41E260F81
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [PATCH 12/17] firmware: qcom_scm-32: Move SMCCC register filling to qcom_scm_call
Date:   Mon,  4 Nov 2019 17:27:31 -0800
Message-Id: <1572917256-24205-13-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
References: <1572917256-24205-1-git-send-email-eberman@codeaurora.org>
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
index 33effed..9811560 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -78,6 +78,9 @@ struct qcom_scm_desc {
 	u64 res[MAX_QCOM_SCM_RETS];
 	u32 owner;
 };
+struct arm_smccc_args {
+	unsigned long a[8];
+};
 
 #define LEGACY_FUNCNUM(s, c)  (((s) << 10) | ((c) & 0x3ff))
 
@@ -159,16 +162,13 @@ static inline void *legacy_get_response_buffer(const struct legacy_response *rsp
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
@@ -193,10 +193,12 @@ static u32 __qcom_scm_call_do(u32 cmd_addr)
 static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 {
 	int arglen = desc->arginfo & 0xf;
-	int ret;
+	int ret = 0, context_id;
 	size_t i;
 	struct legacy_command *cmd;
 	struct legacy_response *rsp;
+	struct arm_smccc_args smc = {0};
+	struct arm_smccc_res res;
 	const size_t cmd_len = arglen * sizeof(__le32);
 	const size_t resp_len = MAX_QCOM_SCM_RETS * sizeof(__le32);
 	size_t alloc_len = sizeof(*cmd) + cmd_len + sizeof(*rsp) + resp_len;
@@ -225,10 +227,14 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
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
@@ -270,10 +276,14 @@ static int qcom_scm_call(struct device *dev, struct qcom_scm_desc *desc)
 static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 {
 	int context_id;
+	struct arm_smccc_args smc = {0};
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 1), (unsigned long)&context_id,
-		      arg1, 0, 0, 0, 0, 0, &res);
+	smc.a[0] = LEGACY_ATOMIC(svc, cmd, 1);
+	smc.a[1] = (unsigned long)&context_id;
+	smc.a[2] = arg1;
+	arm_smccc_smc(smc.a[0], smc.a[1], smc.a[2], smc.a[3],
+		      smc.a[4], smc.a[5], smc.a[6], smc.a[7], &res);
 
 	return res.a0;
 }
@@ -291,10 +301,15 @@ static s32 qcom_scm_call_atomic1(u32 svc, u32 cmd, u32 arg1)
 static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 {
 	int context_id;
+	struct arm_smccc_args smc = {0};
 	struct arm_smccc_res res;
 
-	arm_smccc_smc(LEGACY_ATOMIC(svc, cmd, 2), (unsigned long)&context_id,
-		      arg1, arg2, 0, 0, 0, 0, &res);
+	smc.a[0] = LEGACY_ATOMIC(svc, cmd, 2);
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

