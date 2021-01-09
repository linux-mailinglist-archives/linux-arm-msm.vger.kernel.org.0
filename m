Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D8C0B2EFC2D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 01:32:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbhAIAaj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 19:30:39 -0500
Received: from m43-15.mailgun.net ([69.72.43.15]:58641 "EHLO
        m43-15.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726300AbhAIAaj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 19:30:39 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610152218; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=x4r+cxfcBhFHJ1Qr3evoxkKZBnhLO4PcCu/YZQwVgd4=; b=RQoSQJMKZ792ZxHnqnQdKyNWD3dVu2T9Z+5q9U0oZPu4zz/RBE57hhdJ1Dhva8RdNdhcISFA
 WmI26pkiccJvpOrogkU47zjAKeLI6faCA8jIMBR6lSei6AYUhhDyzDNlSEqmmCkTQ6hJRIjf
 4qnlWYqnfp72qLiicdoZZimxz9c=
X-Mailgun-Sending-Ip: 69.72.43.15
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 5ff8f8fa4dcca12475ec3087 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:29:46
 GMT
Sender: sramana=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 62E47C43466; Sat,  9 Jan 2021 00:29:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from sramana-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 218FFC43464;
        Sat,  9 Jan 2021 00:29:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 218FFC43464
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sramana@codeaurora.org
From:   Srinivas Ramana <sramana@codeaurora.org>
To:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH 3/3] arm64: Enable control of pointer authentication using early param
Date:   Fri,  8 Jan 2021 16:29:23 -0800
Message-Id: <1610152163-16554-4-git-send-email-sramana@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add support to control turning off the pointer authentication
using a kernel command line early param.
This will help control pointer authentication feature for both kernel
and userspace without kernel changes.

Signed-off-by: Ajay Patil <pajay@qti.qualcomm.com>
Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++
 arch/arm64/kernel/cpufeature.c                  | 38 +++++++++++++++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index c722ec19cd00..d6855e0a9085 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -373,6 +373,12 @@
 	arcrimi=	[HW,NET] ARCnet - "RIM I" (entirely mem-mapped) cards
 			Format: <io>,<irq>,<nodeID>
 
+	arm64.disable_ptr_auth=
+			[ARM64] Force disable Linux support for address
+			authentication (both user and in-kernel).
+			0 - Pointer authentication is enabled[Default]
+			1 - Pointer authentication is force disabled
+
 	ataflop=	[HW,M68k]
 
 	atarimouse=	[HW,MOUSE] Atari Mouse
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index b2ffa9eaaaff..bdaaff78240b 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -164,6 +164,24 @@ static void cpu_enable_cnp(struct arm64_cpu_capabilities const *cap);
 
 static bool __system_matches_cap(unsigned int n);
 
+#ifdef CONFIG_ARM64_PTR_AUTH
+bool arm64_disable_ptr_auth;
+
+static int __init arm64_disable_ptr_auth_fn(char *buf)
+{
+	return strtobool(buf, &arm64_disable_ptr_auth);
+}
+early_param("arm64.disable_ptr_auth", arm64_disable_ptr_auth_fn);
+
+s64 ptr_auth_ftr_filter(const struct arm64_ftr_bits *ftrp, s64 val)
+{
+	if (arm64_disable_ptr_auth)
+		return 0;
+	else
+		return val;
+}
+#endif
+
 /*
  * NOTE: Any changes to the visibility of features should be kept in
  * sync with the documentation of the CPU feature register ABI.
@@ -193,17 +211,21 @@ static const struct arm64_ftr_bits ftr_id_aa64isar1[] = {
 	ARM64_FTR_BITS(FTR_HIDDEN, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_SPECRES_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_SB_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_FRINTTS_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
-		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPI_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
-		       FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_GPA_SHIFT, 4, 0),
+#ifdef CONFIG_ARM64_PTR_AUTH
+	FILTERED_ARM64_FTR_BITS(FTR_UNSIGNED, FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE,
+				ID_AA64ISAR1_GPI_SHIFT, 4, 0, ptr_auth_ftr_filter),
+	FILTERED_ARM64_FTR_BITS(FTR_UNSIGNED, FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE,
+				ID_AA64ISAR1_GPA_SHIFT, 4, 0, ptr_auth_ftr_filter),
+#endif
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_LRCPC_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_FCMA_SHIFT, 4, 0),
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_JSCVT_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
-		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_API_SHIFT, 4, 0),
-	ARM64_FTR_BITS(FTR_VISIBLE_IF_IS_ENABLED(CONFIG_ARM64_PTR_AUTH),
-		       FTR_STRICT, FTR_EXACT, ID_AA64ISAR1_APA_SHIFT, 4, 0),
+#ifdef CONFIG_ARM64_PTR_AUTH
+	FILTERED_ARM64_FTR_BITS(FTR_UNSIGNED, FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE,
+				ID_AA64ISAR1_API_SHIFT, 4, 0, ptr_auth_ftr_filter),
+	FILTERED_ARM64_FTR_BITS(FTR_UNSIGNED, FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE,
+				ID_AA64ISAR1_APA_SHIFT, 4, 0, ptr_auth_ftr_filter),
+#endif
 	ARM64_FTR_BITS(FTR_VISIBLE, FTR_STRICT, FTR_LOWER_SAFE, ID_AA64ISAR1_DPB_SHIFT, 4, 0),
 	ARM64_FTR_END,
 };
-- 
2.7.4

