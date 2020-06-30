Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A074B20FB43
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Jun 2020 20:01:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388845AbgF3SBr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 30 Jun 2020 14:01:47 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:23938 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390565AbgF3SBq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 30 Jun 2020 14:01:46 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1593540106; h=Content-Transfer-Encoding: MIME-Version:
 References: In-Reply-To: Message-Id: Date: Subject: Cc: To: From:
 Sender; bh=+G0qzjq7xTY88X7OcBYQaImWxX0IMwWEgRF+hWEiQZg=; b=HpHQw6LpETosV3Dqfz8YuIrVd8E2DFwkSx0Op+ShXeDG6CJk4EjoLkLI8wKR+W2CYVCchUwT
 3c4pVHR+hM2MmRxNtPNnWt+q2GHva8heFjITgCpF+EB8DsTGUVqyjQTuvZXuECy11HRfze9K
 uRyBh6skhfL0RzY5rEU+go7aPRk=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n20.prod.us-east-1.postgun.com with SMTP id
 5efb7df98fe116ddd942964f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 30 Jun 2020 18:01:29
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2C129C433CA; Tue, 30 Jun 2020 18:01:28 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72BCCC433C6;
        Tue, 30 Jun 2020 18:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 72BCCC433C6
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
Subject: [PATCH 3/3] arm64: Add KRYO4XX silver CPU cores to erratum list 1530923 and 1024718
Date:   Tue, 30 Jun 2020 23:30:55 +0530
Message-Id: <7013e8a3f857ca7e82863cc9e34a614293d7f80c.1593539394.git.saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
References: <cover.1593539394.git.saiprakash.ranjan@codeaurora.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

KRYO4XX silver/LITTLE CPU cores with revision r1p0 are affected by
erratum 1530923 and 1024718, so add them to the respective list.
The variant and revision bits are implementation defined and are
different from the their Cortex CPU counterparts on which they are
based on, i.e., r1p0 is equivalent to rdpe.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 Documentation/arm64/silicon-errata.rst | 4 ++++
 arch/arm64/kernel/cpu_errata.c         | 2 ++
 arch/arm64/kernel/cpufeature.c         | 2 ++
 3 files changed, 8 insertions(+)

diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
index f3c0c4393e7e..3f7c3a7e8a2b 100644
--- a/Documentation/arm64/silicon-errata.rst
+++ b/Documentation/arm64/silicon-errata.rst
@@ -151,6 +151,10 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | Qualcomm Tech. | Kryo4xx Gold    | N/A             | ARM64_ERRATUM_1418040       |
 +----------------+-----------------+-----------------+-----------------------------+
+| Qualcomm Tech. | Kryo4xx Silver  | N/A             | ARM64_ERRATUM_1530923       |
++----------------+-----------------+-----------------+-----------------------------+
+| Qualcomm Tech. | Kryo4xx Silver  | N/A             | ARM64_ERRATUM_1024718       |
++----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
 | Fujitsu        | A64FX           | E#010001        | FUJITSU_ERRATUM_010001      |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 044f1d7aebdf..8e302dc093d0 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -769,6 +769,8 @@ static const struct midr_range erratum_speculative_at_list[] = {
 #ifdef CONFIG_ARM64_ERRATUM_1530923
 	/* Cortex A55 r0p0 to r2p0 */
 	MIDR_RANGE(MIDR_CORTEX_A55, 0, 0, 2, 0),
+	/* Kryo4xx Silver (rdpe => r1p0) */
+	MIDR_REV(MIDR_QCOM_KRYO_4XX_SILVER, 0xd, 0xe),
 #endif
 	{},
 };
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 9f63053a63a9..9fae0efc80c1 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1408,6 +1408,8 @@ static bool cpu_has_broken_dbm(void)
 	static const struct midr_range cpus[] = {
 #ifdef CONFIG_ARM64_ERRATUM_1024718
 		MIDR_RANGE(MIDR_CORTEX_A55, 0, 0, 1, 0),  // A55 r0p0 -r1p0
+		/* Kryo4xx Silver (rdpe => r1p0) */
+		MIDR_REV(MIDR_QCOM_KRYO_4XX_SILVER, 0xd, 0xe),
 #endif
 		{},
 	};
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

