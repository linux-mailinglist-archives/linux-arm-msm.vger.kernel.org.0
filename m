Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2D3D2323367
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Feb 2021 22:49:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232389AbhBWVrD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 23 Feb 2021 16:47:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230268AbhBWVrC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 23 Feb 2021 16:47:02 -0500
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9E9C06178C
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:44 -0800 (PST)
Received: by mail-pf1-x42b.google.com with SMTP id j12so9674295pfj.12
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Feb 2021 13:45:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=2Tx6PpXqyldYGLFbNHsTHVpykMytzBwI2ywunG7WWQc=;
        b=NDsJA6rX7vmtl4tSNItgvJx0TzTU5RypxDLyOD7YWMhybpDTwoEI24kVAt6CJ+Dwmt
         GirsVaDp0a5RKqYUscnRHJupJIfUB/0xDAcbG4hQw7ElvL2zjcrqBpyqJtN4jNXMs7zW
         dTE2523urD/n4wWysH5o3KyBrOd5DrwG4ImxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=2Tx6PpXqyldYGLFbNHsTHVpykMytzBwI2ywunG7WWQc=;
        b=q8uXVUzAQkRW9N7o8WPQWO7jxznkYSgfzOh+sI45ImlzD87y8iDFMD73/MCDtTOOBt
         G0XhJj7OwslMKJnt9Jdqo6lJ4Dlzs8y++dsNAYiWm4aIpgE7kFAzhISK2AyABaiqTn5z
         Oxl4RE3pXSqRpTCK6QniVV50I5Q1wNgUqoL7QA0sKLP21KIbh0YKcTijlW9DoOkG+/Pb
         Z7LQqhsqKHMOT4SmjUXJ4Rz6VXQEYIXZLjuPEOkKXst8ccM4avFiALbG/Og93LBcrDYY
         IbgmKqG8GhL9oT/fLW/xH0e4iduXPmsnSIXATQhmQCR0OiV6wAZOORQ/JefiZ6wIdKq4
         O+lw==
X-Gm-Message-State: AOAM533p9QNNNoSDkogOKGfghcqS6EQAHtaETglho9Udeh3IECHPCfGR
        E4nAo4DfaYq8gLAlDvsZJSP5qg==
X-Google-Smtp-Source: ABdhPJyZwrOprIzdvmcveFi7XyRmyoLKXPntzsi7yqJR4dS6RSmbWCWnn1Kn6QiuHpADj0GznlJV8w==
X-Received: by 2002:a62:1896:0:b029:197:491c:be38 with SMTP id 144-20020a6218960000b0290197491cbe38mr28273517pfy.15.1614116743837;
        Tue, 23 Feb 2021 13:45:43 -0800 (PST)
Received: from smtp.gmail.com ([2620:15c:202:201:68e6:d68b:3887:f216])
        by smtp.gmail.com with ESMTPSA id r68sm137951pfc.49.2021.02.23.13.45.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Feb 2021 13:45:43 -0800 (PST)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Elliot Berman <eberman@codeaurora.org>,
        Brian Masney <masneyb@onstation.org>,
        Stephan Gerhold <stephan@gerhold.net>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>
Subject: [PATCH 2/6] firmware: qcom_scm: Reduce locking section for __get_convention()
Date:   Tue, 23 Feb 2021 13:45:35 -0800
Message-Id: <20210223214539.1336155-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210223214539.1336155-1-swboyd@chromium.org>
References: <20210223214539.1336155-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

We shouldn't need to hold this spinlock here around the entire SCM call
into the firmware and back. Instead, we should be able to query the
firmware, potentially in parallel with other CPUs making the same
convention detection firmware call, and then grab the lock to update the
calling convention detected. The convention doesn't change at runtime so
calling into firmware more than once is possibly wasteful but simpler.
Besides, this is the slow path, not the fast path where we've already
detected the convention used.

More importantly, this allows us to add more logic here to workaround
the case where the firmware call to check for availability isn't
implemented in the firmware at all. In that case we can check the
firmware node compatible string and force a calling convention.

Note that we remove the 'has_queried' logic that is repeated twice. That
could lead to the calling convention being printed multiple times to the
kernel logs if the bool is true but __query_convention() is running on
multiple CPUs. We also shorten the time where the lock is held, but we
keep the lock held around the printk because it doesn't seem hugely
important to drop it for that.

Cc: Elliot Berman <eberman@codeaurora.org>
Cc: Brian Masney <masneyb@onstation.org>
Cc: Stephan Gerhold <stephan@gerhold.net>
Cc: Jeffrey Hugo <jhugo@codeaurora.org>
Cc: Douglas Anderson <dianders@chromium.org>
Fixes: 9a434cee773a ("firmware: qcom_scm: Dynamically support SMCCC and legacy conventions")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/firmware/qcom_scm-smc.c | 12 ++++---
 drivers/firmware/qcom_scm.c     | 55 ++++++++++++++++-----------------
 drivers/firmware/qcom_scm.h     |  7 +++--
 3 files changed, 39 insertions(+), 35 deletions(-)

diff --git a/drivers/firmware/qcom_scm-smc.c b/drivers/firmware/qcom_scm-smc.c
index 497c13ba98d6..d111833364ba 100644
--- a/drivers/firmware/qcom_scm-smc.c
+++ b/drivers/firmware/qcom_scm-smc.c
@@ -77,8 +77,10 @@ static void __scm_smc_do(const struct arm_smccc_args *smc,
 	}  while (res->a0 == QCOM_SCM_V2_EBUSY);
 }
 
