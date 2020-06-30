Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BD520FB46
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 20:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389458AbgF3SB4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 14:01:56 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23938 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390565AbgF3SBz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 14:01:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593540114; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=7J3205xHAcKIOZ0yxFzSuU5/RNmIfj1AAO+iEidcbgM=; b=JaOUKt90ybZa5fBVzPJ8V5jOfejNawGAz/igU8SL60M4UScmEYEbqCjEPKkoHN7UFFx6eEFZ
 SYzq0NjVnqCRt/L9TnGzfpbb9yqlnf3256l9g88Xndm05OEFKslxYxoHK9I8KEI9wswrnJVN
 IajUslahgpVc+mLTZ8BEZYiuvXw=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 5efb7df3a6e154319f7af314 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 18:01:23
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3F8D5C433CA; Tue, 30 Jun 2020 18:01:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EB928C433C8;
        Tue, 30 Jun 2020 18:01:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EB928C433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Douglas Anderson <dianders@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, Jeffrey Hugo <jhugo@codeaurora.org>,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH 2/3] arm64: Add KRYO4XX gold CPU cores to erratum list 1463225 and 1418040
Date:   Tue, 30 Jun 2020 23:30:54 +0530
Message-Id: <83780e80c6377c12ca51b5d53186b61241685e49.1593539394.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

KRYO4XX gold/big CPU core revisions r0p0 to r3p1 are affected by
erratum 1463225 and 1418040, so add them to the respective list.
The variant and revision bits are implementation defined and are
different from the their Cortex CPU counterparts on which they are
based on, i.e., (r0p0 to r3p1) is equivalent to (rcpe to rfpf).

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/arm64/silicon-errata.rst |  4 ++++
 arch/arm64/kernel/cpu_errata.c         | 19 +++++++++++++------
 2 files changed, 17 insertions(+), 6 deletions(-)

diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
index 936cf2a59ca4..f3c0c4393e7e 100644
--- a/Documentation/arm64/silicon-errata.rst
+++ b/Documentation/arm64/silicon-errata.rst
@@ -147,6 +147,10 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Falkor v{1,2}   | E1041           | QCOM_FALKOR_ERRATUM_1041    |
 +----------------+-----------------+-----------------+-----------------------------+
+| Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1463225       |
++----------------+-----------------+-----------------+-----------------------------+
+| Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1418040       |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index cf50c53e9357..044f1d7aebdf 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -472,12 +472,7 @@ static bool
 has_cortex_a76_erratum_1463225(const struct arm64_cpu_capabilities *entry,
 			       int scope)
 {
-	u32 midr = read_cpuid_id();
-	/* Cortex-A76 r0p0 - r3p1 */
-	struct midr_range range = MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 1);
-
-	WARN_ON(scope != SCOPE_LOCAL_CPU || preemptible());
-	return is_midr_in_range(midr, &range) && is_kernel_in_hyp_mode();
+	return is_affected_midr_range_list(entry, scope) && is_kernel_in_hyp_mode();
 }
 #endif
 
@@ -728,6 +723,8 @@ static const struct midr_range erratum_1418040_list[] = {
 	MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 1),
 	/* Neoverse-N1 r0p0 to r3p1 */
 	MIDR_RANGE(MIDR_NEOVERSE_N1, 0, 0, 3, 1),
+	/* Kryo4xx Gold (rcpe to rfpf) => (r0p0 to r3p1) */
+	MIDR_RANGE(MIDR_QCOM_KRYO_4XX_GOLD, 0xc, 0xe, 0xf, 0xf),
 	{},
 };
 #endif
@@ -777,6 +774,15 @@ static const struct midr_range erratum_speculative_at_list[] = {
 };
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_1463225
+static const struct midr_range erratum_1463225[] = {
+	/* Cortex-A76 r0p0 - r3p1 */
+	MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 1),
+	/* Kryo4xx Gold (rcpe to rfpf) => (r0p0 to r3p1) */
+	MIDR_RANGE(MIDR_QCOM_KRYO_4XX_GOLD, 0xc, 0xe, 0xf, 0xf),
+};
+#endif
+
 const struct arm64_cpu_capabilities arm64_errata[] = {
 #ifdef CONFIG_ARM64_WORKAROUND_CLEAN_CACHE
 	{
@@ -916,6 +922,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 		.capability = ARM64_WORKAROUND_1463225,
 		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
 		.matches = has_cortex_a76_erratum_1463225,
+		.midr_range_list = erratum_1463225,
 	},
 #endif
 #ifdef CONFIG_CAVIUM_TX2_ERRATUM_219
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

