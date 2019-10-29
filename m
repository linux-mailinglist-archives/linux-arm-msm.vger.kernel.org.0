Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7B374E800A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2019 07:04:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbfJ2GEl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 29 Oct 2019 02:04:41 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:38631 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728780AbfJ2GEh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 29 Oct 2019 02:04:37 -0400
Received: by mail-pg1-f193.google.com with SMTP id w3so8765652pgt.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 28 Oct 2019 23:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W39xK+ySX7H/kO8T3j/KlPzC4OMMNyJJ/QXMm12Hpvo=;
        b=wFrRxMABLQ165DVY6sbzKHMB7LJ758eBnstL/y7tQiTvNJ9qfonFBbEVwfm1VzIvhs
         S8hLdkn+0DTr6yTaAHC5L8W9b3kpDiVc4mfQwg8oO95RSOabs0CO4WrVpZ365J6VX0gV
         on2uKoTVeYVQr9p+1nh+gN3JFQMEPC081QZU8CGnjIihtRlciaDuYCmXQaLntpBK1ce6
         o7VnDWn4v6iHmLBg8J6MkEMLrR3vHk1RB2SSc+ys4dF47ak0gBDS7/xKfkKV1OFtbxI3
         j9c23q+7PiFpC5iotdyjTlXjR4CD39Y+6SGhAfa8+kOpGvl7urHlU/+X9GptTa8zT4xG
         tt7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W39xK+ySX7H/kO8T3j/KlPzC4OMMNyJJ/QXMm12Hpvo=;
        b=AfFedUxf7yIX91FHTE8ERzTAmDkpr0Bcry0xniSnwYF1stt8lNhysy3K+VvQ6+oIld
         HTetAujIouyfksvfK99kCEWApe+o9wxObd9jXhiiJReJ2DOT3QtSHbqwhM8NkkY8lqRe
         n50MHRXKGpuPVwQvYJIAch+zvsflT0JsYAlxdkyMe/3lrDZKrggoT0ekhJzzW/wkVdjD
         BEAXgTAMsztki+whHGQaZ8vOHJayM3rW1RrW6difQ3uauA2dZcJ0RfhbIUT2leGfU7oV
         /2zsGRRV47R0A0nBZcNRKWfigvQznX33/O5oCouL3oPB0bBJZdtWAR4AoD1bMyavu6AK
         VkdA==
X-Gm-Message-State: APjAAAVWjsEZ5OVMrpXM4EMNtb11TsTK0WVDYiUGIe+RRepgf3YeV4u9
        lVZuLsgzzQGd/h/JF1NQ343RLg==
X-Google-Smtp-Source: APXvYqwOn0neNqJeKEUk/f0BRI2tYbCUjSJDkCwqVRLXz8R0SbZ3JB398pufLg4JdNAgA2Ia3mCNHA==
X-Received: by 2002:a17:90b:282:: with SMTP id az2mr3930080pjb.23.1572329076618;
        Mon, 28 Oct 2019 23:04:36 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id q34sm1338607pjb.15.2019.10.28.23.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2019 23:04:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Mark Brown <broonie@kernel.org>
Subject: [PATCH] arm64: cpufeature: Enable Qualcomm erratas
Date:   Mon, 28 Oct 2019 23:04:32 -0700
Message-Id: <20191029060432.1208859-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

With the introduction of 'cce360b54ce6 ("arm64: capabilities: Filter the
entries based on a given mask")' the Qualcomm erratas are no long
applied.

The result of not applying errata 1003 is that MSM8996 runs into various
RCU stalls and fails to boot most of the times.

Give both 1003 and 1009 a "type" to ensure they are not filtered out in
update_cpu_capabilities().

Fixes: cce360b54ce6 ("arm64: capabilities: Filter the entries based on a given mask")
Cc: stable@vger.kernel.org
Reported-by: Mark Brown <broonie@kernel.org>
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 arch/arm64/kernel/cpu_errata.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index df9465120e2f..cdd8df033536 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -780,6 +780,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 	{
 		.desc = "Qualcomm Technologies Falkor/Kryo erratum 1003",
 		.capability = ARM64_WORKAROUND_QCOM_FALKOR_E1003,
+		.type = ARM64_CPUCAP_SCOPE_LOCAL_CPU,
 		.matches = cpucap_multi_entry_cap_matches,
 		.match_list = qcom_erratum_1003_list,
 	},
@@ -788,6 +789,7 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 	{
 		.desc = "Qualcomm erratum 1009, ARM erratum 1286807",
 		.capability = ARM64_WORKAROUND_REPEAT_TLBI,
+		.type = ARM64_CPUCAP_SCOPE_LOCAL_CPU,
 		ERRATA_MIDR_RANGE_LIST(arm64_repeat_tlbi_cpus),
 	},
 #endif
-- 
2.23.0