-int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
-		 struct qcom_scm_res *res, bool atomic)
+
+int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+		   enum qcom_scm_convention qcom_convention,
+		   struct qcom_scm_res *res, bool atomic)
 {
 	int arglen = desc->arginfo & 0xf;
 	int i;
@@ -87,9 +89,8 @@ int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	size_t alloc_len;
 	gfp_t flag = atomic ? GFP_ATOMIC : GFP_KERNEL;
 	u32 smccc_call_type = atomic ? ARM_SMCCC_FAST_CALL : ARM_SMCCC_STD_CALL;
-	u32 qcom_smccc_convention =
-			(qcom_scm_convention == SMC_CONVENTION_ARM_32) ?
-			ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
+	u32 qcom_smccc_convention = (qcom_convention == SMC_CONVENTION_ARM_32) ?
+				    ARM_SMCCC_SMC_32 : ARM_SMCCC_SMC_64;
 	struct arm_smccc_res smc_res;
 	struct arm_smccc_args smc = {0};
 
@@ -148,4 +149,5 @@ int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
 	}
 
 	return (long)smc_res.a0 ? qcom_scm_remap_error(smc_res.a0) : 0;
+
 }
diff --git a/drivers/firmware/qcom_scm.c b/drivers/firmware/qcom_scm.c
index 2be5573dce53..21e07a464bd9 100644
--- a/drivers/firmware/qcom_scm.c
+++ b/drivers/firmware/qcom_scm.c
@@ -113,11 +113,10 @@ static void qcom_scm_clk_disable(void)
 	clk_disable_unprepare(__scm->bus_clk);
 }
 
-enum qcom_scm_convention qcom_scm_convention;
-static bool has_queried __read_mostly;
-static DEFINE_SPINLOCK(query_lock);
+enum qcom_scm_convention qcom_scm_convention = SMC_CONVENTION_UNKNOWN;
+static DEFINE_SPINLOCK(scm_query_lock);
 
-static void __query_convention(void)
+static enum qcom_scm_convention __get_convention(void)
 {
 	unsigned long flags;
 	struct qcom_scm_desc desc = {
@@ -130,36 +129,36 @@ static void __query_convention(void)
 		.owner = ARM_SMCCC_OWNER_SIP,
 	};
 	struct qcom_scm_res res;
+	enum qcom_scm_convention probed_convention;
 	int ret;
 
-	spin_lock_irqsave(&query_lock, flags);
-	if (has_queried)
-		goto out;
+	if (likely(qcom_scm_convention != SMC_CONVENTION_UNKNOWN))
+		return qcom_scm_convention;
 
-	qcom_scm_convention = SMC_CONVENTION_ARM_64;
-	// Device isn't required as there is only one argument - no device
-	// needed to dma_map_single to secure world
-	ret = scm_smc_call(NULL, &desc, &res, true);
+	/*
+	 * Device isn't required as there is only one argument - no device
+	 * needed to dma_map_single to secure world
+	 */
+	probed_convention = SMC_CONVENTION_ARM_64;
+	ret = __scm_smc_call(NULL, &desc, probed_convention, &res, true);
 	if (!ret && res.result[0] == 1)
-		goto out;
+		goto found;
 
-	qcom_scm_convention = SMC_CONVENTION_ARM_32;
-	ret = scm_smc_call(NULL, &desc, &res, true);
+	probed_convention = SMC_CONVENTION_ARM_32;
+	ret = __scm_smc_call(NULL, &desc, probed_convention, &res, true);
 	if (!ret && res.result[0] == 1)
-		goto out;
-
-	qcom_scm_convention = SMC_CONVENTION_LEGACY;
-out:
-	has_queried = true;
-	spin_unlock_irqrestore(&query_lock, flags);
-	pr_info("qcom_scm: convention: %s\n",
-		qcom_scm_convention_names[qcom_scm_convention]);
-}
+		goto found;
+
+	probed_convention = SMC_CONVENTION_LEGACY;
+found:
+	spin_lock_irqsave(&scm_query_lock, flags);
+	if (probed_convention != qcom_scm_convention) {
+		qcom_scm_convention = probed_convention;
+		pr_info("qcom_scm: convention: %s\n",
+			qcom_scm_convention_names[qcom_scm_convention]);
+	}
+	spin_unlock_irqrestore(&scm_query_lock, flags);
 
-static inline enum qcom_scm_convention __get_convention(void)
-{
-	if (unlikely(!has_queried))
-		__query_convention();
 	return qcom_scm_convention;
 }
 
@@ -1239,7 +1238,7 @@ static int qcom_scm_probe(struct platform_device *pdev)
 	__scm = scm;
 	__scm->dev = &pdev->dev;
 
-	__query_convention();
+	__get_convention();
 
 	/*
 	 * If requested enable "download mode", from this point on warmboot
diff --git a/drivers/firmware/qcom_scm.h b/drivers/firmware/qcom_scm.h
index 95cd1ac30ab0..632fe3142462 100644
--- a/drivers/firmware/qcom_scm.h
+++ b/drivers/firmware/qcom_scm.h
@@ -61,8 +61,11 @@ struct qcom_scm_res {
 };
 
 #define SCM_SMC_FNID(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-extern int scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
-			struct qcom_scm_res *res, bool atomic);
+extern int __scm_smc_call(struct device *dev, const struct qcom_scm_desc *desc,
+			  enum qcom_scm_convention qcom_convention,
+			  struct qcom_scm_res *res, bool atomic);
+#define scm_smc_call(dev, desc, res, atomic) \
+	__scm_smc_call((dev), (desc), qcom_scm_convention, (res), (atomic))
 
 #define SCM_LEGACY_FNID(s, c)	(((s) << 10) | ((c) & 0x3ff))
 extern int scm_legacy_call_atomic(struct device *dev,
-- 
https://chromeos.dev

