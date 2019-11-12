Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id CC2FBF9C21
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Nov 2019 22:24:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727414AbfKLVXO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 Nov 2019 16:23:14 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:38692 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbfKLVXJ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 Nov 2019 16:23:09 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 8352A60A61; Tue, 12 Nov 2019 21:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593788;
        bh=Bb0bcKAxGO7VWwcNchC7uaDqK22feiPjektT7AJPf8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=klrzqtdlO7jODd4kcGYluOy4J4Mun11IyduDyEjZrodl98oDosKaA+KzuBcKFY/dB
         D2jQeiuwb5Jn2YS6zC6VXbDRISs5PBYJHJZNpR/bSLnul39gAD/0b2bxgLUEuc4ub2
         XdKPJXzpXHBFNA6NGYhpRi/NWagwB6JJNmielm/A=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7C75D607EF;
        Tue, 12 Nov 2019 21:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573593785;
        bh=Bb0bcKAxGO7VWwcNchC7uaDqK22feiPjektT7AJPf8U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Gq5VyvLQgBBCQ56IdFCy+sV5yMTn5GNc9GwyouN820JYDmuvN8pGVFCwSfCjGUo/P
         /KwesPE2Wen4Cl6jaWYgHRfKEvRy9/tUiMg8Eth/+/VSMNcLBkBWAa1n+UhoaLZeBs
         okd3bg/6aDWHXt9hsUQgWg+xAH51HLA9nvYzeKzw=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7C75D607EF
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     bjorn.andersson@linaro.org, saiprakash.ranjan@codeaurora.org,
        agross@kernel.org, swboyd@chromium.org
Cc:     Elliot Berman <eberman@codeaurora.org>, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 03/18] firmware: qcom_scm-64: Make SMCCC macros less magical
Date:   Tue, 12 Nov 2019 13:22:39 -0800
Message-Id: <1573593774-12539-4-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
References: <1573593774-12539-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve understandability of SMCCC macros as they are all functions of
how many arguments can be shoved in registers and how many SCM arguments
are supported.

Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index de337b3..badc245 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -57,9 +57,9 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
 #define SMCCC_FUNCNUM(s, c)	((((s) & 0xFF) << 8) | ((c) & 0xFF))
-#define SMCCC_N_EXT_ARGS 7
-#define SMCCC_FIRST_EXT_IDX 3
-#define SMCCC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SMCCC_N_EXT_ARGS + 1)
+#define SMCCC_N_REG_ARGS	4
+#define SMCCC_FIRST_EXT_IDX	(SMCCC_N_REG_ARGS - 1)
+#define SMCCC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SMCCC_N_REG_ARGS + 1)
 
 static void __qcom_scm_call_do_quirk(const struct qcom_scm_desc *desc,
 			       struct arm_smccc_res *res, u32 fn_id,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

