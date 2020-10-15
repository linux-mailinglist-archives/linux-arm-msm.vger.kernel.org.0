Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70DA928F29A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Oct 2020 14:45:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728107AbgJOMpl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 15 Oct 2020 08:45:41 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:16460 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727785AbgJOMpl (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 15 Oct 2020 08:45:41 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602765940; h=Content-Transfer-Encoding: MIME-Version:
 Message-Id: Date: Subject: Cc: To: From: Sender;
 bh=tUBuuOkOpn8dlBCi3UTRT7w8MbxjgT0dLTMorbW/WKw=; b=nhHpg3LSppvTn1mnowGlHfWmum1X3cd1ATgYfOeSRSQ1h0epb9yLm3Fq8TJdOityX8Quh/c4
 03xtgFNen2Ug17xh3NbMVfCfGpcSyYCJWdBYCwtjnZUuJ2HgonAWQaOi7+lN0JXxA+o5hQAZ
 WCvgzbEsFUiNVzMWDQnLKdjYrow=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f88447406d81bc48d36fb6c (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 15 Oct 2020 12:45:40
 GMT
Sender: saiprakash.ranjan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 398E5C43391; Thu, 15 Oct 2020 12:45:40 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from blr-ubuntu-253.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: saiprakash.ranjan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3C7A6C433FE;
        Thu, 15 Oct 2020 12:45:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3C7A6C433FE
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=saiprakash.ranjan@codeaurora.org
From:   Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>
Cc:     coresight@lists.linaro.org, Stephen Boyd <swboyd@chromium.org>,
        Denis Nikitin <denik@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
Subject: [PATCH] coresight: etm4x: Add config to exclude kernel mode tracing
Date:   Thu, 15 Oct 2020 18:15:22 +0530
Message-Id: <20201015124522.1876-1-saiprakash.ranjan@codeaurora.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On production systems with ETMs enabled, it is preferred to
exclude kernel mode(NS EL1) tracing for security concerns and
support only userspace(NS EL0) tracing. So provide an option
via kconfig to exclude kernel mode tracing if it is required.
This config is disabled by default and would not affect the
current configuration which has both kernel and userspace
tracing enabled by default.

Signed-off-by: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>
---
 drivers/hwtracing/coresight/Kconfig                | 9 +++++++++
 drivers/hwtracing/coresight/coresight-etm4x-core.c | 6 +++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index c1198245461d..52435de8824c 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -110,6 +110,15 @@ config CORESIGHT_SOURCE_ETM4X
 	  To compile this driver as a module, choose M here: the
 	  module will be called coresight-etm4x.
 
+config CORESIGHT_ETM4X_EXCL_KERN
+	bool "Coresight ETM 4.x exclude kernel mode tracing"
+	depends on CORESIGHT_SOURCE_ETM4X
+	help
+	  This will exclude kernel mode(NS EL1) tracing if enabled. This option
+	  will be useful to provide more flexible options on production systems
+	  where only userspace(NS EL0) tracing might be preferred for security
+	  reasons.
+
 config CORESIGHT_STM
 	tristate "CoreSight System Trace Macrocell driver"
 	depends on (ARM && !(CPU_32v3 || CPU_32v4 || CPU_32v4T)) || ARM64
diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drivers/hwtracing/coresight/coresight-etm4x-core.c
index abd706b216ac..7e5669e5cd1f 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
+++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
@@ -832,6 +832,9 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
 {
 	u64 access_type = 0;
 
+	if (IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
+		config->mode |= ETM_MODE_EXCL_KERN;
+
 	/*
 	 * EXLEVEL_NS, bits[15:12]
 	 * The Exception levels are:
@@ -849,7 +852,8 @@ static u64 etm4_get_ns_access_type(struct etmv4_config *config)
 		access_type = ETM_EXLEVEL_NS_HYP;
 	}
 
-	if (config->mode & ETM_MODE_EXCL_USER)
+	if (config->mode & ETM_MODE_EXCL_USER &&
+	    !IS_ENABLED(CONFIG_CORESIGHT_ETM4X_EXCL_KERN))
 		access_type |= ETM_EXLEVEL_NS_APP;
 
 	return access_type;

base-commit: 3477326277451000bc667dfcc4fd0774c039184c
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation

