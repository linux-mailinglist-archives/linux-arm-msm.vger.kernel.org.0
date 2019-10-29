Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B724EE938E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 00:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbfJ2X1p (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 19:27:45 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:35318 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726028AbfJ2X1o (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 19:27:44 -0400
Received: by mail-pl1-f196.google.com with SMTP id x6so70521pln.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2019 16:27:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACl3OaVOTym+qDwRiwEDHteytsmPG8qRkDZ/xp8Jsfs=;
        b=Sg0u4cvybiJKNJ2yk93E2dB2T47O85yhZ0eGiygp5ebFLX8FXezKujJzdiva88wV/8
         Zg9GPLhEFk4fP51MbMbYuBFfk6V505AMJniXLB0aL//ZQrrk086ByYlv/uYxl4s+qdgI
         YptgAvtlYL2Tr2cRDl2DMTc8kyJJhDQjpsSbrYX9iIr7Q2hQxkAvCt1dhy8714CcAqIC
         zJuJavMzQeTIiyzRXrqcd4kFFnwpPvnWveIOHNon8Y4R7o9fBbUm+7J/JTzYcf3fI3lr
         ISkDKmeM2glo/AHCqjlFq2Ra55NGniPP1aj+IXTdznBwbGZfMf6oisKYkVulczJnXkV9
         izPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ACl3OaVOTym+qDwRiwEDHteytsmPG8qRkDZ/xp8Jsfs=;
        b=WoDIyykU2jMPW+/vY3FZ/CzT3hv8W5er73Ztrml44M1r0hTp75v60bqMby/hl20wjT
         emQx3JP+RYqyKJ8YH+I4C1VXE3dg9xS6cuLAfJqD/QXhI9uofqRYjFW8Ejd79dUbpRZO
         it73R7dms6QWIcz3IKsCXkppITCPj/QAfbleYB3po+Z8d2L+jmtZn9OiKDSeMnqfP7oN
         gPyKfh0B2vXQndZCZvFWbq7/xS8OsAx3Mu0Yj0u5f79TjFLleYKFmOILybX3n15TbyT5
         /78+AYmwMxJaEhXaSYUlyk3H4JdiOLXeTes6moZSUSMKVQ0YMc9UEK2O4+qPns/ZSef3
         jWXg==
X-Gm-Message-State: APjAAAXvf1p4CJyA4Dfh2nOkmfxjOuuHzoCbhDqwZXHSd1ByUVAN3536
        TwyqQJ9p7/uUwnDPjeKPjVqVJg==
X-Google-Smtp-Source: APXvYqxOTPAX0Pab8uisqVInBDEc0929OSy+5xrNgVs1Q/j1JgZT6U0hX+J++tV2P0onHll9jWcFpw==
X-Received: by 2002:a17:902:b116:: with SMTP id q22mr1259148plr.201.1572391662476;
        Tue, 29 Oct 2019 16:27:42 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v19sm211050pff.46.2019.10.29.16.27.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Oct 2019 16:27:41 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v2] arm64: cpufeature: Enable Qualcomm Falkor errata 1009 for Kryo
Date:   Tue, 29 Oct 2019 16:27:38 -0700
Message-Id: <20191029232738.1483923-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Kryo cores share errata 1009 with Falkor, so add their model
definitions and enable it for them as well.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Use is_kryo_midr(), rather than listing each individual model.

 arch/arm64/kernel/cpu_errata.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 3facd5ca52ed..613075817abe 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -623,17 +623,23 @@ static const struct midr_range arm64_harden_el2_vectors[] = {
 #endif
 
 #ifdef CONFIG_ARM64_WORKAROUND_REPEAT_TLBI
-
-static const struct midr_range arm64_repeat_tlbi_cpus[] = {
+static const struct arm64_cpu_capabilities arm64_repeat_tlbi_list[] = {
 #ifdef CONFIG_QCOM_FALKOR_ERRATUM_1009
-	MIDR_RANGE(MIDR_QCOM_FALKOR_V1, 0, 0, 0, 0),
+	{
+		ERRATA_MIDR_REV(MIDR_QCOM_FALKOR_V1, 0, 0)
+	},
+	{
+		.midr_range.model = MIDR_QCOM_KRYO,
+		.matches = is_kryo_midr,
+	},
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_1286807
-	MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 0),
+	{
+		ERRATA_MIDR_RANGE(MIDR_CORTEX_A76, 0, 0, 3, 0),
+	},
 #endif
 	{},
 };
-
 #endif
 
 #ifdef CONFIG_CAVIUM_ERRATUM_27456
@@ -789,7 +795,9 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 	{
 		.desc = "Qualcomm erratum 1009, ARM erratum 1286807",
 		.capability = ARM64_WORKAROUND_REPEAT_TLBI,
-		ERRATA_MIDR_RANGE_LIST(arm64_repeat_tlbi_cpus),
+		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+		.matches = cpucap_multi_entry_cap_matches,
+		.match_list = arm64_repeat_tlbi_list,
 	},
 #endif
 #ifdef CONFIG_ARM64_ERRATUM_858921
-- 
2.23.0

