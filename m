Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60A382435D7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Aug 2020 10:18:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726072AbgHMISt (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 13 Aug 2020 04:18:49 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:42677 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726044AbgHMISt (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 13 Aug 2020 04:18:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1597306728; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=fPYJH02rEGHirUpQa/hMsrI8Q5lvXNI19LU3gT0cxEk=; b=apGkcimeh3Fcf4ZnKlfF9fepcWm0h3Z3viG1bjFPE/W5EK4Gaqbp2/DUcLOVHuEWAiuPIUiw
 ajx17/+xwKny9xSjEHzYul9rA0zx60ydtVmiGYLZK2HgJ2Rfl/SLoTTtrg1cnbo8Uc90VCpT
 B2ehOu79/Oz62Nbiv6E7JAhyZzE=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 5f34f7652889723bf8568ada (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 13 Aug 2020 08:18:45
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D8D45C433A1; Thu, 13 Aug 2020 08:18:44 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC46DC433C6;
        Thu, 13 Aug 2020 08:18:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC46DC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Will Deacon <will@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Marc Zyngier <maz@kernel.org>,
        Andre Przywara <andre.przywara@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Stephen Boyd <swboyd@chromium.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] arm64: Add KRYO4XX gold CPU core to spectre-v2 safe list
Date:   Thu, 13 Aug 2020 13:48:34 +0530
Message-Id: <20200813081834.13576-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

KRYO4XX gold/big CPU cores are based on Cortex-A76 which has CSV2
bits set and are spectre-v2 safe. But on big.LITTLE systems where
they are coupled with other CPU cores such as the KRYO4XX silver
based on Cortex-A55 which are spectre-v2 safe but do not have CSV2
bits set, the system wide safe value will be set to the lowest value
of CSV2 bits as per FTR_LOWER_SAFE defined for CSV2 bits of register
ID_AA64PFR0_EL1.

This is a problem when booting a guest kernel on gold CPU cores
where it will incorrectly report ARM_SMCCC_ARCH_WORKAROUND_1 warning
and consider them as vulnerable for Spectre variant 2 due to system
wide safe value which is used in kvm emulation code when reading id
registers. One wrong way of fixing this is to set the FTR_HIGHER_SAFE
for CSV2 bits, so instead add the KRYO4XX gold CPU core to the safe
list which will be consulted even when the sanitised read reports
that CSV2 bits are not set for KRYO4XX gold cores.

Reported-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 arch/arm64/kernel/cpu_errata.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 6bd1d3ad037a..6cbdd2d98a2a 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -545,6 +545,7 @@ static const struct midr_range spectre_v2_safe_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_HISI_TSV110),
 	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_3XX_SILVER),
 	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_SILVER),
+	MIDR_ALL_VERSIONS(MIDR_QCOM_KRYO_4XX_GOLD),
 	{ /* sentinel */ }
 };
 
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

