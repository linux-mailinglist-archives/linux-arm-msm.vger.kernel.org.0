Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EED6A13338F
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Jan 2020 22:20:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728964AbgAGVT5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Jan 2020 16:19:57 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:48290 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729082AbgAGVEo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Jan 2020 16:04:44 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578431084; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ktTICb0pqeIhsoL9iz0mVGvt/SWbzJYQSsAxmkhWOzU=; b=FYkGl1sDVNM0NMCt98YweZMYfIIBM5EBy6LHqb2+i9UEVyGk6WnhUa/oDRnjMIeaeVtV8ckg
 ORABYNpZ71RhPeQIzi0mtQXtg6kiNJC4PycH8tNAnTAx31K+purKsahqN5o4777+XwPW4FGs
 49lE+hCmayyofBcAr+9QlpYRZLw=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e14f267.7f4307d08f48-smtp-out-n03;
 Tue, 07 Jan 2020 21:04:39 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 928FAC447AD; Tue,  7 Jan 2020 21:04:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from eberman-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: eberman)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5842C447AC;
        Tue,  7 Jan 2020 21:04:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5842C447AC
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=eberman@codeaurora.org
From:   Elliot Berman <eberman@codeaurora.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>, agross@kernel.org,
        swboyd@chromium.org, Stephan Gerhold <stephan@gerhold.net>
Cc:     Elliot Berman <eberman@codeaurora.org>,
        saiprakash.ranjan@codeaurora.org, tsoni@codeaurora.org,
        sidgup@codeaurora.org, psodagud@codeaurora.org,
        Brian Masney <masneyb@onstation.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v5 04/17] firmware: qcom_scm-64: Make SMC macros less magical
Date:   Tue,  7 Jan 2020 13:04:13 -0800
Message-Id: <1578431066-19600-5-git-send-email-eberman@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
References: <1578431066-19600-1-git-send-email-eberman@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Improve understandability of SMC macros by reversing the logic as they
are all functions of how many arguments can be shoved in registers and
how many SCM arguments are supported.

There aren't 4 register arguments because are 7 arguments that go into a
buffer - there are up to 7 arguments that are overflowed into a buffer
because only 4 registers are allocated for arguments.

Change-Id: Iac0378fc4c5e20943a64b98223d53caa4955dd53
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Brian Masney <masneyb@onstation.org> # arm32
Tested-by: Stephan Gerhold <stephan@gerhold.net>
Signed-off-by: Elliot Berman <eberman@codeaurora.org>
---
 drivers/firmware/qcom_scm-64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/qcom_scm-64.c b/drivers/firmware/qcom_scm-64.c
index 976c2b9..3101f36 100644
--- a/drivers/firmware/qcom_scm-64.c
+++ b/drivers/firmware/qcom_scm-64.c
@@ -58,9 +58,9 @@ static DEFINE_MUTEX(qcom_scm_lock);
 #define QCOM_SCM_EBUSY_WAIT_MS 30
 #define QCOM_SCM_EBUSY_MAX_RETRY 20
 
-#define SCM_SMC_N_EXT_ARGS 7
-#define SCM_SMC_FIRST_EXT_IDX 3
-#define SCM_SMC_N_REG_ARGS (MAX_QCOM_SCM_ARGS - SCM_SMC_N_EXT_ARGS + 1)
+#define SCM_SMC_N_REG_ARGS	4
+#define SCM_SMC_FIRST_EXT_IDX	(SCM_SMC_N_REG_ARGS - 1)
+#define SCM_SMC_N_EXT_ARGS	(MAX_QCOM_SCM_ARGS - SCM_SMC_N_REG_ARGS + 1)
 
 static void __scm_smc_do_quirk(const struct qcom_scm_desc *desc,
 			       struct arm_smccc_res *res, u32 fn_id,
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
