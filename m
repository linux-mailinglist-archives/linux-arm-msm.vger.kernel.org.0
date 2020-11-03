Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DB8972A45BA
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Nov 2020 13:58:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729028AbgKCM61 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Nov 2020 07:58:27 -0500
Received: from z5.mailgun.us ([104.130.96.5]:44438 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729053AbgKCM60 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Nov 2020 07:58:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604408306; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=Yy1YShYoIqM2gl9uWMg2YQQbSpcTlCitlQYEwQYlOoE=; b=jrwH9KR8PF23/FvsX2CCxA79wpf/1HZRv/MJnR+i60VBPWH1ymn722eOrTJh7wyQYVo+7D02
 XlNTRdxZdb/aqheCpwRRB3nxKFCOw+gMLb+MakWmrlgZLXfBPW0K/TRewmLfUws2MRuEX51j
 4naDeEqR+VcPigU7sP9eDIC7QjY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-east-1.postgun.com with SMTP id
 5fa153eb8646b0f268f352c7 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2020 12:58:19
 GMT
Sender: sidgup=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E6DFDC4A61D; Tue,  3 Nov 2020 09:19:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from sidgup-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7534CC38545;
        Tue,  3 Nov 2020 09:19:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7534CC38545
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
From:   Siddharth Gupta <sidgup@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com,
        linux-remoteproc@vger.kernel.org
Cc:     Siddharth Gupta <sidgup@codeaurora.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v7 4/4] remoteproc: qcom: Add minidump id for sm8150 modem
Date:   Tue,  3 Nov 2020 01:19:20 -0800
Message-Id: <1604395160-12443-5-git-send-email-sidgup@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
References: <1604395160-12443-1-git-send-email-sidgup@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add minidump id for modem in sm8150 chipset so that the regions to be
included in the coredump generated upon a crash is based on the minidump
tables in SMEM instead of those in the ELF header.

Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 349f725..23f4532 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -707,6 +707,7 @@ static const struct adsp_data mpss_resource_init = {
 	.crash_reason_smem = 421,
 	.firmware_name = "modem.mdt",
 	.pas_id = 4,
+	.minidump_id = 3,
 	.has_aggre2_clk = false,
 	.auto_boot = false,
 	.active_pd_names = (char*[]){
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

