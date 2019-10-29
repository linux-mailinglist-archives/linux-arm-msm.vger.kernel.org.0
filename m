Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC347E9025
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 20:41:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732611AbfJ2TlQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 15:41:16 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:58696 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732575AbfJ2TlO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 15:41:14 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 429C060FB8; Tue, 29 Oct 2019 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378074;
        bh=t69mBPbZYNAMCASUyLYBudWH7IjtKYXFXxCoBN9u+8Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=odBp+D5lQWi+QA7xwN8upvMonzXLV21kGY642XPQT4UBpzUC9SXJQWxCpa1FeP3k0
         X51hNJL1b4bBGYKSNcHbTka3900jGzDd06bBwrmsd1aWzZRm2XW6iR/0WsuflAxRnV
         s/bCyMNakh1ZV/sWSEHMxHeoA6XkDSvCOtziLPXM=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1B96460F83;
        Tue, 29 Oct 2019 19:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572378073;
        bh=t69mBPbZYNAMCASUyLYBudWH7IjtKYXFXxCoBN9u+8Q=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=ligHr7qZt+n0YX8isu2wwEtMB6yq+5rPRidiG4EMI55KSNpukuy4+nXtJeDqEm4GF
         qTQR4KVeTkTq8RY01f45emr9iWXSwxntOJgz6NDE6yfKTjGAu1xBHxEMjR9MlBDyhq
         KialMglO4VhMyM7+gUfYsQhMhTZUnxjB9kp/DE4E=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1B96460F83
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saipraka@codeaurora.org,
        agross@kernel.org
Cc:     tsoni@codeaurora.org, sidgup@codeaurora.org,
        psodagud@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>
Subject: [RFC 04/17] firmware: qcom_scm: Remove unused qcom_scm_get_version
Date:   Tue, 29 Oct 2019 12:40:52 -0700
Message-Id: <1572378065-4490-5-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
References: <1572378065-4490-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Remove unused qcom_scm_get_version.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-32.c | 36 ------------------------------------
 include/linux/qcom_scm.h       |  2 --
 2 files changed, 38 deletions(-)

diff --git a/drivers/firmware/qcom_scm-32.c b/drivers/firmware/qcom_scm-32.c
index 240adfd..b2805de 100644
--- a/drivers/firmware/qcom_scm-32.c
+++ b/drivers/firmware/qcom_scm-32.c
@@ -291,42 +291,6 @@ static s32 qcom_scm_call_atomic2(u32 svc, u32 cmd, u32 arg1, u32 arg2)
 	return r0;
 }
 
-u32 qcom_scm_get_version(void)
-{
-	int context_id;
-	static u32 version = -1;
-	register u32 r0 asm("r0");
-	register u32 r1 asm("r1");
-
-	if (version != -1)
-		return version;
-
-	mutex_lock(&qcom_scm_lock);
-
-	r0 = 0x1 << 8;
-	r1 = (u32)&context_id;
-	do {
-		asm volatile(
-			__asmeq("%0", "r0")
-			__asmeq("%1", "r1")
-			__asmeq("%2", "r0")
-			__asmeq("%3", "r1")
-#ifdef REQUIRES_SEC
-			".arch_extension sec\n"
-#endif
-			"smc	#0	@ switch to secure world\n"
-			: "=r" (r0), "=r" (r1)
-			: "r" (r0), "r" (r1)
-			: "r2", "r3", "r12");
-	} while (r0 == QCOM_SCM_INTERRUPTED);
-
-	version = r1;
-	mutex_unlock(&qcom_scm_lock);
-
-	return version;
-}
-EXPORT_SYMBOL(qcom_scm_get_version);
-
 /**
  * qcom_scm_set_cold_boot_addr() - Set the cold boot address for cpus
  * @entry: Entry point function for the cpus
diff --git a/include/linux/qcom_scm.h b/include/linux/qcom_scm.h
index a4dfab0..1e95080 100644
--- a/include/linux/qcom_scm.h
+++ b/include/linux/qcom_scm.h
@@ -59,7 +59,6 @@ extern bool qcom_scm_hdcp_available(void);
 extern int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 			     u32 *resp);
 extern int qcom_scm_qsmmu500_wait_safe_toggle(bool en);
-extern u32 qcom_scm_get_version(void);
 extern bool qcom_scm_is_available(void);
 #else
 
@@ -101,7 +100,6 @@ static inline int qcom_scm_hdcp_req(struct qcom_scm_hdcp_req *req, u32 req_cnt,
 				    u32 *resp) { return -ENODEV; }
 static inline int qcom_scm_qsmmu500_wait_safe_toggle(bool en)
 		{ return -ENODEV; }
-static inline u32 qcom_scm_get_version(void) { return 0; }
 static inline bool qcom_scm_is_available(void) { return false; }
 #endif
 #endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

