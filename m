Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6D6DD2705B4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Sep 2020 21:40:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726252AbgIRTkJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 18 Sep 2020 15:40:09 -0400
Received: from m42-11.mailgun.net ([69.72.42.11]:35340 "EHLO
        m42-11.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726285AbgIRTkC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 18 Sep 2020 15:40:02 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600458001; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=YNP9nGCLTcFA3OeJDr89uyL4eVQiCENswft205cE+2s=; b=oNsoipOoF+YTRoXNXjiySUE4Tfp5aXiXkb21WGwbGyKHG5FygvZOkno1A8AVyyym/tq7MCsx
 bxpiPwJGomSCP5K+tLuXH15Rgj9r22/v/nSACtazf1sHUCeVQYHUFSGX8vTsn+Jof/Q8dVoZ
 hAvAeYcsPmQ8otnK9+jn31eVqMc=
X-Mailgun-Sending-Ip: 69.72.42.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f650d1191755cb92bbf5a18 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 18 Sep 2020 19:40:01
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 18EFAC43387; Fri, 18 Sep 2020 19:40:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from malabar-linux.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 26DEDC433C8;
        Fri, 18 Sep 2020 19:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 26DEDC433C8
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=bbhatt@codeaurora.org
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Subject: [PATCH v3 1/3] bus: mhi: Fix entries based on Kconfig coding style
Date:   Fri, 18 Sep 2020 12:39:50 -0700
Message-Id: <1600457992-18448-2-git-send-email-bbhatt@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1600457992-18448-1-git-send-email-bbhatt@codeaurora.org>
References: <1600457992-18448-1-git-send-email-bbhatt@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Kconfig coding style mandates use of tabs for the configuration
definition and an additional two spaces for the help text. Make the
required changes to the MHI Kconfig adhering to those guidelines.

Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
---
 drivers/bus/mhi/Kconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/bus/mhi/Kconfig b/drivers/bus/mhi/Kconfig
index a8bd9bd..6677ccc 100644
--- a/drivers/bus/mhi/Kconfig
+++ b/drivers/bus/mhi/Kconfig
@@ -6,9 +6,9 @@
 #
 
 config MHI_BUS
-       tristate "Modem Host Interface (MHI) bus"
-       help
-	 Bus driver for MHI protocol. Modem Host Interface (MHI) is a
-	 communication protocol used by the host processors to control
-	 and communicate with modem devices over a high speed peripheral
-	 bus or shared memory.
+	tristate "Modem Host Interface (MHI) bus"
+	help
+	  Bus driver for MHI protocol. Modem Host Interface (MHI) is a
+	  communication protocol used by the host processors to control
+	  and communicate with modem devices over a high speed peripheral
+	  bus or shared memory.
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

