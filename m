Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AD5B2EFC34
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Jan 2021 01:32:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725877AbhAIAar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 Jan 2021 19:30:47 -0500
Received: from so254-31.mailgun.net ([198.61.254.31]:49354 "EHLO
        so254-31.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726429AbhAIAaq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 Jan 2021 19:30:46 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1610152223; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=/UzpSUzQlXPBPQkn7Vw+DS3IUNoOjIx7BnHc/ReGtgc=; b=XD43z5ayo3Dz0biIYLiIKNCp/DaQP0uMXnn+sv00/6Zkgnb8g8WUrlCktXZzUtE5Y1tfuqMO
 t0s/3Qkme2VXS1B8SdOV8Bg8V2vpcOSGi8hSEnZG/v6el7YayVfs3a3QNxqVKSwJMK6wrlzL
 Oddvp+eSddark5mmROs2x5VtTKQ=
X-Mailgun-Sending-Ip: 198.61.254.31
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5ff8f8f98fb3cda82f53733d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 09 Jan 2021 00:29:45
 GMT
Sender: sramana=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C224C433ED; Sat,  9 Jan 2021 00:29:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sramana-linux1.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sramana)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7818BC433ED;
        Sat,  9 Jan 2021 00:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7818BC433ED
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sramana@codeaurora.org
From:   Srinivas Ramana <sramana@codeaurora.org>
To:     catalin.marinas@arm.com, will@kernel.org, pajay@qti.qualcomm.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Ramana <sramana@codeaurora.org>,
        Prasad Sodagudi <psodagud@codeaurora.org>
Subject: [PATCH 2/3] arm64: cpufeature: Add a filter function to cpufeature
Date:   Fri,  8 Jan 2021 16:29:22 -0800
Message-Id: <1610152163-16554-3-git-send-email-sramana@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
References: <1610152163-16554-1-git-send-email-sramana@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a filter function to cpufeature so that it can be used
when dynamic control of the feature is required.

Signed-off-by: Ajay Patil <pajay@qti.qualcomm.com>
Signed-off-by: Prasad Sodagudi <psodagud@codeaurora.org>
Signed-off-by: Srinivas Ramana <sramana@codeaurora.org>
---
 arch/arm64/include/asm/cpufeature.h |  8 +++++++-
 arch/arm64/kernel/cpufeature.c      | 15 ++++++++++-----
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
index 9a555809b89c..81a5c97d647d 100644
--- a/arch/arm64/include/asm/cpufeature.h
+++ b/arch/arm64/include/asm/cpufeature.h
@@ -61,6 +61,7 @@ struct arm64_ftr_bits {
 	u8		shift;
 	u8		width;
 	s64		safe_val; /* safe value for FTR_EXACT features */
+	s64		(*filter)(const struct arm64_ftr_bits *ftrp, s64 fval);
 };
 
 /*
@@ -566,7 +567,12 @@ cpuid_feature_extract_field(u64 features, int field, bool sign)
 
 static inline s64 arm64_ftr_value(const struct arm64_ftr_bits *ftrp, u64 val)
 {
-	return (s64)cpuid_feature_extract_field_width(val, ftrp->shift, ftrp->width, ftrp->sign);
+	s64 fval = (s64)cpuid_feature_extract_field_width(val, ftrp->shift,
+					ftrp->width, ftrp->sign);
+
+	if (ftrp->filter)
+		fval = ftrp->filter(ftrp, fval);
+	return fval;
 }
 
 static inline bool id_aa64mmfr0_mixed_endian_el0(u64 mmfr0)
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 7ffb5f1d8b68..b2ffa9eaaaff 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -132,23 +132,28 @@ DEFINE_STATIC_KEY_ARRAY_FALSE(cpu_hwcap_keys, ARM64_NCAPS);
 EXPORT_SYMBOL(cpu_hwcap_keys);
 
 #define __ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
-	{						\
 		.sign = SIGNED,				\
 		.visible = VISIBLE,			\
 		.strict = STRICT,			\
 		.type = TYPE,				\
 		.shift = SHIFT,				\
 		.width = WIDTH,				\
-		.safe_val = SAFE_VAL,			\
-	}
+		.safe_val = SAFE_VAL
 
 /* Define a feature with unsigned values */
 #define ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
-	__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
+	{__ARM64_FTR_BITS(FTR_UNSIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL), }
 
 /* Define a feature with a signed value */
 #define S_ARM64_FTR_BITS(VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL) \
-	__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL)
+	{__ARM64_FTR_BITS(FTR_SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL), }
+
+/* Define a feature with a filter function to process the field value */
+#define FILTERED_ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL, filter_fn) \
+	{											\
+		__ARM64_FTR_BITS(SIGNED, VISIBLE, STRICT, TYPE, SHIFT, WIDTH, SAFE_VAL),	\
+		.filter = filter_fn,								\
+	}
 
 #define ARM64_FTR_END					\
 	{						\
-- 
2.7.4

